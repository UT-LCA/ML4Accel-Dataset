`define SIMULATION_MEMORY

module processing_element (
	input clk,
	input i_reset,
	input i_valid,
	input [15:0] i_features_0_0,
	output [15:0] o_features_0_0,
	input [15:0] i_features_0_1,
	output [15:0] o_features_0_1,
	input [15:0] i_features_0_2,
	output [15:0] o_features_0_2,
	input [15:0] i_features_0_3,
	output [15:0] o_features_0_3,
	input [15:0] i_features_0_4,
	output [15:0] o_features_0_4,
	input [15:0] i_features_0_5,
	output [15:0] o_features_0_5,
	input [15:0] i_features_1_0,
	output [15:0] o_features_1_0,
	input [15:0] i_features_1_1,
	output [15:0] o_features_1_1,
	input [15:0] i_features_1_2,
	output [15:0] o_features_1_2,
	input [15:0] i_features_1_3,
	output [15:0] o_features_1_3,
	input [15:0] i_features_1_4,
	output [15:0] o_features_1_4,
	input [15:0] i_features_1_5,
	output [15:0] o_features_1_5,
	input [15:0] i_features_2_0,
	output [15:0] o_features_2_0,
	input [15:0] i_features_2_1,
	output [15:0] o_features_2_1,
	input [15:0] i_features_2_2,
	output [15:0] o_features_2_2,
	input [15:0] i_features_2_3,
	output [15:0] o_features_2_3,
	input [15:0] i_features_2_4,
	output [15:0] o_features_2_4,
	input [15:0] i_features_2_5,
	output [15:0] o_features_2_5,
	input [15:0] i_features_3_0,
	output [15:0] o_features_3_0,
	input [15:0] i_features_3_1,
	output [15:0] o_features_3_1,
	input [15:0] i_features_3_2,
	output [15:0] o_features_3_2,
	input [15:0] i_features_3_3,
	output [15:0] o_features_3_3,
	input [15:0] i_features_3_4,
	output [15:0] o_features_3_4,
	input [15:0] i_features_3_5,
	output [15:0] o_features_3_5,
	output [29:0] o_result_0,
	output [29:0] o_result_1,
	output [29:0] o_result_2,
	output [29:0] o_result_3,
	output [29:0] o_result_4,
	output [29:0] o_result_5,
	output o_valid,
	output o_next_reset,
	output o_next_valid
);

wire [23:0] DP_res_0;
reg [15:0] if_reg_0_0;
wire [7:0] weights_0_0;
reg [15:0] if_reg_0_1;
wire [7:0] weights_0_1;
reg [15:0] if_reg_0_2;
wire [7:0] weights_0_2;
reg [15:0] if_reg_0_3;
wire [7:0] weights_0_3;
wire [23:0] DP_res_1;
reg [15:0] if_reg_1_0;
wire [7:0] weights_1_0;
reg [15:0] if_reg_1_1;
wire [7:0] weights_1_1;
reg [15:0] if_reg_1_2;
wire [7:0] weights_1_2;
reg [15:0] if_reg_1_3;
wire [7:0] weights_1_3;
wire [23:0] DP_res_2;
reg [15:0] if_reg_2_0;
wire [7:0] weights_2_0;
reg [15:0] if_reg_2_1;
wire [7:0] weights_2_1;
reg [15:0] if_reg_2_2;
wire [7:0] weights_2_2;
reg [15:0] if_reg_2_3;
wire [7:0] weights_2_3;
wire [23:0] DP_res_3;
reg [15:0] if_reg_3_0;
wire [7:0] weights_3_0;
reg [15:0] if_reg_3_1;
wire [7:0] weights_3_1;
reg [15:0] if_reg_3_2;
wire [7:0] weights_3_2;
reg [15:0] if_reg_3_3;
wire [7:0] weights_3_3;
wire [23:0] DP_res_4;
reg [15:0] if_reg_4_0;
wire [7:0] weights_4_0;
reg [15:0] if_reg_4_1;
wire [7:0] weights_4_1;
reg [15:0] if_reg_4_2;
wire [7:0] weights_4_2;
reg [15:0] if_reg_4_3;
wire [7:0] weights_4_3;
wire [23:0] DP_res_5;
reg [15:0] if_reg_5_0;
wire [7:0] weights_5_0;
reg [15:0] if_reg_5_1;
wire [7:0] weights_5_1;
reg [15:0] if_reg_5_2;
wire [7:0] weights_5_2;
reg [15:0] if_reg_5_3;
wire [7:0] weights_5_3;

reg [10:0] base_addr;
reg [10:0] offset;
reg [1:0] L_counter;
reg [1:0] C_counter;
reg [15:0] T_counter;

reg reset_1, reset_2, reset_3, next_reset, next_reset_2;
reg done, done_1, done_2, done_3, done_4, done_5, done_6;

wire [15:0] features_0_0;
wire [15:0] features_0_1;
wire [15:0] features_0_2;
wire [15:0] features_0_3;
wire [15:0] features_1_0;
wire [15:0] features_1_1;
wire [15:0] features_1_2;
wire [15:0] features_1_3;
wire [15:0] features_2_0;
wire [15:0] features_2_1;
wire [15:0] features_2_2;
wire [15:0] features_2_3;
wire [15:0] features_3_0;
wire [15:0] features_3_1;
wire [15:0] features_3_2;
wire [15:0] features_3_3;
wire [15:0] features_4_0;
wire [15:0] features_4_1;
wire [15:0] features_4_2;
wire [15:0] features_4_3;
wire [15:0] features_5_0;
wire [15:0] features_5_1;
wire [15:0] features_5_2;
wire [15:0] features_5_3;
reg valid_0;
reg valid_1;
reg valid_2;
reg valid_3;
reg valid_4;
reg valid_5;
reg valid_6;
reg valid_7;
reg valid_8;
reg valid_9;
reg valid_10;
reg valid_11;
reg next_valid;

always @ (posedge clk) begin
	reset_1 <= ~(i_valid || valid_11);
	reset_2 <= reset_1;
	reset_3 <= reset_2;
	next_reset <= i_reset;
	next_reset_2 <= next_reset;
	if (i_reset == 1'b0) begin
		if_reg_0_0 <= features_0_0;
		if_reg_0_1 <= features_0_1;
		if_reg_0_2 <= features_0_2;
		if_reg_0_3 <= features_0_3;
		if_reg_1_0 <= features_1_0;
		if_reg_1_1 <= features_1_1;
		if_reg_1_2 <= features_1_2;
		if_reg_1_3 <= features_1_3;
		if_reg_2_0 <= features_2_0;
		if_reg_2_1 <= features_2_1;
		if_reg_2_2 <= features_2_2;
		if_reg_2_3 <= features_2_3;
		if_reg_3_0 <= features_3_0;
		if_reg_3_1 <= features_3_1;
		if_reg_3_2 <= features_3_2;
		if_reg_3_3 <= features_3_3;
		if_reg_4_0 <= features_4_0;
		if_reg_4_1 <= features_4_1;
		if_reg_4_2 <= features_4_2;
		if_reg_4_3 <= features_4_3;
		if_reg_5_0 <= features_5_0;
		if_reg_5_1 <= features_5_1;
		if_reg_5_2 <= features_5_2;
		if_reg_5_3 <= features_5_3;
	end
end

always @ (posedge clk) begin
	next_valid <= i_valid;
	if (i_reset) begin
		valid_0 <= 0;
		valid_1 <= 0;
		valid_2 <= 0;
		valid_3 <= 0;
		valid_4 <= 0;
		valid_5 <= 0;
		valid_6 <= 0;
		valid_7 <= 0;
		valid_8 <= 0;
		valid_9 <= 0;
		valid_10 <= 0;
		valid_11 <= 0;
	end else if ((i_valid == 1'b0) && (valid_11 == 1'b0)) begin
		base_addr <= 0;
		offset <= 0;
		C_counter <= 0;
		L_counter <= 0;
		T_counter <= 0;
		done <= 0;
		done_1 <= 0;
		done_2 <= 0;
		done_3 <= 0;
		done_4 <= 0;
		done_5 <= 0;
		done_6 <= 0;
	end else if (i_valid || valid_11) begin
		valid_0 <= i_valid;
		valid_1 <= valid_0;
		valid_2 <= valid_1;
		valid_3 <= valid_2;
		valid_4 <= valid_3;
		valid_5 <= valid_4;
		valid_6 <= valid_5;
		valid_7 <= valid_6;
		valid_8 <= valid_7;
		valid_9 <= valid_8;
		valid_10 <= valid_9;
		valid_11 <= valid_10;
		if (T_counter <= 1809025) begin
			done_1 <= done;
			done_2 <= done_1;
			done_3 <= done_2;
			done_4 <= done_3;
			done_5 <= done_4;
			done_6 <= done_5;
			if((C_counter == 0) && (L_counter == 3)) begin
				base_addr <= 0;
				C_counter <= 0;
				L_counter <= 0;
				offset <= 0;
				done <= 1;
				T_counter <= T_counter + 1'b1;
			end else if(L_counter == 3) begin
				base_addr <= base_addr + 1'b1;
				C_counter <= C_counter + 1'b1;
				L_counter <= 0;
				offset <= 0;
				done <= 0;
			end else begin
				offset <= offset + 1;
				L_counter <= L_counter + 1'b1;
			end
		end
	end
end

dot_product_16_8_30_4 dot_product_16_8_30_4_inst_0 (
	.clk(clk),
	.i_reset(reset_3),
	.i_features_0(features_0_0),
	.i_weights_0(weights_0_0),
	.i_features_1(features_0_1),
	.i_weights_1(weights_0_1),
	.i_features_2(features_0_2),
	.i_weights_2(weights_0_2),
	.i_features_3(features_0_3),
	.i_weights_3(weights_0_3),
	.o_result(DP_res_0)
);

dot_product_16_8_30_4 dot_product_16_8_30_4_inst_1 (
	.clk(clk),
	.i_reset(reset_3),
	.i_features_0(features_1_0),
	.i_weights_0(weights_1_0),
	.i_features_1(features_1_1),
	.i_weights_1(weights_1_1),
	.i_features_2(features_1_2),
	.i_weights_2(weights_1_2),
	.i_features_3(features_1_3),
	.i_weights_3(weights_1_3),
	.o_result(DP_res_1)
);

dot_product_16_8_30_4 dot_product_16_8_30_4_inst_2 (
	.clk(clk),
	.i_reset(reset_3),
	.i_features_0(features_2_0),
	.i_weights_0(weights_2_0),
	.i_features_1(features_2_1),
	.i_weights_1(weights_2_1),
	.i_features_2(features_2_2),
	.i_weights_2(weights_2_2),
	.i_features_3(features_2_3),
	.i_weights_3(weights_2_3),
	.o_result(DP_res_2)
);

dot_product_16_8_30_4 dot_product_16_8_30_4_inst_3 (
	.clk(clk),
	.i_reset(reset_3),
	.i_features_0(features_3_0),
	.i_weights_0(weights_3_0),
	.i_features_1(features_3_1),
	.i_weights_1(weights_3_1),
	.i_features_2(features_3_2),
	.i_weights_2(weights_3_2),
	.i_features_3(features_3_3),
	.i_weights_3(weights_3_3),
	.o_result(DP_res_3)
);

dot_product_16_8_30_4 dot_product_16_8_30_4_inst_4 (
	.clk(clk),
	.i_reset(reset_3),
	.i_features_0(features_4_0),
	.i_weights_0(weights_4_0),
	.i_features_1(features_4_1),
	.i_weights_1(weights_4_1),
	.i_features_2(features_4_2),
	.i_weights_2(weights_4_2),
	.i_features_3(features_4_3),
	.i_weights_3(weights_4_3),
	.o_result(DP_res_4)
);

dot_product_16_8_30_4 dot_product_16_8_30_4_inst_5 (
	.clk(clk),
	.i_reset(reset_3),
	.i_features_0(features_5_0),
	.i_weights_0(weights_5_0),
	.i_features_1(features_5_1),
	.i_weights_1(weights_5_1),
	.i_features_2(features_5_2),
	.i_weights_2(weights_5_2),
	.i_features_3(features_5_3),
	.i_weights_3(weights_5_3),
	.o_result(DP_res_5)
);

accumulator_24_30_4 accumulator_24_30_4_inst_0 (
	.clk(clk),
	.i_reset(reset_3),
	.i_result(DP_res_0),
	.i_dp_done(done_5),
	.o_accum(o_result_0)
);

accumulator_24_30_4 accumulator_24_30_4_inst_1 (
	.clk(clk),
	.i_reset(reset_3),
	.i_result(DP_res_1),
	.i_dp_done(done_5),
	.o_accum(o_result_1)
);

accumulator_24_30_4 accumulator_24_30_4_inst_2 (
	.clk(clk),
	.i_reset(reset_3),
	.i_result(DP_res_2),
	.i_dp_done(done_5),
	.o_accum(o_result_2)
);

accumulator_24_30_4 accumulator_24_30_4_inst_3 (
	.clk(clk),
	.i_reset(reset_3),
	.i_result(DP_res_3),
	.i_dp_done(done_5),
	.o_accum(o_result_3)
);

accumulator_24_30_4 accumulator_24_30_4_inst_4 (
	.clk(clk),
	.i_reset(reset_3),
	.i_result(DP_res_4),
	.i_dp_done(done_5),
	.o_accum(o_result_4)
);

accumulator_24_30_4 accumulator_24_30_4_inst_5 (
	.clk(clk),
	.i_reset(reset_3),
	.i_result(DP_res_5),
	.i_dp_done(done_5),
	.o_accum(o_result_5)
);

reg [10:0] weight_cache_addr;
always @ (*) begin
	weight_cache_addr <= base_addr+offset;
end
weight_cache_2048_8_0_weight_init_00 weight_cache_2048_8_0_weight_init_00_inst_0_0 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_0_0),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_0_1)
);

weight_cache_2048_8_0_weight_init_20 weight_cache_2048_8_0_weight_init_20_inst_0_2 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_0_2),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_0_3)
);

weight_cache_2048_8_0_weight_init_01 weight_cache_2048_8_0_weight_init_01_inst_1_0 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_1_0),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_1_1)
);

weight_cache_2048_8_0_weight_init_21 weight_cache_2048_8_0_weight_init_21_inst_1_2 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_1_2),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_1_3)
);

weight_cache_2048_8_0_weight_init_02 weight_cache_2048_8_0_weight_init_02_inst_2_0 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_2_0),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_2_1)
);

weight_cache_2048_8_0_weight_init_22 weight_cache_2048_8_0_weight_init_22_inst_2_2 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_2_2),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_2_3)
);

weight_cache_2048_8_0_weight_init_03 weight_cache_2048_8_0_weight_init_03_inst_3_0 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_3_0),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_3_1)
);

weight_cache_2048_8_0_weight_init_23 weight_cache_2048_8_0_weight_init_23_inst_3_2 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_3_2),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_3_3)
);

weight_cache_2048_8_0_weight_init_04 weight_cache_2048_8_0_weight_init_04_inst_4_0 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_4_0),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_4_1)
);

weight_cache_2048_8_0_weight_init_24 weight_cache_2048_8_0_weight_init_24_inst_4_2 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_4_2),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_4_3)
);

weight_cache_2048_8_0_weight_init_05 weight_cache_2048_8_0_weight_init_05_inst_5_0 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_5_0),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_5_1)
);

weight_cache_2048_8_0_weight_init_25 weight_cache_2048_8_0_weight_init_25_inst_5_2 (
	.clk(clk),
	.wen0(1'b0),
	.wen1(1'b0),
	.addr0(weight_cache_addr),
	.wdata0(0),
	.data0(weights_5_2),
	.addr1(weight_cache_addr),
	.wdata1(0),
	.data1(weights_5_3)
);

assign o_features_0_0 = if_reg_0_0;
assign features_0_0 = i_features_0_0;
assign o_features_1_0 = if_reg_0_1;
assign features_0_1 = i_features_1_0;
assign o_features_2_0 = if_reg_0_2;
assign features_0_2 = i_features_2_0;
assign o_features_3_0 = if_reg_0_3;
assign features_0_3 = i_features_3_0;
assign o_features_0_1 = if_reg_1_0;
assign features_1_0 = i_features_0_1;
assign o_features_1_1 = if_reg_1_1;
assign features_1_1 = i_features_1_1;
assign o_features_2_1 = if_reg_1_2;
assign features_1_2 = i_features_2_1;
assign o_features_3_1 = if_reg_1_3;
assign features_1_3 = i_features_3_1;
assign o_features_0_2 = if_reg_2_0;
assign features_2_0 = i_features_0_2;
assign o_features_1_2 = if_reg_2_1;
assign features_2_1 = i_features_1_2;
assign o_features_2_2 = if_reg_2_2;
assign features_2_2 = i_features_2_2;
assign o_features_3_2 = if_reg_2_3;
assign features_2_3 = i_features_3_2;
assign o_features_0_3 = if_reg_3_0;
assign features_3_0 = i_features_0_3;
assign o_features_1_3 = if_reg_3_1;
assign features_3_1 = i_features_1_3;
assign o_features_2_3 = if_reg_3_2;
assign features_3_2 = i_features_2_3;
assign o_features_3_3 = if_reg_3_3;
assign features_3_3 = i_features_3_3;
assign o_features_0_4 = if_reg_4_0;
assign features_4_0 = i_features_0_4;
assign o_features_1_4 = if_reg_4_1;
assign features_4_1 = i_features_1_4;
assign o_features_2_4 = if_reg_4_2;
assign features_4_2 = i_features_2_4;
assign o_features_3_4 = if_reg_4_3;
assign features_4_3 = i_features_3_4;
assign o_features_0_5 = if_reg_5_0;
assign features_5_0 = i_features_0_5;
assign o_features_1_5 = if_reg_5_1;
assign features_5_1 = i_features_1_5;
assign o_features_2_5 = if_reg_5_2;
assign features_5_2 = i_features_2_5;
assign o_features_3_5 = if_reg_5_3;
assign features_5_3 = i_features_3_5;

assign o_valid = done_6;
assign o_next_reset = next_reset;
assign o_next_valid = next_valid;

endmodule
module weight_cache_2048_8_0_weight_init_25 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module dual_port_ram(
clk,
addr1,
addr2,
data1,
data2,
we1,
we2,
out1,
out2
);

parameter DATA_WIDTH = 16;
parameter ADDR_WIDTH = 14;
input clk;
input [ADDR_WIDTH-1:0] addr1;
input [ADDR_WIDTH-1:0] addr2;
input [DATA_WIDTH-1:0] data1;
input [DATA_WIDTH-1:0] data2;
input we1;
input we2;
output reg [DATA_WIDTH-1:0] out1;
output reg [DATA_WIDTH-1:0] out2;

reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

always @(posedge clk) begin
  if (we1) begin
    ram[addr1] <= data1;
  end
  else begin
    out1 <= ram[addr1];
  end
end

always @(posedge clk) begin
  if (we2) begin
    ram [addr2] <= data2;
  end
  else begin
    out2 <= ram[addr2];
  end
end

endmodule
module weight_cache_2048_8_0_weight_init_05 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_24 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_04 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_23 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_03 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_22 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_02 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_21 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif

dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_01 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_20 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module weight_cache_2048_8_0_weight_init_00 (
	input clk,
	input wen0,
	input wen1,
	input [10:0] addr0,
	input [7:0] wdata0,
	output [7:0] data0,
	input [10:0] addr1,
	input [7:0] wdata1,
	output [7:0] data1
);

reg [10:0] addr0_reg;
reg [7:0] data0_reg;
reg [10:0] addr1_reg;
reg [7:0] data1_reg;
reg [7:0] pipeline0_reg_0;
reg [7:0] pipeline1_reg_0;
always @(posedge clk) begin
	addr0_reg <= addr0;
	addr1_reg <= addr1;
	pipeline0_reg_0 <= data0_reg;
	pipeline1_reg_0 <= data1_reg;
end

`ifdef SIMULATION_MEMORY
defparam u_dual_port_ram.DATA_WIDTH = 8;
defparam u_dual_port_ram.ADDR_WIDTH = 11;
`endif
dual_port_ram u_dual_port_ram(
	.addr1(addr0_reg),
	.we1(wen0),
	.data1(wdata0),
	.out1(data0_reg),
	.addr2(addr1_reg),
	.we2(wen1),
	.data2(wdata1),
	.out2(data1_reg),
	.clk(clk)
);

assign data0 = pipeline0_reg_0;
assign data1 = pipeline1_reg_0;

endmodule
module accumulator_24_30_4 (
	input clk,
	input i_reset,
	input [23:0] i_result,
	input i_dp_done,
	output [29:0] o_accum
);

reg [29:0] cir_shift_reg_0;
reg [29:0] cir_shift_reg_1;
reg [29:0] cir_shift_reg_2;
reg [29:0] cir_shift_reg_3;
reg [29:0] out_reg;
reg [29:0] in_reg;

always @ (posedge clk) begin
	if(i_reset == 1'b1) begin
		cir_shift_reg_0 <= 0;
		cir_shift_reg_1 <= 0;
		cir_shift_reg_2 <= 0;
		cir_shift_reg_3 <= 0;
		out_reg <= 0;
		in_reg <= 0;
	end else begin
		if (i_result[23] == 1'b0) begin
			in_reg <= {6'b000000, i_result};
		end else begin
			in_reg <= {6'b111111, i_result};
		end
		if(i_dp_done == 1'b1) begin
			out_reg <= (cir_shift_reg_0 + in_reg);
			cir_shift_reg_3 <= 0;
		end else begin
			cir_shift_reg_3 <= (cir_shift_reg_0 + in_reg);
		end
		cir_shift_reg_0 <= cir_shift_reg_1;
		cir_shift_reg_1 <= cir_shift_reg_2;
		cir_shift_reg_2 <= cir_shift_reg_3;
	end
end

assign o_accum = out_reg;

endmodule
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
