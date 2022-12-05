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

module rfifo (
	clk,
	data,
	rdreq,
	wrreq,
	empty,
	q
	);


	input	  clk;
	input	  wrreq;
	input	  rdreq;
	input	[`rFIFOINPUTWIDTH-1:0]  data;
	output	  empty;
	output	[`rFIFOOUTPUTWIDTH-1:0]  q;

	reg [`rFIFORSIZEWIDTH-1:0] wr_pointer;
	reg [`rFIFORSIZEWIDTH-1:0] rd_pointer;
	reg [`rFIFORSIZEWIDTH:0] status_cnt;
	reg [`rFIFOOUTPUTWIDTH-1:0] q ;
	reg[4:0] counter;
	wire [`rFIFOINPUTWIDTH-1:0] data_ram;
assign empty = (status_cnt == 10'b0000000000);
wire [`rFIFOINPUTWIDTH-1:0]junk_input;
wire [`rFIFOINPUTWIDTH-1:0]junk_output;
assign junk_input = 64'b0000000000000000000000000000000000000000000000000000000000000000;
 always @ (posedge clk)
 begin  //WRITE_POINTER
	if (wrreq) 
	begin
 		wr_pointer <= wr_pointer + 1'b1;
	end
end
always @ (posedge clk)
begin  //READ_POINTER
	if (rdreq) 
	begin
	rd_pointer <= rd_pointer + 2'b01;
	end
end
always  @ (posedge clk )
begin  //READ_DATA
if (rdreq) 
	counter <= 0;
else 
	counter <= counter + 2'b01;
if(counter == 0)
	q[`rFIFOINPUTWIDTH-1:0] <= data_ram;
else if (counter == 1)
	q[127:64] <= data_ram;
else if (counter == 2)
	q[191:128] <= data_ram;
else if (counter == 3)
	q[255:192] <= data_ram;
else if (counter == 4)
	q[319:256] <= data_ram;
else if (counter == 5)
	q[383:320] <= data_ram;
else if (counter == 6)
	q[447:384] <= data_ram;
else if (counter == 7)
	q[511:448] <= data_ram;
else if (counter == 8)
	q[575:512] <= data_ram;
else if (counter == 9)
	q[639:576] <= data_ram;
else if (counter == 10)
	q[703:640] <= data_ram;
else if (counter == 11)
	q[767:704] <= data_ram;
else if (counter == 12)
	q[831:768] <= data_ram;
else if (counter == 13)
	q[895:832] <= data_ram;
else if (counter == 14)
	q[959:896] <= data_ram;
else if (counter == 15)
	q[1023:960] <= data_ram;
else if (counter == 16)
	q[1087:1024] <= data_ram;
else if (counter == 17)
	q[1151:1088] <= data_ram;
else if (counter == 18)
	q[1215:1152] <= data_ram;
else if (counter == 19)
	q[1279:1216] <= data_ram;
else if (counter == 20)
	q[1343:1280] <= data_ram;
else if (counter == 21)
	q[1407:1344] <= data_ram;
else if (counter == 22)
	q[1471:1408] <= data_ram;
else if (counter == 23)
	q[1535:1472] <= data_ram;
else if (counter == 24)
	q[1599:1536] <= data_ram;
else if (counter == 25)
	q[1663:1600] <= data_ram;
else if (counter == 26)
	q[1727:1664] <= data_ram;
else if (counter == 27)
	q[1791:1728] <= data_ram;
else if (counter == 28)
	q[1855:1792] <= data_ram;
else if (counter == 29)
	q[1919:1856] <= data_ram;
else if (counter == 30)
	q[1983:1920] <= data_ram;
else if (counter == 31)
	q[2047:1984] <= data_ram;
end
always @ (posedge clk )
begin // : STATUS_COUNTER
	if ((rdreq) && (!wrreq) && (status_cnt != 0))
		status_cnt <= status_cnt - 1'b1;
// Write but no read.
	else if ((wrreq) && (!rdreq) && (status_cnt != 64 ))
		status_cnt <= status_cnt + 1'b1;
end 

  defparam ram_addr.ADDR_WIDTH = `rFIFORSIZEWIDTH;
  defparam ram_addr.DATA_WIDTH = `rFIFOINPUTWIDTH;
  dual_port_ram ram_addr(
.we1      (wrreq)      , // write enable
 .we2      (rdreq)       , // Read enable
.addr1 (wr_pointer) , // address_0 input 
.addr2 (rd_pointer) , // address_q input  
.data1    (data)    , // data_0 bi-directional
.data2    (junk_input),   // data_1 bi-directional
.clk(clk),
.out1	(data_ram),
.out2	(junk_output)
 ); 


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
