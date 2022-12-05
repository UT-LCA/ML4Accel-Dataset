`define SIMULATION_MEMORY

module output_activation_18_10_48_1 (
	input clk,
	input reset,
	input i_ready,
	input i_valid,
	input [17:0] stage1_result_0,
	input [17:0] bias_0,
	output [17:0] output_value_0,
	input [17:0] stage1_result_1,
	input [17:0] bias_1,
	output [17:0] output_value_1,
	input [17:0] stage1_result_2,
	input [17:0] bias_2,
	output [17:0] output_value_2,
	input [17:0] stage1_result_3,
	input [17:0] bias_3,
	output [17:0] output_value_3,
	input [17:0] stage1_result_4,
	input [17:0] bias_4,
	output [17:0] output_value_4,
	input [17:0] stage1_result_5,
	input [17:0] bias_5,
	output [17:0] output_value_5,
	input [17:0] stage1_result_6,
	input [17:0] bias_6,
	output [17:0] output_value_6,
	input [17:0] stage1_result_7,
	input [17:0] bias_7,
	output [17:0] output_value_7,
	input [17:0] stage1_result_8,
	input [17:0] bias_8,
	output [17:0] output_value_8,
	input [17:0] stage1_result_9,
	input [17:0] bias_9,
	output [17:0] output_value_9,
	input [17:0] stage1_result_10,
	input [17:0] bias_10,
	output [17:0] output_value_10,
	input [17:0] stage1_result_11,
	input [17:0] bias_11,
	output [17:0] output_value_11,
	input [17:0] stage1_result_12,
	input [17:0] bias_12,
	output [17:0] output_value_12,
	input [17:0] stage1_result_13,
	input [17:0] bias_13,
	output [17:0] output_value_13,
	input [17:0] stage1_result_14,
	input [17:0] bias_14,
	output [17:0] output_value_14,
	input [17:0] stage1_result_15,
	input [17:0] bias_15,
	output [17:0] output_value_15,
	input [17:0] stage1_result_16,
	input [17:0] bias_16,
	output [17:0] output_value_16,
	input [17:0] stage1_result_17,
	input [17:0] bias_17,
	output [17:0] output_value_17,
	input [17:0] stage1_result_18,
	input [17:0] bias_18,
	output [17:0] output_value_18,
	input [17:0] stage1_result_19,
	input [17:0] bias_19,
	output [17:0] output_value_19,
	input [17:0] stage1_result_20,
	input [17:0] bias_20,
	output [17:0] output_value_20,
	input [17:0] stage1_result_21,
	input [17:0] bias_21,
	output [17:0] output_value_21,
	input [17:0] stage1_result_22,
	input [17:0] bias_22,
	output [17:0] output_value_22,
	input [17:0] stage1_result_23,
	input [17:0] bias_23,
	output [17:0] output_value_23,
	input [17:0] stage1_result_24,
	input [17:0] bias_24,
	output [17:0] output_value_24,
	input [17:0] stage1_result_25,
	input [17:0] bias_25,
	output [17:0] output_value_25,
	input [17:0] stage1_result_26,
	input [17:0] bias_26,
	output [17:0] output_value_26,
	input [17:0] stage1_result_27,
	input [17:0] bias_27,
	output [17:0] output_value_27,
	input [17:0] stage1_result_28,
	input [17:0] bias_28,
	output [17:0] output_value_28,
	input [17:0] stage1_result_29,
	input [17:0] bias_29,
	output [17:0] output_value_29,
	input [17:0] stage1_result_30,
	input [17:0] bias_30,
	output [17:0] output_value_30,
	input [17:0] stage1_result_31,
	input [17:0] bias_31,
	output [17:0] output_value_31,
	input [17:0] stage1_result_32,
	input [17:0] bias_32,
	output [17:0] output_value_32,
	input [17:0] stage1_result_33,
	input [17:0] bias_33,
	output [17:0] output_value_33,
	input [17:0] stage1_result_34,
	input [17:0] bias_34,
	output [17:0] output_value_34,
	input [17:0] stage1_result_35,
	input [17:0] bias_35,
	output [17:0] output_value_35,
	input [17:0] stage1_result_36,
	input [17:0] bias_36,
	output [17:0] output_value_36,
	input [17:0] stage1_result_37,
	input [17:0] bias_37,
	output [17:0] output_value_37,
	input [17:0] stage1_result_38,
	input [17:0] bias_38,
	output [17:0] output_value_38,
	input [17:0] stage1_result_39,
	input [17:0] bias_39,
	output [17:0] output_value_39,
	input [17:0] stage1_result_40,
	input [17:0] bias_40,
	output [17:0] output_value_40,
	input [17:0] stage1_result_41,
	input [17:0] bias_41,
	output [17:0] output_value_41,
	input [17:0] stage1_result_42,
	input [17:0] bias_42,
	output [17:0] output_value_42,
	input [17:0] stage1_result_43,
	input [17:0] bias_43,
	output [17:0] output_value_43,
	input [17:0] stage1_result_44,
	input [17:0] bias_44,
	output [17:0] output_value_44,
	input [17:0] stage1_result_45,
	input [17:0] bias_45,
	output [17:0] output_value_45,
	input [17:0] stage1_result_46,
	input [17:0] bias_46,
	output [17:0] output_value_46,
	input [17:0] stage1_result_47,
	input [17:0] bias_47,
	output [17:0] output_value_47,
	output o_valid,
	output o_ready
);

wire adder2_valid, adder2_ready;
wire sigmoid_valid_0, sigmoid_ready_0;
wire [17:0] o_add2_0;
wire [17:0] o_sigmoid_0;
wire sigmoid_valid_1, sigmoid_ready_1;
wire [17:0] o_add2_1;
wire [17:0] o_sigmoid_1;
wire sigmoid_valid_2, sigmoid_ready_2;
wire [17:0] o_add2_2;
wire [17:0] o_sigmoid_2;
wire sigmoid_valid_3, sigmoid_ready_3;
wire [17:0] o_add2_3;
wire [17:0] o_sigmoid_3;
wire sigmoid_valid_4, sigmoid_ready_4;
wire [17:0] o_add2_4;
wire [17:0] o_sigmoid_4;
wire sigmoid_valid_5, sigmoid_ready_5;
wire [17:0] o_add2_5;
wire [17:0] o_sigmoid_5;
wire sigmoid_valid_6, sigmoid_ready_6;
wire [17:0] o_add2_6;
wire [17:0] o_sigmoid_6;
wire sigmoid_valid_7, sigmoid_ready_7;
wire [17:0] o_add2_7;
wire [17:0] o_sigmoid_7;
wire sigmoid_valid_8, sigmoid_ready_8;
wire [17:0] o_add2_8;
wire [17:0] o_sigmoid_8;
wire sigmoid_valid_9, sigmoid_ready_9;
wire [17:0] o_add2_9;
wire [17:0] o_sigmoid_9;
wire sigmoid_valid_10, sigmoid_ready_10;
wire [17:0] o_add2_10;
wire [17:0] o_sigmoid_10;
wire sigmoid_valid_11, sigmoid_ready_11;
wire [17:0] o_add2_11;
wire [17:0] o_sigmoid_11;
wire sigmoid_valid_12, sigmoid_ready_12;
wire [17:0] o_add2_12;
wire [17:0] o_sigmoid_12;
wire sigmoid_valid_13, sigmoid_ready_13;
wire [17:0] o_add2_13;
wire [17:0] o_sigmoid_13;
wire sigmoid_valid_14, sigmoid_ready_14;
wire [17:0] o_add2_14;
wire [17:0] o_sigmoid_14;
wire sigmoid_valid_15, sigmoid_ready_15;
wire [17:0] o_add2_15;
wire [17:0] o_sigmoid_15;
wire sigmoid_valid_16, sigmoid_ready_16;
wire [17:0] o_add2_16;
wire [17:0] o_sigmoid_16;
wire sigmoid_valid_17, sigmoid_ready_17;
wire [17:0] o_add2_17;
wire [17:0] o_sigmoid_17;
wire sigmoid_valid_18, sigmoid_ready_18;
wire [17:0] o_add2_18;
wire [17:0] o_sigmoid_18;
wire sigmoid_valid_19, sigmoid_ready_19;
wire [17:0] o_add2_19;
wire [17:0] o_sigmoid_19;
wire sigmoid_valid_20, sigmoid_ready_20;
wire [17:0] o_add2_20;
wire [17:0] o_sigmoid_20;
wire sigmoid_valid_21, sigmoid_ready_21;
wire [17:0] o_add2_21;
wire [17:0] o_sigmoid_21;
wire sigmoid_valid_22, sigmoid_ready_22;
wire [17:0] o_add2_22;
wire [17:0] o_sigmoid_22;
wire sigmoid_valid_23, sigmoid_ready_23;
wire [17:0] o_add2_23;
wire [17:0] o_sigmoid_23;
wire sigmoid_valid_24, sigmoid_ready_24;
wire [17:0] o_add2_24;
wire [17:0] o_sigmoid_24;
wire sigmoid_valid_25, sigmoid_ready_25;
wire [17:0] o_add2_25;
wire [17:0] o_sigmoid_25;
wire sigmoid_valid_26, sigmoid_ready_26;
wire [17:0] o_add2_26;
wire [17:0] o_sigmoid_26;
wire sigmoid_valid_27, sigmoid_ready_27;
wire [17:0] o_add2_27;
wire [17:0] o_sigmoid_27;
wire sigmoid_valid_28, sigmoid_ready_28;
wire [17:0] o_add2_28;
wire [17:0] o_sigmoid_28;
wire sigmoid_valid_29, sigmoid_ready_29;
wire [17:0] o_add2_29;
wire [17:0] o_sigmoid_29;
wire sigmoid_valid_30, sigmoid_ready_30;
wire [17:0] o_add2_30;
wire [17:0] o_sigmoid_30;
wire sigmoid_valid_31, sigmoid_ready_31;
wire [17:0] o_add2_31;
wire [17:0] o_sigmoid_31;
wire sigmoid_valid_32, sigmoid_ready_32;
wire [17:0] o_add2_32;
wire [17:0] o_sigmoid_32;
wire sigmoid_valid_33, sigmoid_ready_33;
wire [17:0] o_add2_33;
wire [17:0] o_sigmoid_33;
wire sigmoid_valid_34, sigmoid_ready_34;
wire [17:0] o_add2_34;
wire [17:0] o_sigmoid_34;
wire sigmoid_valid_35, sigmoid_ready_35;
wire [17:0] o_add2_35;
wire [17:0] o_sigmoid_35;
wire sigmoid_valid_36, sigmoid_ready_36;
wire [17:0] o_add2_36;
wire [17:0] o_sigmoid_36;
wire sigmoid_valid_37, sigmoid_ready_37;
wire [17:0] o_add2_37;
wire [17:0] o_sigmoid_37;
wire sigmoid_valid_38, sigmoid_ready_38;
wire [17:0] o_add2_38;
wire [17:0] o_sigmoid_38;
wire sigmoid_valid_39, sigmoid_ready_39;
wire [17:0] o_add2_39;
wire [17:0] o_sigmoid_39;
wire sigmoid_valid_40, sigmoid_ready_40;
wire [17:0] o_add2_40;
wire [17:0] o_sigmoid_40;
wire sigmoid_valid_41, sigmoid_ready_41;
wire [17:0] o_add2_41;
wire [17:0] o_sigmoid_41;
wire sigmoid_valid_42, sigmoid_ready_42;
wire [17:0] o_add2_42;
wire [17:0] o_sigmoid_42;
wire sigmoid_valid_43, sigmoid_ready_43;
wire [17:0] o_add2_43;
wire [17:0] o_sigmoid_43;
wire sigmoid_valid_44, sigmoid_ready_44;
wire [17:0] o_add2_44;
wire [17:0] o_sigmoid_44;
wire sigmoid_valid_45, sigmoid_ready_45;
wire [17:0] o_add2_45;
wire [17:0] o_sigmoid_45;
wire sigmoid_valid_46, sigmoid_ready_46;
wire [17:0] o_add2_46;
wire [17:0] o_sigmoid_46;
wire sigmoid_valid_47, sigmoid_ready_47;
wire [17:0] o_add2_47;
wire [17:0] o_sigmoid_47;
wire enable;
assign enable = i_ready;

elementwise_add_core_18_18_48 elementwise_add_core_18_18_48_inst (
	.clk(clk),
	.reset(reset),
	.i_valid(i_valid),
	.i_ready(sigmoid_ready_0),
	.i_A_0(stage1_result_0),
	.i_B_0(bias_0),
	.o_C_0(o_add2_0),
	.i_A_1(stage1_result_1),
	.i_B_1(bias_1),
	.o_C_1(o_add2_1),
	.i_A_2(stage1_result_2),
	.i_B_2(bias_2),
	.o_C_2(o_add2_2),
	.i_A_3(stage1_result_3),
	.i_B_3(bias_3),
	.o_C_3(o_add2_3),
	.i_A_4(stage1_result_4),
	.i_B_4(bias_4),
	.o_C_4(o_add2_4),
	.i_A_5(stage1_result_5),
	.i_B_5(bias_5),
	.o_C_5(o_add2_5),
	.i_A_6(stage1_result_6),
	.i_B_6(bias_6),
	.o_C_6(o_add2_6),
	.i_A_7(stage1_result_7),
	.i_B_7(bias_7),
	.o_C_7(o_add2_7),
	.i_A_8(stage1_result_8),
	.i_B_8(bias_8),
	.o_C_8(o_add2_8),
	.i_A_9(stage1_result_9),
	.i_B_9(bias_9),
	.o_C_9(o_add2_9),
	.i_A_10(stage1_result_10),
	.i_B_10(bias_10),
	.o_C_10(o_add2_10),
	.i_A_11(stage1_result_11),
	.i_B_11(bias_11),
	.o_C_11(o_add2_11),
	.i_A_12(stage1_result_12),
	.i_B_12(bias_12),
	.o_C_12(o_add2_12),
	.i_A_13(stage1_result_13),
	.i_B_13(bias_13),
	.o_C_13(o_add2_13),
	.i_A_14(stage1_result_14),
	.i_B_14(bias_14),
	.o_C_14(o_add2_14),
	.i_A_15(stage1_result_15),
	.i_B_15(bias_15),
	.o_C_15(o_add2_15),
	.i_A_16(stage1_result_16),
	.i_B_16(bias_16),
	.o_C_16(o_add2_16),
	.i_A_17(stage1_result_17),
	.i_B_17(bias_17),
	.o_C_17(o_add2_17),
	.i_A_18(stage1_result_18),
	.i_B_18(bias_18),
	.o_C_18(o_add2_18),
	.i_A_19(stage1_result_19),
	.i_B_19(bias_19),
	.o_C_19(o_add2_19),
	.i_A_20(stage1_result_20),
	.i_B_20(bias_20),
	.o_C_20(o_add2_20),
	.i_A_21(stage1_result_21),
	.i_B_21(bias_21),
	.o_C_21(o_add2_21),
	.i_A_22(stage1_result_22),
	.i_B_22(bias_22),
	.o_C_22(o_add2_22),
	.i_A_23(stage1_result_23),
	.i_B_23(bias_23),
	.o_C_23(o_add2_23),
	.i_A_24(stage1_result_24),
	.i_B_24(bias_24),
	.o_C_24(o_add2_24),
	.i_A_25(stage1_result_25),
	.i_B_25(bias_25),
	.o_C_25(o_add2_25),
	.i_A_26(stage1_result_26),
	.i_B_26(bias_26),
	.o_C_26(o_add2_26),
	.i_A_27(stage1_result_27),
	.i_B_27(bias_27),
	.o_C_27(o_add2_27),
	.i_A_28(stage1_result_28),
	.i_B_28(bias_28),
	.o_C_28(o_add2_28),
	.i_A_29(stage1_result_29),
	.i_B_29(bias_29),
	.o_C_29(o_add2_29),
	.i_A_30(stage1_result_30),
	.i_B_30(bias_30),
	.o_C_30(o_add2_30),
	.i_A_31(stage1_result_31),
	.i_B_31(bias_31),
	.o_C_31(o_add2_31),
	.i_A_32(stage1_result_32),
	.i_B_32(bias_32),
	.o_C_32(o_add2_32),
	.i_A_33(stage1_result_33),
	.i_B_33(bias_33),
	.o_C_33(o_add2_33),
	.i_A_34(stage1_result_34),
	.i_B_34(bias_34),
	.o_C_34(o_add2_34),
	.i_A_35(stage1_result_35),
	.i_B_35(bias_35),
	.o_C_35(o_add2_35),
	.i_A_36(stage1_result_36),
	.i_B_36(bias_36),
	.o_C_36(o_add2_36),
	.i_A_37(stage1_result_37),
	.i_B_37(bias_37),
	.o_C_37(o_add2_37),
	.i_A_38(stage1_result_38),
	.i_B_38(bias_38),
	.o_C_38(o_add2_38),
	.i_A_39(stage1_result_39),
	.i_B_39(bias_39),
	.o_C_39(o_add2_39),
	.i_A_40(stage1_result_40),
	.i_B_40(bias_40),
	.o_C_40(o_add2_40),
	.i_A_41(stage1_result_41),
	.i_B_41(bias_41),
	.o_C_41(o_add2_41),
	.i_A_42(stage1_result_42),
	.i_B_42(bias_42),
	.o_C_42(o_add2_42),
	.i_A_43(stage1_result_43),
	.i_B_43(bias_43),
	.o_C_43(o_add2_43),
	.i_A_44(stage1_result_44),
	.i_B_44(bias_44),
	.o_C_44(o_add2_44),
	.i_A_45(stage1_result_45),
	.i_B_45(bias_45),
	.o_C_45(o_add2_45),
	.i_A_46(stage1_result_46),
	.i_B_46(bias_46),
	.o_C_46(o_add2_46),
	.i_A_47(stage1_result_47),
	.i_B_47(bias_47),
	.o_C_47(o_add2_47),
	.o_valid(adder2_valid),
	.o_ready(adder2_ready)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_0 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_0),
	.o_valid(sigmoid_valid_0),
	.i_x(o_add2_0),
	.o_y(o_sigmoid_0)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_1 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_1),
	.o_valid(sigmoid_valid_1),
	.i_x(o_add2_1),
	.o_y(o_sigmoid_1)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_2 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_2),
	.o_valid(sigmoid_valid_2),
	.i_x(o_add2_2),
	.o_y(o_sigmoid_2)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_3 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_3),
	.o_valid(sigmoid_valid_3),
	.i_x(o_add2_3),
	.o_y(o_sigmoid_3)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_4 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_4),
	.o_valid(sigmoid_valid_4),
	.i_x(o_add2_4),
	.o_y(o_sigmoid_4)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_5 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_5),
	.o_valid(sigmoid_valid_5),
	.i_x(o_add2_5),
	.o_y(o_sigmoid_5)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_6 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_6),
	.o_valid(sigmoid_valid_6),
	.i_x(o_add2_6),
	.o_y(o_sigmoid_6)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_7 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_7),
	.o_valid(sigmoid_valid_7),
	.i_x(o_add2_7),
	.o_y(o_sigmoid_7)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_8 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_8),
	.o_valid(sigmoid_valid_8),
	.i_x(o_add2_8),
	.o_y(o_sigmoid_8)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_9 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_9),
	.o_valid(sigmoid_valid_9),
	.i_x(o_add2_9),
	.o_y(o_sigmoid_9)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_10 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_10),
	.o_valid(sigmoid_valid_10),
	.i_x(o_add2_10),
	.o_y(o_sigmoid_10)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_11 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_11),
	.o_valid(sigmoid_valid_11),
	.i_x(o_add2_11),
	.o_y(o_sigmoid_11)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_12 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_12),
	.o_valid(sigmoid_valid_12),
	.i_x(o_add2_12),
	.o_y(o_sigmoid_12)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_13 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_13),
	.o_valid(sigmoid_valid_13),
	.i_x(o_add2_13),
	.o_y(o_sigmoid_13)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_14 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_14),
	.o_valid(sigmoid_valid_14),
	.i_x(o_add2_14),
	.o_y(o_sigmoid_14)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_15 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_15),
	.o_valid(sigmoid_valid_15),
	.i_x(o_add2_15),
	.o_y(o_sigmoid_15)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_16 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_16),
	.o_valid(sigmoid_valid_16),
	.i_x(o_add2_16),
	.o_y(o_sigmoid_16)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_17 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_17),
	.o_valid(sigmoid_valid_17),
	.i_x(o_add2_17),
	.o_y(o_sigmoid_17)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_18 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_18),
	.o_valid(sigmoid_valid_18),
	.i_x(o_add2_18),
	.o_y(o_sigmoid_18)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_19 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_19),
	.o_valid(sigmoid_valid_19),
	.i_x(o_add2_19),
	.o_y(o_sigmoid_19)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_20 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_20),
	.o_valid(sigmoid_valid_20),
	.i_x(o_add2_20),
	.o_y(o_sigmoid_20)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_21 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_21),
	.o_valid(sigmoid_valid_21),
	.i_x(o_add2_21),
	.o_y(o_sigmoid_21)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_22 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_22),
	.o_valid(sigmoid_valid_22),
	.i_x(o_add2_22),
	.o_y(o_sigmoid_22)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_23 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_23),
	.o_valid(sigmoid_valid_23),
	.i_x(o_add2_23),
	.o_y(o_sigmoid_23)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_24 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_24),
	.o_valid(sigmoid_valid_24),
	.i_x(o_add2_24),
	.o_y(o_sigmoid_24)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_25 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_25),
	.o_valid(sigmoid_valid_25),
	.i_x(o_add2_25),
	.o_y(o_sigmoid_25)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_26 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_26),
	.o_valid(sigmoid_valid_26),
	.i_x(o_add2_26),
	.o_y(o_sigmoid_26)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_27 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_27),
	.o_valid(sigmoid_valid_27),
	.i_x(o_add2_27),
	.o_y(o_sigmoid_27)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_28 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_28),
	.o_valid(sigmoid_valid_28),
	.i_x(o_add2_28),
	.o_y(o_sigmoid_28)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_29 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_29),
	.o_valid(sigmoid_valid_29),
	.i_x(o_add2_29),
	.o_y(o_sigmoid_29)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_30 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_30),
	.o_valid(sigmoid_valid_30),
	.i_x(o_add2_30),
	.o_y(o_sigmoid_30)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_31 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_31),
	.o_valid(sigmoid_valid_31),
	.i_x(o_add2_31),
	.o_y(o_sigmoid_31)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_32 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_32),
	.o_valid(sigmoid_valid_32),
	.i_x(o_add2_32),
	.o_y(o_sigmoid_32)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_33 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_33),
	.o_valid(sigmoid_valid_33),
	.i_x(o_add2_33),
	.o_y(o_sigmoid_33)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_34 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_34),
	.o_valid(sigmoid_valid_34),
	.i_x(o_add2_34),
	.o_y(o_sigmoid_34)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_35 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_35),
	.o_valid(sigmoid_valid_35),
	.i_x(o_add2_35),
	.o_y(o_sigmoid_35)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_36 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_36),
	.o_valid(sigmoid_valid_36),
	.i_x(o_add2_36),
	.o_y(o_sigmoid_36)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_37 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_37),
	.o_valid(sigmoid_valid_37),
	.i_x(o_add2_37),
	.o_y(o_sigmoid_37)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_38 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_38),
	.o_valid(sigmoid_valid_38),
	.i_x(o_add2_38),
	.o_y(o_sigmoid_38)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_39 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_39),
	.o_valid(sigmoid_valid_39),
	.i_x(o_add2_39),
	.o_y(o_sigmoid_39)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_40 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_40),
	.o_valid(sigmoid_valid_40),
	.i_x(o_add2_40),
	.o_y(o_sigmoid_40)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_41 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_41),
	.o_valid(sigmoid_valid_41),
	.i_x(o_add2_41),
	.o_y(o_sigmoid_41)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_42 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_42),
	.o_valid(sigmoid_valid_42),
	.i_x(o_add2_42),
	.o_y(o_sigmoid_42)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_43 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_43),
	.o_valid(sigmoid_valid_43),
	.i_x(o_add2_43),
	.o_y(o_sigmoid_43)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_44 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_44),
	.o_valid(sigmoid_valid_44),
	.i_x(o_add2_44),
	.o_y(o_sigmoid_44)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_45 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_45),
	.o_valid(sigmoid_valid_45),
	.i_x(o_add2_45),
	.o_y(o_sigmoid_45)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_46 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_46),
	.o_valid(sigmoid_valid_46),
	.i_x(o_add2_46),
	.o_y(o_sigmoid_46)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_47 (
	.clk(clk),
	.reset(reset),
	.i_valid(adder2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_47),
	.o_valid(sigmoid_valid_47),
	.i_x(o_add2_47),
	.o_y(o_sigmoid_47)
);

assign o_ready = adder2_ready;
assign o_valid = sigmoid_valid_0 & i_ready;
assign output_value_0 = o_sigmoid_0;
assign output_value_1 = o_sigmoid_1;
assign output_value_2 = o_sigmoid_2;
assign output_value_3 = o_sigmoid_3;
assign output_value_4 = o_sigmoid_4;
assign output_value_5 = o_sigmoid_5;
assign output_value_6 = o_sigmoid_6;
assign output_value_7 = o_sigmoid_7;
assign output_value_8 = o_sigmoid_8;
assign output_value_9 = o_sigmoid_9;
assign output_value_10 = o_sigmoid_10;
assign output_value_11 = o_sigmoid_11;
assign output_value_12 = o_sigmoid_12;
assign output_value_13 = o_sigmoid_13;
assign output_value_14 = o_sigmoid_14;
assign output_value_15 = o_sigmoid_15;
assign output_value_16 = o_sigmoid_16;
assign output_value_17 = o_sigmoid_17;
assign output_value_18 = o_sigmoid_18;
assign output_value_19 = o_sigmoid_19;
assign output_value_20 = o_sigmoid_20;
assign output_value_21 = o_sigmoid_21;
assign output_value_22 = o_sigmoid_22;
assign output_value_23 = o_sigmoid_23;
assign output_value_24 = o_sigmoid_24;
assign output_value_25 = o_sigmoid_25;
assign output_value_26 = o_sigmoid_26;
assign output_value_27 = o_sigmoid_27;
assign output_value_28 = o_sigmoid_28;
assign output_value_29 = o_sigmoid_29;
assign output_value_30 = o_sigmoid_30;
assign output_value_31 = o_sigmoid_31;
assign output_value_32 = o_sigmoid_32;
assign output_value_33 = o_sigmoid_33;
assign output_value_34 = o_sigmoid_34;
assign output_value_35 = o_sigmoid_35;
assign output_value_36 = o_sigmoid_36;
assign output_value_37 = o_sigmoid_37;
assign output_value_38 = o_sigmoid_38;
assign output_value_39 = o_sigmoid_39;
assign output_value_40 = o_sigmoid_40;
assign output_value_41 = o_sigmoid_41;
assign output_value_42 = o_sigmoid_42;
assign output_value_43 = o_sigmoid_43;
assign output_value_44 = o_sigmoid_44;
assign output_value_45 = o_sigmoid_45;
assign output_value_46 = o_sigmoid_46;
assign output_value_47 = o_sigmoid_47;

endmodule
module sigmoid_core_18_18_10_32_1 ( 
	input clk,
	input reset,
	input i_valid,
	input i_ready,
	output o_ready,
	output o_valid,
	input [17:0] i_x,
	output [17:0] o_y
);

reg [12:0] k_list_0;
reg [12:0] b_list_0;
reg [12:0] k_list_1;
reg [12:0] b_list_1;
reg [12:0] k_list_2;
reg [12:0] b_list_2;
reg [12:0] k_list_3;
reg [12:0] b_list_3;
reg [12:0] k_list_4;
reg [12:0] b_list_4;
reg [12:0] k_list_5;
reg [12:0] b_list_5;
reg [12:0] k_list_6;
reg [12:0] b_list_6;
reg [12:0] k_list_7;
reg [12:0] b_list_7;
reg [12:0] k_list_8;
reg [12:0] b_list_8;
reg [12:0] k_list_9;
reg [12:0] b_list_9;
reg [12:0] k_list_10;
reg [12:0] b_list_10;
reg [12:0] k_list_11;
reg [12:0] b_list_11;
reg [12:0] k_list_12;
reg [12:0] b_list_12;
reg [12:0] k_list_13;
reg [12:0] b_list_13;
reg [12:0] k_list_14;
reg [12:0] b_list_14;
reg [12:0] k_list_15;
reg [12:0] b_list_15;
reg [12:0] k_list_16;
reg [12:0] b_list_16;
reg [12:0] k_list_17;
reg [12:0] b_list_17;
reg [12:0] k_list_18;
reg [12:0] b_list_18;
reg [12:0] k_list_19;
reg [12:0] b_list_19;
reg [12:0] k_list_20;
reg [12:0] b_list_20;
reg [12:0] k_list_21;
reg [12:0] b_list_21;
reg [12:0] k_list_22;
reg [12:0] b_list_22;
reg [12:0] k_list_23;
reg [12:0] b_list_23;
reg [12:0] k_list_24;
reg [12:0] b_list_24;
reg [12:0] k_list_25;
reg [12:0] b_list_25;
reg [12:0] k_list_26;
reg [12:0] b_list_26;
reg [12:0] k_list_27;
reg [12:0] b_list_27;
reg [12:0] k_list_28;
reg [12:0] b_list_28;
reg [12:0] k_list_29;
reg [12:0] b_list_29;
reg [12:0] k_list_30;
reg [12:0] b_list_30;
reg [12:0] k_list_31;
reg [12:0] b_list_31;

always @ (posedge clk) begin
	k_list_0  <= 13'b0000111111101;
	k_list_1  <= 13'b0000111101110;
	k_list_2  <= 13'b0000111010001;
	k_list_3  <= 13'b0000110101001;
	k_list_4  <= 13'b0000101111011;
	k_list_5  <= 13'b0000101001010;
	k_list_6  <= 13'b0000100011010;
	k_list_7  <= 13'b0000011101100;
	k_list_8  <= 13'b0000011000011;
	k_list_9  <= 13'b0000010100000;
	k_list_10 <= 13'b0000010000001;
	k_list_11 <= 13'b0000001101000;
	k_list_12 <= 13'b0000001010011;
	k_list_13 <= 13'b0000001000010;
	k_list_14 <= 13'b0000000110100;
	k_list_15 <= 13'b0000000101001;
	k_list_16 <= 13'b0000000100000;
	k_list_17 <= 13'b0000000011001;
	k_list_18 <= 13'b0000000010100;
	k_list_19 <= 13'b0000000001111;
	k_list_20 <= 13'b0000000001100;
	k_list_21 <= 13'b0000000001001;
	k_list_22 <= 13'b0000000000111;
	k_list_23 <= 13'b0000000000110;
	k_list_24 <= 13'b0000000000100;
	k_list_25 <= 13'b0000000000011;
	k_list_26 <= 13'b0000000000011;
	k_list_27 <= 13'b0000000000010;
	k_list_28 <= 13'b0000000000010;
	k_list_29 <= 13'b0000000000001;
	k_list_30 <= 13'b0000000000001;
	k_list_31 <= 13'b0000000000001;
	b_list_0  <= 13'b0010000000000;
	b_list_1  <= 13'b0010000000100;
	b_list_2  <= 13'b0010000010010;
	b_list_3  <= 13'b0010000110000;
	b_list_4  <= 13'b0010001011110;
	b_list_5  <= 13'b0010010011011;
	b_list_6  <= 13'b0010011100100;
	b_list_7  <= 13'b0010100110011;
	b_list_8  <= 13'b0010110000101;
	b_list_9  <= 13'b0010111010101;
	b_list_10 <= 13'b0011000100010;
	b_list_11 <= 13'b0011001101000;
	b_list_12 <= 13'b0011010100111;
	b_list_13 <= 13'b0011011011110;
	b_list_14 <= 13'b0011100001110;
	b_list_15 <= 13'b0011100111000;
	b_list_16 <= 13'b0011101011011;
	b_list_17 <= 13'b0011101111000;
	b_list_18 <= 13'b0011110010001;
	b_list_19 <= 13'b0011110100101;
	b_list_20 <= 13'b0011110110110;
	b_list_21 <= 13'b0011111000100;
	b_list_22 <= 13'b0011111001111;
	b_list_23 <= 13'b0011111011001;
	b_list_24 <= 13'b0011111100000;
	b_list_25 <= 13'b0011111100110;
	b_list_26 <= 13'b0011111101011;
	b_list_27 <= 13'b0011111101111;
	b_list_28 <= 13'b0011111110011;
	b_list_29 <= 13'b0011111110101;
	b_list_30 <= 13'b0011111110111;
	b_list_31 <= 13'b0011111111001;
end
reg [17:0] x;
reg [17:0] y;
reg valid_x, valid_y, enable;
wire [4:0] sel_k_b;

wire abs_valid, round_valid, mult_valid, compute_valid;
reg use_boundary_value;
reg [12:0] mac_ay;
reg [22:0] mac_az;
reg is_x_negative;
wire is_x_negative_hold;
wire [17:0] abs_x;
wire [17:0] x_partial;
reg [31:0] y_compute;
wire [31:0] x_k_plus_b;
wire [31:0] y_rounded;

assign x_partial = (abs_x >> 8);
assign sel_k_b = x_partial [4:0];

reg [12:0] selected_k, selected_b;
always @ (*) begin
	if (sel_k_b == 0) begin
		selected_k <= k_list_0;
		selected_b <= b_list_0;
	end else if (sel_k_b == 1) begin
		selected_k <= k_list_1;
		selected_b <= b_list_1;
	end else if (sel_k_b == 2) begin
		selected_k <= k_list_2;
		selected_b <= b_list_2;
	end else if (sel_k_b == 3) begin
		selected_k <= k_list_3;
		selected_b <= b_list_3;
	end else if (sel_k_b == 4) begin
		selected_k <= k_list_4;
		selected_b <= b_list_4;
	end else if (sel_k_b == 5) begin
		selected_k <= k_list_5;
		selected_b <= b_list_5;
	end else if (sel_k_b == 6) begin
		selected_k <= k_list_6;
		selected_b <= b_list_6;
	end else if (sel_k_b == 7) begin
		selected_k <= k_list_7;
		selected_b <= b_list_7;
	end else if (sel_k_b == 8) begin
		selected_k <= k_list_8;
		selected_b <= b_list_8;
	end else if (sel_k_b == 9) begin
		selected_k <= k_list_9;
		selected_b <= b_list_9;
	end else if (sel_k_b == 10) begin
		selected_k <= k_list_10;
		selected_b <= b_list_10;
	end else if (sel_k_b == 11) begin
		selected_k <= k_list_11;
		selected_b <= b_list_11;
	end else if (sel_k_b == 12) begin
		selected_k <= k_list_12;
		selected_b <= b_list_12;
	end else if (sel_k_b == 13) begin
		selected_k <= k_list_13;
		selected_b <= b_list_13;
	end else if (sel_k_b == 14) begin
		selected_k <= k_list_14;
		selected_b <= b_list_14;
	end else if (sel_k_b == 15) begin
		selected_k <= k_list_15;
		selected_b <= b_list_15;
	end else if (sel_k_b == 16) begin
		selected_k <= k_list_16;
		selected_b <= b_list_16;
	end else if (sel_k_b == 17) begin
		selected_k <= k_list_17;
		selected_b <= b_list_17;
	end else if (sel_k_b == 18) begin
		selected_k <= k_list_18;
		selected_b <= b_list_18;
	end else if (sel_k_b == 19) begin
		selected_k <= k_list_19;
		selected_b <= b_list_19;
	end else if (sel_k_b == 20) begin
		selected_k <= k_list_20;
		selected_b <= b_list_20;
	end else if (sel_k_b == 21) begin
		selected_k <= k_list_21;
		selected_b <= b_list_21;
	end else if (sel_k_b == 22) begin
		selected_k <= k_list_22;
		selected_b <= b_list_22;
	end else if (sel_k_b == 23) begin
		selected_k <= k_list_23;
		selected_b <= b_list_23;
	end else if (sel_k_b == 24) begin
		selected_k <= k_list_24;
		selected_b <= b_list_24;
	end else if (sel_k_b == 25) begin
		selected_k <= k_list_25;
		selected_b <= b_list_25;
	end else if (sel_k_b == 26) begin
		selected_k <= k_list_26;
		selected_b <= b_list_26;
	end else if (sel_k_b == 27) begin
		selected_k <= k_list_27;
		selected_b <= b_list_27;
	end else if (sel_k_b == 28) begin
		selected_k <= k_list_28;
		selected_b <= b_list_28;
	end else if (sel_k_b == 29) begin
		selected_k <= k_list_29;
		selected_b <= b_list_29;
	end else if (sel_k_b == 30) begin
		selected_k <= k_list_30;
		selected_b <= b_list_30;
	end else if (sel_k_b == 31) begin
		selected_k <= k_list_31;
		selected_b <= b_list_31;
	end else begin
		selected_k <= 0;
		selected_b <= 0;
	end
end
always @ (*) begin
	if (abs_x >= 8192) begin
		use_boundary_value <= 1'b1;
		mac_ay <= 0;
		mac_az <= 2097152;
	end else begin
		use_boundary_value <= 1'b0;
		mac_ay <= selected_k;
		mac_az <= (selected_b << 10);
	end
end
dsp_signed_mac_18_13_23_32 dsp_signed_mac_18_13_23_32_inst (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.ax(abs_x),
	.ay(mac_ay),
	.az(mac_az),
	.i_valid(abs_valid),
	.o_valid(compute_valid),
	.resulta(x_k_plus_b)
);

shift_register_unit_1_3 shift_register_unit_1_3_inst (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(is_x_negative),
	.out(is_x_negative_hold)
);

abs_unit_18 abs_unit_18_inst (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(valid_x),
	.in(x),
	.o_valid(abs_valid),
	.out(abs_x)
);

fp_rounding_unit_1_32_11 fp_rounding_unit_1_32_11_inst (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(compute_valid),
	.in(y_compute),
	.o_valid(round_valid),
	.out(y_rounded)
);

always @ (*) begin
	if (is_x_negative_hold)
		y_compute = 2097152 - x_k_plus_b;
	else 
		y_compute = x_k_plus_b;
	enable = i_ready;
end
always @ (posedge clk) begin
	if (reset) begin 
		valid_x <= 1'b0;
		valid_y <= 1'b0;
		x <= 0;
		y <= 0;
	end else if (enable) begin 
		valid_x <= i_valid;
		valid_y <= round_valid;
		x <= i_x;
		if (x[17] == 1'b1)
			is_x_negative <= 1'b1;
		else
			is_x_negative <= 1'b0;
		y <= y_rounded[17:0];
	end
end

assign o_y = y;
assign o_ready = i_ready;
assign o_valid = valid_y & i_ready;

endmodule

module abs_unit_18 (
	input clk,
	input reset,
	input enable,
	input i_valid,
	input [17:0] in,
	output o_valid,
	output [17:0] out
);

reg [17:0] abs_result;

always @ (*) begin
	if (in[17] == 1'b1)
		abs_result = -in;
	else 
		abs_result = in;
end

reg valid_reg;
reg [17:0] out_reg;
always @ (posedge clk) begin
	if (reset) begin
		valid_reg <= 1'b0;
		out_reg <= 0;
	end else if (enable) begin
		valid_reg <= i_valid;
		out_reg <= abs_result;
	end
end
assign out = out_reg;
assign o_valid = valid_reg;
endmodule

module dsp_signed_mac_18_13_23_32 (
	input clk,
	input reset,
	input ena,
	input i_valid,
	input [17:0] ax,
	input [12:0] ay,
	input [22:0] az,
	output o_valid,
	output [31:0] resulta
);

reg [17:0] reg_ax;
reg [12:0] reg_ay;
reg [22:0] reg_az;
reg [31:0] reg_res;
always @ (posedge clk) begin
	if (reset) begin
		reg_ax  <= 0;
		reg_ay  <= 0;
		reg_az  <= 0;
		reg_res <= 0;
	end else begin
		reg_ax  <= ax;
		reg_ay  <= ay;
		reg_az  <= az;
		reg_res <= (reg_ax * reg_ay) + reg_az;
	end
end

assign resulta = reg_res;
reg input_valid, result_valid, output_valid;
always @ (posedge clk) begin
	if (reset) begin
		output_valid <= 1'b0;
		input_valid <= 1'b0;
		result_valid <= 1'b0;
	end else if (ena) begin
		input_valid <= i_valid;
		result_valid <= input_valid;
		output_valid <= result_valid;
	end
end
assign o_valid = output_valid;
endmodule

module elementwise_add_core_18_18_48 (
	input clk,
	input reset,
	input i_valid,
	input i_ready,
	input [17:0] i_A_0,
	input [17:0] i_B_0,
	output [17:0] o_C_0,
	input [17:0] i_A_1,
	input [17:0] i_B_1,
	output [17:0] o_C_1,
	input [17:0] i_A_2,
	input [17:0] i_B_2,
	output [17:0] o_C_2,
	input [17:0] i_A_3,
	input [17:0] i_B_3,
	output [17:0] o_C_3,
	input [17:0] i_A_4,
	input [17:0] i_B_4,
	output [17:0] o_C_4,
	input [17:0] i_A_5,
	input [17:0] i_B_5,
	output [17:0] o_C_5,
	input [17:0] i_A_6,
	input [17:0] i_B_6,
	output [17:0] o_C_6,
	input [17:0] i_A_7,
	input [17:0] i_B_7,
	output [17:0] o_C_7,
	input [17:0] i_A_8,
	input [17:0] i_B_8,
	output [17:0] o_C_8,
	input [17:0] i_A_9,
	input [17:0] i_B_9,
	output [17:0] o_C_9,
	input [17:0] i_A_10,
	input [17:0] i_B_10,
	output [17:0] o_C_10,
	input [17:0] i_A_11,
	input [17:0] i_B_11,
	output [17:0] o_C_11,
	input [17:0] i_A_12,
	input [17:0] i_B_12,
	output [17:0] o_C_12,
	input [17:0] i_A_13,
	input [17:0] i_B_13,
	output [17:0] o_C_13,
	input [17:0] i_A_14,
	input [17:0] i_B_14,
	output [17:0] o_C_14,
	input [17:0] i_A_15,
	input [17:0] i_B_15,
	output [17:0] o_C_15,
	input [17:0] i_A_16,
	input [17:0] i_B_16,
	output [17:0] o_C_16,
	input [17:0] i_A_17,
	input [17:0] i_B_17,
	output [17:0] o_C_17,
	input [17:0] i_A_18,
	input [17:0] i_B_18,
	output [17:0] o_C_18,
	input [17:0] i_A_19,
	input [17:0] i_B_19,
	output [17:0] o_C_19,
	input [17:0] i_A_20,
	input [17:0] i_B_20,
	output [17:0] o_C_20,
	input [17:0] i_A_21,
	input [17:0] i_B_21,
	output [17:0] o_C_21,
	input [17:0] i_A_22,
	input [17:0] i_B_22,
	output [17:0] o_C_22,
	input [17:0] i_A_23,
	input [17:0] i_B_23,
	output [17:0] o_C_23,
	input [17:0] i_A_24,
	input [17:0] i_B_24,
	output [17:0] o_C_24,
	input [17:0] i_A_25,
	input [17:0] i_B_25,
	output [17:0] o_C_25,
	input [17:0] i_A_26,
	input [17:0] i_B_26,
	output [17:0] o_C_26,
	input [17:0] i_A_27,
	input [17:0] i_B_27,
	output [17:0] o_C_27,
	input [17:0] i_A_28,
	input [17:0] i_B_28,
	output [17:0] o_C_28,
	input [17:0] i_A_29,
	input [17:0] i_B_29,
	output [17:0] o_C_29,
	input [17:0] i_A_30,
	input [17:0] i_B_30,
	output [17:0] o_C_30,
	input [17:0] i_A_31,
	input [17:0] i_B_31,
	output [17:0] o_C_31,
	input [17:0] i_A_32,
	input [17:0] i_B_32,
	output [17:0] o_C_32,
	input [17:0] i_A_33,
	input [17:0] i_B_33,
	output [17:0] o_C_33,
	input [17:0] i_A_34,
	input [17:0] i_B_34,
	output [17:0] o_C_34,
	input [17:0] i_A_35,
	input [17:0] i_B_35,
	output [17:0] o_C_35,
	input [17:0] i_A_36,
	input [17:0] i_B_36,
	output [17:0] o_C_36,
	input [17:0] i_A_37,
	input [17:0] i_B_37,
	output [17:0] o_C_37,
	input [17:0] i_A_38,
	input [17:0] i_B_38,
	output [17:0] o_C_38,
	input [17:0] i_A_39,
	input [17:0] i_B_39,
	output [17:0] o_C_39,
	input [17:0] i_A_40,
	input [17:0] i_B_40,
	output [17:0] o_C_40,
	input [17:0] i_A_41,
	input [17:0] i_B_41,
	output [17:0] o_C_41,
	input [17:0] i_A_42,
	input [17:0] i_B_42,
	output [17:0] o_C_42,
	input [17:0] i_A_43,
	input [17:0] i_B_43,
	output [17:0] o_C_43,
	input [17:0] i_A_44,
	input [17:0] i_B_44,
	output [17:0] o_C_44,
	input [17:0] i_A_45,
	input [17:0] i_B_45,
	output [17:0] o_C_45,
	input [17:0] i_A_46,
	input [17:0] i_B_46,
	output [17:0] o_C_46,
	input [17:0] i_A_47,
	input [17:0] i_B_47,
	output [17:0] o_C_47,
	output o_valid,
	output o_ready
);

reg [17:0] reg_A_0;
reg [17:0] reg_B_0;
reg [17:0] reg_C_0;
reg [17:0] reg_A_1;
reg [17:0] reg_B_1;
reg [17:0] reg_C_1;
reg [17:0] reg_A_2;
reg [17:0] reg_B_2;
reg [17:0] reg_C_2;
reg [17:0] reg_A_3;
reg [17:0] reg_B_3;
reg [17:0] reg_C_3;
reg [17:0] reg_A_4;
reg [17:0] reg_B_4;
reg [17:0] reg_C_4;
reg [17:0] reg_A_5;
reg [17:0] reg_B_5;
reg [17:0] reg_C_5;
reg [17:0] reg_A_6;
reg [17:0] reg_B_6;
reg [17:0] reg_C_6;
reg [17:0] reg_A_7;
reg [17:0] reg_B_7;
reg [17:0] reg_C_7;
reg [17:0] reg_A_8;
reg [17:0] reg_B_8;
reg [17:0] reg_C_8;
reg [17:0] reg_A_9;
reg [17:0] reg_B_9;
reg [17:0] reg_C_9;
reg [17:0] reg_A_10;
reg [17:0] reg_B_10;
reg [17:0] reg_C_10;
reg [17:0] reg_A_11;
reg [17:0] reg_B_11;
reg [17:0] reg_C_11;
reg [17:0] reg_A_12;
reg [17:0] reg_B_12;
reg [17:0] reg_C_12;
reg [17:0] reg_A_13;
reg [17:0] reg_B_13;
reg [17:0] reg_C_13;
reg [17:0] reg_A_14;
reg [17:0] reg_B_14;
reg [17:0] reg_C_14;
reg [17:0] reg_A_15;
reg [17:0] reg_B_15;
reg [17:0] reg_C_15;
reg [17:0] reg_A_16;
reg [17:0] reg_B_16;
reg [17:0] reg_C_16;
reg [17:0] reg_A_17;
reg [17:0] reg_B_17;
reg [17:0] reg_C_17;
reg [17:0] reg_A_18;
reg [17:0] reg_B_18;
reg [17:0] reg_C_18;
reg [17:0] reg_A_19;
reg [17:0] reg_B_19;
reg [17:0] reg_C_19;
reg [17:0] reg_A_20;
reg [17:0] reg_B_20;
reg [17:0] reg_C_20;
reg [17:0] reg_A_21;
reg [17:0] reg_B_21;
reg [17:0] reg_C_21;
reg [17:0] reg_A_22;
reg [17:0] reg_B_22;
reg [17:0] reg_C_22;
reg [17:0] reg_A_23;
reg [17:0] reg_B_23;
reg [17:0] reg_C_23;
reg [17:0] reg_A_24;
reg [17:0] reg_B_24;
reg [17:0] reg_C_24;
reg [17:0] reg_A_25;
reg [17:0] reg_B_25;
reg [17:0] reg_C_25;
reg [17:0] reg_A_26;
reg [17:0] reg_B_26;
reg [17:0] reg_C_26;
reg [17:0] reg_A_27;
reg [17:0] reg_B_27;
reg [17:0] reg_C_27;
reg [17:0] reg_A_28;
reg [17:0] reg_B_28;
reg [17:0] reg_C_28;
reg [17:0] reg_A_29;
reg [17:0] reg_B_29;
reg [17:0] reg_C_29;
reg [17:0] reg_A_30;
reg [17:0] reg_B_30;
reg [17:0] reg_C_30;
reg [17:0] reg_A_31;
reg [17:0] reg_B_31;
reg [17:0] reg_C_31;
reg [17:0] reg_A_32;
reg [17:0] reg_B_32;
reg [17:0] reg_C_32;
reg [17:0] reg_A_33;
reg [17:0] reg_B_33;
reg [17:0] reg_C_33;
reg [17:0] reg_A_34;
reg [17:0] reg_B_34;
reg [17:0] reg_C_34;
reg [17:0] reg_A_35;
reg [17:0] reg_B_35;
reg [17:0] reg_C_35;
reg [17:0] reg_A_36;
reg [17:0] reg_B_36;
reg [17:0] reg_C_36;
reg [17:0] reg_A_37;
reg [17:0] reg_B_37;
reg [17:0] reg_C_37;
reg [17:0] reg_A_38;
reg [17:0] reg_B_38;
reg [17:0] reg_C_38;
reg [17:0] reg_A_39;
reg [17:0] reg_B_39;
reg [17:0] reg_C_39;
reg [17:0] reg_A_40;
reg [17:0] reg_B_40;
reg [17:0] reg_C_40;
reg [17:0] reg_A_41;
reg [17:0] reg_B_41;
reg [17:0] reg_C_41;
reg [17:0] reg_A_42;
reg [17:0] reg_B_42;
reg [17:0] reg_C_42;
reg [17:0] reg_A_43;
reg [17:0] reg_B_43;
reg [17:0] reg_C_43;
reg [17:0] reg_A_44;
reg [17:0] reg_B_44;
reg [17:0] reg_C_44;
reg [17:0] reg_A_45;
reg [17:0] reg_B_45;
reg [17:0] reg_C_45;
reg [17:0] reg_A_46;
reg [17:0] reg_B_46;
reg [17:0] reg_C_46;
reg [17:0] reg_A_47;
reg [17:0] reg_B_47;
reg [17:0] reg_C_47;

reg valid_A_B, valid_C;
wire enable;
assign enable = i_ready;

always @ (posedge clk) begin
	if (reset) begin
		valid_A_B <= 1'b0;
		valid_C <= 1'b0;
		reg_A_0 <= 0;
		reg_B_0 <= 0;
		reg_C_0 <= 0;
		reg_A_1 <= 0;
		reg_B_1 <= 0;
		reg_C_1 <= 0;
		reg_A_2 <= 0;
		reg_B_2 <= 0;
		reg_C_2 <= 0;
		reg_A_3 <= 0;
		reg_B_3 <= 0;
		reg_C_3 <= 0;
		reg_A_4 <= 0;
		reg_B_4 <= 0;
		reg_C_4 <= 0;
		reg_A_5 <= 0;
		reg_B_5 <= 0;
		reg_C_5 <= 0;
		reg_A_6 <= 0;
		reg_B_6 <= 0;
		reg_C_6 <= 0;
		reg_A_7 <= 0;
		reg_B_7 <= 0;
		reg_C_7 <= 0;
		reg_A_8 <= 0;
		reg_B_8 <= 0;
		reg_C_8 <= 0;
		reg_A_9 <= 0;
		reg_B_9 <= 0;
		reg_C_9 <= 0;
		reg_A_10 <= 0;
		reg_B_10 <= 0;
		reg_C_10 <= 0;
		reg_A_11 <= 0;
		reg_B_11 <= 0;
		reg_C_11 <= 0;
		reg_A_12 <= 0;
		reg_B_12 <= 0;
		reg_C_12 <= 0;
		reg_A_13 <= 0;
		reg_B_13 <= 0;
		reg_C_13 <= 0;
		reg_A_14 <= 0;
		reg_B_14 <= 0;
		reg_C_14 <= 0;
		reg_A_15 <= 0;
		reg_B_15 <= 0;
		reg_C_15 <= 0;
		reg_A_16 <= 0;
		reg_B_16 <= 0;
		reg_C_16 <= 0;
		reg_A_17 <= 0;
		reg_B_17 <= 0;
		reg_C_17 <= 0;
		reg_A_18 <= 0;
		reg_B_18 <= 0;
		reg_C_18 <= 0;
		reg_A_19 <= 0;
		reg_B_19 <= 0;
		reg_C_19 <= 0;
		reg_A_20 <= 0;
		reg_B_20 <= 0;
		reg_C_20 <= 0;
		reg_A_21 <= 0;
		reg_B_21 <= 0;
		reg_C_21 <= 0;
		reg_A_22 <= 0;
		reg_B_22 <= 0;
		reg_C_22 <= 0;
		reg_A_23 <= 0;
		reg_B_23 <= 0;
		reg_C_23 <= 0;
		reg_A_24 <= 0;
		reg_B_24 <= 0;
		reg_C_24 <= 0;
		reg_A_25 <= 0;
		reg_B_25 <= 0;
		reg_C_25 <= 0;
		reg_A_26 <= 0;
		reg_B_26 <= 0;
		reg_C_26 <= 0;
		reg_A_27 <= 0;
		reg_B_27 <= 0;
		reg_C_27 <= 0;
		reg_A_28 <= 0;
		reg_B_28 <= 0;
		reg_C_28 <= 0;
		reg_A_29 <= 0;
		reg_B_29 <= 0;
		reg_C_29 <= 0;
		reg_A_30 <= 0;
		reg_B_30 <= 0;
		reg_C_30 <= 0;
		reg_A_31 <= 0;
		reg_B_31 <= 0;
		reg_C_31 <= 0;
		reg_A_32 <= 0;
		reg_B_32 <= 0;
		reg_C_32 <= 0;
		reg_A_33 <= 0;
		reg_B_33 <= 0;
		reg_C_33 <= 0;
		reg_A_34 <= 0;
		reg_B_34 <= 0;
		reg_C_34 <= 0;
		reg_A_35 <= 0;
		reg_B_35 <= 0;
		reg_C_35 <= 0;
		reg_A_36 <= 0;
		reg_B_36 <= 0;
		reg_C_36 <= 0;
		reg_A_37 <= 0;
		reg_B_37 <= 0;
		reg_C_37 <= 0;
		reg_A_38 <= 0;
		reg_B_38 <= 0;
		reg_C_38 <= 0;
		reg_A_39 <= 0;
		reg_B_39 <= 0;
		reg_C_39 <= 0;
		reg_A_40 <= 0;
		reg_B_40 <= 0;
		reg_C_40 <= 0;
		reg_A_41 <= 0;
		reg_B_41 <= 0;
		reg_C_41 <= 0;
		reg_A_42 <= 0;
		reg_B_42 <= 0;
		reg_C_42 <= 0;
		reg_A_43 <= 0;
		reg_B_43 <= 0;
		reg_C_43 <= 0;
		reg_A_44 <= 0;
		reg_B_44 <= 0;
		reg_C_44 <= 0;
		reg_A_45 <= 0;
		reg_B_45 <= 0;
		reg_C_45 <= 0;
		reg_A_46 <= 0;
		reg_B_46 <= 0;
		reg_C_46 <= 0;
		reg_A_47 <= 0;
		reg_B_47 <= 0;
		reg_C_47 <= 0;
	end else if (enable) begin
		reg_A_0 <= i_A_0;
		reg_B_0 <= i_B_0;
		reg_C_0 <= reg_A_0 + reg_B_0;
		reg_A_1 <= i_A_1;
		reg_B_1 <= i_B_1;
		reg_C_1 <= reg_A_1 + reg_B_1;
		reg_A_2 <= i_A_2;
		reg_B_2 <= i_B_2;
		reg_C_2 <= reg_A_2 + reg_B_2;
		reg_A_3 <= i_A_3;
		reg_B_3 <= i_B_3;
		reg_C_3 <= reg_A_3 + reg_B_3;
		reg_A_4 <= i_A_4;
		reg_B_4 <= i_B_4;
		reg_C_4 <= reg_A_4 + reg_B_4;
		reg_A_5 <= i_A_5;
		reg_B_5 <= i_B_5;
		reg_C_5 <= reg_A_5 + reg_B_5;
		reg_A_6 <= i_A_6;
		reg_B_6 <= i_B_6;
		reg_C_6 <= reg_A_6 + reg_B_6;
		reg_A_7 <= i_A_7;
		reg_B_7 <= i_B_7;
		reg_C_7 <= reg_A_7 + reg_B_7;
		reg_A_8 <= i_A_8;
		reg_B_8 <= i_B_8;
		reg_C_8 <= reg_A_8 + reg_B_8;
		reg_A_9 <= i_A_9;
		reg_B_9 <= i_B_9;
		reg_C_9 <= reg_A_9 + reg_B_9;
		reg_A_10 <= i_A_10;
		reg_B_10 <= i_B_10;
		reg_C_10 <= reg_A_10 + reg_B_10;
		reg_A_11 <= i_A_11;
		reg_B_11 <= i_B_11;
		reg_C_11 <= reg_A_11 + reg_B_11;
		reg_A_12 <= i_A_12;
		reg_B_12 <= i_B_12;
		reg_C_12 <= reg_A_12 + reg_B_12;
		reg_A_13 <= i_A_13;
		reg_B_13 <= i_B_13;
		reg_C_13 <= reg_A_13 + reg_B_13;
		reg_A_14 <= i_A_14;
		reg_B_14 <= i_B_14;
		reg_C_14 <= reg_A_14 + reg_B_14;
		reg_A_15 <= i_A_15;
		reg_B_15 <= i_B_15;
		reg_C_15 <= reg_A_15 + reg_B_15;
		reg_A_16 <= i_A_16;
		reg_B_16 <= i_B_16;
		reg_C_16 <= reg_A_16 + reg_B_16;
		reg_A_17 <= i_A_17;
		reg_B_17 <= i_B_17;
		reg_C_17 <= reg_A_17 + reg_B_17;
		reg_A_18 <= i_A_18;
		reg_B_18 <= i_B_18;
		reg_C_18 <= reg_A_18 + reg_B_18;
		reg_A_19 <= i_A_19;
		reg_B_19 <= i_B_19;
		reg_C_19 <= reg_A_19 + reg_B_19;
		reg_A_20 <= i_A_20;
		reg_B_20 <= i_B_20;
		reg_C_20 <= reg_A_20 + reg_B_20;
		reg_A_21 <= i_A_21;
		reg_B_21 <= i_B_21;
		reg_C_21 <= reg_A_21 + reg_B_21;
		reg_A_22 <= i_A_22;
		reg_B_22 <= i_B_22;
		reg_C_22 <= reg_A_22 + reg_B_22;
		reg_A_23 <= i_A_23;
		reg_B_23 <= i_B_23;
		reg_C_23 <= reg_A_23 + reg_B_23;
		reg_A_24 <= i_A_24;
		reg_B_24 <= i_B_24;
		reg_C_24 <= reg_A_24 + reg_B_24;
		reg_A_25 <= i_A_25;
		reg_B_25 <= i_B_25;
		reg_C_25 <= reg_A_25 + reg_B_25;
		reg_A_26 <= i_A_26;
		reg_B_26 <= i_B_26;
		reg_C_26 <= reg_A_26 + reg_B_26;
		reg_A_27 <= i_A_27;
		reg_B_27 <= i_B_27;
		reg_C_27 <= reg_A_27 + reg_B_27;
		reg_A_28 <= i_A_28;
		reg_B_28 <= i_B_28;
		reg_C_28 <= reg_A_28 + reg_B_28;
		reg_A_29 <= i_A_29;
		reg_B_29 <= i_B_29;
		reg_C_29 <= reg_A_29 + reg_B_29;
		reg_A_30 <= i_A_30;
		reg_B_30 <= i_B_30;
		reg_C_30 <= reg_A_30 + reg_B_30;
		reg_A_31 <= i_A_31;
		reg_B_31 <= i_B_31;
		reg_C_31 <= reg_A_31 + reg_B_31;
		reg_A_32 <= i_A_32;
		reg_B_32 <= i_B_32;
		reg_C_32 <= reg_A_32 + reg_B_32;
		reg_A_33 <= i_A_33;
		reg_B_33 <= i_B_33;
		reg_C_33 <= reg_A_33 + reg_B_33;
		reg_A_34 <= i_A_34;
		reg_B_34 <= i_B_34;
		reg_C_34 <= reg_A_34 + reg_B_34;
		reg_A_35 <= i_A_35;
		reg_B_35 <= i_B_35;
		reg_C_35 <= reg_A_35 + reg_B_35;
		reg_A_36 <= i_A_36;
		reg_B_36 <= i_B_36;
		reg_C_36 <= reg_A_36 + reg_B_36;
		reg_A_37 <= i_A_37;
		reg_B_37 <= i_B_37;
		reg_C_37 <= reg_A_37 + reg_B_37;
		reg_A_38 <= i_A_38;
		reg_B_38 <= i_B_38;
		reg_C_38 <= reg_A_38 + reg_B_38;
		reg_A_39 <= i_A_39;
		reg_B_39 <= i_B_39;
		reg_C_39 <= reg_A_39 + reg_B_39;
		reg_A_40 <= i_A_40;
		reg_B_40 <= i_B_40;
		reg_C_40 <= reg_A_40 + reg_B_40;
		reg_A_41 <= i_A_41;
		reg_B_41 <= i_B_41;
		reg_C_41 <= reg_A_41 + reg_B_41;
		reg_A_42 <= i_A_42;
		reg_B_42 <= i_B_42;
		reg_C_42 <= reg_A_42 + reg_B_42;
		reg_A_43 <= i_A_43;
		reg_B_43 <= i_B_43;
		reg_C_43 <= reg_A_43 + reg_B_43;
		reg_A_44 <= i_A_44;
		reg_B_44 <= i_B_44;
		reg_C_44 <= reg_A_44 + reg_B_44;
		reg_A_45 <= i_A_45;
		reg_B_45 <= i_B_45;
		reg_C_45 <= reg_A_45 + reg_B_45;
		reg_A_46 <= i_A_46;
		reg_B_46 <= i_B_46;
		reg_C_46 <= reg_A_46 + reg_B_46;
		reg_A_47 <= i_A_47;
		reg_B_47 <= i_B_47;
		reg_C_47 <= reg_A_47 + reg_B_47;
		valid_A_B <= i_valid;
		valid_C <= valid_A_B;
	end
end

assign o_C_0 = reg_C_0;
assign o_C_1 = reg_C_1;
assign o_C_2 = reg_C_2;
assign o_C_3 = reg_C_3;
assign o_C_4 = reg_C_4;
assign o_C_5 = reg_C_5;
assign o_C_6 = reg_C_6;
assign o_C_7 = reg_C_7;
assign o_C_8 = reg_C_8;
assign o_C_9 = reg_C_9;
assign o_C_10 = reg_C_10;
assign o_C_11 = reg_C_11;
assign o_C_12 = reg_C_12;
assign o_C_13 = reg_C_13;
assign o_C_14 = reg_C_14;
assign o_C_15 = reg_C_15;
assign o_C_16 = reg_C_16;
assign o_C_17 = reg_C_17;
assign o_C_18 = reg_C_18;
assign o_C_19 = reg_C_19;
assign o_C_20 = reg_C_20;
assign o_C_21 = reg_C_21;
assign o_C_22 = reg_C_22;
assign o_C_23 = reg_C_23;
assign o_C_24 = reg_C_24;
assign o_C_25 = reg_C_25;
assign o_C_26 = reg_C_26;
assign o_C_27 = reg_C_27;
assign o_C_28 = reg_C_28;
assign o_C_29 = reg_C_29;
assign o_C_30 = reg_C_30;
assign o_C_31 = reg_C_31;
assign o_C_32 = reg_C_32;
assign o_C_33 = reg_C_33;
assign o_C_34 = reg_C_34;
assign o_C_35 = reg_C_35;
assign o_C_36 = reg_C_36;
assign o_C_37 = reg_C_37;
assign o_C_38 = reg_C_38;
assign o_C_39 = reg_C_39;
assign o_C_40 = reg_C_40;
assign o_C_41 = reg_C_41;
assign o_C_42 = reg_C_42;
assign o_C_43 = reg_C_43;
assign o_C_44 = reg_C_44;
assign o_C_45 = reg_C_45;
assign o_C_46 = reg_C_46;
assign o_C_47 = reg_C_47;
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule

module fp_rounding_unit_1_32_11 (
	input clk,
	input reset,
	input enable,
	input i_valid,
	input [31:0] in,
	output [31:0] out,
	output o_valid
);

reg [31:0] rounded_result;
reg [31:0] floor;
reg [31:0] ceil;
reg is_ceil;
reg floor_ceil_valid;

always @ (*) begin
	if (is_ceil) begin
		rounded_result = ceil;
	end else begin
		rounded_result = floor;
	end
end

reg valid_reg;
reg [31:0] out_reg;
always @ (posedge clk) begin
	if (reset) begin
		is_ceil <= 1'b0;
		floor_ceil_valid <= 1'b0;
		valid_reg <= 1'b0;
		floor <= 0;
		ceil <= 0;
		out_reg <= 0;
	end else if (enable) begin
		is_ceil <= in[10];
		floor <= in >>> 11;
		ceil <= (in >>> 11) + 1;
		floor_ceil_valid <= i_valid;
		out_reg <= rounded_result;
		valid_reg <= floor_ceil_valid;
	end
end

assign o_valid = valid_reg;

assign out = out_reg;

endmodule

module shift_register_unit_1_3 (
	input clk,
	input reset,
	input enable,
	input [0:0] in,
	output [0:0] out
);

reg [0:0] shift_registers_0;
reg [0:0] shift_registers_1;
reg [0:0] shift_registers_2;
always @ (posedge clk) begin
	if (reset) begin
		shift_registers_0 <= 1'd0;
		shift_registers_1 <= 1'd0;
		shift_registers_2 <= 1'd0;
	end else if (enable) begin
		shift_registers_0 <= in;
		shift_registers_1 <= shift_registers_0;
		shift_registers_2 <= shift_registers_1;
	end
end

assign out = shift_registers_2;

endmodule















