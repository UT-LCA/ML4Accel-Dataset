`define SIMULATION_MEMORY

module sum_complex_vector_unit_18_18_16_64 (
	input clk,
	input clr,
	input i_valid,
	input enable,
	input [17:0] i_real_0,
	input [17:0] i_imag_0,
	output [17:0] o_real_0,
	output [17:0] o_imag_0,
	input [17:0] i_real_1,
	input [17:0] i_imag_1,
	output [17:0] o_real_1,
	output [17:0] o_imag_1,
	input [17:0] i_real_2,
	input [17:0] i_imag_2,
	output [17:0] o_real_2,
	output [17:0] o_imag_2,
	input [17:0] i_real_3,
	input [17:0] i_imag_3,
	output [17:0] o_real_3,
	output [17:0] o_imag_3,
	input [17:0] i_real_4,
	input [17:0] i_imag_4,
	output [17:0] o_real_4,
	output [17:0] o_imag_4,
	input [17:0] i_real_5,
	input [17:0] i_imag_5,
	output [17:0] o_real_5,
	output [17:0] o_imag_5,
	input [17:0] i_real_6,
	input [17:0] i_imag_6,
	output [17:0] o_real_6,
	output [17:0] o_imag_6,
	input [17:0] i_real_7,
	input [17:0] i_imag_7,
	output [17:0] o_real_7,
	output [17:0] o_imag_7,
	input [17:0] i_real_8,
	input [17:0] i_imag_8,
	output [17:0] o_real_8,
	output [17:0] o_imag_8,
	input [17:0] i_real_9,
	input [17:0] i_imag_9,
	output [17:0] o_real_9,
	output [17:0] o_imag_9,
	input [17:0] i_real_10,
	input [17:0] i_imag_10,
	output [17:0] o_real_10,
	output [17:0] o_imag_10,
	input [17:0] i_real_11,
	input [17:0] i_imag_11,
	output [17:0] o_real_11,
	output [17:0] o_imag_11,
	input [17:0] i_real_12,
	input [17:0] i_imag_12,
	output [17:0] o_real_12,
	output [17:0] o_imag_12,
	input [17:0] i_real_13,
	input [17:0] i_imag_13,
	output [17:0] o_real_13,
	output [17:0] o_imag_13,
	input [17:0] i_real_14,
	input [17:0] i_imag_14,
	output [17:0] o_real_14,
	output [17:0] o_imag_14,
	input [17:0] i_real_15,
	input [17:0] i_imag_15,
	output [17:0] o_real_15,
	output [17:0] o_imag_15,
	output o_valid
);

reg [17:0] sum_real_0;
reg [17:0] sum_imag_0;
reg [17:0] sum_real_1;
reg [17:0] sum_imag_1;
reg [17:0] sum_real_2;
reg [17:0] sum_imag_2;
reg [17:0] sum_real_3;
reg [17:0] sum_imag_3;
reg [17:0] sum_real_4;
reg [17:0] sum_imag_4;
reg [17:0] sum_real_5;
reg [17:0] sum_imag_5;
reg [17:0] sum_real_6;
reg [17:0] sum_imag_6;
reg [17:0] sum_real_7;
reg [17:0] sum_imag_7;
reg [17:0] sum_real_8;
reg [17:0] sum_imag_8;
reg [17:0] sum_real_9;
reg [17:0] sum_imag_9;
reg [17:0] sum_real_10;
reg [17:0] sum_imag_10;
reg [17:0] sum_real_11;
reg [17:0] sum_imag_11;
reg [17:0] sum_real_12;
reg [17:0] sum_imag_12;
reg [17:0] sum_real_13;
reg [17:0] sum_imag_13;
reg [17:0] sum_real_14;
reg [17:0] sum_imag_14;
reg [17:0] sum_real_15;
reg [17:0] sum_imag_15;
reg reg_i_valid;

// Count the number data in accumulation
reg [13:0] counter;
wire counter_full;
always @ (posedge clk) begin 
	if (clr) begin
		sum_real_0 <= 0;
		sum_imag_0 <= 0;
		sum_real_1 <= 0;
		sum_imag_1 <= 0;
		sum_real_2 <= 0;
		sum_imag_2 <= 0;
		sum_real_3 <= 0;
		sum_imag_3 <= 0;
		sum_real_4 <= 0;
		sum_imag_4 <= 0;
		sum_real_5 <= 0;
		sum_imag_5 <= 0;
		sum_real_6 <= 0;
		sum_imag_6 <= 0;
		sum_real_7 <= 0;
		sum_imag_7 <= 0;
		sum_real_8 <= 0;
		sum_imag_8 <= 0;
		sum_real_9 <= 0;
		sum_imag_9 <= 0;
		sum_real_10 <= 0;
		sum_imag_10 <= 0;
		sum_real_11 <= 0;
		sum_imag_11 <= 0;
		sum_real_12 <= 0;
		sum_imag_12 <= 0;
		sum_real_13 <= 0;
		sum_imag_13 <= 0;
		sum_real_14 <= 0;
		sum_imag_14 <= 0;
		sum_real_15 <= 0;
		sum_imag_15 <= 0;
		counter <= 14'd0;
		reg_i_valid <= 1'b0;
	end else if (enable) begin
		reg_i_valid <= i_valid;
		// Accumulate the number only when data is valid
		if (i_valid) begin
			if (counter == 64)
				counter <= 1;
			else
				counter <= counter + 1;

			if (counter == 64) begin
				sum_real_0 <= i_real_0;
				sum_imag_0 <= i_imag_0;
				sum_real_1 <= i_real_1;
				sum_imag_1 <= i_imag_1;
				sum_real_2 <= i_real_2;
				sum_imag_2 <= i_imag_2;
				sum_real_3 <= i_real_3;
				sum_imag_3 <= i_imag_3;
				sum_real_4 <= i_real_4;
				sum_imag_4 <= i_imag_4;
				sum_real_5 <= i_real_5;
				sum_imag_5 <= i_imag_5;
				sum_real_6 <= i_real_6;
				sum_imag_6 <= i_imag_6;
				sum_real_7 <= i_real_7;
				sum_imag_7 <= i_imag_7;
				sum_real_8 <= i_real_8;
				sum_imag_8 <= i_imag_8;
				sum_real_9 <= i_real_9;
				sum_imag_9 <= i_imag_9;
				sum_real_10 <= i_real_10;
				sum_imag_10 <= i_imag_10;
				sum_real_11 <= i_real_11;
				sum_imag_11 <= i_imag_11;
				sum_real_12 <= i_real_12;
				sum_imag_12 <= i_imag_12;
				sum_real_13 <= i_real_13;
				sum_imag_13 <= i_imag_13;
				sum_real_14 <= i_real_14;
				sum_imag_14 <= i_imag_14;
				sum_real_15 <= i_real_15;
				sum_imag_15 <= i_imag_15;
			end else begin
				sum_real_0 <= sum_real_0 + i_real_0;
				sum_imag_0 <= sum_imag_0 + i_imag_0;
				sum_real_1 <= sum_real_1 + i_real_1;
				sum_imag_1 <= sum_imag_1 + i_imag_1;
				sum_real_2 <= sum_real_2 + i_real_2;
				sum_imag_2 <= sum_imag_2 + i_imag_2;
				sum_real_3 <= sum_real_3 + i_real_3;
				sum_imag_3 <= sum_imag_3 + i_imag_3;
				sum_real_4 <= sum_real_4 + i_real_4;
				sum_imag_4 <= sum_imag_4 + i_imag_4;
				sum_real_5 <= sum_real_5 + i_real_5;
				sum_imag_5 <= sum_imag_5 + i_imag_5;
				sum_real_6 <= sum_real_6 + i_real_6;
				sum_imag_6 <= sum_imag_6 + i_imag_6;
				sum_real_7 <= sum_real_7 + i_real_7;
				sum_imag_7 <= sum_imag_7 + i_imag_7;
				sum_real_8 <= sum_real_8 + i_real_8;
				sum_imag_8 <= sum_imag_8 + i_imag_8;
				sum_real_9 <= sum_real_9 + i_real_9;
				sum_imag_9 <= sum_imag_9 + i_imag_9;
				sum_real_10 <= sum_real_10 + i_real_10;
				sum_imag_10 <= sum_imag_10 + i_imag_10;
				sum_real_11 <= sum_real_11 + i_real_11;
				sum_imag_11 <= sum_imag_11 + i_imag_11;
				sum_real_12 <= sum_real_12 + i_real_12;
				sum_imag_12 <= sum_imag_12 + i_imag_12;
				sum_real_13 <= sum_real_13 + i_real_13;
				sum_imag_13 <= sum_imag_13 + i_imag_13;
				sum_real_14 <= sum_real_14 + i_real_14;
				sum_imag_14 <= sum_imag_14 + i_imag_14;
				sum_real_15 <= sum_real_15 + i_real_15;
				sum_imag_15 <= sum_imag_15 + i_imag_15;
			end
		end
	end
end

assign counter_full = (counter == 64);
assign o_real_0 = sum_real_0;
assign o_imag_0 = sum_imag_0;
assign o_real_1 = sum_real_1;
assign o_imag_1 = sum_imag_1;
assign o_real_2 = sum_real_2;
assign o_imag_2 = sum_imag_2;
assign o_real_3 = sum_real_3;
assign o_imag_3 = sum_imag_3;
assign o_real_4 = sum_real_4;
assign o_imag_4 = sum_imag_4;
assign o_real_5 = sum_real_5;
assign o_imag_5 = sum_imag_5;
assign o_real_6 = sum_real_6;
assign o_imag_6 = sum_imag_6;
assign o_real_7 = sum_real_7;
assign o_imag_7 = sum_imag_7;
assign o_real_8 = sum_real_8;
assign o_imag_8 = sum_imag_8;
assign o_real_9 = sum_real_9;
assign o_imag_9 = sum_imag_9;
assign o_real_10 = sum_real_10;
assign o_imag_10 = sum_imag_10;
assign o_real_11 = sum_real_11;
assign o_imag_11 = sum_imag_11;
assign o_real_12 = sum_real_12;
assign o_imag_12 = sum_imag_12;
assign o_real_13 = sum_real_13;
assign o_imag_13 = sum_imag_13;
assign o_real_14 = sum_real_14;
assign o_imag_14 = sum_imag_14;
assign o_real_15 = sum_real_15;
assign o_imag_15 = sum_imag_15;
assign o_valid = counter_full & reg_i_valid;

endmodule
