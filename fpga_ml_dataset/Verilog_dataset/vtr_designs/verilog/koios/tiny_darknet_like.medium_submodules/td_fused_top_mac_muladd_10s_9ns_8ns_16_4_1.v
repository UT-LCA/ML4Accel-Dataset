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

module td_fused_top_mac_muladd_10s_9ns_8ns_16_4_1(
    clk,
    reset,
    ce,
    din0,
    din1,
    din2,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter din2_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
input[din2_WIDTH - 1:0] din2;
output[dout_WIDTH - 1:0] dout;



td_fused_top_mac_muladd_10s_9ns_8ns_16_4_1_DSP48_0 td_fused_top_mac_muladd_10s_9ns_8ns_16_4_1_DSP48_0_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .in0( din0 ),
    .in1( din1 ),
    .in2( din2 ),
    .dout( dout )
);

endmodule
  module td_fused_top_mac_muladd_10s_9ns_8ns_16_4_1_DSP48_0(
    input clk,
    input rst,
    input ce,
    input  [10 - 1:0] in0,
    input  [9 - 1:0] in1,
    input  [8 - 1:0] in2,
    output [16 - 1:0]  dout);

wire  [27 - 1:0]     a;
wire  [18 - 1:0]     b;
wire  [48 - 1:0]     c;
wire  [45 - 1:0]     m;
wire  [48 - 1:0]     p;
reg   [45 - 1:0]     m_reg;
reg   [27 - 1:0]     a_reg;
reg   [18 - 1:0]     b_reg;
reg   [48 - 1:0]     p_reg;

assign a  = (in0);
assign b  = (in1);
assign c  = (in2);

assign m  = a_reg * b_reg;
assign p  = m_reg + c;

always @(posedge clk) begin
    if (ce) begin
        m_reg  <= m;
        a_reg  <= a;
        b_reg  <= b;
        p_reg  <= p;
    end
end

assign dout = p_reg;

endmodule
