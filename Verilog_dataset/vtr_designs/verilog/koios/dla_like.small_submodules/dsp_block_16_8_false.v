`define SIMULATION_MEMORY

module dsp_block_16_8_false (
	input clk,
	input ena,
	input aclr,
	input [15:0] ax,
	input [7:0] ay,
	input [15:0] bx,
	input [7:0] by,
	input [63:0] chainin,
	output [63:0] chainout,
	output [23:0] resulta
);

wire [10:0] mode;
assign mode = 11'b1010_1010_011;

`ifdef complex_dsp
int_sop_2 mac_component (
	.mode_sigs(mode),
	.clk(clk),
	.reset(aclr),
	.ax(ax),
	.ay(ay),
	.bx(bx),
	.by(by),
	.chainin(chainin),
	.resulta(resulta),
	.chainout(chainout)
);

`else
reg [15:0] ax_reg;
reg [7:0] ay_reg;
reg [15:0] bx_reg;
reg [7:0] by_reg;
reg [23:0] resulta;
always @(posedge clk) begin
  if(aclr) begin
    resulta <= 0;
    ax_reg <= 0;
    ay_reg <= 0;
    bx_reg <= 0;
    by_reg <= 0;
  end
  else begin
    ax_reg <= ax;
    ay_reg <= ay;
    bx_reg <= bx;
    by_reg <= by;
    resulta <= ax_reg * ay_reg + bx_reg * by_reg + chainin;
  end
end
assign chainout = {40'b0, resulta};
`endif

endmodule
