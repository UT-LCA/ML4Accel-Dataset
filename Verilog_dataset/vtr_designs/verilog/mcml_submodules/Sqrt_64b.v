`define TRIG_WIDTH 5'b01010 //10;
`define PIPELINE_DEPTH_UPPER_LIMIT 10'b0100000000 //256;
`define ABSORB_ADDR_WIDTH 6'b010000 //16;
`define ABSORB_WORD_WIDTH 7'b01000000 //64;
`define WSCALE 22'b0111010100101111111111 //1919999;
//`define BIT_WIDTH 7'b0100000
//`define LAYER_WIDTH 6'b000011 
`define LEFTSHIFT 6'b000011         // 2^3=8=1/0.125 where 0.125 = CHANCE of roulette
`define INTCHANCE 32'b00100000000000000000000000000000 //Based on 32 bit rand num generator
`define MIN_WEIGHT 9'b011001000 
`define BIT_WIDTH 7'b0100000
`define LAYER_WIDTH 6'b000011
`define INTMAX 32'b01111111111111111111111111111111
`define INTMIN 32'b10000000000000000000000000000000
`define DIVIDER_LATENCY 6'b011110
`define FINAL_LATENCY 6'b011100
`define MULT_LATENCY 1'b1
`define ASPECT_RATIO 6'b000111
`define TOTAL_LATENCY 7'b0111100
//`define BIT_WIDTH 6'b100000
//`define LAYER_WIDTH 6'b000011
`define LOGSCALEFACTOR 6'b000101
`define MAXLOG 32'b10110001011100100001011111110111		//Based on 32 bit unsigned rand num generator
`define CONST_MOVE_AMOUNT 15'b110000110101000  //Used for testing purposes only
`define MUTMAX_BITS 6'b001111
//`define BIT_WIDTH 6'b100000
//`define LAYER_WIDTH 6'b000011
//`define INTMAX 32'b01111111111111111111111111111111
//`define INTMIN 32'b10000000000000000000000000000000
//`define BIT_WIDTH 7'b0100000
`define MANTISSA_PRECISION 6'b001010
`define LOG2_BIT_WIDTH 6'b000110
`define LOG2 28'b0101100010111001000010111111
`define NR 10'b0100000000             
`define NZ 10'b0100000000              
`define NR_EXP 5'b01000              //meaning `NR=2^`NR_exp or 2^8=256
`define RGRID_SCLAE_EXP 6'b010101    //2^21 = RGRID_SCALE
`define ZGRID_SCLAE_EXP 6'b010101    //2^21 = ZGRID_SCALE
//`define BIT_WIDTH 7'b0100000
`define BIT_WIDTH_2 8'b01000000
`define WORD_WIDTH 8'b01000000
`define ADDR_WIDTH 6'b010000          //256x256=2^8*2^8=2^16
`define DIV 6'b010100//20;
`define SQRT 5'b01010 //10;
`define LAT 7'b0100101 //DIV + SQRT + 7;
`define INTMAX_2 {32'h3FFFFFFF,32'h00000001}
//`define INTMAX 32'b01111111111111111111111111111111//2147483647;
//`define INTMIN 32'b10000000000000000000000000000001//-2147483647;
`define INTMAXMinus3 32'b01111111111111111111111111111100//2147483644;
`define negINTMAXPlus3 32'b10000000000000000000000000000100//-2147483644;
`define INTMAX_2_ref {32'h3FFFFFFF,32'hFFFFFFFF}
`define SIMULATION_MEMORY

module Sqrt_64b (clk, num_, res);
	input clk;
	input [63:0]num_;
	output [31:0]res;
	reg [31:0]res;
	
	reg [63:0]num;
	
	always @ (posedge clk)
	begin
		num <= num_;
	end
	
///////////////////////////////////////////////////Unchanged starts here
	
