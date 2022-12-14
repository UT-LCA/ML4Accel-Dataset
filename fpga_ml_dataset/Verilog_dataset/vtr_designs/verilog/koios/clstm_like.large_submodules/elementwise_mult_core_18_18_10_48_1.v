`define SIMULATION_MEMORY

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






