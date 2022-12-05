`define VAL 31
`define WIDTH 32
`define NUMREGS 32
`define LOG2NUMREGS 5
`define PC_WIDTH 30
`define I_DATAWIDTH 32
`define I_ADDRESSWIDTH 14
`define I_SIZE 16384
`define D_ADDRESSWIDTH 32
`define DM_DATAWIDTH 32
`define DM_BYTEENAWIDTH 4
`define DM_ADDRESSWIDTH 10
`define DM_SIZE 16384
`define     OP_SPECIAL       6'b000000
`define     OP_REGIMM        6'b000001
`define     OP_J             6'b000010
`define     OP_JAL           6'b000011
`define     OP_BEQ           6'b000100
`define     OP_BNE           6'b000101
`define     OP_BLEZ          6'b000110
`define     OP_BGTZ          6'b000111
`define     OP_ADDI          6'b001000
`define     OP_ADDIU         6'b001001
`define     OP_SLTI          6'b001010
`define     OP_SLTIU         6'b001011
`define     OP_ANDI          6'b001100
`define     OP_ORI           6'b001101
`define     OP_XORI          6'b001110
`define     OP_LUI           6'b001111
`define     OP_LB            6'b100000
`define     OP_LH            6'b100001
`define     OP_LWL           6'b100010
`define     OP_LW            6'b100011
`define     OP_LBU           6'b100100
`define     OP_LHU           6'b100101
`define     OP_LWR           6'b100110
`define     OP_SB            6'b101100
`define     OP_SH            6'b101101
`define     OP_SWL           6'b101010
`define     OP_SW            6'b101111
`define     OP_SWR           6'b101110
`define     FUNC_SLL         6'b000000
`define     FUNC_SRL         6'b000010
`define     FUNC_SRA         6'b000011
`define     FUNC_SLLV        6'b000100
`define     FUNC_SRLV        6'b000110
`define     FUNC_SRAV        6'b000111
`define     FUNC_JR          6'b001110
`define     FUNC_JALR        6'b001111
`define     FUNC_MFHI        6'b110100
`define     FUNC_MTHI        6'b110101
`define     FUNC_MFLO        6'b110110
`define     FUNC_MTLO        6'b110111
`define     FUNC_MULT        6'b111100
`define     FUNC_MULTU       6'b111101
`define     FUNC_DIV         6'b111110
`define     FUNC_DIVU        6'b111111
`define     FUNC_ADD         6'b100000
`define     FUNC_ADDU        6'b100001
`define     FUNC_SUB         6'b100010
`define     FUNC_SUBU        6'b100011
`define     FUNC_AND         6'b100100
`define     FUNC_OR          6'b100101
`define     FUNC_XOR         6'b100110
`define     FUNC_NOR         6'b100111
`define     FUNC_SLT         6'b101010
`define     FUNC_SLTU        6'b101011
`define     FUNC_BLTZ        1'b0
`define     FUNC_BGEZ        1'b1
`define     OP_COP2        6'b010010
`define     COP2_FUNC_CFC2      6'b111000
`define     COP2_FUNC_CTC2      6'b111010
`define     COP2_FUNC_MTC2      6'b111011
//`define     FUNC_BLTZAL      5'b10000
//`define     FUNC_BGEZAL      5'b10001
`define     FUNC_BLTZ        5'b00000
`define     FUNC_BGEZ        5'b00001
`define     FUNC_BLTZAL      5'b10000
`define     FUNC_BGEZAL      5'b10001
`define SIMULATION_MEMORY
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32
//`define WIDTH 32

module mul(
	clk,
	resetn,
	sa,
	dst, 
	opB,
	opA,
	op, 
	start, 
	stalled,
	shift_result,
	lo,
	hi
);

input clk;
input resetn;

input start;
output stalled;

input [4:0] dst;

input [31:0] opA;
input [31:0] opB;
input [4:0] sa;
input [2:0] op;

output [31:0] shift_result;
output [31:0] hi;
output [31:0] lo;

/********* Control Signals *********/
wire is_signed;
wire dir;
wire is_mul;
assign is_mul=op[2];      // selects between opB and the computed shift amount
assign is_signed=op[1];
assign dir=op[0];         // selects between 2^sa and 2^(32-sa) for right shift

/********* Circuit Body *********/
wire dum;
wire dum2; 
wire dum3;
wire [32:0] opB_mux_out;
wire [4:0] left_sa;     // Amount of left shift required for both left/right
reg [32:0] decoded_sa;
wire [31:0] result;
//assign opB_mux_out= (is_mul) ? {is_signed&opB[31],opB} : decoded_sa;
assign opB_mux_out = opB;



dummy_mult fake_mult_one (opA,opB_mux_out, clk, resetn, result);
assign hi = result [15:8];
assign lo = result [7:0];
// Cannot support this now
/*
lpm_mult  lpm_mult_component (
  .dataa ({is_signed&opA[31],opA}),
  .datab (opB_mux_out),
  .sum(),
  .clock(clk),
  .clken(),
  .aclr(~resetn),
  .result ({dum2,dum,hi,lo}));
defparam
  lpm_mult_component.lpm_32a = 32+1,
  lpm_mult_component.lpm_32b = 32+1,
  lpm_mult_component.lpm_32p = 2*32+2,
  lpm_mult_component.lpm_32s = 1,
  lpm_mult_component.lpm_pipeline = 1,
  lpm_mult_component.lpm_type = "LPM_MULT",
  lpm_mult_component.lpm_representation = "SIGNED",
  lpm_mult_component.lpm_hint = "MAXIMIZE_SPEED=6";
*/
assign shift_result= (dir & |sa) ? hi : lo;


// 1 cycle stall state machine
wire or_dst;
wire start_and_ismul;
wire request;

assign or_dst = |dst;
assign start_and_ismul = start & is_mul; 
assign request = (or_dst & start & ~is_mul) | (start_and_ismul);
onecyclestall staller(request,clk,resetn,stalled);


endmodule
module dummy_mult  (
	opA,
	opB_mux_out, 
	clk, 
	resetn, 
	result
);

input [31:0] opA;
input [31:0] opB_mux_out;
input  clk;
input  resetn;
output[31:0] result;
reg [31:0] result;


always @ (posedge clk)
begin
	if (resetn)
		result <= 32'b00000000000000000000000000000000;
	else
		//multiplier by star symbol
		//though this is probably supposed to be signed
		result <= opA * opB_mux_out;
end
endmodule

module onecyclestall(
	request,
	clk,
	resetn,
	stalled
);

input request;
input clk;
input resetn;
output stalled;

  reg T,Tnext;

  // State machine for Stalling 1 cycle
  always@(request or T)
  begin
	case(T) 
	  1'b0: Tnext=request;
	  1'b1: Tnext=0;
	endcase 
  end       
  always@(posedge clk)
	if (~resetn)
	  T<=0; 
	else    
	  T<=Tnext;
  assign stalled=(request&~T);
endmodule



