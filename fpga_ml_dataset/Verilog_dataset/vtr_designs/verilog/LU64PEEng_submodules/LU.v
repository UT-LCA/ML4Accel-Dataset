`define NWIDTH 6'b010100
`define BLOCKWIDTH 5'b01000
`define DDRWIDTH 7'b0100000
`define DDRNUMDQS 4'b0100
`define DDRSIZEWIDTH 6'b011000
`define BURSTLEN 3'b010
`define MEMCONWIDTH 8'b01000000
`define MEMCONNUMBYTES 5'b01000
`define RAMWIDTH 13'b0100000000000
`define RAMNUMBYTES 10'b0100000000
`define RAMSIZEWIDTH 5'b01000
`define TOPWIDTH 7'b0100000
`define rFIFOINPUTWIDTH 8'b01000000
`define wFIFOINPUTWIDTH 13'b0100000000000
`define mFIFOWIDTH 6'b011100
`define aFIFOWIDTH 5'b01000
`define SIMULATION_MEMORY
`define BLOCKM 9'b010000000
`define BLOCKN 9'b010000000
`define BLOCKMDIVK 3'b010
`define MEMBLOCKM 8'b01000000
`define MEMBLOCKN 8'b01000000
`define NWIDTH 6'b010100
`define BLOCKWIDTH 5'b01000
`define DDRSIZEWIDTH 6'b011000
`define RAMSIZEWIDTH 5'b01000
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
`define rRAMSIZEWIDTH 8
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
`define NUMPE 8'b01000000
`define PEWIDTH 4'b0110
`define BLOCKWIDTH 5'b01000
`define RAMWIDTH 13'b0100000000000
`define RAMNUMBYTES 10'b0100000000
`define RAMSIZEWIDTH 5'b01000
`define TOPSIZEWIDTH 5'b01110
`define TOPINPUTDELAY 3'b011
`define TOPOUTPUTDELAY 2'b01
`define MEMINPUTDELAY 3'b010
`define MEMOUTPUTDELAY 2'b01
`define TOPWIDTH 7'b0100000
//`define rFIFOINPUTWIDTH 64
`define rFIFOSIZE 512
`define rFIFOSIZEWIDTH 9
`define rFIFOOUTPUTWIDTH 2048
`define rFIFORSIZEWIDTH 4
	`define wFIFOINPUTWIDTH 13'b0100000000000
	`define wFIFOSIZE 6'b010000
	`define wFIFOSIZEWIDTH 4'b0100
	`define wFIFOOUTPUTWIDTH 8'b01000000
	`define wFIFORSIZEWIDTH 5'b01001
`define aFIFOSIZE 6'b010000
`define aFIFOSIZEWIDTH 4'b0100
`define aFIFOWIDTH 5'b01000
`define mFIFOSIZE 16
`define mFIFOSIZEWIDTH 4
//`define mFIFOWIDTH 28
`define BURSTLEN 3'b010
`define BURSTWIDTH 3'b010
`define DATAWIDTH 13'b0100000000000
`define DATANUMBYTES 10'b0100000000
`define MEMCONWIDTH 8'b01000000
`define MEMCONNUMBYTES 5'b01000
`define DDRSIZEWIDTH 6'b011000
`define FIFOSIZE 6'b010000
`define FIFOSIZEWIDTH 4'b0100
`define RAMWIDTH 13'b0100000000000
`define RAMNUMBYTES 10'b0100000000
`define RAMSIZEWIDTH 5'b01000
`define RATIO 7'b0100000
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

module LU (clk, start, m, n, loop, mode, done, 
			curReadAddrMem, curReadDataMem, curWriteByteEnMem, curWriteDataMem, curWriteAddrMem, curWriteEnMem, curMemSel,
			leftWriteByteEnMem, leftWriteDataMem, leftWriteAddrMem, leftWriteEnMem, leftMemSel
);


input clk, start;
input[`BLOCKWIDTH-1:0] m, n, loop;
input[1:0] mode;
output done;
wire[`RAMWIDTH-1:0] curWriteData0, curWriteData1;
wire[`RAMSIZEWIDTH-1:0] curWriteAddr0, curReadAddr0, curWriteAddr1, curReadAddr1;
wire[`RAMWIDTH-1:0] curReadData0, curReadData1;
wire[`RAMNUMBYTES-1:0] curWriteByteEn0, curWriteByteEn1;
wire curWriteEn0, curWriteEn1;

input[`RAMWIDTH-1:0] curWriteDataMem;
output[`RAMWIDTH-1:0] curReadDataMem;
input[`RAMSIZEWIDTH-1:0] curWriteAddrMem, curReadAddrMem;
input[`RAMNUMBYTES-1:0] curWriteByteEnMem;
input curWriteEnMem;
input[`RAMWIDTH-1:0] leftWriteDataMem;
input[`RAMSIZEWIDTH-1:0] leftWriteAddrMem;
input[`RAMNUMBYTES-1:0] leftWriteByteEnMem;
input leftWriteEnMem;
input leftMemSel, curMemSel;

wire[`RAMWIDTH-1:0] curReadDataLU, curReadDataMem;
wire[`RAMWIDTH-1:0] curWriteDataLU, curWriteDataMem;
wire[`RAMSIZEWIDTH-1:0] curWriteAddrLU, curWriteAddrMem, curReadAddrLU, curReadAddrMem;
wire[`RAMNUMBYTES-1:0] curWriteByteEnLU, curWriteByteEnMem;
wire curWriteEnLU, curWriteEnMem;

reg[`RAMWIDTH-1:0] curReadData0Reg0;
reg[`RAMWIDTH-1:0] curReadData1Reg0;
reg[`RAMWIDTH-1:0] leftReadData0Reg0;
reg[`RAMWIDTH-1:0] leftReadData1Reg0;
reg[`RAMWIDTH-1:0] curWriteData0Reg0;
reg[`RAMWIDTH-1:0] curWriteData0Reg1;
reg[`RAMWIDTH-1:0] curWriteData1Reg0;
reg[`RAMWIDTH-1:0] curWriteData1Reg1;
reg[`RAMSIZEWIDTH-1:0] curWriteAddr0Reg0;
reg[`RAMSIZEWIDTH-1:0] curWriteAddr0Reg1;
reg[`RAMSIZEWIDTH-1:0] curReadAddr0Reg0;
reg[`RAMSIZEWIDTH-1:0] curReadAddr0Reg1;
reg[`RAMSIZEWIDTH-1:0] curWriteAddr1Reg0;
reg[`RAMSIZEWIDTH-1:0] curWriteAddr1Reg1;
reg[`RAMSIZEWIDTH-1:0] curReadAddr1Reg0;
reg[`RAMSIZEWIDTH-1:0] curReadAddr1Reg1;
reg[`RAMNUMBYTES-1:0] curWriteByteEn0Reg0;
reg[`RAMNUMBYTES-1:0] curWriteByteEn0Reg1;
reg[`RAMNUMBYTES-1:0] curWriteByteEn1Reg0;
reg[`RAMNUMBYTES-1:0] curWriteByteEn1Reg1;
reg curWriteEn0Reg0;
reg curWriteEn0Reg1;
reg curWriteEn1Reg0;
reg curWriteEn1Reg1;
reg[`RAMWIDTH-1:0] leftWriteData0Reg0;
reg[`RAMWIDTH-1:0] leftWriteData0Reg1;
reg[`RAMWIDTH-1:0] leftWriteData1Reg0;
reg[`RAMWIDTH-1:0] leftWriteData1Reg1;
reg[`RAMSIZEWIDTH-1:0] leftWriteAddr0Reg0;
reg[`RAMSIZEWIDTH-1:0] leftWriteAddr0Reg1;
reg[`RAMSIZEWIDTH-1:0] leftReadAddr0Reg0;
reg[`RAMSIZEWIDTH-1:0] leftReadAddr0Reg1;
reg[`RAMSIZEWIDTH-1:0] leftWriteAddr1Reg0;
reg[`RAMSIZEWIDTH-1:0] leftWriteAddr1Reg1;
reg[`RAMSIZEWIDTH-1:0] leftReadAddr1Reg0;
reg[`RAMSIZEWIDTH-1:0] leftReadAddr1Reg1;
reg[`RAMNUMBYTES-1:0] leftWriteByteEn0Reg0;
reg[`RAMNUMBYTES-1:0] leftWriteByteEn0Reg1;
reg[`RAMNUMBYTES-1:0] leftWriteByteEn1Reg0;
reg[`RAMNUMBYTES-1:0] leftWriteByteEn1Reg1;
reg leftWriteEn0Reg0;
reg leftWriteEn0Reg1;
reg leftWriteEn1Reg0;
reg leftWriteEn1Reg1;

reg[`PRECISION-1:0] multOperand;
reg[`PRECISION-1:0] diag;
wire[`PRECISION-1:0] recResult;
wire[`PRECISION-1:0] multA0;
wire[`PRECISION-1:0] multA1;
wire[`PRECISION-1:0] multA2;
wire[`PRECISION-1:0] multA3;
wire[`PRECISION-1:0] multA4;
wire[`PRECISION-1:0] multA5;
wire[`PRECISION-1:0] multA6;
wire[`PRECISION-1:0] multA7;
wire[`PRECISION-1:0] multA8;
wire[`PRECISION-1:0] multA9;
wire[`PRECISION-1:0] multA10;
wire[`PRECISION-1:0] multA11;
wire[`PRECISION-1:0] multA12;
wire[`PRECISION-1:0] multA13;
wire[`PRECISION-1:0] multA14;
wire[`PRECISION-1:0] multA15;
wire[`PRECISION-1:0] multA16;
wire[`PRECISION-1:0] multA17;
wire[`PRECISION-1:0] multA18;
wire[`PRECISION-1:0] multA19;
wire[`PRECISION-1:0] multA20;
wire[`PRECISION-1:0] multA21;
wire[`PRECISION-1:0] multA22;
wire[`PRECISION-1:0] multA23;
wire[`PRECISION-1:0] multA24;
wire[`PRECISION-1:0] multA25;
wire[`PRECISION-1:0] multA26;
wire[`PRECISION-1:0] multA27;
wire[`PRECISION-1:0] multA28;
wire[`PRECISION-1:0] multA29;
wire[`PRECISION-1:0] multA30;
wire[`PRECISION-1:0] multA31;
wire[`PRECISION-1:0] multA32;
wire[`PRECISION-1:0] multA33;
wire[`PRECISION-1:0] multA34;
wire[`PRECISION-1:0] multA35;
wire[`PRECISION-1:0] multA36;
wire[`PRECISION-1:0] multA37;
wire[`PRECISION-1:0] multA38;
wire[`PRECISION-1:0] multA39;
wire[`PRECISION-1:0] multA40;
wire[`PRECISION-1:0] multA41;
wire[`PRECISION-1:0] multA42;
wire[`PRECISION-1:0] multA43;
wire[`PRECISION-1:0] multA44;
wire[`PRECISION-1:0] multA45;
wire[`PRECISION-1:0] multA46;
wire[`PRECISION-1:0] multA47;
wire[`PRECISION-1:0] multA48;
wire[`PRECISION-1:0] multA49;
wire[`PRECISION-1:0] multA50;
wire[`PRECISION-1:0] multA51;
wire[`PRECISION-1:0] multA52;
wire[`PRECISION-1:0] multA53;
wire[`PRECISION-1:0] multA54;
wire[`PRECISION-1:0] multA55;
wire[`PRECISION-1:0] multA56;
wire[`PRECISION-1:0] multA57;
wire[`PRECISION-1:0] multA58;
wire[`PRECISION-1:0] multA59;
wire[`PRECISION-1:0] multA60;
wire[`PRECISION-1:0] multA61;
wire[`PRECISION-1:0] multA62;
wire[`PRECISION-1:0] multA63;
wire[`PRECISION-1:0] multResult0;
wire[`PRECISION-1:0] multResult1;
wire[`PRECISION-1:0] multResult2;
wire[`PRECISION-1:0] multResult3;
wire[`PRECISION-1:0] multResult4;
wire[`PRECISION-1:0] multResult5;
wire[`PRECISION-1:0] multResult6;
wire[`PRECISION-1:0] multResult7;
wire[`PRECISION-1:0] multResult8;
wire[`PRECISION-1:0] multResult9;
wire[`PRECISION-1:0] multResult10;
wire[`PRECISION-1:0] multResult11;
wire[`PRECISION-1:0] multResult12;
wire[`PRECISION-1:0] multResult13;
wire[`PRECISION-1:0] multResult14;
wire[`PRECISION-1:0] multResult15;
wire[`PRECISION-1:0] multResult16;
wire[`PRECISION-1:0] multResult17;
wire[`PRECISION-1:0] multResult18;
wire[`PRECISION-1:0] multResult19;
wire[`PRECISION-1:0] multResult20;
wire[`PRECISION-1:0] multResult21;
wire[`PRECISION-1:0] multResult22;
wire[`PRECISION-1:0] multResult23;
wire[`PRECISION-1:0] multResult24;
wire[`PRECISION-1:0] multResult25;
wire[`PRECISION-1:0] multResult26;
wire[`PRECISION-1:0] multResult27;
wire[`PRECISION-1:0] multResult28;
wire[`PRECISION-1:0] multResult29;
wire[`PRECISION-1:0] multResult30;
wire[`PRECISION-1:0] multResult31;
wire[`PRECISION-1:0] multResult32;
wire[`PRECISION-1:0] multResult33;
wire[`PRECISION-1:0] multResult34;
wire[`PRECISION-1:0] multResult35;
wire[`PRECISION-1:0] multResult36;
wire[`PRECISION-1:0] multResult37;
wire[`PRECISION-1:0] multResult38;
wire[`PRECISION-1:0] multResult39;
wire[`PRECISION-1:0] multResult40;
wire[`PRECISION-1:0] multResult41;
wire[`PRECISION-1:0] multResult42;
wire[`PRECISION-1:0] multResult43;
wire[`PRECISION-1:0] multResult44;
wire[`PRECISION-1:0] multResult45;
wire[`PRECISION-1:0] multResult46;
wire[`PRECISION-1:0] multResult47;
wire[`PRECISION-1:0] multResult48;
wire[`PRECISION-1:0] multResult49;
wire[`PRECISION-1:0] multResult50;
wire[`PRECISION-1:0] multResult51;
wire[`PRECISION-1:0] multResult52;
wire[`PRECISION-1:0] multResult53;
wire[`PRECISION-1:0] multResult54;
wire[`PRECISION-1:0] multResult55;
wire[`PRECISION-1:0] multResult56;
wire[`PRECISION-1:0] multResult57;
wire[`PRECISION-1:0] multResult58;
wire[`PRECISION-1:0] multResult59;
wire[`PRECISION-1:0] multResult60;
wire[`PRECISION-1:0] multResult61;
wire[`PRECISION-1:0] multResult62;
wire[`PRECISION-1:0] multResult63;
wire[`PRECISION-1:0] addA0;
wire[`PRECISION-1:0] addA1;
wire[`PRECISION-1:0] addA2;
wire[`PRECISION-1:0] addA3;
wire[`PRECISION-1:0] addA4;
wire[`PRECISION-1:0] addA5;
wire[`PRECISION-1:0] addA6;
wire[`PRECISION-1:0] addA7;
wire[`PRECISION-1:0] addA8;
wire[`PRECISION-1:0] addA9;
wire[`PRECISION-1:0] addA10;
wire[`PRECISION-1:0] addA11;
wire[`PRECISION-1:0] addA12;
wire[`PRECISION-1:0] addA13;
wire[`PRECISION-1:0] addA14;
wire[`PRECISION-1:0] addA15;
wire[`PRECISION-1:0] addA16;
wire[`PRECISION-1:0] addA17;
wire[`PRECISION-1:0] addA18;
wire[`PRECISION-1:0] addA19;
wire[`PRECISION-1:0] addA20;
wire[`PRECISION-1:0] addA21;
wire[`PRECISION-1:0] addA22;
wire[`PRECISION-1:0] addA23;
wire[`PRECISION-1:0] addA24;
wire[`PRECISION-1:0] addA25;
wire[`PRECISION-1:0] addA26;
wire[`PRECISION-1:0] addA27;
wire[`PRECISION-1:0] addA28;
wire[`PRECISION-1:0] addA29;
wire[`PRECISION-1:0] addA30;
wire[`PRECISION-1:0] addA31;
wire[`PRECISION-1:0] addA32;
wire[`PRECISION-1:0] addA33;
wire[`PRECISION-1:0] addA34;
wire[`PRECISION-1:0] addA35;
wire[`PRECISION-1:0] addA36;
wire[`PRECISION-1:0] addA37;
wire[`PRECISION-1:0] addA38;
wire[`PRECISION-1:0] addA39;
wire[`PRECISION-1:0] addA40;
wire[`PRECISION-1:0] addA41;
wire[`PRECISION-1:0] addA42;
wire[`PRECISION-1:0] addA43;
wire[`PRECISION-1:0] addA44;
wire[`PRECISION-1:0] addA45;
wire[`PRECISION-1:0] addA46;
wire[`PRECISION-1:0] addA47;
wire[`PRECISION-1:0] addA48;
wire[`PRECISION-1:0] addA49;
wire[`PRECISION-1:0] addA50;
wire[`PRECISION-1:0] addA51;
wire[`PRECISION-1:0] addA52;
wire[`PRECISION-1:0] addA53;
wire[`PRECISION-1:0] addA54;
wire[`PRECISION-1:0] addA55;
wire[`PRECISION-1:0] addA56;
wire[`PRECISION-1:0] addA57;
wire[`PRECISION-1:0] addA58;
wire[`PRECISION-1:0] addA59;
wire[`PRECISION-1:0] addA60;
wire[`PRECISION-1:0] addA61;
wire[`PRECISION-1:0] addA62;
wire[`PRECISION-1:0] addA63;
wire[`PRECISION-1:0] addResult0;
wire[`PRECISION-1:0] addResult1;
wire[`PRECISION-1:0] addResult2;
wire[`PRECISION-1:0] addResult3;
wire[`PRECISION-1:0] addResult4;
wire[`PRECISION-1:0] addResult5;
wire[`PRECISION-1:0] addResult6;
wire[`PRECISION-1:0] addResult7;
wire[`PRECISION-1:0] addResult8;
wire[`PRECISION-1:0] addResult9;
wire[`PRECISION-1:0] addResult10;
wire[`PRECISION-1:0] addResult11;
wire[`PRECISION-1:0] addResult12;
wire[`PRECISION-1:0] addResult13;
wire[`PRECISION-1:0] addResult14;
wire[`PRECISION-1:0] addResult15;
wire[`PRECISION-1:0] addResult16;
wire[`PRECISION-1:0] addResult17;
wire[`PRECISION-1:0] addResult18;
wire[`PRECISION-1:0] addResult19;
wire[`PRECISION-1:0] addResult20;
wire[`PRECISION-1:0] addResult21;
wire[`PRECISION-1:0] addResult22;
wire[`PRECISION-1:0] addResult23;
wire[`PRECISION-1:0] addResult24;
wire[`PRECISION-1:0] addResult25;
wire[`PRECISION-1:0] addResult26;
wire[`PRECISION-1:0] addResult27;
wire[`PRECISION-1:0] addResult28;
wire[`PRECISION-1:0] addResult29;
wire[`PRECISION-1:0] addResult30;
wire[`PRECISION-1:0] addResult31;
wire[`PRECISION-1:0] addResult32;
wire[`PRECISION-1:0] addResult33;
wire[`PRECISION-1:0] addResult34;
wire[`PRECISION-1:0] addResult35;
wire[`PRECISION-1:0] addResult36;
wire[`PRECISION-1:0] addResult37;
wire[`PRECISION-1:0] addResult38;
wire[`PRECISION-1:0] addResult39;
wire[`PRECISION-1:0] addResult40;
wire[`PRECISION-1:0] addResult41;
wire[`PRECISION-1:0] addResult42;
wire[`PRECISION-1:0] addResult43;
wire[`PRECISION-1:0] addResult44;
wire[`PRECISION-1:0] addResult45;
wire[`PRECISION-1:0] addResult46;
wire[`PRECISION-1:0] addResult47;
wire[`PRECISION-1:0] addResult48;
wire[`PRECISION-1:0] addResult49;
wire[`PRECISION-1:0] addResult50;
wire[`PRECISION-1:0] addResult51;
wire[`PRECISION-1:0] addResult52;
wire[`PRECISION-1:0] addResult53;
wire[`PRECISION-1:0] addResult54;
wire[`PRECISION-1:0] addResult55;
wire[`PRECISION-1:0] addResult56;
wire[`PRECISION-1:0] addResult57;
wire[`PRECISION-1:0] addResult58;
wire[`PRECISION-1:0] addResult59;
wire[`PRECISION-1:0] addResult60;
wire[`PRECISION-1:0] addResult61;
wire[`PRECISION-1:0] addResult62;
wire[`PRECISION-1:0] addResult63;
wire[`RAMWIDTH-1:0] leftReadData0, leftReadData1, leftWriteData0, leftWriteData1;
wire[`RAMSIZEWIDTH-1:0] leftWriteAddr0, leftWriteAddr1, leftReadAddr0, leftReadAddr1;
wire[`RAMNUMBYTES-1:0] leftWriteByteEn0, leftWriteByteEn1;
wire leftWriteEn0, leftWriteEn1;
wire[`RAMWIDTH-1:0] leftReadDataLU, leftWriteDataLU, leftWriteDataMem;
wire[`RAMSIZEWIDTH-1:0] leftWriteAddrLU, leftWriteAddrMem, leftReadAddrLU;
wire[`RAMNUMBYTES-1:0] leftWriteByteEnLU, leftWriteByteEnMem;
wire leftWriteEnLU, leftWriteEnMem;