//	reg [63:0] one_[32:0];
//	reg [63:0] res_[32:0];
//	reg [63:0] op_[32:0];

	wire [63:0]one__0;
    reg  [63:0]one__1;
    reg  [63:0]one__2;
    reg  [63:0]one__3_d, one__3_q;
    reg  [63:0]one__4;
    reg  [63:0]one__5;
    reg  [63:0]one__6;
    reg  [63:0]one__7_d, one__7_q;
    reg  [63:0]one__8;
    reg  [63:0]one__9;
    reg  [63:0]one__10;
    reg  [63:0]one__11_d, one__11_q;
    reg  [63:0]one__12;
    reg  [63:0]one__13;
    reg  [63:0]one__14;
    reg  [63:0]one__15_d, one__15_q;
    reg  [63:0]one__16;
    reg  [63:0]one__17;
    reg  [63:0]one__18_d, one__18_q;
    reg  [63:0]one__19;
    reg  [63:0]one__20;
    reg  [63:0]one__21_d, one__21_q;
    reg  [63:0]one__22;
    reg  [63:0]one__23;
    reg  [63:0]one__24_d, one__24_q;
    reg  [63:0]one__25;
    reg  [63:0]one__26;
    reg  [63:0]one__27_d, one__27_q;
    reg  [63:0]one__28;
    reg  [63:0]one__29;
    reg  [63:0]one__30_d, one__30_q;
    reg  [63:0]one__31;
	reg  [63:0]one__32;

	wire [63:0]res__0;
    reg  [63:0]res__1;
    reg  [63:0]res__2;
    reg  [63:0]res__3_d, res__3_q;
    reg  [63:0]res__4;
    reg  [63:0]res__5;
    reg  [63:0]res__6;
    reg  [63:0]res__7_d, res__7_q;
    reg  [63:0]res__8;
    reg  [63:0]res__9;
    reg  [63:0]res__10;
    reg  [63:0]res__11_d, res__11_q;
    reg  [63:0]res__12;
    reg  [63:0]res__13;
    reg  [63:0]res__14;
    reg  [63:0]res__15_d, res__15_q;
    reg  [63:0]res__16;
    reg  [63:0]res__17;
    reg  [63:0]res__18_d, res__18_q;
    reg  [63:0]res__19;
    reg  [63:0]res__20;
    reg  [63:0]res__21_d, res__21_q;
    reg  [63:0]res__22;
    reg  [63:0]res__23;
    reg  [63:0]res__24_d, res__24_q;
    reg  [63:0]res__25;
    reg  [63:0]res__26;
    reg  [63:0]res__27_d, res__27_q;
    reg  [63:0]res__28;
    reg  [63:0]res__29;
    reg  [63:0]res__30_d, res__30_q;
    reg  [63:0]res__31;
	reg  [63:0]res__32;
    
	wire [63:0]op__0;
	reg  [63:0]op__1;
    reg  [63:0]op__2;
    reg  [63:0]op__3_d, op__3_q;
    reg  [63:0]op__4;
    reg  [63:0]op__5;
    reg  [63:0]op__6;
    reg  [63:0]op__7_d, op__7_q;
    reg  [63:0]op__8;
    reg  [63:0]op__9;
    reg  [63:0]op__10;
    reg  [63:0]op__11_d, op__11_q;
    reg  [63:0]op__12;
    reg  [63:0]op__13;
    reg  [63:0]op__14;
    reg  [63:0]op__15_d, op__15_q;
    reg  [63:0]op__16;
    reg  [63:0]op__17;
    reg  [63:0]op__18_d, op__18_q;
    reg  [63:0]op__19;
    reg  [63:0]op__20;
    reg  [63:0]op__21_d, op__21_q;
    reg  [63:0]op__22;
    reg  [63:0]op__23;
    reg  [63:0]op__24_d, op__24_q;
    reg  [63:0]op__25;
    reg  [63:0]op__26;
    reg  [63:0]op__27_d, op__27_q;
    reg  [63:0]op__28;
    reg  [63:0]op__29;
    reg  [63:0]op__30_d, op__30_q;
    reg  [63:0]op__31;
	reg  [63:0]op__32;

	
	reg [63:0]one; //This is the one that is selected in first expanded loop
	reg [31:0]one_tmp;
	
	always @ (num) begin
		
		//The first for-loop:
		//all of these will be zero no matter how 'one' is selected.
		one[1] = 0;
		one[3] = 0;
		one[5] = 0;
		one[7] = 0;
		one[9] = 0;
		one[11] = 0;
		one[13] = 0;
		one[15] = 0;
		one[17] = 0;
		one[19] = 0;
		one[21] = 0;
		one[23] = 0;
		one[25] = 0;
		one[27] = 0;
		one[29] = 0;
		one[31] = 0;
		one[33] = 0;
		one[35] = 0;
		one[37] = 0;
		one[39] = 0;
		one[41] = 0;
		one[43] = 0;
		one[45] = 0;
		one[47] = 0;
		one[49] = 0;
		one[51] = 0;
		one[53] = 0;
		one[55] = 0;
		one[57] = 0;
		one[59] = 0;
		one[61] = 0;
		one[63] = 0;
		
		one_tmp[0] = num[0]|num[1];
		one_tmp[1] = num[2]|num[3];
		one_tmp[2] = num[4]|num[5];
		one_tmp[3] = num[6]|num[7];
		one_tmp[4] = num[8]|num[9];
		one_tmp[5] = num[10]|num[11];
		one_tmp[6] = num[12]|num[13];
		one_tmp[7] = num[14]|num[15];
		one_tmp[8] = num[16]|num[17];
		one_tmp[9] = num[18]|num[19];
		one_tmp[10] = num[20]|num[21];
		one_tmp[11] = num[22]|num[23];
		one_tmp[12] = num[24]|num[25];
		one_tmp[13] = num[26]|num[27];
		one_tmp[14] = num[28]|num[29];
		one_tmp[15] = num[30]|num[31];
		one_tmp[16] = num[32]|num[33];
		one_tmp[17] = num[34]|num[35];
		one_tmp[18] = num[36]|num[37];
		one_tmp[19] = num[38]|num[39];
		one_tmp[20] = num[40]|num[41];
		one_tmp[21] = num[42]|num[43];
		one_tmp[22] = num[44]|num[45];
		one_tmp[23] = num[46]|num[47];
		one_tmp[24] = num[48]|num[49];
		one_tmp[25] = num[50]|num[51];
		one_tmp[26] = num[52]|num[53];
		one_tmp[27] = num[54]|num[55];
		one_tmp[28] = num[56]|num[57];
		one_tmp[29] = num[58]|num[59];
		one_tmp[30] = num[60]|num[61];
		one_tmp[31] = num[62]|num[63];
		
		one[0] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&~one_tmp[3]&~one_tmp[2]&~one_tmp[1]&one_tmp[0];
		one[2] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&~one_tmp[3]&~one_tmp[2]&one_tmp[1];
		one[4] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&~one_tmp[3]&one_tmp[2];
		one[6] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&~one_tmp[4]&one_tmp[3];
		one[8] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&~one_tmp[5]&one_tmp[4];
		one[10] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&~one_tmp[6]&one_tmp[5];
		one[12] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&~one_tmp[7]&one_tmp[6];
		one[14] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&~one_tmp[8]&one_tmp[7];
		one[16] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&~one_tmp[9]&one_tmp[8];
		one[18] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&~one_tmp[10]&one_tmp[9];
		one[20] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&~one_tmp[11]&one_tmp[10];
		one[22] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&~one_tmp[12]&one_tmp[11];
		one[24] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&~one_tmp[13]&one_tmp[12];
		one[26] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&~one_tmp[14]&one_tmp[13];
		one[28] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&~one_tmp[15]&one_tmp[14];
		one[30] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&~one_tmp[16]&one_tmp[15];
		one[32] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&~one_tmp[17]&one_tmp[16];
		one[34] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&~one_tmp[18]&one_tmp[17];
		one[36] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&~one_tmp[19]&one_tmp[18];
		one[38] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&~one_tmp[20]&one_tmp[19];
		one[40] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&~one_tmp[21]&one_tmp[20];
		one[42] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&~one_tmp[22]&one_tmp[21];
		one[44] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&~one_tmp[23]&one_tmp[22];
		one[46] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&~one_tmp[24]&one_tmp[23];
		one[48] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&~one_tmp[25]&one_tmp[24];
		one[50] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&~one_tmp[26]&one_tmp[25];
		one[52] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&~one_tmp[27]&one_tmp[26];
		one[54] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&~one_tmp[28]&one_tmp[27];
		one[56] = ~one_tmp[31]&~one_tmp[30]&~one_tmp[29]&one_tmp[28];
		one[58] = ~one_tmp[31]&~one_tmp[30]&one_tmp[29];
		one[60] = ~one_tmp[31]&one_tmp[30];
		one[62] = one_tmp[31];
	end
	
