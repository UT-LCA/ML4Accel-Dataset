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

module load_data_translator(
	d_readdatain,
	d_loadresult
);

//parameter WIDTH=32;

input [31:0] d_readdatain;

output [31:0] d_loadresult;

wire d_adr_one;
assign d_adr_one = d_address [1];
reg [31:0] d_loadresult;
reg sign;
wire [1:0] d_address;
assign d_address [1:0] =d_readdatain [25:24];


//assume always full-word-access
always @(d_readdatain or d_address )
begin
	d_loadresult[31:0]=d_readdatain[31:0];
end
/*
Odin II REFUSES TO ACKNOWLEDGE THAT SIGN EXTENDING IS NOT A COMBINATIONAL LOOP
always @(d_readdatain or d_address or load_size or load_sign_ext)
begin
	case (load_size)
		2'b11:
		begin
			case (d_address)
				2'b00:
					begin
					d_loadresult[7:0]=d_readdatain[31:24];
					sign = d_readdatain[31];
					end
				2'b01:
						begin
						d_loadresult[7:0]=d_readdatain[23:16];
						sign = d_readdatain[23];
						end
				2'b10: 
					begin
					d_loadresult[7:0]=d_readdatain[15:8];
					sign = d_readdatain[15];
					end
				default: 
					begin
					d_loadresult[7:0]=d_readdatain[7:0];
					sign = d_readdatain[7];
					end
			endcase
			// peter milankov note: do this by hand
			// odin II does not support multiple concatenation
			//d_loadresult[31:8]={24{load_sign_ext&d_loadresult[7]}};
			d_loadresult[31]= load_sign_ext&sign;
			d_loadresult[30]= load_sign_ext&sign;
			d_loadresult[29]= load_sign_ext&sign;
			d_loadresult[28]= load_sign_ext&sign;
			d_loadresult[27]= load_sign_ext&sign;
			d_loadresult[26]= load_sign_ext&sign;
			d_loadresult[25]= load_sign_ext&sign;
			d_loadresult[24]= load_sign_ext&sign;
			d_loadresult[23]= load_sign_ext&sign;
			d_loadresult[22]= load_sign_ext&sign;
			d_loadresult[21]= load_sign_ext&sign;
			d_loadresult[20]= load_sign_ext&sign;
			d_loadresult[19]= load_sign_ext&sign;
			d_loadresult[18]= load_sign_ext&sign;
			d_loadresult[17]= load_sign_ext&sign;
			d_loadresult[16]= load_sign_ext&sign;
			d_loadresult[15]= load_sign_ext&sign;
			d_loadresult[14]= load_sign_ext&sign;
			d_loadresult[13]= load_sign_ext&sign;
			d_loadresult[12]= load_sign_ext&sign;
			d_loadresult[11]= load_sign_ext&sign;
			d_loadresult[10]= load_sign_ext&sign;
			d_loadresult[9]= load_sign_ext&sign;
			d_loadresult[8]= load_sign_ext&sign;
		end
		2'b01:
		begin
			case (d_adr_one)
				1'b0:
					begin
						d_loadresult[15:0]=d_readdatain[31:16];
						sign = d_readdatain[31];
					end
				default:
					begin
						d_loadresult[15:0]=d_readdatain[15:0];
						sign = d_readdatain[15];
					end
			endcase
// peter milankov note sign extend is concat, do by hand
			//d_loadresult[31:16]={16{load_sign_ext&d_loadresult[15]}};
			d_loadresult[31]= load_sign_ext&sign;
			d_loadresult[30]= load_sign_ext&sign;
			d_loadresult[29]= load_sign_ext&sign;
			d_loadresult[28]= load_sign_ext&sign;
			d_loadresult[27]= load_sign_ext&sign;
			d_loadresult[26]= load_sign_ext&sign;
			d_loadresult[25]= load_sign_ext&sign;
			d_loadresult[24]= load_sign_ext&sign;
			d_loadresult[23]= load_sign_ext&sign;
			d_loadresult[22]= load_sign_ext&sign;
			d_loadresult[21]= load_sign_ext&sign;
			d_loadresult[20]= load_sign_ext&sign;
			d_loadresult[19]= load_sign_ext&sign;
			d_loadresult[18]= load_sign_ext&sign;
			d_loadresult[17]= load_sign_ext&sign;
			d_loadresult[16]= load_sign_ext&sign;
		end
		default:
			d_loadresult[31:0]=d_readdatain[31:0];
	endcase
end
*/
endmodule
