`define DEFINES_DONE
`define EXPONENT 5
`define MANTISSA 10
`define SIGN 1
`define DATAWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1
`define NUM 8
`define ADDRSIZE 7
`define ADDRSIZE_FOR_TB 10
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

module mode3_exp(
  inp0, 
  inp1, 
  inp2, 
  inp3, 
  inp4, 
  inp5, 
  inp6, 
  inp7, 

  clk,
  reset,
  stage_run,
  stage_run2,
  
  outp0, 
  outp1, 
  outp2, 
  outp3, 
  outp4, 
  outp5, 
  outp6, 
  outp7
);

  input  [`DATAWIDTH-1 : 0] inp0;
  input  [`DATAWIDTH-1 : 0] inp1;
  input  [`DATAWIDTH-1 : 0] inp2;
  input  [`DATAWIDTH-1 : 0] inp3;
  input  [`DATAWIDTH-1 : 0] inp4;
  input  [`DATAWIDTH-1 : 0] inp5;
  input  [`DATAWIDTH-1 : 0] inp6;
  input  [`DATAWIDTH-1 : 0] inp7;

  input  clk;
  input  reset;
  input  stage_run;
  input  stage_run2; 
  
  output  [`DATAWIDTH-1 : 0] outp0;
  output  [`DATAWIDTH-1 : 0] outp1;
  output  [`DATAWIDTH-1 : 0] outp2;
  output  [`DATAWIDTH-1 : 0] outp3;
  output  [`DATAWIDTH-1 : 0] outp4;
  output  [`DATAWIDTH-1 : 0] outp5;
  output  [`DATAWIDTH-1 : 0] outp6;
  output  [`DATAWIDTH-1 : 0] outp7;
  expunit exp0(.a(inp0), .z(outp0), .status(), .stage_run(stage_run), .stage_run2(stage_run2), .clk(clk), .reset(reset));
  expunit exp1(.a(inp1), .z(outp1), .status(), .stage_run(stage_run), .stage_run2(stage_run2), .clk(clk), .reset(reset));
  expunit exp2(.a(inp2), .z(outp2), .status(), .stage_run(stage_run), .stage_run2(stage_run2), .clk(clk), .reset(reset));
  expunit exp3(.a(inp3), .z(outp3), .status(), .stage_run(stage_run), .stage_run2(stage_run2), .clk(clk), .reset(reset));
  expunit exp4(.a(inp4), .z(outp4), .status(), .stage_run(stage_run), .stage_run2(stage_run2), .clk(clk), .reset(reset));
  expunit exp5(.a(inp5), .z(outp5), .status(), .stage_run(stage_run), .stage_run2(stage_run2), .clk(clk), .reset(reset));
  expunit exp6(.a(inp6), .z(outp6), .status(), .stage_run(stage_run), .stage_run2(stage_run2), .clk(clk), .reset(reset));
  expunit exp7(.a(inp7), .z(outp7), .status(), .stage_run(stage_run), .stage_run2(stage_run2), .clk(clk), .reset(reset));
endmodule

