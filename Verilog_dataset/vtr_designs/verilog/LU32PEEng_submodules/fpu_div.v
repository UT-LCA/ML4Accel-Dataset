`define NWIDTH 6'b010100
`define BLOCKWIDTH 4'b0111
`define DDRWIDTH 7'b0100000
`define DDRNUMDQS 4'b0100
`define DDRSIZEWIDTH 6'b011000
`define BURSTLEN 3'b010
`define MEMCONWIDTH 8'b01000000
`define MEMCONNUMBYTES 5'b01000
`define RAMWIDTH 12'b010000000000
`define RAMNUMBYTES 9'b010000000
`define RAMSIZEWIDTH 4'b0111
`define TOPWIDTH 7'b0100000
`define rFIFOINPUTWIDTH 8'b01000000
`define wFIFOINPUTWIDTH 12'b010000000000
`define mFIFOWIDTH 6'b011100
`define aFIFOWIDTH 4'b0111
`define SIMULATION_MEMORY
`define BLOCKM 8'b01000000
`define BLOCKN 8'b01000000
`define BLOCKMDIVK 3'b010
`define MEMBLOCKM 7'b0100000
`define MEMBLOCKN 7'b0100000
`define NWIDTH 6'b010100
`define BLOCKWIDTH 4'b0111
`define DDRSIZEWIDTH 6'b011000
`define RAMSIZEWIDTH 4'b0111
`define START 1'b0 //0
`define SETUP 2'b01 //1
`define FIRST 3'b010 //2
`define MODE0_SETUP 3'b011 //3
`define MODE0_WAIT 4'b0100 //4
`define MODE0 4'b0101 //5
`define MODE1_SETUP 4'b0110 //6
`define MODE1_WAIT 4'b0111 //7
`define MODE1 5'b01000 //8
`define MODE2_SETUP 5'b01001 //9
`define MODE2_WAIT 5'b01010 //10
`define MODE2 5'b01011 //11
`define MODE3_SETUP 5'b01100 //12
`define MODE3_WAIT 5'b01101 //13
`define MODE3 5'b01110 //14
`define STALL 5'b01111 //15
`define STALL_WAIT 6'b010000 //16
`define WAIT 6'b010001 //17
`define FINAL_WRITE 6'b010010 //18
`define FINAL_WAIT 6'b010011 //19
`define IDLE 6'b010100 //20
`define LAST_SETUP 6'b010101 //21
`define LAST_SETUP_WAIT 6'b010110 //22
`define LAST 6'b010111 //23
`define LAST_WAIT 6'b011000 //24
`define MEM_IDLE 1'b0 //0
`define MEM_WRITE 2'b01 //1
`define MEM_WRITE_WAIT 3'b010 //2
`define MEM_CHECK_DONE 3'b011 //3
`define MEM_READ 4'b0100 //4
`define MEM_READ_WAIT 4'b0101 //5
`define MEM_DONE 4'b0110 //6
`define MEM_WAIT_DONE 4'b0111 //7
`define rRAMSIZEWIDTH 7
`define cSETUP 4'b0000
`define cSTART 4'b0001
`define cFETCH_COL 4'b0010
`define cWAIT_COL 4'b0011
`define cFIND_REC 4'b0100
`define cMULT_COL 4'b0101
`define cUPDATE_J 4'b0110
`define cSTORE_MO 4'b0111
`define cMULT_SUB 4'b1000
`define cINCRE_I 4'b1001
`define cWAIT 4'b1010
`define cDONE 4'b1011
`define cSTORE_DIAG 4'b1100
`define cSTORE_DIAG2 4'b1101
`define cSTART_FETCH_ROW 4'b1110
`define cROW_WAIT 2'b00
`define cFETCH_ROW 2'b01
`define cDONE_FETCH_ROW 2'b10
`define cLOAD_ROW_INC_J 2'b11
`define PRECISION 7'b0100000
`define NUMPE 7'b0100000
`define PEWIDTH 4'b0101
`define BLOCKWIDTH 4'b0111
`define RAMWIDTH 12'b010000000000
`define RAMNUMBYTES 9'b010000000
`define RAMSIZEWIDTH 4'b0111
`define TOPSIZEWIDTH 5'b01100
`define TOPINPUTDELAY 3'b011
`define TOPOUTPUTDELAY 2'b01
`define MEMINPUTDELAY 3'b010
`define MEMOUTPUTDELAY 2'b01
`define TOPWIDTH 7'b0100000
//`define rFIFOINPUTWIDTH 64
`define rFIFOSIZE 256
`define rFIFOSIZEWIDTH 8
`define rFIFOOUTPUTWIDTH 1024
`define rFIFORSIZEWIDTH 4
	`define wFIFOINPUTWIDTH 12'b010000000000
	`define wFIFOSIZE 6'b010000
	`define wFIFOSIZEWIDTH 4'b0100
	`define wFIFOOUTPUTWIDTH 8'b01000000
	`define wFIFORSIZEWIDTH 5'b01000
`define aFIFOSIZE 6'b010000
`define aFIFOSIZEWIDTH 4'b0100
`define aFIFOWIDTH 4'b0111
`define mFIFOSIZE 16
`define mFIFOSIZEWIDTH 4
//`define mFIFOWIDTH 28
`define BURSTLEN 3'b010
`define BURSTWIDTH 3'b010
`define DATAWIDTH 12'b010000000000
`define DATANUMBYTES 9'b010000000
`define MEMCONWIDTH 8'b01000000
`define MEMCONNUMBYTES 5'b01000
`define DDRSIZEWIDTH 6'b011000
`define FIFOSIZE 6'b010000
`define FIFOSIZEWIDTH 4'b0100
`define RAMWIDTH 12'b010000000000
`define RAMNUMBYTES 9'b010000000
`define RAMSIZEWIDTH 4'b0111
`define RATIO 6'b010000
`define RAMLAT 4'b0101
`define dIDLE 0
`define dWRITE 1
`define dREAD 2
`define ZERO        8'b00000000  
`define ONE         8'b00000001  
`define TWO         8'b00000010  
`define THREE 		  8'b00000011  
`define FOUR		  8'b00000100  
`define FIVE		  8'b00000101  
`define SIX         8'b00000110  
`define SEVEN       8'b00000111  
`define EIGHT       8'b00001000  
`define NINE        8'b00001001  
`define TEN         8'b00001010  
`define ELEVEN      8'b00001011  
`define TWELVE      8'b00001100  
`define THIRTEEN    8'b00001101  
`define FOURTEEN    8'b00001110  
`define FIFTEEN     8'b00001111  
`define SIXTEEN     8'b00010000  
`define SEVENTEEN   8'b00010001  
`define EIGHTEEN	  8'b00010010  
`define NINETEEN    8'b00010011  
`define TWENTY		  8'b00010100  
`define TWENTYONE   8'b00010101  
`define TWENTYTWO   8'b00010110  
`define TWENTYTHREE 8'b00010111  
`define TWENTYFOUR  8'b00011000  
`define WEXP	8  
`define WSIG	23  
`define WFLAG	5  
`define WCONTROL 5  
`define DIVZERO 	0  
`define INVALID 	1  
`define INEXACT 	2  
`define OVERFLOW 	3  
`define UNDERFLOW	4  
`define WIDTH 		32 	//(`WEXP + `WSIG + 1)  
`define PRODWIDTH	48 	//(2 * (`WSIG + 1))  
`define SHIFTWIDTH	96 	//(2 * `PRODWIDTH))  
`define WPRENORM	24	// `WSIG + 1  
`define WEXPSUM		10	// `WEXP + 2  
`define BIAS		127	// (2^(`WEXP)) - 1  
`define WSIGMINUS1	22	// `WSIG - 1, used for rounding  
`define WSHIFTAMT	5	// log2(`WSIG + 1) rounded up  
`define UNDERBIAS	192	// 3 * 2 ^ (`WEXP -2)  
`define OVERBIAS	-192	// -`UNDERBIAS  
`define	EXTRASIG	25		// `WSIG+2 this is the amount of precision needed so no  
`define	SHIFT		5		// # bits the max alignment shift will fit in (log2(`WSIG+2)  
`define	MAX_EXP		8'b11111110	// the maximum non-infinite exponent,  
`define	INF_EXP		8'b11111111	// Infinity exponent, `WEXP bits, all 1  
`define	MAX_SIG		23'b11111111111111111111111  
`define	WEXP_0		8'b0		// Exponent equals `WEXP'b0  
`define	WEXP_1		8'b1		// Exponent equals one `WEXP'b1  
`define	WSIG_0		23'b0		// Significand equals zero `WSIG'b0  
`define	WSIG_1		23'b1		// Significand equals one `WSIG'b1  
`define	EXTRASIG_0	25'b0		// All result bits for adder zero `EXTRASIG'b0  
`define	MAXSHIFT	24		// `WSIG + 1  
`define CONSTNAN	{9'b111111111,22'b0}  
`define CONSTZERO	31'b0  
`define CONSTINFINITY	{8'b11111111, 23'b0}  
`define CONSTLARGEST	{`MAX_EXP, `MAX_SIG}  
`define PRESHIFTZEROS  48'b0 // `PRODWIDTH'b0  

