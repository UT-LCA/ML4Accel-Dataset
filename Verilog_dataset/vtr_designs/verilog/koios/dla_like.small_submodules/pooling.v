`define SIMULATION_MEMORY

module pooling (
	input clk,
	input i_valid,
	input i_reset,
	input [15:0] i_result_0,
	input [15:0] i_result_1,
	input [15:0] i_result_2,
	input [15:0] i_result_3,
	output [15:0] o_result,
	output o_valid
);

reg [15:0] buffer_0_0;
reg [15:0] buffer_0_1;
reg [15:0] buffer_1_0;
reg [15:0] buffer_1_1;
reg [1:0] count;
reg [0:0] s_count;
reg [15:0] result_0;
reg [15:0] result_1;
reg valid_1, valid_2, valid_3;

always @(posedge clk) begin
	buffer_0_1 <= buffer_0_0;
	buffer_1_1 <= buffer_1_0;
	valid_1 <= i_valid;
	valid_2 <= valid_1;
	valid_3 <= valid_2;
	if (i_valid) begin
		count <= 0;
	end else begin
		if(count == 3) begin
			count <= 0;
		end else begin
			count <= count + 1'b1;
		end
		if(i_result_0 > i_result_1) begin
			buffer_0_0 <= i_result_0;
		end else begin
			buffer_0_0 <= i_result_1;
		end
		if(i_result_2 > i_result_3) begin
			buffer_1_0 <= i_result_2;
		end else begin
			buffer_1_0 <= i_result_3;
		end
	end
end

always @(posedge clk) begin
	if (i_reset) begin
		s_count <= 0;
	end else if (valid_1 || valid_2) begin
		if (s_count == 1) begin
			if (buffer_0_0 > buffer_0_1) begin
				result_0 <= buffer_0_0;
			end else begin
				result_0 <= buffer_0_1;
			end
			if (buffer_1_0 > buffer_1_1) begin
				result_1 <= buffer_1_0;
			end else begin
				result_1 <= buffer_1_1;
			end
			s_count <= 0;
		end else begin
			result_0 <= result_1;
			s_count <= s_count + 1'b1;
		end
	end else begin
		s_count <= 0;
	end
end

assign o_result = result_0;
assign o_valid  = valid_3;

endmodule
