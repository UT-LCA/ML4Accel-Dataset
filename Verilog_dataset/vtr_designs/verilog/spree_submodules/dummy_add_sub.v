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

module dummy_add_sub (
	dataa,
	datab,
	cin,
	result
);

//this is goign to be UUUUGGGGGGLLLYYYYY
//probably going to do some serious timing violations
// but i'm sure it will be interesting for the packing problem
input [31:0] dataa;
input [31:0] datab;
input cin;
output [32:0] result;
//
wire [31:0] carry_from;
wire [31:0] sum;


full_adder bit0 (cin,dataa[0],datab[0],sum[0],carry_from [0]);
full_adder bit1 (carry_from [0],dataa[1],datab[1],sum[1],carry_from [1]);
full_adder bit2 (carry_from [1],dataa[2],datab[2],sum[2],carry_from [2]);
full_adder bit3 (carry_from [2],dataa[3],datab[3],sum[3],carry_from [3]);
full_adder bit4 (carry_from [3],dataa[4],datab[4],sum[4],carry_from [4]);
full_adder bit5 (carry_from [4],dataa[5],datab[5],sum[5],carry_from [5]);
full_adder bit6 (carry_from [5],dataa[6],datab[6],sum[6],carry_from [6]);
full_adder bit7 (carry_from [6],dataa[7],datab[7],sum[7],carry_from [7]);

full_adder bit8 (carry_from [7],dataa[8],datab[8],sum[8],carry_from [8]);
full_adder bit9 (carry_from [8],dataa[9],datab[9],sum[9],carry_from [9]);
full_adder bit10 (carry_from [9],dataa[10],datab[10],sum[10],carry_from [10]);
full_adder bit11 (carry_from [10],dataa[11],datab[11],sum[11],carry_from [11]);
full_adder bit12 (carry_from [11],dataa[12],datab[12],sum[12],carry_from [12]);
full_adder bit13 (carry_from [12],dataa[13],datab[13],sum[13],carry_from [13]);
full_adder bit14 (carry_from [13],dataa[14],datab[14],sum[14],carry_from [14]);
full_adder bit15 (carry_from [14],dataa[15],datab[15],sum[15],carry_from [15]);

full_adder bit16 (carry_from [15],dataa[16],datab[16],sum[16],carry_from [16]);
full_adder bit17 (carry_from [16],dataa[17],datab[17],sum[17],carry_from [17]);
full_adder bit18 (carry_from [17],dataa[18],datab[18],sum[18],carry_from [18]);
full_adder bit19 (carry_from [18],dataa[19],datab[19],sum[19],carry_from [19]);
full_adder bit20 (carry_from [19],dataa[20],datab[20],sum[20],carry_from [20]);
full_adder bit21 (carry_from [20],dataa[21],datab[21],sum[21],carry_from [21]);
full_adder bit22 (carry_from [21],dataa[22],datab[22],sum[22],carry_from [22]);
full_adder bit23 (carry_from [22],dataa[23],datab[23],sum[23],carry_from [23]);

full_adder bit24 (carry_from [23],dataa[24],datab[24],sum[24],carry_from [24]);
full_adder bit25 (carry_from [24],dataa[25],datab[25],sum[25],carry_from [25]);
full_adder bit26 (carry_from [25],dataa[26],datab[26],sum[26],carry_from [26]);
full_adder bit27 (carry_from [26],dataa[27],datab[27],sum[27],carry_from [27]);
full_adder bit28 (carry_from [27],dataa[28],datab[28],sum[28],carry_from [28]);
full_adder bit29 (carry_from [28],dataa[29],datab[29],sum[29],carry_from [29]);
full_adder bit30 (carry_from [29],dataa[30],datab[30],sum[30],carry_from [30]);
full_adder bit31 (carry_from [30],dataa[31],datab[31],sum[31],carry_from [31]);

assign result [31:0] = sum;
assign result [32] = carry_from [31];

endmodule
module full_adder (cin,x,y,s,cout);
input cin;
input x;
input y;
output s;
output cout;
assign s = x^y^cin;
assign cout = (x&y) | (x & cin) | (y&cin);
endmodule
