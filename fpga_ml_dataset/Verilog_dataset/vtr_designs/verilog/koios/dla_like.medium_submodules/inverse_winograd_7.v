`define SIMULATION_MEMORY

module inverse_winograd_7 (
	input clk,
	input i_valid,
	input [29:0] i_result_0,
	input [29:0] i_result_1,
	input [29:0] i_result_2,
	input [29:0] i_result_3,
	input [29:0] i_result_4,
	input [29:0] i_result_5,
	output [15:0] o_result_0,
	output [15:0] o_result_1,
	output [15:0] o_result_2,
	output [15:0] o_result_3,
	output o_valid
);

reg [2:0] state, next_state;
wire [29:0] adders_res_0_0;
reg [29:0] serialize_reg_0_0;
reg [29:0] adders_res_0_1;
reg [29:0] serialize_reg_0_1;
reg [29:0] adders_res_0_2;
reg [29:0] serialize_reg_0_2;
reg [29:0] adders_res_0_3;
reg [29:0] serialize_reg_0_3;
reg [29:0] adders_res_0_4;
reg [29:0] serialize_reg_0_4;
reg [29:0] adders_res_0_5;
reg [29:0] serialize_reg_0_5;
wire [29:0] adders_res_1_0;
reg [29:0] serialize_reg_1_0;
reg [29:0] adders_res_1_1;
reg [29:0] serialize_reg_1_1;
reg [29:0] adders_res_1_2;
reg [29:0] serialize_reg_1_2;
reg [29:0] adders_res_1_3;
reg [29:0] serialize_reg_1_3;
reg [29:0] adders_res_1_4;
reg [29:0] serialize_reg_1_4;
reg [29:0] adders_res_1_5;
reg [29:0] serialize_reg_1_5;
wire [29:0] adders_res_2_0;
reg [29:0] serialize_reg_2_0;
reg [29:0] adders_res_2_1;
reg [29:0] serialize_reg_2_1;
reg [29:0] adders_res_2_2;
reg [29:0] serialize_reg_2_2;
reg [29:0] adders_res_2_3;
reg [29:0] serialize_reg_2_3;
reg [29:0] adders_res_2_4;
reg [29:0] serialize_reg_2_4;
reg [29:0] adders_res_2_5;
reg [29:0] serialize_reg_2_5;
wire [29:0] adders_res_3_0;
reg [29:0] serialize_reg_3_0;
reg [29:0] adders_res_3_1;
reg [29:0] serialize_reg_3_1;
reg [29:0] adders_res_3_2;
reg [29:0] serialize_reg_3_2;
reg [29:0] adders_res_3_3;
reg [29:0] serialize_reg_3_3;
reg [29:0] adders_res_3_4;
reg [29:0] serialize_reg_3_4;
reg [29:0] adders_res_3_5;
reg [29:0] serialize_reg_3_5;

wire [29:0] result_reg_0_0;
wire [29:0] result_reg_0_1;
wire [29:0] result_reg_0_2;
wire [29:0] result_reg_0_3;
reg [29:0] result_reg_1_0;
reg [29:0] result_reg_1_1;
reg [29:0] result_reg_1_2;
reg [29:0] result_reg_1_3;
reg [29:0] result_reg_2_0;
reg [29:0] result_reg_2_1;
reg [29:0] result_reg_2_2;
reg [29:0] result_reg_2_3;
reg [29:0] result_reg_3_0;
reg [29:0] result_reg_3_1;
reg [29:0] result_reg_3_2;
reg [29:0] result_reg_3_3;
reg [29:0] result_reg_4_0;
reg [29:0] result_reg_4_1;
reg [29:0] result_reg_4_2;
reg [29:0] result_reg_4_3;
reg [29:0] result_reg_5_0;
reg [29:0] result_reg_5_1;
reg [29:0] result_reg_5_2;
reg [29:0] result_reg_5_3;
reg [29:0] result_reg_6_0;
reg [29:0] result_reg_6_1;
reg [29:0] result_reg_6_2;
reg [29:0] result_reg_6_3;
reg [29:0] result_reg_7_0;
reg [29:0] result_reg_7_1;
reg [29:0] result_reg_7_2;
reg [29:0] result_reg_7_3;
reg [29:0] result_reg_8_0;
reg [29:0] result_reg_8_1;
reg [29:0] result_reg_8_2;
reg [29:0] result_reg_8_3;
reg [29:0] result_reg_9_0;
reg [29:0] result_reg_9_1;
reg [29:0] result_reg_9_2;
reg [29:0] result_reg_9_3;
reg [29:0] result_reg_10_0;
reg [29:0] result_reg_10_1;
reg [29:0] result_reg_10_2;
reg [29:0] result_reg_10_3;
reg [29:0] result_reg_11_0;
reg [29:0] result_reg_11_1;
reg [29:0] result_reg_11_2;
reg [29:0] result_reg_11_3;
reg [29:0] result_reg_12_0;
reg [29:0] result_reg_12_1;
reg [29:0] result_reg_12_2;
reg [29:0] result_reg_12_3;
reg [29:0] result_reg_13_0;
reg [29:0] result_reg_13_1;
reg [29:0] result_reg_13_2;
reg [29:0] result_reg_13_3;
reg [29:0] result_reg_14_0;
reg [29:0] result_reg_14_1;
reg [29:0] result_reg_14_2;
reg [29:0] result_reg_14_3;
reg [29:0] result_reg_15_0;
reg [29:0] result_reg_15_1;
reg [29:0] result_reg_15_2;
reg [29:0] result_reg_15_3;
reg [29:0] result_reg_16_0;
reg [29:0] result_reg_16_1;
reg [29:0] result_reg_16_2;
reg [29:0] result_reg_16_3;
reg [29:0] result_reg_17_0;
reg [29:0] result_reg_17_1;
reg [29:0] result_reg_17_2;
reg [29:0] result_reg_17_3;
reg [29:0] result_reg_18_0;
reg [29:0] result_reg_18_1;
reg [29:0] result_reg_18_2;
reg [29:0] result_reg_18_3;
reg [29:0] result_reg_19_0;
reg [29:0] result_reg_19_1;
reg [29:0] result_reg_19_2;
reg [29:0] result_reg_19_3;
reg [29:0] result_reg_20_0;
reg [29:0] result_reg_20_1;
reg [29:0] result_reg_20_2;
reg [29:0] result_reg_20_3;
reg [29:0] result_reg_21_0;
reg [29:0] result_reg_21_1;
reg [29:0] result_reg_21_2;
reg [29:0] result_reg_21_3;

reg out_valid_0;
reg out_valid_1;
reg out_valid_2;
reg out_valid_3;
reg out_valid_4;
reg out_valid_5;
reg out_valid_6;
reg out_valid_7;
reg out_valid_8;
reg out_valid_9;
reg out_valid_10;
reg out_valid_11;
reg out_valid_12;
reg out_valid_13;
reg out_valid_14;
reg out_valid_15;
reg out_valid_16;
reg out_valid_17;
reg out_valid_18;
reg out_valid_19;
reg out_valid_20;
reg out_valid_21;
reg [1:0] serialize_count;

always @ (posedge clk) begin
	out_valid_1 <= out_valid_0;
	result_reg_1_0 <= result_reg_0_0;
	result_reg_1_1 <= result_reg_0_1;
	result_reg_1_2 <= result_reg_0_2;
	result_reg_1_3 <= result_reg_0_3;
	out_valid_2 <= out_valid_1;
	result_reg_2_0 <= result_reg_1_0;
	result_reg_2_1 <= result_reg_1_1;
	result_reg_2_2 <= result_reg_1_2;
	result_reg_2_3 <= result_reg_1_3;
	out_valid_3 <= out_valid_2;
	result_reg_3_0 <= result_reg_2_0;
	result_reg_3_1 <= result_reg_2_1;
	result_reg_3_2 <= result_reg_2_2;
	result_reg_3_3 <= result_reg_2_3;
	out_valid_4 <= out_valid_3;
	result_reg_4_0 <= result_reg_3_0;
	result_reg_4_1 <= result_reg_3_1;
	result_reg_4_2 <= result_reg_3_2;
	result_reg_4_3 <= result_reg_3_3;
	out_valid_5 <= out_valid_4;
	result_reg_5_0 <= result_reg_4_0;
	result_reg_5_1 <= result_reg_4_1;
	result_reg_5_2 <= result_reg_4_2;
	result_reg_5_3 <= result_reg_4_3;
	out_valid_6 <= out_valid_5;
	result_reg_6_0 <= result_reg_5_0;
	result_reg_6_1 <= result_reg_5_1;
	result_reg_6_2 <= result_reg_5_2;
	result_reg_6_3 <= result_reg_5_3;
	out_valid_7 <= out_valid_6;
	result_reg_7_0 <= result_reg_6_0;
	result_reg_7_1 <= result_reg_6_1;
	result_reg_7_2 <= result_reg_6_2;
	result_reg_7_3 <= result_reg_6_3;
	out_valid_8 <= out_valid_7;
	result_reg_8_0 <= result_reg_7_0;
	result_reg_8_1 <= result_reg_7_1;
	result_reg_8_2 <= result_reg_7_2;
	result_reg_8_3 <= result_reg_7_3;
	out_valid_9 <= out_valid_8;
	result_reg_9_0 <= result_reg_8_0;
	result_reg_9_1 <= result_reg_8_1;
	result_reg_9_2 <= result_reg_8_2;
	result_reg_9_3 <= result_reg_8_3;
	out_valid_10 <= out_valid_9;
	result_reg_10_0 <= result_reg_9_0;
	result_reg_10_1 <= result_reg_9_1;
	result_reg_10_2 <= result_reg_9_2;
	result_reg_10_3 <= result_reg_9_3;
	out_valid_11 <= out_valid_10;
	result_reg_11_0 <= result_reg_10_0;
	result_reg_11_1 <= result_reg_10_1;
	result_reg_11_2 <= result_reg_10_2;
	result_reg_11_3 <= result_reg_10_3;
	out_valid_12 <= out_valid_11;
	result_reg_12_0 <= result_reg_11_0;
	result_reg_12_1 <= result_reg_11_1;
	result_reg_12_2 <= result_reg_11_2;
	result_reg_12_3 <= result_reg_11_3;
	out_valid_13 <= out_valid_12;
	result_reg_13_0 <= result_reg_12_0;
	result_reg_13_1 <= result_reg_12_1;
	result_reg_13_2 <= result_reg_12_2;
	result_reg_13_3 <= result_reg_12_3;
	out_valid_14 <= out_valid_13;
	result_reg_14_0 <= result_reg_13_0;
	result_reg_14_1 <= result_reg_13_1;
	result_reg_14_2 <= result_reg_13_2;
	result_reg_14_3 <= result_reg_13_3;
	out_valid_15 <= out_valid_14;
	result_reg_15_0 <= result_reg_14_0;
	result_reg_15_1 <= result_reg_14_1;
	result_reg_15_2 <= result_reg_14_2;
	result_reg_15_3 <= result_reg_14_3;
	out_valid_16 <= out_valid_15;
	result_reg_16_0 <= result_reg_15_0;
	result_reg_16_1 <= result_reg_15_1;
	result_reg_16_2 <= result_reg_15_2;
	result_reg_16_3 <= result_reg_15_3;
	out_valid_17 <= out_valid_16;
	result_reg_17_0 <= result_reg_16_0;
	result_reg_17_1 <= result_reg_16_1;
	result_reg_17_2 <= result_reg_16_2;
	result_reg_17_3 <= result_reg_16_3;
	out_valid_18 <= out_valid_17;
	result_reg_18_0 <= result_reg_17_0;
	result_reg_18_1 <= result_reg_17_1;
	result_reg_18_2 <= result_reg_17_2;
	result_reg_18_3 <= result_reg_17_3;
	out_valid_19 <= out_valid_18;
	result_reg_19_0 <= result_reg_18_0;
	result_reg_19_1 <= result_reg_18_1;
	result_reg_19_2 <= result_reg_18_2;
	result_reg_19_3 <= result_reg_18_3;
	out_valid_20 <= out_valid_19;
	result_reg_20_0 <= result_reg_19_0;
	result_reg_20_1 <= result_reg_19_1;
	result_reg_20_2 <= result_reg_19_2;
	result_reg_20_3 <= result_reg_19_3;
	out_valid_21 <= out_valid_20;
	result_reg_21_0 <= result_reg_20_0;
	result_reg_21_1 <= result_reg_20_1;
	result_reg_21_2 <= result_reg_20_2;
	result_reg_21_3 <= result_reg_20_3;
end

// FSM Combinational Logic
always @ (state or i_valid or serialize_count) begin
	if(state == 3'b000) begin
		if(i_valid == 1'b1)begin
			next_state = 3'b010;
		end else begin
			next_state = 3'b000;
		end
	end else if (state == 3'b010) begin
		if(i_valid == 1'b0) begin
			next_state = 3'b100;
		end else begin
			next_state = 3'b010;
		end
	end else if (state == 3'b100) begin
		if(serialize_count == 3)begin
			next_state = 3'b000;
		end else begin
			next_state = 3'b100;
		end
	end else begin
		next_state = 3'b000;
	end
end

// FSM Sequential Logic
always @ (posedge clk) begin
	if (state == 3'b000) begin
		serialize_count <= 0;
		out_valid_0 <= 0;
		if (i_valid == 1'b1) begin
			adders_res_0_1 <= adders_res_0_0;
			adders_res_1_1 <= adders_res_1_0;
			adders_res_2_1 <= adders_res_2_0;
			adders_res_3_1 <= adders_res_3_0;
			adders_res_0_2 <= adders_res_0_1;
			adders_res_1_2 <= adders_res_1_1;
			adders_res_2_2 <= adders_res_2_1;
			adders_res_3_2 <= adders_res_3_1;
			adders_res_0_3 <= adders_res_0_2;
			adders_res_1_3 <= adders_res_1_2;
			adders_res_2_3 <= adders_res_2_2;
			adders_res_3_3 <= adders_res_3_2;
			adders_res_0_4 <= adders_res_0_3;
			adders_res_1_4 <= adders_res_1_3;
			adders_res_2_4 <= adders_res_2_3;
			adders_res_3_4 <= adders_res_3_3;
			adders_res_0_5 <= adders_res_0_4;
			adders_res_1_5 <= adders_res_1_4;
			adders_res_2_5 <= adders_res_2_4;
			adders_res_3_5 <= adders_res_3_4;
		end
	end else if (state == 3'b010) begin
		if(i_valid == 1'b1) begin
			adders_res_0_1 <= adders_res_0_0;
			adders_res_1_1 <= adders_res_1_0;
			adders_res_2_1 <= adders_res_2_0;
			adders_res_3_1 <= adders_res_3_0;
			adders_res_0_2 <= adders_res_0_1;
			adders_res_1_2 <= adders_res_1_1;
			adders_res_2_2 <= adders_res_2_1;
			adders_res_3_2 <= adders_res_3_1;
			adders_res_0_3 <= adders_res_0_2;
			adders_res_1_3 <= adders_res_1_2;
			adders_res_2_3 <= adders_res_2_2;
			adders_res_3_3 <= adders_res_3_2;
			adders_res_0_4 <= adders_res_0_3;
			adders_res_1_4 <= adders_res_1_3;
			adders_res_2_4 <= adders_res_2_3;
			adders_res_3_4 <= adders_res_3_3;
			adders_res_0_5 <= adders_res_0_4;
			adders_res_1_5 <= adders_res_1_4;
			adders_res_2_5 <= adders_res_2_4;
			adders_res_3_5 <= adders_res_3_4;
		end else begin
			serialize_reg_0_0 <= adders_res_0_0;
			serialize_reg_1_0 <= adders_res_1_0;
			serialize_reg_2_0 <= adders_res_2_0;
			serialize_reg_3_0 <= adders_res_3_0;
			serialize_reg_0_1 <= adders_res_0_1;
			serialize_reg_1_1 <= adders_res_1_1;
			serialize_reg_2_1 <= adders_res_2_1;
			serialize_reg_3_1 <= adders_res_3_1;
			serialize_reg_0_2 <= adders_res_0_2;
			serialize_reg_1_2 <= adders_res_1_2;
			serialize_reg_2_2 <= adders_res_2_2;
			serialize_reg_3_2 <= adders_res_3_2;
			serialize_reg_0_3 <= adders_res_0_3;
			serialize_reg_1_3 <= adders_res_1_3;
			serialize_reg_2_3 <= adders_res_2_3;
			serialize_reg_3_3 <= adders_res_3_3;
			serialize_reg_0_4 <= adders_res_0_4;
			serialize_reg_1_4 <= adders_res_1_4;
			serialize_reg_2_4 <= adders_res_2_4;
			serialize_reg_3_4 <= adders_res_3_4;
			serialize_reg_0_5 <= adders_res_0_5;
			serialize_reg_1_5 <= adders_res_1_5;
			serialize_reg_2_5 <= adders_res_2_5;
			serialize_reg_3_5 <= adders_res_3_5;
		end
	end else if (state == 3'b100) begin
		if (serialize_count < 3) begin
			serialize_reg_0_0 <= serialize_reg_1_0;
			serialize_reg_0_1 <= serialize_reg_1_1;
			serialize_reg_0_2 <= serialize_reg_1_2;
			serialize_reg_0_3 <= serialize_reg_1_3;
			serialize_reg_0_4 <= serialize_reg_1_4;
			serialize_reg_0_5 <= serialize_reg_1_5;
			serialize_reg_1_0 <= serialize_reg_2_0;
			serialize_reg_1_1 <= serialize_reg_2_1;
			serialize_reg_1_2 <= serialize_reg_2_2;
			serialize_reg_1_3 <= serialize_reg_2_3;
			serialize_reg_1_4 <= serialize_reg_2_4;
			serialize_reg_1_5 <= serialize_reg_2_5;
			serialize_reg_2_0 <= serialize_reg_3_0;
			serialize_reg_2_1 <= serialize_reg_3_1;
			serialize_reg_2_2 <= serialize_reg_3_2;
			serialize_reg_2_3 <= serialize_reg_3_3;
			serialize_reg_2_4 <= serialize_reg_3_4;
			serialize_reg_2_5 <= serialize_reg_3_5;
			serialize_count <= serialize_count + 1'b1;
			out_valid_0 <= 1;
		end
	end
	state <=  next_state;
end

// AT Adders
inverse_winograd_adder_30_3 inverse_winograd_adder_30_3_inst_IWA0 (
	.data0x(i_result_0),
	.data1x(i_result_1),
	.data2x(i_result_2),
	.data3x(i_result_3),
	.data4x(i_result_4),
	.data5x({ (30) {1'b0} }),
	.clock(clk),
	.result(adders_res_0_0)
);
wire [29:0] f1, f2;
assign f1 = -i_result_2;
assign f2 = -{i_result_4[28:0], 1'b0};
inverse_winograd_adder_30_3 inverse_winograd_adder_30_3_inst_IWA1 (
	.data0x({ (30){1'b0} }),
	.data1x(i_result_1),
	.data2x(f1),
	.data3x({i_result_3[28:0], 1'b0}),
	.data4x(f2),
	.data5x({ (30){1'b0} }),
	.clock(clk),
	.result(adders_res_1_0)
);
wire [29:0] f3, f4;
assign f3 = -i_result_2;
assign f4 = -{i_result_4[27:0], 2'b00};
inverse_winograd_adder_30_3 inverse_winograd_adder_30_3_inst_IWA2 (
	.data0x({ (30){1'b0} }),
	.data1x(i_result_1),
	.data2x(f3),
	.data3x({i_result_3[27:0], 2'b00}),
	.data4x(f4),
	.data5x({ (30){1'b0} }),
	.clock(clk),
	.result(adders_res_2_0)
);
wire [29:0] f5, f6;
assign f5 = -i_result_2;
assign f6 = -{i_result_4[26:0], 3'b000};
inverse_winograd_adder_30_3 inverse_winograd_adder_30_3_inst_IWA3 (
	.data0x({ (30){1'b0} }),
	.data1x(i_result_1),
	.data2x(f5),
	.data3x({i_result_3[26:0], 3'b000}),
	.data4x(f6),
	.data5x(i_result_5),
	.clock(clk),
	.result(adders_res_3_0)
);

// A Adders
inverse_winograd_adder_30_3 inverse_winograd_adder_30_3_inst_IWAT0 (
	.data0x(serialize_reg_0_5),
	.data1x(serialize_reg_0_4),
	.data2x(serialize_reg_0_3),
	.data3x(serialize_reg_0_2),
	.data4x(serialize_reg_0_1),
	.data5x({ (30) {1'b0} }),
	.clock(clk),
	.result(result_reg_0_0)
);
wire [29:0] f7, f8;
assign f7 = -serialize_reg_0_3;
assign f8 = -{serialize_reg_0_1[28:0], 1'b0};
inverse_winograd_adder_30_3 inverse_winograd_adder_30_3_inst_IWAT1 (
	.data0x({ (30){1'b0} }),
	.data1x(serialize_reg_0_4),
	.data2x(f7),
	.data3x({serialize_reg_0_2[28:0], 1'b0}),
	.data4x(f8),
	.data5x({ (30){1'b0} }),
	.clock(clk),
	.result(result_reg_0_1)
);
inverse_winograd_adder_30_3 inverse_winograd_adder_30_3_inst_IWAT2 (
	.data0x({ (30){1'b0} }),
	.data1x(serialize_reg_0_4),
	.data2x(serialize_reg_0_3),
	.data3x({serialize_reg_0_2[27:0], 2'b00}),
	.data4x({serialize_reg_0_1[27:0], 2'b00}),
	.data5x({ (30){1'b0} }),
	.clock(clk),
	.result(result_reg_0_2)
);
wire [29:0] f9, f10;
assign f9 = -serialize_reg_0_3;
assign f10 = -{serialize_reg_0_1[26:0], 3'b000};
inverse_winograd_adder_30_3 inverse_winograd_adder_30_3_inst_IWAT3 (
	.data0x({ (30){1'b0} }),
	.data1x(serialize_reg_0_4),
	.data2x(f9),
	.data3x({serialize_reg_0_2[26:0], 3'b000}),
	.data4x(f10),
	.data5x(serialize_reg_0_0),
	.clock(clk),
	.result(result_reg_0_3)
);

reg [15:0] result_wire_0;
reg [15:0] result_wire_1;
reg [15:0] result_wire_2;
reg [15:0] result_wire_3;

always @ (*) begin
	if(result_reg_21_0[29] == 1'b0) begin
		result_wire_0 <= result_reg_21_0[23:8];
	end else begin
		result_wire_0 <= { (16){1'b0} };
	end
	if(result_reg_21_1[29] == 1'b0) begin
		result_wire_1 <= result_reg_21_1[23:8];
	end else begin
		result_wire_1 <= { (16){1'b0} };
	end
	if(result_reg_21_2[29] == 1'b0) begin
		result_wire_2 <= result_reg_21_2[23:8];
	end else begin
		result_wire_2 <= { (16){1'b0} };
	end
	if(result_reg_21_3[29] == 1'b0) begin
		result_wire_3 <= result_reg_21_3[23:8];
	end else begin
		result_wire_3 <= { (16){1'b0} };
	end
end

assign o_valid = out_valid_21;
assign o_result_0 = result_wire_0;
assign o_result_1 = result_wire_1;
assign o_result_2 = result_wire_2;
assign o_result_3 = result_wire_3;

endmodule

module inverse_winograd_adder_30_3 (
	input clock,
	input [29:0] data0x,
	input [29:0] data1x,
	input [29:0] data2x,
	input [29:0] data3x,
	input [29:0] data4x,
	input [29:0] data5x,
	output [29:0] result
);

reg [32:0] pipeline_0_0;
reg [32:0] pipeline_0_1;
reg [32:0] pipeline_0_2;
reg [32:0] pipeline_1_0;
reg [32:0] pipeline_1_1;
reg [32:0] pipeline_2_0;

always @ (posedge clock) begin
	pipeline_0_0 <= data0x + data1x;
	pipeline_0_1 <= data2x + data3x;
	pipeline_0_2 <= data4x + data5x;
	pipeline_1_0 <= pipeline_0_0 + pipeline_0_1;
	pipeline_1_1 <= pipeline_0_2;
	pipeline_2_0 <= pipeline_1_0 + pipeline_1_1;
end

assign result = pipeline_2_0;

endmodule