module fpu_div(clock, n, d, div);  
//n = numerator  
//d = denomenator  
//div = result  
	input clock;  
  
	input [31:0]n;  
	input [31:0]d;  
	output [31:0]div;  
	reg [31:0]div;  
	  
	//Store the mantissa and exponents separately. Introduce the latency of 1.  
	reg [7:0]n_exp;  
	reg [7:0]d_exp;  
	reg [23:0]n_man;  
	reg [23:0]d_man;  
	reg n_sign;  
	reg d_sign;  
	  
	wire [23:0]div_man;  
	reg [7:0]div_exp;  
	  
	always @ (posedge clock) begin  
		n_exp <= n[30:23];  
		d_exp <= d[30:23];  
		n_man <= {1'b1, n[22:0]};  
		d_man <= {1'b1, d[22:0]};  
		n_sign <= n[31];  
		d_sign <= d[31];  
	end  
	  
	//Find the exponent, store in div_exp.  
	always @ (n_exp or d_exp) begin  
		if (n_exp >= d_exp) begin  
			div_exp = 8'b01111111 + (n_exp - d_exp);  
		end else begin  
			div_exp = 8'b01111111 - (d_exp - n_exp);  
		end  
	end  
	  
	//Divide the mantissas, store in div_man.  
	div_24b divide(.numer(n_man), .denom(d_man), .res(div_man));  
	  
	//Store the result. Shift exponents appropriately. Store sign.  
	//Sign  
	always @ (n_sign or d_sign) begin  
		div[31] = n_sign ^ d_sign;  
	end  
	  
	//Mantissa and Exponent  
	always @ (div_man or div_exp) begin  
		if (div_man[23]) begin //do nothing  
			div[22:0] = div_man[22:0];  
			div[30:23] = div_exp;  
		  
		end else if (div_man[22]) begin //shift << by 1, subtract 1 from exponent. 
			div[22:0] = {div_man[21:0], 1'b0}; 
			div[30:23] = div_exp - 8'b00000001; 
 
		end else if (div_man[21]) begin //shift << by 2, subtract 2 from exponent. 
			div[22:0] = {div_man[20:0], 2'b0}; 
			div[30:23] = div_exp - 8'b00000010; 
 
		end else if (div_man[20]) begin //shift << by 3, subtract 3 from exponent. 
			div[22:0] = {div_man[19:0], 3'b0}; 
			div[30:23] = div_exp - 8'b00000011; 
 
		end else if (div_man[19]) begin //shift << by 4, subtract 4 from exponent. 
			div[22:0] = {div_man[18:0], 4'b0}; 
			div[30:23] = div_exp - 8'b00000100; 
 
		end else if (div_man[18]) begin //shift << by 5, subtract 5 from exponent. 
			div[22:0] = {div_man[17:0], 5'b0}; 
			div[30:23] = div_exp - 8'b00000101; 
 
		end else if (div_man[17]) begin //shift << by 6, subtract 6 from exponent. 
			div[22:0] = {div_man[16:0], 6'b0}; 
			div[30:23] = div_exp - 8'b00000110; 
 
		end else if (div_man[16]) begin //shift << by 7, subtract 7 from exponent. 
			div[22:0] = {div_man[15:0], 7'b0}; 
			div[30:23] = div_exp - 8'b00000111; 
 
		end else if (div_man[15]) begin //shift << by 8, subtract 8 from exponent. 
			div[22:0] = {div_man[14:0], 8'b0}; 
			div[30:23] = div_exp - 8'b00001000; 
 
		end else if (div_man[14]) begin //shift << by 9, subtract 9 from exponent. 
			div[22:0] = {div_man[13:0], 9'b0}; 
			div[30:23] = div_exp - 8'b00001001; 
 
		end else if (div_man[13]) begin //shift << by 10, subtract 10 from exponent. 
			div[22:0] = {div_man[12:0], 10'b0}; 
			div[30:23] = div_exp - 8'b00001010; 
 
		end else if (div_man[12]) begin //shift << by 11, subtract 11 from exponent. 
			div[22:0] = {div_man[11:0], 11'b0}; 
			div[30:23] = div_exp - 8'b00001011; 
 
		end else if (div_man[11]) begin //shift << by 12, subtract 12 from exponent. 
			div[22:0] = {div_man[10:0], 12'b0}; 
			div[30:23] = div_exp - 8'b00001100; 
 
		end else if (div_man[10]) begin //shift << by 13, subtract 13 from exponent. 
			div[22:0] = {div_man[9:0], 13'b0}; 
			div[30:23] = div_exp - 8'b00001101; 
 
		end else if (div_man[9]) begin //shift << by 14, subtract 14 from exponent. 
			div[22:0] = {div_man[8:0], 14'b0}; 
			div[30:23] = div_exp - 8'b00001110; 
 
		end else if (div_man[8]) begin //shift << by 15, subtract 15 from exponent. 
			div[22:0] = {div_man[7:0], 15'b0}; 
			div[30:23] = div_exp - 8'b00001111; 
 
		end else if (div_man[7]) begin //shift << by 16, subtract 16 from exponent. 
			div[22:0] = {div_man[6:0], 16'b0}; 
			div[30:23] = div_exp - 8'b00010000; 
 
		end else if (div_man[6]) begin //shift << by 17, subtract 17 from exponent. 
			div[22:0] = {div_man[5:0], 17'b0}; 
			div[30:23] = div_exp - 8'b00010001; 
 
		end else if (div_man[5]) begin //shift << by 18, subtract 18 from exponent. 
			div[22:0] = {div_man[4:0], 18'b0}; 
			div[30:23] = div_exp - 8'b00010010; 
 
		end else if (div_man[4]) begin //shift << by 19, subtract 19 from exponent. 
			div[22:0] = {div_man[3:0], 19'b0}; 
			div[30:23] = div_exp - 8'b00010011; 
 
		end else if (div_man[3]) begin //shift << by 20, subtract 20 from exponent. 
			div[22:0] = {div_man[2:0], 20'b0}; 
			div[30:23] = div_exp - 8'b00010100; 
 
		end else if (div_man[2]) begin //shift << by 21, subtract 21 from exponent. 
			div[22:0] = {div_man[1:0], 21'b0}; 
			div[30:23] = div_exp - 8'b00010101; 
 
		end else if (div_man[1]) begin //shift << by 22, subtract 22 from exponent. 
			div[22:0] = {div_man[0:0], 22'b0}; 
			div[30:23] = div_exp - 8'b00010110; 
  
		end else /*if (div_man[0])*/ begin //shift << by 23, subtract 23 from exponent. 
			div[22:0] = 23'b0; 
			div[30:23] = div_exp - 8'b00010111; 
		end 
  
	end  
	  
endmodule   
module div_24b(numer, denom, res);  
	//input clock;  
  
	input [23:0]numer;  
	input [23:0]denom;  
	output [23:0]res;  
	reg [23:0]res;  
	  
	//Pad with 23 zeros.  
	wire [46:0]denom_pad;  
	wire [46:0]numer23; 
	reg [46:0]numer22; 
	reg [46:0]numer21; 
	reg [46:0]numer20; 
	reg [46:0]numer19; 
	reg [46:0]numer18; 
	reg [46:0]numer17; 
	reg [46:0]numer16; 
	reg [46:0]numer15; 
	reg [46:0]numer14; 
	reg [46:0]numer13; 
	reg [46:0]numer12; 
	reg [46:0]numer11; 
	reg [46:0]numer10; 
	reg [46:0]numer9; 
	reg [46:0]numer8; 
	reg [46:0]numer7; 
	reg [46:0]numer6; 
	reg [46:0]numer5; 
	reg [46:0]numer4; 
	reg [46:0]numer3; 
	reg [46:0]numer2; 
	reg [46:0]numer1;  
	reg [46:0]numer0;  
	  
	//always @ (posedge clock) begin  
	assign denom_pad = {23'b0, denom};  
	assign numer23 = {numer, 23'b0};  
	// end  
	  
	//res[23]  
	always @ (denom_pad or numer23) begin  
	  
		if (denom_pad[23:0] <= numer23[46:23]) begin 
			res[23] = 1'b1; 
			numer22 = {numer23[46:23] - denom_pad[23:0], 23'b0}; 
		end else begin 
			res[23] = 1'b0; 
			numer22 = numer23; 
		end 
 
		if (denom_pad[24:0] <= numer22[46:22]) begin 
			res[22] = 1'b1; 
			numer21 = {numer22[46:22] - denom_pad[24:0], 22'b0}; 
		end else begin 
			res[22] = 1'b0; 
			numer21 = numer22; 
		end 
 
		if (denom_pad[25:0] <= numer21[46:21]) begin 
			res[21] = 1'b1; 
			numer20 = {numer21[46:21] - denom_pad[25:0], 21'b0}; 
		end else begin 
			res[21] = 1'b0; 
			numer20 = numer21; 
		end 
 
		if (denom_pad[26:0] <= numer20[46:20]) begin 
			res[20] = 1'b1; 
			numer19 = {numer20[46:20] - denom_pad[26:0], 20'b0}; 
		end else begin 
			res[20] = 1'b0; 
			numer19 = numer20; 
		end 
 
		if (denom_pad[27:0] <= numer19[46:19]) begin 
			res[19] = 1'b1; 
			numer18 = {numer19[46:19] - denom_pad[27:0], 19'b0}; 
		end else begin 
			res[19] = 1'b0; 
			numer18 = numer19; 
		end 
 
		if (denom_pad[28:0] <= numer18[46:18]) begin 
			res[18] = 1'b1; 
			numer17 = {numer18[46:18] - denom_pad[28:0], 18'b0}; 
		end else begin 
			res[18] = 1'b0; 
			numer17 = numer18; 
		end 
 
		if (denom_pad[29:0] <= numer17[46:17]) begin 
			res[17] = 1'b1; 
			numer16 = {numer17[46:17] - denom_pad[29:0], 17'b0}; 
		end else begin 
			res[17] = 1'b0; 
			numer16 = numer17; 
		end 
 
		if (denom_pad[30:0] <= numer16[46:16]) begin 
			res[16] = 1'b1; 
			numer15 = {numer16[46:16] - denom_pad[30:0], 16'b0}; 
		end else begin 
			res[16] = 1'b0; 
			numer15 = numer16; 
		end 
 
		if (denom_pad[31:0] <= numer15[46:15]) begin 
			res[15] = 1'b1; 
			numer14 = {numer15[46:15] - denom_pad[31:0], 15'b0}; 
		end else begin 
			res[15] = 1'b0; 
			numer14 = numer15; 
		end 
 
		if (denom_pad[32:0] <= numer14[46:14]) begin 
			res[14] = 1'b1; 
			numer13 = {numer14[46:14] - denom_pad[32:0], 14'b0}; 
		end else begin 
			res[14] = 1'b0; 
			numer13 = numer14; 
		end 
 
		if (denom_pad[33:0] <= numer13[46:13]) begin 
			res[13] = 1'b1; 
			numer12 = {numer13[46:13] - denom_pad[33:0], 13'b0}; 
		end else begin 
			res[13] = 1'b0; 
			numer12 = numer13; 
		end 
 
		if (denom_pad[34:0] <= numer12[46:12]) begin 
			res[12] = 1'b1; 
			numer11 = {numer12[46:12] - denom_pad[34:0], 12'b0}; 
		end else begin 
			res[12] = 1'b0; 
			numer11 = numer12; 
		end 
 
		if (denom_pad[35:0] <= numer11[46:11]) begin 
			res[11] = 1'b1; 
			numer10 = {numer11[46:11] - denom_pad[35:0], 11'b0}; 
		end else begin 
			res[11] = 1'b0; 
			numer10 = numer11; 
		end 
 
		if (denom_pad[36:0] <= numer10[46:10]) begin 
			res[10] = 1'b1; 
			numer9 = {numer10[46:10] - denom_pad[36:0], 10'b0}; 
		end else begin 
			res[10] = 1'b0; 
			numer9 = numer10; 
		end 
 
		if (denom_pad[37:0] <= numer9[46:9]) begin 
			res[9] = 1'b1; 
			numer8 = {numer9[46:9] - denom_pad[37:0], 9'b0}; 
		end else begin 
			res[9] = 1'b0; 
			numer8 = numer9; 
		end 
 
		if (denom_pad[38:0] <= numer8[46:8]) begin 
			res[8] = 1'b1; 
			numer7 = {numer8[46:8] - denom_pad[38:0], 8'b0}; 
		end else begin 
			res[8] = 1'b0; 
			numer7 = numer8; 
		end 
 
		if (denom_pad[39:0] <= numer7[46:7]) begin 
			res[7] = 1'b1; 
			numer6 = {numer7[46:7] - denom_pad[39:0], 7'b0}; 
		end else begin 
			res[7] = 1'b0; 
			numer6 = numer7; 
		end 
 
		if (denom_pad[40:0] <= numer6[46:6]) begin 
			res[6] = 1'b1; 
			numer5 = {numer6[46:6] - denom_pad[40:0], 6'b0}; 
		end else begin 
			res[6] = 1'b0; 
			numer5 = numer6; 
		end 
 
		if (denom_pad[41:0] <= numer5[46:5]) begin 
			res[5] = 1'b1; 
			numer4 = {numer5[46:5] - denom_pad[41:0], 5'b0}; 
		end else begin 
			res[5] = 1'b0; 
			numer4 = numer5; 
		end 
 
		if (denom_pad[42:0] <= numer4[46:4]) begin 
			res[4] = 1'b1; 
			numer3 = {numer4[46:4] - denom_pad[42:0], 4'b0}; 
		end else begin 
			res[4] = 1'b0; 
			numer3 = numer4; 
		end 
 
		if (denom_pad[43:0] <= numer3[46:3]) begin 
			res[3] = 1'b1; 
			numer2 = {numer3[46:3] - denom_pad[43:0], 3'b0}; 
		end else begin 
			res[3] = 1'b0; 
			numer2 = numer3; 
		end 
 
		if (denom_pad[44:0] <= numer2[46:2]) begin 
			res[2] = 1'b1; 
			numer1 = {numer2[46:2] - denom_pad[44:0], 2'b0}; 
		end else begin 
			res[2] = 1'b0; 
			numer1 = numer2; 
		end 
 
		if (denom_pad[45:0] <= numer1[46:1]) begin 
			res[1] = 1'b1; 
			numer0 = {numer1[46:1] - denom_pad[45:0], 1'b0}; 
		end else begin 
			res[1] = 1'b0; 
			numer0 = numer1; 
		end 
  
		if (denom_pad <= numer0) begin  
			res[0] = 1'b1;  
		end else begin  
			res[0] = 1'b0;  
		end 
  
	end  
	  
endmodule   
