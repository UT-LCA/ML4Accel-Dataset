`define BITS 32         // Bit width of the operands
`define NumPath 34     

module delay5 (clock, d5_delay_in, d5_delay_out);
	input clock;
	input [`BITS-1:0] d5_delay_in;
	output [`BITS-1:0] d5_delay_out;

	//FIFO delay
	reg [`BITS-1:0] d5_reg1;
/*
	reg [`BITS-1:0] d5_reg2;
	reg [`BITS-1:0] d5_reg3;
	reg [`BITS-1:0] d5_reg4;
	reg [`BITS-1:0] d5_reg5;
	reg [`BITS-1:0] d5_reg6;
*/

	assign d5_delay_out = d5_reg1;

	always @(posedge clock)
	begin
		d5_reg1 <= d5_delay_in;
/*
		d5_reg2 <= d5_reg1;
		d5_reg3 <= d5_reg2;
		d5_reg4 <= d5_reg3;
		d5_reg5 <= d5_reg4;
		d5_reg6 <= d5_reg5;
*/
	end
endmodule
