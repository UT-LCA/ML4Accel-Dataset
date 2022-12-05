`define EXPONENT 5
`define MANTISSA 10
`define ACTUAL_MANTISSA 11
`define EXPONENT_LSB 10
`define EXPONENT_MSB 14
`define MANTISSA_LSB 0
`define MANTISSA_MSB 9
`define MANTISSA_MUL_SPLIT_LSB 3
`define MANTISSA_MUL_SPLIT_MSB 9
`define SIGN 1
`define SIGN_LOC 15
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1

module td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0(a, b, p);
input[10 - 1 : 0] a; 
input[9 - 1 : 0] b; 
output[16 - 1 : 0] p;

assign p = (a) * ({1'b0, b});
endmodule
