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
