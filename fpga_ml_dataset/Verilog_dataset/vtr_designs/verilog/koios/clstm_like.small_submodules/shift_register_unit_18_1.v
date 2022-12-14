`define SIMULATION_MEMORY

module shift_register_unit_18_1 (
	input clk,
	input reset,
	input enable,
	input [17:0] in,
	output [17:0] out
);

reg [17:0] shift_registers_0;
always @ (posedge clk) begin
	if (reset) begin
		shift_registers_0 <= 18'd0;
	end else if (enable) begin
		shift_registers_0 <= in;
	end
end

assign out = shift_registers_0;

endmodule
