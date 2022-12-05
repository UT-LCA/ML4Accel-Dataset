`define SIMULATION_MEMORY
`define EXPONENT 5
`define MANTISSA 10
`define ACTUAL_MANTISSA 11
`define EXPONENT_LSB 10
`define EXPONENT_MSB 14
`define MANTISSA_LSB 0
`define MANTISSA_MSB 9
`define MANTISSA_MUL_SPLIT_LSB 3
`define MANTISSA_MUL_SPLIT_MSB 9
`define SIGN 1
`define SIGN_LOC 15
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1

module FPAddSub_NormalizeModule(
		Sum,
		Mmin,
		Shift
    );

	// Input ports
	input [`DWIDTH:0] Sum ;					// Mantissa sum including hidden 1 and GRS

	// Output ports
	output [`DWIDTH:0] Mmin ;					// Mantissa after 16|0 shift
	output [4:0] Shift ;					// Shift amount

	// Determine normalization shift amount by finding leading nought
	assign Shift =  (
		Sum[16] ? 5'b00000 :
		Sum[15] ? 5'b00001 :
		Sum[14] ? 5'b00010 :
		Sum[13] ? 5'b00011 :
		Sum[12] ? 5'b00100 :
		Sum[11] ? 5'b00101 :
		Sum[10] ? 5'b00110 :
		Sum[9] ? 5'b00111 :
		Sum[8] ? 5'b01000 :
		Sum[7] ? 5'b01001 :
		Sum[6] ? 5'b01010 :
		Sum[5] ? 5'b01011 :
		Sum[4] ? 5'b01100 : 5'b01101
	//	Sum[19] ? 5'b01101 :
	//	Sum[18] ? 5'b01110 :
	//	Sum[17] ? 5'b01111 :
	//	Sum[16] ? 5'b10000 :
	//	Sum[15] ? 5'b10001 :
	//	Sum[14] ? 5'b10010 :
	//	Sum[13] ? 5'b10011 :
	//	Sum[12] ? 5'b10100 :
	//	Sum[11] ? 5'b10101 :
	//	Sum[10] ? 5'b10110 :
	//	Sum[9] ? 5'b10111 :
	//	Sum[8] ? 5'b11000 :
	//	Sum[7] ? 5'b11001 : 5'b11010
	);

	reg	  [`DWIDTH:0]		Lvl1;

	always @(*) begin
		// Rotate by 16?
		Lvl1 <= Shift[4] ? {Sum[8:0], 8'b00000000} : Sum;
	end

	// Assign outputs
	assign Mmin = Lvl1;						// Take out smaller mantissa

endmodule
