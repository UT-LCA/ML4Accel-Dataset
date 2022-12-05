`define BFLOAT16 
`define VCS
`define EXPONENT 8
`define MANTISSA 7
`define EXPONENT 5
`define MANTISSA 10
`define SIGN 1
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define AWIDTH 10
`define MEM_SIZE 1024
`define DESIGN_SIZE 12
`define CU_SIZE 4
`define MASK_WIDTH 4
`define MEM_ACCESS_LATENCY 1
`define REG_DATAWIDTH 32
`define REG_ADDRWIDTH 8
`define ITERATIONS_WIDTH 32
`define REG_STDN_ADDR 32'h4
`define REG_MATRIX_A_ADDR 32'he
`define REG_MATRIX_B_ADDR 32'h12
`define REG_MATRIX_C_ADDR 32'h16
`define REG_VALID_MASK_A_ADDR 32'h20
`define REG_VALID_MASK_B_ADDR 32'h5c
`define REG_ITERATIONS_ADDR 32'h40
`define PE_PIPELINE_DEPTH 5
`define IDLE     2'b00
`define W_ENABLE  2'b01
`define R_ENABLE  2'b10

module FPAddSub_NormalizeShift1(
		MminP,
		Shift,
		Mmin
	);
	
	// Input ports
	input [`DWIDTH:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [3:0] Shift ;						// Shift amount
	
	// Output ports
	output [`DWIDTH:0] Mmin ;						// The smaller mantissa
	
	reg	  [`DWIDTH:0]		Lvl2;
	wire    [2*`DWIDTH+1:0]    Stage1;	
	reg	  [`DWIDTH:0]		Lvl3;
	wire    [2*`DWIDTH+1:0]    Stage2;	
	integer           i;               	// Loop variable
	
	assign Stage1 = {MminP, MminP};

	always @(*) begin    					// Rotate {0 | 4 | 8 | 12} bits
	  case (Shift[3:2])
			// Rotate by 0
			2'b00: Lvl2 <= Stage1[`DWIDTH:0];       		
			// Rotate by 4
			2'b01: begin for (i=33; i>=17; i=i-1) begin Lvl2[i-33] <= Stage1[i-4]; end Lvl2[3:0] <= 0; end
			// Rotate by 8
			2'b10: begin for (i=33; i>=17; i=i-1) begin Lvl2[i-33] <= Stage1[i-8]; end Lvl2[7:0] <= 0; end
			// Rotate by 12
			2'b11: begin for (i=33; i>=17; i=i-1) begin Lvl2[i-33] <= Stage1[i-12]; end Lvl2[11:0] <= 0; end
	  endcase
	end
	
	assign Stage2 = {Lvl2, Lvl2};

	always @(*) begin   				 		// Rotate {0 | 1 | 2 | 3} bits
	  case (Shift[1:0])
			// Rotate by 0
			2'b00:  Lvl3 <= Stage2[`DWIDTH:0];
			// Rotate by 1
			2'b01: begin for (i=33; i>=17; i=i-1) begin Lvl3[i-`DWIDTH-1] <= Stage2[i-1]; end Lvl3[0] <= 0; end 
			// Rotate by 2
			2'b10: begin for (i=33; i>=17; i=i-1) begin Lvl3[i-`DWIDTH-1] <= Stage2[i-2]; end Lvl3[1:0] <= 0; end
			// Rotate by 3
			2'b11: begin for (i=33; i>=17; i=i-1) begin Lvl3[i-`DWIDTH-1] <= Stage2[i-3]; end Lvl3[2:0] <= 0; end
	  endcase
	end
	
	// Assign outputs
	assign Mmin = Lvl3;						// Take out smaller mantissa			
	
endmodule