wire[`PRECISION-1:0] topWriteData;
reg[`PRECISION-1:0] topWriteDataLU;
wire[`PRECISION-1:0] topReadData, topReadDataLU;
wire[`TOPSIZEWIDTH-1:0] topWriteAddr, topWriteAddrLU, topReadAddr, topReadAddrLU;
wire topWriteEn, topWriteEnLU;

reg[`PRECISION-1:0] topReadDataReg0;
reg[`PRECISION-1:0] topWriteDataReg0;
reg[`PRECISION-1:0] topWriteDataReg1;
reg[`PRECISION-1:0] topWriteDataReg2;
reg[`TOPSIZEWIDTH-1:0] topWriteAddrReg0;
reg[`TOPSIZEWIDTH-1:0] topWriteAddrReg1;
reg[`TOPSIZEWIDTH-1:0] topWriteAddrReg2;
reg[`TOPSIZEWIDTH-1:0] topReadAddrReg0;
reg[`TOPSIZEWIDTH-1:0] topReadAddrReg1;
reg[`TOPSIZEWIDTH-1:0] topReadAddrReg2;
reg topWriteEnReg0;
reg topWriteEnReg1;
reg topWriteEnReg2;
wire[`RAMWIDTH-1:0] rcWriteData;
wire leftWriteSel, curWriteSel, topSourceSel;
wire diagEn;
wire[`PEWIDTH-1:0] topWriteSel;

wire MOSel;
wire MOEn;

// control block
LUControl conBlock (clk, start, m, n, loop, mode, done, 
                    curReadAddrLU, curWriteAddrLU, curWriteByteEnLU, curWriteEnLU, curWriteSel,
                    leftReadAddrLU, leftWriteAddrLU, leftWriteByteEnLU, leftWriteEnLU,  leftWriteSel,
                    topReadAddrLU, topWriteAddrLU, topWriteEnLU, topWriteSel, topSourceSel, diagEn, MOSel, MOEn);

