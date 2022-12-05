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

module cavlc_len_gen
(
    cavlc_state,
    len_read_total_coeffs_comb,
    len_read_levels_comb,
    len_read_total_zeros_comb,
    len_read_run_befores_comb,
    len_comb
);
//------------------------
// ports
//------------------------
input  [7:0] cavlc_state;
input  [4:0] len_read_total_coeffs_comb;
input  [4:0] len_read_levels_comb;
input  [3:0] len_read_total_zeros_comb;
input  [3:0] len_read_run_befores_comb;

output [4:0] len_comb;

//------------------------
// regs
//------------------------
reg [4:0] len_comb;         //number of bits comsumed by cavlc in a cycle

//------------------------
// len_comb
//------------------------
always @ (*)
case (1'b1) //synthesis parallel_case
    cavlc_state[`cavlc_read_total_coeffs_bit]  : len_comb <= len_read_total_coeffs_comb;
    cavlc_state[`cavlc_read_t1s_flags_bit],  
    cavlc_state[`cavlc_read_level_prefix_bit],
    cavlc_state[`cavlc_read_level_suffix_bit]  : len_comb <= len_read_levels_comb;       
    cavlc_state[`cavlc_read_total_zeros_bit]   : len_comb <= len_read_total_zeros_comb;
    cavlc_state[`cavlc_read_run_befores_bit]   : len_comb <= len_read_run_befores_comb;
    cavlc_state[`cavlc_calc_level_bit],
    cavlc_state[`cavlc_idle_bit]               : len_comb <= 0;
    default                                    : len_comb <= 'bx;
endcase

endmodule
