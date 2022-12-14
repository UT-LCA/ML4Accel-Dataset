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