// fp_div unit
//floating point divider here
fpu_div rec(.clock(clk), .n(32'h3F800000), .d(diag), .div(recResult));
// on-chip memory blocks that store the matrix to be LU factorized
// store current blocks data
ram currentBlock0 (curWriteByteEn0, clk, curWriteData0, curReadAddr0, curWriteAddr0, curWriteEn0, curReadData0 );
ram1 currentBlock1 (curWriteByteEn1, clk, curWriteData1, curReadAddr1, curWriteAddr1, curWriteEn1, curReadData1 );
// store left blocks data
ram2 leftBlock0(leftWriteByteEn0, clk, leftWriteData0, leftReadAddr0, leftWriteAddr0, leftWriteEn0, leftReadData0 );

ram3 leftBlock1(leftWriteByteEn1, clk, leftWriteData1, leftReadAddr1, leftWriteAddr1, leftWriteEn1, leftReadData1 );

// store top block data
top_ram topBlock(clk, topWriteData, topReadAddr, topWriteAddr, topWriteEn, topReadDataLU );

// processing elements that does the main computation of LU factorization
mult_add PE0 (clk, multA0, multOperand, addA0, multResult0, addResult0);
mult_add PE1 (clk, multA1, multOperand, addA1, multResult1, addResult1);
mult_add PE2 (clk, multA2, multOperand, addA2, multResult2, addResult2);
mult_add PE3 (clk, multA3, multOperand, addA3, multResult3, addResult3);
mult_add PE4 (clk, multA4, multOperand, addA4, multResult4, addResult4);
mult_add PE5 (clk, multA5, multOperand, addA5, multResult5, addResult5);
mult_add PE6 (clk, multA6, multOperand, addA6, multResult6, addResult6);
mult_add PE7 (clk, multA7, multOperand, addA7, multResult7, addResult7);
mult_add PE8 (clk, multA8, multOperand, addA8, multResult8, addResult8);
mult_add PE9 (clk, multA9, multOperand, addA9, multResult9, addResult9);
mult_add PE10 (clk, multA10, multOperand, addA10, multResult10, addResult10);
mult_add PE11 (clk, multA11, multOperand, addA11, multResult11, addResult11);
mult_add PE12 (clk, multA12, multOperand, addA12, multResult12, addResult12);
mult_add PE13 (clk, multA13, multOperand, addA13, multResult13, addResult13);
mult_add PE14 (clk, multA14, multOperand, addA14, multResult14, addResult14);
mult_add PE15 (clk, multA15, multOperand, addA15, multResult15, addResult15);
mult_add PE16 (clk, multA16, multOperand, addA16, multResult16, addResult16);
mult_add PE17 (clk, multA17, multOperand, addA17, multResult17, addResult17);
mult_add PE18 (clk, multA18, multOperand, addA18, multResult18, addResult18);
mult_add PE19 (clk, multA19, multOperand, addA19, multResult19, addResult19);
mult_add PE20 (clk, multA20, multOperand, addA20, multResult20, addResult20);
mult_add PE21 (clk, multA21, multOperand, addA21, multResult21, addResult21);
mult_add PE22 (clk, multA22, multOperand, addA22, multResult22, addResult22);
mult_add PE23 (clk, multA23, multOperand, addA23, multResult23, addResult23);
mult_add PE24 (clk, multA24, multOperand, addA24, multResult24, addResult24);
mult_add PE25 (clk, multA25, multOperand, addA25, multResult25, addResult25);
mult_add PE26 (clk, multA26, multOperand, addA26, multResult26, addResult26);
mult_add PE27 (clk, multA27, multOperand, addA27, multResult27, addResult27);
mult_add PE28 (clk, multA28, multOperand, addA28, multResult28, addResult28);
mult_add PE29 (clk, multA29, multOperand, addA29, multResult29, addResult29);
mult_add PE30 (clk, multA30, multOperand, addA30, multResult30, addResult30);
mult_add PE31 (clk, multA31, multOperand, addA31, multResult31, addResult31);
mult_add PE32 (clk, multA32, multOperand, addA32, multResult32, addResult32);
mult_add PE33 (clk, multA33, multOperand, addA33, multResult33, addResult33);
mult_add PE34 (clk, multA34, multOperand, addA34, multResult34, addResult34);
mult_add PE35 (clk, multA35, multOperand, addA35, multResult35, addResult35);
mult_add PE36 (clk, multA36, multOperand, addA36, multResult36, addResult36);
mult_add PE37 (clk, multA37, multOperand, addA37, multResult37, addResult37);
mult_add PE38 (clk, multA38, multOperand, addA38, multResult38, addResult38);
mult_add PE39 (clk, multA39, multOperand, addA39, multResult39, addResult39);
mult_add PE40 (clk, multA40, multOperand, addA40, multResult40, addResult40);
mult_add PE41 (clk, multA41, multOperand, addA41, multResult41, addResult41);
mult_add PE42 (clk, multA42, multOperand, addA42, multResult42, addResult42);
mult_add PE43 (clk, multA43, multOperand, addA43, multResult43, addResult43);
mult_add PE44 (clk, multA44, multOperand, addA44, multResult44, addResult44);
mult_add PE45 (clk, multA45, multOperand, addA45, multResult45, addResult45);
mult_add PE46 (clk, multA46, multOperand, addA46, multResult46, addResult46);
mult_add PE47 (clk, multA47, multOperand, addA47, multResult47, addResult47);
mult_add PE48 (clk, multA48, multOperand, addA48, multResult48, addResult48);
mult_add PE49 (clk, multA49, multOperand, addA49, multResult49, addResult49);
mult_add PE50 (clk, multA50, multOperand, addA50, multResult50, addResult50);
mult_add PE51 (clk, multA51, multOperand, addA51, multResult51, addResult51);
mult_add PE52 (clk, multA52, multOperand, addA52, multResult52, addResult52);
mult_add PE53 (clk, multA53, multOperand, addA53, multResult53, addResult53);
mult_add PE54 (clk, multA54, multOperand, addA54, multResult54, addResult54);
mult_add PE55 (clk, multA55, multOperand, addA55, multResult55, addResult55);
mult_add PE56 (clk, multA56, multOperand, addA56, multResult56, addResult56);
mult_add PE57 (clk, multA57, multOperand, addA57, multResult57, addResult57);
mult_add PE58 (clk, multA58, multOperand, addA58, multResult58, addResult58);
mult_add PE59 (clk, multA59, multOperand, addA59, multResult59, addResult59);
mult_add PE60 (clk, multA60, multOperand, addA60, multResult60, addResult60);
mult_add PE61 (clk, multA61, multOperand, addA61, multResult61, addResult61);
mult_add PE62 (clk, multA62, multOperand, addA62, multResult62, addResult62);
mult_add PE63 (clk, multA63, multOperand, addA63, multResult63, addResult63);

// connect to ports of the left blocks
assign leftWriteDataLU = (leftWriteSel == 1'b0) ? curReadDataLU : rcWriteData;
always @ (posedge clk)
begin
	if(leftMemSel == 1'b0)
	begin
		leftWriteData0Reg0 <= leftWriteDataMem;
		leftWriteAddr0Reg0 <= leftWriteAddrMem;
		leftWriteByteEn0Reg0 <= leftWriteByteEnMem;
		leftWriteEn0Reg0 <= leftWriteEnMem;
		leftWriteData1Reg0 <= leftWriteDataLU;
		leftWriteAddr1Reg0 <= leftWriteAddrLU;
		leftWriteByteEn1Reg0 <= leftWriteByteEnLU;
		leftWriteEn1Reg0 <= leftWriteEnLU;
	end
	else
	begin
		leftWriteData0Reg0 <= leftWriteDataLU;
		leftWriteAddr0Reg0 <= leftWriteAddrLU;
		leftWriteByteEn0Reg0 <= leftWriteByteEnLU;
		leftWriteEn0Reg0 <= leftWriteEnLU;
		leftWriteData1Reg0 <= leftWriteDataMem;
		leftWriteAddr1Reg0 <= leftWriteAddrMem;
		leftWriteByteEn1Reg0 <= leftWriteByteEnMem;
		leftWriteEn1Reg0 <= leftWriteEnMem;
	end
	leftReadAddr0Reg0 <= leftReadAddrLU;
	leftReadAddr1Reg0 <= leftReadAddrLU;
	leftWriteData0Reg1 <= leftWriteData0Reg0;
	leftWriteAddr0Reg1 <= leftWriteAddr0Reg0;
	leftReadAddr0Reg1 <= leftReadAddr0Reg0;
	leftWriteByteEn0Reg1 <= leftWriteByteEn0Reg0;
	leftWriteEn0Reg1 <= leftWriteEn0Reg0;
	leftWriteData1Reg1 <= leftWriteData1Reg0;
	leftWriteAddr1Reg1 <= leftWriteAddr1Reg0;
	leftReadAddr1Reg1 <= leftReadAddr1Reg0;
	leftWriteByteEn1Reg1 <= leftWriteByteEn1Reg0;
	leftWriteEn1Reg1 <= leftWriteEn1Reg0;
end
assign leftWriteData0 = leftWriteData0Reg1;
assign leftWriteAddr0 = leftWriteAddr0Reg1;
assign leftReadAddr0 = leftReadAddr0Reg1;
assign leftWriteByteEn0 = leftWriteByteEn0Reg1;
assign leftWriteEn0 = leftWriteEn0Reg1;
assign leftWriteData1 = leftWriteData1Reg1;
assign leftWriteAddr1 = leftWriteAddr1Reg1;
assign leftReadAddr1 = leftReadAddr1Reg1;
assign leftWriteByteEn1 = leftWriteByteEn1Reg1;
assign leftWriteEn1 = leftWriteEn1Reg1;

always @ (posedge clk)
begin
		leftReadData0Reg0 <= leftReadData0;
		leftReadData1Reg0 <= leftReadData1;
end
assign leftReadDataLU = (leftMemSel == 1'b0) ? leftReadData1Reg0 : leftReadData0Reg0;
// data feed to fp div unit
always @ (posedge clk)
begin
	if (diagEn == 1'b1)
	begin
			diag <= topReadData;
	end
end
// one of the inputs to the PE
always @ (posedge clk)
begin
	if (start == 1'b1)
		multOperand <= 0;
	else if (MOEn == 1'b1)
	begin
		if (MOSel == 1'b0)
			multOperand <= recResult;
		else
			multOperand <= topReadData;
	end
end

// connections to top block memory ports
always @ (topSourceSel or topWriteSel or curReadDataLU or addResult63 or addResult62 or addResult61 or addResult60 or addResult59 or addResult58 or addResult57 or addResult56 or addResult55 or addResult54 or addResult53 or addResult52 or addResult51 or addResult50 or addResult49 or addResult48 or addResult47 or addResult46 or addResult45 or addResult44 or addResult43 or addResult42 or addResult41 or addResult40 or addResult39 or addResult38 or addResult37 or addResult36 or addResult35 or addResult34 or addResult33 or addResult32 or addResult31 or addResult30 or addResult29 or addResult28 or addResult27 or addResult26 or addResult25 or addResult24 or addResult23 or addResult22 or addResult21 or addResult20 or addResult19 or addResult18 or addResult17 or addResult16 or addResult15 or addResult14 or addResult13 or addResult12 or addResult11 or addResult10 or addResult9 or addResult8 or addResult7 or addResult6 or addResult5 or addResult4 or addResult3 or addResult2 or addResult1 or addResult0)
begin
	if (topSourceSel == 1'b0)
		case (topWriteSel)
		0:
			topWriteDataLU = curReadDataLU[2047:2016];
		1:
			topWriteDataLU = curReadDataLU[2015:1984];
		2:
			topWriteDataLU = curReadDataLU[1983:1952];
		3:
			topWriteDataLU = curReadDataLU[1951:1920];
		4:
			topWriteDataLU = curReadDataLU[1919:1888];
		5:
			topWriteDataLU = curReadDataLU[1887:1856];
		6:
			topWriteDataLU = curReadDataLU[1855:1824];
		7:
			topWriteDataLU = curReadDataLU[1823:1792];
		8:
			topWriteDataLU = curReadDataLU[1791:1760];
		9:
			topWriteDataLU = curReadDataLU[1759:1728];
		10:
			topWriteDataLU = curReadDataLU[1727:1696];
		11:
			topWriteDataLU = curReadDataLU[1695:1664];
		12:
			topWriteDataLU = curReadDataLU[1663:1632];
		13:
			topWriteDataLU = curReadDataLU[1631:1600];
		14:
			topWriteDataLU = curReadDataLU[1599:1568];
		15:
			topWriteDataLU = curReadDataLU[1567:1536];
		16:
			topWriteDataLU = curReadDataLU[1535:1504];
		17:
			topWriteDataLU = curReadDataLU[1503:1472];
		18:
			topWriteDataLU = curReadDataLU[1471:1440];
		19:
			topWriteDataLU = curReadDataLU[1439:1408];
		20:
			topWriteDataLU = curReadDataLU[1407:1376];
		21:
			topWriteDataLU = curReadDataLU[1375:1344];
		22:
			topWriteDataLU = curReadDataLU[1343:1312];
		23:
			topWriteDataLU = curReadDataLU[1311:1280];
		24:
			topWriteDataLU = curReadDataLU[1279:1248];
		25:
			topWriteDataLU = curReadDataLU[1247:1216];
		26:
			topWriteDataLU = curReadDataLU[1215:1184];
		27:
			topWriteDataLU = curReadDataLU[1183:1152];
		28:
			topWriteDataLU = curReadDataLU[1151:1120];
		29:
			topWriteDataLU = curReadDataLU[1119:1088];
		30:
			topWriteDataLU = curReadDataLU[1087:1056];
		31:
			topWriteDataLU = curReadDataLU[1055:1024];
		32:
			topWriteDataLU = curReadDataLU[1023:992];
		33:
			topWriteDataLU = curReadDataLU[991:960];
		34:
			topWriteDataLU = curReadDataLU[959:928];
		35:
			topWriteDataLU = curReadDataLU[927:896];
		36:
			topWriteDataLU = curReadDataLU[895:864];
		37:
			topWriteDataLU = curReadDataLU[863:832];
		38:
			topWriteDataLU = curReadDataLU[831:800];
		39:
			topWriteDataLU = curReadDataLU[799:768];
		40:
			topWriteDataLU = curReadDataLU[767:736];
		41:
			topWriteDataLU = curReadDataLU[735:704];
		42:
			topWriteDataLU = curReadDataLU[703:672];
		43:
			topWriteDataLU = curReadDataLU[671:640];
		44:
			topWriteDataLU = curReadDataLU[639:608];
		45:
			topWriteDataLU = curReadDataLU[607:576];
		46:
			topWriteDataLU = curReadDataLU[575:544];
		47:
			topWriteDataLU = curReadDataLU[543:512];
		48:
			topWriteDataLU = curReadDataLU[511:480];
		49:
			topWriteDataLU = curReadDataLU[479:448];
		50:
			topWriteDataLU = curReadDataLU[447:416];
		51:
			topWriteDataLU = curReadDataLU[415:384];
		52:
			topWriteDataLU = curReadDataLU[383:352];
		53:
			topWriteDataLU = curReadDataLU[351:320];
		54:
			topWriteDataLU = curReadDataLU[319:288];
		55:
			topWriteDataLU = curReadDataLU[287:256];
		56:
			topWriteDataLU = curReadDataLU[255:224];
		57:
			topWriteDataLU = curReadDataLU[223:192];
		58:
			topWriteDataLU = curReadDataLU[191:160];
		59:
			topWriteDataLU = curReadDataLU[159:128];
		60:
			topWriteDataLU = curReadDataLU[127:96];
		61:
			topWriteDataLU = curReadDataLU[95:64];
		62:
			topWriteDataLU = curReadDataLU[63:32];
		63:
			topWriteDataLU = curReadDataLU[31:0];
		default:
			topWriteDataLU = curReadDataLU[`PRECISION-1:0];
		endcase
	else
		case (topWriteSel)
		0:
			topWriteDataLU = addResult63;
		1:
			topWriteDataLU = addResult62;
		2:
			topWriteDataLU = addResult61;
		3:
			topWriteDataLU = addResult60;
		4:
			topWriteDataLU = addResult59;
		5:
			topWriteDataLU = addResult58;
		6:
			topWriteDataLU = addResult57;
		7:
			topWriteDataLU = addResult56;
		8:
			topWriteDataLU = addResult55;
		9:
			topWriteDataLU = addResult54;
		10:
			topWriteDataLU = addResult53;
		11:
			topWriteDataLU = addResult52;
		12:
			topWriteDataLU = addResult51;
		13:
			topWriteDataLU = addResult50;
		14:
			topWriteDataLU = addResult49;
		15:
			topWriteDataLU = addResult48;
		16:
			topWriteDataLU = addResult47;
		17:
			topWriteDataLU = addResult46;
		18:
			topWriteDataLU = addResult45;
		19:
			topWriteDataLU = addResult44;
		20:
			topWriteDataLU = addResult43;
		21:
			topWriteDataLU = addResult42;
		22:
			topWriteDataLU = addResult41;
		23:
			topWriteDataLU = addResult40;
		24:
			topWriteDataLU = addResult39;
		25:
			topWriteDataLU = addResult38;
		26:
			topWriteDataLU = addResult37;
		27:
			topWriteDataLU = addResult36;
		28:
			topWriteDataLU = addResult35;
		29:
			topWriteDataLU = addResult34;
		30:
			topWriteDataLU = addResult33;
		31:
			topWriteDataLU = addResult32;
		32:
			topWriteDataLU = addResult31;
		33:
			topWriteDataLU = addResult30;
		34:
			topWriteDataLU = addResult29;
		35:
			topWriteDataLU = addResult28;
		36:
			topWriteDataLU = addResult27;
		37:
			topWriteDataLU = addResult26;
		38:
			topWriteDataLU = addResult25;
		39:
			topWriteDataLU = addResult24;
		40:
			topWriteDataLU = addResult23;
		41:
			topWriteDataLU = addResult22;
		42:
			topWriteDataLU = addResult21;
		43:
			topWriteDataLU = addResult20;
		44:
			topWriteDataLU = addResult19;
		45:
			topWriteDataLU = addResult18;
		46:
			topWriteDataLU = addResult17;
		47:
			topWriteDataLU = addResult16;
		48:
			topWriteDataLU = addResult15;
		49:
			topWriteDataLU = addResult14;
		50:
			topWriteDataLU = addResult13;
		51:
			topWriteDataLU = addResult12;
		52:
			topWriteDataLU = addResult11;
		53:
			topWriteDataLU = addResult10;
		54:
			topWriteDataLU = addResult9;
		55:
			topWriteDataLU = addResult8;
		56:
			topWriteDataLU = addResult7;
		57:
			topWriteDataLU = addResult6;
		58:
			topWriteDataLU = addResult5;
		59:
			topWriteDataLU = addResult4;
		60:
			topWriteDataLU = addResult3;
		61:
			topWriteDataLU = addResult2;
		62:
			topWriteDataLU = addResult1;
		63:
			topWriteDataLU = addResult0;
		default:
			topWriteDataLU = addResult0;
		endcase
end

always @ (posedge clk)
begin
	topWriteDataReg0 <= topWriteDataLU;
	topReadAddrReg0 <= topReadAddrLU;
	topWriteAddrReg0 <= topWriteAddrLU;
	topWriteEnReg0 <= topWriteEnLU;
	topWriteDataReg1 <= topWriteDataReg0;
	topReadAddrReg1 <= topReadAddrReg0;
	topWriteAddrReg1 <= topWriteAddrReg0;
	topWriteEnReg1 <= topWriteEnReg0;
	topWriteDataReg2 <= topWriteDataReg1;
	topReadAddrReg2 <= topReadAddrReg1;
	topWriteAddrReg2 <= topWriteAddrReg1;
	topWriteEnReg2 <= topWriteEnReg1;
end
assign topWriteData = topWriteDataReg2;
assign topReadAddr = topReadAddrReg2;
assign topWriteAddr = topWriteAddrReg2;
assign topWriteEn = topWriteEnReg2;
always @ (posedge clk)
begin
	topReadDataReg0 <= topReadDataLU;
end
assign topReadData = topReadDataReg0;

// connections to processing element
assign multA0 = leftReadDataLU[31:0];
assign multA1 = leftReadDataLU[63:32];
assign multA2 = leftReadDataLU[95:64];
assign multA3 = leftReadDataLU[127:96];
assign multA4 = leftReadDataLU[159:128];
assign multA5 = leftReadDataLU[191:160];
assign multA6 = leftReadDataLU[223:192];
assign multA7 = leftReadDataLU[255:224];
assign multA8 = leftReadDataLU[287:256];
assign multA9 = leftReadDataLU[319:288];
assign multA10 = leftReadDataLU[351:320];
assign multA11 = leftReadDataLU[383:352];
assign multA12 = leftReadDataLU[415:384];
assign multA13 = leftReadDataLU[447:416];
assign multA14 = leftReadDataLU[479:448];
assign multA15 = leftReadDataLU[511:480];
assign multA16 = leftReadDataLU[543:512];
assign multA17 = leftReadDataLU[575:544];
assign multA18 = leftReadDataLU[607:576];
assign multA19 = leftReadDataLU[639:608];
assign multA20 = leftReadDataLU[671:640];
assign multA21 = leftReadDataLU[703:672];
assign multA22 = leftReadDataLU[735:704];
assign multA23 = leftReadDataLU[767:736];
assign multA24 = leftReadDataLU[799:768];
assign multA25 = leftReadDataLU[831:800];
assign multA26 = leftReadDataLU[863:832];
assign multA27 = leftReadDataLU[895:864];
assign multA28 = leftReadDataLU[927:896];
assign multA29 = leftReadDataLU[959:928];
assign multA30 = leftReadDataLU[991:960];
assign multA31 = leftReadDataLU[1023:992];
assign multA32 = leftReadDataLU[1055:1024];
assign multA33 = leftReadDataLU[1087:1056];
assign multA34 = leftReadDataLU[1119:1088];
assign multA35 = leftReadDataLU[1151:1120];
assign multA36 = leftReadDataLU[1183:1152];
assign multA37 = leftReadDataLU[1215:1184];
assign multA38 = leftReadDataLU[1247:1216];
assign multA39 = leftReadDataLU[1279:1248];
assign multA40 = leftReadDataLU[1311:1280];
assign multA41 = leftReadDataLU[1343:1312];
assign multA42 = leftReadDataLU[1375:1344];
assign multA43 = leftReadDataLU[1407:1376];
assign multA44 = leftReadDataLU[1439:1408];
assign multA45 = leftReadDataLU[1471:1440];
assign multA46 = leftReadDataLU[1503:1472];
assign multA47 = leftReadDataLU[1535:1504];
assign multA48 = leftReadDataLU[1567:1536];
assign multA49 = leftReadDataLU[1599:1568];
assign multA50 = leftReadDataLU[1631:1600];
assign multA51 = leftReadDataLU[1663:1632];
assign multA52 = leftReadDataLU[1695:1664];
assign multA53 = leftReadDataLU[1727:1696];
assign multA54 = leftReadDataLU[1759:1728];
assign multA55 = leftReadDataLU[1791:1760];
assign multA56 = leftReadDataLU[1823:1792];
assign multA57 = leftReadDataLU[1855:1824];
assign multA58 = leftReadDataLU[1887:1856];
assign multA59 = leftReadDataLU[1919:1888];
assign multA60 = leftReadDataLU[1951:1920];
assign multA61 = leftReadDataLU[1983:1952];
assign multA62 = leftReadDataLU[2015:1984];
assign multA63 = leftReadDataLU[2047:2016];

assign addA0 = curReadDataLU[31:0];
assign addA1 = curReadDataLU[63:32];
assign addA2 = curReadDataLU[95:64];
assign addA3 = curReadDataLU[127:96];
assign addA4 = curReadDataLU[159:128];
assign addA5 = curReadDataLU[191:160];
assign addA6 = curReadDataLU[223:192];
assign addA7 = curReadDataLU[255:224];
assign addA8 = curReadDataLU[287:256];
assign addA9 = curReadDataLU[319:288];
assign addA10 = curReadDataLU[351:320];
assign addA11 = curReadDataLU[383:352];
assign addA12 = curReadDataLU[415:384];
assign addA13 = curReadDataLU[447:416];
assign addA14 = curReadDataLU[479:448];
assign addA15 = curReadDataLU[511:480];
assign addA16 = curReadDataLU[543:512];
assign addA17 = curReadDataLU[575:544];
assign addA18 = curReadDataLU[607:576];
assign addA19 = curReadDataLU[639:608];
assign addA20 = curReadDataLU[671:640];
assign addA21 = curReadDataLU[703:672];
assign addA22 = curReadDataLU[735:704];
assign addA23 = curReadDataLU[767:736];
assign addA24 = curReadDataLU[799:768];
assign addA25 = curReadDataLU[831:800];
assign addA26 = curReadDataLU[863:832];
assign addA27 = curReadDataLU[895:864];
assign addA28 = curReadDataLU[927:896];
assign addA29 = curReadDataLU[959:928];
assign addA30 = curReadDataLU[991:960];
assign addA31 = curReadDataLU[1023:992];
assign addA32 = curReadDataLU[1055:1024];
assign addA33 = curReadDataLU[1087:1056];
assign addA34 = curReadDataLU[1119:1088];
assign addA35 = curReadDataLU[1151:1120];
assign addA36 = curReadDataLU[1183:1152];
assign addA37 = curReadDataLU[1215:1184];
assign addA38 = curReadDataLU[1247:1216];
assign addA39 = curReadDataLU[1279:1248];
assign addA40 = curReadDataLU[1311:1280];
assign addA41 = curReadDataLU[1343:1312];
assign addA42 = curReadDataLU[1375:1344];
assign addA43 = curReadDataLU[1407:1376];
assign addA44 = curReadDataLU[1439:1408];
assign addA45 = curReadDataLU[1471:1440];
assign addA46 = curReadDataLU[1503:1472];
assign addA47 = curReadDataLU[1535:1504];
assign addA48 = curReadDataLU[1567:1536];
assign addA49 = curReadDataLU[1599:1568];
assign addA50 = curReadDataLU[1631:1600];
assign addA51 = curReadDataLU[1663:1632];
assign addA52 = curReadDataLU[1695:1664];
assign addA53 = curReadDataLU[1727:1696];
assign addA54 = curReadDataLU[1759:1728];
assign addA55 = curReadDataLU[1791:1760];
assign addA56 = curReadDataLU[1823:1792];
assign addA57 = curReadDataLU[1855:1824];
assign addA58 = curReadDataLU[1887:1856];
assign addA59 = curReadDataLU[1919:1888];
assign addA60 = curReadDataLU[1951:1920];
assign addA61 = curReadDataLU[1983:1952];
assign addA62 = curReadDataLU[2015:1984];
assign addA63 = curReadDataLU[2047:2016];

// connections to ports of the current blocks
assign rcWriteData[31:0] = (curWriteSel == 0) ? multResult0 : addResult0;
assign rcWriteData[63:32] = (curWriteSel == 0) ? multResult1 : addResult1;
assign rcWriteData[95:64] = (curWriteSel == 0) ? multResult2 : addResult2;
assign rcWriteData[127:96] = (curWriteSel == 0) ? multResult3 : addResult3;
assign rcWriteData[159:128] = (curWriteSel == 0) ? multResult4 : addResult4;
assign rcWriteData[191:160] = (curWriteSel == 0) ? multResult5 : addResult5;
assign rcWriteData[223:192] = (curWriteSel == 0) ? multResult6 : addResult6;
assign rcWriteData[255:224] = (curWriteSel == 0) ? multResult7 : addResult7;
assign rcWriteData[287:256] = (curWriteSel == 0) ? multResult8 : addResult8;
assign rcWriteData[319:288] = (curWriteSel == 0) ? multResult9 : addResult9;
assign rcWriteData[351:320] = (curWriteSel == 0) ? multResult10 : addResult10;
assign rcWriteData[383:352] = (curWriteSel == 0) ? multResult11 : addResult11;
assign rcWriteData[415:384] = (curWriteSel == 0) ? multResult12 : addResult12;
assign rcWriteData[447:416] = (curWriteSel == 0) ? multResult13 : addResult13;
assign rcWriteData[479:448] = (curWriteSel == 0) ? multResult14 : addResult14;
assign rcWriteData[511:480] = (curWriteSel == 0) ? multResult15 : addResult15;
assign rcWriteData[543:512] = (curWriteSel == 0) ? multResult16 : addResult16;
assign rcWriteData[575:544] = (curWriteSel == 0) ? multResult17 : addResult17;
assign rcWriteData[607:576] = (curWriteSel == 0) ? multResult18 : addResult18;
assign rcWriteData[639:608] = (curWriteSel == 0) ? multResult19 : addResult19;
assign rcWriteData[671:640] = (curWriteSel == 0) ? multResult20 : addResult20;
assign rcWriteData[703:672] = (curWriteSel == 0) ? multResult21 : addResult21;
assign rcWriteData[735:704] = (curWriteSel == 0) ? multResult22 : addResult22;
assign rcWriteData[767:736] = (curWriteSel == 0) ? multResult23 : addResult23;
assign rcWriteData[799:768] = (curWriteSel == 0) ? multResult24 : addResult24;
assign rcWriteData[831:800] = (curWriteSel == 0) ? multResult25 : addResult25;
assign rcWriteData[863:832] = (curWriteSel == 0) ? multResult26 : addResult26;
assign rcWriteData[895:864] = (curWriteSel == 0) ? multResult27 : addResult27;
assign rcWriteData[927:896] = (curWriteSel == 0) ? multResult28 : addResult28;
assign rcWriteData[959:928] = (curWriteSel == 0) ? multResult29 : addResult29;
assign rcWriteData[991:960] = (curWriteSel == 0) ? multResult30 : addResult30;
assign rcWriteData[1023:992] = (curWriteSel == 0) ? multResult31 : addResult31;
assign rcWriteData[1055:1024] = (curWriteSel == 0) ? multResult32 : addResult32;
assign rcWriteData[1087:1056] = (curWriteSel == 0) ? multResult33 : addResult33;
assign rcWriteData[1119:1088] = (curWriteSel == 0) ? multResult34 : addResult34;
assign rcWriteData[1151:1120] = (curWriteSel == 0) ? multResult35 : addResult35;
assign rcWriteData[1183:1152] = (curWriteSel == 0) ? multResult36 : addResult36;
assign rcWriteData[1215:1184] = (curWriteSel == 0) ? multResult37 : addResult37;
assign rcWriteData[1247:1216] = (curWriteSel == 0) ? multResult38 : addResult38;
assign rcWriteData[1279:1248] = (curWriteSel == 0) ? multResult39 : addResult39;
assign rcWriteData[1311:1280] = (curWriteSel == 0) ? multResult40 : addResult40;
assign rcWriteData[1343:1312] = (curWriteSel == 0) ? multResult41 : addResult41;
assign rcWriteData[1375:1344] = (curWriteSel == 0) ? multResult42 : addResult42;
assign rcWriteData[1407:1376] = (curWriteSel == 0) ? multResult43 : addResult43;
assign rcWriteData[1439:1408] = (curWriteSel == 0) ? multResult44 : addResult44;
assign rcWriteData[1471:1440] = (curWriteSel == 0) ? multResult45 : addResult45;
assign rcWriteData[1503:1472] = (curWriteSel == 0) ? multResult46 : addResult46;
assign rcWriteData[1535:1504] = (curWriteSel == 0) ? multResult47 : addResult47;
assign rcWriteData[1567:1536] = (curWriteSel == 0) ? multResult48 : addResult48;
assign rcWriteData[1599:1568] = (curWriteSel == 0) ? multResult49 : addResult49;
assign rcWriteData[1631:1600] = (curWriteSel == 0) ? multResult50 : addResult50;
assign rcWriteData[1663:1632] = (curWriteSel == 0) ? multResult51 : addResult51;
assign rcWriteData[1695:1664] = (curWriteSel == 0) ? multResult52 : addResult52;
assign rcWriteData[1727:1696] = (curWriteSel == 0) ? multResult53 : addResult53;
assign rcWriteData[1759:1728] = (curWriteSel == 0) ? multResult54 : addResult54;
assign rcWriteData[1791:1760] = (curWriteSel == 0) ? multResult55 : addResult55;
assign rcWriteData[1823:1792] = (curWriteSel == 0) ? multResult56 : addResult56;
assign rcWriteData[1855:1824] = (curWriteSel == 0) ? multResult57 : addResult57;
assign rcWriteData[1887:1856] = (curWriteSel == 0) ? multResult58 : addResult58;
assign rcWriteData[1919:1888] = (curWriteSel == 0) ? multResult59 : addResult59;
assign rcWriteData[1951:1920] = (curWriteSel == 0) ? multResult60 : addResult60;
assign rcWriteData[1983:1952] = (curWriteSel == 0) ? multResult61 : addResult61;
assign rcWriteData[2015:1984] = (curWriteSel == 0) ? multResult62 : addResult62;
assign rcWriteData[2047:2016] = (curWriteSel == 0) ? multResult63 : addResult63;
assign curWriteDataLU = rcWriteData;

always @ (posedge clk)
begin
	if(curMemSel == 1'b0)
	begin
		curWriteData0Reg0 <= curWriteDataMem;
		curWriteAddr0Reg0 <= curWriteAddrMem;
		curReadAddr0Reg0 <= curReadAddrMem;
		curWriteByteEn0Reg0 <= curWriteByteEnMem;
		curWriteEn0Reg0 <= curWriteEnMem;
		curWriteData1Reg0 <= curWriteDataLU;
		curWriteAddr1Reg0 <= curWriteAddrLU;
		curReadAddr1Reg0 <= curReadAddrLU;
		curWriteByteEn1Reg0 <= curWriteByteEnLU;
		curWriteEn1Reg0 <= curWriteEnLU;
	end
	else
	begin
		curWriteData0Reg0 <= curWriteDataLU;
		curWriteAddr0Reg0 <= curWriteAddrLU;
		curReadAddr0Reg0 <= curReadAddrLU;
		curWriteByteEn0Reg0 <= curWriteByteEnLU;
		curWriteEn0Reg0 <= curWriteEnLU;
		curWriteData1Reg0 <= curWriteDataMem;
		curWriteAddr1Reg0 <= curWriteAddrMem;
		curReadAddr1Reg0 <= curReadAddrMem;
		curWriteByteEn1Reg0 <= curWriteByteEnMem;
		curWriteEn1Reg0 <= curWriteEnMem;
	end
	curWriteData0Reg1 <= curWriteData0Reg0;
	curWriteAddr0Reg1 <= curWriteAddr0Reg0;
	curReadAddr0Reg1 <= curReadAddr0Reg0;
	curWriteByteEn0Reg1 <= curWriteByteEn0Reg0;
	curWriteEn0Reg1 <= curWriteEn0Reg0;
	curWriteData1Reg1 <= curWriteData1Reg0;
	curWriteAddr1Reg1 <= curWriteAddr1Reg0;
	curReadAddr1Reg1 <= curReadAddr1Reg0;
	curWriteByteEn1Reg1 <= curWriteByteEn1Reg0;
	curWriteEn1Reg1 <= curWriteEn1Reg0;
end
assign curWriteData0 = curWriteData0Reg1;
assign curWriteAddr0 = curWriteAddr0Reg1;
assign curReadAddr0 = curReadAddr0Reg1;
assign curWriteByteEn0 = curWriteByteEn0Reg1;
assign curWriteEn0 = curWriteEn0Reg1;
assign curWriteData1 = curWriteData1Reg1;
assign curWriteAddr1 = curWriteAddr1Reg1;
assign curReadAddr1 = curReadAddr1Reg1;
assign curWriteByteEn1 = curWriteByteEn1Reg1;
assign curWriteEn1 = curWriteEn1Reg1;

always @ (posedge clk)
begin
		curReadData0Reg0 <= curReadData0;
		curReadData1Reg0 <= curReadData1;
end
assign curReadDataMem = (curMemSel == 0) ? curReadData0Reg0 : curReadData1Reg0;
assign curReadDataLU = (curMemSel == 0) ? curReadData1Reg0 : curReadData0Reg0;
endmodule
module mult_add (clk, A, B, C, mult_result, add_result);
//parameter PRECISION = 32;
input clk;
input [32-1:0] A, B, C;
output [32-1:0] mult_result, add_result;
reg [32-1:0] mult_result;
reg [32-1:0] add_result;
wire [32-1:0] mult_comp_result;
reg [32-1:0] add_a, add_b;
wire [32-1:0] addition_result;
wire [31:0] dummy_wire;
assign dummy_wire = mult_comp_result>>2'b10;
//divsp MUL(.clk(clk), .rmode(2'b00), .fpu_op(3'b010), .opa(A), .opb(B), .ans(mult_comp_result) );
wire [4:0]dummy_wire_2;
fpmul MUL(.clk(clk), .a(A), .b(B), .y_out(mult_comp_result), .control(2'b00), .flags(dummy_wire_2));
fpu_add ADD(.clock(clk), .a1(C), .b1(dummy_wire), .sum(addition_result));
always @ (posedge clk)
begin
	add_result  <= addition_result;
	mult_result <= mult_comp_result[31:0];
end
endmodule
module fpu_add (clock, a1, b1, sum);  
	input clock;  
	input [31:0]a1;  
	input [31:0]b1;  
	output [31:0]sum;  
	reg [31:0]sum;  
	  
	//Split up the numbers into exponents and mantissa.  
	reg [7:0]a_exp; 
	//reg [7:0]b_exp;  
	reg [23:0]a_man; 
	reg [23:0]b_man; 
  
	reg [7:0]temp;  
	  
	reg [24:0]sum_man;  
	//reg [7:0]sum_exp;  
	  
	//introduce latency on inputs  
	reg [31:0]a;  
	reg [31:0]b;  
	  
	always @ (posedge clock) begin  
		a <= a1;  
		b <= b1;  
	end  
	  
	reg smaller; //smaller is 1 if a < b, 0 otherwise  
	  
	//Shift mantissa's to have the same exponent  
	always @ (a or b) begin  
		//a_exp = a[30:23];  
		//b_exp = b[30:23];  
		//a_man = {1'b1, a[22:0]};  
	   //b_man = {1'b1, b[22:0]};  
		  
		if (a[30:23] < b[30:23]) begin  
			temp = b[30:23] - a[30:23];  
			//a_man = {1'b1, a[22:0]} >> temp; //Expand into case statement, as below.  
			case (temp)   
				`ONE: begin  
					a_man = {1'b1, a[22:0]} >> `ONE;  
				end  
				`TWO: begin  
					a_man = {1'b1, a[22:0]} >> `TWO;  
				end  
				`THREE: begin  
					a_man = {1'b1, a[22:0]} >> `THREE;  
				end  
				`FOUR: begin  
					a_man = {1'b1, a[22:0]} >> `FOUR;  
				end  
				`FIVE: begin  
					a_man = {1'b1, a[22:0]} >> `FIVE;  
				end  
				`SIX: begin  
					a_man = {1'b1, a[22:0]} >> `SIX;  
				end  
				`SEVEN: begin  
					a_man = {1'b1, a[22:0]} >> `SEVEN;  
				end  
				`EIGHT: begin  
					a_man = {1'b1, a[22:0]} >> `EIGHT;  
				end  
				`NINE: begin  
					a_man = {1'b1, a[22:0]} >> `NINE;  
				end  
				`TEN: begin  
					a_man = {1'b1, a[22:0]} >> `TEN;  
				end  
				`ELEVEN: begin  
					a_man = {1'b1, a[22:0]} >> `ELEVEN;  
				end  
				`TWELVE: begin  
					a_man = {1'b1, a[22:0]} >> `TWELVE;  
				end  
				`THIRTEEN: begin  
					a_man = {1'b1, a[22:0]} >> `THIRTEEN;  
				end  
				`FOURTEEN: begin  
					a_man = {1'b1, a[22:0]} >> `FOURTEEN;  
				end  
				`FIFTEEN: begin  
					a_man = {1'b1, a[22:0]} >> `FIFTEEN;  
				end  
				`SIXTEEN: begin  
					a_man = {1'b1, a[22:0]} >> `SIXTEEN;  
				end  
				`SEVENTEEN: begin  
					a_man = {1'b1, a[22:0]} >> `SEVENTEEN;  
				end  
				`EIGHTEEN: begin  
					a_man = {1'b1, a[22:0]} >> `EIGHTEEN;  
				end  
				`NINETEEN: begin  
					a_man = {1'b1, a[22:0]} >> `NINETEEN;  
				end  
				`TWENTY: begin  
					a_man = {1'b1, a[22:0]} >> `TWENTY;  
				end  
				`TWENTYONE: begin  
					a_man = {1'b1, a[22:0]} >> `TWENTYONE;  
				end  
				`TWENTYTWO: begin  
					a_man = {1'b1, a[22:0]} >> `TWENTYTWO;  
				end  
				`TWENTYTHREE: begin  
					a_man = {1'b1, a[22:0]} >> `TWENTYTHREE;  
				end  
				`TWENTYFOUR: begin  
					a_man = {1'b1, a[22:0]} >> `TWENTYFOUR;  
				end  
				default: begin //More than twenty-four, shift by twenty-four. It is a boundary case.  
					a_man = {1'b1, a[22:0]} >> `TWENTYFOUR;  
				end  
			endcase   
				  
			b_man = {1'b1, b[22:0]};  
			a_exp = b[30:23];  
			//b_exp = b[30:23];  
			  
		end else if (a[30:23] > b[30:23]) begin  
			temp = a[30:23] - b[30:23];  
			a_man = {1'b1, a[22:0]};  
			//b_man = {1'b1, b[22:0]} >> temp; //Expand into case statement, as below.  
			case (temp)   
				`ONE: begin  
					b_man = {1'b1, b[22:0]} >> `ONE;  
				end  
				`TWO: begin  
					b_man = {1'b1, b[22:0]} >> `TWO;  
				end  
				`THREE: begin  
					b_man = {1'b1, b[22:0]} >> `THREE;  
				end  
				`FOUR: begin  
					b_man = {1'b1, b[22:0]} >> `FOUR;  
				end  
				`FIVE: begin  
					b_man = {1'b1, b[22:0]} >> `FIVE;  
				end  
				`SIX: begin  
					b_man = {1'b1, b[22:0]} >> `SIX;  
				end  
				`SEVEN: begin  
					b_man = {1'b1, b[22:0]} >> `SEVEN;  
				end  
				`EIGHT: begin  
					b_man = {1'b1, b[22:0]} >> `EIGHT;  
				end  
				`NINE: begin  
					b_man = {1'b1, b[22:0]} >> `NINE;  
				end  
				`TEN: begin  
					b_man = {1'b1, b[22:0]} >> `TEN;  
				end  
				`ELEVEN: begin  
					b_man = {1'b1, b[22:0]} >> `ELEVEN;  
				end  
				`TWELVE: begin  
					b_man = {1'b1, b[22:0]} >> `TWELVE;  
				end  
				`THIRTEEN: begin  
					b_man = {1'b1, b[22:0]} >> `THIRTEEN;  
				end  
				`FOURTEEN: begin  
					b_man = {1'b1, b[22:0]} >> `FOURTEEN;  
				end  
				`FIFTEEN: begin  
					b_man = {1'b1, b[22:0]} >> `FIFTEEN;  
				end  
				`SIXTEEN: begin  
					b_man = {1'b1, b[22:0]} >> `SIXTEEN;  
				end  
				`SEVENTEEN: begin  
					b_man = {1'b1, b[22:0]} >> `SEVENTEEN;  
				end  
				`EIGHTEEN: begin  
					b_man = {1'b1, b[22:0]} >> `EIGHTEEN;  
				end  
				`NINETEEN: begin  
					b_man = {1'b1, b[22:0]} >> `NINETEEN;  
				end  
				`TWENTY: begin  
					b_man = {1'b1, b[22:0]} >> `TWENTY;  
				end  
				`TWENTYONE: begin  
					b_man = {1'b1, b[22:0]} >> `TWENTYONE;  
				end  
				`TWENTYTWO: begin  
					b_man = {1'b1, b[22:0]} >> `TWENTYTWO;  
				end  
				`TWENTYTHREE: begin  
					b_man = {1'b1, b[22:0]} >> `TWENTYTHREE;  
				end  
				`TWENTYFOUR: begin  
					b_man = {1'b1, b[22:0]} >> `TWENTYFOUR;  
				end  
				default: begin //More than twenty-four, shift by twenty-four. It is a boundary case.  
					b_man = {1'b1, b[22:0]} >> `TWENTYFOUR;  
				end  
			endcase   
			  
			a_exp = a[30:23];  
			//b_exp = a[30:23];  
		end else begin  
			temp = 8'b0;  
			a_man = {1'b1, a[22:0]};  
			b_man = {1'b1, b[22:0]};  
			a_exp = a[30:23];  
		end  
		  
	end  
  
	//Perform the addition operation  
	always @ (a_man or b_man or a or b) begin  
		if (a_man < b_man) begin  
			smaller = 1'b1;  
		end else begin  
			smaller = 1'b0;  
		end  
	  
		//both positive  
		if (~a[31] && ~b[31]) begin  
			sum_man = a_man + b_man;  
			sum[31] = 1'b0;  
		end   
		  
		//both negative  
		else if (a[31] && b[31]) begin  
			sum_man = a_man + b_man;  
			sum[31] = 1'b1;  
		end  
		  
		//a pos, b neg  
		else if (~a[31] && b[31]) begin  
			if (smaller) begin //a < b  
				sum_man = b_man - a_man;  
				sum[31] = 1'b1;  
			end else begin  
				sum_man = a_man - b_man;  
				sum[31] = 1'b0;  
			end  
		end  
		  
		//a neg, b pos  
		else /*if (a[31] && ~b[31])*/ begin  
			if (smaller) begin //a < b  
				sum_man = b_man - a_man;  
				sum[31] = 1'b0;  
			end else begin  
				sum_man = a_man - b_man;  
				sum[31] = 1'b1;  
			end  
		end  
	end  
	  
	//Store the number  
	// we already have the sign.  
	  
	always @ (sum_man or a_exp) begin  
		if (sum_man[24])begin //shif sum >> by 1, add 1 to the exponent.  
			sum[22:0] = sum_man[23:1];  
			sum[30:23] = a_exp + 8'b00000001;  
			  
		end else if (sum_man[23]) begin //do nothing  
			sum[22:0] = sum_man[22:0];  
			sum[30:23] = a_exp;  
			  
		end else if (sum_man[22]) begin //shift << by 1, subtract 1 from exponent. 
			sum[22:0] = {sum_man[21:0], 1'b0}; 
			sum[30:23] = a_exp - 8'b00000001; 
 
		end else if (sum_man[21]) begin //shift << by 2, subtract 2 from exponent. 
			sum[22:0] = {sum_man[20:0], 2'b0}; 
			sum[30:23] = a_exp - 8'b00000010; 
 
		end else if (sum_man[20]) begin //shift << by 3, subtract 3 from exponent. 
			sum[22:0] = {sum_man[19:0], 3'b0}; 
			sum[30:23] = a_exp - 8'b00000011; 
 
		end else if (sum_man[19]) begin //shift << by 4, subtract 4 from exponent. 
			sum[22:0] = {sum_man[18:0], 4'b0}; 
			sum[30:23] = a_exp - 8'b00000100; 
 
		end else if (sum_man[18]) begin //shift << by 5, subtract 5 from exponent. 
			sum[22:0] = {sum_man[17:0], 5'b0}; 
			sum[30:23] = a_exp - 8'b00000101; 
 
		end else if (sum_man[17]) begin //shift << by 6, subtract 6 from exponent. 
			sum[22:0] = {sum_man[16:0], 6'b0}; 
			sum[30:23] = a_exp - 8'b00000110; 
 
		end else if (sum_man[16]) begin //shift << by 7, subtract 7 from exponent. 
			sum[22:0] = {sum_man[15:0], 7'b0}; 
			sum[30:23] = a_exp - 8'b00000111; 
 
		end else if (sum_man[15]) begin //shift << by 8, subtract 8 from exponent. 
			sum[22:0] = {sum_man[14:0], 8'b0}; 
			sum[30:23] = a_exp - 8'b00001000; 
 
		end else if (sum_man[14]) begin //shift << by 9, subtract 9 from exponent. 
			sum[22:0] = {sum_man[13:0], 9'b0}; 
			sum[30:23] = a_exp - 8'b00001001; 
 
		end else if (sum_man[13]) begin //shift << by 10, subtract 10 from exponent. 
			sum[22:0] = {sum_man[12:0], 10'b0}; 
			sum[30:23] = a_exp - 8'b00001010; 
 
		end else if (sum_man[12]) begin //shift << by 11, subtract 11 from exponent. 
			sum[22:0] = {sum_man[11:0], 11'b0}; 
			sum[30:23] = a_exp - 8'b00001011; 
 
		end else if (sum_man[11]) begin //shift << by 12, subtract 12 from exponent. 
			sum[22:0] = {sum_man[10:0], 12'b0}; 
			sum[30:23] = a_exp - 8'b00001100; 
 
		end else if (sum_man[10]) begin //shift << by 13, subtract 13 from exponent. 
			sum[22:0] = {sum_man[9:0], 13'b0}; 
			sum[30:23] = a_exp - 8'b00001101; 
 
		end else if (sum_man[9]) begin //shift << by 14, subtract 14 from exponent. 
			sum[22:0] = {sum_man[8:0], 14'b0}; 
			sum[30:23] = a_exp - 8'b00001110; 
 
		end else if (sum_man[8]) begin //shift << by 15, subtract 15 from exponent. 
			sum[22:0] = {sum_man[7:0], 15'b0}; 
			sum[30:23] = a_exp - 8'b00001111; 
 
		end else if (sum_man[7]) begin //shift << by 16, subtract 16 from exponent. 
			sum[22:0] = {sum_man[6:0], 16'b0}; 
			sum[30:23] = a_exp - 8'b00010000; 
 
		end else if (sum_man[6]) begin //shift << by 17, subtract 17 from exponent. 
			sum[22:0] = {sum_man[5:0], 17'b0}; 
			sum[30:23] = a_exp - 8'b00010001; 
 
		end else if (sum_man[5]) begin //shift << by 18, subtract 18 from exponent. 
			sum[22:0] = {sum_man[4:0], 18'b0}; 
			sum[30:23] = a_exp - 8'b00010010; 
 
		end else if (sum_man[4]) begin //shift << by 19, subtract 19 from exponent. 
			sum[22:0] = {sum_man[3:0], 19'b0}; 
			sum[30:23] = a_exp - 8'b00010011; 
 
		end else if (sum_man[3]) begin //shift << by 20, subtract 20 from exponent. 
			sum[22:0] = {sum_man[2:0], 20'b0}; 
			sum[30:23] = a_exp - 8'b00010100; 
 
		end else if (sum_man[2]) begin //shift << by 21, subtract 21 from exponent. 
			sum[22:0] = {sum_man[1:0], 21'b0}; 
			sum[30:23] = a_exp - 8'b00010101; 
 
		end else if (sum_man[1]) begin //shift << by 22, subtract 22 from exponent. 
			sum[22:0] = {sum_man[0:0], 22'b0}; 
			sum[30:23] = a_exp - 8'b00010110; 
 
		end else /*if (sum_man[0])*/ begin //shift << by 23, subtract 23 from exponent. 
			sum[22:0] = 23'b0; 
			sum[30:23] = a_exp - 8'b00010111;  
		end 
		  
	end  
  
endmodule   
module fpmul(clk, a, b, y_out, control, flags) ; 
	  
	input clk;  
	 
  // external signals 
  input	 [`WIDTH-1:0] 	a, b;		// floating-point inputs 
  output [`WIDTH-1:0] 	y_out;		// floating-point product 
  reg [`WIDTH-1:0] y_out; 
  input  [1:0] control;	// control including rounding mode 
  output [`WFLAG-1:0]	flags;		// DIVZERO, INVALID, INEXACT,  
					// OVERFLOW, UNDERFLOW (defined in constant.v) 
 
	//intermediate y_out 
	wire [`WIDTH-1:0]y; 
					 
  // internal signals 
  wire			multsign;	// sign of product 
  wire			specialsign;	// sign of special 
 
  wire  [`WSIG:0] 	norma;		// normal-form mantissa a, 1 bit larger to hold leading 1 
  wire  [`WSIG:0] 	normb;		// normal-form mantissa b, 1 bit larger to hold leading 1 
 
  wire	[`WEXPSUM-1:0]	expa, expb;	// the two exponents, after prenormalization 
  wire	[`WEXPSUM-1:0] 	expsum;		// sum of exponents (two's complement) 
  wire	[`WEXPSUM-1:0] 	shiftexp;	// shifted exponent 
  wire	[`WEXP-1:0] 	roundexp;	// rounded, correct exponent 
 
  wire	[`PRODWIDTH-1:0] prod;		// product of mantissae 
  wire	[`PRODWIDTH-1:0] normalized;	// Normalized product 
  wire	[`SHIFTWIDTH-1:0] shiftprod;	// shifted product 
  wire	[`WSIG-1:0]	roundprod;	// rounded product 
  wire	[`WIDTH-2:0]	special;	// special case exponent and product 
 
  wire			twoormore;	// product is outside range [1,2) 
  wire			zero;		// zero detected 
  wire			infinity;	// infinity detected 
  wire			aisnan;		// NaN detected in A 
  wire			bisnan;		// NaN detected in B 
  wire			aisdenorm;	// Denormalized number detected in A 
  wire			bisdenorm;	// Denormalized number detected in B 
  wire			specialcase;	// This is a special case 
  wire			specialsigncase; // Use the special case sign 
  wire			roundoverflow;	// overflow in rounding, need to add 1 to exponent 
  wire			invalid;	// invalid operation 
  wire			overflow;	// exponent result too high, standard overflow 
  wire			inexact;	// inexact flag 
  wire			shiftloss;	// lost digits due to a shift, result inaccurate 
  wire	[1:0]		roundmode;	// rounding mode information extracted from control field   
  wire			tiny;		// Result is tiny (denormalized #) after multiplication 
  wire			stilltiny;	// Result is tiny (denormalized #) after rounding 
  wire			denormround;	// rounding occured only because the initial result was 
					//	a denormalized number. This is used to determine 
					//	underflow in cases of denormalized numbers rounding 
					//	up to normalized numbers 
 
  preprocess	preprocesser(a, b, zero, aisnan, bisnan,  
				aisdenorm, bisdenorm, infinity,  
				control, roundmode, sign);   
 
  special	specialer(a, b, special, specialsign, zero,  
				aisnan, bisnan,  
				infinity, invalid,  
				specialcase, specialsigncase); 
   
  prenorm	prenormer(a[`WIDTH-2:0], b[`WIDTH-2:0], norma, normb, expa, expb, aisdenorm, bisdenorm); 
 
  multiply_a	multiplier(norma, normb, prod, twoormore); 
 
  exponent	exponenter(expa, expb, expsum, twoormore, tiny); 
 
  normalize	normalizer(prod, normalized, tiny, twoormore);   
 
  shift		shifter(normalized, expsum, shiftprod,  
			shiftexp, shiftloss); 
 
  round		rounder(shiftprod, shiftexp, shiftloss, 
			roundprod, roundexp,  
			roundmode, sign, tiny, inexact,  
			overflow, stilltiny, denormround); 
 
		// *** To check for tininess before rounding, use tiny 
		//	To check after rounding, use stilltiny 
		// *** for underflow detect: 
		//	To check for inexact result use (inexact | (shiftloss & stilltiny)),  
		//	To check for denormilization loss use (shiftloss & stilltiny) 
//  flag		flager(invalid, overflow, inexact | shiftloss,  
//			shiftloss | inexact, 
//			/* tiny */ (stilltiny | (tiny & denormround)),  
//			specialcase, flags);  
			  
  //ODIN cannot have operations in module instantiations.  
  wire inexact_or_shiftloss;  
  assign inexact_or_shiftloss = inexact | shiftloss;  
  wire shiftloss_or_inexact;  
  assign shiftloss_or_inexact = shiftloss | inexact;  
  wire still_tiny_or_tiny_and_denormround;  
  assign still_tiny_or_tiny_and_denormround = stilltiny | (tiny & denormround);  
  
    flag		flager(invalid, overflow, inexact_or_shiftloss,  
			shiftloss_or_inexact, 
			/* tiny */ still_tiny_or_tiny_and_denormround,  
			specialcase, flags);  
	  
 
  assemble	assembler(roundprod, special, y,  
			sign, specialsign, roundexp,  
			specialcase, specialsigncase, 
			roundmode, flags[`OVERFLOW]); 
			 
	always @ (posedge clk) begin 
		y_out <= y; 
	end 
 
endmodule  
module assemble(roundprod, special, y, sign, specialsign,  
		shiftexp, specialcase, specialsigncase, 
		roundmode, overflow); 
 
  // external signals 
  input	[`WSIG-1:0] 	roundprod;	// shifted, rounded and normalized  
					// 	product of mantissae 
  input	[`WIDTH-2:0]	special;	// special case product + exponent 
  output [`WIDTH-1:0] 	y;		// floating-point product 
  input			sign;		// sign of product (+ = 0, - = 1) 
  input			specialsign;	// special case sign 
  input	[`WEXP-1:0] 	shiftexp;	// shifted exponent 
  input			specialcase;	// this is a special case 
  input			specialsigncase; // use the special case sign 
  input	[1:0]		roundmode;	// rounding mode information extracted from control field   
  input			overflow;	// overflow detected 
   
  // internal signals 
  wire	[`WIDTH-2:0]	rounded;	// final product + exponent 
  wire	[`WIDTH-2:0]	overflowvalue;	// product + exponent for overflow condition 
  wire			undenormed;	// the result was denormalized before rounding, but rounding  
					//	caused it to become a small normalized number. 
 
  // SET UP ROUNDED PRODUCT + EXPONENT 
   
  // assign significand 
  assign rounded[`WSIG-1:0]	= roundprod; 
 
  // assign exponent 
  assign rounded[`WIDTH-2:`WIDTH-`WEXP-1] = shiftexp; 
 
  // SET UP OVERFLOW CONDITION 
  assign overflowvalue[`WIDTH-2:0] = roundmode[1] ?  
				(sign ^ roundmode[0] ? `CONSTLARGEST : `CONSTINFINITY) : 
				(roundmode[0] ? `CONSTLARGEST: `CONSTINFINITY); 
 
  // FINAL PRODUCT ASSIGN  
 
  // assign sign 
  assign y[`WIDTH-1]	= specialsigncase ? specialsign : sign; 
 
  // assign product vs special vs overflowed 
  assign y[`WIDTH-2:0]	= specialcase ? special[`WIDTH-2:0] : 
				(overflow ? overflowvalue[`WIDTH-2:0] : 
				rounded[`WIDTH-2:0]); 
 
endmodule 
module flag (invalid, overflow, inexact, underflow, tiny, specialcase, flags); 
 
  input			invalid;	// invalid operation 
  input			overflow;	// the result was too large 
  input			inexact;	// The result was rounded 
  input			specialcase;	// Using special result, shouldn't throw flags 
  input			underflow;	// Underflow detected 
  input			tiny;		// The result is tiny 
 
  output [`WFLAG-1:0]	flags;		// DIVZERO, INVALID, INEXACT,  
					// OVERFLOW, UNDERFLOW (defined in constant.v) 
 
  // flags 
  assign flags[`DIVZERO]	= 1'b0; 
  assign flags[`INVALID]	= invalid; 
  assign flags[`INEXACT]	= ~specialcase & (inexact | underflow | overflow); 
  assign flags[`OVERFLOW]	= ~specialcase & overflow; 
  assign flags[`UNDERFLOW]	= tiny; //~specialcase & tiny & underflow & ~overflow; 
 
endmodule  
module round(shiftprod, shiftexp, shiftloss, roundprod, roundexp, roundmode,  
		sign, tiny, inexact, overflow, stilltiny, denormround); 
 
  // external signals 
  input	[`SHIFTWIDTH-1:0] shiftprod;	// normalized and shifted product of mantissae 
  input [`WEXPSUM-1:0]	shiftexp;	// shifted exponent 
  input			shiftloss;	// bits were lost in the shifting process 
  output [`WSIG-1:0] 	roundprod;	// rounded floating-point product 
  output [`WEXP-1:0] 	roundexp;	// rounded exponent 
  input  [1:0] 		roundmode;	// 00 = RN; 01 = RZ; 10 = RP; 11 = RM 
  input			sign;		// sign bit for rounding mode direction 
  input			tiny;		// denormalized number after rounding 
  output		inexact;	// rounding occured 
  output		overflow;	// overflow occured 
  output		stilltiny;	// Result is tiny (denormalized #) after rounding 
  output		denormround;	// result was rounded only because it was a denormalized number 
 
  // internal signals 
  wire			roundzero;	// rounding towards zero 
  wire			roundinf;	// rounding towards infinity 
  wire 			stickybit;	// there one or more 1 bits in the LS bits 
  wire			denormsticky;	// sticky bit if this weren't a denorm 
  wire [`WSIG-1:0] 	MSBits;		// most significant bits 
  wire [`WSIG:0] 	MSBitsplus1; 	// most significant bits plus 1 
					//	for rounding purposes. needs to be one 
					//	bit bigger for overflow 
  wire [1:0]		roundbits;	// bits used to compute rounding decision 
  wire 			rounddecision;	// round up 
  wire			roundoverflow;	// rounding overflow occured 
  wire [`WEXPSUM-1:0]	tempexp;	// exponent after rounding 
 
  //reduce round mode to three modes 
  //	dont need round nearest, it is implied 
  //	by roundzero and roundinf being false 
  //assign roundnearest 	= ~&roundmode; 
//  assign roundzero	= &roundmode || (^roundmode && (roundmode[0] || sign)); 
  assign roundzero	= (~roundmode[1] & roundmode[0]) | (roundmode[1] & (roundmode[0] ^ sign)); 
  assign roundinf	= roundmode[1] & ~(sign ^ roundmode[0]); 
 
  // pull out the most significant bits for the product 
  assign MSBits = shiftprod[`SHIFTWIDTH-1:`SHIFTWIDTH-`WSIG]; 
 
  // add a 1 to the end of MSBits for round up 
  assign MSBitsplus1 = MSBits + 1; 
 
  // pull out the last of the most significant bits  
  //	and the first of the least significant bits 
  //	to use for calculating the rounding decision 
  assign roundbits[1:0]	= shiftprod[`SHIFTWIDTH-`WSIG:`SHIFTWIDTH-`WSIG-1]; 
 
  // calculate the sticky bit. Are any of the least significant bits 1? 
  //	also: was anything lost while shifting? 
  // *** Optimization: some of these bits are already checked from the shiftloss *** 
  // *** Optimization: stickybit can be calculated from denormsticky  
  //			with only 1 more gate, instead of duplication of effort *** 
  assign stickybit 	= |shiftprod[`SHIFTWIDTH-`WSIG-2:0] | shiftloss; 
  assign denormsticky 	= |shiftprod[`SHIFTWIDTH-`WSIG-3:0] | shiftloss; 
 
  // Compute rounding decision 
  assign rounddecision	= ~roundzero & 	( (roundbits[0]	& (roundinf | roundbits[1])) 
					| (stickybit	& (roundinf | roundbits[0])) 
					); 
 
  // Was this only rounded because it is a denorm? 
  assign denormround	= tiny & rounddecision & ~denormsticky & roundbits[0]; 
 
  // detect rounding overflow. it only overflows if: 
  // 1) the top bit of MSBitsplus1 is 1 
  // 2) it decides to round up 
  assign roundoverflow	= MSBitsplus1[`WSIG] & rounddecision; 
 
  // assign significand (and postnormalize) 
  //  rounddecision decides whether to use msbits+1 or msbits. 
  //  if using msbits+1 and there is an rounding overflow (i.e. result=2), 
  //  then should return 1 instead 
  assign roundprod = rounddecision ?  
 			(roundoverflow ? 0 :  
			MSBitsplus1[`WSIG-1:0]) : 
			MSBits; 
 
  // detect inexact 
  assign inexact	= rounddecision | stickybit | roundbits[0]; 
 
  // compensate for a rounding overflow 
  assign tempexp 	= roundoverflow + shiftexp; 
 
  // check for overflow in exponent 
  //	overflow occured if the number 
  //	is too large to be represented, 
  //	i.e. can't fit in `WEXP bits, or 
  //	all `WEXP bits are 1's 
  assign overflow	= &tempexp[`WEXP-1:0] | |tempexp[`WEXPSUM-1:`WEXP]; 
 
  // two possible cases: 
  //	1) Overflow: then exponent doesnt matter, 
  //	it will be changed to infinity anyway 
  //	2) not overflow: the leading bits will be 0 
  assign roundexp	= tempexp[`WEXP-1:0]; 
 
  // The result is tiny if the exponent is less than 1. 
  //	Because the exponent sum is NOT in 2's-complement form, 
  //	it is only less than one if its is zero, i.e. 
  //    all the bits are 0 
  assign stilltiny	= ~|roundexp; 
 
endmodule  
module shift(normalized, selectedexp, shiftprod, shiftexp, shiftloss); 
 
  // external signals 
  input	[`PRODWIDTH-1:0] normalized;	// normalized product of mantissae 
  input	[`WEXPSUM-1:0] 	selectedexp;	// sum of exponents 
  output [`SHIFTWIDTH-1:0] shiftprod;	// shifted and normalized product 
  output [`WEXPSUM-1:0]	shiftexp;	// shifted exponent 
  output		shiftloss;	// loss of accuaracy due to shifting 
 
  // internal signals 
  wire	[`WEXPSUM-1:0]	roundedexp;		// selected exponent + 1 if rounding caused overflow 
//  wire			negexp;		// exponent is negative 
  wire	[`WEXPSUM-1:0]	shiftamt;		// theoretical amount to shift product by 
  wire	[`WSHIFTAMT-1:0] actualshiftamt;	// actual amount to shift product by 
  wire			tozero;		// need more shifts than possible with width of significand 
  wire			doshift;	// only shift if value is nonnegative 
  wire	[`SHIFTWIDTH-1:0] preshift; 	// value before shifting, with more room to ensure lossless shifting 
  reg	[`SHIFTWIDTH-1:0] postshift;	// value after shifting, with more room to ensure lossless shifting, used to be wire, changed for ODIN. 
 
  // set up value for shifting 
  assign preshift	= {normalized, `PRESHIFTZEROS}; 
 
  // determine shift amount 
  assign shiftamt	=  -selectedexp; 
 
  // make sure shift amount is nonnegative 
  //	If the exponent is negative, the shift amount should 
  //	come out positive, otherwise there shouldn't be any 
  //	shifting to be done 
  assign doshift	= ~shiftamt[`WEXPSUM-1]; 
   
  // Determine if the result must be shifted more than 
  //	will show up in the significand, even if it rounds up 
  assign tozero		= doshift & (shiftamt > `MAXSHIFT); 
 
  // If the shift is big enough to shift all the bits out of the final significand, 
  //	then it stops being relevent how much it has been shifted. 
  assign actualshiftamt	= tozero ? `MAXSHIFT : shiftamt[`WSHIFTAMT-1:0]; 
 
  // shift significand 
  //assign postshift	= preshift >> actualshiftamt;  
  //We can only have constant shifts for ODIN:  
  always @ (actualshiftamt or preshift) begin  
		case (actualshiftamt)   
			5'b00001: begin  
				postshift = preshift >> 5'b00001; 
			end 
 
			5'b00010: begin  
				postshift = preshift >> 5'b00010; 
			end 
 
			5'b00011: begin  
				postshift = preshift >> 5'b00011; 
			end 
 
			5'b00100: begin  
				postshift = preshift >> 5'b00100; 
			end 
 
			5'b00101: begin  
				postshift = preshift >> 5'b00101; 
			end 
 
			5'b00110: begin  
				postshift = preshift >> 5'b00110; 
			end 
 
			5'b00111: begin  
				postshift = preshift >> 5'b00111; 
			end 
 
			5'b01000: begin  
				postshift = preshift >> 5'b01000; 
			end 
 
			5'b01001: begin  
				postshift = preshift >> 5'b01001; 
			end 
 
			5'b01010: begin  
				postshift = preshift >> 5'b01010; 
			end 
 
			5'b01011: begin  
				postshift = preshift >> 5'b01011; 
			end 
 
			5'b01100: begin  
				postshift = preshift >> 5'b01100; 
			end 
 
			5'b01101: begin  
				postshift = preshift >> 5'b01101; 
			end 
 
			5'b01110: begin  
				postshift = preshift >> 5'b01110; 
			end 
 
			5'b01111: begin  
				postshift = preshift >> 5'b01111; 
			end 
 
			5'b10000: begin  
				postshift = preshift >> 5'b10000; 
			end 
 
			5'b10001: begin  
				postshift = preshift >> 5'b10001; 
			end 
 
			5'b10010: begin  
				postshift = preshift >> 5'b10010; 
			end 
 
			5'b10011: begin  
				postshift = preshift >> 5'b10011; 
			end 
 
			5'b10100: begin  
				postshift = preshift >> 5'b10100; 
			end 
 
			5'b10101: begin  
				postshift = preshift >> 5'b10101; 
			end 
 
			5'b10110: begin  
				postshift = preshift >> 5'b10110; 
			end 
 
			5'b10111: begin  
				postshift = preshift >> 5'b10111; 
			end 
 
			5'b11000: begin  
				postshift = preshift >> 5'b11000; 
			end 
 
			5'b11001: begin  
				postshift = preshift >> 5'b11001; 
			end 
 
			5'b11010: begin  
				postshift = preshift >> 5'b11010; 
			end 
 
			5'b11011: begin  
				postshift = preshift >> 5'b11011; 
			end 
 
			5'b11100: begin  
				postshift = preshift >> 5'b11100; 
			end 
 
			5'b11101: begin  
				postshift = preshift >> 5'b11101; 
			end 
 
			5'b11110: begin  
				postshift = preshift >> 5'b11110; 
			end 
 
			5'b11111: begin  
				postshift = preshift >> 5'b11111; 
			end  
		  
			default: begin  
				postshift = preshift;  
			end  
		endcase  
	end 
 
 
  // assign appropriate significand 
  assign shiftprod	= doshift ? postshift :	preshift; 
 
  // determine if any bits were lost from the shift 
  //assign shiftloss	= tozero | (negexp & |postshift[`WSIG-1:0]);  
  assign shiftloss	= tozero | (doshift & |postshift[`SHIFTWIDTH-`PRODWIDTH-1:0]);  
 
  // assign appropriate exponent 
  assign shiftexp	= doshift ? 0 : selectedexp;   
 
endmodule   
module normalize(prod, normalized, tiny, twoormore); 
 
  // external signals 
  input  [`PRODWIDTH-1:0]	prod;		// Product of multiplication 
  output [`PRODWIDTH-1:0]	normalized;	// Normalized product 
  input				tiny;		// Result is tiny (denormalized #) 
  input				twoormore;	// Product overflowed range [1,2) 
 
  // normalize product if appropriate 
  //	There are three possible cases here: 
  //	1) tiny and prod overfl. [1,2)	-> take the whole prod, including the leading 1 
  //	2) tiny or prod overfl. [1,2)	-> dont take the first bit. its zero if its tiny, 
  //				 		and it's the implied 1 if its not 
  //	3) neither tiny nor prod overfl.-> dont take the first 2 bits, the 2nd one is the 
  //						implied 1 
  assign normalized = (tiny & twoormore) ? prod[`PRODWIDTH-1:0] : 
			((tiny ^ twoormore) ? {prod[`PRODWIDTH-2:0],1'b0} : 
			{prod[`PRODWIDTH-3:0],2'b0}); 
 
endmodule   
module exponent(expa, expb, expsum, twoormore, tiny); 
 
  input	[`WEXPSUM-1:0]	expa, expb;	// the input exponents in 2's complement form 
					//	to accomodate denorms that have been 
					//	prenormalized 
  input			twoormore;	// product is outside range [1,2) 
 
  output [`WEXPSUM-1:0]	expsum;		// the sum of the exponents 
  output		tiny;		// Result is tiny (denormalized #) 
 
  // Sum the exponents, subtract the bias 
  // 	and add 1 (twoormore) if multiply went out of [1,2) range 
  assign expsum = expa + expb - `BIAS + twoormore; 
 
  // The result is tiny if the exponent is less than 1. 
  //	Because the exponent sum is in 2's-complement form, 
  //	it is negative if the first bit is 1, and zero if 
  //    all the bits are zero 
  assign tiny	= ~|expsum[`WEXPSUM-2:0] | expsum[`WEXPSUM-1]; 
 
 
endmodule  
module multiply_a (norma, normb, prod, twoormore); 
 
  input	 [`WSIG:0]		norma, normb;	// normalized mantissae 
 
  output [`PRODWIDTH-1:0] 	prod;		// product of mantissae 
  output			twoormore;	// Product overflowed range [1,2) 
 
  // multiplier array  
  //	(*** need a more effecient multiplier,  
  //	designware might work, though) 
  assign prod		= norma * normb; 
 
  // did the multiply overflow the range [1,2)? 
  assign twoormore	= prod[`PRODWIDTH-1]; 
 
endmodule   
module prenorm(a, b, norma, normb, modexpa, modexpb, aisdenorm, bisdenorm); 
 
  //input	[`WIDTH-1:0]	a, b;			// the input floating point numbers  
  input [`WIDTH-2:0] a, b;  //We don't need bit 31 here, unused in ODIN. 
  output [`WSIG:0]	norma, normb;		// the mantissae in normal form 
  output [`WEXPSUM-1:0]	modexpa, modexpb;	// the output exponents, larger to accomodate 
						//	two's complement form 
  input			aisdenorm;		// a is a denormalized number 
  input			bisdenorm;		// b is a denormalized nubmer 
 
  // internal signals 
  wire	[`WEXPSUM-1:0]	expa, expb;		// exponents in two's complement form 
						//	are negative if shifted for a 
						// 	denormalized number 
  wire	[`SHIFT-1:0]	shifta, shiftb; 	// the shift amounts 
  reg [`WSIG:0]	shifteda, shiftedb;	// the shifted significands, used to be wire, changed for ODIN. 
 
  // pull out the exponents 
  assign expa 	= a[`WIDTH-2:`WIDTH-1-`WEXP]; 
  assign expb 	= b[`WIDTH-2:`WIDTH-1-`WEXP]; 
 
  // when breaking appart for paramaterizing: 
  // ### RUN ./prenormshift.pl wsig_in ### 
assign shifta = a[23 - 1] ? 1 : 
                 a[23 - 2] ? 2 : 
                 a[23 - 3] ? 3 : 
                 a[23 - 4] ? 4 : 
                 a[23 - 5] ? 5 : 
                 a[23 - 6] ? 6 : 
                 a[23 - 7] ? 7 : 
                 a[23 - 8] ? 8 : 
                 a[23 - 9] ? 9 : 
                 a[23 - 10] ? 10 : 
                 a[23 - 11] ? 11 : 
                 a[23 - 12] ? 12 : 
                 a[23 - 13] ? 13 : 
                 a[23 - 14] ? 14 : 
                 a[23 - 15] ? 15 : 
                 a[23 - 16] ? 16 : 
                 a[23 - 17] ? 17 : 
                 a[23 - 18] ? 18 : 
                 a[23 - 19] ? 19 : 
                 a[23 - 20] ? 20 : 
                 a[23 - 21] ? 21 : 
                 a[23 - 22] ? 22 : 
                 23; // dont need to check last bit 
// if the second to last isn't 1, then the last one must be 
 
assign shiftb = b[23 - 1] ? 1 : 
                 b[23 - 2] ? 2 : 
                 b[23 - 3] ? 3 : 
                 b[23 - 4] ? 4 : 
                 b[23 - 5] ? 5 : 
                 b[23 - 6] ? 6 : 
                 b[23 - 7] ? 7 : 
                 b[23 - 8] ? 8 : 
                 b[23 - 9] ? 9 : 
                 b[23 - 10] ? 10 : 
                 b[23 - 11] ? 11 : 
                 b[23 - 12] ? 12 : 
                 b[23 - 13] ? 13 : 
                 b[23 - 14] ? 14 : 
                 b[23 - 15] ? 15 : 
                 b[23 - 16] ? 16 : 
                 b[23 - 17] ? 17 : 
                 b[23 - 18] ? 18 : 
                 b[23 - 19] ? 19 : 
                 b[23 - 20] ? 20 : 
                 b[23 - 21] ? 21 : 
                 b[23 - 22] ? 22 : 
                 23; // dont need to check last bit 
// if the second to last isn't 1, then the last one must be 
 
 
 
  // If number is a denorm, the exponent must be  
  //	decremented by the shift amount 
  assign modexpa = aisdenorm ? 1 - shifta : expa;  
  assign modexpb = bisdenorm ? 1 - shiftb : expb;  
 
  // If number is denorm, shift the significand the appropriate amount 
//  assign shifteda = a[`WSIG-1:0] << shifta;  
	//Must have constant shifts for ODIN  
	always @ (shifta or a) begin  
		case (shifta)   
			5'b00001: begin  
				shifteda = a[`WSIG-1:0] << 5'b00001; 
			end 
 
			5'b00010: begin  
				shifteda = a[`WSIG-1:0] << 5'b00010; 
			end 
 
			5'b00011: begin  
				shifteda = a[`WSIG-1:0] << 5'b00011; 
			end 
 
			5'b00100: begin  
				shifteda = a[`WSIG-1:0] << 5'b00100; 
			end 
 
			5'b00101: begin  
				shifteda = a[`WSIG-1:0] << 5'b00101; 
			end 
 
			5'b00110: begin  
				shifteda = a[`WSIG-1:0] << 5'b00110; 
			end 
 
			5'b00111: begin  
				shifteda = a[`WSIG-1:0] << 5'b00111; 
			end 
 
			5'b01000: begin  
				shifteda = a[`WSIG-1:0] << 5'b01000; 
			end 
 
			5'b01001: begin  
				shifteda = a[`WSIG-1:0] << 5'b01001; 
			end 
 
			5'b01010: begin  
				shifteda = a[`WSIG-1:0] << 5'b01010; 
			end 
 
			5'b01011: begin  
				shifteda = a[`WSIG-1:0] << 5'b01011; 
			end 
 
			5'b01100: begin  
				shifteda = a[`WSIG-1:0] << 5'b01100; 
			end 
 
			5'b01101: begin  
				shifteda = a[`WSIG-1:0] << 5'b01101; 
			end 
 
			5'b01110: begin  
				shifteda = a[`WSIG-1:0] << 5'b01110; 
			end 
 
			5'b01111: begin  
				shifteda = a[`WSIG-1:0] << 5'b01111; 
			end 
 
			5'b10000: begin  
				shifteda = a[`WSIG-1:0] << 5'b10000; 
			end 
 
			5'b10001: begin  
				shifteda = a[`WSIG-1:0] << 5'b10001; 
			end 
 
			5'b10010: begin  
				shifteda = a[`WSIG-1:0] << 5'b10010; 
			end 
 
			5'b10011: begin  
				shifteda = a[`WSIG-1:0] << 5'b10011; 
			end 
 
			5'b10100: begin  
				shifteda = a[`WSIG-1:0] << 5'b10100; 
			end 
 
			5'b10101: begin  
				shifteda = a[`WSIG-1:0] << 5'b10101; 
			end 
 
			5'b10110: begin  
				shifteda = a[`WSIG-1:0] << 5'b10110; 
			end 
 
			5'b10111: begin  
				shifteda = a[`WSIG-1:0] << 5'b10111; 
			end 
 
			default: begin //Won't be higher than 23.  
				shifteda = a[`WSIG-1:0];  
			end  
		endcase  
	end  
 
  assign norma 	= aisdenorm ? shifteda : {1'b1, a[`WSIG-1:0]}; 
 
 // assign shiftedb = b[`WSIG-1:0] << shiftb;  
	always @ (shiftb or b) begin  
		case (shiftb)   
			5'b00001: begin  
				shiftedb = b[`WSIG-1:0] << 5'b00001; 
			end 
 
			5'b00010: begin  
				shiftedb = b[`WSIG-1:0] << 5'b00010; 
			end 
 
			5'b00011: begin  
				shiftedb = b[`WSIG-1:0] << 5'b00011; 
			end 
 
			5'b00100: begin  
				shiftedb = b[`WSIG-1:0] << 5'b00100; 
			end 
 
			5'b00101: begin  
				shiftedb = b[`WSIG-1:0] << 5'b00101; 
			end 
 
			5'b00110: begin  
				shiftedb = b[`WSIG-1:0] << 5'b00110; 
			end 
 
			5'b00111: begin  
				shiftedb = b[`WSIG-1:0] << 5'b00111; 
			end 
 
			5'b01000: begin  
				shiftedb = b[`WSIG-1:0] << 5'b01000; 
			end 
 
			5'b01001: begin  
				shiftedb = b[`WSIG-1:0] << 5'b01001; 
			end 
 
			5'b01010: begin  
				shiftedb = b[`WSIG-1:0] << 5'b01010; 
			end 
 
			5'b01011: begin  
				shiftedb = b[`WSIG-1:0] << 5'b01011; 
			end 
 
			5'b01100: begin  
				shiftedb = b[`WSIG-1:0] << 5'b01100; 
			end 
 
			5'b01101: begin  
				shiftedb = b[`WSIG-1:0] << 5'b01101; 
			end 
 
			5'b01110: begin  
				shiftedb = b[`WSIG-1:0] << 5'b01110; 
			end 
 
			5'b01111: begin  
				shiftedb = b[`WSIG-1:0] << 5'b01111; 
			end 
 
			5'b10000: begin  
				shiftedb = b[`WSIG-1:0] << 5'b10000; 
			end 
 
			5'b10001: begin  
				shiftedb = b[`WSIG-1:0] << 5'b10001; 
			end 
 
			5'b10010: begin  
				shiftedb = b[`WSIG-1:0] << 5'b10010; 
			end 
 
			5'b10011: begin  
				shiftedb = b[`WSIG-1:0] << 5'b10011; 
			end 
 
			5'b10100: begin  
				shiftedb = b[`WSIG-1:0] << 5'b10100; 
			end 
 
			5'b10101: begin  
				shiftedb = b[`WSIG-1:0] << 5'b10101; 
			end 
 
			5'b10110: begin  
				shiftedb = b[`WSIG-1:0] << 5'b10110; 
			end 
 
			5'b10111: begin  
				shiftedb = b[`WSIG-1:0] << 5'b10111; 
			end 
  
			default: begin // Won't be higher than 23.  
				shiftedb = b[`WSIG-1:0];  
			end  
		endcase  
	end 
		  
  
  assign normb 	= bisdenorm ? shiftedb : {1'b1, b[`WSIG-1:0]}; 
 
endmodule  
module special (a, b, special, specialsign,  
		zero, aisnan, bisnan, infinity,  
		invalid, specialcase, specialsigncase); 
 
  // external signals 
  input	[`WIDTH-1:0] 	a, b;		// floating-point inputs 
  output [`WIDTH-2:0]	special;	// special case output, exp + sig 
  output		specialsign;	// the special-case sign 
  input			zero;		// is there a zero? 
  input			aisnan;		// NaN detected in A 
  input			bisnan;		// NaN detected in B 
  input			infinity;	// infinity detected 
  output		invalid;	// invalid operation 
  output		specialcase;	// this is a special case 
  output		specialsigncase; // Use the special sign 
 
  // internal signals 
  wire			infandzero;	// infinity and zero detected 
  wire	[`WIDTH-2:0]	highernan;	// holds inputed NaN, the higher if two are input, 
					// and dont care if neither a nor b are NaNs 
  wire			aishighernan;	// a is the higher NaN 
 
  assign infandzero	= (infinity & zero); 
 
  //#######SPECIAL ASSIGNMENT###### 
  // #######return higher NaN########## 
  // Use this block if you want to return the higher of two NaNs 
 
  assign aishighernan = (aisnan & ((a[`WSIG-1:0] >= b[`WSIG-1:0]) | ~bisnan)); 
 
  assign highernan[`WIDTH-2:0] = aishighernan ? a[`WIDTH-2:0] : b[`WIDTH-2:0]; 
 
  assign special[`WIDTH-2:0] = (aisnan | bisnan) ? (highernan[`WIDTH-2:0]) :  
			(zero ?  
			(infinity ? (`CONSTNAN) : (`CONSTZERO)) : (`CONSTINFINITY)); 
  // #######return first NaN########## 
  // Use this block to return the first NaN encountered 
//  assign special	= aisnan ? (a[`WIDTH-2:0]) :  
//			(bisnan ? (b[`WIDTH-2:0]) :  
//			(zero ?  
//			(infinity ? (`CONSTNAN) : (`CONSTZERO)) : (`CONSTINFINITY))); 
  //######END SPECIAL ASSIGNMENT####### 
 
  assign specialcase	= zero | aisnan | bisnan | infinity; 
 
  assign invalid	= infandzero; //*** need to include something about signaling NaNs here 
 
  // dont need to check if b is NaN, if it defaults to that point, and b isnt NAN 
  // then it wont be used anyway 
  assign specialsign	= infandzero ? (1'b1) : (aishighernan ? a[`WIDTH-1] : b[`WIDTH-1]); 
 
  assign specialsigncase = infandzero | aisnan | bisnan; 
 
endmodule   
module preprocess(a, b, zero, aisnan, bisnan, aisdenorm, bisdenorm, infinity, control, roundmode, sign); 
 
  // external signals 
  input	[`WIDTH-1:0] 	a, b;		// floating-point inputs 
  output 		zero;		// is there a zero? 
  //input	[`WCONTROL-1:0]	control;	// control field  
  input [1:0] control; //the rest is unused, not necessary for ODIN. 
  output [1:0]		roundmode;	// 00 = RN; 01 = RZ; 10 = RP; 11 = RM  
  output		aisnan;		// NaN detected in A 
  output		bisnan;		// NaN detected in B 
  output		aisdenorm;	// denormalized number detected in A 
  output		bisdenorm;	// denormalized number detected in B 
  output		infinity;	// infinity detected in A 
  output		sign;		// sign of product 
 
  // internal signals 
  wire			signa, signb;	// sign of a and b 
  wire [`WEXP-1:0]	expa, expb;	// the exponents of a and b 
  wire [`WSIG-1:0]	siga, sigb;	// the significands of a and b 
  wire			aexpfull;	// the exponent of a is all 1's 
  wire			bexpfull;	// the exponent of b is all 1's 
  wire			aexpzero;	// the exponent of a is all 0's 
  wire			bexpzero;	// the exponent of b is all 0's 
  wire			asigzero;	// the significand of a is all 0's 
  wire			bsigzero;	// the significand of b is all 0's 
 
  // Sign calculation 
  assign signa 		= a[`WIDTH-1]; 
  assign signb 		= b[`WIDTH-1]; 
  assign sign = signa ^ signb; 
 
  // Significand calcuations 
 
  assign siga		= a[`WSIG-1:0]; 
  assign sigb		= b[`WSIG-1:0]; 
  // Are the significands all 0's? 
  assign asigzero	= ~|siga; 
  assign bsigzero	= ~|sigb; 
 
  // Exponent calculations 
 
  assign expa		= a[`WIDTH-2:`WIDTH-`WEXP-1]; 
  assign expb		= b[`WIDTH-2:`WIDTH-`WEXP-1]; 
  // Are the exponents all 0's? 
  assign aexpzero	= ~|expa; 
  assign bexpzero	= ~|expb; 
  // Are the exponents all 1's? 
  assign aexpfull	= &expa; 
  assign bexpfull	= &expb; 
 
  // General calculations 
 
  // Zero Detect 
  assign zero 		= (aexpzero & asigzero) | (bexpzero & bsigzero); 
 
  // NaN detect 
  assign aisnan		= aexpfull & ~asigzero; 
  assign bisnan		= bexpfull & ~bsigzero; 
 
  // Infinity detect 
  assign infinity	= (aexpfull & asigzero) | (bexpfull & bsigzero); 
 
  // Denorm detect 
  assign aisdenorm	= aexpzero & ~asigzero; 
  assign bisdenorm	= bexpzero & ~bsigzero; 
 
  // Round mode extraction 
  assign roundmode	= control[1:0]; 
 
endmodule  
module top_ram (
	clk,
	data,
	rdaddress,
	wraddress,
	wren,
	q
	);

	//parameter TOPSIZE = 16384, TOPSIZEWIDTH = 14, TOPWIDTH = 32;
	
	input	  clk;
	input	[32-1:0]  data;
	input	[14-1:0]  rdaddress;
	input	[14-1:0]  wraddress;
	input	  wren;
	output	[32-1:0]  q;

	wire [32-1:0] sub_wire0;
	wire [32-1:0] q;
	wire [32-1:0] junk_output;
	assign q = sub_wire0 | dummy;
	wire[32-1:0] dummy;
	assign dummy = junk_output & 32'b0;

    defparam inst2.ADDR_WIDTH = 14;
    defparam inst2.DATA_WIDTH = 32;  
 dual_port_ram inst2(
 .clk (clk),
 .we1(wren),
 .we2(1'b0),
 .data1(data),
 .data2(data),
 .out1(junk_output),
 .out2(sub_wire0),
 .addr1(wraddress),
 .addr2(rdaddress));

endmodule
module ram3 (
	byteena_a,
	clk,
	data,
	rdaddress,
	wraddress,
	wren,
	q
	);

	input	[`RAMNUMBYTES-1:0]  byteena_a;
	input	  clk;
	input	[`RAMWIDTH-1:0]  data;
	input	[`rRAMSIZEWIDTH-1:0]  rdaddress;
	input	[`rRAMSIZEWIDTH-1:0]  wraddress;
	input	  wren;
	output	[`RAMWIDTH-1:0]  q;
	wire	[`RAMWIDTH-1:0]  value_out;
	wire [`RAMWIDTH-1:0] subwire;
	assign q = subwire | dummy;
	wire [`RAMWIDTH-1:0] uselessdata;
 assign uselessdata = 2048'b0;
wire j;
assign j = |byteena_a;
 wire [`RAMWIDTH-1:0]dummy;
 assign dummy = value_out & 2048'b0;

defparam inst1.ADDR_WIDTH = `rRAMSIZEWIDTH;
defparam inst1.DATA_WIDTH = `RAMWIDTH;
dual_port_ram inst1( 
.clk (clk),
.we1(wren),
.we2(1'b0),
.data1(data),
.data2(uselessdata),
.out1(value_out),
.out2(subwire),
.addr1(wraddress),
.addr2(rdaddress));


endmodule
module ram2 (
	byteena_a,
	clk,
	data,
	rdaddress,
	wraddress,
	wren,
	q
	);

	input	[`RAMNUMBYTES-1:0]  byteena_a;
	input	  clk;
	input	[`RAMWIDTH-1:0]  data;
	input	[`rRAMSIZEWIDTH-1:0]  rdaddress;
	input	[`rRAMSIZEWIDTH-1:0]  wraddress;
	input	  wren;
	output	[`RAMWIDTH-1:0]  q;
	wire	[`RAMWIDTH-1:0]  value_out;
	wire [`RAMWIDTH-1:0] subwire;
	assign q = subwire | dummy;
	wire [`RAMWIDTH-1:0] uselessdata;
 assign uselessdata = 2048'b0;
wire j;
assign j = |byteena_a;
 wire [`RAMWIDTH-1:0]dummy;
 assign dummy = value_out & 2048'b0;

defparam inst1.ADDR_WIDTH = `rRAMSIZEWIDTH;
defparam inst1.DATA_WIDTH = `RAMWIDTH;
dual_port_ram inst1( 
.clk (clk),
.we1(wren),
.we2(1'b0),
.data1(data),
.data2(uselessdata),
.out1(value_out),
.out2(subwire),
.addr1(wraddress),
.addr2(rdaddress));


endmodule
module ram1 (
	byteena_a,
	clk,
	data,
	rdaddress,
	wraddress,
	wren,
	q
	);

	input	[`RAMNUMBYTES-1:0]  byteena_a;
	input	  clk;
	input	[`RAMWIDTH-1:0]  data;
	input	[`rRAMSIZEWIDTH-1:0]  rdaddress;
	input	[`rRAMSIZEWIDTH-1:0]  wraddress;
	input	  wren;
	output	[`RAMWIDTH-1:0]  q;
	wire	[`RAMWIDTH-1:0]  value_out;
	wire [`RAMWIDTH-1:0] subwire;
	assign q = subwire | dummy;
	wire [`RAMWIDTH-1:0] uselessdata;
 assign uselessdata = 2048'b0;
wire j;
assign j = |byteena_a;
 wire [`RAMWIDTH-1:0]dummy;
 assign dummy = value_out & 2048'b0;

defparam inst1.ADDR_WIDTH = `rRAMSIZEWIDTH;
defparam inst1.DATA_WIDTH = `RAMWIDTH;
dual_port_ram inst1( 
.clk (clk),
.we1(wren),
.we2(1'b0),
.data1(data),
.data2(uselessdata),
.out1(value_out),
.out2(subwire),
.addr1(wraddress),
.addr2(rdaddress));


endmodule
module ram (
	byteena_a,
	clk,
	data,
	rdaddress,
	wraddress,
	wren,
	q
	);

	input	[`RAMNUMBYTES-1:0]  byteena_a;
	input	  clk;
	input	[`RAMWIDTH-1:0]  data;
	input	[`rRAMSIZEWIDTH-1:0]  rdaddress;
	input	[`rRAMSIZEWIDTH-1:0]  wraddress;
	input	  wren;
	output	[`RAMWIDTH-1:0]  q;
	wire	[`RAMWIDTH-1:0]  value_out;
	wire [`RAMWIDTH-1:0] subwire;
	assign q = subwire | dummy;
	wire [`RAMWIDTH-1:0] uselessdata;
 assign uselessdata = 2048'b0;
wire j;
assign j = |byteena_a;
 wire [`RAMWIDTH-1:0]dummy;
 assign dummy = value_out & 2048'b0;

defparam inst1.ADDR_WIDTH = `rRAMSIZEWIDTH;
defparam inst1.DATA_WIDTH = `RAMWIDTH;
dual_port_ram inst1( 
.clk (clk),
.we1(wren),
.we2(1'b0),
.data1(data),
.data2(uselessdata),
.out1(value_out),
.out2(subwire),
.addr1(wraddress),
.addr2(rdaddress));


endmodule
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
module LUControl (clk, start_in, m_in, n_in, loop_in, mode_in, done,
					curReadAddr, curWriteAddr, curWriteByteEn, curWriteEn, curWriteSel, 
					leftReadAddr, leftWriteAddr, leftWriteByteEn, leftWriteEn,  leftWriteSel,
					topReadAddr, topWriteAddr, topWriteEn, topWriteSel, topSourceSel, diagEn, MOSel, MOEn);

input clk, start_in;
input[8-1:0] m_in, n_in, loop_in;
input[1:0] mode_in;
output done;

output[256-1:0] curWriteByteEn;
output[8-1:0] curWriteAddr, curReadAddr;
output curWriteEn;

output[256-1:0] leftWriteByteEn;
output[8-1:0] leftWriteAddr, leftReadAddr;
output leftWriteEn;

output[14-1:0] topWriteAddr, topReadAddr;
output topWriteEn;

output leftWriteSel, curWriteSel, topSourceSel, diagEn;
output[6-1:0] topWriteSel;

output MOSel;
output MOEn;

reg start;
reg[15:0]startDelay;
reg[8-1:0] m, n, stop, stop2, loop;
reg[1:0] mode;
reg[3:0] nextState, currentState;
reg[1:0] nextRowState, currentRowState;
reg startFetchRow, doneFetchRow, loadRow, writeRow;
reg updateCounter;

reg[8-1:0] i1, j;
reg[14-1:0] nextTopIdx, nextTopIdx2, curTopIdx, nextTopIdxCounter;
reg[2-1:0] topIdx, topIdxCounter, mdivk;
reg[8-1:0] diagIdx, leftIdx, msIdx;
reg[6-1:0] imodk, i1modk;
reg[8-1:0] diagIdxCounter, leftIdxCounter, msIdxCounter, readRowCounter, topWriteCounter;
reg[256-1:0] byteEn, i1modkByteEn;

reg done;

reg[256-1:0] curWriteByteEn;
reg[8-1:0] curWriteAddr, curReadAddr;
reg curWriteEn;

reg[256-1:0] leftWriteByteEn;
reg[8-1:0] leftWriteAddr, leftReadAddr;
reg leftWriteEn;

reg[14-1:0] topWriteAddr, topReadAddr;
reg topWriteEn;

reg leftWriteSel, curWriteSel, topSourceSel, diagEn;
reg[6-1:0] topWriteSel;

reg MOSel;
reg MOEn;

reg[8-1:0] counter;
reg[6-1:0] divCounter;

reg[256-1:0]writeByteEnDelay0; 
reg[256-1:0]writeByteEnDelay1; 
reg[256-1:0]writeByteEnDelay2; 
reg[256-1:0]writeByteEnDelay3; 
reg[256-1:0]writeByteEnDelay4; 
reg[256-1:0]writeByteEnDelay5; 
reg[256-1:0]writeByteEnDelay6; 
reg[256-1:0]writeByteEnDelay7; 
reg[256-1:0]writeByteEnDelay8; 
reg[256-1:0]writeByteEnDelay9; 
reg[256-1:0]writeByteEnDelay10; 
reg[256-1:0]writeByteEnDelay11; 
reg[256-1:0]writeByteEnDelay12; 
reg[256-1:0]writeByteEnDelay13; 
reg[256-1:0]writeByteEnDelay14; 
reg[256-1:0]writeByteEnDelay15; 
reg[256-1:0]writeByteEnDelay16; 
reg[256-1:0]writeByteEnDelay17; 
reg[256-1:0]writeByteEnDelay18; 
reg[256-1:0]writeByteEnDelay19; 
reg[256-1:0]writeByteEnDelay20; 
reg[256-1:0]writeByteEnDelay21; 
reg[256-1:0]writeByteEnDelay22; 
reg[256-1:0]writeByteEnDelay23; 
reg[256-1:0]writeByteEnDelay24; 
reg[256-1:0]writeByteEnDelay25; 
reg[256-1:0]writeByteEnDelay26; 
reg[256-1:0]writeByteEnDelay27; 
reg[256-1:0]writeByteEnDelay28; 
reg[256-1:0]writeByteEnDelay29; 
reg[256-1:0]writeByteEnDelay30; 
reg[256-1:0]writeByteEnDelay31; 

reg[8-1:0]curWriteAddrDelay0; 
reg[8-1:0]curWriteAddrDelay1; 
reg[8-1:0]curWriteAddrDelay2; 
reg[8-1:0]curWriteAddrDelay3; 
reg[8-1:0]curWriteAddrDelay4; 
reg[8-1:0]curWriteAddrDelay5; 
reg[8-1:0]curWriteAddrDelay6; 
reg[8-1:0]curWriteAddrDelay7; 
reg[8-1:0]curWriteAddrDelay8; 
reg[8-1:0]curWriteAddrDelay9; 
reg[8-1:0]curWriteAddrDelay10; 
reg[8-1:0]curWriteAddrDelay11; 
reg[8-1:0]curWriteAddrDelay12; 
reg[8-1:0]curWriteAddrDelay13; 
reg[8-1:0]curWriteAddrDelay14; 
reg[8-1:0]curWriteAddrDelay15; 
reg[8-1:0]curWriteAddrDelay16; 
reg[8-1:0]curWriteAddrDelay17; 
reg[8-1:0]curWriteAddrDelay18; 
reg[8-1:0]curWriteAddrDelay19; 
reg[8-1:0]curWriteAddrDelay20; 
reg[8-1:0]curWriteAddrDelay21; 
reg[8-1:0]curWriteAddrDelay22; 
reg[8-1:0]curWriteAddrDelay23; 
reg[8-1:0]curWriteAddrDelay24; 
reg[8-1:0]curWriteAddrDelay25; 
reg[8-1:0]curWriteAddrDelay26; 
reg[8-1:0]curWriteAddrDelay27; 
reg[8-1:0]curWriteAddrDelay28; 
reg[8-1:0]curWriteAddrDelay29; 
reg[8-1:0]curWriteAddrDelay30; 
reg[8-1:0]curWriteAddrDelay31; 

reg[8-1:0]curReadAddrDelay0; 
reg[8-1:0]curReadAddrDelay1; 
reg[8-1:0]curReadAddrDelay2; 
reg[8-1:0]curReadAddrDelay3; 
reg[8-1:0]curReadAddrDelay4; 
reg[8-1:0]curReadAddrDelay5; 
reg[8-1:0]curReadAddrDelay6; 
reg[8-1:0]curReadAddrDelay7; 
reg[8-1:0]curReadAddrDelay8; 
reg[8-1:0]curReadAddrDelay9; 
reg[8-1:0]curReadAddrDelay10; 
reg[8-1:0]curReadAddrDelay11; 

reg[32-1:0]leftWriteEnDelay; 
reg[32-1:0]curWriteEnDelay; 
reg[5-1:0]leftWriteSelDelay; 
reg[16-1:0]curWriteSelDelay; 
reg[8-1:0]leftReadAddrDelay0; 
reg[14-1:0]topWriteAddrDelay0; 
reg[14-1:0]topWriteAddrDelay1; 
reg[14-1:0]topWriteAddrDelay2; 
reg[14-1:0]topWriteAddrDelay3; 
reg[14-1:0]topWriteAddrDelay4; 
reg[14-1:0]topWriteAddrDelay5; 
reg[14-1:0]topWriteAddrDelay6; 
reg[14-1:0]topWriteAddrDelay7; 
reg[14-1:0]topWriteAddrDelay8; 
reg[14-1:0]topWriteAddrDelay9; 
reg[14-1:0]topWriteAddrDelay10; 
reg[14-1:0]topWriteAddrDelay11; 
reg[14-1:0]topWriteAddrDelay12; 
reg[14-1:0]topWriteAddrDelay13; 
reg[14-1:0]topWriteAddrDelay14; 
reg[14-1:0]topWriteAddrDelay15; 
reg[14-1:0]topWriteAddrDelay16; 
reg[14-1:0]topWriteAddrDelay17; 
reg[14-1:0]topWriteAddrDelay18; 
reg[14-1:0]topWriteAddrDelay19; 
reg[14-1:0]topWriteAddrDelay20; 
reg[14-1:0]topWriteAddrDelay21; 
reg[14-1:0]topWriteAddrDelay22; 
reg[14-1:0]topWriteAddrDelay23; 
reg[14-1:0]topWriteAddrDelay24; 
reg[14-1:0]topWriteAddrDelay25; 
reg[14-1:0]topWriteAddrDelay26; 
reg[14-1:0]topWriteAddrDelay27; 
reg[14-1:0]topWriteAddrDelay28; 
reg[14-1:0]topWriteAddrDelay29; 
reg[14-1:0]topWriteAddrDelay30; 
reg[14-1:0]topWriteAddrDelay31; 

reg [32-1:0]topWriteEnDelay;
reg [5-1:0]topSourceSelDelay;
reg[6-1:0]topWriteSelDelay0; 
reg[6-1:0]topWriteSelDelay1; 
reg[6-1:0]topWriteSelDelay2; 
reg[6-1:0]topWriteSelDelay3; 
reg[6-1:0]topWriteSelDelay4; 
reg[6-1:0]topWriteSelDelay5; 
reg[6-1:0]topWriteSelDelay6; 
reg[6-1:0]topWriteSelDelay7; 
reg[6-1:0]topWriteSelDelay8; 
reg[6-1:0]topWriteSelDelay9; 
reg[6-1:0]topWriteSelDelay10; 
reg[6-1:0]topWriteSelDelay11; 
reg[6-1:0]topWriteSelDelay12; 
reg[6-1:0]topWriteSelDelay13; 
reg[6-1:0]topWriteSelDelay14; 
reg[6-1:0]topWriteSelDelay15; 
reg[6-1:0]topWriteSelDelay16; 
reg[6-1:0]topWriteSelDelay17; 
reg[6-1:0]topWriteSelDelay18; 
reg[6-1:0]topWriteSelDelay19; 
reg[6-1:0]topWriteSelDelay20; 
reg[6-1:0]topWriteSelDelay21; 
reg[6-1:0]topWriteSelDelay22; 
reg[6-1:0]topWriteSelDelay23; 
reg[6-1:0]topWriteSelDelay24; 
reg[6-1:0]topWriteSelDelay25; 
reg[6-1:0]topWriteSelDelay26; 
reg[6-1:0]topWriteSelDelay27; 
reg[6-1:0]topWriteSelDelay28; 
reg[6-1:0]topWriteSelDelay29; 
reg[6-1:0]topWriteSelDelay30; 
reg[6-1:0]topWriteSelDelay31; 

reg [6-1:0]diagEnDelay;
reg[6-1:0]MOEnDelay;
reg [8-1:0]waitCycles;

// register store m, n and mdivk value
always @ (posedge clk)
begin
	if (start_in == 1'b1)
	begin
		n <= n_in;
		m <= m_in;
		loop <= loop_in;
		mode <= mode_in;
	end
	if (mode[0] == 1'b0 && m == loop)
		stop <= loop;
	else
		stop <= loop+1'b1;
	stop2 <= loop;
	startDelay[0] <= start_in;
	startDelay[1] <= startDelay[0];
	startDelay[2] <= startDelay[1];
	startDelay[3] <= startDelay[2];
	startDelay[4] <= startDelay[3];
	startDelay[5] <= startDelay[4];
	startDelay[6] <= startDelay[5];
	startDelay[7] <= startDelay[6];
	startDelay[8] <= startDelay[7];
	startDelay[9] <= startDelay[8];
	startDelay[10] <= startDelay[9];
	startDelay[11] <= startDelay[10];
	startDelay[12] <= startDelay[11];
	startDelay[13] <= startDelay[12];
	startDelay[14] <= startDelay[13];
	startDelay[15] <= startDelay[14];
	start <= startDelay[15];
	mdivk <= (m+64-1)>>6;
end

// registers that store values that are used in FSM, dependent on i and/or j
always @ (posedge clk)
begin
	if (start == 1'b1)
		topIdx <= 2'b00; //offset1divk;
	else if (currentState == `cINCRE_I && i1modk == 64-1 && mode[0] == 1'b0)
		topIdx <= topIdx + 1'b1;
		
	if (start == 1'b1)
		diagIdx <= 8'b00000000;
	else if (currentState == `cSTORE_DIAG && mode == 2'b01)
		diagIdx <= 2;	else if (currentState == `cINCRE_I)
	begin
		if ((imodk == 64-1 && mode == 2'b00) || (i1modk == 64-1 && mode == 2'b01))
			diagIdx <= diagIdx + 2 + 1;
		else
			diagIdx <= diagIdx + 2;
	end
	
	if (start == 1'b1)
		leftIdx <= 8'b00000000;
	else if (currentState == `cINCRE_I)
	begin
		if (i1modk == 64-1 && mode[0] == 1'b0)
			leftIdx <= leftIdx + 2 + 1;
		else
			leftIdx <= leftIdx + 2;
	end

	if (start == 1'b1)
		msIdx <= 8'b00000000;
	else if (currentState == `cUPDATE_J)
		if (mode[1] == 1'b0)
			msIdx <= leftIdx + 2;
		else
			msIdx <= topIdx;
	else if (nextRowState == `cLOAD_ROW_INC_J)
		msIdx <= msIdx + 2;

	if (start == 1'b1)
		imodk <= 6'b000000;
	else if (currentState == `cINCRE_I)
	begin
		if (imodk == 64-1)
		imodk <= 6'b000000;
		else
			imodk <= imodk + 1'b1;
	end
	
	if (start == 1'b1)
		i1modk <= 6'b000001;
	else if (currentState == `cINCRE_I)
	begin
		if (i1modk == 64-1)
		i1modk <= 6'b000000;
		else
			i1modk <= i1modk + 1'b1;
	end
	
	if (start == 1'b1)
		nextTopIdx <= 14'b00000000000000;
	else if (currentState == `cINCRE_I)
		if (mode[1] == 0)
			nextTopIdx <= nextTopIdx + n + 1;
		else
			nextTopIdx <= nextTopIdx + n;
 nextTopIdx2 <= nextTopIdx + n + 1;

	if (start == 1'b1)
		curTopIdx <= 14'b00000000000001;
	else if (currentState == `cUPDATE_J)
   if (mode[1] == 1'b0)
		  curTopIdx <= nextTopIdx+1;
   else
		  curTopIdx <= nextTopIdx;
	else if (nextRowState == `cLOAD_ROW_INC_J)
		curTopIdx <= curTopIdx + 1;
	
	if (start == 1'b1)
		i1 <= 8'b00000001;
	else if (currentState == `cINCRE_I)
	   i1 <= i1 + 1;

	if (start == 1'b1)
		j <= 8'b00000000;
	else if (currentState == `cUPDATE_J)
		if (mode[1] == 1'b0)
			j <= i1;
		else
		j <= 8'b00000000;
	else if (currentRowState == `cLOAD_ROW_INC_J)
		j <= j + 1;

// compute cycles of delay in FSM
	if (currentState == `cSTORE_MO)
		waitCycles <= 32-1;
	else if (currentState == `cINCRE_I)
	begin
		if (i1 == stop-1)
			if (mode[1] == 1'b1)
				waitCycles <= 32-1 + 6 - 3;
			else
				waitCycles <= waitCycles + 5 - 2;
		else if (mode == 2'b01 && waitCycles < 32-1 - (16-1) - 4)
			waitCycles <= 32-1 - (16-1) - 4;
		else if (mode == 2'b10 && i1modk == 64-1)
			waitCycles <= 32-1 + 6 - 3;
		else if (mode == 2'b00)
			waitCycles <= waitCycles + 6 ;
	end
else if (waitCycles >8'b00000000)
		waitCycles <= waitCycles - 1;

end

// determining next state of main FSM
always @ (currentState or start or mode or m or n or counter or mdivk or topIdxCounter or doneFetchRow or divCounter or j or stop2 or waitCycles or stop or i1)
begin
	case (currentState)
	`cSETUP:
	begin
		if (start == 1'b1)
			nextState = `cSTART;
		else
			nextState = `cSETUP;
		updateCounter = 1'b1;
	end
	`cSTART:
	begin
		if (mode == 2'b00)
		begin
			if (m == 1 && n == 1)
				nextState = `cDONE;
			else
				nextState = `cFETCH_COL;
		end
		else if (mode == 2'b01)
			nextState = `cSTORE_DIAG;
		else if (mode == 2'b10)
			nextState = `cSTART_FETCH_ROW;
		else
			nextState = `cUPDATE_J;
		updateCounter = 1'b1;
	end
	`cSTART_FETCH_ROW:
	begin
		if (counter == 5+6-1)
   begin
		  if (mode == 2'b00)
			  nextState = `cSTORE_DIAG;
		  else
			  nextState = `cUPDATE_J;
	  end
		else
			nextState = `cSTART_FETCH_ROW;
		updateCounter = 1'b0;
	end
	`cFETCH_COL:
		if (counter >= mdivk-1)
		begin
			if (mode == 2'b00 && counter < 5)
			begin
				nextState = `cWAIT_COL;
				updateCounter = 1'b0;
			end
			else
			begin
				if (mode == 2'b00)
					nextState = `cSTART_FETCH_ROW;
				else
					nextState = `cFIND_REC;
				updateCounter = 1'b1;
			end
		end
		else
		begin
			nextState = `cFETCH_COL;
			updateCounter = 1'b0;
		end
	`cWAIT_COL:
		if (counter >= 5)
		begin
			if (mode == 0)
				nextState = `cSTART_FETCH_ROW;
			else
				nextState = `cFIND_REC;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cWAIT_COL;
			updateCounter = 0;
		end
	`cSTORE_DIAG:
	begin
		if (mode == 0)
			nextState =  `cFIND_REC;
		else
			nextState =  `cFETCH_COL;
		updateCounter = 1;
	end
	`cFIND_REC:
		if (divCounter == 56)
		begin
			if (mode == 0)
				nextState = `cMULT_COL;
			else
				nextState = `cSTORE_DIAG2;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cFIND_REC;
			updateCounter = 0;
		end
	`cSTORE_DIAG2:
	begin
		nextState =  `cMULT_COL;
		updateCounter = 1;
	end
	`cMULT_COL:
		if (topIdxCounter == mdivk-1)
		begin
			nextState = `cUPDATE_J;
			updateCounter = 0;
		end
		else
		begin
			nextState = `cMULT_COL;
			updateCounter = 0;
		end
	`cUPDATE_J:
		if ((mode[1] == 1 || counter >= 16-1) && doneFetchRow == 1)
		begin
			nextState = `cSTORE_MO;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cUPDATE_J;
			updateCounter = 0;
		end
	`cSTORE_MO:
	begin
		if (j == stop2)
		begin
			if (counter == mdivk-1+5-2)
				nextState = `cDONE;
			else
				nextState = `cSTORE_MO;
			updateCounter = 0;
		end
		else
		begin
			nextState =  `cMULT_SUB;
			updateCounter = 1;
		end
	end
	`cMULT_SUB:
		if (topIdxCounter == mdivk-1)
		begin
			if (j == n-1)
				nextState = `cINCRE_I;
			else
				nextState = `cMULT_SUB;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cMULT_SUB;
			updateCounter = 0;
		end
	`cINCRE_I:
	begin
		nextState = `cWAIT;
		updateCounter = 1;
	end
	`cWAIT:
		if (waitCycles == 0)
		begin
			if (i1 == stop)
				nextState = `cDONE;
			else if (mode == 0)
				nextState = `cSTORE_DIAG;
			else if (mode == 1)
				nextState = `cFIND_REC;
			else
				nextState = `cUPDATE_J;
			updateCounter = 1;
		end
		else
		begin
			nextState = `cWAIT;
			updateCounter = 0;
		end
	`cDONE:
	begin
		nextState = `cDONE;
		updateCounter = 0;
	end
	default:
	begin
		nextState = `cSETUP;
		updateCounter = 1;
	end
	endcase
end

always @ (currentRowState or currentState or nextState or i1 or topIdxCounter or mdivk or msIdxCounter or readRowCounter or j or n or mode)
begin
	if (currentRowState == `cDONE_FETCH_ROW)
		doneFetchRow = 1;
	else
		doneFetchRow = 0;
		if((nextState == `cSTART_FETCH_ROW && currentState != `cSTART_FETCH_ROW && i1 == 1))
		startFetchRow = 1;
	else
		startFetchRow = 0;
	if (currentState == `cMULT_SUB && topIdxCounter+2 == mdivk)
		loadRow = 1;
	else
		loadRow = 0;
	writeRow = (msIdxCounter == readRowCounter)&&(currentState==`cMULT_SUB)&&(j!=n)&&(mode[0] == 0);
end

// second FSM that controls the control signals to temp_top block
always @ (currentRowState or nextTopIdxCounter or n or startFetchRow or loadRow or topIdx or mdivk or nextState)
begin
	case (currentRowState)
	`cFETCH_ROW:
		if (nextTopIdxCounter == n-1)
			nextRowState = `cDONE_FETCH_ROW;
		else
			nextRowState = `cFETCH_ROW;
	`cDONE_FETCH_ROW:
		if (startFetchRow == 1)
			nextRowState = `cFETCH_ROW;
		else if (loadRow == 1 || (topIdx+1 == mdivk && nextState == `cMULT_SUB))
			nextRowState = `cLOAD_ROW_INC_J;
		else
			nextRowState = `cDONE_FETCH_ROW;
	`cLOAD_ROW_INC_J:
		if (topIdx+1 == mdivk && nextState == `cMULT_SUB)
			nextRowState = `cLOAD_ROW_INC_J;
		else
			nextRowState = `cDONE_FETCH_ROW;
	default:
		nextRowState = `cDONE_FETCH_ROW;
	endcase
end

// address counters
always @ (posedge clk)
begin
	if (updateCounter == 1 || currentRowState == `cLOAD_ROW_INC_J)
		topIdxCounter <= topIdx;
	else
		topIdxCounter <= topIdxCounter + 1;

	if (updateCounter == 1)
		diagIdxCounter <= diagIdx;
	else
		diagIdxCounter <= diagIdxCounter + 1;

	if (updateCounter == 1 || currentRowState == `cLOAD_ROW_INC_J)
		msIdxCounter <= msIdx;
	else
		msIdxCounter <= msIdxCounter + 1;

	if (updateCounter == 1 || currentRowState == `cLOAD_ROW_INC_J)
		leftIdxCounter <= leftIdx;
	else
		leftIdxCounter <= leftIdxCounter + 1;
	
	if (currentState == `cFETCH_COL || currentState == `cSTORE_MO)
		topWriteCounter <= i1;
	else if (writeRow == 1 || currentRowState == `cFETCH_ROW)
		topWriteCounter <= topWriteCounter + 1;

	if (currentState == `cSTART)
		nextTopIdxCounter <= nextTopIdx;
 else if (currentState == `cSTORE_MO)
		if (mode[1] == 0)
			nextTopIdxCounter <= nextTopIdx + n + 1;
		else
			nextTopIdxCounter <= nextTopIdx + n;
	else if (writeRow == 1 || currentRowState == `cFETCH_ROW)
		nextTopIdxCounter <= nextTopIdxCounter + 1;

	if (currentState == `cSTART)
			readRowCounter <= 0; //offsetdivk;
	else if (currentState == `cSTORE_MO)
		if (mode[1] == 0)
			readRowCounter <= leftIdx + 2;
		else
			readRowCounter <= topIdx;
	else if (writeRow == 1 || currentRowState == `cFETCH_ROW)
	   readRowCounter <= readRowCounter + 2;

	if (updateCounter == 1)
		counter <= 0;
	else
		counter <= counter + 1;

	if (currentState == `cSTORE_DIAG || currentState == `cSTORE_DIAG2)
		divCounter <= 0;
	else if (divCounter < 56)
		divCounter <= divCounter + 1;

	case (i1modk) 
		6'b000000: begin
			i1modkByteEn <= ~(256'b0) >> (6'b000000<<2'b10);
		end
		6'b000001: begin
			i1modkByteEn <= ~(256'b0) >> (6'b000001<<2'b10);
		end
		6'b000010: begin
			i1modkByteEn <= ~(256'b0) >> (6'b000010<<2'b10);
		end
		6'b000011: begin
			i1modkByteEn <= ~(256'b0) >> (6'b000011<<2'b10);
		end
		6'b000100: begin
			i1modkByteEn <= ~(256'b0) >> (6'b000100<<2'b10);
		end
		6'b000101: begin
			i1modkByteEn <= ~(256'b0) >> (6'b000101<<2'b10);
		end
		6'b000110: begin
			i1modkByteEn <= ~(256'b0) >> (6'b000110<<2'b10);
		end
		6'b000111: begin
			i1modkByteEn <= ~(256'b0) >> (6'b000111<<2'b10);
		end
		6'b001000: begin
			i1modkByteEn <= ~(256'b0) >> (6'b001000<<2'b10);
		end
		6'b001001: begin
			i1modkByteEn <= ~(256'b0) >> (6'b001001<<2'b10);
		end
		6'b001010: begin
			i1modkByteEn <= ~(256'b0) >> (6'b001010<<2'b10);
		end
		6'b001011: begin
			i1modkByteEn <= ~(256'b0) >> (6'b001011<<2'b10);
		end
		6'b001100: begin
			i1modkByteEn <= ~(256'b0) >> (6'b001100<<2'b10);
		end
		6'b001101: begin
			i1modkByteEn <= ~(256'b0) >> (6'b001101<<2'b10);
		end
		6'b001110: begin
			i1modkByteEn <= ~(256'b0) >> (6'b001110<<2'b10);
		end
		6'b001111: begin
			i1modkByteEn <= ~(256'b0) >> (6'b001111<<2'b10);
		end
		6'b010000: begin
			i1modkByteEn <= ~(256'b0) >> (6'b010000<<2'b10);
		end
		6'b010001: begin
			i1modkByteEn <= ~(256'b0) >> (6'b010001<<2'b10);
		end
		6'b010010: begin
			i1modkByteEn <= ~(256'b0) >> (6'b010010<<2'b10);
		end
		6'b010011: begin
			i1modkByteEn <= ~(256'b0) >> (6'b010011<<2'b10);
		end
		6'b010100: begin
			i1modkByteEn <= ~(256'b0) >> (6'b010100<<2'b10);
		end
		6'b010101: begin
			i1modkByteEn <= ~(256'b0) >> (6'b010101<<2'b10);
		end
		6'b010110: begin
			i1modkByteEn <= ~(256'b0) >> (6'b010110<<2'b10);
		end
		6'b010111: begin
			i1modkByteEn <= ~(256'b0) >> (6'b010111<<2'b10);
		end
		6'b011000: begin
			i1modkByteEn <= ~(256'b0) >> (6'b011000<<2'b10);
		end
		6'b011001: begin
			i1modkByteEn <= ~(256'b0) >> (6'b011001<<2'b10);
		end
		6'b011010: begin
			i1modkByteEn <= ~(256'b0) >> (6'b011010<<2'b10);
		end
		6'b011011: begin
			i1modkByteEn <= ~(256'b0) >> (6'b011011<<2'b10);
		end
		6'b011100: begin
			i1modkByteEn <= ~(256'b0) >> (6'b011100<<2'b10);
		end
		6'b011101: begin
			i1modkByteEn <= ~(256'b0) >> (6'b011101<<2'b10);
		end
		6'b011110: begin
			i1modkByteEn <= ~(256'b0) >> (6'b011110<<2'b10);
		end
		6'b011111: begin
			i1modkByteEn <= ~(256'b0) >> (6'b011111<<2'b10);
		end
		6'b100000: begin
			i1modkByteEn <= ~(256'b0) >> (6'b100000<<2'b10);
		end
		6'b100001: begin
			i1modkByteEn <= ~(256'b0) >> (6'b100001<<2'b10);
		end
		6'b100010: begin
			i1modkByteEn <= ~(256'b0) >> (6'b100010<<2'b10);
		end
		6'b100011: begin
			i1modkByteEn <= ~(256'b0) >> (6'b100011<<2'b10);
		end
		6'b100100: begin
			i1modkByteEn <= ~(256'b0) >> (6'b100100<<2'b10);
		end
		6'b100101: begin
			i1modkByteEn <= ~(256'b0) >> (6'b100101<<2'b10);
		end
		6'b100110: begin
			i1modkByteEn <= ~(256'b0) >> (6'b100110<<2'b10);
		end
		6'b100111: begin
			i1modkByteEn <= ~(256'b0) >> (6'b100111<<2'b10);
		end
		6'b101000: begin
			i1modkByteEn <= ~(256'b0) >> (6'b101000<<2'b10);
		end
		6'b101001: begin
			i1modkByteEn <= ~(256'b0) >> (6'b101001<<2'b10);
		end
		6'b101010: begin
			i1modkByteEn <= ~(256'b0) >> (6'b101010<<2'b10);
		end
		6'b101011: begin
			i1modkByteEn <= ~(256'b0) >> (6'b101011<<2'b10);
		end
		6'b101100: begin
			i1modkByteEn <= ~(256'b0) >> (6'b101100<<2'b10);
		end
		6'b101101: begin
			i1modkByteEn <= ~(256'b0) >> (6'b101101<<2'b10);
		end
		6'b101110: begin
			i1modkByteEn <= ~(256'b0) >> (6'b101110<<2'b10);
		end
		6'b101111: begin
			i1modkByteEn <= ~(256'b0) >> (6'b101111<<2'b10);
		end
		6'b110000: begin
			i1modkByteEn <= ~(256'b0) >> (6'b110000<<2'b10);
		end
		6'b110001: begin
			i1modkByteEn <= ~(256'b0) >> (6'b110001<<2'b10);
		end
		6'b110010: begin
			i1modkByteEn <= ~(256'b0) >> (6'b110010<<2'b10);
		end
		6'b110011: begin
			i1modkByteEn <= ~(256'b0) >> (6'b110011<<2'b10);
		end
		6'b110100: begin
			i1modkByteEn <= ~(256'b0) >> (6'b110100<<2'b10);
		end
		6'b110101: begin
			i1modkByteEn <= ~(256'b0) >> (6'b110101<<2'b10);
		end
		6'b110110: begin
			i1modkByteEn <= ~(256'b0) >> (6'b110110<<2'b10);
		end
		6'b110111: begin
			i1modkByteEn <= ~(256'b0) >> (6'b110111<<2'b10);
		end
		6'b111000: begin
			i1modkByteEn <= ~(256'b0) >> (6'b111000<<2'b10);
		end
		6'b111001: begin
			i1modkByteEn <= ~(256'b0) >> (6'b111001<<2'b10);
		end
		6'b111010: begin
			i1modkByteEn <= ~(256'b0) >> (6'b111010<<2'b10);
		end
		6'b111011: begin
			i1modkByteEn <= ~(256'b0) >> (6'b111011<<2'b10);
		end
		6'b111100: begin
			i1modkByteEn <= ~(256'b0) >> (6'b111100<<2'b10);
		end
		6'b111101: begin
			i1modkByteEn <= ~(256'b0) >> (6'b111101<<2'b10);
		end
		6'b111110: begin
			i1modkByteEn <= ~(256'b0) >> (6'b111110<<2'b10);
		end
		6'b111111: begin
			i1modkByteEn <= ~(256'b0) >> (6'b111111<<2'b10);
		end
		default: begin
			i1modkByteEn <= ~(256'b0);
		end
	endcase
end

// compute Byte Enable
always @ (posedge clk)
begin
	if ((nextState == `cMULT_COL && currentState != `cMULT_COL) || (currentState == `cSTORE_MO) || currentRowState == `cLOAD_ROW_INC_J)
		byteEn <= i1modkByteEn;
	else
		byteEn <= 256'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
end

// update FSM state register
always @ (posedge clk)
begin
	if (start_in == 1'b1)
		currentState <= `cSETUP;
	else
		currentState <= nextState;
	if (start == 1'b1)
		currentRowState <= `cDONE_FETCH_ROW;
	else
		currentRowState <= nextRowState;
end

// delay register for control signals
// control signals are delayed to match latency of operations and/or memory access
always @ (posedge clk)
begin
	curReadAddrDelay0 <= curReadAddrDelay1;
	curReadAddrDelay1 <= curReadAddrDelay2;
	curReadAddrDelay2 <= curReadAddrDelay3;
	curReadAddrDelay3 <= curReadAddrDelay4;
	curReadAddrDelay4 <= curReadAddrDelay5;
	curReadAddrDelay5 <= curReadAddrDelay6;
	curReadAddrDelay6 <= curReadAddrDelay7;
	curReadAddrDelay7 <= curReadAddrDelay8;
	curReadAddrDelay8 <= curReadAddrDelay9;
	curReadAddrDelay9 <= curReadAddrDelay10;
	curReadAddrDelay10 <= curReadAddrDelay11;
	curReadAddrDelay11 <= msIdxCounter;
	
	curWriteAddrDelay0 <= curWriteAddrDelay1;
	curWriteAddrDelay1 <= curWriteAddrDelay2;
	curWriteAddrDelay2 <= curWriteAddrDelay3;
	curWriteAddrDelay3 <= curWriteAddrDelay4;
	if (currentState == `cFETCH_COL)
		curWriteAddrDelay4 <= diagIdxCounter;
	else
		curWriteAddrDelay4 <= curWriteAddrDelay5;
	curWriteAddrDelay5 <= curWriteAddrDelay6;
	curWriteAddrDelay6 <= curWriteAddrDelay7;
	curWriteAddrDelay7 <= curWriteAddrDelay8;
	curWriteAddrDelay8 <= curWriteAddrDelay9;
	curWriteAddrDelay9 <= curWriteAddrDelay10;
	curWriteAddrDelay10 <= curWriteAddrDelay11;
	curWriteAddrDelay11 <= curWriteAddrDelay12;
	curWriteAddrDelay12 <= curWriteAddrDelay13;
	curWriteAddrDelay13 <= curWriteAddrDelay14;
	curWriteAddrDelay14 <= curWriteAddrDelay15;
	if (currentState == `cMULT_COL)
		curWriteAddrDelay15 <= leftIdxCounter;
	else
		curWriteAddrDelay15 <= curWriteAddrDelay16;
	curWriteAddrDelay16 <= curWriteAddrDelay17;
	curWriteAddrDelay17 <= curWriteAddrDelay18;
	curWriteAddrDelay18 <= curWriteAddrDelay19;
	curWriteAddrDelay19 <= curWriteAddrDelay20;
	curWriteAddrDelay20 <= curWriteAddrDelay21;
	curWriteAddrDelay21 <= curWriteAddrDelay22;
	curWriteAddrDelay22 <= curWriteAddrDelay23;
	curWriteAddrDelay23 <= curWriteAddrDelay24;
	curWriteAddrDelay24 <= curWriteAddrDelay25;
	curWriteAddrDelay25 <= curWriteAddrDelay26;
	curWriteAddrDelay26 <= curWriteAddrDelay27;
	curWriteAddrDelay27 <= curWriteAddrDelay28;
	curWriteAddrDelay28 <= curWriteAddrDelay29;
	curWriteAddrDelay29 <= curWriteAddrDelay30;
	curWriteAddrDelay30 <= curWriteAddrDelay31;
	curWriteAddrDelay31 <= msIdxCounter;
	
	writeByteEnDelay0 <= writeByteEnDelay1;
	writeByteEnDelay1 <= writeByteEnDelay2;
	writeByteEnDelay2 <= writeByteEnDelay3;
	writeByteEnDelay3 <= writeByteEnDelay4;
	if (mode[0] == 1'b1)
		writeByteEnDelay4 <= ~0;
	else if (currentState == `cFETCH_COL)
		writeByteEnDelay4 <= byteEn;
	else
		writeByteEnDelay4 <= writeByteEnDelay5;
	writeByteEnDelay5 <= writeByteEnDelay6;
	writeByteEnDelay6 <= writeByteEnDelay7;
	writeByteEnDelay7 <= writeByteEnDelay8;
	writeByteEnDelay8 <= writeByteEnDelay9;
	writeByteEnDelay9 <= writeByteEnDelay10;
	writeByteEnDelay10 <= writeByteEnDelay11;
	writeByteEnDelay11 <= writeByteEnDelay12;
	writeByteEnDelay12 <= writeByteEnDelay13;
	writeByteEnDelay13 <= writeByteEnDelay14;
	writeByteEnDelay14 <= writeByteEnDelay15;
	if (currentState == `cMULT_COL)
		writeByteEnDelay15 <= byteEn;
	else
		writeByteEnDelay15 <= writeByteEnDelay16;
	writeByteEnDelay16 <= writeByteEnDelay17;
	writeByteEnDelay17 <= writeByteEnDelay18;
	writeByteEnDelay18 <= writeByteEnDelay19;
	writeByteEnDelay19 <= writeByteEnDelay20;
	writeByteEnDelay20 <= writeByteEnDelay21;
	writeByteEnDelay21 <= writeByteEnDelay22;
	writeByteEnDelay22 <= writeByteEnDelay23;
	writeByteEnDelay23 <= writeByteEnDelay24;
	writeByteEnDelay24 <= writeByteEnDelay25;
	writeByteEnDelay25 <= writeByteEnDelay26;
	writeByteEnDelay26 <= writeByteEnDelay27;
	writeByteEnDelay27 <= writeByteEnDelay28;
	writeByteEnDelay28 <= writeByteEnDelay29;
	writeByteEnDelay29 <= writeByteEnDelay30;
	writeByteEnDelay30 <= writeByteEnDelay31;
	writeByteEnDelay31 <= byteEn;
	
	curWriteSelDelay[0] <= curWriteSelDelay[1];
	curWriteSelDelay[1] <= curWriteSelDelay[2];
	curWriteSelDelay[2] <= curWriteSelDelay[3];
	curWriteSelDelay[3] <= curWriteSelDelay[4];
	curWriteSelDelay[4] <= curWriteSelDelay[5];
	curWriteSelDelay[5] <= curWriteSelDelay[6];
	curWriteSelDelay[6] <= curWriteSelDelay[7];
	curWriteSelDelay[7] <= curWriteSelDelay[8];
	curWriteSelDelay[8] <= curWriteSelDelay[9];
	curWriteSelDelay[9] <= curWriteSelDelay[10];
	curWriteSelDelay[10] <= curWriteSelDelay[11];
	curWriteSelDelay[11] <= curWriteSelDelay[12];
	curWriteSelDelay[12] <= curWriteSelDelay[13];
	curWriteSelDelay[13] <= curWriteSelDelay[14];
	curWriteSelDelay[14] <= curWriteSelDelay[15];
	if (currentState == `cMULT_COL)
		curWriteSelDelay[15] <= 1'b0;
	else
		curWriteSelDelay[15] <= 1'b1;

	curWriteEnDelay[0] <= curWriteEnDelay[1];
	curWriteEnDelay[1] <= curWriteEnDelay[2];
	curWriteEnDelay[2] <= curWriteEnDelay[3];
	curWriteEnDelay[3] <= curWriteEnDelay[4];
	curWriteEnDelay[4] <= curWriteEnDelay[5];
	curWriteEnDelay[5] <= curWriteEnDelay[6];
	curWriteEnDelay[6] <= curWriteEnDelay[7];
	curWriteEnDelay[7] <= curWriteEnDelay[8];
	curWriteEnDelay[8] <= curWriteEnDelay[9];
	curWriteEnDelay[9] <= curWriteEnDelay[10];
	curWriteEnDelay[10] <= curWriteEnDelay[11];
	curWriteEnDelay[11] <= curWriteEnDelay[12];
	curWriteEnDelay[12] <= curWriteEnDelay[13];
	curWriteEnDelay[13] <= curWriteEnDelay[14];
	curWriteEnDelay[14] <= curWriteEnDelay[15];
	if (currentState == `cMULT_COL)
		curWriteEnDelay[15] <= 1'b1;
	else
		curWriteEnDelay[15] <= curWriteEnDelay[16];
	curWriteEnDelay[16] <= curWriteEnDelay[17];
	curWriteEnDelay[17] <= curWriteEnDelay[18];
	curWriteEnDelay[18] <= curWriteEnDelay[19];
	curWriteEnDelay[19] <= curWriteEnDelay[20];
	curWriteEnDelay[20] <= curWriteEnDelay[21];
	curWriteEnDelay[21] <= curWriteEnDelay[22];
	curWriteEnDelay[22] <= curWriteEnDelay[23];
	curWriteEnDelay[23] <= curWriteEnDelay[24];
	curWriteEnDelay[24] <= curWriteEnDelay[25];
	curWriteEnDelay[25] <= curWriteEnDelay[26];
	curWriteEnDelay[26] <= curWriteEnDelay[27];
	curWriteEnDelay[27] <= curWriteEnDelay[28];
	curWriteEnDelay[28] <= curWriteEnDelay[29];
	curWriteEnDelay[29] <= curWriteEnDelay[30];
	curWriteEnDelay[30] <= curWriteEnDelay[31];
	if (currentState == `cMULT_SUB)
		curWriteEnDelay[31] <= 1'b1;
	else
		curWriteEnDelay[31] <= 1'b0;

	leftWriteSelDelay[0] <= leftWriteSelDelay[1];
	leftWriteSelDelay[1] <= leftWriteSelDelay[2];
	leftWriteSelDelay[2] <= leftWriteSelDelay[3];
	leftWriteSelDelay[3] <= leftWriteSelDelay[4];
	if (currentState == `cFETCH_COL)
		leftWriteSelDelay[4] <= 1'b0;
	else
		leftWriteSelDelay[4] <= 1'b1;

	leftWriteEnDelay[0] <= leftWriteEnDelay[1];
	leftWriteEnDelay[1] <= leftWriteEnDelay[2];
	leftWriteEnDelay[2] <= leftWriteEnDelay[3];
	leftWriteEnDelay[3] <= leftWriteEnDelay[4];
	if (currentState == `cFETCH_COL)
		leftWriteEnDelay[4] <= 1'b1;
	else
		leftWriteEnDelay[4] <= leftWriteEnDelay[5];
	leftWriteEnDelay[5] <= leftWriteEnDelay[6];
	leftWriteEnDelay[6] <= leftWriteEnDelay[7];
	leftWriteEnDelay[7] <= leftWriteEnDelay[8];
	leftWriteEnDelay[8] <= leftWriteEnDelay[9];
	leftWriteEnDelay[9] <= leftWriteEnDelay[10];
	leftWriteEnDelay[10] <= leftWriteEnDelay[11];
	leftWriteEnDelay[11] <= leftWriteEnDelay[12];
	leftWriteEnDelay[12] <= leftWriteEnDelay[13];
	leftWriteEnDelay[13] <= leftWriteEnDelay[14];
	leftWriteEnDelay[14] <= leftWriteEnDelay[15];
	if (currentState == `cMULT_COL)
		leftWriteEnDelay[15] <= 1'b1;
	else
		leftWriteEnDelay[15] <= leftWriteEnDelay[16];
	leftWriteEnDelay[16] <= leftWriteEnDelay[17];
	leftWriteEnDelay[17] <= leftWriteEnDelay[18];
	leftWriteEnDelay[18] <= leftWriteEnDelay[19];
	leftWriteEnDelay[19] <= leftWriteEnDelay[20];
	leftWriteEnDelay[20] <= leftWriteEnDelay[21];
	leftWriteEnDelay[21] <= leftWriteEnDelay[22];
	leftWriteEnDelay[22] <= leftWriteEnDelay[23];
	leftWriteEnDelay[23] <= leftWriteEnDelay[24];
	leftWriteEnDelay[24] <= leftWriteEnDelay[25];
	leftWriteEnDelay[25] <= leftWriteEnDelay[26];
	leftWriteEnDelay[26] <= leftWriteEnDelay[27];
	leftWriteEnDelay[27] <= leftWriteEnDelay[28];
	leftWriteEnDelay[28] <= leftWriteEnDelay[29];
	leftWriteEnDelay[29] <= leftWriteEnDelay[30];
	leftWriteEnDelay[30] <= leftWriteEnDelay[31];
	if (currentState == `cMULT_SUB && (mode == 0 || (mode == 1 && j == i1)))
		leftWriteEnDelay[31] <= 1'b1;
	else
		leftWriteEnDelay[31] <= 1'b0;

	topWriteAddrDelay0 <= topWriteAddrDelay1;
	topWriteAddrDelay1 <= topWriteAddrDelay2;
	topWriteAddrDelay2 <= topWriteAddrDelay3;
	topWriteAddrDelay3 <= topWriteAddrDelay4;
	if (currentRowState == `cFETCH_ROW)
		topWriteAddrDelay4 <= nextTopIdxCounter;
	else
		topWriteAddrDelay4 <=  topWriteAddrDelay5;
	topWriteAddrDelay5 <= topWriteAddrDelay6;
	topWriteAddrDelay6 <= topWriteAddrDelay7;
	topWriteAddrDelay7 <= topWriteAddrDelay8;
	topWriteAddrDelay8 <= topWriteAddrDelay9;
	topWriteAddrDelay9 <= topWriteAddrDelay10;
	topWriteAddrDelay10 <= topWriteAddrDelay11;
	topWriteAddrDelay11 <= topWriteAddrDelay12;
	topWriteAddrDelay12 <= topWriteAddrDelay13;
	topWriteAddrDelay13 <= topWriteAddrDelay14;
	topWriteAddrDelay14 <= topWriteAddrDelay15;
	topWriteAddrDelay15 <= topWriteAddrDelay16;
	topWriteAddrDelay16 <= topWriteAddrDelay17;
	topWriteAddrDelay17 <= topWriteAddrDelay18;
	topWriteAddrDelay18 <= topWriteAddrDelay19;
	topWriteAddrDelay19 <= topWriteAddrDelay20;
	topWriteAddrDelay20 <= topWriteAddrDelay21;
	topWriteAddrDelay21 <= topWriteAddrDelay22;
	topWriteAddrDelay22 <= topWriteAddrDelay23;
	topWriteAddrDelay23 <= topWriteAddrDelay24;
	topWriteAddrDelay24 <= topWriteAddrDelay25;
	topWriteAddrDelay25 <= topWriteAddrDelay26;
	topWriteAddrDelay26 <= topWriteAddrDelay27;
	topWriteAddrDelay27 <= topWriteAddrDelay28;
	topWriteAddrDelay28 <= topWriteAddrDelay29;
	topWriteAddrDelay29 <= topWriteAddrDelay30;
	topWriteAddrDelay30 <= topWriteAddrDelay31;
		topWriteAddrDelay31 <= nextTopIdxCounter;

	topWriteEnDelay[0] <= topWriteEnDelay[1];
	topWriteEnDelay[1] <= topWriteEnDelay[2];
	topWriteEnDelay[2] <= topWriteEnDelay[3];
	topWriteEnDelay[3] <= topWriteEnDelay[4];
	if (currentRowState == `cFETCH_ROW)
		topWriteEnDelay[4] <= 1'b1;
	else
		topWriteEnDelay[4] <=  topWriteEnDelay[5];
	topWriteEnDelay[5] <= topWriteEnDelay[6];
	topWriteEnDelay[6] <= topWriteEnDelay[7];
	topWriteEnDelay[7] <= topWriteEnDelay[8];
	topWriteEnDelay[8] <= topWriteEnDelay[9];
	topWriteEnDelay[9] <= topWriteEnDelay[10];
	topWriteEnDelay[10] <= topWriteEnDelay[11];
	topWriteEnDelay[11] <= topWriteEnDelay[12];
	topWriteEnDelay[12] <= topWriteEnDelay[13];
	topWriteEnDelay[13] <= topWriteEnDelay[14];
	topWriteEnDelay[14] <= topWriteEnDelay[15];
	topWriteEnDelay[15] <= topWriteEnDelay[16];
	topWriteEnDelay[16] <= topWriteEnDelay[17];
	topWriteEnDelay[17] <= topWriteEnDelay[18];
	topWriteEnDelay[18] <= topWriteEnDelay[19];
	topWriteEnDelay[19] <= topWriteEnDelay[20];
	topWriteEnDelay[20] <= topWriteEnDelay[21];
	topWriteEnDelay[21] <= topWriteEnDelay[22];
	topWriteEnDelay[22] <= topWriteEnDelay[23];
	topWriteEnDelay[23] <= topWriteEnDelay[24];
	topWriteEnDelay[24] <= topWriteEnDelay[25];
	topWriteEnDelay[25] <= topWriteEnDelay[26];
	topWriteEnDelay[26] <= topWriteEnDelay[27];
	topWriteEnDelay[27] <= topWriteEnDelay[28];
	topWriteEnDelay[28] <= topWriteEnDelay[29];
	topWriteEnDelay[29] <= topWriteEnDelay[30];
	topWriteEnDelay[30] <= topWriteEnDelay[31];
	topWriteEnDelay[31] <= writeRow;

	topWriteSelDelay0 <= topWriteSelDelay1;
	topWriteSelDelay1 <= topWriteSelDelay2;
	topWriteSelDelay2 <= topWriteSelDelay3;
	topWriteSelDelay3 <= topWriteSelDelay4;
	if (currentRowState == `cFETCH_ROW || currentState == `cUPDATE_J && i1 == 1)
		topWriteSelDelay4 <= imodk;
	else
		topWriteSelDelay4 <=  topWriteSelDelay5;
	topWriteSelDelay5 <= topWriteSelDelay6;
	topWriteSelDelay6 <= topWriteSelDelay7;
	topWriteSelDelay7 <= topWriteSelDelay8;
	topWriteSelDelay8 <= topWriteSelDelay9;
	topWriteSelDelay9 <= topWriteSelDelay10;
	topWriteSelDelay10 <= topWriteSelDelay11;
	topWriteSelDelay11 <= topWriteSelDelay12;
	topWriteSelDelay12 <= topWriteSelDelay13;
	topWriteSelDelay13 <= topWriteSelDelay14;
	topWriteSelDelay14 <= topWriteSelDelay15;
	topWriteSelDelay15 <= topWriteSelDelay16;
	topWriteSelDelay16 <= topWriteSelDelay17;
	topWriteSelDelay17 <= topWriteSelDelay18;
	topWriteSelDelay18 <= topWriteSelDelay19;
	topWriteSelDelay19 <= topWriteSelDelay20;
	topWriteSelDelay20 <= topWriteSelDelay21;
	topWriteSelDelay21 <= topWriteSelDelay22;
	topWriteSelDelay22 <= topWriteSelDelay23;
	topWriteSelDelay23 <= topWriteSelDelay24;
	topWriteSelDelay24 <= topWriteSelDelay25;
	topWriteSelDelay25 <= topWriteSelDelay26;
	topWriteSelDelay26 <= topWriteSelDelay27;
	topWriteSelDelay27 <= topWriteSelDelay28;
	topWriteSelDelay28 <= topWriteSelDelay29;
	topWriteSelDelay29 <= topWriteSelDelay30;
	topWriteSelDelay30 <= topWriteSelDelay31;
	topWriteSelDelay31 <= i1modk;

	topSourceSelDelay[0] <= topSourceSelDelay[1];
	topSourceSelDelay[1] <= topSourceSelDelay[2];
	topSourceSelDelay[2] <= topSourceSelDelay[3];
	topSourceSelDelay[3] <= topSourceSelDelay[4];
	if (start == 1'b1)
		topSourceSelDelay[4] <= 1'b0;
	else if (currentState == `cSTORE_MO)
		topSourceSelDelay[4] <= 1'b1;

	leftReadAddrDelay0 <= leftIdxCounter;


	diagEnDelay[0] <= diagEnDelay[1];
	diagEnDelay[1] <= diagEnDelay[2];
	diagEnDelay[2] <= diagEnDelay[3];
	diagEnDelay[3] <= diagEnDelay[4];
	diagEnDelay[4] <= diagEnDelay[5];
	diagEnDelay[5] <= (currentState == `cSTORE_DIAG || currentState == `cSTORE_DIAG2);

	MOEnDelay[0] <= MOEnDelay[1];
	MOEnDelay[1] <= MOEnDelay[2];
	MOEnDelay[2] <= MOEnDelay[3];
	MOEnDelay[3] <= MOEnDelay[4];
	MOEnDelay[4] <= MOEnDelay[5];
	if (currentState == `cSTORE_MO || currentRowState == `cLOAD_ROW_INC_J)
		MOEnDelay[5] <= 1'b1;
	else
		MOEnDelay[5] <= 1'b0;
end

// output contorl signals
always @ (posedge clk)
begin
	if (currentState == `cFETCH_COL)
		curReadAddr <= diagIdxCounter;
	else if (currentRowState == `cFETCH_ROW)
	   curReadAddr <= readRowCounter;
	else
		curReadAddr <= curReadAddrDelay0;
	curWriteAddr <= curWriteAddrDelay0;
	curWriteByteEn <= writeByteEnDelay0;
	curWriteSel <= curWriteSelDelay;
	curWriteEn <= curWriteEnDelay;

	if (currentState == `cMULT_COL)
		leftReadAddr <= leftIdxCounter;
	else
		leftReadAddr <= leftReadAddrDelay0;
	leftWriteAddr <= curWriteAddrDelay0;
	leftWriteByteEn <= writeByteEnDelay0;
	leftWriteSel <= leftWriteSelDelay;
	leftWriteEn <= leftWriteEnDelay;

	if (currentState == `cSTORE_DIAG)
		topReadAddr <= nextTopIdx;
else if (currentState == `cSTORE_DIAG2)
   topReadAddr <= nextTopIdx2;
	else
	topReadAddr <= curTopIdx;
	topWriteAddr <= topWriteAddrDelay0;
	topWriteEn <= topWriteEnDelay;
	topWriteSel <= topWriteSelDelay0;
	topSourceSel <= topSourceSelDelay;

	MOSel <= ~(currentState == `cFIND_REC);
if (currentState == `cFIND_REC)
		MOEn <= 1'b1;
	else
		MOEn <= MOEnDelay;

	diagEn <= diagEnDelay;

	if (currentState == `cDONE)
		done <= 1'b1;
	else
		done <= 1'b0;
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



