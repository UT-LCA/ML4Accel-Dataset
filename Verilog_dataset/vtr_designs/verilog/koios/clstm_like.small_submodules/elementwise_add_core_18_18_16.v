`define SIMULATION_MEMORY

module elementwise_add_core_18_18_16 (
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
assign o_ready = i_ready;
assign o_valid = valid_C & i_ready;

endmodule
