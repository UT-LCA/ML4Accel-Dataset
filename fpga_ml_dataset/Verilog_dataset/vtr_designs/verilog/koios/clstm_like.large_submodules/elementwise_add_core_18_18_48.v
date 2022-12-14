`define SIMULATION_MEMORY

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
