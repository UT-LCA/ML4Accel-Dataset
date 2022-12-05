`define SIMULATION_MEMORY

module pipelined_input_18_2_16 (
	input clk,
	input reset,
	input enable,
	input load_input,
	input [17:0] i_data_0_0,
	input [17:0] i_data_0_1,
	input [17:0] i_data_0_2,
	input [17:0] i_data_0_3,
	input [17:0] i_data_0_4,
	input [17:0] i_data_0_5,
	input [17:0] i_data_0_6,
	input [17:0] i_data_0_7,
	input [17:0] i_data_0_8,
	input [17:0] i_data_0_9,
	input [17:0] i_data_0_10,
	input [17:0] i_data_0_11,
	input [17:0] i_data_0_12,
	input [17:0] i_data_0_13,
	input [17:0] i_data_0_14,
	input [17:0] i_data_0_15,
	input [17:0] i_data_1_0,
	input [17:0] i_data_1_1,
	input [17:0] i_data_1_2,
	input [17:0] i_data_1_3,
	input [17:0] i_data_1_4,
	input [17:0] i_data_1_5,
	input [17:0] i_data_1_6,
	input [17:0] i_data_1_7,
	input [17:0] i_data_1_8,
	input [17:0] i_data_1_9,
	input [17:0] i_data_1_10,
	input [17:0] i_data_1_11,
	input [17:0] i_data_1_12,
	input [17:0] i_data_1_13,
	input [17:0] i_data_1_14,
	input [17:0] i_data_1_15,
	output [17:0] o_data_0,
	output [17:0] o_data_1,
	output [17:0] o_data_2,
	output [17:0] o_data_3,
	output [17:0] o_data_4,
	output [17:0] o_data_5,
	output [17:0] o_data_6,
	output [17:0] o_data_7,
	output [17:0] o_data_8,
	output [17:0] o_data_9,
	output [17:0] o_data_10,
	output [17:0] o_data_11,
	output [17:0] o_data_12,
	output [17:0] o_data_13,
	output [17:0] o_data_14,
	output [17:0] o_data_15,
	output o_valid
);

reg [17:0] pipeline_0_0;
reg [17:0] pipeline_0_1;
reg [17:0] pipeline_0_2;
reg [17:0] pipeline_0_3;
reg [17:0] pipeline_0_4;
reg [17:0] pipeline_0_5;
reg [17:0] pipeline_0_6;
reg [17:0] pipeline_0_7;
reg [17:0] pipeline_0_8;
reg [17:0] pipeline_0_9;
reg [17:0] pipeline_0_10;
reg [17:0] pipeline_0_11;
reg [17:0] pipeline_0_12;
reg [17:0] pipeline_0_13;
reg [17:0] pipeline_0_14;
reg [17:0] pipeline_0_15;
reg [17:0] pipeline_1_0;
reg [17:0] pipeline_1_1;
reg [17:0] pipeline_1_2;
reg [17:0] pipeline_1_3;
reg [17:0] pipeline_1_4;
reg [17:0] pipeline_1_5;
reg [17:0] pipeline_1_6;
reg [17:0] pipeline_1_7;
reg [17:0] pipeline_1_8;
reg [17:0] pipeline_1_9;
reg [17:0] pipeline_1_10;
reg [17:0] pipeline_1_11;
reg [17:0] pipeline_1_12;
reg [17:0] pipeline_1_13;
reg [17:0] pipeline_1_14;
reg [17:0] pipeline_1_15;
reg [17:0] pipeline_2_0;
reg [17:0] pipeline_2_1;
reg [17:0] pipeline_2_2;
reg [17:0] pipeline_2_3;
reg [17:0] pipeline_2_4;
reg [17:0] pipeline_2_5;
reg [17:0] pipeline_2_6;
reg [17:0] pipeline_2_7;
reg [17:0] pipeline_2_8;
reg [17:0] pipeline_2_9;
reg [17:0] pipeline_2_10;
reg [17:0] pipeline_2_11;
reg [17:0] pipeline_2_12;
reg [17:0] pipeline_2_13;
reg [17:0] pipeline_2_14;
reg [17:0] pipeline_2_15;
reg pipeline_valid_0;
reg pipeline_valid_1;
reg pipeline_valid_2;

always @ (posedge clk) begin
	if (reset) begin
		pipeline_0_0 <= 0;
		pipeline_0_1 <= 0;
		pipeline_0_2 <= 0;
		pipeline_0_3 <= 0;
		pipeline_0_4 <= 0;
		pipeline_0_5 <= 0;
		pipeline_0_6 <= 0;
		pipeline_0_7 <= 0;
		pipeline_0_8 <= 0;
		pipeline_0_9 <= 0;
		pipeline_0_10 <= 0;
		pipeline_0_11 <= 0;
		pipeline_0_12 <= 0;
		pipeline_0_13 <= 0;
		pipeline_0_14 <= 0;
		pipeline_0_15 <= 0;
		pipeline_1_0 <= 0;
		pipeline_1_1 <= 0;
		pipeline_1_2 <= 0;
		pipeline_1_3 <= 0;
		pipeline_1_4 <= 0;
		pipeline_1_5 <= 0;
		pipeline_1_6 <= 0;
		pipeline_1_7 <= 0;
		pipeline_1_8 <= 0;
		pipeline_1_9 <= 0;
		pipeline_1_10 <= 0;
		pipeline_1_11 <= 0;
		pipeline_1_12 <= 0;
		pipeline_1_13 <= 0;
		pipeline_1_14 <= 0;
		pipeline_1_15 <= 0;
		pipeline_2_0 <= 0;
		pipeline_2_1 <= 0;
		pipeline_2_2 <= 0;
		pipeline_2_3 <= 0;
		pipeline_2_4 <= 0;
		pipeline_2_5 <= 0;
		pipeline_2_6 <= 0;
		pipeline_2_7 <= 0;
		pipeline_2_8 <= 0;
		pipeline_2_9 <= 0;
		pipeline_2_10 <= 0;
		pipeline_2_11 <= 0;
		pipeline_2_12 <= 0;
		pipeline_2_13 <= 0;
		pipeline_2_14 <= 0;
		pipeline_2_15 <= 0;
		pipeline_valid_0 <= 0;
		pipeline_valid_1 <= 0;
		pipeline_valid_2 <= 0;
	end else if (enable) begin
		if (load_input) begin
			pipeline_0_0 <= i_data_0_0;
			pipeline_0_1 <= i_data_0_1;
			pipeline_0_2 <= i_data_0_2;
			pipeline_0_3 <= i_data_0_3;
			pipeline_0_4 <= i_data_0_4;
			pipeline_0_5 <= i_data_0_5;
			pipeline_0_6 <= i_data_0_6;
			pipeline_0_7 <= i_data_0_7;
			pipeline_0_8 <= i_data_0_8;
			pipeline_0_9 <= i_data_0_9;
			pipeline_0_10 <= i_data_0_10;
			pipeline_0_11 <= i_data_0_11;
			pipeline_0_12 <= i_data_0_12;
			pipeline_0_13 <= i_data_0_13;
			pipeline_0_14 <= i_data_0_14;
			pipeline_0_15 <= i_data_0_15;
			pipeline_valid_0 <= 1'b1;
			pipeline_2_0 <= i_data_1_0;
			pipeline_2_1 <= i_data_1_1;
			pipeline_2_2 <= i_data_1_2;
			pipeline_2_3 <= i_data_1_3;
			pipeline_2_4 <= i_data_1_4;
			pipeline_2_5 <= i_data_1_5;
			pipeline_2_6 <= i_data_1_6;
			pipeline_2_7 <= i_data_1_7;
			pipeline_2_8 <= i_data_1_8;
			pipeline_2_9 <= i_data_1_9;
			pipeline_2_10 <= i_data_1_10;
			pipeline_2_11 <= i_data_1_11;
			pipeline_2_12 <= i_data_1_12;
			pipeline_2_13 <= i_data_1_13;
			pipeline_2_14 <= i_data_1_14;
			pipeline_2_15 <= i_data_1_15;
			pipeline_valid_2 <= 1'b1;
			pipeline_1_0 <= i_data_1_0;
			pipeline_1_1 <= i_data_1_1;
			pipeline_1_2 <= i_data_1_2;
			pipeline_1_3 <= i_data_1_3;
			pipeline_1_4 <= i_data_1_4;
			pipeline_1_5 <= i_data_1_5;
			pipeline_1_6 <= i_data_1_6;
			pipeline_1_7 <= i_data_1_7;
			pipeline_1_8 <= i_data_1_8;
			pipeline_1_9 <= i_data_1_9;
			pipeline_1_10 <= i_data_1_10;
			pipeline_1_11 <= i_data_1_11;
			pipeline_1_12 <= i_data_1_12;
			pipeline_1_13 <= i_data_1_13;
			pipeline_1_14 <= i_data_1_14;
			pipeline_1_15 <= i_data_1_15;
			pipeline_valid_1 <= 1'b0;
		end else begin
			pipeline_2_0 <= 0;
			pipeline_2_1 <= 0;
			pipeline_2_2 <= 0;
			pipeline_2_3 <= 0;
			pipeline_2_4 <= 0;
			pipeline_2_5 <= 0;
			pipeline_2_6 <= 0;
			pipeline_2_7 <= 0;
			pipeline_2_8 <= 0;
			pipeline_2_9 <= 0;
			pipeline_2_10 <= 0;
			pipeline_2_11 <= 0;
			pipeline_2_12 <= 0;
			pipeline_2_13 <= 0;
			pipeline_2_14 <= 0;
			pipeline_2_15 <= 0;
			pipeline_valid_2 <= 1'b0;
			pipeline_0_0 <= pipeline_1_0;
			pipeline_0_1 <= pipeline_1_1;
			pipeline_0_2 <= pipeline_1_2;
			pipeline_0_3 <= pipeline_1_3;
			pipeline_0_4 <= pipeline_1_4;
			pipeline_0_5 <= pipeline_1_5;
			pipeline_0_6 <= pipeline_1_6;
			pipeline_0_7 <= pipeline_1_7;
			pipeline_0_8 <= pipeline_1_8;
			pipeline_0_9 <= pipeline_1_9;
			pipeline_0_10 <= pipeline_1_10;
			pipeline_0_11 <= pipeline_1_11;
			pipeline_0_12 <= pipeline_1_12;
			pipeline_0_13 <= pipeline_1_13;
			pipeline_0_14 <= pipeline_1_14;
			pipeline_0_15 <= pipeline_1_15;
			pipeline_valid_0 <= pipeline_valid_1;
			pipeline_1_0 <= pipeline_2_0;
			pipeline_1_1 <= pipeline_2_1;
			pipeline_1_2 <= pipeline_2_2;
			pipeline_1_3 <= pipeline_2_3;
			pipeline_1_4 <= pipeline_2_4;
			pipeline_1_5 <= pipeline_2_5;
			pipeline_1_6 <= pipeline_2_6;
			pipeline_1_7 <= pipeline_2_7;
			pipeline_1_8 <= pipeline_2_8;
			pipeline_1_9 <= pipeline_2_9;
			pipeline_1_10 <= pipeline_2_10;
			pipeline_1_11 <= pipeline_2_11;
			pipeline_1_12 <= pipeline_2_12;
			pipeline_1_13 <= pipeline_2_13;
			pipeline_1_14 <= pipeline_2_14;
			pipeline_1_15 <= pipeline_2_15;
			pipeline_valid_1 <= pipeline_valid_2;
		end
	end
end

assign o_data_0 = pipeline_0_0;
assign o_data_1 = pipeline_0_1;
assign o_data_2 = pipeline_0_2;
assign o_data_3 = pipeline_0_3;
assign o_data_4 = pipeline_0_4;
assign o_data_5 = pipeline_0_5;
assign o_data_6 = pipeline_0_6;
assign o_data_7 = pipeline_0_7;
assign o_data_8 = pipeline_0_8;
assign o_data_9 = pipeline_0_9;
assign o_data_10 = pipeline_0_10;
assign o_data_11 = pipeline_0_11;
assign o_data_12 = pipeline_0_12;
assign o_data_13 = pipeline_0_13;
assign o_data_14 = pipeline_0_14;
assign o_data_15 = pipeline_0_15;
assign o_valid = pipeline_valid_0;

endmodule
