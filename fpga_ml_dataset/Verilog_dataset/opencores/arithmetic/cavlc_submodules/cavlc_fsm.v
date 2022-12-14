`define cavlc_idle_bit     				0
`define cavlc_read_total_coeffs_bit	1
`define cavlc_read_t1s_flags_bit	2
`define cavlc_read_level_prefix_bit     3
`define cavlc_read_level_suffix_bit     4
`define cavlc_calc_level_bit		5
`define cavlc_read_total_zeros_bit  	6
`define cavlc_read_run_befores_bit  	7
`define cavlc_idle_s     		8'b00000001
`define cavlc_read_total_coeffs_s     	8'b00000010
`define cavlc_read_t1s_flags_s		8'b00000100
`define cavlc_read_level_prefix_s     	8'b00001000
`define cavlc_read_level_suffix_s     	8'b00010000
`define cavlc_calc_level_s		8'b00100000
`define cavlc_read_total_zeros_s    	8'b01000000
`define cavlc_read_run_befores_s    	8'b10000000

module cavlc_fsm
(
    clk,
    rst_n,
    ena,
    start,
    max_coeff_num,
    TotalCoeff,
    TotalCoeff_comb,
    TrailingOnes,
    TrailingOnes_comb,
    ZeroLeft,
    state,
    i,
    idle,
    valid
);
//------------------------
//ports
//------------------------
input  clk;
input  rst_n;
input  ena;
input  start;

input  [4:0]  max_coeff_num;
input  [4:0]  TotalCoeff;
input  [4:0]  TotalCoeff_comb;
input  [1:0]  TrailingOnes;
input  [1:0]  TrailingOnes_comb;
input  [3:0]  ZeroLeft;

output [7:0]  state;
output [3:0]  i;
output idle;
output valid;

//------------------------
//FFs
//------------------------
reg  [7:0]  state;
reg  [3:0]  i;
reg  valid;

//------------------------
//state & i & valid
//------------------------
always @(posedge clk or negedge rst_n)
if (!rst_n) begin
    state   <= `cavlc_idle_s;
    i <= 0;
    valid <= 0;
end
else if (ena)
case(state)
    `cavlc_idle_s : begin
        if (start) begin
            state <= `cavlc_read_total_coeffs_s;
            valid <= 0;
        end
        else begin
            state <= `cavlc_idle_s;
        end     
    end
    `cavlc_read_total_coeffs_s : begin
        i <= TotalCoeff_comb -1;
        if (TrailingOnes_comb > 0 && TotalCoeff_comb > 0)
            state <= `cavlc_read_t1s_flags_s;
        else if (TotalCoeff_comb > 0)
            state <= `cavlc_read_level_prefix_s;
        else begin
            state <= `cavlc_idle_s;     
            valid <= 1;
        end
    end
    `cavlc_read_t1s_flags_s : begin
        if (TrailingOnes == TotalCoeff)
            state <= `cavlc_read_total_zeros_s;         
        else begin
            state <= `cavlc_read_level_prefix_s;
            i <= i - TrailingOnes;
        end
    end
    `cavlc_read_level_prefix_s : begin
        state <= `cavlc_read_level_suffix_s;        
    end
    `cavlc_read_level_suffix_s : begin
        state <= `cavlc_calc_level_s;       
    end
    `cavlc_calc_level_s : begin
        if ( i == 0  && TotalCoeff < max_coeff_num)
            state <= `cavlc_read_total_zeros_s;
        else if (i == 0) begin
            state <= `cavlc_read_run_befores_s;
            i <= TotalCoeff - 1;
        end
        else begin
            state <= `cavlc_read_level_prefix_s;
            i <= i - 1;
        end
    end 
    `cavlc_read_total_zeros_s : begin
        state <= `cavlc_read_run_befores_s;
        i <= TotalCoeff - 1;
    end
    `cavlc_read_run_befores_s : begin
        if (i == 0 || ZeroLeft == 0) begin
            state <= `cavlc_idle_s;
            valid <= 1;
        end
        else begin
            state <= `cavlc_read_run_befores_s;
            i <= i - 1;
        end
    end     
endcase

assign idle = state[`cavlc_idle_bit];

endmodule
