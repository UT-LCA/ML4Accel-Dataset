`define SIMULATION_MEMORY

module dot_product_16_8_30_4 (
	input clk,
	input i_reset,
	input [15:0] i_features_0,
	input [7:0] i_weights_0,
	input [15:0] i_features_1,
	input [7:0] i_weights_1,
	input [15:0] i_features_2,
	input [7:0] i_weights_2,
	input [15:0] i_features_3,
	input [7:0] i_weights_3,
	output [23:0] o_result
);

wire [63:0] chains_0;
wire [63:0] chains_1;
wire [23:0] res;
reg [15:0] f_pipeline_0_0;
reg [7:0] w_pipeline_0_0;
reg [15:0] f_pipeline_0_1;
reg [7:0] w_pipeline_0_1;
reg [15:0] f_pipeline_1_0;
reg [7:0] w_pipeline_1_0;
reg [15:0] f_pipeline_1_1;
reg [7:0] w_pipeline_1_1;
reg [15:0] f_pipeline_2_0;
reg [7:0] w_pipeline_2_0;
reg [15:0] f_pipeline_2_1;
reg [7:0] w_pipeline_2_1;
reg [15:0] f_pipeline_3_0;
reg [7:0] w_pipeline_3_0;
reg [15:0] f_pipeline_3_1;
reg [7:0] w_pipeline_3_1;
reg r_pipeline_0;
reg r_pipeline_1;

always @ (posedge clk) begin
	r_pipeline_0 <= i_reset;
	if(i_reset == 1'b1) begin
		f_pipeline_0_0 <= 0;
		w_pipeline_0_0 <= 0;
		f_pipeline_1_0 <= 0;
		w_pipeline_1_0 <= 0;
		f_pipeline_2_0 <= 0;
		w_pipeline_2_0 <= 0;
		f_pipeline_3_0 <= 0;
		w_pipeline_3_0 <= 0;
		f_pipeline_0_1 <= 0;
		w_pipeline_0_1 <= 0;
		f_pipeline_1_1 <= 0;
		w_pipeline_1_1 <= 0;
		f_pipeline_2_1 <= 0;
		w_pipeline_2_1 <= 0;
		f_pipeline_3_1 <= 0;
		w_pipeline_3_1 <= 0;
		r_pipeline_1 <= 1'b1;
	end else begin
		f_pipeline_0_0 <= i_features_0;
		w_pipeline_0_0 <= i_weights_0;
		f_pipeline_1_0 <= i_features_1;
		w_pipeline_1_0 <= i_weights_1;
		f_pipeline_2_0 <= i_features_2;
		w_pipeline_2_0 <= i_weights_2;
		f_pipeline_3_0 <= i_features_3;
		w_pipeline_3_0 <= i_weights_3;
		r_pipeline_1 <= r_pipeline_0;
		f_pipeline_0_1 <= f_pipeline_0_0;
		w_pipeline_0_1 <= w_pipeline_0_0;
		f_pipeline_1_1 <= f_pipeline_1_0;
		w_pipeline_1_1 <= w_pipeline_1_0;
		f_pipeline_2_1 <= f_pipeline_2_0;
		w_pipeline_2_1 <= w_pipeline_2_0;
		f_pipeline_3_1 <= f_pipeline_3_0;
		w_pipeline_3_1 <= w_pipeline_3_0;
	end
end

wire [23:0] dummy_res_0;
dsp_block_16_8_false dsp_block_16_8_false_inst_0 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ax(f_pipeline_0_0),
	.ay(w_pipeline_0_0),
	.bx(f_pipeline_1_0),
	.by(w_pipeline_1_0),
	.chainin(64'd0),
	.chainout(chains_0),
	.resulta(dummy_res_0)
);

dsp_block_16_8_true dsp_block_16_8_true_inst_2 (
	.clk(clk),
	.ena(1'b1),
	.aclr(r_pipeline_1),
	.ax(f_pipeline_2_1),
	.ay(w_pipeline_2_1),
	.bx(f_pipeline_3_1),
	.by(w_pipeline_3_1),
	.chainin(chains_0),
	.chainout(chains_1),
	.resulta(res)
);

assign o_result = res;

endmodule
module dsp_block_16_8_true (
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
