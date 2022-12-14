`define SIMULATION_MEMORY

module accumulator_24_30_3 (
	input clk,
	input i_reset,
	input [23:0] i_result,
	input i_dp_done,
	output [29:0] o_accum
);

reg [29:0] cir_shift_reg_0;
reg [29:0] cir_shift_reg_1;
reg [29:0] cir_shift_reg_2;
reg [29:0] out_reg;
reg [29:0] in_reg;

always @ (posedge clk) begin
	if(i_reset == 1'b1) begin
		cir_shift_reg_0 <= 0;
		cir_shift_reg_1 <= 0;
		cir_shift_reg_2 <= 0;
		out_reg <= 0;
		in_reg <= 0;
	end else begin
		if (i_result[23] == 1'b0) begin
			in_reg <= {6'b000000, i_result};
		end else begin
			in_reg <= {6'b111111, i_result};
		end
		if(i_dp_done == 1'b1) begin
			out_reg <= (cir_shift_reg_0 + in_reg);
			cir_shift_reg_2 <= 0;
		end else begin
			cir_shift_reg_2 <= (cir_shift_reg_0 + in_reg);
		end
		cir_shift_reg_0 <= cir_shift_reg_1;
		cir_shift_reg_1 <= cir_shift_reg_2;
	end
end

assign o_accum = out_reg;

endmodule
