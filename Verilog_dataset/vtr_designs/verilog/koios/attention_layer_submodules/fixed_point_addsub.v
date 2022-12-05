`define SIMULATION_MEMORY
//`define SIMULATION_addfp
`define VECTOR_DEPTH 64 //Q,K,V vector size
`define DATA_WIDTH 16
`define VECTOR_BITS 1024 // 16 bit each (16x64)
`define NUM_WORDS 32   //num of words in the sentence
`define BUF_AWIDTH 4 //16 entries in each buffer ram
`define BUF_LOC_SIZE 4 //4 words in each addr location
`define OUT_RAM_DEPTH 512 //512 entries in output bram
`define EXPONENT 8
`define MANTISSA 7
`define EXPONENT 5
`define MANTISSA 10
`define SIGN 1
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define DEFINES_DONE
`define DATAWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1
`define NUM 4
`define ADDRSIZE 4

module fixed_point_addsub(
		clk,
		rst,
		a,
		b,
		operation,			// 0 add, 1 sub
		result,
		flags
	);
	
	// Clock and reset
	input clk ;										// Clock signal
	input rst ;										// Reset (active high, resets pipeline registers)
	
	// Input ports
  input [`DATAWIDTH-1:0] a ;								// Input A, a 32-bit floating point number
  input [`DATAWIDTH-1:0] b ;								// Input B, a 32-bit floating point number
	input operation ;								// Operation select signal
	
	// Output ports
  output reg [`DATAWIDTH-1:0] result ;						// Result of the operation
	output [4:0] flags ;							// Flags indicating exceptions according to IEEE754
	
  reg [`DATAWIDTH:0] result_t ;
  wire [`DATAWIDTH-1:0] b_t ;
	
	assign b_t = ~b + 1;
	
	always@(*) begin
      if (operation == 1'b0) begin
			result_t = a + b;
		end
		else begin
			result_t = a + b_t;
		end
	end

	
	always @ (*) begin	
		if (result_t[16] == 1'b1 && operation == 1'b0) begin
			result = 16'h7000;
		end
		else if (result_t[16] == 1'b1 && operation == 1'b1) begin
			result = 16'h8000;
		end
		else begin
			result = result_t[15:0];
		end
	end
	// Pipeline Registers
	//reg [79:0] pipe_1;							// Pipeline register PreAlign->Align1
	
	
endmodule
