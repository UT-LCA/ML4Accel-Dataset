`define NWIDTH 6'b010100
`define BLOCKWIDTH 4'b0101
`define DDRWIDTH 7'b0100000
`define DDRNUMDQS 4'b0100
`define DDRSIZEWIDTH 6'b011000
`define BURSTLEN 3'b010
`define MEMCONWIDTH 8'b01000000
`define MEMCONNUMBYTES 5'b01000
`define RAMWIDTH 10'b0100000000
`define RAMNUMBYTES 7'b0100000
`define RAMSIZEWIDTH 4'b0101
`define TOPWIDTH 7'b0100000
`define rFIFOINPUTWIDTH 8'b01000000
`define wFIFOINPUTWIDTH 10'b0100000000
`define mFIFOWIDTH 6'b011100
`define aFIFOWIDTH 4'b0101
`define SIMULATION_MEMORY
`define BLOCKM 6'b010000
`define BLOCKN 6'b010000
`define BLOCKMDIVK 3'b010
`define MEMBLOCKM 5'b01000
`define MEMBLOCKN 5'b01000
`define NWIDTH 6'b010100
`define BLOCKWIDTH 4'b0101
`define DDRSIZEWIDTH 6'b011000
`define RAMSIZEWIDTH 4'b0101
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
`define rRAMSIZEWIDTH 5
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
`define NUMPE 5'b01000
`define PEWIDTH 3'b011
`define BLOCKWIDTH 4'b0101
`define RAMWIDTH 10'b0100000000
`define RAMNUMBYTES 7'b0100000
`define RAMSIZEWIDTH 4'b0101
`define TOPSIZEWIDTH 5'b01000
`define TOPINPUTDELAY 3'b011
`define TOPOUTPUTDELAY 2'b01
`define MEMINPUTDELAY 3'b010
`define MEMOUTPUTDELAY 2'b01
`define TOPWIDTH 7'b0100000
//`define rFIFOINPUTWIDTH 64
`define rFIFOSIZE 64
`define rFIFOSIZEWIDTH 6
`define rFIFOOUTPUTWIDTH 256
`define rFIFORSIZEWIDTH 4
	`define wFIFOINPUTWIDTH 10'b0100000000
	`define wFIFOSIZE 6'b010000
	`define wFIFOSIZEWIDTH 4'b0100
	`define wFIFOOUTPUTWIDTH 8'b01000000
	`define wFIFORSIZEWIDTH 4'b0110
`define aFIFOSIZE 6'b010000
`define aFIFOSIZEWIDTH 4'b0100
`define aFIFOWIDTH 4'b0101
`define mFIFOSIZE 16
`define mFIFOSIZEWIDTH 4
//`define mFIFOWIDTH 28
`define BURSTLEN 3'b010
`define BURSTWIDTH 3'b010
`define DATAWIDTH 10'b0100000000
`define DATANUMBYTES 7'b0100000
`define MEMCONWIDTH 8'b01000000
`define MEMCONNUMBYTES 5'b01000
`define DDRSIZEWIDTH 6'b011000
`define FIFOSIZE 6'b010000
`define FIFOSIZEWIDTH 4'b0100
`define RAMWIDTH 10'b0100000000
`define RAMNUMBYTES 7'b0100000
`define RAMSIZEWIDTH 4'b0101
`define RATIO 4'b0100
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
