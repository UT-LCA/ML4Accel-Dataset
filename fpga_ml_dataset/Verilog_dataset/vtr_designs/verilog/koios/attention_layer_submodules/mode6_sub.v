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

module mode6_sub(
  a_inp0,
  a_inp1,
  a_inp2,
  a_inp3,
  b_inp,
  outp0,
  outp1,
  outp2,
  outp3
);

  input  [`DATAWIDTH-1 : 0] a_inp0;
  input  [`DATAWIDTH-1 : 0] a_inp1;
  input  [`DATAWIDTH-1 : 0] a_inp2;
  input  [`DATAWIDTH-1 : 0] a_inp3;
  input  [`DATAWIDTH-1 : 0] b_inp;
  output  [`DATAWIDTH-1 : 0] outp0;
  output  [`DATAWIDTH-1 : 0] outp1;
  output  [`DATAWIDTH-1 : 0] outp2;
  output  [`DATAWIDTH-1 : 0] outp3;

  wire [4:0] flags_NC0, flags_NC1, flags_NC2, flags_NC3;
  // 0 add, 1 sub
  wire clk_NC, rst_NC;
  fixed_point_addsub sub0(.clk(clk_NC), .rst(rst_NC), .a(a_inp0),	.b(b_inp), .operation(1'b1),	.result(outp0), .flags(flags_NC0));
  fixed_point_addsub sub1(.clk(clk_NC), .rst(rst_NC), .a(a_inp1),	.b(b_inp), .operation(1'b1),	.result(outp1), .flags(flags_NC1));
  fixed_point_addsub sub2(.clk(clk_NC), .rst(rst_NC), .a(a_inp2),	.b(b_inp), .operation(1'b1),	.result(outp2), .flags(flags_NC2));
  fixed_point_addsub sub3(.clk(clk_NC), .rst(rst_NC), .a(a_inp3),	.b(b_inp), .operation(1'b1),	.result(outp3), .flags(flags_NC3));

//  DW_fp_sub #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) sub0(.a(a_inp0), .b(b_inp), .z(outp0), .rnd(3'b000), .status());
//  DW_fp_sub #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) sub1(.a(a_inp1), .b(b_inp), .z(outp1), .rnd(3'b000), .status());
//  DW_fp_sub #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) sub2(.a(a_inp2), .b(b_inp), .z(outp2), .rnd(3'b000), .status());
//  DW_fp_sub #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) sub3(.a(a_inp3), .b(b_inp), .z(outp3), .rnd(3'b000), .status());
endmodule
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
