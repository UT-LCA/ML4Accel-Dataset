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

module FPAddSub_AlignShift1(
		MminP,
		Shift,
		Mmin
	);

	// Input ports
	input [`MANTISSA-1:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [2:0] Shift ;						// Shift amount

	// Output ports
	output [`MANTISSA:0] Mmin ;						// The smaller mantissa

	// Internal signals
	reg	  [`MANTISSA:0]		Lvl1;
	reg	  [`MANTISSA:0]		Lvl2;
	wire    [2*`MANTISSA+1:0]    Stage1;
	integer           i;                // Loop variable

	always @(*) begin
		// Rotate by 16?
		//Lvl1 <= Shift[2] ? {17'b00000000000000001, MminP[22:16]} : {1'b1, MminP};
		Lvl1 <= Shift[2] ? {11'b0000000000} : {1'b1, MminP};

	end

	assign Stage1 = { 11'b0, Lvl1};

	always @(*) begin    					// Rotate {0 | 4 | 8 | 12} bits
	  case (Shift[1:0])
			// Rotate by 0
			2'b00:  Lvl2 <= Stage1[`MANTISSA:0];
			// Rotate by 4
			2'b01:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+4]; end /*Lvl2[`MANTISSA:`MANTISSA-3] <= 0;*/ end
			// Rotate by 8
			2'b10:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+8]; end /*Lvl2[`MANTISSA:`MANTISSA-7] <= 0;*/ end
			// Rotate by 12
			2'b11: Lvl2[`MANTISSA: 0] <= 0;
			//2'b11:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+12]; end Lvl2[`MANTISSA:`MANTISSA-12] <= 0; end
	  endcase
	end

	// Assign output to next shift stage
	assign Mmin = Lvl2;

endmodule
