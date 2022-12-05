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

module reg_file(
	clk, 
	resetn, 
	c_writedatain,
	c_reg,
	b_reg,
	a_reg,
	c_we, 
	b_en, 
	a_en,
	b_readdataout, 
	a_readdataout
);
//parameter WIDTH=32;
//parameter NUMREGS=32;
//parameter LOG2NUMREGS=5;
input clk;
input resetn;

input a_en;
input b_en;
input [31:0] c_writedatain;
input c_we;
input [31:0] a_reg;
input [31:0] b_reg;
input [31:0] c_reg;
output [31:0] a_readdataout;
output [31:0] b_readdataout;
//reg [31:0] a_readdataout;
//reg [31:0] b_readdataout;


wire [31:0] a_readdataout_temp;
wire [31:0] b_readdataout_temp;


assign b_readdataout = b_readdataout_temp;
assign a_readdataout = a_readdataout_temp;

wire wren1;
assign wren1 = (c_we & (|c_reg));
defparam regfile1_replace.ADDR_WIDTH = 5;
defparam regfile1_replace.DATA_WIDTH = 32;
single_port_ram regfile1_replace (
	.clk (clk),
	.we(wren1),
	.data(c_writedatain),
	.out(a_readdataout_temp),
	.addr(c_reg[4:0])
);

//Reg file duplicated to avoid contention 
//between 2 read and 1 write
//MORE MEMORY

defparam regfile2_replace.ADDR_WIDTH = 5;
defparam regfile2_replace.DATA_WIDTH = 32;
single_port_ram regfile2_replace(
	.clk (clk),
	.we(wren1),
	.data(c_writedatain),
	.out(b_readdataout_temp),
	.addr(c_reg[4:0])
);		

//Odin II does not recognize that address 
//registers are being used to read and 
//write data, so they are assigned to an 
//unused wire which is later dropped by the
//optimizer.
wire useless_inputs;
//`a_reg` and `b_reg` were not used correctly in last version 
//of `spree.v` according to the comment above this module.
//Investigate whether the comment or the code is wrong
assign useless_inputs = resetn & b_en & a_en & ( | a_reg ) & ( | b_reg );
endmodule

module single_port_ram(
clk,
addr,
data,
we,
out
);

parameter DATA_WIDTH = 256;
parameter ADDR_WIDTH = 10;
input clk;
input [ADDR_WIDTH-1:0] addr;
input [DATA_WIDTH-1:0] data;
input we;
output reg [DATA_WIDTH-1:0] out;

reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

always @(posedge clk) begin
  if (we) begin
    ram[addr] <= data;
  end
  else begin
    out <= ram[addr];
  end
end

endmodule



