`define SIMULATION_MEMORY

module dsp_signed_mult_18x18_unit_18_36_0 (
	input clk,
	input reset,
	input ena,
	input i_valid,
	input [17:0] ax,
	input [17:0] ay,
	input [17:0] bx,
	input [17:0] by,
	output o_valid,
	output [35:0] resulta,
	output [35:0] resultb 
);

reg [35:0] reg_resa, reg_resb;
always @(posedge clk) begin
	reg_resa <= ax * ay;
	reg_resb <= bx * by;
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
