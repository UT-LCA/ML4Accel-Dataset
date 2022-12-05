`define SIMULATION_MEMORY

module addfxp_18_1 (
	input [17:0] a,
	input [17:0] b,
	input clk,
	output [17:0] q
);

reg [17:0] res_0;
assign q = res_0;

always @(posedge clk) begin
	res_0 <= a + b;
end

endmodule
