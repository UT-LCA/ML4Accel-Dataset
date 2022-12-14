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
			/* tiny */ stilltiny_or_tiny_and_denormround,  
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
