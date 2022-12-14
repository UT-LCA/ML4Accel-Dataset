
module ldpc_muxreg #(
  parameter LLRWIDTH = 4,
  parameter NUMINPS  = 4,
  parameter MUXSIZE  = 4,
  parameter SELBITS  = 2
)(
  input clk,
  input rst,

  input[SELBITS-1:0]          sel,
  input[NUMINPS*LLRWIDTH-1:0] din,
  output[LLRWIDTH-1:0]        dout
);

// convert to 2-d array
wire[LLRWIDTH-1:0] din_2d[MUXSIZE-1:0];

generate
  genvar muxpos;

  for( muxpos=0; muxpos<MUXSIZE; muxpos=muxpos+1 )
  begin: muxto2d
    assign din_2d[muxpos] = din[muxpos*LLRWIDTH+LLRWIDTH-1 -: LLRWIDTH];
  end
endgenerate

// mux and register
reg[LLRWIDTH-1:0] mux_result;

assign dout = mux_result;

always @( posedge clk, posedge rst )
  if( rst )
    mux_result <= 0;
  else
    mux_result <= din_2d[sel];
endmodule
