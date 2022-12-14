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

module DataTransferUnit (clk, dtu_write_req, dtu_read_req, dtu_mem_addr, dtu_ram_addr, dtu_size, dtu_ack, dtu_done,
		ram_read_addr, ram_read_data, ram_write_byte_en, ram_write_data, ram_write_addr, ram_write_en,
		mem_rdata, mem_rdata_valid, mem_ready, mem_wdata_req, reset_n,
		burst_begin, mem_local_addr, mem_be, mem_read_req, mem_size, mem_wdata, mem_write_req
		);

output burst_begin;
output [`DDRSIZEWIDTH-1:0] mem_local_addr;
output [`MEMCONNUMBYTES-1: 0] mem_be;
output mem_read_req;
output [`BURSTWIDTH-1:0] mem_size;
output [`MEMCONWIDTH-1:0] mem_wdata;
output mem_write_req;
input clk;
input [`MEMCONWIDTH-1:0] mem_rdata;
input mem_rdata_valid;
input mem_ready;
input mem_wdata_req;
input reset_n;

input dtu_write_req;
input dtu_read_req;
input [`DDRSIZEWIDTH-1:0] dtu_mem_addr;
input [`RAMSIZEWIDTH-1:0] dtu_ram_addr;
input [6:0] dtu_size;
output dtu_ack;
output dtu_done;

output[`RAMWIDTH-1:0] ram_write_data;
input[`RAMWIDTH-1:0] ram_read_data;
output[`RAMSIZEWIDTH-1:0] ram_write_addr, ram_read_addr;
output[`RAMNUMBYTES-1:0] ram_write_byte_en;
output ram_write_en;

reg[`DDRSIZEWIDTH-1:0] mem_addr0;
reg[`DDRSIZEWIDTH-1:0] mem_addr1;
reg[`DDRSIZEWIDTH-1:0] mem_addr2;
reg[`DDRSIZEWIDTH-1:0] mem_addr3;
reg[`DDRSIZEWIDTH-1:0] mem_addr4;
reg[`DDRSIZEWIDTH-1:0] mem_addr5;

reg [1:0] state;
wire [`DATAWIDTH-1:0] rdata, ram_write_dataw, ram_read_dataw;