//	//2nd for-loop:
//	integer i;
//	always @* begin
//		op_[0] = num;
//		one_[0] = one;
//		res_[0] = 64'b0;
//		res = 63'b0;
//		res_assigned = 1'b0;
//	
//		for (i = 0; i <= 31; i=i+1) begin
//			if ((one_[i] == 0) & ~res_assigned) begin
//				res = res_[i];
//				res_assigned = 1'b1;
//			end
//			
//			//Define the next stage:
//			if (op_[i] >= res_[i] + one_[i]) begin
//				op_[i+1] = op_[i] - res_[i] - one_[i];
//				res_[i+1] = (res_[i]>>1) + one_[i];
//			end else begin
//				op_[i+1] = op_[i]; //this line had to be added for the verilog version.
//				res_[i+1] = (res_[i]>>1);
//			end
//			one_[i+1] = (one_[i] >> 2);
//		end
//	
//		//Add the part for really big numbers later:
//		if (~res_assigned) begin
//			res = res_[32];
//		end
//	end

	//If-statement about defining the next stage:
	assign op__0 = num;
	assign res__0 = 64'b0;
	assign one__0 = one;
	
	always @ (res__0 or op__0 or one__0) begin

       //i = 0
       if (op__0 >= res__0 + one__0) begin
           op__1 = op__0 - res__0 - one__0;
           res__1 = (res__0>>1) + one__0;
       end else begin
           op__1 = op__0;
           res__1 = (res__0>>1);
       end
       one__1 = (one__0 >> 2);

       //i = 1
       if (op__1 >= res__1 + one__1) begin
           op__2 = op__1 - res__1 - one__1;
           res__2 = (res__1>>1) + one__1;
       end else begin
           op__2 = op__1;
           res__2 = (res__1>>1);
       end
       one__2 = (one__1 >> 2);

       //i = 2
       if (op__2 >= res__2 + one__2) begin
           op__3_d = op__2 - res__2 - one__2;
           res__3_d = (res__2>>1) + one__2;
       end else begin
           op__3_d = op__2;
           res__3_d = (res__2>>1);
       end
       one__3_d = (one__2 >> 2);
	end
	
	always @ (posedge clk) begin
		op__3_q <= op__3_d;
		res__3_q <= res__3_d;
		one__3_q <= one__3_d;
	end
	
	always @ (op__3_q or res__3_q or one__3_q) begin
       //i = 3
       if (op__3_q >= res__3_q + one__3_q) begin
           op__4 = op__3_q - res__3_q - one__3_q;
           res__4 = (res__3_q>>1) + one__3_q;
       end else begin
           op__4 = op__3_q;
           res__4 = (res__3_q>>1);
       end
       one__4 = (one__3_q >> 2);

       //i = 4
       if (op__4 >= res__4 + one__4) begin
           op__5 = op__4 - res__4 - one__4;
           res__5 = (res__4>>1) + one__4;
       end else begin
           op__5 = op__4;
           res__5 = (res__4>>1);
       end
       one__5 = (one__4 >> 2);

       //i = 5
       if (op__5 >= res__5 + one__5) begin
           op__6 = op__5 - res__5 - one__5;
           res__6 = (res__5>>1) + one__5;
       end else begin
           op__6 = op__5;
           res__6 = (res__5>>1);
       end
       one__6 = (one__5 >> 2);

       //i = 6
       if (op__6 >= res__6 + one__6) begin
           op__7_d = op__6 - res__6 - one__6;
           res__7_d = (res__6>>1) + one__6;
       end else begin
           op__7_d = op__6;
           res__7_d = (res__6>>1);
       end
       one__7_d = (one__6 >> 2);
	end
		 
	always @ (posedge clk) begin
		op__7_q <= op__7_d;
		one__7_q <= one__7_d;
		res__7_q <= res__7_d;
	end
	
	always @ (op__7_q or res__7_q or one__7_q) begin
       //i = 7
       if (op__7_q >= res__7_q + one__7_q) begin
           op__8 = op__7_q - res__7_q - one__7_q;
           res__8 = (res__7_q>>1) + one__7_q;
       end else begin
           op__8 = op__7_q;
           res__8 = (res__7_q>>1);
       end
       one__8 = (one__7_q >> 2);

       //i = 8
       if (op__8 >= res__8 + one__8) begin
           op__9 = op__8 - res__8 - one__8;
           res__9 = (res__8>>1) + one__8;
       end else begin
           op__9 = op__8;
           res__9 = (res__8>>1);
       end
       one__9 = (one__8 >> 2);

       //i = 9
       if (op__9 >= res__9 + one__9) begin
           op__10 = op__9 - res__9 - one__9;
           res__10 = (res__9>>1) + one__9;
       end else begin
           op__10 = op__9;
           res__10 = (res__9>>1);
       end
       one__10 = (one__9 >> 2);

       //i = 10
       if (op__10 >= res__10 + one__10) begin
           op__11_d = op__10 - res__10 - one__10;
           res__11_d = (res__10>>1) + one__10;
       end else begin
           op__11_d = op__10;
           res__11_d = (res__10>>1);
       end
       one__11_d = (one__10 >> 2);
	end
		 
	always @ (posedge clk) begin
		op__11_q <= op__11_d;
		one__11_q <= one__11_d;
		res__11_q <= res__11_d;
	end
	
	always @ (op__11_q or res__11_q or one__11_q) begin	 
       //i = 11
       if (op__11_q >= res__11_q + one__11_q) begin
           op__12 = op__11_q - res__11_q - one__11_q;
           res__12 = (res__11_q>>1) + one__11_q;
       end else begin
           op__12 = op__11_q;
           res__12 = (res__11_q>>1);
       end
       one__12 = (one__11_q >> 2);

       //i = 12
       if (op__12 >= res__12 + one__12) begin
           op__13 = op__12 - res__12 - one__12;
           res__13 = (res__12>>1) + one__12;
       end else begin
           op__13 = op__12;
           res__13 = (res__12>>1);
       end
       one__13 = (one__12 >> 2);

       //i = 13
       if (op__13 >= res__13 + one__13) begin
           op__14 = op__13 - res__13 - one__13;
           res__14 = (res__13>>1) + one__13;
       end else begin
           op__14 = op__13;
           res__14 = (res__13>>1);
       end
       one__14 = (one__13 >> 2);

       //i = 14
       if (op__14 >= res__14 + one__14) begin
           op__15_d = op__14 - res__14 - one__14;
           res__15_d = (res__14>>1) + one__14;
       end else begin
           op__15_d = op__14;
           res__15_d = (res__14>>1);
       end
       one__15_d = (one__14 >> 2);
	end
	
	always @ (posedge clk) begin
		op__15_q <= op__15_d;
		one__15_q <= one__15_d;
		res__15_q <= res__15_d;
	end
	
	always @ (op__15_q or res__15_q or one__15_q) begin
       //i = 15
       if (op__15_q >= res__15_q + one__15_q) begin
           op__16 = op__15_q - res__15_q - one__15_q;
           res__16 = (res__15_q>>1) + one__15_q;
       end else begin
           op__16 = op__15_q;
           res__16 = (res__15_q>>1);
       end
       one__16 = (one__15_q >> 2);

       //i = 16
       if (op__16 >= res__16 + one__16) begin
           op__17 = op__16 - res__16 - one__16;
           res__17 = (res__16>>1) + one__16;
       end else begin
           op__17 = op__16;
           res__17 = (res__16>>1);
       end
       one__17 = (one__16 >> 2);

       //i = 17
       if (op__17 >= res__17 + one__17) begin
           op__18_d = op__17 - res__17 - one__17;
           res__18_d = (res__17>>1) + one__17;
       end else begin
           op__18_d = op__17;
           res__18_d = (res__17>>1);
       end
       one__18_d = (one__17 >> 2);
	end
	
	always @ (posedge clk) begin
		op__18_q <= op__18_d;
		one__18_q <= one__18_d;
		res__18_q <= res__18_d;
	end
	
	always @ (op__18_q or res__18_q or one__18_q) begin
       //i = 18
       if (op__18_q >= res__18_q + one__18_q) begin
           op__19 = op__18_q - res__18_q - one__18_q;
           res__19 = (res__18_q>>1) + one__18_q;
       end else begin
           op__19 = op__18_q;
           res__19 = (res__18_q>>1);
       end
       one__19 = (one__18_q >> 2);

       //i = 19
       if (op__19 >= res__19 + one__19) begin
           op__20 = op__19 - res__19 - one__19;
           res__20 = (res__19>>1) + one__19;
       end else begin
           op__20 = op__19;
           res__20 = (res__19>>1);
       end
       one__20 = (one__19 >> 2);

       //i = 20
       if (op__20 >= res__20 + one__20) begin
           op__21_d = op__20 - res__20 - one__20;
           res__21_d = (res__20>>1) + one__20;
       end else begin
           op__21_d = op__20;
           res__21_d = (res__20>>1);
       end
       one__21_d = (one__20 >> 2);
	end
	
	always @ (posedge clk) begin
		op__21_q <= op__21_d;
		one__21_q <= one__21_d;
		res__21_q <= res__21_d;
	end
		 
	always @ (op__21_q or res__21_q or one__21_q) begin 
       //i = 21
       if (op__21_q >= res__21_q + one__21_q) begin
           op__22 = op__21_q - res__21_q - one__21_q;
           res__22 = (res__21_q>>1) + one__21_q;
       end else begin
           op__22 = op__21_q;
           res__22 = (res__21_q>>1);
       end
       one__22 = (one__21_q >> 2);

       //i = 22
       if (op__22 >= res__22 + one__22) begin
           op__23 = op__22 - res__22 - one__22;
           res__23 = (res__22>>1) + one__22;
       end else begin
           op__23 = op__22;
           res__23 = (res__22>>1);
       end
       one__23 = (one__22 >> 2);

       //i = 23
       if (op__23 >= res__23 + one__23) begin
           op__24_d = op__23 - res__23 - one__23;
           res__24_d = (res__23>>1) + one__23;
       end else begin
           op__24_d = op__23;
           res__24_d = (res__23>>1);
       end
       one__24_d = (one__23 >> 2);
	end
		 
	always @ (posedge clk) begin
		op__24_q <= op__24_d;
		one__24_q <= one__24_d;
		res__24_q <= res__24_d;
	end
		  
	always @ (op__24_q or res__24_q or one__24_q) begin
       //i = 24
       if (op__24_q >= res__24_q + one__24_q) begin
           op__25 = op__24_q - res__24_q - one__24_q;
           res__25 = (res__24_q>>1) + one__24_q;
       end else begin
           op__25 = op__24_q;
           res__25 = (res__24_q>>1);
       end
       one__25 = (one__24_q >> 2);

       //i = 25
       if (op__25 >= res__25 + one__25) begin
           op__26 = op__25 - res__25 - one__25;
           res__26 = (res__25>>1) + one__25;
       end else begin
           op__26 = op__25;
           res__26 = (res__25>>1);
       end
       one__26 = (one__25 >> 2);

       //i = 26
       if (op__26 >= res__26 + one__26) begin
           op__27_d = op__26 - res__26 - one__26;
           res__27_d = (res__26>>1) + one__26;
       end else begin
           op__27_d = op__26;
           res__27_d = (res__26>>1);
       end
       one__27_d = (one__26 >> 2);
	end

	always @ (posedge clk) begin
		op__27_q <= op__27_d;
		one__27_q <= one__27_d;
		res__27_q <= res__27_d;
	end
	
	always @ (op__27_q or res__27_q or one__27_q) begin
       //i = 27
       if (op__27_q >= res__27_q + one__27_q) begin
           op__28 = op__27_q - res__27_q - one__27_q;
           res__28 = (res__27_q>>1) + one__27_q;
       end else begin
           op__28 = op__27_q;
           res__28 = (res__27_q>>1);
       end
       one__28 = (one__27_q >> 2);

       //i = 28
       if (op__28 >= res__28 + one__28) begin
           op__29 = op__28 - res__28 - one__28;
           res__29 = (res__28>>1) + one__28;
       end else begin
           op__29 = op__28;
           res__29 = (res__28>>1);
       end
       one__29 = (one__28 >> 2);

       //i = 29
       if (op__29 >= res__29 + one__29) begin
           op__30_d = op__29 - res__29 - one__29;
           res__30_d = (res__29>>1) + one__29;
       end else begin
           op__30_d = op__29;
           res__30_d = (res__29>>1);
       end
       one__30_d = (one__29 >> 2);
	end
	
	always @ (posedge clk) begin
		op__30_q <= op__30_d;
		one__30_q <= one__30_d;
		res__30_q <= res__30_d;
	end
	
	always @* begin
       //i = 30
       if (op__30_q >= res__30_q + one__30_q) begin
           op__31 = op__30_q - res__30_q - one__30_q;
           res__31 = (res__30_q>>1) + one__30_q;
       end else begin
           op__31 = op__30_q;
           res__31 = (res__30_q>>1);
       end
       one__31 = (one__30_q >> 2);

       //i = 31
       if (op__31 >= res__31 + one__31) begin
           op__32 = op__31 - res__31 - one__31;
           res__32 = (res__31>>1) + one__31;
       end else begin
           op__32 = op__31;
           res__32 = (res__31>>1);
       end
       one__32 = (one__31 >> 2);
	end


	//If-statement about assigning res:
	always @* begin
		if(one__0 == 0) begin
			res = res__0[31:0];
         end else if (one__1 == 0) begin
             res = res__1[31:0];
         end else if (one__2 == 0) begin
             res = res__2[31:0];
         end else if (one__3_q == 0) begin
             res = res__3_q[31:0];
         end else if (one__4 == 0) begin
             res = res__4[31:0];
         end else if (one__5 == 0) begin
             res = res__5[31:0];
         end else if (one__6 == 0) begin
             res = res__6[31:0];
         end else if (one__7_q == 0) begin
             res = res__7_q[31:0];
         end else if (one__8 == 0) begin
             res = res__8[31:0];
         end else if (one__9 == 0) begin
             res = res__9[31:0];
         end else if (one__10 == 0) begin
             res = res__10[31:0];
         end else if (one__11_q == 0) begin
             res = res__11_q[31:0];
         end else if (one__12 == 0) begin
             res = res__12[31:0];
         end else if (one__13 == 0) begin
             res = res__13[31:0];
         end else if (one__14 == 0) begin
             res = res__14[31:0];
         end else if (one__15_q == 0) begin
             res = res__15_q[31:0];
         end else if (one__16 == 0) begin
             res = res__16[31:0];
         end else if (one__17 == 0) begin
             res = res__17[31:0];
         end else if (one__18_q == 0) begin
             res = res__18_q[31:0];
         end else if (one__19 == 0) begin
             res = res__19[31:0];
         end else if (one__20 == 0) begin
             res = res__20[31:0];
         end else if (one__21_q == 0) begin
             res = res__21_q[31:0];
         end else if (one__22 == 0) begin
             res = res__22[31:0];
         end else if (one__23 == 0) begin
             res = res__23[31:0];
         end else if (one__24_q == 0) begin
             res = res__24_q[31:0];
         end else if (one__25 == 0) begin
             res = res__25[31:0];
         end else if (one__26 == 0) begin
             res = res__26[31:0];
         end else if (one__27_q == 0) begin
             res = res__27_q[31:0];
         end else if (one__28 == 0) begin
             res = res__28[31:0];
         end else if (one__29 == 0) begin
             res = res__29[31:0];
         end else if (one__30_q == 0) begin
             res = res__30_q[31:0];
         end else if (one__31 == 0) begin
             res = res__31[31:0];
		end else begin
			 res = res__32[31:0];
		end
		
	end

	
endmodule 	
