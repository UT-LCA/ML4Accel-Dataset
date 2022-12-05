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

module ifetch(
	clk,
	resetn,
	boot_iaddr, 
	boot_idata, 
	boot_iwe,
	load,
	load_data,
	op,
	we,
	squashn,
	en,
	pc_out,
	instr,
	opcode,
	func,
	rs,
	rt,
	rd,
	instr_index,
	offset,
	sa,
	next_pc
);

//parameter PC_WIDTH=30;
//parameter I_DATAWIDTH=32;
//parameter I_ADDRESSWIDTH=14;
//parameter I_SIZE=16384;

input [31:0] boot_iaddr;
input [31:0] boot_idata;
input boot_iwe;

input clk;
input resetn;
input en;     // PC increment enable
input we;     // PC write enable
input squashn;// squash fetch
input op;     // determines if conditional or unconditional branch
input load;
input [`I_DATAWIDTH-1:0] load_data;
output [`I_DATAWIDTH-1:0] pc_out;   // output pc + 1 shifted left 2 bits
output [`PC_WIDTH-1:0] next_pc;
output [31:26] opcode;
output [25:21] rs;
output [20:16] rt;
output [15:11] rd;
output [10:6] sa;
output [15:0] offset;
output [25:0] instr_index;
output [5:0] func;
output [`I_DATAWIDTH-1:0] instr;


wire [`PC_WIDTH-1:0] pc_plus_1;
wire [`PC_WIDTH-1:0] pc;
assign pc_plus_1 = pc;
wire ctrl_load;
wire out_of_sync;

assign ctrl_load=(load&~op|op);
wire notresetn;
assign notresetn = ~resetn;
wire count_en;
assign count_en = (~ctrl_load)&~out_of_sync;
wire counter_en;
assign counter_en = en | we;
wire [32:2] reg_load_data;

assign reg_load_data = load_data [31:2];

wire reg_d;
wire reg_en;
assign reg_d = (we&(~en)&(squashn));
assign reg_en = en|we;


register_1bit sync_pcs_up( reg_d, clk, resetn,reg_en, out_of_sync);

wire wren1;
assign wren1 = 1'b0;
wire [9:0] next_pc_wire;
assign next_pc_wire = next_pc [9:0];

wire [31:0]dummyout2;

defparam imem_replace.ADDR_WIDTH = 10;
defparam imem_replace.DATA_WIDTH = `I_DATAWIDTH;
dual_port_ram imem_replace(
	.clk (clk),
	.we1(wren1),
	.we2(boot_iwe),
	.data1(load_data),
	.data2(boot_idata),
	.out1(instr),
	.out2(dummyout2),
	.addr1(next_pc_wire),
	.addr2(boot_iaddr[9:0])
);

wire [31:0] dummyin1;
assign dummyin1 = 32'b00000000000000000000000000000000;

dummy_counter pc_reg ((reg_load_data),(clk),(counter_en),(count_en),(notresetn),(ctrl_load),(pc));
assign pc_out [31:2] = pc_plus_1;
assign pc_out [1:0] = 2'b00;

assign next_pc = ctrl_load ? load_data[31:2] : pc_plus_1;
assign opcode=instr[31:26];
assign rs=instr[25:21];
assign rt=instr[20:16];
assign rd=instr[15:11];
assign sa=instr[10:6];
assign offset=instr[15:0]; 
assign instr_index=instr[25:0];
assign func=instr[5:0];

//Odin II does not recognize that boot_iaddr 
//is being used to write data when system 
//is given 1'b1 on the boot_iwe wire so is
//is assigned to an unused wire which is 
//later dropped by the optimizer.
wire NoUse;
assign NoUse = ( |boot_iaddr );

endmodule
module dummy_counter (
	data,
	clock,
	clk_en,
	cnt_en,
	aset,
	sload,
	q
);

input [31:2] data;
input clock;
input clk_en;
input cnt_en;
input aset;
input sload;
output [`PC_WIDTH-1:0] q;
reg [`PC_WIDTH-1:0] q;

wire [2:0] sload_cnten_aset;
assign sload_cnten_aset [0] = sload;
assign sload_cnten_aset [1] = cnt_en;
assign sload_cnten_aset [2] = aset;

always @ (posedge clock)

//if (cnt_en == 1)
//q <= q+1;
begin

case (sload_cnten_aset)
	3'b000:
		q <= q;
	3'b011:
		q <= q;
	3'b110:
		q <= q;
	3'b111:
		q <= q;
	3'b101:
		q <= q;
	3'b100: 
		q <= data;
	3'b010:
	begin
		if (clk_en) 
			q <= q+1;
		else
			q <= q;
		end
	3'b001:
		q <= 29'b00000000000000000000000000000;
	default:
		q <= q;
endcase
end
endmodule
module dual_port_ram(
clk,
addr1,
addr2,
data1,
data2,
we1,
we2,
out1,
out2
);

parameter DATA_WIDTH = 256;
parameter ADDR_WIDTH = 10;
input clk;
input [ADDR_WIDTH-1:0] addr1;
input [ADDR_WIDTH-1:0] addr2;
input [DATA_WIDTH-1:0] data1;
input [DATA_WIDTH-1:0] data2;
input we1;
input we2;
output reg [DATA_WIDTH-1:0] out1;
output reg [DATA_WIDTH-1:0] out2;

reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0];

always @(posedge clk) begin
  if (we1) begin
    ram[addr1] <= data1;
  end
  else begin
    out1 <= ram[addr1];
  end
end

always @(posedge clk) begin
  if (we2) begin
    ram [addr2] <= data2;
  end
  else begin
    out2 <= ram[addr2];
  end
end

endmodule
module register_1bit(
	d,
	clk,
	resetn,
	en,
	q
);

//parameter WIDTH=32;

input clk;
input resetn;
input en;
input  d;
output q;
reg q;

always @(posedge clk )		
begin
	if (resetn==0)
		q<=0;
	else if (en==1)
		q<=d;
end

endmodule
