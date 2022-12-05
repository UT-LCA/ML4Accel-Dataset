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

module logunit (fpin, fpout, status, clk, reset, mode5_stage3_run, mode5_stage2_run, mode5_stage1_run);

	input [15:0] fpin;
	output [15:0] fpout;
	output [7:0] status;
	input clk,reset;

	input mode5_stage3_run;
    input mode5_stage2_run;
    input mode5_stage1_run;	
   // input mode5_stage0_run;
  
	wire [15: 0] fxout1;
	wire [15: 0] fxout2;
    wire [15:0] fpin_f;
    wire [15:0] fpout_f;
	reg [15:0] fpin_f_reg;
    reg [15:0] fpout_f_reg;
	reg [15: 0] fxout1_reg;
	reg [15: 0] fxout2_reg;
	//reg [15: 0] pipe1;
	//reg [15: 0] pipe2;

  int_to_float_fp16 int_float (.input_a(fpin),.output_z(fpin_f));
  FPLUT1 lut1 (.addr(fpin_f_reg[14:10]),.log(fxout1)); 
  FP8LUT2 lut2 (.addr(fpin_f_reg[9:2]),.log(fxout2)); 
`ifdef complex_dsp
adder_fp_clk u_add(.clk(clk), .a(fxout1_reg), .b(fxout2_reg), .out(fpout_f));
`else
FPAddSub u_FPAddSub (.clk(clk), .rst(1'b0), .a(fxout1_reg), .b(fxout2_reg), .operation(1'b0), .result(fpout_f), .flags());
`endif
  
  float_to_int_fp16 float_int (.input_a(fpout_f_reg),.output_z(fpout));

    always @(posedge clk) begin
	/*if (reset) begin
		fpin_f_reg <= 16'b0;
	end */
	//if (~reset && mode5_stage2_run) begin
	if (mode5_stage3_run) begin
		fpin_f_reg <= fpin_f;
	end
    end

    always @(posedge clk) begin
	/*if (reset) begin
		fpin_f_reg <= 16'b0;
	end */
	//if (~reset && mode5_stage2_run) begin
	if (mode5_stage2_run) begin
		fxout2_reg <= fxout2;
		fxout1_reg <= fxout1;		
	end
    end
  
    always @(posedge clk) begin
	/*if (reset) begin
		fpout_f_reg <= 16'b0;
	end */
	//if (~reset && mode5_stage1_run) begin
	if (mode5_stage1_run) begin
		fpout_f_reg <= fpout_f;
	end
    end
endmodule
module float_to_int_fp16(
        input_a,
        output_z);


  input     [15:0] input_a;
  output    [15:0] output_z;

  
  wire [27:0] z;
  wire [5:0] a_e, sub_a_e;
  wire a_s;
  wire [15:0] a_m;
  wire [27:0] a_m_shift;  
  
  align_t dut_align (input_a,a_m,a_e,a_s);
  sub_t dut_sub (a_e,sub_a_e);
  am_shift_t dut_am_shift (a_e,sub_a_e,a_m,a_m_shift);
  two_comp_t dut_two_comp (a_m_shift,a_s,z);
  final_out_t dut_final_out (z, a_e, output_z);
  
endmodule
module final_out_t (
  input [27:0] z,
  input [5:0] a_e,
  output [15:0] output_z);
  
  reg [27:0] output_z_temp;

always@(a_e or z) begin
  if (a_e[5] == 1'b1 && a_e[4:0] == 5'd15) begin
		output_z_temp = 27'b0;
	end
  else if (a_e[5] == 0 && a_e[4:0] > 5'd15) begin
		output_z_temp = 27'hFFFF;
	end
	else begin
		output_z_temp = z << 12;
	end
  end
  assign output_z = output_z_temp[27:12];
endmodule
module two_comp_t (
  input [27:0] a_m_shift,
  input a_s,
  output [27:0] z);

assign z = a_s ? -a_m_shift : a_m_shift; // 2's complement

endmodule
module am_shift_t (
  input [5:0] a_e,
  input [5:0] sub_a_e,
  input [15:0] a_m,
  output reg [27:0] a_m_shift);

always@(a_e or sub_a_e or a_m) begin
  if (a_e <= 15 && a_e >= 0 ) begin
    a_m_shift = {a_m,12'b0} >> sub_a_e;
	end
	else begin
		a_m_shift = 24'h0;
	end
  end
  
endmodule
module sub_t (
  input [5:0] a_e,
  output [5:0] sub_a_e);

assign sub_a_e = 15 - a_e;

endmodule
module align_t (
  input [15:0] input_a,
  output [15:0] a_m,
  output [5:0] a_e,
  output a_s);

  wire [15:0] a;

  assign a = input_a;
  assign a_m[15:5] = {1'b1, a[9 : 0]};
  assign a_m[4:0] = 8'b0;
  assign a_e = a[14 : 10] - 15;
  assign a_s = a[15];

endmodule
module FPAddSub(
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
module FP8LUT2(addr, log);
    input [7:0] addr;
    output reg [15:0] log;

    always @(addr) begin
        case (addr)
			8'b0 		: log = 16'b0000000000000000;
			8'b1 		: log = 16'b0001101111111100;
			8'b10 		: log = 16'b0001111111111000;
			8'b11 		: log = 16'b0010000111110111;
			8'b100 		: log = 16'b0010001111110000;
			8'b101 		: log = 16'b0010010011110100;
			8'b110 		: log = 16'b0010010111101110;
			8'b111 		: log = 16'b0010011011101000;
			8'b1000 		: log = 16'b0010011111100001;
			8'b1001 		: log = 16'b0010100001101100;
			8'b1010 		: log = 16'b0010100011101000;
			8'b1011 		: log = 16'b0010100101100011;
			8'b1100 		: log = 16'b0010100111011101;
			8'b1101 		: log = 16'b0010101001010111;
			8'b1110 		: log = 16'b0010101011010001;
			8'b1111 		: log = 16'b0010101101001010;
			8'b10000 		: log = 16'b0010101111000011;
			8'b10001 		: log = 16'b0010110000011101;
			8'b10010 		: log = 16'b0010110001011001;
			8'b10011 		: log = 16'b0010110010010101;
			8'b10100 		: log = 16'b0010110011010000;
			8'b10101 		: log = 16'b0010110100001100;
			8'b10110 		: log = 16'b0010110101000111;
			8'b10111 		: log = 16'b0010110110000010;
			8'b11000 		: log = 16'b0010110110111100;
			8'b11001 		: log = 16'b0010110111110111;
			8'b11010 		: log = 16'b0010111000110001;
			8'b11011 		: log = 16'b0010111001101011;
			8'b11100 		: log = 16'b0010111010100101;
			8'b11101 		: log = 16'b0010111011011110;
			8'b11110 		: log = 16'b0010111100011000;
			8'b11111 		: log = 16'b0010111101010001;
			8'b100000 		: log = 16'b0010111110001010;
			8'b100001 		: log = 16'b0010111111000011;
			8'b100010 		: log = 16'b0010111111111011;
			8'b100011 		: log = 16'b0011000000011010;
			8'b100100 		: log = 16'b0011000000110110;
			8'b100101 		: log = 16'b0011000001010010;
			8'b100110 		: log = 16'b0011000001101110;
			8'b100111 		: log = 16'b0011000010001010;
			8'b101000 		: log = 16'b0011000010100101;
			8'b101001 		: log = 16'b0011000011000001;
			8'b101010 		: log = 16'b0011000011011100;
			8'b101011 		: log = 16'b0011000011111000;
			8'b101100 		: log = 16'b0011000100010011;
			8'b101101 		: log = 16'b0011000100101111;
			8'b101110 		: log = 16'b0011000101001010;
			8'b101111 		: log = 16'b0011000101100101;
			8'b110000 		: log = 16'b0011000110000000;
			8'b110001 		: log = 16'b0011000110011011;
			8'b110010 		: log = 16'b0011000110110110;
			8'b110011 		: log = 16'b0011000111010000;
			8'b110100 		: log = 16'b0011000111101011;
			8'b110101 		: log = 16'b0011001000000101;
			8'b110110 		: log = 16'b0011001000100000;
			8'b110111 		: log = 16'b0011001000111010;
			8'b111000 		: log = 16'b0011001001010101;
			8'b111001 		: log = 16'b0011001001101111;
			8'b111010 		: log = 16'b0011001010001001;
			8'b111011 		: log = 16'b0011001010100011;
			8'b111100 		: log = 16'b0011001010111101;
			8'b111101 		: log = 16'b0011001011010111;
			8'b111110 		: log = 16'b0011001011110001;
			8'b111111 		: log = 16'b0011001100001010;
			8'b1000000 		: log = 16'b0011001100100100;
			8'b1000001 		: log = 16'b0011001100111110;
			8'b1000010 		: log = 16'b0011001101010111;
			8'b1000011 		: log = 16'b0011001101110000;
			8'b1000100 		: log = 16'b0011001110001010;
			8'b1000101 		: log = 16'b0011001110100011;
			8'b1000110 		: log = 16'b0011001110111100;
			8'b1000111 		: log = 16'b0011001111010101;
			8'b1001000 		: log = 16'b0011001111101110;
			8'b1001001 		: log = 16'b0011010000000100;
			8'b1001010 		: log = 16'b0011010000010000;
			8'b1001011 		: log = 16'b0011010000011100;
			8'b1001100 		: log = 16'b0011010000101001;
			8'b1001101 		: log = 16'b0011010000110101;
			8'b1001110 		: log = 16'b0011010001000001;
			8'b1001111 		: log = 16'b0011010001001110;
			8'b1010000 		: log = 16'b0011010001011010;
			8'b1010001 		: log = 16'b0011010001100110;
			8'b1010010 		: log = 16'b0011010001110010;
			8'b1010011 		: log = 16'b0011010001111110;
			8'b1010100 		: log = 16'b0011010010001010;
			8'b1010101 		: log = 16'b0011010010010110;
			8'b1010110 		: log = 16'b0011010010100010;
			8'b1010111 		: log = 16'b0011010010101110;
			8'b1011000 		: log = 16'b0011010010111010;
			8'b1011001 		: log = 16'b0011010011000110;
			8'b1011010 		: log = 16'b0011010011010010;
			8'b1011011 		: log = 16'b0011010011011110;
			8'b1011100 		: log = 16'b0011010011101010;
			8'b1011101 		: log = 16'b0011010011110101;
			8'b1011110 		: log = 16'b0011010100000001;
			8'b1011111 		: log = 16'b0011010100001101;
			8'b1100000 		: log = 16'b0011010100011000;
			8'b1100001 		: log = 16'b0011010100100100;
			8'b1100010 		: log = 16'b0011010100110000;
			8'b1100011 		: log = 16'b0011010100111011;
			8'b1100100 		: log = 16'b0011010101000111;
			8'b1100101 		: log = 16'b0011010101010010;
			8'b1100110 		: log = 16'b0011010101011110;
			8'b1100111 		: log = 16'b0011010101101001;
			8'b1101000 		: log = 16'b0011010101110100;
			8'b1101001 		: log = 16'b0011010110000000;
			8'b1101010 		: log = 16'b0011010110001011;
			8'b1101011 		: log = 16'b0011010110010110;
			8'b1101100 		: log = 16'b0011010110100010;
			8'b1101101 		: log = 16'b0011010110101101;
			8'b1101110 		: log = 16'b0011010110111000;
			8'b1101111 		: log = 16'b0011010111000011;
			8'b1110000 		: log = 16'b0011010111001110;
			8'b1110001 		: log = 16'b0011010111011010;
			8'b1110010 		: log = 16'b0011010111100101;
			8'b1110011 		: log = 16'b0011010111110000;
			8'b1110100 		: log = 16'b0011010111111011;
			8'b1110101 		: log = 16'b0011011000000110;
			8'b1110110 		: log = 16'b0011011000010001;
			8'b1110111 		: log = 16'b0011011000011100;
			8'b1111000 		: log = 16'b0011011000100111;
			8'b1111001 		: log = 16'b0011011000110001;
			8'b1111010 		: log = 16'b0011011000111100;
			8'b1111011 		: log = 16'b0011011001000111;
			8'b1111100 		: log = 16'b0011011001010010;
			8'b1111101 		: log = 16'b0011011001011101;
			8'b1111110 		: log = 16'b0011011001100111;
			8'b1111111 		: log = 16'b0011011001110010;
			8'b10000000 		: log = 16'b0011011001111101;
			8'b10000001 		: log = 16'b0011011010000111;
			8'b10000010 		: log = 16'b0011011010010010;
			8'b10000011 		: log = 16'b0011011010011101;
			8'b10000100 		: log = 16'b0011011010100111;
			8'b10000101 		: log = 16'b0011011010110010;
			8'b10000110 		: log = 16'b0011011010111100;
			8'b10000111 		: log = 16'b0011011011000111;
			8'b10001000 		: log = 16'b0011011011010001;
			8'b10001001 		: log = 16'b0011011011011100;
			8'b10001010 		: log = 16'b0011011011100110;
			8'b10001011 		: log = 16'b0011011011110000;
			8'b10001100 		: log = 16'b0011011011111011;
			8'b10001101 		: log = 16'b0011011100000101;
			8'b10001110 		: log = 16'b0011011100001111;
			8'b10001111 		: log = 16'b0011011100011010;
			8'b10010000 		: log = 16'b0011011100100100;
			8'b10010001 		: log = 16'b0011011100101110;
			8'b10010010 		: log = 16'b0011011100111000;
			8'b10010011 		: log = 16'b0011011101000011;
			8'b10010100 		: log = 16'b0011011101001101;
			8'b10010101 		: log = 16'b0011011101010111;
			8'b10010110 		: log = 16'b0011011101100001;
			8'b10010111 		: log = 16'b0011011101101011;
			8'b10011000 		: log = 16'b0011011101110101;
			8'b10011001 		: log = 16'b0011011101111111;
			8'b10011010 		: log = 16'b0011011110001001;
			8'b10011011 		: log = 16'b0011011110010011;
			8'b10011100 		: log = 16'b0011011110011101;
			8'b10011101 		: log = 16'b0011011110100111;
			8'b10011110 		: log = 16'b0011011110110001;
			8'b10011111 		: log = 16'b0011011110111011;
			8'b10100000 		: log = 16'b0011011111000101;
			8'b10100001 		: log = 16'b0011011111001110;
			8'b10100010 		: log = 16'b0011011111011000;
			8'b10100011 		: log = 16'b0011011111100010;
			8'b10100100 		: log = 16'b0011011111101100;
			8'b10100101 		: log = 16'b0011011111110110;
			8'b10100110 		: log = 16'b0011011111111111;
			8'b10100111 		: log = 16'b0011100000000100;
			8'b10101000 		: log = 16'b0011100000001001;
			8'b10101001 		: log = 16'b0011100000001110;
			8'b10101010 		: log = 16'b0011100000010011;
			8'b10101011 		: log = 16'b0011100000011000;
			8'b10101100 		: log = 16'b0011100000011101;
			8'b10101101 		: log = 16'b0011100000100001;
			8'b10101110 		: log = 16'b0011100000100110;
			8'b10101111 		: log = 16'b0011100000101011;
			8'b10110000 		: log = 16'b0011100000110000;
			8'b10110001 		: log = 16'b0011100000110100;
			8'b10110010 		: log = 16'b0011100000111001;
			8'b10110011 		: log = 16'b0011100000111110;
			8'b10110100 		: log = 16'b0011100001000010;
			8'b10110101 		: log = 16'b0011100001000111;
			8'b10110110 		: log = 16'b0011100001001100;
			8'b10110111 		: log = 16'b0011100001010001;
			8'b10111000 		: log = 16'b0011100001010101;
			8'b10111001 		: log = 16'b0011100001011010;
			8'b10111010 		: log = 16'b0011100001011110;
			8'b10111011 		: log = 16'b0011100001100011;
			8'b10111100 		: log = 16'b0011100001101000;
			8'b10111101 		: log = 16'b0011100001101100;
			8'b10111110 		: log = 16'b0011100001110001;
			8'b10111111 		: log = 16'b0011100001110110;
			8'b11000000 		: log = 16'b0011100001111010;
			8'b11000001 		: log = 16'b0011100001111111;
			8'b11000010 		: log = 16'b0011100010000011;
			8'b11000011 		: log = 16'b0011100010001000;
			8'b11000100 		: log = 16'b0011100010001100;
			8'b11000101 		: log = 16'b0011100010010001;
			8'b11000110 		: log = 16'b0011100010010101;
			8'b11000111 		: log = 16'b0011100010011010;
			8'b11001000 		: log = 16'b0011100010011110;
			8'b11001001 		: log = 16'b0011100010100011;
			8'b11001010 		: log = 16'b0011100010100111;
			8'b11001011 		: log = 16'b0011100010101100;
			8'b11001100 		: log = 16'b0011100010110000;
			8'b11001101 		: log = 16'b0011100010110101;
			8'b11001110 		: log = 16'b0011100010111001;
			8'b11001111 		: log = 16'b0011100010111110;
			8'b11010000 		: log = 16'b0011100011000010;
			8'b11010001 		: log = 16'b0011100011000110;
			8'b11010010 		: log = 16'b0011100011001011;
			8'b11010011 		: log = 16'b0011100011001111;
			8'b11010100 		: log = 16'b0011100011010100;
			8'b11010101 		: log = 16'b0011100011011000;
			8'b11010110 		: log = 16'b0011100011011100;
			8'b11010111 		: log = 16'b0011100011100001;
			8'b11011000 		: log = 16'b0011100011100101;
			8'b11011001 		: log = 16'b0011100011101001;
			8'b11011010 		: log = 16'b0011100011101110;
			8'b11011011 		: log = 16'b0011100011110010;
			8'b11011100 		: log = 16'b0011100011110110;
			8'b11011101 		: log = 16'b0011100011111011;
			8'b11011110 		: log = 16'b0011100011111111;
			8'b11011111 		: log = 16'b0011100100000011;
			8'b11100000 		: log = 16'b0011100100000111;
			8'b11100001 		: log = 16'b0011100100001100;
			8'b11100010 		: log = 16'b0011100100010000;
			8'b11100011 		: log = 16'b0011100100010100;
			8'b11100100 		: log = 16'b0011100100011000;
			8'b11100101 		: log = 16'b0011100100011101;
			8'b11100110 		: log = 16'b0011100100100001;
			8'b11100111 		: log = 16'b0011100100100101;
			8'b11101000 		: log = 16'b0011100100101001;
			8'b11101001 		: log = 16'b0011100100101101;
			8'b11101010 		: log = 16'b0011100100110010;
			8'b11101011 		: log = 16'b0011100100110110;
			8'b11101100 		: log = 16'b0011100100111010;
			8'b11101101 		: log = 16'b0011100100111110;
			8'b11101110 		: log = 16'b0011100101000010;
			8'b11101111 		: log = 16'b0011100101000110;
			8'b11110000 		: log = 16'b0011100101001011;
			8'b11110001 		: log = 16'b0011100101001111;
			8'b11110010 		: log = 16'b0011100101010011;
			8'b11110011 		: log = 16'b0011100101010111;
			8'b11110100 		: log = 16'b0011100101011011;
			8'b11110101 		: log = 16'b0011100101011111;
			8'b11110110 		: log = 16'b0011100101100011;
			8'b11110111 		: log = 16'b0011100101100111;
			8'b11111000 		: log = 16'b0011100101101011;
			8'b11111001 		: log = 16'b0011100101101111;
			8'b11111010 		: log = 16'b0011100101110011;
			8'b11111011 		: log = 16'b0011100101110111;
			8'b11111100 		: log = 16'b0011100101111100;
			8'b11111101 		: log = 16'b0011100110000000;
			8'b11111110 		: log = 16'b0011100110000100;
			8'b11111111 		: log = 16'b0011100110001000;
        endcase
    end
endmodule
module FPLUT1(addr, log);
    input [4:0] addr;
    output reg [15:0] log;

    always @(addr) begin
        case (addr)
			5'b0 		: log = 16'b1111110000000000;
			5'b1 		: log = 16'b1100100011011010;
			5'b10 		: log = 16'b1100100010000001;
			5'b11 		: log = 16'b1100100000101001;
			5'b100 		: log = 16'b1100011110100000;
			5'b101 		: log = 16'b1100011011101110;
			5'b110 		: log = 16'b1100011000111101;
			5'b111 		: log = 16'b1100010110001100;
			5'b1000 		: log = 16'b1100010011011010;
			5'b1001 		: log = 16'b1100010000101001;
			5'b1010 		: log = 16'b1100001011101110;
			5'b1011 		: log = 16'b1100000110001100;
			5'b1100 		: log = 16'b1100000000101001;
			5'b1101 		: log = 16'b1011110110001100;
			5'b1110 		: log = 16'b1011100110001100;
			5'b1111 		: log = 16'b0000000000000000;
			5'b10000 		: log = 16'b0011100110001100;
			5'b10001 		: log = 16'b0011110110001100;
			5'b10010 		: log = 16'b0100000000101001;
			5'b10011 		: log = 16'b0100000110001100;
			5'b10100 		: log = 16'b0100001011101110;
			5'b10101 		: log = 16'b0100010000101001;
			5'b10110 		: log = 16'b0100010011011010;
			5'b10111 		: log = 16'b0100010110001100;
			5'b11000 		: log = 16'b0100011000111101;
			5'b11001 		: log = 16'b0100011011101110;
			5'b11010 		: log = 16'b0100011110100000;
			5'b11011 		: log = 16'b0100100000101001;
			5'b11100 		: log = 16'b0100100010000001;
			5'b11101 		: log = 16'b0100100011011010;
			5'b11110 		: log = 16'b0100100100110011;
			5'b11111 		: log = 16'b0111110000000000;
        endcase
    end
endmodule
module int_to_float_fp16(
        input_a,
        output_z);


  input     [15:0] input_a;
  output    [15:0] output_z;

  
  wire [15:0] value;
  wire z_s;
  wire [4:0] tmp_cnt;
  wire [4:0] sub_a_e;
  wire [4:0] sub_z_e;
  wire [15:0] a_m_shift;
  wire [10:0] z_m_final;
  wire [4:0] z_e_final;
  //wire [31:0] z;
  
  align dut_align (input_a,value,z_s);
  lzc dut_lzc (value,tmp_cnt);
  sub dut_sub (tmp_cnt,sub_a_e);
  sub2 dut_sub2 (sub_a_e,sub_z_e);
  am_shift dut_am_shift (value,sub_a_e,a_m_shift);
  exception dut_exception (a_m_shift,sub_z_e,z_m_final,z_e_final);
  final_out dut_final_out (input_a,z_m_final,z_e_final,z_s,output_z);

  
endmodule
module final_out (
  input [15:0] a,
  input [10:0] z_m,
  input [4:0] z_e,
  input z_s,
  output reg [15:0] output_z);

  always@(a or z_m or z_e or z_s) begin
    if (a == 16'b0) begin
		output_z = 16'b0;
	end
	else begin
      output_z[9:0] = z_m[9:0];
      output_z[14:10] = z_e + 8'd3;
      output_z[15] = z_s;
	end
  end

endmodule
module exception (
  input [15:0] a_m_shift,
  input [4:0] z_e,
  output reg [10:0] z_m_final,
  output reg [4:0] z_e_final
);

wire guard;
wire round_bit;
wire sticky;
  wire [10:0] z_m;

  assign guard = a_m_shift[4];
  assign round_bit = a_m_shift[3];
  assign sticky = a_m_shift[2:0] != 0;

  assign z_m = a_m_shift[15:5];

always@(guard or round_bit or sticky or z_m or z_e)
begin
if (guard && (round_bit || sticky || z_m[0])) begin
    z_m_final = z_m + 1;
   if (z_m == 11'b11111111111) begin
            z_e_final = z_e + 1;
          end
		  else z_e_final = z_e;
          end
else begin 
  z_m_final = z_m;
  z_e_final = z_e;
end
end
endmodule
module am_shift (
  input [15:0] a_m,
  input [4:0] tmp_cnt,
  output [15:0] a_m_shift);

assign a_m_shift = a_m << tmp_cnt;  
endmodule
module sub2 (
  input [4:0] a_e,
  output [4:0] sub_a_e);

assign sub_a_e = 15 - a_e;

endmodule
module sub (
  input [4:0] a_e,
  output [4:0] sub_a_e);

assign sub_a_e = a_e;

endmodule
module lzc (
  input [15:0] z_m,
  output reg [4:0] tmp_cnt_final);

  wire [15:0] Sj_int;
  //wire [15:0] val32;
wire [7:0] val8;
wire [3:0] val4;
  wire [4:0] tmp_cnt;

assign Sj_int = z_m;
  
assign    tmp_cnt[4] = 1'b0;
assign    tmp_cnt[3] = (Sj_int[15:8] == 8'b0);
assign    val8 = tmp_cnt[3] ? Sj_int[7:0] : Sj_int[15:8];
assign    tmp_cnt[2] = (val8[7:4] == 4'b0);
assign    val4 = tmp_cnt[2] ? val8[3:0] : val8[7:4];
assign    tmp_cnt[1] = (val4[3:2] == 2'b0);
assign    tmp_cnt[0] = tmp_cnt[1] ? ~val4[1] : ~val4[3];

always@(Sj_int or tmp_cnt)
begin
  if (Sj_int[15:0] == 16'b0)
   tmp_cnt_final = 5'd16;
else
   begin
   tmp_cnt_final = tmp_cnt;
end
end
endmodule
module align (
  input [15:0] a,
  output [15:0] value,
output z_s);


  assign value = a[15] ? -a : a;
  assign z_s = a[15];

endmodule
