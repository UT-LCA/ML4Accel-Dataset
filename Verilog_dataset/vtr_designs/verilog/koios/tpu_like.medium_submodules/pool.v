`define DWIDTH 8
`define DESIGN_SIZE 32
`define LOG2_DESIGN_SIZE 5
`define MAT_MUL_SIZE 32
`define MASK_WIDTH 32
`define LOG2_MAT_MUL_SIZE 5
`define AWIDTH 10
`define NUM_CYCLES_IN_MAC 3
`define MEM_ACCESS_LATENCY 1
`define REG_DATAWIDTH 32
`define REG_ADDRWIDTH 8
`define ADDR_STRIDE_WIDTH 16
`define MAX_BITS_POOL 3
`define REG_ENABLES_ADDR 32'h0
`define REG_STDN_TPU_ADDR 32'h4
`define REG_MEAN_ADDR 32'h8
`define REG_INV_VAR_ADDR 32'hA
`define REG_MATRIX_A_ADDR 32'he
`define REG_MATRIX_B_ADDR 32'h12
`define REG_MATRIX_C_ADDR 32'h16
`define REG_ACCUM_ACTIONS_ADDR 32'h24
`define REG_MATRIX_A_STRIDE_ADDR 32'h28
`define REG_MATRIX_B_STRIDE_ADDR 32'h32
`define REG_MATRIX_C_STRIDE_ADDR 32'h36
`define REG_ACTIVATION_CSR_ADDR 32'h3A
`define REG_POOL_WINDOW_ADDR 32'h3E
`define REG_CONV_PARAMS_1_ADDR 32'h40
`define REG_CONV_PARAMS_2_ADDR 32'h44
`define REG_CONV_PARAMS_3_ADDR 32'h48
`define REG_CONV_PARAMS_4_ADDR 32'h4C
`define REG_BATCH_SIZE_ADDR 32'h50
`define REG_VALID_MASK_A_ROWS_ADDR 32'h20
`define REG_VALID_MASK_A_COLS_ADDR 32'h54
`define REG_VALID_MASK_B_ROWS_ADDR 32'h5c
`define REG_VALID_MASK_B_COLS_ADDR 32'h58
//This used to be a normal signal, but changing it to a `define.
`define final_mat_mul_size 32
`define SIMULATION
`define IDLE     2'b00
`define W_ENABLE  2'b01
`define R_ENABLE  2'b10
`define STATE_INIT         4'b0000
`define STATE_MATMUL       4'b0001
`define STATE_NORM         4'b0010
`define STATE_POOL         4'b0011
`define STATE_ACTIVATION   4'b0100
`define STATE_DONE         4'b0101

module pool(
    input enable_pool,
    input in_data_available,
	  input [`MAX_BITS_POOL-1:0] pool_window_size,
    input [`DESIGN_SIZE*`DWIDTH-1:0] inp_data,
    output [`DESIGN_SIZE*`DWIDTH-1:0] out_data,
    output out_data_available,
    input [`MASK_WIDTH-1:0] validity_mask,
    output done_pool,
    input clk,
    input reset
);

reg in_data_available_flopped;
reg [`DESIGN_SIZE*`DWIDTH-1:0] inp_data_flopped;

reg [`DESIGN_SIZE*`DWIDTH-1:0] out_data_temp;
reg done_pool_temp;
reg out_data_available_temp;
reg [31:0] i,j;
reg [31:0] cycle_count;

always @(posedge clk) begin
	if (reset || ~enable_pool || ~in_data_available) begin
		out_data_temp <= 0;
		done_pool_temp <= 0;
		out_data_available_temp <= 0;
		cycle_count <= 0;
    in_data_available_flopped <= in_data_available;
    inp_data_flopped <= inp_data;
	end

	else if (in_data_available) begin
    cycle_count = cycle_count + 1;
		out_data_available_temp <= 1;

		case (pool_window_size)
			1: begin
				out_data_temp <= inp_data;
			end
			2: begin
				for (i = 0; i < `DESIGN_SIZE/2; i = i + 8) begin
					out_data_temp[ i +: 8] <= (inp_data[i*2 +: 8]  + inp_data[i*2 + 8 +: 8]) >> 1; 
				end
			end
			4: begin	
				for (i = 0; i < `DESIGN_SIZE/4; i = i + 8) begin
					//TODO: If 3 adders are the critical path, break into 2 cycles
					out_data_temp[ i +: 8] <= (inp_data[i*4 +: 8]  + inp_data[i*4 + 8 +: 8] + inp_data[i*4 + 16 +: 8]  + inp_data[i*4 + 24 +: 8]) >> 2; 
				end
			end
		endcase			

        if(cycle_count==`DESIGN_SIZE) begin	 
            done_pool_temp <= 1'b1;	      
        end	  
	end
end

assign out_data = enable_pool ? out_data_temp : inp_data_flopped; 
assign out_data_available = enable_pool ? out_data_available_temp : in_data_available_flopped;
assign done_pool = enable_pool ? done_pool_temp : 1'b1;

//Adding a dummy signal to use validity_mask input, to make ODIN happy
wire [`MASK_WIDTH-1:0] dummy;
assign dummy = validity_mask;

endmodule
