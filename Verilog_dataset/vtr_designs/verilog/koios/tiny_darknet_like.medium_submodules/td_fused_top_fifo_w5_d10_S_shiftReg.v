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

module td_fused_top_fifo_w5_d10_S_shiftReg (
    clk,
    data,
    ce,
    a,
    q);

parameter DATA_WIDTH = 32'd5;
parameter ADDR_WIDTH = 32'd4;
parameter DEPTH = 5'd10;

input clk;
input [DATA_WIDTH-1:0] data;
input ce;
input [ADDR_WIDTH-1:0] a;
output [DATA_WIDTH-1:0] q;

reg[DATA_WIDTH-1:0] sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9;
integer i;

always @ (posedge clk)
    begin
        if (ce)
        begin
            sr_0 <= data;
            sr_1 <= sr_0;
            sr_2 <= sr_1;
            sr_3 <= sr_2;
            sr_4 <= sr_3;
            sr_5 <= sr_4;
            sr_6 <= sr_5;
            sr_7 <= sr_6;
            sr_8 <= sr_7;
            sr_9 <= sr_8;


        end
    end

always @( sr_0, sr_1, sr_2, sr_3, sr_4, sr_5, sr_6, sr_7, sr_8, sr_9, a) begin
   case (a)
      4'd0: q = sr_0;
      4'd1: q = sr_1;
      4'd2: q = sr_2;
      4'd3: q = sr_3;
      4'd4: q = sr_4;
      4'd5: q = sr_5;
      4'd6: q = sr_6;
      4'd7: q = sr_7;
      4'd8: q = sr_8;
      4'd9: q = sr_9;
      default: q = sr_9;
   endcase
end

endmodule
