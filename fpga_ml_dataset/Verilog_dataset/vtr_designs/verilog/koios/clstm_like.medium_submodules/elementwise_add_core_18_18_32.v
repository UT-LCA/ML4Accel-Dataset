`define SIMULATION_MEMORY

module elementwise_add_core_18_18_32 (
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
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule
