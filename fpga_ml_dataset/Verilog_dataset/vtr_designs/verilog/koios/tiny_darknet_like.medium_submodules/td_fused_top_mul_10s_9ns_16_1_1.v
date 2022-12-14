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

module td_fused_top_mul_10s_9ns_16_1_1(
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0 td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout )
);

endmodule
module td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0(a, b, p);
input[10 - 1 : 0] a; 
input[9 - 1 : 0] b; 
output[16 - 1 : 0] p;

assign p = (a) * ({1'b0, b});
endmodule
