`define SIMULATION_MEMORY

module shiftRegFIFO_2_1 (
	input [0:0] X,
	output [0:0] Y,
	input reset,
	input clk
);

reg [0:0] mem_0;
reg [0:0] mem_1;
assign Y = mem_1;

always @ (posedge clk) begin
	if (reset) begin
		mem_0 <= 0;
		mem_1 <= 0;
	end else begin
		mem_1 <= mem_0;
		mem_0 <= X;
	end
end

endmodule