module expunit (a, z, status, stage_run, stage_run2, clk, reset);

  parameter int_width = 3; // fixed point integer length
  parameter frac_width = 3; // fixed point fraction length
  	
  input [15:0] a;
  input stage_run2;
  input stage_run;
  input clk;
  input reset;
  output [15:0] z;
  output [7:0] status;
  
  wire [int_width + frac_width - 1: 0] fxout;
  wire [31:0] LUTout;
  reg  [31:0] LUTout_reg;
  reg  [31:0] LUTout_reg2;
  wire [15:0] Mult_out;
  reg  [15:0] Mult_out_reg;
  reg  [15:0] a_reg;
  
  
  always @(posedge clk) begin
    if(reset) begin
      Mult_out_reg <= 0;
      LUTout_reg <= 0;
	  LUTout_reg2 <= 0;
	  a_reg <= 0;
    end
    else if(stage_run2) begin
      LUTout_reg2 <= LUTout;
	  a_reg <= a;
    end	
	else if(stage_run) begin
      Mult_out_reg <= Mult_out;
      LUTout_reg <= LUTout_reg2;
    end
  end

  wire clk_NC, rst_NC;
        
  fptofixed_para fpfx (.fp(a), .fx(fxout));
  LUT lut(.addr(fxout[int_width + frac_width - 1 : 0]), .exp(LUTout)); 
  //DW_fp_mult #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) fpmult (.a(a), .b(LUTout[31:16]), .rnd(3'b000), .z(Mult_out), .status());
  FPMult fpmult (.clk(clk), .rst(rst), .a(a_reg), .b(LUTout_reg2[31:16]), .result(Mult_out), .flags());
  //DW_fp_add #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) fpsub (.a(Mult_out_reg), .b(LUTout_reg[15:0]), .rnd(3'b000), .z(z), .status(status[7:0]));
  FPAddSub fpsub (.clk(clk), .rst(rst), .a(Mult_out_reg),	.b(LUTout_reg[15:0]), .operation(1'b0),	.result(z), .flags());
endmodule
module FPAddSub(
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
	input [`DWIDTH-1:0] a ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b ;								// Input B, a 32-bit floating point number
	input operation ;								// Operation select signal
	
	// Output ports
	output [`DWIDTH-1:0] result ;						// Result of the operation
	output [4:0] flags ;							// Flags indicating exceptions according to IEEE754
	
	assign flags = 5'b0;
	
`ifdef complex_dsp
adder_fp_clk u_add(.clk(clk), .a(a), .b(b),.out(result));
`else
FPAddSub_16 u_FPAddSub (.clk(clk), .rst(rst), .a(a), .b(b), .operation(1'b0), .result(result), .flags());
`endif
endmodule
module FPAddSub_16(
		//bf16,
		clk,
		rst,
		a,
		b,
		operation,			// 0 add, 1 sub
		result,
		flags
	);
	//input bf16; //1 for Bfloat16, 0 for IEEE half precision

	// Clock and reset
	input clk ;										// Clock signal
	input rst ;										// Reset (active high, resets pipeline registers)
	
	// Input ports
	input [`DWIDTH-1:0] a ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b ;								// Input B, a 32-bit floating point number
	input operation ;								// Operation select signal
	
	// Output ports
	output [`DWIDTH-1:0] result ;						// Result of the operation
	output [4:0] flags ;							// Flags indicating exceptions according to IEEE754
	
	// Pipeline Registers
	//reg [79:0] pipe_1;							// Pipeline register PreAlign->Align1
	reg [2*`EXPONENT + 2*`DWIDTH + 5:0] pipe_1;							// Pipeline register PreAlign->Align1

	//reg [67:0] pipe_2;							// Pipeline register Align1->Align3
	//reg [2*`EXPONENT+ 2*`MANTISSA + 8:0] pipe_2;							// Pipeline register Align1->Align3
	wire [2*`EXPONENT+ 2*`MANTISSA + 8:0] pipe_2;

	//reg [76:0] pipe_3;	68						// Pipeline register Align1->Align3
	reg [2*`EXPONENT+ 2*`MANTISSA + 9:0] pipe_3;							// Pipeline register Align1->Align3

	//reg [69:0] pipe_4;							// Pipeline register Align3->Execute
	//reg [2*`EXPONENT+ 2*`MANTISSA + 9:0] pipe_4;							// Pipeline register Align3->Execute
	wire [2*`EXPONENT+ 2*`MANTISSA + 9:0] pipe_4;
	
	//reg [51:0] pipe_5;							// Pipeline register Execute->Normalize
	reg [`DWIDTH+`EXPONENT+11:0] pipe_5;							// Pipeline register Execute->Normalize

	//reg [56:0] pipe_6;							// Pipeline register Nomalize->NormalizeShift1
	//reg [`DWIDTH+`EXPONENT+16:0] pipe_6;							// Pipeline register Nomalize->NormalizeShift1
	wire [`DWIDTH+`EXPONENT+16:0] pipe_6;

	//reg [56:0] pipe_7;							// Pipeline register NormalizeShift2->NormalizeShift3
	//reg [`DWIDTH+`EXPONENT+16:0] pipe_7;							// Pipeline register NormalizeShift2->NormalizeShift3
	wire [`DWIDTH+`EXPONENT+16:0] pipe_7;
	//reg [54:0] pipe_8;							// Pipeline register NormalizeShift3->Round
	reg [`EXPONENT*2+`MANTISSA+15:0] pipe_8;							// Pipeline register NormalizeShift3->Round

	//reg [40:0] pipe_9;							// Pipeline register NormalizeShift3->Round
	//reg [`DWIDTH+8:0] pipe_9;							// Pipeline register NormalizeShift3->Round
	wire [`DWIDTH+8:0] pipe_9;

	// Internal wires between modules
	wire [`DWIDTH-2:0] Aout_0 ;							// A - sign
	wire [`DWIDTH-2:0] Bout_0 ;							// B - sign
	wire Opout_0 ;									// A's sign
	wire Sa_0 ;										// A's sign
	wire Sb_0 ;										// B's sign
	wire MaxAB_1 ;									// Indicates the larger of A and B(0/A, 1/B)
	wire [`EXPONENT-1:0] CExp_1 ;							// Common Exponent
	wire [`EXPONENT-1:0] Shift_1 ;							// Number of steps to smaller mantissa shift right (align)
	wire [`MANTISSA-1:0] Mmax_1 ;							// Larger mantissa
	wire [4:0] InputExc_0 ;						// Input numbers are exceptions
	wire [2*`EXPONENT-1:0] ShiftDet_0 ;
	wire [`MANTISSA-1:0] MminS_1 ;						// Smaller mantissa after 0/16 shift
	wire [`MANTISSA:0] MminS_2 ;						// Smaller mantissa after 0/4/8/12 shift
	wire [`MANTISSA:0] Mmin_3 ;							// Smaller mantissa after 0/1/2/3 shift
	wire [`DWIDTH:0] Sum_4 ;
	wire PSgn_4 ;
	wire Opr_4 ;
	wire [`EXPONENT-1:0] Shift_5 ;							// Number of steps to shift sum left (normalize)
	wire [`DWIDTH:0] SumS_5 ;							// Sum after 0/16 shift
	wire [`DWIDTH:0] SumS_6 ;							// Sum after 0/16 shift
	wire [`DWIDTH:0] SumS_7 ;							// Sum after 0/16 shift
	wire [`MANTISSA-1:0] NormM_8 ;						// Normalized mantissa
	wire [`EXPONENT:0] NormE_8;							// Adjusted exponent
	wire ZeroSum_8 ;								// Zero flag
	wire NegE_8 ;									// Flag indicating negative exponent
	wire R_8 ;										// Round bit
	wire S_8 ;										// Final sticky bit
	wire FG_8 ;										// Final sticky bit
	wire [`DWIDTH-1:0] P_int ;
	wire EOF ;
	
	// Prepare the operands for alignment and check for exceptions
	FPAddSub_PrealignModule PrealignModule
	(	// Inputs
		a, b, operation,
		// Outputs
		Sa_0, Sb_0, ShiftDet_0[2*`EXPONENT-1:0], InputExc_0[4:0], Aout_0[`DWIDTH-2:0], Bout_0[`DWIDTH-2:0], Opout_0) ;
		
	// Prepare the operands for alignment and check for exceptions
	FPAddSub_AlignModule AlignModule
	(	// Inputs
		pipe_1[2*`EXPONENT + 2*`DWIDTH + 4: 2*`EXPONENT +`DWIDTH + 6], pipe_1[2*`EXPONENT +`DWIDTH + 5 :  2*`EXPONENT +7], pipe_1[2*`EXPONENT+4:5],
		// Outputs
		CExp_1[`EXPONENT-1:0], MaxAB_1, Shift_1[`EXPONENT-1:0], MminS_1[`MANTISSA-1:0], Mmax_1[`MANTISSA-1:0]) ;	

	// Alignment Shift Stage 1
	FPAddSub_AlignShift1 AlignShift1
	(  // Inputs
		//bf16, 
		pipe_2[`MANTISSA-1:0], pipe_2[`EXPONENT+ 2*`MANTISSA + 4 : 2*`MANTISSA + 7],
		// Outputs
		MminS_2[`MANTISSA:0]) ;

	// Alignment Shift Stage 3 and compution of guard and sticky bits
	FPAddSub_AlignShift2 AlignShift2  
	(  // Inputs
		pipe_3[`MANTISSA:0], pipe_3[2*`MANTISSA+7:2*`MANTISSA+6],
		// Outputs
		Mmin_3[`MANTISSA:0]) ;
						
	// Perform mantissa addition
	FPAddSub_ExecutionModule ExecutionModule
	(  // Inputs
		pipe_4[`MANTISSA*2+5:`MANTISSA+6], pipe_4[`MANTISSA:0], pipe_4[2*`EXPONENT+ 2*`MANTISSA + 8], pipe_4[2*`EXPONENT+ 2*`MANTISSA + 7], pipe_4[2*`EXPONENT+ 2*`MANTISSA + 6], pipe_4[2*`EXPONENT+ 2*`MANTISSA + 9],
		// Outputs
		Sum_4[`DWIDTH:0], PSgn_4, Opr_4) ;
	
	// Prepare normalization of result
	FPAddSub_NormalizeModule NormalizeModule
	(  // Inputs
		pipe_5[`DWIDTH:0], 
		// Outputs
		SumS_5[`DWIDTH:0], Shift_5[4:0]) ;
					
	// Normalization Shift Stage 1
	FPAddSub_NormalizeShift1 NormalizeShift1
	(  // Inputs
		pipe_6[`DWIDTH:0], pipe_6[`DWIDTH+`EXPONENT+14:`DWIDTH+`EXPONENT+11],
		// Outputs
		SumS_7[`DWIDTH:0]) ;
		
	// Normalization Shift Stage 3 and final guard, sticky and round bits
	FPAddSub_NormalizeShift2 NormalizeShift2
	(  // Inputs
		pipe_7[`DWIDTH:0], pipe_7[`DWIDTH+`EXPONENT+5:`DWIDTH+6], pipe_7[`DWIDTH+`EXPONENT+15:`DWIDTH+`EXPONENT+11],
		// Outputs
		NormM_8[`MANTISSA-1:0], NormE_8[`EXPONENT:0], ZeroSum_8, NegE_8, R_8, S_8, FG_8) ;

	// Round and put result together
	FPAddSub_RoundModule RoundModule
	(  // Inputs
		 pipe_8[3], pipe_8[4+`EXPONENT:4], pipe_8[`EXPONENT+`MANTISSA+4:5+`EXPONENT], pipe_8[1], pipe_8[0], pipe_8[`EXPONENT*2+`MANTISSA+15], pipe_8[`EXPONENT*2+`MANTISSA+12], pipe_8[`EXPONENT*2+`MANTISSA+11], pipe_8[`EXPONENT*2+`MANTISSA+14], pipe_8[`EXPONENT*2+`MANTISSA+10], 
		// Outputs
		P_int[`DWIDTH-1:0], EOF) ;
	
	// Check for exceptions
	FPAddSub_ExceptionModule Exceptionmodule
	(  // Inputs
		pipe_9[8+`DWIDTH:9], pipe_9[8], pipe_9[7], pipe_9[6], pipe_9[5:1], pipe_9[0], 
		// Outputs
		result[`DWIDTH-1:0], flags[4:0]) ;			
	

assign pipe_2 = {pipe_1[2*`EXPONENT + 2*`DWIDTH + 5], pipe_1[2*`EXPONENT +6:2*`EXPONENT +5], MaxAB_1, CExp_1[`EXPONENT-1:0], Shift_1[`EXPONENT-1:0], Mmax_1[`MANTISSA-1:0], pipe_1[4:0], MminS_1[`MANTISSA-1:0]} ;
assign pipe_4 = {pipe_3[2*`EXPONENT+ 2*`MANTISSA + 9:`MANTISSA+1], Mmin_3[`MANTISSA:0]} ;
assign pipe_6 = {pipe_5[`DWIDTH+`EXPONENT+11], Shift_5[4:0], pipe_5[`DWIDTH+`EXPONENT+10:`DWIDTH+1], SumS_5[`DWIDTH:0]} ;
assign pipe_7 = {pipe_6[`DWIDTH+`EXPONENT+16:`DWIDTH+1], SumS_7[`DWIDTH:0]} ;
assign pipe_9 = {P_int[`DWIDTH-1:0], pipe_8[2], pipe_8[1], pipe_8[0], pipe_8[`EXPONENT+`MANTISSA+9:`EXPONENT+`MANTISSA+5], EOF} ;

	always @ (posedge clk) begin	
		if(rst) begin
			pipe_1 <= 0;
			//pipe_2 <= 0;
			pipe_3 <= 0;
			//pipe_4 <= 0;
			pipe_5 <= 0;
			//pipe_6 <= 0;
			//pipe_7 <= 0;
			pipe_8 <= 0;
			//pipe_9 <= 0;
		end 
		else begin
/* PIPE_1:
	[2*`EXPONENT + 2*`DWIDTH + 5]  Opout_0
	[2*`EXPONENT + 2*`DWIDTH + 4: 2*`EXPONENT +`DWIDTH + 6] A_out0
	[2*`EXPONENT +`DWIDTH + 5 :  2*`EXPONENT +7] Bout_0
	[2*`EXPONENT +6] Sa_0
	[2*`EXPONENT +5] Sb_0
	[2*`EXPONENT +4 : 5] ShiftDet_0
	[4:0] Input Exc
*/
			pipe_1 <= {Opout_0, Aout_0[`DWIDTH-2:0], Bout_0[`DWIDTH-2:0], Sa_0, Sb_0, ShiftDet_0[2*`EXPONENT -1:0], InputExc_0[4:0]} ;	
/* PIPE_2
[2*`EXPONENT+ 2*`MANTISSA + 8] operation
[2*`EXPONENT+ 2*`MANTISSA + 7] Sa_0
[2*`EXPONENT+ 2*`MANTISSA + 6] Sb_0
[2*`EXPONENT+ 2*`MANTISSA + 5] MaxAB_0
[2*`EXPONENT+ 2*`MANTISSA + 4:`EXPONENT+ 2*`MANTISSA + 5] CExp_0
[`EXPONENT+ 2*`MANTISSA + 4 : 2*`MANTISSA + 5] Shift_0
[2*`MANTISSA + 4:`MANTISSA + 5] Mmax_0
[`MANTISSA + 4 : `MANTISSA] InputExc_0
[`MANTISSA-1:0] MminS_1
*/
			//pipe_2 <= {pipe_1[2*`EXPONENT + 2*`DWIDTH + 5], pipe_1[2*`EXPONENT +6:2*`EXPONENT +5], MaxAB_1, CExp_1[`EXPONENT-1:0], Shift_1[`EXPONENT-1:0], Mmax_1[`MANTISSA-1:0], pipe_1[4:0], MminS_1[`MANTISSA-1:0]} ;	
/* PIPE_3
[2*`EXPONENT+ 2*`MANTISSA + 9] operation
[2*`EXPONENT+ 2*`MANTISSA + 8] Sa_0
[2*`EXPONENT+ 2*`MANTISSA + 7] Sb_0
[2*`EXPONENT+ 2*`MANTISSA + 6] MaxAB_0
[2*`EXPONENT+ 2*`MANTISSA + 5:`EXPONENT+ 2*`MANTISSA + 6] CExp_0
[`EXPONENT+ 2*`MANTISSA + 5 : 2*`MANTISSA + 6] Shift_0
[2*`MANTISSA + 5:`MANTISSA + 6] Mmax_0
[`MANTISSA + 5 : `MANTISSA + 1] InputExc_0
[`MANTISSA:0] MminS_2
*/
			pipe_3 <= {pipe_2[2*`EXPONENT+ 2*`MANTISSA + 8:`MANTISSA], MminS_2[`MANTISSA:0]} ;	
/* PIPE_4
[2*`EXPONENT+ 2*`MANTISSA + 9] operation
[2*`EXPONENT+ 2*`MANTISSA + 8] Sa_0
[2*`EXPONENT+ 2*`MANTISSA + 7] Sb_0
[2*`EXPONENT+ 2*`MANTISSA + 6] MaxAB_0
[2*`EXPONENT+ 2*`MANTISSA + 5:`EXPONENT+ 2*`MANTISSA + 6] CExp_0
[`EXPONENT+ 2*`MANTISSA + 5 : 2*`MANTISSA + 6] Shift_0
[2*`MANTISSA + 5:`MANTISSA + 6] Mmax_0
[`MANTISSA + 5 : `MANTISSA + 1] InputExc_0
[`MANTISSA:0] MminS_3
*/				
			//pipe_4 <= {pipe_3[2*`EXPONENT+ 2*`MANTISSA + 9:`MANTISSA+1], Mmin_3[`MANTISSA:0]} ;	
/* PIPE_5 :
[`DWIDTH+ `EXPONENT + 11] operation
[`DWIDTH+ `EXPONENT + 10] PSgn_4
[`DWIDTH+ `EXPONENT + 9] Opr_4
[`DWIDTH+ `EXPONENT + 8] Sa_0
[`DWIDTH+ `EXPONENT + 7] Sb_0
[`DWIDTH+ `EXPONENT + 6] MaxAB_0
[`DWIDTH+ `EXPONENT + 5 :`DWIDTH+6] CExp_0
[`DWIDTH+5:`DWIDTH+1] InputExc_0
[`DWIDTH:0] Sum_4
*/					
			pipe_5 <= {pipe_4[2*`EXPONENT+ 2*`MANTISSA + 9], PSgn_4, Opr_4, pipe_4[2*`EXPONENT+ 2*`MANTISSA + 8:`EXPONENT+ 2*`MANTISSA + 6], pipe_4[`MANTISSA+5:`MANTISSA+1], Sum_4[`DWIDTH:0]} ;
/* PIPE_6 :
[`DWIDTH+ `EXPONENT + 16] operation
[`DWIDTH+ `EXPONENT + 15:`DWIDTH+ `EXPONENT + 11] Shift_5
[`DWIDTH+ `EXPONENT + 10] PSgn_4
[`DWIDTH+ `EXPONENT + 9] Opr_4
[`DWIDTH+ `EXPONENT + 8] Sa_0
[`DWIDTH+ `EXPONENT + 7] Sb_0
[`DWIDTH+ `EXPONENT + 6] MaxAB_0
[`DWIDTH+ `EXPONENT + 5 :`DWIDTH+6] CExp_0
[`DWIDTH+5:`DWIDTH+1] InputExc_0
[`DWIDTH:0] Sum_4
*/				
			//pipe_6 <= {pipe_5[`DWIDTH+`EXPONENT+11], Shift_5[4:0], pipe_5[`DWIDTH+`EXPONENT+10:`DWIDTH+1], SumS_5[`DWIDTH:0]} ;	
/* PIPE_7 :
[`DWIDTH+ `EXPONENT + 16] operation
[`DWIDTH+ `EXPONENT + 15:`DWIDTH+ `EXPONENT + 11] Shift_5
[`DWIDTH+ `EXPONENT + 10] PSgn_4
[`DWIDTH+ `EXPONENT + 9] Opr_4
[`DWIDTH+ `EXPONENT + 8] Sa_0
[`DWIDTH+ `EXPONENT + 7] Sb_0
[`DWIDTH+ `EXPONENT + 6] MaxAB_0
[`DWIDTH+ `EXPONENT + 5 :`DWIDTH+6] CExp_0
[`DWIDTH+5:`DWIDTH+1] InputExc_0
[`DWIDTH:0] Sum_4
*/						
			//pipe_7 <= {pipe_6[`DWIDTH+`EXPONENT+16:`DWIDTH+1], SumS_7[`DWIDTH:0]} ;	
/* PIPE_8:
[2*`EXPONENT + `MANTISSA + 15] FG_8 
[2*`EXPONENT + `MANTISSA + 14] operation
[2*`EXPONENT + `MANTISSA + 13] PSgn_4
[2*`EXPONENT + `MANTISSA + 12] Sa_0
[2*`EXPONENT + `MANTISSA + 11] Sb_0
[2*`EXPONENT + `MANTISSA + 10] MaxAB_0
[2*`EXPONENT + `MANTISSA + 9:`EXPONENT + `MANTISSA + 10] CExp_0
[`EXPONENT + `MANTISSA + 9:`EXPONENT + `MANTISSA + 5] InputExc_8
[`EXPONENT + `MANTISSA + 4 :`EXPONENT + 5] NormM_8 
[`EXPONENT + 4 :4] NormE_8
[3] ZeroSum_8
[2] NegE_8
[1] R_8
[0] S_8
*/				
			pipe_8 <= {FG_8, pipe_7[`DWIDTH+`EXPONENT+16], pipe_7[`DWIDTH+`EXPONENT+10], pipe_7[`DWIDTH+`EXPONENT+8:`DWIDTH+1], NormM_8[`MANTISSA-1:0], NormE_8[`EXPONENT:0], ZeroSum_8, NegE_8, R_8, S_8} ;	
/* pipe_9:
[`DWIDTH + 8 :9] P_int
[8] NegE_8
[7] R_8
[6] S_8
[5:1] InputExc_8
[0] EOF
*/				
			//pipe_9 <= {P_int[`DWIDTH-1:0], pipe_8[2], pipe_8[1], pipe_8[0], pipe_8[`EXPONENT+`MANTISSA+9:`EXPONENT+`MANTISSA+5], EOF} ;	
		end
	end		
	
endmodule
module FPAddSub_ExceptionModule(
		Z,
		NegE,
		R,
		S,
		InputExc,
		EOF,
		P,
		Flags
    );
	 
	// Input ports
	input [`DWIDTH-1:0] Z	;					// Final product
	input NegE ;						// Negative exponent?
	input R ;							// Round bit
	input S ;							// Sticky bit
	input [4:0] InputExc ;			// Exceptions in inputs A and B
	input EOF ;
	
	// Output ports
	output [`DWIDTH-1:0] P ;					// Final result
	output [4:0] Flags ;				// Exception flags
	
	// Internal signals
	wire Overflow ;					// Overflow flag
	wire Underflow ;					// Underflow flag
	wire DivideByZero ;				// Divide-by-Zero flag (always 0 in Add/Sub)
	wire Invalid ;						// Invalid inputs or result
	wire Inexact ;						// Result is inexact because of rounding
	
	// Exception flags
	
	// Result is too big to be represented
	assign Overflow = EOF | InputExc[1] | InputExc[0] ;
	
	// Result is too small to be represented
	assign Underflow = NegE & (R | S);
	
	// Infinite result computed exactly from finite operands
	assign DivideByZero = &(Z[`MANTISSA+`EXPONENT-1:`MANTISSA]) & ~|(Z[`MANTISSA+`EXPONENT-1:`MANTISSA]) & ~InputExc[1] & ~InputExc[0];
	
	// Invalid inputs or operation
	assign Invalid = |(InputExc[4:2]) ;
	
	// Inexact answer due to rounding, overflow or underflow
	assign Inexact = (R | S) | Overflow | Underflow;
	
	// Put pieces together to form final result
	assign P = Z ;
	
	// Collect exception flags	
	assign Flags = {Overflow, Underflow, DivideByZero, Invalid, Inexact} ; 	
	
endmodule
module FPAddSub_RoundModule(
		ZeroSum,
		NormE,
		NormM,
		R,
		S,
		G,
		Sa,
		Sb,
		Ctrl,
		MaxAB,
		Z,
		EOF
    );

	// Input ports
	input ZeroSum ;					// Sum is zero
	input [`EXPONENT:0] NormE ;				// Normalized exponent
	input [`MANTISSA-1:0] NormM ;				// Normalized mantissa
	input R ;							// Round bit
	input S ;							// Sticky bit
	input G ;
	input Sa ;							// A's sign bit
	input Sb ;							// B's sign bit
	input Ctrl ;						// Control bit (operation)
	input MaxAB ;
	
	// Output ports
	output [`DWIDTH-1:0] Z ;					// Final result
	output EOF ;
	
	// Internal signals
	wire [`MANTISSA:0] RoundUpM ;			// Rounded up sum with room for overflow
	wire [`MANTISSA-1:0] RoundM ;				// The final rounded sum
	wire [`EXPONENT:0] RoundE ;				// Rounded exponent (note extra bit due to poential overflow	)
	wire RoundUp ;						// Flag indicating that the sum should be rounded up
        wire FSgn;
	wire ExpAdd ;						// May have to add 1 to compensate for overflow 
	wire RoundOF ;						// Rounding overflow
	
	wire [`EXPONENT:0]temp_2;
	assign temp_2 = 0;
	// The cases where we need to round upwards (= adding one) in Round to nearest, tie to even
	assign RoundUp = (G & ((R | S) | NormM[0])) ;
	
	// Note that in the other cases (rounding down), the sum is already 'rounded'
	assign RoundUpM = (NormM + 1) ;								// The sum, rounded up by 1
	assign RoundM = (RoundUp ? RoundUpM[`MANTISSA-1:0] : NormM) ; 	// Compute final mantissa	
	assign RoundOF = RoundUp & RoundUpM[`MANTISSA] ; 				// Check for overflow when rounding up

	// Calculate post-rounding exponent
	assign ExpAdd = (RoundOF ? 1'b1 : 1'b0) ; 				// Add 1 to exponent to compensate for overflow
	assign RoundE = ZeroSum ? temp_2 : (NormE + ExpAdd) ; 							// Final exponent

	// If zero, need to determine sign according to rounding
	assign FSgn = (ZeroSum & (Sa ^ Sb)) | (ZeroSum ? (Sa & Sb & ~Ctrl) : ((~MaxAB & Sa) | ((Ctrl ^ Sb) & (MaxAB | Sa)))) ;

	// Assign final result
	assign Z = {FSgn, RoundE[`EXPONENT-1:0], RoundM[`MANTISSA-1:0]} ;
	
	// Indicate exponent overflow
	assign EOF = RoundE[`EXPONENT];
	
endmodule
module FPAddSub_NormalizeShift2(
		PSSum,
		CExp,
		Shift,
		NormM,
		NormE,
		ZeroSum,
		NegE,
		R,
		S,
		FG
	);
	
	// Input ports
	input [`DWIDTH:0] PSSum ;					// The Pre-Shift-Sum
	input [`EXPONENT-1:0] CExp ;
	input [4:0] Shift ;					// Amount to be shifted

	// Output ports
	output [`MANTISSA-1:0] NormM ;				// Normalized mantissa
	output [`EXPONENT:0] NormE ;					// Adjusted exponent
	output ZeroSum ;						// Zero flag
	output NegE ;							// Flag indicating negative exponent
	output R ;								// Round bit
	output S ;								// Final sticky bit
	output FG ;

	// Internal signals
	wire MSBShift ;						// Flag indicating that a second shift is needed
	wire [`EXPONENT:0] ExpOF ;					// MSB set in sum indicates overflow
	wire [`EXPONENT:0] ExpOK ;					// MSB not set, no adjustment
	
	// Calculate normalized exponent and mantissa, check for all-zero sum
	assign MSBShift = PSSum[`DWIDTH] ;		// Check MSB in unnormalized sum
	assign ZeroSum = ~|PSSum ;			// Check for all zero sum
	assign ExpOK = CExp - Shift ;		// Adjust exponent for new normalized mantissa
	assign NegE = ExpOK[`EXPONENT] ;			// Check for exponent overflow
	assign ExpOF = CExp - Shift + 1'b1 ;		// If MSB set, add one to exponent(x2)
	assign NormE = MSBShift ? ExpOF : ExpOK ;			// Check for exponent overflow
	assign NormM = PSSum[`DWIDTH-1:`EXPONENT+1] ;		// The new, normalized mantissa
	
	// Also need to compute sticky and round bits for the rounding stage
	assign FG = PSSum[`EXPONENT] ; 
	assign R = PSSum[`EXPONENT-1] ;
	assign S = |PSSum[`EXPONENT-2:0] ;
	
endmodule
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
	//Changes in this doesn't matter since even Bfloat16 can't go beyond 7 shift to the mantissa (only 3 bits valid here)  
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
module FPAddSub_ExecutionModule(
		Mmax,
		Mmin,
		Sa,
		Sb,
		MaxAB,
		OpMode,
		Sum,
		PSgn,
		Opr
    );

	// Input ports
	input [`MANTISSA-1:0] Mmax ;					// The larger mantissa
	input [`MANTISSA:0] Mmin ;					// The smaller mantissa
	input Sa ;								// Sign bit of larger number
	input Sb ;								// Sign bit of smaller number
	input MaxAB ;							// Indicates the larger number (0/A, 1/B)
	input OpMode ;							// Operation to be performed (0/Add, 1/Sub)
	
	// Output ports
	output [`DWIDTH:0] Sum ;					// The result of the operation
	output PSgn ;							// The sign for the result
	output Opr ;							// The effective (performed) operation

	wire [`EXPONENT-1:0]temp_1;

	assign Opr = (OpMode^Sa^Sb); 		// Resolve sign to determine operation
	assign temp_1 = 0;
	// Perform effective operation
//SAMIDH_UNSURE 5--> 8

	assign Sum = (OpMode^Sa^Sb) ? ({1'b1, Mmax, temp_1} - {Mmin, temp_1}) : ({1'b1, Mmax, temp_1} + {Mmin, temp_1}) ;
	
	// Assign result sign
	assign PSgn = (MaxAB ? Sb : Sa) ;

endmodule
module FPAddSub_AlignShift2(
		MminP,
		Shift,
		Mmin
	);
	
	// Input ports
	input [`MANTISSA:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [1:0] Shift ;						// Shift amount. Last 2 bits
	
	// Output ports
	output [`MANTISSA:0] Mmin ;						// The smaller mantissa
	
	// Internal Signal
	reg	  [`MANTISSA:0]		Lvl3;
	wire    [2*`MANTISSA+1:0]    Stage2;	
	integer           j;               // Loop variable
	
	assign Stage2 = {11'b0, MminP};

	always @(*) begin    // Rotate {0 | 1 | 2 | 3} bits
	  case (Shift[1:0])
			// Rotate by 0
			2'b00:  Lvl3 <= Stage2[`MANTISSA:0];   
			// Rotate by 1
			2'b01:  begin for (j=0; j<=`MANTISSA; j=j+1)  begin Lvl3[j] <= Stage2[j+1]; end Lvl3[`MANTISSA] <= 0; end 
			// Rotate by 2
			2'b10:  begin for (j=0; j<=`MANTISSA; j=j+1)  begin Lvl3[j] <= Stage2[j+2]; end Lvl3[`MANTISSA:`MANTISSA-1] <= 0; end 
			// Rotate by 3
			2'b11:  begin for (j=0; j<=`MANTISSA; j=j+1)  begin Lvl3[j] <= Stage2[j+3]; end Lvl3[`MANTISSA:`MANTISSA-2] <= 0; end 	  
	  endcase
	end
	
	// Assign output
	assign Mmin = Lvl3;						// Take out smaller mantissa				

endmodule
module FPAddSub_AlignShift1(
		//bf16,
		MminP,
		Shift,
		Mmin
	);
	
	// Input ports
	//input bf16;
	input [`MANTISSA-1:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [`EXPONENT-3:0] Shift ;						// Shift amount. Last 2 bits of shifting are done in next stage. Hence, we have [`EXPONENT - 2] bits
	
	// Output ports
	output [`MANTISSA:0] Mmin ;						// The smaller mantissa
	

	wire bf16;
	assign bf16 = 1'b1; //hardcoding to 1, to avoid ODIN issue. a `ifdef here wasn't working. apparently, nested `ifdefs don't work

	// Internal signals
	reg	  [`MANTISSA:0]		Lvl1;
	reg	  [`MANTISSA:0]		Lvl2;
	wire    [2*`MANTISSA+1:0]    Stage1;	
	integer           i;                // Loop variable

	wire [`MANTISSA:0] temp_0; 

assign temp_0 = 0;

	always @(*) begin
		if (bf16 == 1'b1) begin						
//hardcoding for bfloat16
	//For bfloat16, we can shift the mantissa by a max of 7 bits since mantissa has a width of 7. 
	//Hence if either, bit[3]/bit[4]/bit[5]/bit[6]/bit[7] is 1, we can make it 0. This corresponds to bits [5:1] in our updated shift which doesn't contain last 2 bits.
		//Lvl1 <= (Shift[1]|Shift[2]|Shift[3]|Shift[4]|Shift[5]) ? {temp_0} : {1'b1, MminP};  // MANTISSA + 1 width	
		Lvl1 <= (|Shift[`EXPONENT-3:1]) ? {temp_0} : {1'b1, MminP};  // MANTISSA + 1 width	
		end
		else begin
		//for half precision fp16, 10 bits can be shifted. Hence, only shifts till 10 (01010)can be made. 
		Lvl1 <= Shift[2] ? {temp_0} : {1'b1, MminP};
		end
	end
	
	assign Stage1 = { temp_0, Lvl1}; //2*MANTISSA + 2 width

	always @(*) begin    					// Rotate {0 | 4 } bits
	if(bf16 == 1'b1) begin
	  case (Shift[0])
			// Rotate by 0	
			1'b0:  Lvl2 <= Stage1[`MANTISSA:0];       			
			// Rotate by 4	
			1'b1:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+4]; end Lvl2[`MANTISSA:`MANTISSA-3] <= 0; end
	  endcase
	end
	else begin
	  case (Shift[1:0])					// Rotate {0 | 4 | 8} bits
			// Rotate by 0	
			2'b00:  Lvl2 <= Stage1[`MANTISSA:0];       			
			// Rotate by 4	
			2'b01:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+4]; end Lvl2[`MANTISSA:`MANTISSA-3] <= 0; end
			// Rotate by 8
			2'b10:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+8]; end Lvl2[`MANTISSA:`MANTISSA-7] <= 0; end
			// Rotate by 12	
			2'b11: Lvl2[`MANTISSA: 0] <= 0; 
			//2'b11:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+12]; end Lvl2[`MANTISSA:`MANTISSA-12] <= 0; end
	  endcase
	end
	end

	// Assign output to next shift stage
	assign Mmin = Lvl2;
	
endmodule
module FPAddSub_AlignModule (
		A,
		B,
		ShiftDet,
		CExp,
		MaxAB,
		Shift,
		Mmin,
		Mmax
	);
	
	// Input ports
	input [`DWIDTH-2:0] A ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-2:0] B ;								// Input B, a 32-bit floating point number
	input [2*`EXPONENT-1:0] ShiftDet ;
	
	// Output ports
	output [`EXPONENT-1:0] CExp ;							// Common Exponent
	output MaxAB ;									// Incidates larger of A and B (0/A, 1/B)
	output [`EXPONENT-1:0] Shift ;							// Number of steps to smaller mantissa shift right
	output [`MANTISSA-1:0] Mmin ;							// Smaller mantissa 
	output [`MANTISSA-1:0] Mmax ;							// Larger mantissa
	
	// Internal signals
	//wire BOF ;										// Check for shifting overflow if B is larger
	//wire AOF ;										// Check for shifting overflow if A is larger
	
	assign MaxAB = (A[`DWIDTH-2:0] < B[`DWIDTH-2:0]) ;	
	//assign BOF = ShiftDet[9:5] < 25 ;		// Cannot shift more than 25 bits
	//assign AOF = ShiftDet[4:0] < 25 ;		// Cannot shift more than 25 bits
	
	// Determine final shift value
	//assign Shift = MaxAB ? (BOF ? ShiftDet[9:5] : 5'b11001) : (AOF ? ShiftDet[4:0] : 5'b11001) ;
	
	assign Shift = MaxAB ? ShiftDet[2*`EXPONENT-1:`EXPONENT] : ShiftDet[`EXPONENT-1:0] ;
	
	// Take out smaller mantissa and append shift space
	assign Mmin = MaxAB ? A[`MANTISSA-1:0] : B[`MANTISSA-1:0] ; 
	
	// Take out larger mantissa	
	assign Mmax = MaxAB ? B[`MANTISSA-1:0]: A[`MANTISSA-1:0] ;	
	
	// Common exponent
	assign CExp = (MaxAB ? B[`MANTISSA+`EXPONENT-1:`MANTISSA] : A[`MANTISSA+`EXPONENT-1:`MANTISSA]) ;		
	
endmodule
module FPAddSub_PrealignModule(
		A,
		B,
		operation,
		Sa,
		Sb,
		ShiftDet,
		InputExc,
		Aout,
		Bout,
		Opout
	);
	
	// Input ports
	input [`DWIDTH-1:0] A ;										// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] B ;										// Input B, a 32-bit floating point number
	input operation ;
	
	// Output ports
	output Sa ;												// A's sign
	output Sb ;												// B's sign
	output [2*`EXPONENT-1:0] ShiftDet ;
	output [4:0] InputExc ;								// Input numbers are exceptions
	output [`DWIDTH-2:0] Aout ;
	output [`DWIDTH-2:0] Bout ;
	output Opout ;
	
	// Internal signals									// If signal is high...
	wire ANaN ;												// A is a NaN (Not-a-Number)
	wire BNaN ;												// B is a NaN
	wire AInf ;												// A is infinity
	wire BInf ;												// B is infinity
	wire [`EXPONENT-1:0] DAB ;										// ExpA - ExpB					
	wire [`EXPONENT-1:0] DBA ;										// ExpB - ExpA	
	
	assign ANaN = &(A[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & |(A[`MANTISSA-1:0]) ;		// All one exponent and not all zero mantissa - NaN
	assign BNaN = &(B[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & |(B[`MANTISSA-1:0]);		// All one exponent and not all zero mantissa - NaN
	assign AInf = &(A[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & ~|(A[`MANTISSA-1:0]) ;	// All one exponent and all zero mantissa - Infinity
	assign BInf = &(B[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & ~|(B[`MANTISSA-1:0]) ;	// All one exponent and all zero mantissa - Infinity
	
	// Put all flags into exception vector
	assign InputExc = {(ANaN | BNaN | AInf | BInf), ANaN, BNaN, AInf, BInf} ;
	
	//assign DAB = (A[30:23] - B[30:23]) ;
	//assign DBA = (B[30:23] - A[30:23]) ;
	assign DAB = (A[`DWIDTH-2:`MANTISSA] + ~(B[`DWIDTH-2:`MANTISSA]) + 1) ;
	assign DBA = (B[`DWIDTH-2:`MANTISSA] + ~(A[`DWIDTH-2:`MANTISSA]) + 1) ;
	
	assign Sa = A[`DWIDTH-1] ;									// A's sign bit
	assign Sb = B[`DWIDTH-1] ;									// B's sign	bit
	assign ShiftDet = {DBA[`EXPONENT-1:0], DAB[`EXPONENT-1:0]} ;		// Shift data
	assign Opout = operation ;
	assign Aout = A[`DWIDTH-2:0] ;
	assign Bout = B[`DWIDTH-2:0] ;
	
endmodule
module FPMult(
		clk,
		rst,
		a,
		b,
		result,
		flags
    );
	
	// Input Ports
	input clk ;							// Clock
	input rst ;							// Reset signal
	input [`DWIDTH-1:0] a;					// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b;					// Input B, a 32-bit floating point number
	
	// Output ports
	output [`DWIDTH-1:0] result ;					// Product, result of the operation, 32-bit FP number
	output [4:0] flags ;				// Flags indicating exceptions according to IEEE754
	assign flags = 5'b0;
`ifdef complex_dsp
	multiply_fp_clk u_mult_fp(.clk(clk), .a(a), .b(b), .out(result)); 
`else
FPMult_16 u_FPMult (.clk(clk), .rst(1'b0), .a(a), .b(b), .result(result), .flags());
`endif
	
		
endmodule
module FPMult_16(
		clk,
		rst,
		a,
		b,
		result,
		flags
    );
	
	// Input Ports
	input clk ;							// Clock
	input rst ;							// Reset signal
	input [`DWIDTH-1:0] a;						// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b;						// Input B, a 32-bit floating point number
	
	// Output ports
	output [`DWIDTH-1:0] result ;					// Product, result of the operation, 32-bit FP number
	output [4:0] flags ;						// Flags indicating exceptions according to IEEE754
	
	// Internal signals
	wire [`DWIDTH-1:0] Z_int ;					// Product, result of the operation, 32-bit FP number
	wire [4:0] Flags_int ;						// Flags indicating exceptions according to IEEE754
	
	wire Sa ;							// A's sign
	wire Sb ;							// B's sign
	wire Sp ;							// Product sign
	wire [`EXPONENT-1:0] Ea ;					// A's exponent
	wire [`EXPONENT-1:0] Eb ;					// B's exponent
	wire [2*`MANTISSA+1:0] Mp ;					// Product mantissa
	wire [4:0] InputExc ;						// Exceptions in inputs
	wire [`MANTISSA-1:0] NormM ;					// Normalized mantissa
	wire [`EXPONENT:0] NormE ;					// Normalized exponent
	wire [`MANTISSA:0] RoundM ;					// Normalized mantissa
	wire [`EXPONENT:0] RoundE ;					// Normalized exponent
	wire [`MANTISSA:0] RoundMP ;					// Normalized mantissa
	wire [`EXPONENT:0] RoundEP ;					// Normalized exponent
	wire GRS ;

	//reg [63:0] pipe_0;						// Pipeline register Input->Prep
	reg [2*`DWIDTH-1:0] pipe_0;					// Pipeline register Input->Prep

	//reg [92:0] pipe_1;						// Pipeline register Prep->Execute
	//reg [3*`MANTISSA+2*`EXPONENT+7:0] pipe_1;			// Pipeline register Prep->Execute
	reg [3*`MANTISSA+2*`EXPONENT+18:0] pipe_1;

	//reg [38:0] pipe_2;						// Pipeline register Execute->Normalize
	reg [`MANTISSA+`EXPONENT+7:0] pipe_2;				// Pipeline register Execute->Normalize
	
	//reg [72:0] pipe_3;						// Pipeline register Normalize->Round
	reg [2*`MANTISSA+2*`EXPONENT+10:0] pipe_3;			// Pipeline register Normalize->Round

	//reg [36:0] pipe_4;						// Pipeline register Round->Output
	reg [`DWIDTH+4:0] pipe_4;					// Pipeline register Round->Output
	
	assign result = pipe_4[`DWIDTH+4:5] ;
	assign flags = pipe_4[4:0] ;
	
	// Prepare the operands for alignment and check for exceptions
	FPMult_PrepModule PrepModule(clk, rst, pipe_0[2*`DWIDTH-1:`DWIDTH], pipe_0[`DWIDTH-1:0], Sa, Sb, Ea[`EXPONENT-1:0], Eb[`EXPONENT-1:0], Mp[2*`MANTISSA+1:0], InputExc[4:0]) ;

	// Perform (unsigned) mantissa multiplication
	FPMult_ExecuteModule ExecuteModule(pipe_1[3*`MANTISSA+`EXPONENT*2+7:2*`MANTISSA+2*`EXPONENT+8], pipe_1[2*`MANTISSA+2*`EXPONENT+7:2*`MANTISSA+7], pipe_1[2*`MANTISSA+6:5], pipe_1[2*`MANTISSA+2*`EXPONENT+6:2*`MANTISSA+`EXPONENT+7], pipe_1[2*`MANTISSA+`EXPONENT+6:2*`MANTISSA+7], pipe_1[2*`MANTISSA+2*`EXPONENT+8], pipe_1[2*`MANTISSA+2*`EXPONENT+7], Sp, NormE[`EXPONENT:0], NormM[`MANTISSA-1:0], GRS) ;

	// Round result and if necessary, perform a second (post-rounding) normalization step
	FPMult_NormalizeModule NormalizeModule(pipe_2[`MANTISSA-1:0], pipe_2[`MANTISSA+`EXPONENT:`MANTISSA], RoundE[`EXPONENT:0], RoundEP[`EXPONENT:0], RoundM[`MANTISSA:0], RoundMP[`MANTISSA:0]) ;		

	// Round result and if necessary, perform a second (post-rounding) normalization step
	//FPMult_RoundModule RoundModule(pipe_3[47:24], pipe_3[23:0], pipe_3[65:57], pipe_3[56:48], pipe_3[66], pipe_3[67], pipe_3[72:68], Z_int[31:0], Flags_int[4:0]) ;		
	FPMult_RoundModule RoundModule(pipe_3[2*`MANTISSA+1:`MANTISSA+1], pipe_3[`MANTISSA:0], pipe_3[2*`MANTISSA+2*`EXPONENT+3:2*`MANTISSA+`EXPONENT+3], pipe_3[2*`MANTISSA+`EXPONENT+2:2*`MANTISSA+2], pipe_3[2*`MANTISSA+2*`EXPONENT+4], pipe_3[2*`MANTISSA+2*`EXPONENT+5], pipe_3[2*`MANTISSA+2*`EXPONENT+10:2*`MANTISSA+2*`EXPONENT+6], Z_int[`DWIDTH-1:0], Flags_int[4:0]) ;		

//adding always@ (*) instead of posedge clock to make design combinational
	always @ (posedge clk) begin	
		if(rst) begin
			pipe_0 <= 0;
			pipe_1 <= 0;
			pipe_2 <= 0; 
			pipe_3 <= 0;
			pipe_4 <= 0;
		end 
		else begin		
			/* PIPE 0
				[2*`DWIDTH-1:`DWIDTH] A
				[`DWIDTH-1:0] B
			*/
                       pipe_0 <= {a, b} ;


			/* PIPE 1
				[2*`EXPONENT+3*`MANTISSA + 18: 2*`EXPONENT+2*`MANTISSA + 18] //pipe_0[`DWIDTH+`MANTISSA-1:`DWIDTH] , mantissa of A
				[2*`EXPONENT+2*`MANTISSA + 17 :2*`EXPONENT+2*`MANTISSA + 9] // pipe_0[8:0]
				[2*`EXPONENT+2*`MANTISSA + 8] Sa
				[2*`EXPONENT+2*`MANTISSA + 7] Sb
				[2*`EXPONENT+2*`MANTISSA + 6:`EXPONENT+2*`MANTISSA+7] Ea
				[`EXPONENT +2*`MANTISSA+6:2*`MANTISSA+7] Eb
				[2*`MANTISSA+1+5:5] Mp
				[4:0] InputExc
			*/
			//pipe_1 <= {pipe_0[`DWIDTH+`MANTISSA-1:`DWIDTH], pipe_0[`MANTISSA_MUL_SPLIT_LSB-1:0], Sa, Sb, Ea[`EXPONENT-1:0], Eb[`EXPONENT-1:0], Mp[2*`MANTISSA-1:0], InputExc[4:0]} ;
			pipe_1 <= {pipe_0[`DWIDTH+`MANTISSA-1:`DWIDTH], pipe_0[8:0], Sa, Sb, Ea[`EXPONENT-1:0], Eb[`EXPONENT-1:0], Mp[2*`MANTISSA+1:0], InputExc[4:0]} ;
			
			/* PIPE 2
				[`EXPONENT + `MANTISSA + 7:`EXPONENT + `MANTISSA + 3] InputExc
				[`EXPONENT + `MANTISSA + 2] GRS
				[`EXPONENT + `MANTISSA + 1] Sp
				[`EXPONENT + `MANTISSA:`MANTISSA] NormE
				[`MANTISSA-1:0] NormM
			*/
			pipe_2 <= {pipe_1[4:0], GRS, Sp, NormE[`EXPONENT:0], NormM[`MANTISSA-1:0]} ;
			/* PIPE 3
				[2*`EXPONENT+2*`MANTISSA+10:2*`EXPONENT+2*`MANTISSA+6] InputExc
				[2*`EXPONENT+2*`MANTISSA+5] GRS
				[2*`EXPONENT+2*`MANTISSA+4] Sp	
				[2*`EXPONENT+2*`MANTISSA+3:`EXPONENT+2*`MANTISSA+3] RoundE
				[`EXPONENT+2*`MANTISSA+2:2*`MANTISSA+2] RoundEP
				[2*`MANTISSA+1:`MANTISSA+1] RoundM
				[`MANTISSA:0] RoundMP
			*/
			pipe_3 <= {pipe_2[`EXPONENT+`MANTISSA+7:`EXPONENT+`MANTISSA+1], RoundE[`EXPONENT:0], RoundEP[`EXPONENT:0], RoundM[`MANTISSA:0], RoundMP[`MANTISSA:0]} ;
			/* PIPE 4
				[`DWIDTH+4:5] Z
				[4:0] Flags
			*/				
			pipe_4 <= {Z_int[`DWIDTH-1:0], Flags_int[4:0]} ;
		end
	end
		
endmodule
module FPMult_RoundModule(
		RoundM,
		RoundMP,
		RoundE,
		RoundEP,
		Sp,
		GRS,
		InputExc,
		Z,
		Flags
    );

	// Input Ports
	input [`MANTISSA:0] RoundM ;									// Normalized mantissa
	input [`MANTISSA:0] RoundMP ;									// Normalized exponent
	input [`EXPONENT:0] RoundE ;									// Normalized mantissa + 1
	input [`EXPONENT:0] RoundEP ;									// Normalized exponent + 1
	input Sp ;												// Product sign
	input GRS ;
	input [4:0] InputExc ;
	
	// Output Ports
	output [`DWIDTH-1:0] Z ;										// Final product
	output [4:0] Flags ;
	
	// Internal Signals
	wire [`EXPONENT:0] FinalE ;									// Rounded exponent
	wire [`MANTISSA:0] FinalM;
	wire [`MANTISSA:0] PreShiftM;
	
	assign PreShiftM = GRS ? RoundMP : RoundM ;	// Round up if R and (G or S)
	
	// Post rounding normalization (potential one bit shift> use shifted mantissa if there is overflow)
	assign FinalM = (PreShiftM[`MANTISSA] ? {1'b0, PreShiftM[`MANTISSA:1]} : PreShiftM[`MANTISSA:0]) ;
	
	assign FinalE = (PreShiftM[`MANTISSA] ? RoundEP : RoundE) ; // Increment exponent if a shift was done
	
	assign Z = {Sp, FinalE[`EXPONENT-1:0], FinalM[`MANTISSA-1:0]} ;   // Putting the pieces together
	assign Flags = InputExc[4:0];

endmodule
module FPMult_NormalizeModule(
		NormM,
		NormE,
		RoundE,
		RoundEP,
		RoundM,
		RoundMP
    );

	// Input Ports
	input [`MANTISSA-1:0] NormM ;									// Normalized mantissa
	input [`EXPONENT:0] NormE ;									// Normalized exponent

	// Output Ports
	output [`EXPONENT:0] RoundE ;
	output [`EXPONENT:0] RoundEP ;
	output [`MANTISSA:0] RoundM ;
	output [`MANTISSA:0] RoundMP ; 
	
// EXPONENT = 5 
// EXPONENT -1 = 4
// NEED to subtract 2^4 -1 = 15

wire [`EXPONENT-1 : 0] bias;

assign bias =  ((1<< (`EXPONENT -1)) -1);

	assign RoundE = NormE - bias ;
	assign RoundEP = NormE - bias -1 ;
	assign RoundM = NormM ;
	assign RoundMP = NormM ;

endmodule
module FPMult_ExecuteModule(
		a,
		b,
		MpC,
		Ea,
		Eb,
		Sa,
		Sb,
		Sp,
		NormE,
		NormM,
		GRS
    );

	// Input ports
	input [`MANTISSA-1:0] a ;
	input [2*`EXPONENT:0] b ;
	input [2*`MANTISSA+1:0] MpC ;
	input [`EXPONENT-1:0] Ea ;						// A's exponent
	input [`EXPONENT-1:0] Eb ;						// B's exponent
	input Sa ;								// A's sign
	input Sb ;								// B's sign
	
	// Output ports
	output Sp ;								// Product sign
	output [`EXPONENT:0] NormE ;													// Normalized exponent
	output [`MANTISSA-1:0] NormM ;												// Normalized mantissa
	output GRS ;
	
	wire [2*`MANTISSA+1:0] Mp ;
	
	assign Sp = (Sa ^ Sb) ;												// Equal signs give a positive product
	
   // wire [`ACTUAL_MANTISSA-1:0] inp_a;
   // wire [`ACTUAL_MANTISSA-1:0] inp_b;
   // assign inp_a = {1'b1, a};
   // assign inp_b = {{(`MANTISSA-`MANTISSA_MUL_SPLIT_LSB){1'b0}}, 1'b0, b};
   // DW02_mult #(`ACTUAL_MANTISSA,`ACTUAL_MANTISSA) u_mult(.A(inp_a), .B(inp_b), .TC(1'b0), .PRODUCT(Mp_temp));
   // DW01_add #(2*`ACTUAL_MANTISSA) u_add(.A(Mp_temp), .B(MpC<<`MANTISSA_MUL_SPLIT_LSB), .CI(1'b0), .SUM(Mp), .CO());

	//assign Mp = (MpC<<(2*`EXPONENT+1)) + ({4'b0001, a[`MANTISSA-1:0]}*{1'b0, b[2*`EXPONENT:0]}) ;
	assign Mp = MpC;


	assign NormM = (Mp[2*`MANTISSA+1] ? Mp[2*`MANTISSA:`MANTISSA+1] : Mp[2*`MANTISSA-1:`MANTISSA]); 	// Check for overflow
	assign NormE = (Ea + Eb + Mp[2*`MANTISSA+1]);								// If so, increment exponent
	
	assign GRS = ((Mp[`MANTISSA]&(Mp[`MANTISSA+1]))|(|Mp[`MANTISSA-1:0])) ;
	
endmodule
module FPMult_PrepModule (
		clk,
		rst,
		a,
		b,
		Sa,
		Sb,
		Ea,
		Eb,
		Mp,
		InputExc
	);
	
	// Input ports
	input clk ;
	input rst ;
	input [`DWIDTH-1:0] a ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b ;								// Input B, a 32-bit floating point number
	
	// Output ports
	output Sa ;										// A's sign
	output Sb ;										// B's sign
	output [`EXPONENT-1:0] Ea ;								// A's exponent
	output [`EXPONENT-1:0] Eb ;								// B's exponent
	output [2*`MANTISSA+1:0] Mp ;							// Mantissa product
	output [4:0] InputExc ;						// Input numbers are exceptions
	
	// Internal signals							// If signal is high...
	wire ANaN ;										// A is a signalling NaN
	wire BNaN ;										// B is a signalling NaN
	wire AInf ;										// A is infinity
	wire BInf ;										// B is infinity
    wire [`MANTISSA-1:0] Ma;
    wire [`MANTISSA-1:0] Mb;
	
	assign ANaN = &(a[`DWIDTH-2:`MANTISSA]) &  |(a[`DWIDTH-2:`MANTISSA]) ;			// All one exponent and not all zero mantissa - NaN
	assign BNaN = &(b[`DWIDTH-2:`MANTISSA]) &  |(b[`MANTISSA-1:0]);			// All one exponent and not all zero mantissa - NaN
	assign AInf = &(a[`DWIDTH-2:`MANTISSA]) & ~|(a[`DWIDTH-2:`MANTISSA]) ;		// All one exponent and all zero mantissa - Infinity
	assign BInf = &(b[`DWIDTH-2:`MANTISSA]) & ~|(b[`DWIDTH-2:`MANTISSA]) ;		// All one exponent and all zero mantissa - Infinity
	
	// Check for any exceptions and put all flags into exception vector
	assign InputExc = {(ANaN | BNaN | AInf | BInf), ANaN, BNaN, AInf, BInf} ;
	//assign InputExc = {(ANaN | ANaN | BNaN |BNaN), ANaN, ANaN, BNaN,BNaN} ;
	
	// Take input numbers apart
	assign Sa = a[`DWIDTH-1] ;							// A's sign
	assign Sb = b[`DWIDTH-1] ;							// B's sign
	assign Ea = a[`DWIDTH-2:`MANTISSA];						// Store A's exponent in Ea, unless A is an exception
	assign Eb = b[`DWIDTH-2:`MANTISSA];						// Store B's exponent in Eb, unless B is an exception	
//    assign Ma = a[`MANTISSA_MSB:`MANTISSA_LSB];
  //  assign Mb = b[`MANTISSA_MSB:`MANTISSA_LSB];
	


	//assign Mp = ({4'b0001, a[`MANTISSA-1:0]}*{4'b0001, b[`MANTISSA-1:9]}) ;
	assign Mp = ({1'b1,a[`MANTISSA-1:0]}*{1'b1, b[`MANTISSA-1:0]}) ;

	
    //We multiply part of the mantissa here
    //Full mantissa of A
    //Bits MANTISSA_MUL_SPLIT_MSB:MANTISSA_MUL_SPLIT_LSB of B
   // wire [`ACTUAL_MANTISSA-1:0] inp_A;
   // wire [`ACTUAL_MANTISSA-1:0] inp_B;
   // assign inp_A = {1'b1, Ma};
   // assign inp_B = {{(`MANTISSA-(`MANTISSA_MUL_SPLIT_MSB-`MANTISSA_MUL_SPLIT_LSB+1)){1'b0}}, 1'b1, Mb[`MANTISSA_MUL_SPLIT_MSB:`MANTISSA_MUL_SPLIT_LSB]};
   // DW02_mult #(`ACTUAL_MANTISSA,`ACTUAL_MANTISSA) u_mult(.A(inp_A), .B(inp_B), .TC(1'b0), .PRODUCT(Mp));
endmodule
module LUT(addr, exp);
    input [5:0] addr;
    output reg [31:0] exp;

    always @(addr) begin
        case (addr)
			6'b0 		: exp = 32'b00111011110000010011110000000000;
			6'b1 		: exp = 32'b00111010110110000011101111101010;
			6'b10 		: exp = 32'b00111010000010100011101110111110;
			6'b11 		: exp = 32'b00111001010101000011101101111111;
			6'b100 		: exp = 32'b00111000101101000011101100110100;
			6'b101 		: exp = 32'b00111000001001110011101011100000;
			6'b110 		: exp = 32'b00110111010101000011101010000111;
			6'b111 		: exp = 32'b00110110011101110011101000101010;
			6'b1000 		: exp = 32'b00110101101101010011100111001100;
			6'b1001 		: exp = 32'b00110101000010010011100101101110;
			6'b1010 		: exp = 32'b00110100011100100011100100010010;
			6'b1011 		: exp = 32'b00110011110110000011100010111000;
			6'b1100 		: exp = 32'b00110010111011000011100001100001;
			6'b1101 		: exp = 32'b00110010000111000011100000001111;
			6'b1110 		: exp = 32'b00110001011001000011011101111111;
			6'b1111 		: exp = 32'b00110000110000100011011011101010;
			6'b10000 		: exp = 32'b00110000001100110011011001011101;
			6'b10001 		: exp = 32'b00101111011010010011010111011001;
			6'b10010 		: exp = 32'b00101110100010100011010101011101;
			6'b10011 		: exp = 32'b00101101110001010011010011101010;
			6'b10100 		: exp = 32'b00101101000110000011010001111111;
			6'b10101 		: exp = 32'b00101100011111110011010000011100;
			6'b10110 		: exp = 32'b00101011111011110011001110000000;
			6'b10111 		: exp = 32'b00101011000000000011001011010110;
			6'b11000 		: exp = 32'b00101010001011010011001000111010;
			6'b11001 		: exp = 32'b00101001011101000011000110101010;
			6'b11010 		: exp = 32'b00101000110100000011000100100110;
			6'b11011 		: exp = 32'b00101000001111110011000010101101;
			6'b11100 		: exp = 32'b00100111011111100011000000111111;
			6'b11101 		: exp = 32'b00100110100111010010111110110011;
			6'b11110 		: exp = 32'b00100101110101100010111011111010;
			6'b11111 		: exp = 32'b00100101001001110010111001010001;
			6'b100000 		: exp = 32'b00100100100011000010110110111000;
			6'b100001 		: exp = 32'b00100100000000110010110100101100;
			6'b100010 		: exp = 32'b00100011000101000010110010101101;
			6'b100011 		: exp = 32'b00100010001111110010110000111001;
			6'b100100 		: exp = 32'b00100001100001000010101110100000;
			6'b100101 		: exp = 32'b00100000110111100010101011100010;
			6'b100110 		: exp = 32'b00100000010010110010101000110101;
			6'b100111 		: exp = 32'b00011111100101000010100110011001;
			6'b101000 		: exp = 32'b00011110101100000010100100001011;
			6'b101001 		: exp = 32'b00011101111001110010100010001011;
			6'b101010 		: exp = 32'b00011101001101010010100000010111;
			6'b101011 		: exp = 32'b00011100100110010010011101011101;
			6'b101100 		: exp = 32'b00011100000011110010011010100000;
			6'b101101 		: exp = 32'b00011011001010010010010111110101;
			6'b101110 		: exp = 32'b00011010010100100010010101011011;
			6'b101111 		: exp = 32'b00011001100101000010010011010000;
			6'b110000 		: exp = 32'b00011000111011000010010001010011;
			6'b110001 		: exp = 32'b00011000010110000010001111000101;
			6'b110010 		: exp = 32'b00010111101010100010001011111010;
			6'b110011 		: exp = 32'b00010110110001000010001001000011;
			6'b110100 		: exp = 32'b00010101111110000010000110011111;
			6'b110101 		: exp = 32'b00010101010001010010000100001011;
			6'b110110 		: exp = 32'b00010100101001100010000010000110;
			6'b110111 		: exp = 32'b00010100000110100010000000001110;
			6'b111000 		: exp = 32'b00010011001111100001111101000101;
			6'b111001 		: exp = 32'b00010010011001000001111010000100;
			6'b111010 		: exp = 32'b00010001101001000001110111010111;
			6'b111011 		: exp = 32'b00010000111110100001110100111011;
			6'b111100 		: exp = 32'b00010000011001000001110010101111;
			6'b111101 		: exp = 32'b00001111110000010001110000110010;
			6'b111110 		: exp = 32'b00001110110101110001101110000010;
			6'b111111 		: exp = 32'b00001110000010100001101010111001;
        endcase
    end
endmodule
module fptofixed_para (
	fp,
	fx
	);
	
	parameter int_width = 3; // fixed point integer length
	parameter frac_width = 3; // fixed point fraction length

	input [15:0] fp; // Half Precision fp
	output [int_width + frac_width - 1:0] fx;  
	
	wire [15:0] Mant; // mantissa of fp
	wire [4:0] Ea; // non biased exponent
	wire [4:0] Exp; // biased exponent
	reg [15:0] sftfx; // output of shifter block
	reg [15:0] temp;
	
	assign Mant = {6'b000001, fp[9:0]};
	assign Exp = fp[14:10];
	assign Ea = Exp - 15;

	assign fx = temp[9+int_width:10-frac_width];
	

always @(sftfx)
begin
// only negetive numbers as inputs after sorting and subtraction from max
	if (Ea > int_width - 1)
		begin
			temp <= 16'hFFFF; // if there is an overflow
			
		end
	else if ( fp[14:0] == 15'b0)
		begin 
			temp <= 16'b0;
			
		end	
	else // underflow automatically becomes zero
		begin
			temp <= sftfx;
		end
end	

//DW01_ash  #(`DATAWIDTH, 5) ash( .A(Mant[15:0]), .DATA_TC(1'b0), .SH(Ea[4:0]), .SH_TC(1'b1), .B(sftfx));
reg shift_direction;
reg [3:0] shift_magnitude;
always @(*) begin
  shift_direction = Ea[4];  //if this bit is 1, that means Ea was a negative number, which means right shift. if this bit is 0, that means left shift.
  shift_magnitude = (Ea[4] ? ((~Ea[3:0]) + 1) : Ea[3:0]);  //take 2's complement to find the magnitude if negative
  sftfx = (shift_direction ? (Mant[15:0] >> shift_magnitude) : (Mant[15:0] << shift_magnitude)); //perform the actual shift
  //Mant[15:0] is unsigned, so no need to handle sign bit explicitly. zero padding is good on both direction shifts for unsigned numbers.
end

endmodule