wire [`RAMSIZEWIDTH-1:0] rfifo_addr;
reg [`RAMLAT-1:0]fifo_write_reg;
reg [`RAMLAT-1:0]write_req_reg;
reg [`RAMLAT-1:0]read_req_reg;
reg [0:0]fifo_read_reg;
reg rdata_valid;
reg [1:0]test_complete_reg;
reg [`BURSTWIDTH-1:0] size_count0;
reg [`BURSTWIDTH-1:0] size_count1;
reg [`BURSTWIDTH-1:0] size_count2;
reg [`BURSTWIDTH-1:0] size_count3;
reg [`BURSTWIDTH-1:0] size_count4;

reg [`RAMSIZEWIDTH-1:0] size;
reg [`RAMSIZEWIDTH-1:0]ram_addr0;
reg [`RAMSIZEWIDTH-1:0]ram_addr1;
reg [`RAMSIZEWIDTH-1:0]ram_addr2;
reg [`RAMSIZEWIDTH-1:0]ram_addr3;
reg [`RAMSIZEWIDTH-1:0]ram_addr4;

reg [4:0] data_count;
reg ram_write_en_reg;

wire read_req;
wire write_req;
wire [`FIFOSIZEWIDTH-1:0] wfifo_count;
wire rfull, wempty, rempty, rdcmd_empty, wrcmd_full, wrcmd_empty, rdata_empty;
wire [`DATAWIDTH-1:0] mem_data;
wire not_stall;
wire fifo_write, fifo_read;
wire rdata_req;
wire [`BURSTWIDTH+`DDRSIZEWIDTH+1:0] wrmem_cmd, rdmem_cmd;
wire mem_cmd_ready, mem_cmd_issue;

// FIFOs to interact with off-chip memory
memcmd_fifo cmd_store(
	//.aclr(~reset_n),
	//.rdclk(phy_clk),
	.clk(clk),
	.data(wrmem_cmd),
	.rdreq(mem_cmd_ready),
	//.rdempty(rdcmd_empty),
	.wrreq(mem_cmd_issue),
	.full(wrcmd_full),
	.empty(wrcmd_empty),
	.q(rdmem_cmd)
	);

wfifo wdata_store(
	//.rdclk(phy_clk),
	.clk(clk),
	.data(mem_data),
	.rdreq(mem_wdata_req),
	.wrreq(fifo_write),
	.empty(wempty),
	.q(mem_wdata),
	.usedw(wfifo_count)
	);

addr_fifo raddress_store (
	.clk(clk),
	.data(ram_addr3),
	.wrreq(fifo_read),
	.rdreq(rdata_req),
	.empty(rempty),
	.full(rfull),
	.q(rfifo_addr)
	);

rfifo rdata_store(
	.clk(clk),
	.data(mem_rdata),
	.rdreq(rdata_req),
	//.wrclk(phy_clk),
	.wrreq(mem_rdata_valid),
	.empty(rdata_empty),
	.q(rdata)
	);

assign mem_cmd_ready = (mem_ready == 1'b1);// && (rdcmd_empty == 0);
assign mem_cmd_issue = (wrcmd_full == 1'b0) && (write_req == 1 || read_req == 1'b1 || wrcmd_empty == 1'b1);
assign wrmem_cmd[27:26] = size_count0;
assign wrmem_cmd[`DDRSIZEWIDTH+1:2] = mem_addr0;
assign wrmem_cmd[1] = read_req;
assign wrmem_cmd[0] = write_req;
assign mem_write_req = rdmem_cmd[0];// && rdcmd_empty == 0;
assign mem_read_req = rdmem_cmd[1];// && rdcmd_empty == 0;
assign mem_local_addr = rdmem_cmd[`DDRSIZEWIDTH+1:2];
assign burst_begin = 0;
assign mem_size = rdmem_cmd[`BURSTWIDTH+`DDRSIZEWIDTH+1:`DDRSIZEWIDTH+2];
assign mem_be = ~0;
assign fifo_write = fifo_write_reg[0];
assign write_req = (not_stall) ? write_req_reg[0] : 0;
assign read_req = (not_stall) ? read_req_reg[0] : 0;
assign fifo_read = (not_stall) ? fifo_read_reg[0] : 0;
assign not_stall = (wfifo_count < `FIFOSIZE-5) && (rfull == 0) && (wrcmd_full == 0);
assign dtu_ack = (state == `dIDLE);
assign dtu_done = (state == `dIDLE) && wempty && rempty;

assign ram_write_dataw[63:0] = rdata[1023:960];
assign mem_data[63:0] = ram_read_dataw[1023:960];
assign ram_write_dataw[127:64] = rdata[959:896];
assign mem_data[127:64] = ram_read_dataw[959:896];
assign ram_write_dataw[191:128] = rdata[895:832];
assign mem_data[191:128] = ram_read_dataw[895:832];
assign ram_write_dataw[255:192] = rdata[831:768];
assign mem_data[255:192] = ram_read_dataw[831:768];
assign ram_write_dataw[319:256] = rdata[767:704];
assign mem_data[319:256] = ram_read_dataw[767:704];
assign ram_write_dataw[383:320] = rdata[703:640];
assign mem_data[383:320] = ram_read_dataw[703:640];
assign ram_write_dataw[447:384] = rdata[639:576];
assign mem_data[447:384] = ram_read_dataw[639:576];
assign ram_write_dataw[511:448] = rdata[575:512];
assign mem_data[511:448] = ram_read_dataw[575:512];
assign ram_write_dataw[575:512] = rdata[511:448];
assign mem_data[575:512] = ram_read_dataw[511:448];
assign ram_write_dataw[639:576] = rdata[447:384];
assign mem_data[639:576] = ram_read_dataw[447:384];
assign ram_write_dataw[703:640] = rdata[383:320];
assign mem_data[703:640] = ram_read_dataw[383:320];
assign ram_write_dataw[767:704] = rdata[319:256];
assign mem_data[767:704] = ram_read_dataw[319:256];
assign ram_write_dataw[831:768] = rdata[255:192];
assign mem_data[831:768] = ram_read_dataw[255:192];
assign ram_write_dataw[895:832] = rdata[191:128];
assign mem_data[895:832] = ram_read_dataw[191:128];
assign ram_write_dataw[959:896] = rdata[127:64];
assign mem_data[959:896] = ram_read_dataw[127:64];
assign ram_write_dataw[1023:960] = rdata[63:0];
assign mem_data[1023:960] = ram_read_dataw[63:0];
assign ram_write_data = ram_write_dataw[1023:0];
assign ram_read_dataw[1023:0] = ram_read_data;
assign ram_write_addr = rfifo_addr;
assign ram_read_addr = ram_addr4;
assign ram_write_byte_en = ~0;
assign ram_write_en = ram_write_en_reg;
assign rdata_req = !rdata_empty;

// FSM to produce off-chip memory commands
always @ (posedge clk)
begin
	if (reset_n == 1'b0)
	begin
		state <= `dIDLE;
	end
	else
	begin
		case (state)
		`dIDLE:
		begin
			if (dtu_write_req)
				state <= `dWRITE;
			else if (dtu_read_req)
				state <= `dREAD;
			else
				state <= `dIDLE;
		end
		`dWRITE:
		begin
			if (not_stall && size == 0 && data_count < `BURSTLEN)
				state <= `dIDLE;
			else
				state <= `dWRITE;
		end
		`dREAD:
		begin
			if (not_stall && size == 0 && data_count < `BURSTLEN)
				state <= `dIDLE;
			else
				state <= `dREAD;
		end
		default:
		begin
			state <= `dIDLE;
		end
		endcase
	end
end

always @ (posedge clk)
begin

	if (reset_n == 0)
	begin
		size <= 0;
		data_count <= 0;
		size_count4 <= 1;
		mem_addr5 <= 0;
		ram_addr4 <= 0;
		fifo_write_reg[`RAMLAT-1] <= 0;
		write_req_reg[`RAMLAT-1] <= 0;
		fifo_read_reg[0] <= 0;
		read_req_reg[`RAMLAT-1] <= 0;
	end
	else if (state == `dIDLE)
	begin
		size <= dtu_size;
		size_count4 <= `BURSTLEN;
		mem_addr5 <= dtu_mem_addr;
		ram_addr4 <= dtu_ram_addr;
		fifo_write_reg[`RAMLAT-1] <= 1'b0;
		write_req_reg[`RAMLAT-1] <= 1'b0;
		fifo_read_reg[0] <= 1'b0;
		read_req_reg[`RAMLAT-1] <= 1'b0;
		data_count <= 0;
	end
	else if (data_count >= `BURSTLEN && not_stall)
	begin
		data_count <= data_count - `BURSTLEN;
		mem_addr5 <= mem_addr5 + `BURSTLEN;
		fifo_write_reg[`RAMLAT-1] <= 1'b0;
		write_req_reg[`RAMLAT-1] <= state == `dWRITE;
		fifo_read_reg[0] <= 0;
		read_req_reg[`RAMLAT-1] <= state == `dREAD;
	end
	else if (size == 0 && data_count == 0 && not_stall==1'b1)
	begin
		fifo_write_reg[`RAMLAT-1] <= 0;
		write_req_reg[`RAMLAT-1] <= 0;
		fifo_read_reg[0] <= 0;
		read_req_reg[`RAMLAT-1] <= 0;
	end
	else if (size == 0 && not_stall==1'b1)
	begin
		size_count4 <= data_count[`BURSTWIDTH-1:0];
		fifo_write_reg[`RAMLAT-1] <= 0;
		write_req_reg[`RAMLAT-1] <= state == `dWRITE;
		fifo_read_reg[0] <= 0;
		read_req_reg[`RAMLAT-1] <= state == `dREAD;
	end
	else if (not_stall==1'b1)
	begin
		size <= size - 1;
		data_count <= data_count + `RATIO - `BURSTLEN;
		mem_addr5 <= mem_addr5 + `BURSTLEN;
		ram_addr4 <= ram_addr4+1;
		fifo_write_reg[`RAMLAT-1] <= state == `dWRITE;
		write_req_reg[`RAMLAT-1] <= state == `dWRITE;
		fifo_read_reg[0] <= state == `dREAD;
		read_req_reg[`RAMLAT-1] <= state == `dREAD;
	end
	else
	begin
		fifo_write_reg[`RAMLAT-1] <= 0;
	end
end


always @ (posedge clk)
begin
	if (reset_n == 0)
	begin
		fifo_write_reg[0] <= 1'b0;
		fifo_write_reg[1] <= 1'b0;
		fifo_write_reg[2] <= 1'b0;
		fifo_write_reg[3] <= 1'b0;
	end
	else
	begin
		fifo_write_reg[0] <= fifo_write_reg[1];
		fifo_write_reg[1] <= fifo_write_reg[2];
		fifo_write_reg[2] <= fifo_write_reg[3];
		fifo_write_reg[3] <= fifo_write_reg[4];
	end

	if (reset_n == 1'b0)
	begin
		mem_addr0 <= 0;
		ram_addr0 <= 0;
		size_count0 <= 1;
		write_req_reg[0] <= 0;
		read_req_reg[0] <= 0;
		mem_addr1 <= 0;
		ram_addr1 <= 0;
		size_count1 <= 1;
		write_req_reg[1] <= 0;
		read_req_reg[1] <= 0;
		mem_addr2 <= 0;
		ram_addr2 <= 0;
		size_count2 <= 1;
		write_req_reg[2] <= 0;
		read_req_reg[2] <= 0;
		mem_addr3 <= 0;
		ram_addr3 <= 0;
		size_count3 <= 1;
		write_req_reg[3] <= 0;
		read_req_reg[3] <= 0;
		mem_addr4 <= 0;
	end
	else if (not_stall)
	begin
		size_count0 <= size_count1;
		mem_addr0 <= mem_addr1;
		ram_addr0 <= ram_addr1;
		write_req_reg[0] <= write_req_reg[1];
		read_req_reg[0] <= read_req_reg[1];
		size_count1 <= size_count2;
		mem_addr1 <= mem_addr2;
		ram_addr1 <= ram_addr2;
		write_req_reg[1] <= write_req_reg[2];
		read_req_reg[1] <= read_req_reg[2];
		size_count2 <= size_count3;
		mem_addr2 <= mem_addr3;
		ram_addr2 <= ram_addr3;
		write_req_reg[2] <= write_req_reg[3];
		read_req_reg[2] <= read_req_reg[3];
		size_count3 <= size_count4;
		mem_addr3 <= mem_addr4;
		ram_addr3 <= ram_addr4;
		write_req_reg[3] <= write_req_reg[4];
		read_req_reg[3] <= read_req_reg[4];
		mem_addr4 <= mem_addr5;
	end
	
	ram_write_en_reg  <= rdata_req;
end

endmodule
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
	reg[3:0] counter;
	wire [`rFIFOINPUTWIDTH-1:0] data_ram;
assign empty = (status_cnt == 9'b000000000);
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
if(counter == 0) begin
	q[`rFIFOINPUTWIDTH-1:0] <= data_ram;	
end
else if (counter == 1) begin
	q[127:64] <= data_ram;
end
else if (counter == 2) begin
	q[191:128] <= data_ram;
end
else if (counter == 3) begin
	q[255:192] <= data_ram;
end
else if (counter == 4) begin
	q[319:256] <= data_ram;
end
else if (counter == 5) begin
	q[383:320] <= data_ram;
end
else if (counter == 6) begin
	q[447:384] <= data_ram;
end
else if (counter == 7) begin
	q[511:448] <= data_ram;
end
else if (counter == 8) begin
	q[575:512] <= data_ram;
end
else if (counter == 9) begin
	q[639:576] <= data_ram;
end
else if (counter == 10) begin
	q[703:640] <= data_ram;
end
else if (counter == 11) begin
	q[767:704] <= data_ram;
end
else if (counter == 12) begin
	q[831:768] <= data_ram;
end
else if (counter == 13) begin
	q[895:832] <= data_ram;
end
else if (counter == 14) begin
	q[959:896] <= data_ram;
end
else if (counter == 15) begin
	q[1023:960] <= data_ram;
end
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
module addr_fifo (
	clk,
	data,
	wrreq,
	rdreq,
	empty,
	full,
	q
	);

	input	  clk;
	input	[`aFIFOWIDTH-1:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  empty;
	output	  full;
	output	[`aFIFOWIDTH-1:0]  q;

reg [`aFIFOSIZEWIDTH-1:0] wr_pointer;
reg [`aFIFOSIZEWIDTH-1:0] rd_pointer;
reg [`aFIFOSIZEWIDTH:0] status_cnt;
reg [`aFIFOWIDTH-1:0] q ;
wire [`aFIFOWIDTH-1:0] data_ram ;
assign full = (status_cnt == 5'b01111);
assign empty = (status_cnt == 5'b00000);
wire [`aFIFOWIDTH-1:0]junk_input;
wire [`aFIFOWIDTH-1:0]junk_output;
assign junk_input = 7'b0000000;
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
rd_pointer <= rd_pointer + 1'b1;
end
end
always  @ (posedge clk )
begin  //READ_DATA
if (rdreq) begin
q <= data_ram; 
end
end
always @ (posedge clk )
begin // : STATUS_COUNTER
	if ((rdreq) && (!wrreq) && (status_cnt != 5'b00000))
		status_cnt <= status_cnt - 1'b1;
	// Write but no read.
	else if ((wrreq) && (!rdreq) && (status_cnt != 5'b10000))
		status_cnt <= status_cnt + 1;
end

  defparam ram_addr.ADDR_WIDTH = `aFIFOSIZEWIDTH;
  defparam ram_addr.DATA_WIDTH = `aFIFOWIDTH;
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
module wfifo (
	clk,
	data,
	rdreq,
	wrreq,
	empty,
	q,
	usedw
	);

	input	clk;
	input	  wrreq;
	input	  rdreq;
	input	[`wFIFOINPUTWIDTH-1:0]  data;
	output	  empty;
	output	[`wFIFOOUTPUTWIDTH-1:0]  q;
	output	[`wFIFOSIZEWIDTH-1:0]  usedw;
//-----------Internal variables-------------------
reg [`wFIFOSIZEWIDTH-1:0] wr_pointer;
reg [`wFIFOSIZEWIDTH-1:0] rd_pointer;
reg [`wFIFOSIZEWIDTH:0] status_cnt;
reg [`wFIFOOUTPUTWIDTH-1:0] q ;
reg[3:0] counter;
wire [`wFIFOINPUTWIDTH-1:0] data_ram ;
assign empty = (status_cnt == 5'b00000);
wire [`wFIFOINPUTWIDTH-1:0]junk_input;
wire [`wFIFOINPUTWIDTH-1:0]junk_output;
assign junk_input = 1024'b0;
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
if (rdreq) begin 
	counter <= 0;
end 
else begin 
	counter <= counter + 2'b01;
end 
if(counter == 0) begin
	q <= data_ram[63:0];
end
else if(counter == 1) begin
	q <= data_ram[127:64];
end
else if(counter == 2) begin
	q <= data_ram[191:128];
end
else if(counter == 3) begin
	q <= data_ram[255:192];
end
else if(counter == 4) begin
	q <= data_ram[319:256];
end
else if(counter == 5) begin
	q <= data_ram[383:320];
end
else if(counter == 6) begin
	q <= data_ram[447:384];
end
else if(counter == 7) begin
	q <= data_ram[511:448];
end
else if(counter == 8) begin
	q <= data_ram[575:512];
end
else if(counter == 9) begin
	q <= data_ram[639:576];
end
else if(counter == 10) begin
	q <= data_ram[703:640];
end
else if(counter == 11) begin
	q <= data_ram[767:704];
end
else if(counter == 12) begin
	q <= data_ram[831:768];
end
else if(counter == 13) begin
	q <= data_ram[895:832];
end
else if(counter == 14) begin
	q <= data_ram[959:896];
end
else if(counter == 15) begin
	q <= data_ram[1023:960];
end	
end
always @ (posedge clk )
begin // : STATUS_COUNTER
	if ((rdreq) && (!wrreq) && (status_cnt != 5'b00000))
		status_cnt <= status_cnt - 1'b1;
	// Write but no read.
	else if ((wrreq) && (!rdreq) && (status_cnt != 5'b10000 )) 
		status_cnt <= status_cnt + 1'b1;
end 
assign usedw = status_cnt[`wFIFOSIZEWIDTH-1:0];

  defparam ram_addr.ADDR_WIDTH = `wFIFOSIZEWIDTH;
  defparam ram_addr.DATA_WIDTH = `wFIFOINPUTWIDTH;
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
module memcmd_fifo (
	clk,
	data,
	rdreq,
	wrreq,
	full,
	empty,
	q
	);
	
	input	  clk;
	input	[`mFIFOWIDTH-1:0]  data;
	input	  wrreq;
	input	  rdreq;
	output	  full;
	output	  empty;
	output	[`mFIFOWIDTH-1:0]  q;

	reg [`mFIFOSIZEWIDTH-1:0] wr_pointer;
	reg [`mFIFOSIZEWIDTH-1:0] rd_pointer;
	reg [`mFIFOSIZEWIDTH:0] status_cnt;
	reg [`mFIFOWIDTH-1:0] q ;
	wire [`mFIFOWIDTH-1:0] data_ram;
	assign full = (status_cnt ==5'b01111);
	assign empty = (status_cnt == 5'b00000);
	wire [`mFIFOWIDTH-1:0]junk_input;
	wire [`mFIFOWIDTH-1:0]junk_output;
	assign junk_input = 28'b0000000000000000000000000000;
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
			rd_pointer <= rd_pointer + 1'b1;
		end
	end
	always  @ (posedge clk )
	begin  //READ_DATA
		if (rdreq) begin
			q <= data_ram;
		end
	end
always @ (posedge clk )
begin // : STATUS_COUNTER
	if ((rdreq) && (!wrreq) && (status_cnt != 0))
		status_cnt <= status_cnt - 1'b1;
	else if ((wrreq) && (!rdreq) && (status_cnt != 16 ))
		status_cnt <= status_cnt + 1'b1;
end
    defparam ram_addr.ADDR_WIDTH = `mFIFOSIZEWIDTH;
    defparam ram_addr.DATA_WIDTH = `mFIFOWIDTH;
	dual_port_ram ram_addr(
	.we1      (wrreq)      , // write enable
	.we2      (rdreq)       , // Read enable
	.addr1 (wr_pointer) , // address_0 input
	.addr2 (rd_pointer) , // address_q input
	.data1    (data)    , // data_0 bi-directional
	.data2    (junk_input),   // data_1 bi-directional
	.clk(clk),
	.out1	(data_ram),
	.out2	(junk_output));


endmodule
