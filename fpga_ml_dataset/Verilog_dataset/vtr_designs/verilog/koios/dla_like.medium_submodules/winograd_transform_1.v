`define SIMULATION_MEMORY

module winograd_transform_1 (
	input clk,
	input i_valid,
	input [15:0] i_result_0_0,
	input [15:0] i_result_0_1,
	input [15:0] i_result_0_2,
	input [15:0] i_result_0_3,
	input [15:0] i_result_1_0,
	input [15:0] i_result_1_1,
	input [15:0] i_result_1_2,
	input [15:0] i_result_1_3,
	input [15:0] i_result_2_0,
	input [15:0] i_result_2_1,
	input [15:0] i_result_2_2,
	input [15:0] i_result_2_3,
	input [15:0] i_result_3_0,
	input [15:0] i_result_3_1,
	input [15:0] i_result_3_2,
	input [15:0] i_result_3_3,
	input [15:0] i_result_4_0,
	input [15:0] i_result_4_1,
	input [15:0] i_result_4_2,
	input [15:0] i_result_4_3,
	input [15:0] i_result_5_0,
	input [15:0] i_result_5_1,
	input [15:0] i_result_5_2,
	input [15:0] i_result_5_3,
	output [15:0] o_feature_0,
	output [15:0] o_feature_1,
	output [15:0] o_feature_2,
	output [15:0] o_feature_3,
	output [15:0] o_feature_4,
	output [15:0] o_feature_5,
	output o_valid
);

reg [15:0] input_buffer_0_0;
reg [19:0] output_buffer_0_0;
wire [19:0] rslt_buffer_0_0;
reg [15:0] input_buffer_0_1;
reg [19:0] output_buffer_0_1;
wire [19:0] rslt_buffer_0_1;
reg [15:0] input_buffer_0_2;
reg [19:0] output_buffer_0_2;
wire [19:0] rslt_buffer_0_2;
reg [15:0] input_buffer_0_3;
reg [19:0] output_buffer_0_3;
wire [19:0] rslt_buffer_0_3;
reg [15:0] input_buffer_0_4;
reg [19:0] output_buffer_0_4;
wire [19:0] rslt_buffer_0_4;
reg [15:0] input_buffer_0_5;
reg [19:0] output_buffer_0_5;
wire [19:0] rslt_buffer_0_5;
reg [15:0] input_buffer_1_0;
reg [19:0] output_buffer_1_0;
wire [19:0] rslt_buffer_1_0;
reg [15:0] input_buffer_1_1;
reg [19:0] output_buffer_1_1;
wire [19:0] rslt_buffer_1_1;
reg [15:0] input_buffer_1_2;
reg [19:0] output_buffer_1_2;
wire [19:0] rslt_buffer_1_2;
reg [15:0] input_buffer_1_3;
reg [19:0] output_buffer_1_3;
wire [19:0] rslt_buffer_1_3;
reg [15:0] input_buffer_1_4;
reg [19:0] output_buffer_1_4;
wire [19:0] rslt_buffer_1_4;
reg [15:0] input_buffer_1_5;
reg [19:0] output_buffer_1_5;
wire [19:0] rslt_buffer_1_5;
reg [15:0] input_buffer_2_0;
reg [19:0] output_buffer_2_0;
wire [19:0] rslt_buffer_2_0;
reg [15:0] input_buffer_2_1;
reg [19:0] output_buffer_2_1;
wire [19:0] rslt_buffer_2_1;
reg [15:0] input_buffer_2_2;
reg [19:0] output_buffer_2_2;
wire [19:0] rslt_buffer_2_2;
reg [15:0] input_buffer_2_3;
reg [19:0] output_buffer_2_3;
wire [19:0] rslt_buffer_2_3;
reg [15:0] input_buffer_2_4;
reg [19:0] output_buffer_2_4;
wire [19:0] rslt_buffer_2_4;
reg [15:0] input_buffer_2_5;
reg [19:0] output_buffer_2_5;
wire [19:0] rslt_buffer_2_5;
reg [15:0] input_buffer_3_0;
reg [19:0] output_buffer_3_0;
wire [19:0] rslt_buffer_3_0;
reg [15:0] input_buffer_3_1;
reg [19:0] output_buffer_3_1;
wire [19:0] rslt_buffer_3_1;
reg [15:0] input_buffer_3_2;
reg [19:0] output_buffer_3_2;
wire [19:0] rslt_buffer_3_2;
reg [15:0] input_buffer_3_3;
reg [19:0] output_buffer_3_3;
wire [19:0] rslt_buffer_3_3;
reg [15:0] input_buffer_3_4;
reg [19:0] output_buffer_3_4;
wire [19:0] rslt_buffer_3_4;
reg [15:0] input_buffer_3_5;
reg [19:0] output_buffer_3_5;
wire [19:0] rslt_buffer_3_5;
reg [15:0] input_buffer_4_0;
reg [19:0] output_buffer_4_0;
wire [19:0] rslt_buffer_4_0;
reg [15:0] input_buffer_4_1;
reg [19:0] output_buffer_4_1;
wire [19:0] rslt_buffer_4_1;
reg [15:0] input_buffer_4_2;
reg [19:0] output_buffer_4_2;
wire [19:0] rslt_buffer_4_2;
reg [15:0] input_buffer_4_3;
reg [19:0] output_buffer_4_3;
wire [19:0] rslt_buffer_4_3;
reg [15:0] input_buffer_4_4;
reg [19:0] output_buffer_4_4;
wire [19:0] rslt_buffer_4_4;
reg [15:0] input_buffer_4_5;
reg [19:0] output_buffer_4_5;
wire [19:0] rslt_buffer_4_5;
reg [15:0] input_buffer_5_0;
reg [19:0] output_buffer_5_0;
wire [19:0] rslt_buffer_5_0;
reg [15:0] input_buffer_5_1;
reg [19:0] output_buffer_5_1;
wire [19:0] rslt_buffer_5_1;
reg [15:0] input_buffer_5_2;
reg [19:0] output_buffer_5_2;
wire [19:0] rslt_buffer_5_2;
reg [15:0] input_buffer_5_3;
reg [19:0] output_buffer_5_3;
wire [19:0] rslt_buffer_5_3;
reg [15:0] input_buffer_5_4;
reg [19:0] output_buffer_5_4;
wire [19:0] rslt_buffer_5_4;
reg [15:0] input_buffer_5_5;
reg [19:0] output_buffer_5_5;
wire [19:0] rslt_buffer_5_5;
reg calculate, calculate_1, calculate_2, calculate_3;
reg valid_0;
reg valid_1;
reg valid_2;
reg valid_3;
reg valid_4;
reg valid_5;
reg valid_6;
reg valid_7;
reg valid_8;
reg valid_9;
reg valid_10;
reg valid_11;
reg valid_12;
reg [2:0] input_buffer_count;
wire [15:0] dsp_out_1_0;
wire [15:0] dsp_out_1_1;
wire [15:0] dsp_out_1_2;
wire [15:0] dsp_out_1_3;
wire [15:0] dsp_out_1_4;
wire [15:0] dsp_out_1_5;
wire [15:0] dsp_out_1_6;
wire [15:0] dsp_out_1_7;
wire [15:0] dsp_out_1_8;
wire [15:0] dsp_out_1_9;
wire [15:0] dsp_out_1_10;
wire [15:0] dsp_out_1_11;
wire [15:0] dsp_out_2_0;
wire [15:0] dsp_out_2_1;
wire [15:0] dsp_out_2_2;
wire [15:0] dsp_out_2_3;
wire [15:0] dsp_out_2_4;
wire [15:0] dsp_out_2_5;
wire [15:0] dsp_out_2_6;
wire [15:0] dsp_out_2_7;
wire [15:0] dsp_out_3_0;
wire [15:0] dsp_out_3_1;
wire [15:0] dsp_out_3_2;
wire [15:0] dsp_out_3_3;
wire [15:0] dsp_out_3_4;
wire [15:0] dsp_out_3_5;
wire [15:0] dsp_out_3_6;
wire [15:0] dsp_out_3_7;
wire [15:0] dsp_out_4_0;
wire [15:0] dsp_out_4_1;
wire [15:0] dsp_out_4_2;
wire [15:0] dsp_out_4_3;
wire [15:0] dsp_out_4_4;
wire [15:0] dsp_out_4_5;
wire [15:0] dsp_out_4_6;
wire [15:0] dsp_out_4_7;
wire [15:0] dsp_out_5_0;
wire [15:0] dsp_out_5_1;
wire [15:0] dsp_out_5_2;
wire [15:0] dsp_out_5_3;
wire [15:0] dsp_out_5_4;
wire [15:0] dsp_out_5_5;
wire [15:0] dsp_out_5_6;
wire [15:0] dsp_out_5_7;
wire [15:0] dsp_out_6_0;
wire [15:0] dsp_out_6_1;
wire [15:0] dsp_out_6_2;
wire [15:0] dsp_out_6_3;
wire [15:0] dsp_out_6_4;
wire [15:0] dsp_out_6_5;
wire [15:0] dsp_out_6_6;
wire [15:0] dsp_out_6_7;
wire [15:0] dsp_out_6_8;
wire [15:0] dsp_out_6_9;
wire [15:0] dsp_out_6_10;
wire [15:0] dsp_out_6_11;
reg [15:0] feature_reg_0_0_0;
reg [15:0] feature_reg_0_0_1;
reg [15:0] feature_reg_0_1_0;
reg [15:0] feature_reg_0_1_1;
reg [15:0] feature_reg_0_2_0;
reg [15:0] feature_reg_0_2_1;
reg [15:0] feature_reg_0_3_0;
reg [15:0] feature_reg_0_3_1;
reg [15:0] feature_reg_0_4_0;
reg [15:0] feature_reg_0_4_1;
reg [15:0] feature_reg_0_5_0;
reg [15:0] feature_reg_0_5_1;
reg [15:0] feature_reg_1_0_0;
reg [15:0] feature_reg_1_0_1;
reg [15:0] feature_reg_1_1_0;
reg [15:0] feature_reg_1_1_1;
reg [15:0] feature_reg_1_2_0;
reg [15:0] feature_reg_1_2_1;
reg [15:0] feature_reg_1_3_0;
reg [15:0] feature_reg_1_3_1;
reg [15:0] feature_reg_1_4_0;
reg [15:0] feature_reg_1_4_1;
reg [15:0] feature_reg_1_5_0;
reg [15:0] feature_reg_1_5_1;
reg [15:0] feature_reg_2_0_0;
reg [15:0] feature_reg_2_0_1;
reg [15:0] feature_reg_2_1_0;
reg [15:0] feature_reg_2_1_1;
reg [15:0] feature_reg_2_2_0;
reg [15:0] feature_reg_2_2_1;
reg [15:0] feature_reg_2_3_0;
reg [15:0] feature_reg_2_3_1;
reg [15:0] feature_reg_2_4_0;
reg [15:0] feature_reg_2_4_1;
reg [15:0] feature_reg_2_5_0;
reg [15:0] feature_reg_2_5_1;
reg [15:0] feature_reg_3_0_0;
reg [15:0] feature_reg_3_0_1;
reg [15:0] feature_reg_3_1_0;
reg [15:0] feature_reg_3_1_1;
reg [15:0] feature_reg_3_2_0;
reg [15:0] feature_reg_3_2_1;
reg [15:0] feature_reg_3_3_0;
reg [15:0] feature_reg_3_3_1;
reg [15:0] feature_reg_3_4_0;
reg [15:0] feature_reg_3_4_1;
reg [15:0] feature_reg_3_5_0;
reg [15:0] feature_reg_3_5_1;
reg [15:0] feature_reg_4_0_0;
reg [15:0] feature_reg_4_0_1;
reg [15:0] feature_reg_4_1_0;
reg [15:0] feature_reg_4_1_1;
reg [15:0] feature_reg_4_2_0;
reg [15:0] feature_reg_4_2_1;
reg [15:0] feature_reg_4_3_0;
reg [15:0] feature_reg_4_3_1;
reg [15:0] feature_reg_4_4_0;
reg [15:0] feature_reg_4_4_1;
reg [15:0] feature_reg_4_5_0;
reg [15:0] feature_reg_4_5_1;
reg [15:0] feature_reg_5_0_0;
reg [15:0] feature_reg_5_0_1;
reg [15:0] feature_reg_5_1_0;
reg [15:0] feature_reg_5_1_1;
reg [15:0] feature_reg_5_2_0;
reg [15:0] feature_reg_5_2_1;
reg [15:0] feature_reg_5_3_0;
reg [15:0] feature_reg_5_3_1;
reg [15:0] feature_reg_5_4_0;
reg [15:0] feature_reg_5_4_1;
reg [15:0] feature_reg_5_5_0;
reg [15:0] feature_reg_5_5_1;

always @ (posedge clk) begin
	calculate_1 <= calculate;
	calculate_2 <= calculate_1;
	calculate_3 <= calculate_2;
	//Valid pipeline
	valid_0 <= i_valid;
	valid_1 <= valid_0;
	valid_2 <= valid_1;
	valid_3 <= valid_2;
	valid_4 <= valid_3;
	valid_5 <= valid_4;
	valid_6 <= valid_5;
	valid_7 <= valid_6;
	valid_8 <= valid_7;
	valid_9 <= valid_8;
	valid_10 <= valid_9;
	valid_11 <= valid_10;
	valid_12 <= valid_11;
	if (i_valid) begin
		input_buffer_count <= 0;
		calculate <= 0;
	end else begin
		//Input buffering logic
		if (input_buffer_count == 5) begin
			calculate <= 1;
			input_buffer_count <= 0;
		end else begin
			calculate <= 0;
			input_buffer_count <= input_buffer_count + 1'b1;
		end
		input_buffer_5_0 <= i_result_0_1;
		input_buffer_5_1 <= i_result_1_1;
		input_buffer_5_2 <= i_result_2_1;
		input_buffer_5_3 <= i_result_3_1;
		input_buffer_5_4 <= i_result_4_1;
		input_buffer_5_5 <= i_result_5_1;
	end
	input_buffer_0_0 <= input_buffer_1_0;
	input_buffer_0_1 <= input_buffer_1_1;
	input_buffer_0_2 <= input_buffer_1_2;
	input_buffer_0_3 <= input_buffer_1_3;
	input_buffer_0_4 <= input_buffer_1_4;
	input_buffer_0_5 <= input_buffer_1_5;
	input_buffer_1_0 <= input_buffer_2_0;
	input_buffer_1_1 <= input_buffer_2_1;
	input_buffer_1_2 <= input_buffer_2_2;
	input_buffer_1_3 <= input_buffer_2_3;
	input_buffer_1_4 <= input_buffer_2_4;
	input_buffer_1_5 <= input_buffer_2_5;
	input_buffer_2_0 <= input_buffer_3_0;
	input_buffer_2_1 <= input_buffer_3_1;
	input_buffer_2_2 <= input_buffer_3_2;
	input_buffer_2_3 <= input_buffer_3_3;
	input_buffer_2_4 <= input_buffer_3_4;
	input_buffer_2_5 <= input_buffer_3_5;
	input_buffer_3_0 <= input_buffer_4_0;
	input_buffer_3_1 <= input_buffer_4_1;
	input_buffer_3_2 <= input_buffer_4_2;
	input_buffer_3_3 <= input_buffer_4_3;
	input_buffer_3_4 <= input_buffer_4_4;
	input_buffer_3_5 <= input_buffer_4_5;
	input_buffer_4_0 <= input_buffer_5_0;
	input_buffer_4_1 <= input_buffer_5_1;
	input_buffer_4_2 <= input_buffer_5_2;
	input_buffer_4_3 <= input_buffer_5_3;
	input_buffer_4_4 <= input_buffer_5_4;
	input_buffer_4_5 <= input_buffer_5_5;
	//Pipelining to synchronize DSPs and non-DSPs
	feature_reg_0_0_0 <= input_buffer_0_0;
	feature_reg_0_1_0 <= input_buffer_0_1;
	feature_reg_0_2_0 <= input_buffer_0_2;
	feature_reg_0_3_0 <= input_buffer_0_3;
	feature_reg_0_4_0 <= input_buffer_0_4;
	feature_reg_0_5_0 <= input_buffer_0_5;
	feature_reg_1_0_0 <= input_buffer_1_0;
	feature_reg_1_1_0 <= input_buffer_1_1;
	feature_reg_1_2_0 <= input_buffer_1_2;
	feature_reg_1_3_0 <= input_buffer_1_3;
	feature_reg_1_4_0 <= input_buffer_1_4;
	feature_reg_1_5_0 <= input_buffer_1_5;
	feature_reg_2_0_0 <= input_buffer_2_0;
	feature_reg_2_1_0 <= input_buffer_2_1;
	feature_reg_2_2_0 <= input_buffer_2_2;
	feature_reg_2_3_0 <= input_buffer_2_3;
	feature_reg_2_4_0 <= input_buffer_2_4;
	feature_reg_2_5_0 <= input_buffer_2_5;
	feature_reg_3_0_0 <= input_buffer_3_0;
	feature_reg_3_1_0 <= input_buffer_3_1;
	feature_reg_3_2_0 <= input_buffer_3_2;
	feature_reg_3_3_0 <= input_buffer_3_3;
	feature_reg_3_4_0 <= input_buffer_3_4;
	feature_reg_3_5_0 <= input_buffer_3_5;
	feature_reg_4_0_0 <= input_buffer_4_0;
	feature_reg_4_1_0 <= input_buffer_4_1;
	feature_reg_4_2_0 <= input_buffer_4_2;
	feature_reg_4_3_0 <= input_buffer_4_3;
	feature_reg_4_4_0 <= input_buffer_4_4;
	feature_reg_4_5_0 <= input_buffer_4_5;
	feature_reg_5_0_0 <= input_buffer_5_0;
	feature_reg_5_1_0 <= input_buffer_5_1;
	feature_reg_5_2_0 <= input_buffer_5_2;
	feature_reg_5_3_0 <= input_buffer_5_3;
	feature_reg_5_4_0 <= input_buffer_5_4;
	feature_reg_5_5_0 <= input_buffer_5_5;
	feature_reg_0_0_1 <= feature_reg_0_0_0;
	feature_reg_0_1_1 <= feature_reg_0_1_0;
	feature_reg_0_2_1 <= feature_reg_0_2_0;
	feature_reg_0_3_1 <= feature_reg_0_3_0;
	feature_reg_0_4_1 <= feature_reg_0_4_0;
	feature_reg_0_5_1 <= feature_reg_0_5_0;
	feature_reg_1_0_1 <= feature_reg_1_0_0;
	feature_reg_1_1_1 <= feature_reg_1_1_0;
	feature_reg_1_2_1 <= feature_reg_1_2_0;
	feature_reg_1_3_1 <= feature_reg_1_3_0;
	feature_reg_1_4_1 <= feature_reg_1_4_0;
	feature_reg_1_5_1 <= feature_reg_1_5_0;
	feature_reg_2_0_1 <= feature_reg_2_0_0;
	feature_reg_2_1_1 <= feature_reg_2_1_0;
	feature_reg_2_2_1 <= feature_reg_2_2_0;
	feature_reg_2_3_1 <= feature_reg_2_3_0;
	feature_reg_2_4_1 <= feature_reg_2_4_0;
	feature_reg_2_5_1 <= feature_reg_2_5_0;
	feature_reg_3_0_1 <= feature_reg_3_0_0;
	feature_reg_3_1_1 <= feature_reg_3_1_0;
	feature_reg_3_2_1 <= feature_reg_3_2_0;
	feature_reg_3_3_1 <= feature_reg_3_3_0;
	feature_reg_3_4_1 <= feature_reg_3_4_0;
	feature_reg_3_5_1 <= feature_reg_3_5_0;
	feature_reg_4_0_1 <= feature_reg_4_0_0;
	feature_reg_4_1_1 <= feature_reg_4_1_0;
	feature_reg_4_2_1 <= feature_reg_4_2_0;
	feature_reg_4_3_1 <= feature_reg_4_3_0;
	feature_reg_4_4_1 <= feature_reg_4_4_0;
	feature_reg_4_5_1 <= feature_reg_4_5_0;
	feature_reg_5_0_1 <= feature_reg_5_0_0;
	feature_reg_5_1_1 <= feature_reg_5_1_0;
	feature_reg_5_2_1 <= feature_reg_5_2_0;
	feature_reg_5_3_1 <= feature_reg_5_3_0;
	feature_reg_5_4_1 <= feature_reg_5_4_0;
	feature_reg_5_5_1 <= feature_reg_5_5_0;
	//Output Serializing logic
	if (calculate_3) begin
		output_buffer_0_0 <= rslt_buffer_0_0;
		output_buffer_1_0 <= rslt_buffer_0_1;
		output_buffer_2_0 <= rslt_buffer_0_2;
		output_buffer_3_0 <= rslt_buffer_0_3;
		output_buffer_4_0 <= rslt_buffer_0_4;
		output_buffer_5_0 <= rslt_buffer_0_5;
		output_buffer_0_1 <= rslt_buffer_1_0;
		output_buffer_1_1 <= rslt_buffer_1_1;
		output_buffer_2_1 <= rslt_buffer_1_2;
		output_buffer_3_1 <= rslt_buffer_1_3;
		output_buffer_4_1 <= rslt_buffer_1_4;
		output_buffer_5_1 <= rslt_buffer_1_5;
		output_buffer_0_2 <= rslt_buffer_2_0;
		output_buffer_1_2 <= rslt_buffer_2_1;
		output_buffer_2_2 <= rslt_buffer_2_2;
		output_buffer_3_2 <= rslt_buffer_2_3;
		output_buffer_4_2 <= rslt_buffer_2_4;
		output_buffer_5_2 <= rslt_buffer_2_5;
		output_buffer_0_3 <= rslt_buffer_3_0;
		output_buffer_1_3 <= rslt_buffer_3_1;
		output_buffer_2_3 <= rslt_buffer_3_2;
		output_buffer_3_3 <= rslt_buffer_3_3;
		output_buffer_4_3 <= rslt_buffer_3_4;
		output_buffer_5_3 <= rslt_buffer_3_5;
		output_buffer_0_4 <= rslt_buffer_4_0;
		output_buffer_1_4 <= rslt_buffer_4_1;
		output_buffer_2_4 <= rslt_buffer_4_2;
		output_buffer_3_4 <= rslt_buffer_4_3;
		output_buffer_4_4 <= rslt_buffer_4_4;
		output_buffer_5_4 <= rslt_buffer_4_5;
		output_buffer_0_5 <= rslt_buffer_5_0;
		output_buffer_1_5 <= rslt_buffer_5_1;
		output_buffer_2_5 <= rslt_buffer_5_2;
		output_buffer_3_5 <= rslt_buffer_5_3;
		output_buffer_4_5 <= rslt_buffer_5_4;
		output_buffer_5_5 <= rslt_buffer_5_5;
	end else begin
		output_buffer_0_0 <= output_buffer_0_1;
		output_buffer_0_1 <= output_buffer_0_2;
		output_buffer_0_2 <= output_buffer_0_3;
		output_buffer_0_3 <= output_buffer_0_4;
		output_buffer_0_4 <= output_buffer_0_5;
		output_buffer_1_0 <= output_buffer_1_1;
		output_buffer_1_1 <= output_buffer_1_2;
		output_buffer_1_2 <= output_buffer_1_3;
		output_buffer_1_3 <= output_buffer_1_4;
		output_buffer_1_4 <= output_buffer_1_5;
		output_buffer_2_0 <= output_buffer_2_1;
		output_buffer_2_1 <= output_buffer_2_2;
		output_buffer_2_2 <= output_buffer_2_3;
		output_buffer_2_3 <= output_buffer_2_4;
		output_buffer_2_4 <= output_buffer_2_5;
		output_buffer_3_0 <= output_buffer_3_1;
		output_buffer_3_1 <= output_buffer_3_2;
		output_buffer_3_2 <= output_buffer_3_3;
		output_buffer_3_3 <= output_buffer_3_4;
		output_buffer_3_4 <= output_buffer_3_5;
		output_buffer_4_0 <= output_buffer_4_1;
		output_buffer_4_1 <= output_buffer_4_2;
		output_buffer_4_2 <= output_buffer_4_3;
		output_buffer_4_3 <= output_buffer_4_4;
		output_buffer_4_4 <= output_buffer_4_5;
		output_buffer_5_0 <= output_buffer_5_1;
		output_buffer_5_1 <= output_buffer_5_2;
		output_buffer_5_2 <= output_buffer_5_3;
		output_buffer_5_3 <= output_buffer_5_4;
		output_buffer_5_4 <= output_buffer_5_5;
	end
end

////// FIRST COLUMN //////
winograd_dsp_16 winograd_dsp_16_WD00 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_0_2),
	.by(input_buffer_2_0),
	.coefsela(3'b101),
	.coefselb(3'b101),
	.resulta(dsp_out_1_0),
	.resultb(dsp_out_1_1)
);

winograd_dsp_16 winograd_dsp_16_WD10 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_2),
	.by(input_buffer_2_4),
	.coefsela(3'b110),
	.coefselb(3'b001),
	.resulta(dsp_out_1_2),
	.resultb(dsp_out_1_3)
);

winograd_dsp_16 winograd_dsp_16_WD20 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_4_2),
	.by(input_buffer_1_0),
	.coefsela(3'b001),
	.coefselb(3'b100),
	.resulta(dsp_out_1_4),
	.resultb(dsp_out_1_5)
);

winograd_dsp_16 winograd_dsp_16_WD30 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_2),
	.by(input_buffer_3_2),
	.coefsela(3'b100),
	.coefselb(3'b001),
	.resulta(dsp_out_1_6),
	.resultb(dsp_out_1_7)
);

winograd_dsp_16 winograd_dsp_16_WD40 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_0),
	.by(input_buffer_3_2),
	.coefsela(3'b101),
	.coefselb(3'b110),
	.resulta(dsp_out_1_8),
	.resultb(dsp_out_1_9)
);

winograd_dsp_16 winograd_dsp_16_WD50 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_4),
	.by(input_buffer_5_2),
	.coefsela(3'b001),
	.coefselb(3'b001),
	.resulta(dsp_out_1_10),
	.resultb(dsp_out_1_11)
);

////// SECOND COLUMN //////
winograd_dsp_16 winograd_dsp_16_WD01 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_1),
	.by(input_buffer_2_2),
	.coefsela(3'b100),
	.coefselb(3'b100),
	.resulta(dsp_out_2_0),
	.resultb(dsp_out_2_1)
);

winograd_dsp_16 winograd_dsp_16_WD11 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_3),
	.by(input_buffer_2_4),
	.coefsela(3'b001),
	.coefselb(3'b001),
	.resulta(dsp_out_2_2),
	.resultb(dsp_out_2_3)
);

winograd_dsp_16 winograd_dsp_16_WD21 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_1),
	.by(input_buffer_3_2),
	.coefsela(3'b100),
	.coefselb(3'b100),
	.resulta(dsp_out_2_4),
	.resultb(dsp_out_2_5)
);

winograd_dsp_16 winograd_dsp_16_WD31 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_3),
	.by(input_buffer_3_4),
	.coefsela(3'b001),
	.coefselb(3'b001),
	.resulta(dsp_out_2_6),
	.resultb(dsp_out_2_7)
);

////// THIRD COLUMN //////
winograd_dsp_16 winograd_dsp_16_WD02 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_1),
	.by(input_buffer_2_2),
	.coefsela(3'b101),
	.coefselb(3'b100),
	.resulta(dsp_out_3_0),
	.resultb(dsp_out_3_1)
);

winograd_dsp_16 winograd_dsp_16_WD12 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_3),
	.by(input_buffer_2_4),
	.coefsela(3'b000),
	.coefselb(3'b001),
	.resulta(dsp_out_3_2),
	.resultb(dsp_out_3_3)
);

winograd_dsp_16 winograd_dsp_16_WD22 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_1),
	.by(input_buffer_3_2),
	.coefsela(3'b101),
	.coefselb(3'b100),
	.resulta(dsp_out_3_4),
	.resultb(dsp_out_3_5)
);

winograd_dsp_16 winograd_dsp_16_WD32 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_3),
	.by(input_buffer_3_4),
	.coefsela(3'b000),
	.coefselb(3'b001),
	.resulta(dsp_out_3_6),
	.resultb(dsp_out_3_7)
);

////// FOURTH COLUMN //////
winograd_dsp_16 winograd_dsp_16_WD03 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_1),
	.by(input_buffer_2_2),
	.coefsela(3'b010),
	.coefselb(3'b000),
	.resulta(dsp_out_4_0),
	.resultb(dsp_out_4_1)
);

winograd_dsp_16 winograd_dsp_16_WD13 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_3),
	.by(input_buffer_2_4),
	.coefsela(3'b011),
	.coefselb(3'b001),
	.resulta(dsp_out_4_2),
	.resultb(dsp_out_4_3)
);

winograd_dsp_16 winograd_dsp_16_WD23 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_1),
	.by(input_buffer_3_2),
	.coefsela(3'b010),
	.coefselb(3'b000),
	.resulta(dsp_out_4_4),
	.resultb(dsp_out_4_5)
);

winograd_dsp_16 winograd_dsp_16_WD33 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_3),
	.by(input_buffer_3_4),
	.coefsela(3'b011),
	.coefselb(3'b001),
	.resulta(dsp_out_4_6),
	.resultb(dsp_out_4_7)
);

////// FIFTH COLUMN //////
winograd_dsp_16 winograd_dsp_16_WD04 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_1),
	.by(input_buffer_2_2),
	.coefsela(3'b011),
	.coefselb(3'b000),
	.resulta(dsp_out_5_0),
	.resultb(dsp_out_5_1)
);

winograd_dsp_16 winograd_dsp_16_WD14 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_3),
	.by(input_buffer_2_4),
	.coefsela(3'b010),
	.coefselb(3'b001),
	.resulta(dsp_out_5_2),
	.resultb(dsp_out_5_3)
);

winograd_dsp_16 winograd_dsp_16_WD24 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_1),
	.by(input_buffer_3_2),
	.coefsela(3'b011),
	.coefselb(3'b000),
	.resulta(dsp_out_5_4),
	.resultb(dsp_out_5_5)
);

winograd_dsp_16 winograd_dsp_16_WD34 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_3),
	.by(input_buffer_3_4),
	.coefsela(3'b010),
	.coefselb(3'b001),
	.resulta(dsp_out_5_6),
	.resultb(dsp_out_5_7)
);

////// SIXTH COLUMN //////
winograd_dsp_16 winograd_dsp_16_WD05 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_0_3),
	.by(input_buffer_2_1),
	.coefsela(3'b101),
	.coefselb(3'b101),
	.resulta(dsp_out_6_0),
	.resultb(dsp_out_6_1)
);

winograd_dsp_16 winograd_dsp_16_WD15 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_3),
	.by(input_buffer_2_5),
	.coefsela(3'b110),
	.coefselb(3'b001),
	.resulta(dsp_out_6_2),
	.resultb(dsp_out_6_3)
);

winograd_dsp_16 winograd_dsp_16_WD25 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_4_3),
	.by(input_buffer_1_3),
	.coefsela(3'b001),
	.coefselb(3'b100),
	.resulta(dsp_out_6_4),
	.resultb(dsp_out_6_5)
);

winograd_dsp_16 winograd_dsp_16_WD35 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_2_3),
	.by(input_buffer_3_3),
	.coefsela(3'b100),
	.coefselb(3'b001),
	.resulta(dsp_out_6_6),
	.resultb(dsp_out_6_7)
);

winograd_dsp_16 winograd_dsp_16_WD45 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_1),
	.by(input_buffer_3_3),
	.coefsela(3'b101),
	.coefselb(3'b110),
	.resulta(dsp_out_6_8),
	.resultb(dsp_out_6_9)
);

winograd_dsp_16 winograd_dsp_16_WD55 (
	.clk(clk),
	.ena(1'b1),
	.aclr(1'b0),
	.ay(input_buffer_3_5),
	.by(input_buffer_5_3),
	.coefsela(3'b001),
	.coefselb(3'b001),
	.resulta(dsp_out_6_10),
	.resultb(dsp_out_6_11)
);

winograd_adder_16_20_4 winograd_adder_16_20_4_WA00 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_0_0_1[11:0], 4'b0000}),
	.data1x(dsp_out_1_0),
	.data2x({feature_reg_0_4_1[13:0], 2'b00}),
	.data3x(dsp_out_1_1),
	.data4x(dsp_out_1_2),
	.data5x(dsp_out_1_3),
	.data6x({feature_reg_4_0_1[13:0], 2'b00}),
	.data7x(dsp_out_1_4),
	.data8x(feature_reg_4_4_1),
	.data9x(0),
	.data10x(0),
	.data11x(0),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_0_0)
);

wire [15:0] f1, f2, f3, f4;
assign f1 = -{feature_reg_1_0_1[11:0], 4'b0000};
assign f2 = -{feature_reg_1_4_1[13:0], 2'b00};
assign f3 = -{feature_reg_2_0_1[11:0], 4'b0000};
assign f4 = -{feature_reg_2_4_1[13:0], 2'b00};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA10 (
	.clock(clk),
	.clken(calculate_2),
	.data0x(dsp_out_1_5),
	.data1x(f1),
	.data2x(f2),
	.data3x(f3),
	.data4x(dsp_out_1_6),
	.data5x(f4),
	.data6x({feature_reg_3_0_1[13:0], 2'b00}),
	.data7x(dsp_out_1_7),
	.data8x(feature_reg_3_4_1),
	.data9x({feature_reg_4_0_1[13:0], 2'b00}),
	.data10x(dsp_out_1_4),
	.data11x(feature_reg_4_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_1_0)
);

wire [15:0] f5, f6, f7, f8, f9, f10;
assign f5 = -dsp_out_1_5;
assign f6 = -{feature_reg_2_0_1[11:0], 4'b0000};
assign f7 = -{feature_reg_2_4_1[13:0], 2'b00};
assign f8 = -{feature_reg_3_0_1[13:0], 2'b00};
assign f9 = -dsp_out_1_7;
assign f10 = -feature_reg_3_4_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA20 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_0_1[11:0], 4'b0000}),
	.data1x(f5),
	.data2x({feature_reg_1_4_1[13:0], 2'b00}),
	.data3x(f6),
	.data4x(dsp_out_1_6),
	.data5x(f7),
	.data6x(f8),
	.data7x(f9),
	.data8x(f10),
	.data9x({feature_reg_4_0_1[13:0], 2'b00}),
	.data10x(dsp_out_1_4),
	.data11x(feature_reg_4_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_2_0)
);

wire [15:0] f11, f12, f13, f14, f15, f16, f17;
assign f11 = -{feature_reg_1_0_1[12:0], 3'b000};
assign f12 = -{feature_reg_1_4_1[14:0], 1'b0};
assign f13 = -{feature_reg_2_0_1[13:0], 2'b00};
assign f14 = -feature_reg_2_4_1;
assign f15 = dsp_out_1_5 >>> 1;
assign f16 = dsp_out_1_6 >>> 2;
assign f17 = dsp_out_1_7 <<< 1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA30 (
	.clock(clk),
	.clken(calculate_2),
	.data0x(f15),
	.data1x(f11),
	.data2x(f12),
	.data3x(f13),
	.data4x(f16),
	.data5x(f14),
	.data6x({feature_reg_3_0_1[12:0], 3'b000}),
	.data7x(f17),
	.data8x({feature_reg_3_4_1[14:0], 1'b0}),
	.data9x({feature_reg_4_0_1[13:0], 2'b00}),
	.data10x(dsp_out_1_4),
	.data11x(feature_reg_4_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_3_0)
);

wire [15:0] f18, f19, f20, f21, f22, f23, f23b;
assign f18 = -(dsp_out_1_5 >>> 1);
assign f19 = -{feature_reg_2_0_1[13:0], 2'b00};
assign f20 = -feature_reg_2_4_1;
assign f21 = -{feature_reg_3_0_1[12:0], 3'b000};
assign f22 = -(dsp_out_1_7 <<< 1);
assign f23 = -{feature_reg_3_4_1[14:0], 1'b0};
assign f23b = dsp_out_1_6 >>> 2;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA40 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_0_1[12:0], 3'b000}),
	.data1x(f18),
	.data2x({feature_reg_1_4_1[14:0], 1'b0}),
	.data3x(f19),
	.data4x(f23b),
	.data5x(f20),
	.data6x(f21),
	.data7x(f22),
	.data8x(f23),
	.data9x({feature_reg_4_0_1[13:0], 2'b00}),
	.data10x(dsp_out_1_4),
	.data11x(feature_reg_4_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_4_0)
);

wire [15:0] f24;
assign f24 = -dsp_out_1_5;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA50 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_0_1[11:0], 4'b0000}),
	.data1x(f24),
	.data2x({feature_reg_1_4_1[13:0], 2'b00}),
	.data3x(dsp_out_1_8),
	.data4x(dsp_out_1_9),
	.data5x(dsp_out_1_10),
	.data6x({feature_reg_5_0_1[13:0], 2'b00}),
	.data7x(dsp_out_1_11),
	.data8x(feature_reg_5_4_1),
	.data9x(0),
	.data10x(0),
	.data11x(0),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_5_0)
);

wire [15:0] f25, f26, f27, f28;
assign f25 = -{feature_reg_0_2_1[11:0], 4'b0000};
assign f26 = -{feature_reg_0_1_1[11:0], 4'b0000};
assign f27 = -{feature_reg_4_1_1[13:0], 2'b00};
assign f28 = -{feature_reg_4_2_1[13:0], 2'b00};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA01 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_0_3_1[13:0], 2'b00}),
	.data1x(f25),
	.data2x(f26),
	.data3x({feature_reg_0_4_1[13:0], 2'b00}),
	.data4x(dsp_out_2_0),
	.data5x(dsp_out_2_1),
	.data6x(dsp_out_2_2),
	.data7x(dsp_out_2_3),
	.data8x(f27),
	.data9x(f28),
	.data10x(feature_reg_4_3_1),
	.data11x(feature_reg_4_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_0_1)
);

wire [15:0] f29, f30, f31, f32, f33, f34, f35, f36;
assign f29 = -{feature_reg_1_3_1[13:0], 2'b00};
assign f30 = -{feature_reg_1_4_1[13:0], 2'b00};
assign f31 = -{feature_reg_2_3_1[13:0], 2'b00};
assign f32 = -{feature_reg_2_4_1[13:0], 2'b00};
assign f33 = -{feature_reg_3_1_1[13:0], 2'b00};
assign f34 = -{feature_reg_3_2_1[13:0], 2'b00};
assign f35 = -{feature_reg_4_1_1[13:0], 2'b00};
assign f36 = -{feature_reg_4_2_1[13:0], 2'b00};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA11 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[11:0], 4'b0000}),
	.data1x({feature_reg_1_2_1[11:0], 4'b0000}),
	.data2x(f29),
	.data3x(f30),
	.data4x({feature_reg_2_1_1[11:0], 4'b0000}),
	.data5x({feature_reg_2_2_1[11:0], 4'b0000}),
	.data6x(f31),
	.data7x(f32),
	.data8x(f33),
	.data9x(f34),
	.data10x(feature_reg_3_3_1),
	.data11x(feature_reg_3_4_1),
	.data12x(f35),
	.data13x(f36),
	.data14x(feature_reg_4_3_1),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_1_1)
);

wire [15:0] f37, f38, f39, f40, f41, f42, f43, f44;
assign f37 = -{feature_reg_1_2_1[11:0],4'b0000};
assign f38 = -{feature_reg_1_1_1[11:0],4'b0000};
assign f39 = -{feature_reg_2_3_1[13:0],2'b00};
assign f40 = -{feature_reg_2_4_1[13:0],2'b00};
assign f41 = -feature_reg_3_3_1;
assign f42 = -feature_reg_3_4_1;
assign f43 = -{feature_reg_4_1_1[13:0],2'b00};
assign f44 = -{feature_reg_4_2_1[13:0],2'b00};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA21 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_3_1[13:0],2'b00}),
	.data1x(f37),
	.data2x(f38),
	.data3x({feature_reg_1_4_1[13:0],2'b00}),
	.data4x({feature_reg_2_1_1[11:0],4'b0000}),
	.data5x({feature_reg_2_2_1[11:0],4'b0000}),
	.data6x(f39),
	.data7x(f40),
	.data8x({feature_reg_3_1_1[13:0],2'b00}),
	.data9x({feature_reg_3_2_1[13:0],2'b00}),
	.data10x(f41),
	.data11x(f42),
	.data12x(f43),
	.data13x(f44),
	.data14x(feature_reg_4_3_1),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_2_1)
);

wire [15:0] f45, f46, f47, f48, f49, f50, f51, f52;
assign f45 = -{feature_reg_1_3_1[14:0],1'b0};
assign f46 = -{feature_reg_1_4_1[14:0],1'b0};
assign f47 = -feature_reg_2_3_1;
assign f48 = -feature_reg_2_4_1;
assign f49 = -{feature_reg_3_1_1[12:0],3'b000};
assign f50 = -{feature_reg_3_2_1[12:0],3'b000};
assign f51 = -{feature_reg_4_1_1[13:0],2'b00};
assign f52 = -{feature_reg_4_2_1[13:0],2'b00};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA31 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[12:0],3'b000}),
	.data1x({feature_reg_1_2_1[12:0],3'b000}),
	.data2x(f45),
	.data3x(f46),
	.data4x({feature_reg_2_1_1[13:0],2'b00}),
	.data5x({feature_reg_2_2_1[13:0],2'b00}),
	.data6x(f47),
	.data7x(f48),
	.data8x(f49),
	.data9x(f50),
	.data10x({feature_reg_3_3_1[14:0],1'b0}),
	.data11x({feature_reg_3_4_1[14:0],1'b0}),
	.data12x(f51),
	.data13x(f52),
	.data14x(feature_reg_4_3_1),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_3_1)
);

wire [15:0] f53, f54, f55, f56, f57, f58, f59, f60;
assign f53 = -{feature_reg_1_2_1[12:0],3'b000};
assign f54 = -{feature_reg_1_1_1[12:0],3'b000};
assign f55 = -feature_reg_2_3_1;
assign f56 = -feature_reg_2_4_1;
assign f57 = -{feature_reg_3_3_1[14:0],1'b0};
assign f58 = -{feature_reg_3_4_1[14:0],1'b0};
assign f59 = -{feature_reg_4_1_1[13:0],2'b00};
assign f60 = -{feature_reg_4_2_1[13:0],2'b00};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA41 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_3_1[14:0],1'b0}),
	.data1x(f53),
	.data2x(f54),
	.data3x({feature_reg_1_4_1[14:0],1'b0}),
	.data4x({feature_reg_2_1_1[13:0],2'b00}),
	.data5x({feature_reg_2_2_1[13:0],2'b00}),
	.data6x(f55),
	.data7x(f56),
	.data8x({feature_reg_3_1_1[12:0],3'b000}),
	.data9x({feature_reg_3_2_1[12:0],3'b000}),
	.data10x(f57),
	.data11x(f58),
	.data12x(f59),
	.data13x(f60),
	.data14x(feature_reg_4_3_1),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_4_1)
);

wire [15:0] f61, f62, f63, f64;
assign f61 = -{feature_reg_1_2_1[11:0],4'b0000};
assign f62 = -{feature_reg_1_1_1[11:0],4'b0000};
assign f63 = -{feature_reg_5_1_1[13:0],2'b00};
assign f64 = -{feature_reg_5_2_1[13:0],2'b00};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA51 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_3_1[13:0],2'b00}),
	.data1x(f61),
	.data2x(f62),
	.data3x({feature_reg_1_4_1[13:0],2'b00}),
	.data4x(dsp_out_2_4),
	.data5x(dsp_out_2_5),
	.data6x(dsp_out_2_6),
	.data7x(dsp_out_2_7),
	.data8x(f63),
	.data9x(f64),
	.data10x(feature_reg_5_3_1),
	.data11x(feature_reg_5_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_5_1)
);

wire [15:0] f65, f66, f67, f68;
assign f65 = -{feature_reg_0_2_1[11:0],4'b0000};
assign f66 = -{feature_reg_0_3_1[13:0],2'b00};
assign f67 = -{feature_reg_4_2_1[13:0],2'b00};
assign f68 = -feature_reg_4_3_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA02 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_0_1_1[11:0],4'b0000}),
	.data1x(f65),
	.data2x(f66),
	.data3x({feature_reg_0_4_1[13:0],2'b00}),
	.data4x(dsp_out_3_0),
	.data5x(dsp_out_3_1),
	.data6x(dsp_out_3_2),
	.data7x(dsp_out_3_3),
	.data8x({feature_reg_4_1_1[13:0],2'b00}),
	.data9x(f67),
	.data10x(f68),
	.data11x(feature_reg_4_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_0_2)
);

wire [15:0] f69, f70, f71, f72, f73, f74, f75, f76;
assign f69 = -{feature_reg_1_1_1[11:0],4'b0000};
assign f70 = -{feature_reg_1_4_1[13:0],2'b00};
assign f71 = -{feature_reg_2_1_1[11:0],4'b0000};
assign f72 = -{feature_reg_2_4_1[13:0],2'b00};
assign f73 = -{feature_reg_3_2_1[13:0],2'b00};
assign f74 = -feature_reg_3_3_1;
assign f75 = -{feature_reg_4_2_1[13:0],2'b00};
assign f76 = -feature_reg_4_3_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA12 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_2_1[11:0],4'b0000}),
	.data1x(f69),
	.data2x({feature_reg_1_3_1[13:0],2'b00}),
	.data3x(f70),
	.data4x(f71),
	.data5x({feature_reg_2_2_1[11:0],4'b0000}),
	.data6x({feature_reg_2_3_1[13:0],2'b00}),
	.data7x(f72),
	.data8x({feature_reg_3_1_1[13:0],2'b00}),
	.data9x(f73),
	.data10x(f74),
	.data11x(feature_reg_3_4_1),
	.data12x({feature_reg_4_1_1[13:0],2'b00}),
	.data13x(f75),
	.data14x(f76),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_1_2)
);

wire [15:0] f77, f78, f79, f80, f81, f82, f83, f84;
assign f77 = -{feature_reg_1_2_1[11:0],4'b0000};
assign f78 = -{feature_reg_1_3_1[13:0],2'b00};
assign f79 = -{feature_reg_2_1_1[11:0],4'b0000};
assign f80 = -{feature_reg_2_4_1[13:0],2'b00};
assign f81 = -{feature_reg_3_1_1[13:0],2'b00};
assign f82 = -feature_reg_3_4_1;
assign f83 = -{feature_reg_4_2_1[13:0],2'b00};
assign f84 = -feature_reg_4_3_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA22 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[11:0],4'b0000}),
	.data1x(f77),
	.data2x(f78),
	.data3x({feature_reg_1_4_1[13:0],2'b00}),
	.data4x(f79),
	.data5x({feature_reg_2_2_1[11:0],4'b0000}),
	.data6x({feature_reg_2_3_1[13:0],2'b00}),
	.data7x(f80),
	.data8x(f81),
	.data9x({feature_reg_3_2_1[13:0],2'b00}),
	.data10x(feature_reg_3_3_1),
	.data11x(f82),
	.data12x({feature_reg_4_1_1[13:0],2'b00}),
	.data13x(f83),
	.data14x(f84),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_2_2)
);

wire [15:0] f85, f86, f87, f88, f89, f90, f91, f92;
assign f85 = -{feature_reg_1_1_1[12:0],3'b000};
assign f86 = -{feature_reg_1_4_1[14:0],1'b0};
assign f87 = -{feature_reg_2_1_1[13:0],2'b00};
assign f88 = -feature_reg_2_4_1;
assign f89 = -{feature_reg_3_2_1[12:0],3'b000};
assign f90 = -{feature_reg_3_3_1[14:0],1'b0};
assign f91 = -{feature_reg_4_2_1[13:0],2'b00};
assign f92 = -feature_reg_4_3_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA32 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_2_1[12:0],3'b000}),
	.data1x(f85),
	.data2x({feature_reg_1_3_1[14:0],1'b0}),
	.data3x(f86),
	.data4x(f87),
	.data5x({feature_reg_2_2_1[13:0],2'b00}),
	.data6x(feature_reg_2_3_1),
	.data7x(f88),
	.data8x({feature_reg_3_1_1[12:0],3'b000}),
	.data9x(f89),
	.data10x(f90),
	.data11x({feature_reg_3_4_1[14:0],1'b0}),
	.data12x({feature_reg_4_1_1[13:0],2'b00}),
	.data13x(f91),
	.data14x(f92),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_3_2)
);

wire [15:0] f93, f94, f95, f96, f97, f98, f99, f100;
assign f93 = -{feature_reg_1_2_1[12:0],3'b000};
assign f94 = -{feature_reg_1_3_1[14:0],1'b0};
assign f95 = -{feature_reg_2_1_1[13:0],2'b00};
assign f96 = -feature_reg_2_4_1;
assign f97 = -{feature_reg_3_1_1[12:0],3'b000};
assign f98 = -{feature_reg_3_4_1[14:0],1'b0};
assign f99 = -{feature_reg_4_2_1[13:0],2'b00};
assign f100 = -feature_reg_4_3_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA42 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[12:0],3'b000}),
	.data1x(f93),
	.data2x(f94),
	.data3x({feature_reg_1_4_1[14:0],1'b0}),
	.data4x(f95),
	.data5x({feature_reg_2_2_1[13:0],2'b00}),
	.data6x(feature_reg_2_3_1),
	.data7x(f96),
	.data8x(f97),
	.data9x({feature_reg_3_2_1[12:0],3'b000}),
	.data10x({feature_reg_3_3_1[14:0],1'b0}),
	.data11x(f98),
	.data12x({feature_reg_4_1_1[13:0],2'b00}),
	.data13x(f99),
	.data14x(f100),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_4_2)
);

wire [15:0] f101, f102, f103, f104;
assign f101 = -{feature_reg_1_2_1[11:0],4'b0000};
assign f102 = -{feature_reg_1_3_1[13:0],2'b00};
assign f103 = -{feature_reg_5_2_1[13:0],2'b00};
assign f104 = -feature_reg_5_3_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA52 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[11:0],4'b0000}),
	.data1x(f101),
	.data2x(f102),
	.data3x({feature_reg_1_4_1[13:0],2'b00}),
	.data4x(dsp_out_3_4),
	.data5x(dsp_out_3_5),
	.data6x(dsp_out_3_6),
	.data7x(dsp_out_3_7),
	.data8x({feature_reg_5_1_1[13:0],2'b00}),
	.data9x(f103),
	.data10x(f104),
	.data11x(feature_reg_5_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_5_2)
);

wire [15:0] f105, f106, f107, f108;
assign f105 = -{feature_reg_0_2_1[13:0],2'b00};
assign f106 = -{feature_reg_0_1_1[12:0],3'b000};
assign f107 = -{feature_reg_4_1_1[14:0],1'b0};
assign f108 = -feature_reg_4_2_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA03 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_0_3_1[12:0],3'b000}),
	.data1x(f105),
	.data2x(f106),
	.data3x({feature_reg_0_4_1[13:0],2'b00}),
	.data4x(dsp_out_4_0),
	.data5x(dsp_out_4_1),
	.data6x(dsp_out_4_2),
	.data7x(dsp_out_4_3),
	.data8x(f107),
	.data9x(f108),
	.data10x({feature_reg_4_3_1[14:0],1'b0}),
	.data11x(feature_reg_4_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_0_3)
);

wire [15:0] f109, f110, f111, f112, f113, f114, f115, f116;
assign f109 = -{feature_reg_1_3_1[12:0],3'b000};
assign f110 = -{feature_reg_1_4_1[13:0],2'b00};
assign f111 = -{feature_reg_2_3_1[12:0],3'b000};
assign f112 = -{feature_reg_2_4_1[13:0],2'b00};
assign f113 = -{feature_reg_3_1_1[14:0],1'b0};
assign f114 = -feature_reg_3_2_1;
assign f115 = -{feature_reg_4_1_1[14:0],1'b0};
assign f116 = -feature_reg_4_2_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA13 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[12:0],3'b000}),
	.data1x({feature_reg_1_2_1[13:0],2'b00}),
	.data2x(f109),
	.data3x(f110),
	.data4x({feature_reg_2_1_1[12:0],3'b000}),
	.data5x({feature_reg_2_2_1[13:0],2'b00}),
	.data6x(f111),
	.data7x(f112),
	.data8x(f113),
	.data9x(f114),
	.data10x({feature_reg_3_3_1[14:0],1'b0}),
	.data11x(feature_reg_3_4_1),
	.data12x(f115),
	.data13x(f116),
	.data14x({feature_reg_4_3_1[14:0],1'b0}),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_1_3)
);

wire [15:0] f117, f118, f119, f120, f121, f122, f123, f124;
assign f117 = -{feature_reg_1_2_1[13:0],2'b00};
assign f118 = -{feature_reg_1_1_1[12:0],3'b000};
assign f119 = -{feature_reg_2_3_1[12:0],3'b000};
assign f120 = -{feature_reg_2_4_1[13:0],2'b00};
assign f121 = -{feature_reg_3_3_1[14:0],1'b0};
assign f122 = -feature_reg_3_4_1;
assign f123 = -{feature_reg_4_1_1[14:0],1'b0};
assign f124 = -feature_reg_4_2_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA23 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_3_1[12:0],3'b000}), 
	.data1x(f117),
	.data2x(f118),
	.data3x({feature_reg_1_4_1[13:0],2'b00}),
	.data4x({feature_reg_2_1_1[12:0],3'b000}),
	.data5x({feature_reg_2_2_1[13:0],2'b00}),
	.data6x(f119),
	.data7x(f120),
	.data8x({feature_reg_3_1_1[14:0],1'b0}),
	.data9x(feature_reg_3_2_1),
	.data10x(f121),
	.data11x(f122),
	.data12x(f123),
	.data13x(f124),
	.data14x({feature_reg_4_3_1[14:0],1'b0}),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_2_3)
);

wire [15:0] f125, f126, f127, f128, f129, f130, f131, f132;
assign f125 = -{feature_reg_1_3_1[13:0],2'b00};
assign f126 = -{feature_reg_1_4_1[14:0],1'b0};
assign f127 = -{feature_reg_2_3_1[14:0],1'b0};
assign f128 = -feature_reg_2_4_1;
assign f129 = -{feature_reg_3_1_1[13:0],2'b00};
assign f130 = -{feature_reg_3_2_1[14:0],1'b0};
assign f131 = -{feature_reg_4_1_1[14:0],1'b0};
assign f132 = -feature_reg_4_2_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA33 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[13:0],2'b00}),
	.data1x({feature_reg_1_2_1[14:0],1'b0}),
	.data2x(f125),
	.data3x(f126),
	.data4x({feature_reg_2_1_1[14:0],1'b0}),
	.data5x(feature_reg_2_2_1),
	.data6x(f127),
	.data7x(f128),
	.data8x(f129),
	.data9x(f130),
	.data10x({feature_reg_3_3_1[13:0],2'b00}),
	.data11x({feature_reg_3_4_1[14:0],1'b0}),
	.data12x(f131),
	.data13x(f132),
	.data14x({feature_reg_4_3_1[14:0],1'b0}),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_3_3)
);

wire [15:0] f133, f134, f135, f136, f137, f138, f139, f140;
assign f133 = -{feature_reg_1_2_1[14:0],1'b0};
assign f134 = -{feature_reg_1_1_1[13:0],2'b00};
assign f135 = -{feature_reg_2_3_1[14:0],1'b0};
assign f136 = -feature_reg_2_4_1;
assign f137 = -{feature_reg_3_3_1[13:0],2'b00};
assign f138 = -{feature_reg_3_4_1[14:0],1'b0};
assign f139 = -{feature_reg_4_1_1[14:0],1'b0};
assign f140 = -feature_reg_4_2_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA43 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_3_1[13:0],2'b00}),
	.data1x(f133),
	.data2x(f134),
	.data3x({feature_reg_1_4_1[14:0],1'b0}),
	.data4x({feature_reg_2_1_1[14:0],1'b0}),
	.data5x(feature_reg_2_2_1),
	.data6x(f135),
	.data7x(f136),
	.data8x({feature_reg_3_1_1[13:0],2'b00}),
	.data9x({feature_reg_3_2_1[14:0],1'b0}),
	.data10x(f137),
	.data11x(f138),
	.data12x(f139),
	.data13x(f140),
	.data14x({feature_reg_4_3_1[14:0],1'b0}),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_4_3)
);

wire [15:0] f141, f142, f143, f144;
assign f141 = -{feature_reg_1_2_1[13:0],2'b00};
assign f142 = -{feature_reg_1_1_1[12:0],3'b000};
assign f143 = -{feature_reg_5_1_1[14:0],1'b0};
assign f144 = -feature_reg_5_2_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA53 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_3_1[12:0],3'b000}),
	.data1x(f141),
	.data2x(f142),
	.data3x({feature_reg_1_4_1[13:0],2'b00}),
	.data4x(dsp_out_4_4),
	.data5x(dsp_out_4_5),
	.data6x(dsp_out_4_6),
	.data7x(dsp_out_4_7),
	.data8x(f143),
	.data9x(f144),
	.data10x({feature_reg_5_3_1[14:0],1'b0}),
	.data11x(feature_reg_5_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_5_3)
);

wire [15:0] f145, f146, f147, f148;
assign f145 = -{feature_reg_0_2_1[13:0],2'b00};
assign f146 = -{feature_reg_0_3_1[12:0],3'b000};
assign f147 = -feature_reg_4_2_1;
assign f148 = -{feature_reg_4_3_1[14:0],1'b0};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA04 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_0_1_1[12:0],3'b000}),
	.data1x(f145),
	.data2x(f146),
	.data3x({feature_reg_0_4_1[13:0],2'b00}),
	.data4x(dsp_out_5_0),
	.data5x(dsp_out_5_1),
	.data6x(dsp_out_5_2),
	.data7x(dsp_out_5_3),
	.data8x({feature_reg_4_1_1[14:0],1'b0}),
	.data9x(f147),
	.data10x(f148),
	.data11x(feature_reg_4_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_0_4)
);

wire [15:0] f149, f150, f151, f152, f153, f154, f155, f156;
assign f149 = -{feature_reg_1_1_1[12:0],3'b000};
assign f150 = -{feature_reg_1_4_1[13:0],2'b00};
assign f151 = -{feature_reg_2_1_1[12:0],3'b000};
assign f152 = -{feature_reg_2_4_1[13:0],2'b00};
assign f153 = -feature_reg_3_2_1;
assign f154 = -{feature_reg_3_3_1[14:0],1'b0};
assign f155 = -feature_reg_4_2_1;
assign f156 = -{feature_reg_4_3_1[14:0],1'b0};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA14 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_2_1[13:0],2'b00}),
	.data1x(f149),
	.data2x({feature_reg_1_3_1[12:0],3'b000}),
	.data3x(f150),
	.data4x(f151),
	.data5x({feature_reg_2_2_1[13:0],2'b00}),
	.data6x({feature_reg_2_3_1[12:0],3'b000}),
	.data7x(f152),
	.data8x({feature_reg_3_1_1[14:0],1'b0}),
	.data9x(f153),
	.data10x(f154),
	.data11x(feature_reg_3_4_1),
	.data12x({feature_reg_4_1_1[14:0],1'b0}),
	.data13x(f155),
	.data14x(f156),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_1_4)
);

wire [15:0] f157, f158, f159, f160, f161, f162, f163, f164;
assign f157 = -{feature_reg_1_2_1[13:0],2'b00};
assign f158 = -{feature_reg_1_3_1[12:0],3'b000};
assign f159 = -{feature_reg_2_1_1[12:0],3'b000};
assign f160 = -{feature_reg_2_4_1[13:0],2'b00};
assign f161 = -{feature_reg_3_1_1[14:0],1'b0};
assign f162 = -feature_reg_3_4_1;
assign f163 = -feature_reg_4_2_1;
assign f164 = -{feature_reg_4_3_1[14:0],1'b0};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA24 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[12:0],3'b000}),
	.data1x(f157),
	.data2x(f158),
	.data3x({feature_reg_1_4_1[13:0],2'b00}),
	.data4x(f159),
	.data5x({feature_reg_2_2_1[13:0],2'b00}),
	.data6x({feature_reg_2_3_1[12:0],3'b000}),
	.data7x(f160),
	.data8x(f161),
	.data9x(feature_reg_3_2_1),
	.data10x({feature_reg_3_3_1[14:0],1'b0}),
	.data11x(f162),
	.data12x({feature_reg_4_1_1[14:0],1'b0}),
	.data13x(f163),
	.data14x(f164),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_2_4)
);

wire [15:0] f165, f166, f167, f168, f169, f170, f171, f172;
assign f165 = -{feature_reg_1_1_1[13:0],2'b00};
assign f166 = -{feature_reg_1_4_1[14:0],1'b0};
assign f167 = -{feature_reg_2_1_1[14:0],1'b0};
assign f168 = -feature_reg_2_4_1;
assign f169 = -{feature_reg_3_2_1[14:0],1'b0};
assign f170 = -{feature_reg_3_3_1[13:0],2'b00};
assign f171 = -feature_reg_4_2_1;
assign f172 = -{feature_reg_4_1_1[14:0],1'b0};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA34 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_2_1[14:0],1'b0}),
	.data1x(f165),
	.data2x({feature_reg_1_3_1[13:0],2'b00}),
	.data3x(f166),
	.data4x(f167),
	.data5x(feature_reg_2_2_1),
	.data6x({feature_reg_2_3_1[14:0],1'b0}),
	.data7x(f168),
	.data8x({feature_reg_3_1_1[13:0],2'b00}),
	.data9x(f169),
	.data10x(f170),
	.data11x({feature_reg_3_4_1[14:0],1'b0}),
	.data12x({feature_reg_4_1_1[14:0],1'b0}),
	.data13x(f171),
	.data14x(f172),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_3_4)
);

wire [15:0] f173, f174, f175, f176, f177, f178, f179, f180;
assign f173 = -{feature_reg_1_2_1[14:0],1'b0};
assign f174 = -{feature_reg_1_3_1[13:0],2'b00};
assign f175 = -{feature_reg_2_1_1[14:0],1'b0};
assign f176 = -feature_reg_2_4_1;
assign f177 = -{feature_reg_3_1_1[13:0],2'b00};
assign f178 = -{feature_reg_3_4_1[14:0],1'b0};
assign f179 = -feature_reg_4_2_1;
assign f180 = -{feature_reg_4_3_1[14:0],1'b0};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA44 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[13:0],2'b00}),
	.data1x(f173),
	.data2x(f174),
	.data3x({feature_reg_1_4_1[14:0],1'b0}),
	.data4x(f175),
	.data5x(feature_reg_2_2_1),
	.data6x({feature_reg_2_3_1[14:0],1'b0}),
	.data7x(f176),
	.data8x(f177),
	.data9x({feature_reg_3_2_1[14:0],1'b0}),
	.data10x({feature_reg_3_3_1[13:0],2'b00}),
	.data11x(f178),
	.data12x({feature_reg_4_1_1[14:0],1'b0}),
	.data13x(f179),
	.data14x(f180),
	.data15x(feature_reg_4_4_1),
	.result(rslt_buffer_4_4)
);

wire [15:0] f181, f182, f183, f184;
assign f181 = -{feature_reg_1_2_1[13:0],2'b00};
assign f182 = -{feature_reg_1_3_1[12:0],3'b000};
assign f183 = -feature_reg_5_2_1;
assign f184 = -{feature_reg_5_3_1[14:0],1'b0};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA54 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[12:0],3'b000}),
	.data1x(f181),
	.data2x(f182),
	.data3x({feature_reg_1_4_1[13:0],2'b00}),
	.data4x(dsp_out_5_4),
	.data5x(dsp_out_5_5),
	.data6x(dsp_out_5_6),
	.data7x(dsp_out_5_7),
	.data8x({feature_reg_5_1_1[14:0],1'b0}),
	.data9x(f183),
	.data10x(f184),
	.data11x(feature_reg_5_4_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_5_4)
);

winograd_adder_16_20_4 winograd_adder_16_20_4_WA05 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_0_1_1[11:0],4'b0000}),
	.data1x(dsp_out_6_0),
	.data2x({feature_reg_0_5_1[13:0],2'b00}),
	.data3x(dsp_out_6_1),
	.data4x(dsp_out_6_2),
	.data5x(dsp_out_6_3),
	.data6x({feature_reg_4_1_1[13:0],2'b00}),
	.data7x(dsp_out_6_4),
	.data8x(feature_reg_4_5_1),
	.data9x(0),
	.data10x(0),
	.data11x(0),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_0_5)
);

wire [15:0] f185, f186, f187, f188;
assign f185 = -{feature_reg_1_1_1[11:0],4'b0000};
assign f186 = -{feature_reg_1_5_1[13:0],2'b00};
assign f187 = -{feature_reg_2_1_1[11:0],4'b0000};
assign f188 = -{feature_reg_2_5_1[13:0],2'b00};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA15 (
	.clock(clk),
	.clken(calculate_2),
	.data0x(dsp_out_6_5),
	.data1x(f185),
	.data2x(f186),
	.data3x(f187),
	.data4x(dsp_out_6_6),
	.data5x(f188),
	.data6x({feature_reg_3_1_1[13:0],2'b00}),
	.data7x(dsp_out_6_7),
	.data8x(feature_reg_3_5_1),
	.data9x({feature_reg_4_1_1[13:0],2'b00}),
	.data10x(dsp_out_6_4),
	.data11x(feature_reg_4_5_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_1_5)
);

wire [15:0] f189, f190, f191, f192, f193, f194;
assign f189 = -dsp_out_6_5;
assign f190 = -{feature_reg_2_1_1[11:0],4'b0000};
assign f191 = -{feature_reg_2_5_1[13:0],2'b00};
assign f192 = -{feature_reg_3_1_1[13:0],2'b00};
assign f193 = -dsp_out_6_7;
assign f194 = -feature_reg_3_5_1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA25 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[11:0],4'b0000}),
	.data1x(f189),
	.data2x({feature_reg_1_5_1[13:0],2'b00}),
	.data3x(f190),
	.data4x(dsp_out_6_6),
	.data5x(f191),
	.data6x(f192),
	.data7x(f193),
	.data8x(f194),
	.data9x({feature_reg_4_1_1[13:0],2'b00}),
	.data10x(dsp_out_6_4),
	.data11x(feature_reg_4_5_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_2_5)
);

wire [15:0] f195, f196, f197, f198, f199, f200, f201;
assign f195 = dsp_out_6_5 >>> 1;
assign f196 = -{feature_reg_1_1_1[12:0],3'b000};
assign f197 = -{feature_reg_1_5_1[14:0],1'b0};
assign f198 = -{feature_reg_2_1_1[13:0],2'b00};
assign f199 = dsp_out_6_6 >>> 2;
assign f200 = -feature_reg_2_5_1;
assign f201 = dsp_out_6_7 <<< 1;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA35 (
	.clock(clk),
	.clken(calculate_2),
	.data0x(f195),
	.data1x(f196),
	.data2x(f197),
	.data3x(f198),
	.data4x(f199),
	.data5x(f200),
	.data6x({feature_reg_3_1_1[12:0],3'b000}),
	.data7x(f201),
	.data8x({feature_reg_3_5_1[14:0],1'b0}),
	.data9x({feature_reg_4_1_1[13:0],2'b00}),
	.data10x(dsp_out_6_4),
	.data11x(feature_reg_4_5_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_3_5)
);

wire [15:0] f202, f203, f204, f205, f206, f207, f208;
assign f202 = -(dsp_out_6_5 >>> 1);
assign f203 = -{feature_reg_2_1_1[13:0],2'b00};
assign f204 = dsp_out_6_6 >>> 2;
assign f205 = -feature_reg_2_5_1;
assign f206 = -{feature_reg_3_1_1[12:0],3'b000};
assign f207 = -(dsp_out_6_7 <<< 1);
assign f208 = -{feature_reg_3_5_1[14:0],1'b0};
winograd_adder_16_20_4 winograd_adder_16_20_4_WA45 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[12:0],3'b000}), 
	.data1x(f202),
	.data2x({feature_reg_1_5_1[14:0],1'b0}),
	.data3x(f203),
	.data4x(f204),
	.data5x(f205),
	.data6x(f206),
	.data7x(f207),
	.data8x(f208),
	.data9x({feature_reg_4_1_1[13:0],2'b00}),
	.data10x(dsp_out_6_4),
	.data11x(feature_reg_4_5_1),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_4_5)
);

wire [15:0] f209;
assign f209 = -dsp_out_6_5;
winograd_adder_16_20_4 winograd_adder_16_20_4_WA55 (
	.clock(clk),
	.clken(calculate_2),
	.data0x({feature_reg_1_1_1[11:0],4'b0000}),
	.data1x(f209),
	.data2x({feature_reg_1_5_1[13:0],2'b00}),
	.data3x(dsp_out_6_8),
	.data4x(dsp_out_6_9),
	.data5x(dsp_out_6_10),
	.data6x({feature_reg_5_1_1[13:0],2'b00}),
	.data7x(dsp_out_6_11),
	.data8x(feature_reg_5_5_1),
	.data9x(0),
	.data10x(0),
	.data11x(0),
	.data12x(0),
	.data13x(0),
	.data14x(0),
	.data15x(0),
	.result(rslt_buffer_5_5)
);

assign o_feature_0 = output_buffer_0_0[15:0];
assign o_feature_1 = output_buffer_1_0[15:0];
assign o_feature_2 = output_buffer_2_0[15:0];
assign o_feature_3 = output_buffer_3_0[15:0];
assign o_feature_4 = output_buffer_4_0[15:0];
assign o_feature_5 = output_buffer_5_0[15:0];
assign o_valid = valid_9;

endmodule

module winograd_adder_16_20_4 (
	input clken,
	input clock,
	input [15:0] data0x,
	input [15:0] data1x,
	input [15:0] data2x,
	input [15:0] data3x,
	input [15:0] data4x,
	input [15:0] data5x,
	input [15:0] data6x,
	input [15:0] data7x,
	input [15:0] data8x,
	input [15:0] data9x,
	input [15:0] data10x,
	input [15:0] data11x,
	input [15:0] data12x,
	input [15:0] data13x,
	input [15:0] data14x,
	input [15:0] data15x,
	output [19:0] result
);

reg [19:0] pipeline_0_0;
reg [19:0] pipeline_0_1;
reg [19:0] pipeline_0_2;
reg [19:0] pipeline_0_3;
reg [19:0] pipeline_0_4;
reg [19:0] pipeline_0_5;
reg [19:0] pipeline_0_6;
reg [19:0] pipeline_0_7;
reg [19:0] pipeline_1_0;
reg [19:0] pipeline_1_1;
reg [19:0] pipeline_1_2;
reg [19:0] pipeline_1_3;
reg [19:0] pipeline_2_0;
reg [19:0] pipeline_2_1;
reg [19:0] pipeline_3_0;

always @ (posedge clock) begin
	pipeline_0_0 <= data0x + data1x;
	pipeline_0_1 <= data2x + data3x;
	pipeline_0_2 <= data4x + data5x;
	pipeline_0_3 <= data6x + data7x;
	pipeline_0_4 <= data8x + data9x;
	pipeline_0_5 <= data10x + data11x;
	pipeline_0_6 <= data12x + data13x;
	pipeline_0_7 <= data14x + data15x;
	pipeline_1_0 <= pipeline_0_0 + pipeline_0_1;
	pipeline_1_1 <= pipeline_0_2 + pipeline_0_3;
	pipeline_1_2 <= pipeline_0_4 + pipeline_0_5;
	pipeline_1_3 <= pipeline_0_6 + pipeline_0_7;
	pipeline_2_0 <= pipeline_1_0 + pipeline_1_1;
	pipeline_2_1 <= pipeline_1_2 + pipeline_1_3;
	pipeline_3_0 <= pipeline_2_0 + pipeline_2_1;
end

assign result = pipeline_3_0;

endmodule

module winograd_dsp_16 (
	input clk,
	input ena,
	input aclr,
	input [15:0] ay,
	input [15:0] by,
	input [2:0] coefsela,
	input [2:0] coefselb,
	output [15:0] resulta,
	output [15:0] resultb
);

reg [15:0] coefa, coefb, ay_reg, by_reg, resa_reg, resb_reg;
assign resulta = resa_reg;
assign resultb = resb_reg;

always @ (posedge clk) begin
	if (aclr) begin
		coefa <= 0;
		coefb <= 0;
		ay_reg <= 0;
		by_reg <= 0;
		resa_reg <= 0;
		resb_reg <= 0;
	end else begin
		ay_reg <= ay;
		by_reg <= by;
		if (coefsela == 0) begin
			coefa <= 5;
		end else if (coefsela == 1) begin
			coefa <= -5;
		end else if (coefsela == 2) begin
			coefa <= 10;
		end else if (coefsela == 3) begin
			coefa <= -10;
		end else if (coefsela == 4) begin
			coefa <= 20;
		end else if (coefsela == 5) begin
			coefa <= -20;
		end else if (coefsela == 6) begin
			coefa <= 25;
		end else if (coefsela == 7) begin
			coefa <= -25;
		end else begin
			coefa <= 0;
		end
		if (coefselb == 0) begin
			coefb <= 5;
		end else if (coefselb == 1) begin
			coefb <= -5;
		end else if (coefselb == 2) begin
			coefb <= 10;
		end else if (coefselb == 3) begin
			coefb <= -10;
		end else if (coefselb == 4) begin
			coefb <= 20;
		end else if (coefselb == 5) begin
			coefb <= -20;
		end else if (coefselb == 6) begin
			coefb <= 25;
		end else if (coefselb == 7) begin
			coefb <= -25;
		end else begin
			coefb <= 0;
		end
		resa_reg <= ay_reg * coefa;
		resb_reg <= by_reg * coefb;
	end
end

endmodule






