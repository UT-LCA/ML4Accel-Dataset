`define BITS 32         // Bit width of the operands
`define NumPath 34     

module mul_r2(clk, opa, opb, prod);
input		clk;
input	[23:0]	opa, opb;
output	[47:0]	prod;

reg	[47:0]	prod1, prod;

always @(posedge clk)
	prod1 <=   opa * opb;

always @(posedge clk)
	prod <=   prod1;

endmodule
