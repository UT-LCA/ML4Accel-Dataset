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

module mode4_adder_tree(
  inp0, 
  inp1, 
  inp2, 
  inp3, 
  mode4_stage0_run,
  mode4_stage1_run,
  mode4_stage2_run,

  clk,
  reset,
  outp
);

  input clk;
  input reset;
  input  [`DATAWIDTH-1 : 0] inp0; 
  input  [`DATAWIDTH-1 : 0] inp1; 
  input  [`DATAWIDTH-1 : 0] inp2; 
  input  [`DATAWIDTH-1 : 0] inp3; 
  output [`DATAWIDTH-1 : 0] outp;
  input mode4_stage0_run;
  input mode4_stage1_run;
  input mode4_stage2_run;

  wire   [`DATAWIDTH-1 : 0] add0_out_stage2;
  reg    [`DATAWIDTH-1 : 0] add0_out_stage2_reg;
  wire   [`DATAWIDTH-1 : 0] add1_out_stage2;
  reg    [`DATAWIDTH-1 : 0] add1_out_stage2_reg;

  wire   [`DATAWIDTH-1 : 0] add0_out_stage1;
  reg    [`DATAWIDTH-1 : 0] add0_out_stage1_reg;

  wire   [`DATAWIDTH-1 : 0] add0_out_stage0;
  reg    [`DATAWIDTH-1 : 0] outp;
/*
  always @(posedge clk) begin
    if (reset) begin
      outp <= 0;
      add0_out_stage2_reg <= 0;
      add1_out_stage2_reg <= 0;
      add0_out_stage1_reg <= 0;
    end

    if(~reset && mode4_stage2_run) begin
      add0_out_stage2_reg <= add0_out_stage2;
      add1_out_stage2_reg <= add1_out_stage2;
    end

    if(~reset && mode4_stage1_run) begin
      add0_out_stage1_reg <= add0_out_stage1;
    end

    if(~reset && mode4_stage0_run) begin
      outp <= add0_out_stage0;
    end
  end
*/
always @ (posedge clk) begin
	if(~reset && mode4_stage2_run) begin
      add0_out_stage2_reg <= add0_out_stage2;
      add1_out_stage2_reg <= add1_out_stage2;
    end
	
	else if (reset) begin
		add0_out_stage2_reg <= 0;
		add1_out_stage2_reg <= 0;
	end
end		

always @ (posedge clk) begin
	if(~reset && mode4_stage1_run) begin
      add0_out_stage1_reg <= add0_out_stage1;
    end
	else if (reset) begin
	add0_out_stage1_reg <= 0;
	end
end

always @ (posedge clk) begin
	if(~reset && mode4_stage0_run) begin
		outp <= add0_out_stage0;
    end
	else if (reset) begin
		outp <= 0;
	end
end	
		
	
  wire clk_NC;
  wire rst_NC;
  wire [4:0] flags_NC0, flags_NC1, flags_NC2, flags_NC3;

  // 0 add, 1 sub
  fixed_point_addsub add0_stage2(.clk(clk_NC), .rst(rst_NC), .a(inp0),	.b(inp1), .operation(1'b0),	.result(add0_out_stage2), .flags(flags_NC0));
  fixed_point_addsub add1_stage2(.clk(clk_NC), .rst(rst_NC), .a(inp2),	.b(inp3), .operation(1'b0),	.result(add1_out_stage2), .flags(flags_NC1));
  fixed_point_addsub add0_stage1(.clk(clk_NC), .rst(rst_NC), .a(add0_out_stage2_reg),	.b(add1_out_stage2_reg), .operation(1'b0),	.result(add0_out_stage1), .flags(flags_NC2));
  fixed_point_addsub add0_stage0(.clk(clk_NC), .rst(rst_NC), .a(outp),	.b(add0_out_stage1_reg), .operation(1'b0),	.result(add0_out_stage0), .flags(flags_NC3));

  //DW_fp_add #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) add0_stage2(.a(inp0),       .b(inp1),      .z(add0_out_stage2), .rnd(3'b000),    .status());
  //DW_fp_add #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) add1_stage2(.a(inp2),       .b(inp3),      .z(add1_out_stage2), .rnd(3'b000),    .status());

  //DW_fp_add #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) add0_stage1(.a(add0_out_stage2_reg),       .b(add1_out_stage2_reg),      .z(add0_out_stage1), .rnd(3'b000),    .status());

  //DW_fp_add #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) add0_stage0(.a(outp),       .b(add0_out_stage1_reg),      .z(add0_out_stage0), .rnd(3'b000),    .status());

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



