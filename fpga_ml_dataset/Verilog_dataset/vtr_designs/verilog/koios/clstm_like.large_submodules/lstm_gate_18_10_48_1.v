`define SIMULATION_MEMORY

module lstm_gate_18_10_48_1 (
	input clk,
	input reset,
	input i_ready,
	input i_valid,
	input [17:0] stage1_result_0,
	input [17:0] weight_0,
	input [17:0] Ct_1_0,
	input [17:0] bias_0,
	output [17:0] gate_output_0,
	input [17:0] stage1_result_1,
	input [17:0] weight_1,
	input [17:0] Ct_1_1,
	input [17:0] bias_1,
	output [17:0] gate_output_1,
	input [17:0] stage1_result_2,
	input [17:0] weight_2,
	input [17:0] Ct_1_2,
	input [17:0] bias_2,
	output [17:0] gate_output_2,
	input [17:0] stage1_result_3,
	input [17:0] weight_3,
	input [17:0] Ct_1_3,
	input [17:0] bias_3,
	output [17:0] gate_output_3,
	input [17:0] stage1_result_4,
	input [17:0] weight_4,
	input [17:0] Ct_1_4,
	input [17:0] bias_4,
	output [17:0] gate_output_4,
	input [17:0] stage1_result_5,
	input [17:0] weight_5,
	input [17:0] Ct_1_5,
	input [17:0] bias_5,
	output [17:0] gate_output_5,
	input [17:0] stage1_result_6,
	input [17:0] weight_6,
	input [17:0] Ct_1_6,
	input [17:0] bias_6,
	output [17:0] gate_output_6,
	input [17:0] stage1_result_7,
	input [17:0] weight_7,
	input [17:0] Ct_1_7,
	input [17:0] bias_7,
	output [17:0] gate_output_7,
	input [17:0] stage1_result_8,
	input [17:0] weight_8,
	input [17:0] Ct_1_8,
	input [17:0] bias_8,
	output [17:0] gate_output_8,
	input [17:0] stage1_result_9,
	input [17:0] weight_9,
	input [17:0] Ct_1_9,
	input [17:0] bias_9,
	output [17:0] gate_output_9,
	input [17:0] stage1_result_10,
	input [17:0] weight_10,
	input [17:0] Ct_1_10,
	input [17:0] bias_10,
	output [17:0] gate_output_10,
	input [17:0] stage1_result_11,
	input [17:0] weight_11,
	input [17:0] Ct_1_11,
	input [17:0] bias_11,
	output [17:0] gate_output_11,
	input [17:0] stage1_result_12,
	input [17:0] weight_12,
	input [17:0] Ct_1_12,
	input [17:0] bias_12,
	output [17:0] gate_output_12,
	input [17:0] stage1_result_13,
	input [17:0] weight_13,
	input [17:0] Ct_1_13,
	input [17:0] bias_13,
	output [17:0] gate_output_13,
	input [17:0] stage1_result_14,
	input [17:0] weight_14,
	input [17:0] Ct_1_14,
	input [17:0] bias_14,
	output [17:0] gate_output_14,
	input [17:0] stage1_result_15,
	input [17:0] weight_15,
	input [17:0] Ct_1_15,
	input [17:0] bias_15,
	output [17:0] gate_output_15,
	input [17:0] stage1_result_16,
	input [17:0] weight_16,
	input [17:0] Ct_1_16,
	input [17:0] bias_16,
	output [17:0] gate_output_16,
	input [17:0] stage1_result_17,
	input [17:0] weight_17,
	input [17:0] Ct_1_17,
	input [17:0] bias_17,
	output [17:0] gate_output_17,
	input [17:0] stage1_result_18,
	input [17:0] weight_18,
	input [17:0] Ct_1_18,
	input [17:0] bias_18,
	output [17:0] gate_output_18,
	input [17:0] stage1_result_19,
	input [17:0] weight_19,
	input [17:0] Ct_1_19,
	input [17:0] bias_19,
	output [17:0] gate_output_19,
	input [17:0] stage1_result_20,
	input [17:0] weight_20,
	input [17:0] Ct_1_20,
	input [17:0] bias_20,
	output [17:0] gate_output_20,
	input [17:0] stage1_result_21,
	input [17:0] weight_21,
	input [17:0] Ct_1_21,
	input [17:0] bias_21,
	output [17:0] gate_output_21,
	input [17:0] stage1_result_22,
	input [17:0] weight_22,
	input [17:0] Ct_1_22,
	input [17:0] bias_22,
	output [17:0] gate_output_22,
	input [17:0] stage1_result_23,
	input [17:0] weight_23,
	input [17:0] Ct_1_23,
	input [17:0] bias_23,
	output [17:0] gate_output_23,
	input [17:0] stage1_result_24,
	input [17:0] weight_24,
	input [17:0] Ct_1_24,
	input [17:0] bias_24,
	output [17:0] gate_output_24,
	input [17:0] stage1_result_25,
	input [17:0] weight_25,
	input [17:0] Ct_1_25,
	input [17:0] bias_25,
	output [17:0] gate_output_25,
	input [17:0] stage1_result_26,
	input [17:0] weight_26,
	input [17:0] Ct_1_26,
	input [17:0] bias_26,
	output [17:0] gate_output_26,
	input [17:0] stage1_result_27,
	input [17:0] weight_27,
	input [17:0] Ct_1_27,
	input [17:0] bias_27,
	output [17:0] gate_output_27,
	input [17:0] stage1_result_28,
	input [17:0] weight_28,
	input [17:0] Ct_1_28,
	input [17:0] bias_28,
	output [17:0] gate_output_28,
	input [17:0] stage1_result_29,
	input [17:0] weight_29,
	input [17:0] Ct_1_29,
	input [17:0] bias_29,
	output [17:0] gate_output_29,
	input [17:0] stage1_result_30,
	input [17:0] weight_30,
	input [17:0] Ct_1_30,
	input [17:0] bias_30,
	output [17:0] gate_output_30,
	input [17:0] stage1_result_31,
	input [17:0] weight_31,
	input [17:0] Ct_1_31,
	input [17:0] bias_31,
	output [17:0] gate_output_31,
	input [17:0] stage1_result_32,
	input [17:0] weight_32,
	input [17:0] Ct_1_32,
	input [17:0] bias_32,
	output [17:0] gate_output_32,
	input [17:0] stage1_result_33,
	input [17:0] weight_33,
	input [17:0] Ct_1_33,
	input [17:0] bias_33,
	output [17:0] gate_output_33,
	input [17:0] stage1_result_34,
	input [17:0] weight_34,
	input [17:0] Ct_1_34,
	input [17:0] bias_34,
	output [17:0] gate_output_34,
	input [17:0] stage1_result_35,
	input [17:0] weight_35,
	input [17:0] Ct_1_35,
	input [17:0] bias_35,
	output [17:0] gate_output_35,
	input [17:0] stage1_result_36,
	input [17:0] weight_36,
	input [17:0] Ct_1_36,
	input [17:0] bias_36,
	output [17:0] gate_output_36,
	input [17:0] stage1_result_37,
	input [17:0] weight_37,
	input [17:0] Ct_1_37,
	input [17:0] bias_37,
	output [17:0] gate_output_37,
	input [17:0] stage1_result_38,
	input [17:0] weight_38,
	input [17:0] Ct_1_38,
	input [17:0] bias_38,
	output [17:0] gate_output_38,
	input [17:0] stage1_result_39,
	input [17:0] weight_39,
	input [17:0] Ct_1_39,
	input [17:0] bias_39,
	output [17:0] gate_output_39,
	input [17:0] stage1_result_40,
	input [17:0] weight_40,
	input [17:0] Ct_1_40,
	input [17:0] bias_40,
	output [17:0] gate_output_40,
	input [17:0] stage1_result_41,
	input [17:0] weight_41,
	input [17:0] Ct_1_41,
	input [17:0] bias_41,
	output [17:0] gate_output_41,
	input [17:0] stage1_result_42,
	input [17:0] weight_42,
	input [17:0] Ct_1_42,
	input [17:0] bias_42,
	output [17:0] gate_output_42,
	input [17:0] stage1_result_43,
	input [17:0] weight_43,
	input [17:0] Ct_1_43,
	input [17:0] bias_43,
	output [17:0] gate_output_43,
	input [17:0] stage1_result_44,
	input [17:0] weight_44,
	input [17:0] Ct_1_44,
	input [17:0] bias_44,
	output [17:0] gate_output_44,
	input [17:0] stage1_result_45,
	input [17:0] weight_45,
	input [17:0] Ct_1_45,
	input [17:0] bias_45,
	output [17:0] gate_output_45,
	input [17:0] stage1_result_46,
	input [17:0] weight_46,
	input [17:0] Ct_1_46,
	input [17:0] bias_46,
	output [17:0] gate_output_46,
	input [17:0] stage1_result_47,
	input [17:0] weight_47,
	input [17:0] Ct_1_47,
	input [17:0] bias_47,
	output [17:0] gate_output_47,
	output o_valid,
	output o_ready
);

wire mult_valid, add0_valid, add1_valid, add2_valid;
wire mult_ready, add0_ready, add1_ready, add2_ready;
wire sigmoid_valid_0, sigmoid_ready_0;
wire [17:0] o_mult_0;
wire [17:0] o_add0_0;
wire [17:0] o_add1_0;
wire [17:0] add1_hold_0;
wire [17:0] o_add2_0;
wire [17:0] o_sigmoid_0;
wire sigmoid_valid_1, sigmoid_ready_1;
wire [17:0] o_mult_1;
wire [17:0] o_add0_1;
wire [17:0] o_add1_1;
wire [17:0] add1_hold_1;
wire [17:0] o_add2_1;
wire [17:0] o_sigmoid_1;
wire sigmoid_valid_2, sigmoid_ready_2;
wire [17:0] o_mult_2;
wire [17:0] o_add0_2;
wire [17:0] o_add1_2;
wire [17:0] add1_hold_2;
wire [17:0] o_add2_2;
wire [17:0] o_sigmoid_2;
wire sigmoid_valid_3, sigmoid_ready_3;
wire [17:0] o_mult_3;
wire [17:0] o_add0_3;
wire [17:0] o_add1_3;
wire [17:0] add1_hold_3;
wire [17:0] o_add2_3;
wire [17:0] o_sigmoid_3;
wire sigmoid_valid_4, sigmoid_ready_4;
wire [17:0] o_mult_4;
wire [17:0] o_add0_4;
wire [17:0] o_add1_4;
wire [17:0] add1_hold_4;
wire [17:0] o_add2_4;
wire [17:0] o_sigmoid_4;
wire sigmoid_valid_5, sigmoid_ready_5;
wire [17:0] o_mult_5;
wire [17:0] o_add0_5;
wire [17:0] o_add1_5;
wire [17:0] add1_hold_5;
wire [17:0] o_add2_5;
wire [17:0] o_sigmoid_5;
wire sigmoid_valid_6, sigmoid_ready_6;
wire [17:0] o_mult_6;
wire [17:0] o_add0_6;
wire [17:0] o_add1_6;
wire [17:0] add1_hold_6;
wire [17:0] o_add2_6;
wire [17:0] o_sigmoid_6;
wire sigmoid_valid_7, sigmoid_ready_7;
wire [17:0] o_mult_7;
wire [17:0] o_add0_7;
wire [17:0] o_add1_7;
wire [17:0] add1_hold_7;
wire [17:0] o_add2_7;
wire [17:0] o_sigmoid_7;
wire sigmoid_valid_8, sigmoid_ready_8;
wire [17:0] o_mult_8;
wire [17:0] o_add0_8;
wire [17:0] o_add1_8;
wire [17:0] add1_hold_8;
wire [17:0] o_add2_8;
wire [17:0] o_sigmoid_8;
wire sigmoid_valid_9, sigmoid_ready_9;
wire [17:0] o_mult_9;
wire [17:0] o_add0_9;
wire [17:0] o_add1_9;
wire [17:0] add1_hold_9;
wire [17:0] o_add2_9;
wire [17:0] o_sigmoid_9;
wire sigmoid_valid_10, sigmoid_ready_10;
wire [17:0] o_mult_10;
wire [17:0] o_add0_10;
wire [17:0] o_add1_10;
wire [17:0] add1_hold_10;
wire [17:0] o_add2_10;
wire [17:0] o_sigmoid_10;
wire sigmoid_valid_11, sigmoid_ready_11;
wire [17:0] o_mult_11;
wire [17:0] o_add0_11;
wire [17:0] o_add1_11;
wire [17:0] add1_hold_11;
wire [17:0] o_add2_11;
wire [17:0] o_sigmoid_11;
wire sigmoid_valid_12, sigmoid_ready_12;
wire [17:0] o_mult_12;
wire [17:0] o_add0_12;
wire [17:0] o_add1_12;
wire [17:0] add1_hold_12;
wire [17:0] o_add2_12;
wire [17:0] o_sigmoid_12;
wire sigmoid_valid_13, sigmoid_ready_13;
wire [17:0] o_mult_13;
wire [17:0] o_add0_13;
wire [17:0] o_add1_13;
wire [17:0] add1_hold_13;
wire [17:0] o_add2_13;
wire [17:0] o_sigmoid_13;
wire sigmoid_valid_14, sigmoid_ready_14;
wire [17:0] o_mult_14;
wire [17:0] o_add0_14;
wire [17:0] o_add1_14;
wire [17:0] add1_hold_14;
wire [17:0] o_add2_14;
wire [17:0] o_sigmoid_14;
wire sigmoid_valid_15, sigmoid_ready_15;
wire [17:0] o_mult_15;
wire [17:0] o_add0_15;
wire [17:0] o_add1_15;
wire [17:0] add1_hold_15;
wire [17:0] o_add2_15;
wire [17:0] o_sigmoid_15;
wire sigmoid_valid_16, sigmoid_ready_16;
wire [17:0] o_mult_16;
wire [17:0] o_add0_16;
wire [17:0] o_add1_16;
wire [17:0] add1_hold_16;
wire [17:0] o_add2_16;
wire [17:0] o_sigmoid_16;
wire sigmoid_valid_17, sigmoid_ready_17;
wire [17:0] o_mult_17;
wire [17:0] o_add0_17;
wire [17:0] o_add1_17;
wire [17:0] add1_hold_17;
wire [17:0] o_add2_17;
wire [17:0] o_sigmoid_17;
wire sigmoid_valid_18, sigmoid_ready_18;
wire [17:0] o_mult_18;
wire [17:0] o_add0_18;
wire [17:0] o_add1_18;
wire [17:0] add1_hold_18;
wire [17:0] o_add2_18;
wire [17:0] o_sigmoid_18;
wire sigmoid_valid_19, sigmoid_ready_19;
wire [17:0] o_mult_19;
wire [17:0] o_add0_19;
wire [17:0] o_add1_19;
wire [17:0] add1_hold_19;
wire [17:0] o_add2_19;
wire [17:0] o_sigmoid_19;
wire sigmoid_valid_20, sigmoid_ready_20;
wire [17:0] o_mult_20;
wire [17:0] o_add0_20;
wire [17:0] o_add1_20;
wire [17:0] add1_hold_20;
wire [17:0] o_add2_20;
wire [17:0] o_sigmoid_20;
wire sigmoid_valid_21, sigmoid_ready_21;
wire [17:0] o_mult_21;
wire [17:0] o_add0_21;
wire [17:0] o_add1_21;
wire [17:0] add1_hold_21;
wire [17:0] o_add2_21;
wire [17:0] o_sigmoid_21;
wire sigmoid_valid_22, sigmoid_ready_22;
wire [17:0] o_mult_22;
wire [17:0] o_add0_22;
wire [17:0] o_add1_22;
wire [17:0] add1_hold_22;
wire [17:0] o_add2_22;
wire [17:0] o_sigmoid_22;
wire sigmoid_valid_23, sigmoid_ready_23;
wire [17:0] o_mult_23;
wire [17:0] o_add0_23;
wire [17:0] o_add1_23;
wire [17:0] add1_hold_23;
wire [17:0] o_add2_23;
wire [17:0] o_sigmoid_23;
wire sigmoid_valid_24, sigmoid_ready_24;
wire [17:0] o_mult_24;
wire [17:0] o_add0_24;
wire [17:0] o_add1_24;
wire [17:0] add1_hold_24;
wire [17:0] o_add2_24;
wire [17:0] o_sigmoid_24;
wire sigmoid_valid_25, sigmoid_ready_25;
wire [17:0] o_mult_25;
wire [17:0] o_add0_25;
wire [17:0] o_add1_25;
wire [17:0] add1_hold_25;
wire [17:0] o_add2_25;
wire [17:0] o_sigmoid_25;
wire sigmoid_valid_26, sigmoid_ready_26;
wire [17:0] o_mult_26;
wire [17:0] o_add0_26;
wire [17:0] o_add1_26;
wire [17:0] add1_hold_26;
wire [17:0] o_add2_26;
wire [17:0] o_sigmoid_26;
wire sigmoid_valid_27, sigmoid_ready_27;
wire [17:0] o_mult_27;
wire [17:0] o_add0_27;
wire [17:0] o_add1_27;
wire [17:0] add1_hold_27;
wire [17:0] o_add2_27;
wire [17:0] o_sigmoid_27;
wire sigmoid_valid_28, sigmoid_ready_28;
wire [17:0] o_mult_28;
wire [17:0] o_add0_28;
wire [17:0] o_add1_28;
wire [17:0] add1_hold_28;
wire [17:0] o_add2_28;
wire [17:0] o_sigmoid_28;
wire sigmoid_valid_29, sigmoid_ready_29;
wire [17:0] o_mult_29;
wire [17:0] o_add0_29;
wire [17:0] o_add1_29;
wire [17:0] add1_hold_29;
wire [17:0] o_add2_29;
wire [17:0] o_sigmoid_29;
wire sigmoid_valid_30, sigmoid_ready_30;
wire [17:0] o_mult_30;
wire [17:0] o_add0_30;
wire [17:0] o_add1_30;
wire [17:0] add1_hold_30;
wire [17:0] o_add2_30;
wire [17:0] o_sigmoid_30;
wire sigmoid_valid_31, sigmoid_ready_31;
wire [17:0] o_mult_31;
wire [17:0] o_add0_31;
wire [17:0] o_add1_31;
wire [17:0] add1_hold_31;
wire [17:0] o_add2_31;
wire [17:0] o_sigmoid_31;
wire sigmoid_valid_32, sigmoid_ready_32;
wire [17:0] o_mult_32;
wire [17:0] o_add0_32;
wire [17:0] o_add1_32;
wire [17:0] add1_hold_32;
wire [17:0] o_add2_32;
wire [17:0] o_sigmoid_32;
wire sigmoid_valid_33, sigmoid_ready_33;
wire [17:0] o_mult_33;
wire [17:0] o_add0_33;
wire [17:0] o_add1_33;
wire [17:0] add1_hold_33;
wire [17:0] o_add2_33;
wire [17:0] o_sigmoid_33;
wire sigmoid_valid_34, sigmoid_ready_34;
wire [17:0] o_mult_34;
wire [17:0] o_add0_34;
wire [17:0] o_add1_34;
wire [17:0] add1_hold_34;
wire [17:0] o_add2_34;
wire [17:0] o_sigmoid_34;
wire sigmoid_valid_35, sigmoid_ready_35;
wire [17:0] o_mult_35;
wire [17:0] o_add0_35;
wire [17:0] o_add1_35;
wire [17:0] add1_hold_35;
wire [17:0] o_add2_35;
wire [17:0] o_sigmoid_35;
wire sigmoid_valid_36, sigmoid_ready_36;
wire [17:0] o_mult_36;
wire [17:0] o_add0_36;
wire [17:0] o_add1_36;
wire [17:0] add1_hold_36;
wire [17:0] o_add2_36;
wire [17:0] o_sigmoid_36;
wire sigmoid_valid_37, sigmoid_ready_37;
wire [17:0] o_mult_37;
wire [17:0] o_add0_37;
wire [17:0] o_add1_37;
wire [17:0] add1_hold_37;
wire [17:0] o_add2_37;
wire [17:0] o_sigmoid_37;
wire sigmoid_valid_38, sigmoid_ready_38;
wire [17:0] o_mult_38;
wire [17:0] o_add0_38;
wire [17:0] o_add1_38;
wire [17:0] add1_hold_38;
wire [17:0] o_add2_38;
wire [17:0] o_sigmoid_38;
wire sigmoid_valid_39, sigmoid_ready_39;
wire [17:0] o_mult_39;
wire [17:0] o_add0_39;
wire [17:0] o_add1_39;
wire [17:0] add1_hold_39;
wire [17:0] o_add2_39;
wire [17:0] o_sigmoid_39;
wire sigmoid_valid_40, sigmoid_ready_40;
wire [17:0] o_mult_40;
wire [17:0] o_add0_40;
wire [17:0] o_add1_40;
wire [17:0] add1_hold_40;
wire [17:0] o_add2_40;
wire [17:0] o_sigmoid_40;
wire sigmoid_valid_41, sigmoid_ready_41;
wire [17:0] o_mult_41;
wire [17:0] o_add0_41;
wire [17:0] o_add1_41;
wire [17:0] add1_hold_41;
wire [17:0] o_add2_41;
wire [17:0] o_sigmoid_41;
wire sigmoid_valid_42, sigmoid_ready_42;
wire [17:0] o_mult_42;
wire [17:0] o_add0_42;
wire [17:0] o_add1_42;
wire [17:0] add1_hold_42;
wire [17:0] o_add2_42;
wire [17:0] o_sigmoid_42;
wire sigmoid_valid_43, sigmoid_ready_43;
wire [17:0] o_mult_43;
wire [17:0] o_add0_43;
wire [17:0] o_add1_43;
wire [17:0] add1_hold_43;
wire [17:0] o_add2_43;
wire [17:0] o_sigmoid_43;
wire sigmoid_valid_44, sigmoid_ready_44;
wire [17:0] o_mult_44;
wire [17:0] o_add0_44;
wire [17:0] o_add1_44;
wire [17:0] add1_hold_44;
wire [17:0] o_add2_44;
wire [17:0] o_sigmoid_44;
wire sigmoid_valid_45, sigmoid_ready_45;
wire [17:0] o_mult_45;
wire [17:0] o_add0_45;
wire [17:0] o_add1_45;
wire [17:0] add1_hold_45;
wire [17:0] o_add2_45;
wire [17:0] o_sigmoid_45;
wire sigmoid_valid_46, sigmoid_ready_46;
wire [17:0] o_mult_46;
wire [17:0] o_add0_46;
wire [17:0] o_add1_46;
wire [17:0] add1_hold_46;
wire [17:0] o_add2_46;
wire [17:0] o_sigmoid_46;
wire sigmoid_valid_47, sigmoid_ready_47;
wire [17:0] o_mult_47;
wire [17:0] o_add0_47;
wire [17:0] o_add1_47;
wire [17:0] add1_hold_47;
wire [17:0] o_add2_47;
wire [17:0] o_sigmoid_47;
wire enable;
assign enable = i_ready;

elementwise_mult_core_18_18_10_48_1 elementwise_mult_core_18_18_10_48_1_mult (
	.clk(clk),
	.reset(reset),
	.i_valid(i_valid),
	.i_ready(add2_ready),
	.i_A_0(weight_0),
	.i_B_0(Ct_1_0),
	.o_C_0(o_mult_0),
	.i_A_1(weight_1),
	.i_B_1(Ct_1_1),
	.o_C_1(o_mult_1),
	.i_A_2(weight_2),
	.i_B_2(Ct_1_2),
	.o_C_2(o_mult_2),
	.i_A_3(weight_3),
	.i_B_3(Ct_1_3),
	.o_C_3(o_mult_3),
	.i_A_4(weight_4),
	.i_B_4(Ct_1_4),
	.o_C_4(o_mult_4),
	.i_A_5(weight_5),
	.i_B_5(Ct_1_5),
	.o_C_5(o_mult_5),
	.i_A_6(weight_6),
	.i_B_6(Ct_1_6),
	.o_C_6(o_mult_6),
	.i_A_7(weight_7),
	.i_B_7(Ct_1_7),
	.o_C_7(o_mult_7),
	.i_A_8(weight_8),
	.i_B_8(Ct_1_8),
	.o_C_8(o_mult_8),
	.i_A_9(weight_9),
	.i_B_9(Ct_1_9),
	.o_C_9(o_mult_9),
	.i_A_10(weight_10),
	.i_B_10(Ct_1_10),
	.o_C_10(o_mult_10),
	.i_A_11(weight_11),
	.i_B_11(Ct_1_11),
	.o_C_11(o_mult_11),
	.i_A_12(weight_12),
	.i_B_12(Ct_1_12),
	.o_C_12(o_mult_12),
	.i_A_13(weight_13),
	.i_B_13(Ct_1_13),
	.o_C_13(o_mult_13),
	.i_A_14(weight_14),
	.i_B_14(Ct_1_14),
	.o_C_14(o_mult_14),
	.i_A_15(weight_15),
	.i_B_15(Ct_1_15),
	.o_C_15(o_mult_15),
	.i_A_16(weight_16),
	.i_B_16(Ct_1_16),
	.o_C_16(o_mult_16),
	.i_A_17(weight_17),
	.i_B_17(Ct_1_17),
	.o_C_17(o_mult_17),
	.i_A_18(weight_18),
	.i_B_18(Ct_1_18),
	.o_C_18(o_mult_18),
	.i_A_19(weight_19),
	.i_B_19(Ct_1_19),
	.o_C_19(o_mult_19),
	.i_A_20(weight_20),
	.i_B_20(Ct_1_20),
	.o_C_20(o_mult_20),
	.i_A_21(weight_21),
	.i_B_21(Ct_1_21),
	.o_C_21(o_mult_21),
	.i_A_22(weight_22),
	.i_B_22(Ct_1_22),
	.o_C_22(o_mult_22),
	.i_A_23(weight_23),
	.i_B_23(Ct_1_23),
	.o_C_23(o_mult_23),
	.i_A_24(weight_24),
	.i_B_24(Ct_1_24),
	.o_C_24(o_mult_24),
	.i_A_25(weight_25),
	.i_B_25(Ct_1_25),
	.o_C_25(o_mult_25),
	.i_A_26(weight_26),
	.i_B_26(Ct_1_26),
	.o_C_26(o_mult_26),
	.i_A_27(weight_27),
	.i_B_27(Ct_1_27),
	.o_C_27(o_mult_27),
	.i_A_28(weight_28),
	.i_B_28(Ct_1_28),
	.o_C_28(o_mult_28),
	.i_A_29(weight_29),
	.i_B_29(Ct_1_29),
	.o_C_29(o_mult_29),
	.i_A_30(weight_30),
	.i_B_30(Ct_1_30),
	.o_C_30(o_mult_30),
	.i_A_31(weight_31),
	.i_B_31(Ct_1_31),
	.o_C_31(o_mult_31),
	.i_A_32(weight_32),
	.i_B_32(Ct_1_32),
	.o_C_32(o_mult_32),
	.i_A_33(weight_33),
	.i_B_33(Ct_1_33),
	.o_C_33(o_mult_33),
	.i_A_34(weight_34),
	.i_B_34(Ct_1_34),
	.o_C_34(o_mult_34),
	.i_A_35(weight_35),
	.i_B_35(Ct_1_35),
	.o_C_35(o_mult_35),
	.i_A_36(weight_36),
	.i_B_36(Ct_1_36),
	.o_C_36(o_mult_36),
	.i_A_37(weight_37),
	.i_B_37(Ct_1_37),
	.o_C_37(o_mult_37),
	.i_A_38(weight_38),
	.i_B_38(Ct_1_38),
	.o_C_38(o_mult_38),
	.i_A_39(weight_39),
	.i_B_39(Ct_1_39),
	.o_C_39(o_mult_39),
	.i_A_40(weight_40),
	.i_B_40(Ct_1_40),
	.o_C_40(o_mult_40),
	.i_A_41(weight_41),
	.i_B_41(Ct_1_41),
	.o_C_41(o_mult_41),
	.i_A_42(weight_42),
	.i_B_42(Ct_1_42),
	.o_C_42(o_mult_42),
	.i_A_43(weight_43),
	.i_B_43(Ct_1_43),
	.o_C_43(o_mult_43),
	.i_A_44(weight_44),
	.i_B_44(Ct_1_44),
	.o_C_44(o_mult_44),
	.i_A_45(weight_45),
	.i_B_45(Ct_1_45),
	.o_C_45(o_mult_45),
	.i_A_46(weight_46),
	.i_B_46(Ct_1_46),
	.o_C_46(o_mult_46),
	.i_A_47(weight_47),
	.i_B_47(Ct_1_47),
	.o_C_47(o_mult_47),
	.o_valid(mult_valid),
	.o_ready(mult_ready)
);

elementwise_add_core_18_18_48 elementwise_add_core_18_18_48_add_1 (
	.clk(clk),
	.reset(reset),
	.i_valid(i_valid),
	.i_ready(add2_ready),
	.i_A_0(stage1_result_0),
	.i_B_0(bias_0),
	.o_C_0(o_add1_0),
	.i_A_1(stage1_result_1),
	.i_B_1(bias_1),
	.o_C_1(o_add1_1),
	.i_A_2(stage1_result_2),
	.i_B_2(bias_2),
	.o_C_2(o_add1_2),
	.i_A_3(stage1_result_3),
	.i_B_3(bias_3),
	.o_C_3(o_add1_3),
	.i_A_4(stage1_result_4),
	.i_B_4(bias_4),
	.o_C_4(o_add1_4),
	.i_A_5(stage1_result_5),
	.i_B_5(bias_5),
	.o_C_5(o_add1_5),
	.i_A_6(stage1_result_6),
	.i_B_6(bias_6),
	.o_C_6(o_add1_6),
	.i_A_7(stage1_result_7),
	.i_B_7(bias_7),
	.o_C_7(o_add1_7),
	.i_A_8(stage1_result_8),
	.i_B_8(bias_8),
	.o_C_8(o_add1_8),
	.i_A_9(stage1_result_9),
	.i_B_9(bias_9),
	.o_C_9(o_add1_9),
	.i_A_10(stage1_result_10),
	.i_B_10(bias_10),
	.o_C_10(o_add1_10),
	.i_A_11(stage1_result_11),
	.i_B_11(bias_11),
	.o_C_11(o_add1_11),
	.i_A_12(stage1_result_12),
	.i_B_12(bias_12),
	.o_C_12(o_add1_12),
	.i_A_13(stage1_result_13),
	.i_B_13(bias_13),
	.o_C_13(o_add1_13),
	.i_A_14(stage1_result_14),
	.i_B_14(bias_14),
	.o_C_14(o_add1_14),
	.i_A_15(stage1_result_15),
	.i_B_15(bias_15),
	.o_C_15(o_add1_15),
	.i_A_16(stage1_result_16),
	.i_B_16(bias_16),
	.o_C_16(o_add1_16),
	.i_A_17(stage1_result_17),
	.i_B_17(bias_17),
	.o_C_17(o_add1_17),
	.i_A_18(stage1_result_18),
	.i_B_18(bias_18),
	.o_C_18(o_add1_18),
	.i_A_19(stage1_result_19),
	.i_B_19(bias_19),
	.o_C_19(o_add1_19),
	.i_A_20(stage1_result_20),
	.i_B_20(bias_20),
	.o_C_20(o_add1_20),
	.i_A_21(stage1_result_21),
	.i_B_21(bias_21),
	.o_C_21(o_add1_21),
	.i_A_22(stage1_result_22),
	.i_B_22(bias_22),
	.o_C_22(o_add1_22),
	.i_A_23(stage1_result_23),
	.i_B_23(bias_23),
	.o_C_23(o_add1_23),
	.i_A_24(stage1_result_24),
	.i_B_24(bias_24),
	.o_C_24(o_add1_24),
	.i_A_25(stage1_result_25),
	.i_B_25(bias_25),
	.o_C_25(o_add1_25),
	.i_A_26(stage1_result_26),
	.i_B_26(bias_26),
	.o_C_26(o_add1_26),
	.i_A_27(stage1_result_27),
	.i_B_27(bias_27),
	.o_C_27(o_add1_27),
	.i_A_28(stage1_result_28),
	.i_B_28(bias_28),
	.o_C_28(o_add1_28),
	.i_A_29(stage1_result_29),
	.i_B_29(bias_29),
	.o_C_29(o_add1_29),
	.i_A_30(stage1_result_30),
	.i_B_30(bias_30),
	.o_C_30(o_add1_30),
	.i_A_31(stage1_result_31),
	.i_B_31(bias_31),
	.o_C_31(o_add1_31),
	.i_A_32(stage1_result_32),
	.i_B_32(bias_32),
	.o_C_32(o_add1_32),
	.i_A_33(stage1_result_33),
	.i_B_33(bias_33),
	.o_C_33(o_add1_33),
	.i_A_34(stage1_result_34),
	.i_B_34(bias_34),
	.o_C_34(o_add1_34),
	.i_A_35(stage1_result_35),
	.i_B_35(bias_35),
	.o_C_35(o_add1_35),
	.i_A_36(stage1_result_36),
	.i_B_36(bias_36),
	.o_C_36(o_add1_36),
	.i_A_37(stage1_result_37),
	.i_B_37(bias_37),
	.o_C_37(o_add1_37),
	.i_A_38(stage1_result_38),
	.i_B_38(bias_38),
	.o_C_38(o_add1_38),
	.i_A_39(stage1_result_39),
	.i_B_39(bias_39),
	.o_C_39(o_add1_39),
	.i_A_40(stage1_result_40),
	.i_B_40(bias_40),
	.o_C_40(o_add1_40),
	.i_A_41(stage1_result_41),
	.i_B_41(bias_41),
	.o_C_41(o_add1_41),
	.i_A_42(stage1_result_42),
	.i_B_42(bias_42),
	.o_C_42(o_add1_42),
	.i_A_43(stage1_result_43),
	.i_B_43(bias_43),
	.o_C_43(o_add1_43),
	.i_A_44(stage1_result_44),
	.i_B_44(bias_44),
	.o_C_44(o_add1_44),
	.i_A_45(stage1_result_45),
	.i_B_45(bias_45),
	.o_C_45(o_add1_45),
	.i_A_46(stage1_result_46),
	.i_B_46(bias_46),
	.o_C_46(o_add1_46),
	.i_A_47(stage1_result_47),
	.i_B_47(bias_47),
	.o_C_47(o_add1_47),
	.o_valid(add1_valid),
	.o_ready(add1_ready)
);

shift_register_group_18_48_10 shift_register_group_18_48_10_Ct (
	.clk(clk),
	.enable(enable),
	.in_0(o_add1_0),
	.out_0(add1_hold_0),
	.in_1(o_add1_1),
	.out_1(add1_hold_1),
	.in_2(o_add1_2),
	.out_2(add1_hold_2),
	.in_3(o_add1_3),
	.out_3(add1_hold_3),
	.in_4(o_add1_4),
	.out_4(add1_hold_4),
	.in_5(o_add1_5),
	.out_5(add1_hold_5),
	.in_6(o_add1_6),
	.out_6(add1_hold_6),
	.in_7(o_add1_7),
	.out_7(add1_hold_7),
	.in_8(o_add1_8),
	.out_8(add1_hold_8),
	.in_9(o_add1_9),
	.out_9(add1_hold_9),
	.in_10(o_add1_10),
	.out_10(add1_hold_10),
	.in_11(o_add1_11),
	.out_11(add1_hold_11),
	.in_12(o_add1_12),
	.out_12(add1_hold_12),
	.in_13(o_add1_13),
	.out_13(add1_hold_13),
	.in_14(o_add1_14),
	.out_14(add1_hold_14),
	.in_15(o_add1_15),
	.out_15(add1_hold_15),
	.in_16(o_add1_16),
	.out_16(add1_hold_16),
	.in_17(o_add1_17),
	.out_17(add1_hold_17),
	.in_18(o_add1_18),
	.out_18(add1_hold_18),
	.in_19(o_add1_19),
	.out_19(add1_hold_19),
	.in_20(o_add1_20),
	.out_20(add1_hold_20),
	.in_21(o_add1_21),
	.out_21(add1_hold_21),
	.in_22(o_add1_22),
	.out_22(add1_hold_22),
	.in_23(o_add1_23),
	.out_23(add1_hold_23),
	.in_24(o_add1_24),
	.out_24(add1_hold_24),
	.in_25(o_add1_25),
	.out_25(add1_hold_25),
	.in_26(o_add1_26),
	.out_26(add1_hold_26),
	.in_27(o_add1_27),
	.out_27(add1_hold_27),
	.in_28(o_add1_28),
	.out_28(add1_hold_28),
	.in_29(o_add1_29),
	.out_29(add1_hold_29),
	.in_30(o_add1_30),
	.out_30(add1_hold_30),
	.in_31(o_add1_31),
	.out_31(add1_hold_31),
	.in_32(o_add1_32),
	.out_32(add1_hold_32),
	.in_33(o_add1_33),
	.out_33(add1_hold_33),
	.in_34(o_add1_34),
	.out_34(add1_hold_34),
	.in_35(o_add1_35),
	.out_35(add1_hold_35),
	.in_36(o_add1_36),
	.out_36(add1_hold_36),
	.in_37(o_add1_37),
	.out_37(add1_hold_37),
	.in_38(o_add1_38),
	.out_38(add1_hold_38),
	.in_39(o_add1_39),
	.out_39(add1_hold_39),
	.in_40(o_add1_40),
	.out_40(add1_hold_40),
	.in_41(o_add1_41),
	.out_41(add1_hold_41),
	.in_42(o_add1_42),
	.out_42(add1_hold_42),
	.in_43(o_add1_43),
	.out_43(add1_hold_43),
	.in_44(o_add1_44),
	.out_44(add1_hold_44),
	.in_45(o_add1_45),
	.out_45(add1_hold_45),
	.in_46(o_add1_46),
	.out_46(add1_hold_46),
	.in_47(o_add1_47),
	.out_47(add1_hold_47),
	.reset(reset)
);

elementwise_add_core_18_18_48 elementwise_add_core_18_18_48_add_2 (
	.clk(clk),
	.reset(reset),
	.i_valid(mult_valid),
	.i_ready(sigmoid_ready_0),
	.i_A_0(add1_hold_0),
	.i_B_0(o_mult_0),
	.o_C_0(o_add2_0),
	.i_A_1(add1_hold_1),
	.i_B_1(o_mult_1),
	.o_C_1(o_add2_1),
	.i_A_2(add1_hold_2),
	.i_B_2(o_mult_2),
	.o_C_2(o_add2_2),
	.i_A_3(add1_hold_3),
	.i_B_3(o_mult_3),
	.o_C_3(o_add2_3),
	.i_A_4(add1_hold_4),
	.i_B_4(o_mult_4),
	.o_C_4(o_add2_4),
	.i_A_5(add1_hold_5),
	.i_B_5(o_mult_5),
	.o_C_5(o_add2_5),
	.i_A_6(add1_hold_6),
	.i_B_6(o_mult_6),
	.o_C_6(o_add2_6),
	.i_A_7(add1_hold_7),
	.i_B_7(o_mult_7),
	.o_C_7(o_add2_7),
	.i_A_8(add1_hold_8),
	.i_B_8(o_mult_8),
	.o_C_8(o_add2_8),
	.i_A_9(add1_hold_9),
	.i_B_9(o_mult_9),
	.o_C_9(o_add2_9),
	.i_A_10(add1_hold_10),
	.i_B_10(o_mult_10),
	.o_C_10(o_add2_10),
	.i_A_11(add1_hold_11),
	.i_B_11(o_mult_11),
	.o_C_11(o_add2_11),
	.i_A_12(add1_hold_12),
	.i_B_12(o_mult_12),
	.o_C_12(o_add2_12),
	.i_A_13(add1_hold_13),
	.i_B_13(o_mult_13),
	.o_C_13(o_add2_13),
	.i_A_14(add1_hold_14),
	.i_B_14(o_mult_14),
	.o_C_14(o_add2_14),
	.i_A_15(add1_hold_15),
	.i_B_15(o_mult_15),
	.o_C_15(o_add2_15),
	.i_A_16(add1_hold_16),
	.i_B_16(o_mult_16),
	.o_C_16(o_add2_16),
	.i_A_17(add1_hold_17),
	.i_B_17(o_mult_17),
	.o_C_17(o_add2_17),
	.i_A_18(add1_hold_18),
	.i_B_18(o_mult_18),
	.o_C_18(o_add2_18),
	.i_A_19(add1_hold_19),
	.i_B_19(o_mult_19),
	.o_C_19(o_add2_19),
	.i_A_20(add1_hold_20),
	.i_B_20(o_mult_20),
	.o_C_20(o_add2_20),
	.i_A_21(add1_hold_21),
	.i_B_21(o_mult_21),
	.o_C_21(o_add2_21),
	.i_A_22(add1_hold_22),
	.i_B_22(o_mult_22),
	.o_C_22(o_add2_22),
	.i_A_23(add1_hold_23),
	.i_B_23(o_mult_23),
	.o_C_23(o_add2_23),
	.i_A_24(add1_hold_24),
	.i_B_24(o_mult_24),
	.o_C_24(o_add2_24),
	.i_A_25(add1_hold_25),
	.i_B_25(o_mult_25),
	.o_C_25(o_add2_25),
	.i_A_26(add1_hold_26),
	.i_B_26(o_mult_26),
	.o_C_26(o_add2_26),
	.i_A_27(add1_hold_27),
	.i_B_27(o_mult_27),
	.o_C_27(o_add2_27),
	.i_A_28(add1_hold_28),
	.i_B_28(o_mult_28),
	.o_C_28(o_add2_28),
	.i_A_29(add1_hold_29),
	.i_B_29(o_mult_29),
	.o_C_29(o_add2_29),
	.i_A_30(add1_hold_30),
	.i_B_30(o_mult_30),
	.o_C_30(o_add2_30),
	.i_A_31(add1_hold_31),
	.i_B_31(o_mult_31),
	.o_C_31(o_add2_31),
	.i_A_32(add1_hold_32),
	.i_B_32(o_mult_32),
	.o_C_32(o_add2_32),
	.i_A_33(add1_hold_33),
	.i_B_33(o_mult_33),
	.o_C_33(o_add2_33),
	.i_A_34(add1_hold_34),
	.i_B_34(o_mult_34),
	.o_C_34(o_add2_34),
	.i_A_35(add1_hold_35),
	.i_B_35(o_mult_35),
	.o_C_35(o_add2_35),
	.i_A_36(add1_hold_36),
	.i_B_36(o_mult_36),
	.o_C_36(o_add2_36),
	.i_A_37(add1_hold_37),
	.i_B_37(o_mult_37),
	.o_C_37(o_add2_37),
	.i_A_38(add1_hold_38),
	.i_B_38(o_mult_38),
	.o_C_38(o_add2_38),
	.i_A_39(add1_hold_39),
	.i_B_39(o_mult_39),
	.o_C_39(o_add2_39),
	.i_A_40(add1_hold_40),
	.i_B_40(o_mult_40),
	.o_C_40(o_add2_40),
	.i_A_41(add1_hold_41),
	.i_B_41(o_mult_41),
	.o_C_41(o_add2_41),
	.i_A_42(add1_hold_42),
	.i_B_42(o_mult_42),
	.o_C_42(o_add2_42),
	.i_A_43(add1_hold_43),
	.i_B_43(o_mult_43),
	.o_C_43(o_add2_43),
	.i_A_44(add1_hold_44),
	.i_B_44(o_mult_44),
	.o_C_44(o_add2_44),
	.i_A_45(add1_hold_45),
	.i_B_45(o_mult_45),
	.o_C_45(o_add2_45),
	.i_A_46(add1_hold_46),
	.i_B_46(o_mult_46),
	.o_C_46(o_add2_46),
	.i_A_47(add1_hold_47),
	.i_B_47(o_mult_47),
	.o_C_47(o_add2_47),
	.o_valid(add2_valid),
	.o_ready(add2_ready)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_0 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_0),
	.o_valid(sigmoid_valid_0),
	.i_x(o_add2_0),
	.o_y(o_sigmoid_0)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_1 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_1),
	.o_valid(sigmoid_valid_1),
	.i_x(o_add2_1),
	.o_y(o_sigmoid_1)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_2 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_2),
	.o_valid(sigmoid_valid_2),
	.i_x(o_add2_2),
	.o_y(o_sigmoid_2)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_3 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_3),
	.o_valid(sigmoid_valid_3),
	.i_x(o_add2_3),
	.o_y(o_sigmoid_3)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_4 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_4),
	.o_valid(sigmoid_valid_4),
	.i_x(o_add2_4),
	.o_y(o_sigmoid_4)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_5 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_5),
	.o_valid(sigmoid_valid_5),
	.i_x(o_add2_5),
	.o_y(o_sigmoid_5)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_6 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_6),
	.o_valid(sigmoid_valid_6),
	.i_x(o_add2_6),
	.o_y(o_sigmoid_6)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_7 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_7),
	.o_valid(sigmoid_valid_7),
	.i_x(o_add2_7),
	.o_y(o_sigmoid_7)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_8 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_8),
	.o_valid(sigmoid_valid_8),
	.i_x(o_add2_8),
	.o_y(o_sigmoid_8)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_9 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_9),
	.o_valid(sigmoid_valid_9),
	.i_x(o_add2_9),
	.o_y(o_sigmoid_9)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_10 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_10),
	.o_valid(sigmoid_valid_10),
	.i_x(o_add2_10),
	.o_y(o_sigmoid_10)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_11 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_11),
	.o_valid(sigmoid_valid_11),
	.i_x(o_add2_11),
	.o_y(o_sigmoid_11)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_12 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_12),
	.o_valid(sigmoid_valid_12),
	.i_x(o_add2_12),
	.o_y(o_sigmoid_12)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_13 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_13),
	.o_valid(sigmoid_valid_13),
	.i_x(o_add2_13),
	.o_y(o_sigmoid_13)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_14 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_14),
	.o_valid(sigmoid_valid_14),
	.i_x(o_add2_14),
	.o_y(o_sigmoid_14)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_15 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_15),
	.o_valid(sigmoid_valid_15),
	.i_x(o_add2_15),
	.o_y(o_sigmoid_15)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_16 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_16),
	.o_valid(sigmoid_valid_16),
	.i_x(o_add2_16),
	.o_y(o_sigmoid_16)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_17 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_17),
	.o_valid(sigmoid_valid_17),
	.i_x(o_add2_17),
	.o_y(o_sigmoid_17)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_18 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_18),
	.o_valid(sigmoid_valid_18),
	.i_x(o_add2_18),
	.o_y(o_sigmoid_18)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_19 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_19),
	.o_valid(sigmoid_valid_19),
	.i_x(o_add2_19),
	.o_y(o_sigmoid_19)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_20 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_20),
	.o_valid(sigmoid_valid_20),
	.i_x(o_add2_20),
	.o_y(o_sigmoid_20)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_21 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_21),
	.o_valid(sigmoid_valid_21),
	.i_x(o_add2_21),
	.o_y(o_sigmoid_21)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_22 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_22),
	.o_valid(sigmoid_valid_22),
	.i_x(o_add2_22),
	.o_y(o_sigmoid_22)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_23 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_23),
	.o_valid(sigmoid_valid_23),
	.i_x(o_add2_23),
	.o_y(o_sigmoid_23)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_24 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_24),
	.o_valid(sigmoid_valid_24),
	.i_x(o_add2_24),
	.o_y(o_sigmoid_24)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_25 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_25),
	.o_valid(sigmoid_valid_25),
	.i_x(o_add2_25),
	.o_y(o_sigmoid_25)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_26 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_26),
	.o_valid(sigmoid_valid_26),
	.i_x(o_add2_26),
	.o_y(o_sigmoid_26)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_27 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_27),
	.o_valid(sigmoid_valid_27),
	.i_x(o_add2_27),
	.o_y(o_sigmoid_27)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_28 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_28),
	.o_valid(sigmoid_valid_28),
	.i_x(o_add2_28),
	.o_y(o_sigmoid_28)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_29 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_29),
	.o_valid(sigmoid_valid_29),
	.i_x(o_add2_29),
	.o_y(o_sigmoid_29)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_30 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_30),
	.o_valid(sigmoid_valid_30),
	.i_x(o_add2_30),
	.o_y(o_sigmoid_30)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_31 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_31),
	.o_valid(sigmoid_valid_31),
	.i_x(o_add2_31),
	.o_y(o_sigmoid_31)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_32 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_32),
	.o_valid(sigmoid_valid_32),
	.i_x(o_add2_32),
	.o_y(o_sigmoid_32)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_33 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_33),
	.o_valid(sigmoid_valid_33),
	.i_x(o_add2_33),
	.o_y(o_sigmoid_33)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_34 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_34),
	.o_valid(sigmoid_valid_34),
	.i_x(o_add2_34),
	.o_y(o_sigmoid_34)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_35 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_35),
	.o_valid(sigmoid_valid_35),
	.i_x(o_add2_35),
	.o_y(o_sigmoid_35)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_36 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_36),
	.o_valid(sigmoid_valid_36),
	.i_x(o_add2_36),
	.o_y(o_sigmoid_36)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_37 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_37),
	.o_valid(sigmoid_valid_37),
	.i_x(o_add2_37),
	.o_y(o_sigmoid_37)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_38 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_38),
	.o_valid(sigmoid_valid_38),
	.i_x(o_add2_38),
	.o_y(o_sigmoid_38)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_39 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_39),
	.o_valid(sigmoid_valid_39),
	.i_x(o_add2_39),
	.o_y(o_sigmoid_39)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_40 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_40),
	.o_valid(sigmoid_valid_40),
	.i_x(o_add2_40),
	.o_y(o_sigmoid_40)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_41 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_41),
	.o_valid(sigmoid_valid_41),
	.i_x(o_add2_41),
	.o_y(o_sigmoid_41)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_42 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_42),
	.o_valid(sigmoid_valid_42),
	.i_x(o_add2_42),
	.o_y(o_sigmoid_42)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_43 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_43),
	.o_valid(sigmoid_valid_43),
	.i_x(o_add2_43),
	.o_y(o_sigmoid_43)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_44 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_44),
	.o_valid(sigmoid_valid_44),
	.i_x(o_add2_44),
	.o_y(o_sigmoid_44)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_45 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_45),
	.o_valid(sigmoid_valid_45),
	.i_x(o_add2_45),
	.o_y(o_sigmoid_45)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_46 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_46),
	.o_valid(sigmoid_valid_46),
	.i_x(o_add2_46),
	.o_y(o_sigmoid_46)
);

sigmoid_core_18_18_10_32_1 sigmoid_core_18_18_10_32_1_inst_47 (
	.clk(clk),
	.reset(reset),
	.i_valid(add2_valid),
	.i_ready(i_ready),
	.o_ready(sigmoid_ready_47),
	.o_valid(sigmoid_valid_47),
	.i_x(o_add2_47),
	.o_y(o_sigmoid_47)
);

assign o_ready = mult_ready;
assign o_valid = sigmoid_valid_0 & i_ready;
assign gate_output_0 = o_sigmoid_0;
assign gate_output_1 = o_sigmoid_1;
assign gate_output_2 = o_sigmoid_2;
assign gate_output_3 = o_sigmoid_3;
assign gate_output_4 = o_sigmoid_4;
assign gate_output_5 = o_sigmoid_5;
assign gate_output_6 = o_sigmoid_6;
assign gate_output_7 = o_sigmoid_7;
assign gate_output_8 = o_sigmoid_8;
assign gate_output_9 = o_sigmoid_9;
assign gate_output_10 = o_sigmoid_10;
assign gate_output_11 = o_sigmoid_11;
assign gate_output_12 = o_sigmoid_12;
assign gate_output_13 = o_sigmoid_13;
assign gate_output_14 = o_sigmoid_14;
assign gate_output_15 = o_sigmoid_15;
assign gate_output_16 = o_sigmoid_16;
assign gate_output_17 = o_sigmoid_17;
assign gate_output_18 = o_sigmoid_18;
assign gate_output_19 = o_sigmoid_19;
assign gate_output_20 = o_sigmoid_20;
assign gate_output_21 = o_sigmoid_21;
assign gate_output_22 = o_sigmoid_22;
assign gate_output_23 = o_sigmoid_23;
assign gate_output_24 = o_sigmoid_24;
assign gate_output_25 = o_sigmoid_25;
assign gate_output_26 = o_sigmoid_26;
assign gate_output_27 = o_sigmoid_27;
assign gate_output_28 = o_sigmoid_28;
assign gate_output_29 = o_sigmoid_29;
assign gate_output_30 = o_sigmoid_30;
assign gate_output_31 = o_sigmoid_31;
assign gate_output_32 = o_sigmoid_32;
assign gate_output_33 = o_sigmoid_33;
assign gate_output_34 = o_sigmoid_34;
assign gate_output_35 = o_sigmoid_35;
assign gate_output_36 = o_sigmoid_36;
assign gate_output_37 = o_sigmoid_37;
assign gate_output_38 = o_sigmoid_38;
assign gate_output_39 = o_sigmoid_39;
assign gate_output_40 = o_sigmoid_40;
assign gate_output_41 = o_sigmoid_41;
assign gate_output_42 = o_sigmoid_42;
assign gate_output_43 = o_sigmoid_43;
assign gate_output_44 = o_sigmoid_44;
assign gate_output_45 = o_sigmoid_45;
assign gate_output_46 = o_sigmoid_46;
assign gate_output_47 = o_sigmoid_47;

endmodule
module shift_register_group_18_48_10 (
	input clk,
	input enable,
	input [17:0] in_0,
	output [17:0] out_0,
	input [17:0] in_1,
	output [17:0] out_1,
	input [17:0] in_2,
	output [17:0] out_2,
	input [17:0] in_3,
	output [17:0] out_3,
	input [17:0] in_4,
	output [17:0] out_4,
	input [17:0] in_5,
	output [17:0] out_5,
	input [17:0] in_6,
	output [17:0] out_6,
	input [17:0] in_7,
	output [17:0] out_7,
	input [17:0] in_8,
	output [17:0] out_8,
	input [17:0] in_9,
	output [17:0] out_9,
	input [17:0] in_10,
	output [17:0] out_10,
	input [17:0] in_11,
	output [17:0] out_11,
	input [17:0] in_12,
	output [17:0] out_12,
	input [17:0] in_13,
	output [17:0] out_13,
	input [17:0] in_14,
	output [17:0] out_14,
	input [17:0] in_15,
	output [17:0] out_15,
	input [17:0] in_16,
	output [17:0] out_16,
	input [17:0] in_17,
	output [17:0] out_17,
	input [17:0] in_18,
	output [17:0] out_18,
	input [17:0] in_19,
	output [17:0] out_19,
	input [17:0] in_20,
	output [17:0] out_20,
	input [17:0] in_21,
	output [17:0] out_21,
	input [17:0] in_22,
	output [17:0] out_22,
	input [17:0] in_23,
	output [17:0] out_23,
	input [17:0] in_24,
	output [17:0] out_24,
	input [17:0] in_25,
	output [17:0] out_25,
	input [17:0] in_26,
	output [17:0] out_26,
	input [17:0] in_27,
	output [17:0] out_27,
	input [17:0] in_28,
	output [17:0] out_28,
	input [17:0] in_29,
	output [17:0] out_29,
	input [17:0] in_30,
	output [17:0] out_30,
	input [17:0] in_31,
	output [17:0] out_31,
	input [17:0] in_32,
	output [17:0] out_32,
	input [17:0] in_33,
	output [17:0] out_33,
	input [17:0] in_34,
	output [17:0] out_34,
	input [17:0] in_35,
	output [17:0] out_35,
	input [17:0] in_36,
	output [17:0] out_36,
	input [17:0] in_37,
	output [17:0] out_37,
	input [17:0] in_38,
	output [17:0] out_38,
	input [17:0] in_39,
	output [17:0] out_39,
	input [17:0] in_40,
	output [17:0] out_40,
	input [17:0] in_41,
	output [17:0] out_41,
	input [17:0] in_42,
	output [17:0] out_42,
	input [17:0] in_43,
	output [17:0] out_43,
	input [17:0] in_44,
	output [17:0] out_44,
	input [17:0] in_45,
	output [17:0] out_45,
	input [17:0] in_46,
	output [17:0] out_46,
	input [17:0] in_47,
	output [17:0] out_47,
	input reset
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_0 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_0),
	.out(out_0)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_1 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_1),
	.out(out_1)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_2 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_2),
	.out(out_2)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_3 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_3),
	.out(out_3)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_4 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_4),
	.out(out_4)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_5 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_5),
	.out(out_5)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_6 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_6),
	.out(out_6)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_7 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_7),
	.out(out_7)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_8 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_8),
	.out(out_8)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_9 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_9),
	.out(out_9)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_10 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_10),
	.out(out_10)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_11 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_11),
	.out(out_11)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_12 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_12),
	.out(out_12)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_13 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_13),
	.out(out_13)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_14 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_14),
	.out(out_14)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_15 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_15),
	.out(out_15)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_16 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_16),
	.out(out_16)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_17 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_17),
	.out(out_17)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_18 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_18),
	.out(out_18)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_19 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_19),
	.out(out_19)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_20 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_20),
	.out(out_20)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_21 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_21),
	.out(out_21)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_22 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_22),
	.out(out_22)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_23 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_23),
	.out(out_23)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_24 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_24),
	.out(out_24)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_25 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_25),
	.out(out_25)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_26 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_26),
	.out(out_26)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_27 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_27),
	.out(out_27)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_28 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_28),
	.out(out_28)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_29 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_29),
	.out(out_29)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_30 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_30),
	.out(out_30)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_31 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_31),
	.out(out_31)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_32 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_32),
	.out(out_32)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_33 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_33),
	.out(out_33)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_34 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_34),
	.out(out_34)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_35 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_35),
	.out(out_35)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_36 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_36),
	.out(out_36)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_37 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_37),
	.out(out_37)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_38 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_38),
	.out(out_38)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_39 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_39),
	.out(out_39)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_40 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_40),
	.out(out_40)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_41 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_41),
	.out(out_41)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_42 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_42),
	.out(out_42)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_43 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_43),
	.out(out_43)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_44 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_44),
	.out(out_44)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_45 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_45),
	.out(out_45)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_46 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_46),
	.out(out_46)
);

shift_register_unit_18_18 shift_register_unit_18_18_inst_47 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.in(in_47),
	.out(out_47)
);

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

module elementwise_mult_core_18_18_10_48_1 (
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

// Store inputs and outputs in registers
reg [17:0] reg_A_0;
reg [17:0] reg_B_0;
wire [17:0] reg_C_0;
reg [17:0] reg_A_1;
reg [17:0] reg_B_1;
wire [17:0] reg_C_1;
reg [17:0] reg_A_2;
reg [17:0] reg_B_2;
wire [17:0] reg_C_2;
reg [17:0] reg_A_3;
reg [17:0] reg_B_3;
wire [17:0] reg_C_3;
reg [17:0] reg_A_4;
reg [17:0] reg_B_4;
wire [17:0] reg_C_4;
reg [17:0] reg_A_5;
reg [17:0] reg_B_5;
wire [17:0] reg_C_5;
reg [17:0] reg_A_6;
reg [17:0] reg_B_6;
wire [17:0] reg_C_6;
reg [17:0] reg_A_7;
reg [17:0] reg_B_7;
wire [17:0] reg_C_7;
reg [17:0] reg_A_8;
reg [17:0] reg_B_8;
wire [17:0] reg_C_8;
reg [17:0] reg_A_9;
reg [17:0] reg_B_9;
wire [17:0] reg_C_9;
reg [17:0] reg_A_10;
reg [17:0] reg_B_10;
wire [17:0] reg_C_10;
reg [17:0] reg_A_11;
reg [17:0] reg_B_11;
wire [17:0] reg_C_11;
reg [17:0] reg_A_12;
reg [17:0] reg_B_12;
wire [17:0] reg_C_12;
reg [17:0] reg_A_13;
reg [17:0] reg_B_13;
wire [17:0] reg_C_13;
reg [17:0] reg_A_14;
reg [17:0] reg_B_14;
wire [17:0] reg_C_14;
reg [17:0] reg_A_15;
reg [17:0] reg_B_15;
wire [17:0] reg_C_15;
reg [17:0] reg_A_16;
reg [17:0] reg_B_16;
wire [17:0] reg_C_16;
reg [17:0] reg_A_17;
reg [17:0] reg_B_17;
wire [17:0] reg_C_17;
reg [17:0] reg_A_18;
reg [17:0] reg_B_18;
wire [17:0] reg_C_18;
reg [17:0] reg_A_19;
reg [17:0] reg_B_19;
wire [17:0] reg_C_19;
reg [17:0] reg_A_20;
reg [17:0] reg_B_20;
wire [17:0] reg_C_20;
reg [17:0] reg_A_21;
reg [17:0] reg_B_21;
wire [17:0] reg_C_21;
reg [17:0] reg_A_22;
reg [17:0] reg_B_22;
wire [17:0] reg_C_22;
reg [17:0] reg_A_23;
reg [17:0] reg_B_23;
wire [17:0] reg_C_23;
reg [17:0] reg_A_24;
reg [17:0] reg_B_24;
wire [17:0] reg_C_24;
reg [17:0] reg_A_25;
reg [17:0] reg_B_25;
wire [17:0] reg_C_25;
reg [17:0] reg_A_26;
reg [17:0] reg_B_26;
wire [17:0] reg_C_26;
reg [17:0] reg_A_27;
reg [17:0] reg_B_27;
wire [17:0] reg_C_27;
reg [17:0] reg_A_28;
reg [17:0] reg_B_28;
wire [17:0] reg_C_28;
reg [17:0] reg_A_29;
reg [17:0] reg_B_29;
wire [17:0] reg_C_29;
reg [17:0] reg_A_30;
reg [17:0] reg_B_30;
wire [17:0] reg_C_30;
reg [17:0] reg_A_31;
reg [17:0] reg_B_31;
wire [17:0] reg_C_31;
reg [17:0] reg_A_32;
reg [17:0] reg_B_32;
wire [17:0] reg_C_32;
reg [17:0] reg_A_33;
reg [17:0] reg_B_33;
wire [17:0] reg_C_33;
reg [17:0] reg_A_34;
reg [17:0] reg_B_34;
wire [17:0] reg_C_34;
reg [17:0] reg_A_35;
reg [17:0] reg_B_35;
wire [17:0] reg_C_35;
reg [17:0] reg_A_36;
reg [17:0] reg_B_36;
wire [17:0] reg_C_36;
reg [17:0] reg_A_37;
reg [17:0] reg_B_37;
wire [17:0] reg_C_37;
reg [17:0] reg_A_38;
reg [17:0] reg_B_38;
wire [17:0] reg_C_38;
reg [17:0] reg_A_39;
reg [17:0] reg_B_39;
wire [17:0] reg_C_39;
reg [17:0] reg_A_40;
reg [17:0] reg_B_40;
wire [17:0] reg_C_40;
reg [17:0] reg_A_41;
reg [17:0] reg_B_41;
wire [17:0] reg_C_41;
reg [17:0] reg_A_42;
reg [17:0] reg_B_42;
wire [17:0] reg_C_42;
reg [17:0] reg_A_43;
reg [17:0] reg_B_43;
wire [17:0] reg_C_43;
reg [17:0] reg_A_44;
reg [17:0] reg_B_44;
wire [17:0] reg_C_44;
reg [17:0] reg_A_45;
reg [17:0] reg_B_45;
wire [17:0] reg_C_45;
reg [17:0] reg_A_46;
reg [17:0] reg_B_46;
wire [17:0] reg_C_46;
reg [17:0] reg_A_47;
reg [17:0] reg_B_47;
wire [17:0] reg_C_47;

reg valid_A_B;
wire valid_C;
wire enable;
assign enable = i_ready;

wire mult_valid_0;
wire round_valid_0;
wire [36:0] mult_C_0;
wire [36:0] rounded_C_0;
wire mult_valid_1;
wire round_valid_1;
wire [36:0] mult_C_1;
wire [36:0] rounded_C_1;
wire mult_valid_2;
wire round_valid_2;
wire [36:0] mult_C_2;
wire [36:0] rounded_C_2;
wire mult_valid_3;
wire round_valid_3;
wire [36:0] mult_C_3;
wire [36:0] rounded_C_3;
wire mult_valid_4;
wire round_valid_4;
wire [36:0] mult_C_4;
wire [36:0] rounded_C_4;
wire mult_valid_5;
wire round_valid_5;
wire [36:0] mult_C_5;
wire [36:0] rounded_C_5;
wire mult_valid_6;
wire round_valid_6;
wire [36:0] mult_C_6;
wire [36:0] rounded_C_6;
wire mult_valid_7;
wire round_valid_7;
wire [36:0] mult_C_7;
wire [36:0] rounded_C_7;
wire mult_valid_8;
wire round_valid_8;
wire [36:0] mult_C_8;
wire [36:0] rounded_C_8;
wire mult_valid_9;
wire round_valid_9;
wire [36:0] mult_C_9;
wire [36:0] rounded_C_9;
wire mult_valid_10;
wire round_valid_10;
wire [36:0] mult_C_10;
wire [36:0] rounded_C_10;
wire mult_valid_11;
wire round_valid_11;
wire [36:0] mult_C_11;
wire [36:0] rounded_C_11;
wire mult_valid_12;
wire round_valid_12;
wire [36:0] mult_C_12;
wire [36:0] rounded_C_12;
wire mult_valid_13;
wire round_valid_13;
wire [36:0] mult_C_13;
wire [36:0] rounded_C_13;
wire mult_valid_14;
wire round_valid_14;
wire [36:0] mult_C_14;
wire [36:0] rounded_C_14;
wire mult_valid_15;
wire round_valid_15;
wire [36:0] mult_C_15;
wire [36:0] rounded_C_15;
wire mult_valid_16;
wire round_valid_16;
wire [36:0] mult_C_16;
wire [36:0] rounded_C_16;
wire mult_valid_17;
wire round_valid_17;
wire [36:0] mult_C_17;
wire [36:0] rounded_C_17;
wire mult_valid_18;
wire round_valid_18;
wire [36:0] mult_C_18;
wire [36:0] rounded_C_18;
wire mult_valid_19;
wire round_valid_19;
wire [36:0] mult_C_19;
wire [36:0] rounded_C_19;
wire mult_valid_20;
wire round_valid_20;
wire [36:0] mult_C_20;
wire [36:0] rounded_C_20;
wire mult_valid_21;
wire round_valid_21;
wire [36:0] mult_C_21;
wire [36:0] rounded_C_21;
wire mult_valid_22;
wire round_valid_22;
wire [36:0] mult_C_22;
wire [36:0] rounded_C_22;
wire mult_valid_23;
wire round_valid_23;
wire [36:0] mult_C_23;
wire [36:0] rounded_C_23;
wire mult_valid_24;
wire round_valid_24;
wire [36:0] mult_C_24;
wire [36:0] rounded_C_24;
wire mult_valid_25;
wire round_valid_25;
wire [36:0] mult_C_25;
wire [36:0] rounded_C_25;
wire mult_valid_26;
wire round_valid_26;
wire [36:0] mult_C_26;
wire [36:0] rounded_C_26;
wire mult_valid_27;
wire round_valid_27;
wire [36:0] mult_C_27;
wire [36:0] rounded_C_27;
wire mult_valid_28;
wire round_valid_28;
wire [36:0] mult_C_28;
wire [36:0] rounded_C_28;
wire mult_valid_29;
wire round_valid_29;
wire [36:0] mult_C_29;
wire [36:0] rounded_C_29;
wire mult_valid_30;
wire round_valid_30;
wire [36:0] mult_C_30;
wire [36:0] rounded_C_30;
wire mult_valid_31;
wire round_valid_31;
wire [36:0] mult_C_31;
wire [36:0] rounded_C_31;
wire mult_valid_32;
wire round_valid_32;
wire [36:0] mult_C_32;
wire [36:0] rounded_C_32;
wire mult_valid_33;
wire round_valid_33;
wire [36:0] mult_C_33;
wire [36:0] rounded_C_33;
wire mult_valid_34;
wire round_valid_34;
wire [36:0] mult_C_34;
wire [36:0] rounded_C_34;
wire mult_valid_35;
wire round_valid_35;
wire [36:0] mult_C_35;
wire [36:0] rounded_C_35;
wire mult_valid_36;
wire round_valid_36;
wire [36:0] mult_C_36;
wire [36:0] rounded_C_36;
wire mult_valid_37;
wire round_valid_37;
wire [36:0] mult_C_37;
wire [36:0] rounded_C_37;
wire mult_valid_38;
wire round_valid_38;
wire [36:0] mult_C_38;
wire [36:0] rounded_C_38;
wire mult_valid_39;
wire round_valid_39;
wire [36:0] mult_C_39;
wire [36:0] rounded_C_39;
wire mult_valid_40;
wire round_valid_40;
wire [36:0] mult_C_40;
wire [36:0] rounded_C_40;
wire mult_valid_41;
wire round_valid_41;
wire [36:0] mult_C_41;
wire [36:0] rounded_C_41;
wire mult_valid_42;
wire round_valid_42;
wire [36:0] mult_C_42;
wire [36:0] rounded_C_42;
wire mult_valid_43;
wire round_valid_43;
wire [36:0] mult_C_43;
wire [36:0] rounded_C_43;
wire mult_valid_44;
wire round_valid_44;
wire [36:0] mult_C_44;
wire [36:0] rounded_C_44;
wire mult_valid_45;
wire round_valid_45;
wire [36:0] mult_C_45;
wire [36:0] rounded_C_45;
wire mult_valid_46;
wire round_valid_46;
wire [36:0] mult_C_46;
wire [36:0] rounded_C_46;
wire mult_valid_47;
wire round_valid_47;
wire [36:0] mult_C_47;
wire [36:0] rounded_C_47;

dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst0 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_0),
	.ay(reg_B_0),
	.bx(reg_A_1),
	.by(reg_B_1),
	.o_valid(mult_valid_0),
	.resulta(mult_C_0),
	.resultb(mult_C_1)
);
assign mult_valid_1 = mult_valid_0;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst2 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_2),
	.ay(reg_B_2),
	.bx(reg_A_3),
	.by(reg_B_3),
	.o_valid(mult_valid_2),
	.resulta(mult_C_2),
	.resultb(mult_C_3)
);
assign mult_valid_3 = mult_valid_2;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst4 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_4),
	.ay(reg_B_4),
	.bx(reg_A_5),
	.by(reg_B_5),
	.o_valid(mult_valid_4),
	.resulta(mult_C_4),
	.resultb(mult_C_5)
);
assign mult_valid_5 = mult_valid_4;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst6 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_6),
	.ay(reg_B_6),
	.bx(reg_A_7),
	.by(reg_B_7),
	.o_valid(mult_valid_6),
	.resulta(mult_C_6),
	.resultb(mult_C_7)
);
assign mult_valid_7 = mult_valid_6;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst8 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_8),
	.ay(reg_B_8),
	.bx(reg_A_9),
	.by(reg_B_9),
	.o_valid(mult_valid_8),
	.resulta(mult_C_8),
	.resultb(mult_C_9)
);
assign mult_valid_9 = mult_valid_8;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst10 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_10),
	.ay(reg_B_10),
	.bx(reg_A_11),
	.by(reg_B_11),
	.o_valid(mult_valid_10),
	.resulta(mult_C_10),
	.resultb(mult_C_11)
);
assign mult_valid_11 = mult_valid_10;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst12 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_12),
	.ay(reg_B_12),
	.bx(reg_A_13),
	.by(reg_B_13),
	.o_valid(mult_valid_12),
	.resulta(mult_C_12),
	.resultb(mult_C_13)
);
assign mult_valid_13 = mult_valid_12;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst14 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_14),
	.ay(reg_B_14),
	.bx(reg_A_15),
	.by(reg_B_15),
	.o_valid(mult_valid_14),
	.resulta(mult_C_14),
	.resultb(mult_C_15)
);
assign mult_valid_15 = mult_valid_14;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst16 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_16),
	.ay(reg_B_16),
	.bx(reg_A_17),
	.by(reg_B_17),
	.o_valid(mult_valid_16),
	.resulta(mult_C_16),
	.resultb(mult_C_17)
);
assign mult_valid_17 = mult_valid_16;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst18 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_18),
	.ay(reg_B_18),
	.bx(reg_A_19),
	.by(reg_B_19),
	.o_valid(mult_valid_18),
	.resulta(mult_C_18),
	.resultb(mult_C_19)
);
assign mult_valid_19 = mult_valid_18;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst20 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_20),
	.ay(reg_B_20),
	.bx(reg_A_21),
	.by(reg_B_21),
	.o_valid(mult_valid_20),
	.resulta(mult_C_20),
	.resultb(mult_C_21)
);
assign mult_valid_21 = mult_valid_20;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst22 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_22),
	.ay(reg_B_22),
	.bx(reg_A_23),
	.by(reg_B_23),
	.o_valid(mult_valid_22),
	.resulta(mult_C_22),
	.resultb(mult_C_23)
);
assign mult_valid_23 = mult_valid_22;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst24 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_24),
	.ay(reg_B_24),
	.bx(reg_A_25),
	.by(reg_B_25),
	.o_valid(mult_valid_24),
	.resulta(mult_C_24),
	.resultb(mult_C_25)
);
assign mult_valid_25 = mult_valid_24;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst26 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_26),
	.ay(reg_B_26),
	.bx(reg_A_27),
	.by(reg_B_27),
	.o_valid(mult_valid_26),
	.resulta(mult_C_26),
	.resultb(mult_C_27)
);
assign mult_valid_27 = mult_valid_26;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst28 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_28),
	.ay(reg_B_28),
	.bx(reg_A_29),
	.by(reg_B_29),
	.o_valid(mult_valid_28),
	.resulta(mult_C_28),
	.resultb(mult_C_29)
);
assign mult_valid_29 = mult_valid_28;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst30 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_30),
	.ay(reg_B_30),
	.bx(reg_A_31),
	.by(reg_B_31),
	.o_valid(mult_valid_30),
	.resulta(mult_C_30),
	.resultb(mult_C_31)
);
assign mult_valid_31 = mult_valid_30;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst32 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_32),
	.ay(reg_B_32),
	.bx(reg_A_33),
	.by(reg_B_33),
	.o_valid(mult_valid_32),
	.resulta(mult_C_32),
	.resultb(mult_C_33)
);
assign mult_valid_33 = mult_valid_32;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst34 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_34),
	.ay(reg_B_34),
	.bx(reg_A_35),
	.by(reg_B_35),
	.o_valid(mult_valid_34),
	.resulta(mult_C_34),
	.resultb(mult_C_35)
);
assign mult_valid_35 = mult_valid_34;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst36 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_36),
	.ay(reg_B_36),
	.bx(reg_A_37),
	.by(reg_B_37),
	.o_valid(mult_valid_36),
	.resulta(mult_C_36),
	.resultb(mult_C_37)
);
assign mult_valid_37 = mult_valid_36;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst38 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_38),
	.ay(reg_B_38),
	.bx(reg_A_39),
	.by(reg_B_39),
	.o_valid(mult_valid_38),
	.resulta(mult_C_38),
	.resultb(mult_C_39)
);
assign mult_valid_39 = mult_valid_38;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst40 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_40),
	.ay(reg_B_40),
	.bx(reg_A_41),
	.by(reg_B_41),
	.o_valid(mult_valid_40),
	.resulta(mult_C_40),
	.resultb(mult_C_41)
);
assign mult_valid_41 = mult_valid_40;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst42 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_42),
	.ay(reg_B_42),
	.bx(reg_A_43),
	.by(reg_B_43),
	.o_valid(mult_valid_42),
	.resulta(mult_C_42),
	.resultb(mult_C_43)
);
assign mult_valid_43 = mult_valid_42;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst44 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_44),
	.ay(reg_B_44),
	.bx(reg_A_45),
	.by(reg_B_45),
	.o_valid(mult_valid_44),
	.resulta(mult_C_44),
	.resultb(mult_C_45)
);
assign mult_valid_45 = mult_valid_44;
dsp_signed_mult_18x18_unit_18_18_1 dsp_signed_mult_18x18_unit_18_18_1_inst46 (
	.clk(clk),
	.reset(reset),
	.ena(enable),
	.i_valid(valid_A_B),
	.ax(reg_A_46),
	.ay(reg_B_46),
	.bx(reg_A_47),
	.by(reg_B_47),
	.o_valid(mult_valid_46),
	.resulta(mult_C_46),
	.resultb(mult_C_47)
);
assign mult_valid_47 = mult_valid_46;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst0 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_0),
	.in(mult_C_0),
	.o_valid(round_valid_0),
	.out(rounded_C_0)
);
assign reg_C_0 = rounded_C_0;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst1 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_1),
	.in(mult_C_1),
	.o_valid(round_valid_1),
	.out(rounded_C_1)
);
assign reg_C_1 = rounded_C_1;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst2 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_2),
	.in(mult_C_2),
	.o_valid(round_valid_2),
	.out(rounded_C_2)
);
assign reg_C_2 = rounded_C_2;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst3 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_3),
	.in(mult_C_3),
	.o_valid(round_valid_3),
	.out(rounded_C_3)
);
assign reg_C_3 = rounded_C_3;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst4 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_4),
	.in(mult_C_4),
	.o_valid(round_valid_4),
	.out(rounded_C_4)
);
assign reg_C_4 = rounded_C_4;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst5 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_5),
	.in(mult_C_5),
	.o_valid(round_valid_5),
	.out(rounded_C_5)
);
assign reg_C_5 = rounded_C_5;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst6 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_6),
	.in(mult_C_6),
	.o_valid(round_valid_6),
	.out(rounded_C_6)
);
assign reg_C_6 = rounded_C_6;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst7 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_7),
	.in(mult_C_7),
	.o_valid(round_valid_7),
	.out(rounded_C_7)
);
assign reg_C_7 = rounded_C_7;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst8 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_8),
	.in(mult_C_8),
	.o_valid(round_valid_8),
	.out(rounded_C_8)
);
assign reg_C_8 = rounded_C_8;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst9 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_9),
	.in(mult_C_9),
	.o_valid(round_valid_9),
	.out(rounded_C_9)
);
assign reg_C_9 = rounded_C_9;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst10 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_10),
	.in(mult_C_10),
	.o_valid(round_valid_10),
	.out(rounded_C_10)
);
assign reg_C_10 = rounded_C_10;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst11 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_11),
	.in(mult_C_11),
	.o_valid(round_valid_11),
	.out(rounded_C_11)
);
assign reg_C_11 = rounded_C_11;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst12 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_12),
	.in(mult_C_12),
	.o_valid(round_valid_12),
	.out(rounded_C_12)
);
assign reg_C_12 = rounded_C_12;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst13 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_13),
	.in(mult_C_13),
	.o_valid(round_valid_13),
	.out(rounded_C_13)
);
assign reg_C_13 = rounded_C_13;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst14 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_14),
	.in(mult_C_14),
	.o_valid(round_valid_14),
	.out(rounded_C_14)
);
assign reg_C_14 = rounded_C_14;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst15 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_15),
	.in(mult_C_15),
	.o_valid(round_valid_15),
	.out(rounded_C_15)
);
assign reg_C_15 = rounded_C_15;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst16 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_16),
	.in(mult_C_16),
	.o_valid(round_valid_16),
	.out(rounded_C_16)
);
assign reg_C_16 = rounded_C_16;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst17 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_17),
	.in(mult_C_17),
	.o_valid(round_valid_17),
	.out(rounded_C_17)
);
assign reg_C_17 = rounded_C_17;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst18 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_18),
	.in(mult_C_18),
	.o_valid(round_valid_18),
	.out(rounded_C_18)
);
assign reg_C_18 = rounded_C_18;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst19 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_19),
	.in(mult_C_19),
	.o_valid(round_valid_19),
	.out(rounded_C_19)
);
assign reg_C_19 = rounded_C_19;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst20 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_20),
	.in(mult_C_20),
	.o_valid(round_valid_20),
	.out(rounded_C_20)
);
assign reg_C_20 = rounded_C_20;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst21 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_21),
	.in(mult_C_21),
	.o_valid(round_valid_21),
	.out(rounded_C_21)
);
assign reg_C_21 = rounded_C_21;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst22 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_22),
	.in(mult_C_22),
	.o_valid(round_valid_22),
	.out(rounded_C_22)
);
assign reg_C_22 = rounded_C_22;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst23 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_23),
	.in(mult_C_23),
	.o_valid(round_valid_23),
	.out(rounded_C_23)
);
assign reg_C_23 = rounded_C_23;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst24 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_24),
	.in(mult_C_24),
	.o_valid(round_valid_24),
	.out(rounded_C_24)
);
assign reg_C_24 = rounded_C_24;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst25 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_25),
	.in(mult_C_25),
	.o_valid(round_valid_25),
	.out(rounded_C_25)
);
assign reg_C_25 = rounded_C_25;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst26 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_26),
	.in(mult_C_26),
	.o_valid(round_valid_26),
	.out(rounded_C_26)
);
assign reg_C_26 = rounded_C_26;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst27 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_27),
	.in(mult_C_27),
	.o_valid(round_valid_27),
	.out(rounded_C_27)
);
assign reg_C_27 = rounded_C_27;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst28 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_28),
	.in(mult_C_28),
	.o_valid(round_valid_28),
	.out(rounded_C_28)
);
assign reg_C_28 = rounded_C_28;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst29 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_29),
	.in(mult_C_29),
	.o_valid(round_valid_29),
	.out(rounded_C_29)
);
assign reg_C_29 = rounded_C_29;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst30 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_30),
	.in(mult_C_30),
	.o_valid(round_valid_30),
	.out(rounded_C_30)
);
assign reg_C_30 = rounded_C_30;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst31 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_31),
	.in(mult_C_31),
	.o_valid(round_valid_31),
	.out(rounded_C_31)
);
assign reg_C_31 = rounded_C_31;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst32 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_32),
	.in(mult_C_32),
	.o_valid(round_valid_32),
	.out(rounded_C_32)
);
assign reg_C_32 = rounded_C_32;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst33 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_33),
	.in(mult_C_33),
	.o_valid(round_valid_33),
	.out(rounded_C_33)
);
assign reg_C_33 = rounded_C_33;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst34 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_34),
	.in(mult_C_34),
	.o_valid(round_valid_34),
	.out(rounded_C_34)
);
assign reg_C_34 = rounded_C_34;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst35 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_35),
	.in(mult_C_35),
	.o_valid(round_valid_35),
	.out(rounded_C_35)
);
assign reg_C_35 = rounded_C_35;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst36 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_36),
	.in(mult_C_36),
	.o_valid(round_valid_36),
	.out(rounded_C_36)
);
assign reg_C_36 = rounded_C_36;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst37 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_37),
	.in(mult_C_37),
	.o_valid(round_valid_37),
	.out(rounded_C_37)
);
assign reg_C_37 = rounded_C_37;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst38 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_38),
	.in(mult_C_38),
	.o_valid(round_valid_38),
	.out(rounded_C_38)
);
assign reg_C_38 = rounded_C_38;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst39 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_39),
	.in(mult_C_39),
	.o_valid(round_valid_39),
	.out(rounded_C_39)
);
assign reg_C_39 = rounded_C_39;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst40 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_40),
	.in(mult_C_40),
	.o_valid(round_valid_40),
	.out(rounded_C_40)
);
assign reg_C_40 = rounded_C_40;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst41 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_41),
	.in(mult_C_41),
	.o_valid(round_valid_41),
	.out(rounded_C_41)
);
assign reg_C_41 = rounded_C_41;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst42 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_42),
	.in(mult_C_42),
	.o_valid(round_valid_42),
	.out(rounded_C_42)
);
assign reg_C_42 = rounded_C_42;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst43 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_43),
	.in(mult_C_43),
	.o_valid(round_valid_43),
	.out(rounded_C_43)
);
assign reg_C_43 = rounded_C_43;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst44 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_44),
	.in(mult_C_44),
	.o_valid(round_valid_44),
	.out(rounded_C_44)
);
assign reg_C_44 = rounded_C_44;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst45 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_45),
	.in(mult_C_45),
	.o_valid(round_valid_45),
	.out(rounded_C_45)
);
assign reg_C_45 = rounded_C_45;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst46 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_46),
	.in(mult_C_46),
	.o_valid(round_valid_46),
	.out(rounded_C_46)
);
assign reg_C_46 = rounded_C_46;
fp_rounding_unit_1_37_10 fp_rounding_unit_1_37_10_inst47 (
	.clk(clk),
	.reset(reset),
	.enable(enable),
	.i_valid(mult_valid_47),
	.in(mult_C_47),
	.o_valid(round_valid_47),
	.out(rounded_C_47)
);
assign reg_C_47 = rounded_C_47;
always @ (posedge clk) begin
	if (reset) begin
		valid_A_B <= 1'b0;
		reg_A_0 <= 0;
		reg_B_0 <= 0;
		reg_A_1 <= 0;
		reg_B_1 <= 0;
		reg_A_2 <= 0;
		reg_B_2 <= 0;
		reg_A_3 <= 0;
		reg_B_3 <= 0;
		reg_A_4 <= 0;
		reg_B_4 <= 0;
		reg_A_5 <= 0;
		reg_B_5 <= 0;
		reg_A_6 <= 0;
		reg_B_6 <= 0;
		reg_A_7 <= 0;
		reg_B_7 <= 0;
		reg_A_8 <= 0;
		reg_B_8 <= 0;
		reg_A_9 <= 0;
		reg_B_9 <= 0;
		reg_A_10 <= 0;
		reg_B_10 <= 0;
		reg_A_11 <= 0;
		reg_B_11 <= 0;
		reg_A_12 <= 0;
		reg_B_12 <= 0;
		reg_A_13 <= 0;
		reg_B_13 <= 0;
		reg_A_14 <= 0;
		reg_B_14 <= 0;
		reg_A_15 <= 0;
		reg_B_15 <= 0;
		reg_A_16 <= 0;
		reg_B_16 <= 0;
		reg_A_17 <= 0;
		reg_B_17 <= 0;
		reg_A_18 <= 0;
		reg_B_18 <= 0;
		reg_A_19 <= 0;
		reg_B_19 <= 0;
		reg_A_20 <= 0;
		reg_B_20 <= 0;
		reg_A_21 <= 0;
		reg_B_21 <= 0;
		reg_A_22 <= 0;
		reg_B_22 <= 0;
		reg_A_23 <= 0;
		reg_B_23 <= 0;
		reg_A_24 <= 0;
		reg_B_24 <= 0;
		reg_A_25 <= 0;
		reg_B_25 <= 0;
		reg_A_26 <= 0;
		reg_B_26 <= 0;
		reg_A_27 <= 0;
		reg_B_27 <= 0;
		reg_A_28 <= 0;
		reg_B_28 <= 0;
		reg_A_29 <= 0;
		reg_B_29 <= 0;
		reg_A_30 <= 0;
		reg_B_30 <= 0;
		reg_A_31 <= 0;
		reg_B_31 <= 0;
		reg_A_32 <= 0;
		reg_B_32 <= 0;
		reg_A_33 <= 0;
		reg_B_33 <= 0;
		reg_A_34 <= 0;
		reg_B_34 <= 0;
		reg_A_35 <= 0;
		reg_B_35 <= 0;
		reg_A_36 <= 0;
		reg_B_36 <= 0;
		reg_A_37 <= 0;
		reg_B_37 <= 0;
		reg_A_38 <= 0;
		reg_B_38 <= 0;
		reg_A_39 <= 0;
		reg_B_39 <= 0;
		reg_A_40 <= 0;
		reg_B_40 <= 0;
		reg_A_41 <= 0;
		reg_B_41 <= 0;
		reg_A_42 <= 0;
		reg_B_42 <= 0;
		reg_A_43 <= 0;
		reg_B_43 <= 0;
		reg_A_44 <= 0;
		reg_B_44 <= 0;
		reg_A_45 <= 0;
		reg_B_45 <= 0;
		reg_A_46 <= 0;
		reg_B_46 <= 0;
		reg_A_47 <= 0;
		reg_B_47 <= 0;
	end else if (enable) begin
		reg_A_0 <= i_A_0;
		reg_B_0 <= i_B_0;
		reg_A_1 <= i_A_1;
		reg_B_1 <= i_B_1;
		reg_A_2 <= i_A_2;
		reg_B_2 <= i_B_2;
		reg_A_3 <= i_A_3;
		reg_B_3 <= i_B_3;
		reg_A_4 <= i_A_4;
		reg_B_4 <= i_B_4;
		reg_A_5 <= i_A_5;
		reg_B_5 <= i_B_5;
		reg_A_6 <= i_A_6;
		reg_B_6 <= i_B_6;
		reg_A_7 <= i_A_7;
		reg_B_7 <= i_B_7;
		reg_A_8 <= i_A_8;
		reg_B_8 <= i_B_8;
		reg_A_9 <= i_A_9;
		reg_B_9 <= i_B_9;
		reg_A_10 <= i_A_10;
		reg_B_10 <= i_B_10;
		reg_A_11 <= i_A_11;
		reg_B_11 <= i_B_11;
		reg_A_12 <= i_A_12;
		reg_B_12 <= i_B_12;
		reg_A_13 <= i_A_13;
		reg_B_13 <= i_B_13;
		reg_A_14 <= i_A_14;
		reg_B_14 <= i_B_14;
		reg_A_15 <= i_A_15;
		reg_B_15 <= i_B_15;
		reg_A_16 <= i_A_16;
		reg_B_16 <= i_B_16;
		reg_A_17 <= i_A_17;
		reg_B_17 <= i_B_17;
		reg_A_18 <= i_A_18;
		reg_B_18 <= i_B_18;
		reg_A_19 <= i_A_19;
		reg_B_19 <= i_B_19;
		reg_A_20 <= i_A_20;
		reg_B_20 <= i_B_20;
		reg_A_21 <= i_A_21;
		reg_B_21 <= i_B_21;
		reg_A_22 <= i_A_22;
		reg_B_22 <= i_B_22;
		reg_A_23 <= i_A_23;
		reg_B_23 <= i_B_23;
		reg_A_24 <= i_A_24;
		reg_B_24 <= i_B_24;
		reg_A_25 <= i_A_25;
		reg_B_25 <= i_B_25;
		reg_A_26 <= i_A_26;
		reg_B_26 <= i_B_26;
		reg_A_27 <= i_A_27;
		reg_B_27 <= i_B_27;
		reg_A_28 <= i_A_28;
		reg_B_28 <= i_B_28;
		reg_A_29 <= i_A_29;
		reg_B_29 <= i_B_29;
		reg_A_30 <= i_A_30;
		reg_B_30 <= i_B_30;
		reg_A_31 <= i_A_31;
		reg_B_31 <= i_B_31;
		reg_A_32 <= i_A_32;
		reg_B_32 <= i_B_32;
		reg_A_33 <= i_A_33;
		reg_B_33 <= i_B_33;
		reg_A_34 <= i_A_34;
		reg_B_34 <= i_B_34;
		reg_A_35 <= i_A_35;
		reg_B_35 <= i_B_35;
		reg_A_36 <= i_A_36;
		reg_B_36 <= i_B_36;
		reg_A_37 <= i_A_37;
		reg_B_37 <= i_B_37;
		reg_A_38 <= i_A_38;
		reg_B_38 <= i_B_38;
		reg_A_39 <= i_A_39;
		reg_B_39 <= i_B_39;
		reg_A_40 <= i_A_40;
		reg_B_40 <= i_B_40;
		reg_A_41 <= i_A_41;
		reg_B_41 <= i_B_41;
		reg_A_42 <= i_A_42;
		reg_B_42 <= i_B_42;
		reg_A_43 <= i_A_43;
		reg_B_43 <= i_B_43;
		reg_A_44 <= i_A_44;
		reg_B_44 <= i_B_44;
		reg_A_45 <= i_A_45;
		reg_B_45 <= i_B_45;
		reg_A_46 <= i_A_46;
		reg_B_46 <= i_B_46;
		reg_A_47 <= i_A_47;
		reg_B_47 <= i_B_47;
		valid_A_B <= i_valid;
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
assign valid_C = round_valid_0;
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule

module shift_register_unit_18_18 (
	input clk,
	input reset,
	input enable,
	input [17:0] in,
	output [17:0] out
);

reg [17:0] shift_registers_0;
reg [17:0] shift_registers_1;
reg [17:0] shift_registers_2;
reg [17:0] shift_registers_3;
reg [17:0] shift_registers_4;
reg [17:0] shift_registers_5;
reg [17:0] shift_registers_6;
reg [17:0] shift_registers_7;
reg [17:0] shift_registers_8;
reg [17:0] shift_registers_9;
reg [17:0] shift_registers_10;
reg [17:0] shift_registers_11;
reg [17:0] shift_registers_12;
reg [17:0] shift_registers_13;
reg [17:0] shift_registers_14;
reg [17:0] shift_registers_15;
reg [17:0] shift_registers_16;
reg [17:0] shift_registers_17;
always @ (posedge clk) begin
	if (reset) begin
		shift_registers_0 <= 18'd0;
		shift_registers_1 <= 18'd0;
		shift_registers_2 <= 18'd0;
		shift_registers_3 <= 18'd0;
		shift_registers_4 <= 18'd0;
		shift_registers_5 <= 18'd0;
		shift_registers_6 <= 18'd0;
		shift_registers_7 <= 18'd0;
		shift_registers_8 <= 18'd0;
		shift_registers_9 <= 18'd0;
		shift_registers_10 <= 18'd0;
		shift_registers_11 <= 18'd0;
		shift_registers_12 <= 18'd0;
		shift_registers_13 <= 18'd0;
		shift_registers_14 <= 18'd0;
		shift_registers_15 <= 18'd0;
		shift_registers_16 <= 18'd0;
		shift_registers_17 <= 18'd0;
	end else if (enable) begin
		shift_registers_0 <= in;
		shift_registers_1 <= shift_registers_0;
		shift_registers_2 <= shift_registers_1;
		shift_registers_3 <= shift_registers_2;
		shift_registers_4 <= shift_registers_3;
		shift_registers_5 <= shift_registers_4;
		shift_registers_6 <= shift_registers_5;
		shift_registers_7 <= shift_registers_6;
		shift_registers_8 <= shift_registers_7;
		shift_registers_9 <= shift_registers_8;
		shift_registers_10 <= shift_registers_9;
		shift_registers_11 <= shift_registers_10;
		shift_registers_12 <= shift_registers_11;
		shift_registers_13 <= shift_registers_12;
		shift_registers_14 <= shift_registers_13;
		shift_registers_15 <= shift_registers_14;
		shift_registers_16 <= shift_registers_15;
		shift_registers_17 <= shift_registers_16;
	end
end

assign out = shift_registers_17;

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



module dsp_signed_mult_18x18_unit_18_18_1 (
	input clk,
	input reset,
	input ena,
	input i_valid,
	input [17:0] ax,
	input [17:0] ay,
	input [17:0] bx,
	input [17:0] by,
	output o_valid,
	output [36:0] resulta,
	output [36:0] resultb 
);

reg [17:0] reg_ax, reg_ay, reg_bx, reg_by;
reg [36:0] reg_resa, reg_resb;
always @(posedge clk) begin
	if (reset) begin
		reg_ax <= 0;
		reg_ay <= 0;
		reg_bx <= 0;
		reg_by <= 0;
		reg_resa <= 0;
		reg_resb <= 0;
	end else if (ena) begin
		reg_ax <= ax;
		reg_ay <= ay;
		reg_bx <= bx;
		reg_by <= by;
		reg_resa <= reg_ax * reg_ay;
		reg_resb <= reg_bx * reg_by;
	end
end

assign resulta = reg_resa;
assign resultb = reg_resb;
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

module fp_rounding_unit_1_37_10 (
	input clk,
	input reset,
	input enable,
	input i_valid,
	input [36:0] in,
	output [36:0] out,
	output o_valid
);

reg [36:0] rounded_result;
reg [36:0] floor;
reg [36:0] ceil;
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
reg [36:0] out_reg;
always @ (posedge clk) begin
	if (reset) begin
		is_ceil <= 1'b0;
		floor_ceil_valid <= 1'b0;
		valid_reg <= 1'b0;
		floor <= 0;
		ceil <= 0;
		out_reg <= 0;
	end else if (enable) begin
		is_ceil <= in[9];
		floor <= in >>> 10;
		ceil <= (in >>> 10) + 1;
		floor_ceil_valid <= i_valid;
		out_reg <= rounded_result;
		valid_reg <= floor_ceil_valid;
	end
end

assign o_valid = valid_reg;

assign out = out_reg;

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






































