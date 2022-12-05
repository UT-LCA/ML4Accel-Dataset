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

module MarshallerController (clk, start, done, input_N, offset,
	comp_start, block_m, block_n, loop, mode, comp_done, cur_mem_sel, left_mem_sel,
	dtu_write_req, dtu_read_req, dtu_mem_addr, dtu_ram_addr, dtu_size, dtu_ack, dtu_done, left_sel);


input clk;
input start;
output done;
input [`NWIDTH-1:0] input_N;
input [`DDRSIZEWIDTH-1:0] offset;

// for computation section
output comp_start;
output [`BLOCKWIDTH-1:0] block_m, block_n, loop;
output [1:0] mode;
input comp_done;
output cur_mem_sel, left_mem_sel;

// for data marshaller section
output dtu_write_req,	dtu_read_req;
output [`DDRSIZEWIDTH-1:0] dtu_mem_addr;
output [`RAMSIZEWIDTH-1:0] dtu_ram_addr;
output [`BLOCKWIDTH-1:0] dtu_size;
input dtu_ack, dtu_done;
output left_sel;

reg [4:0] cur_state, next_state;
reg [`NWIDTH-1:0] comp_N, N, mcount, ncount, Ndivk, mem_N;
reg [1:0] mode;
reg [`BLOCKWIDTH-1:0] block_m, block_n, loop, read_n;
reg [`BLOCKWIDTH-1:0] write_n, write_n_buf;
reg left_mem_sel, cur_mem_sel, no_left_switch;

reg [3:0] cur_mem_state, next_mem_state;
reg [`RAMSIZEWIDTH-1:0] ram_addr;
reg [`DDRSIZEWIDTH-1:0] mem_addr;
reg [`DDRSIZEWIDTH-1:0] mem_base, mem_top, mem_write, mem_left, mem_cur;
reg [`DDRSIZEWIDTH-1:0] mem_write_buf;
reg [`BLOCKWIDTH-1:0] mem_count;
reg [1:0] mem_read;
reg [`BLOCKWIDTH-1:0] mem_write_size, mem_write_size_buf, mem_read_size;
wire mem_done;

assign done = (cur_state == `IDLE);
assign dtu_ram_addr = ram_addr;
assign dtu_mem_addr = mem_addr;
assign dtu_size = (cur_mem_state == `MEM_WRITE) ? mem_write_size : mem_read_size;
assign comp_start = (cur_state == `MODE0)||(cur_state == `MODE1)||(cur_state == `MODE2)||(cur_state == `MODE3)||(cur_state == `FIRST)||(cur_state == `LAST);
assign dtu_write_req = (cur_mem_state == `MEM_WRITE);
assign dtu_read_req = (cur_mem_state == `MEM_READ);
assign mem_done = (cur_mem_state == `MEM_DONE)&&(dtu_done == 1'b1);
assign left_sel = mem_read == 2'b01 && (cur_mem_state == `MEM_READ || cur_mem_state == `MEM_READ_WAIT || cur_mem_state == `MEM_WAIT_DONE);

// FSM to produce memory instructions to DTU
always @ (posedge clk)
begin
	case (cur_mem_state)
	`MEM_IDLE:
	begin
		if (cur_state == `START)
			next_mem_state <= `MEM_CHECK_DONE;
		else
			next_mem_state <= `MEM_IDLE;
	end
	`MEM_DONE:
	begin
		if (cur_state == `MODE0 || cur_state == `MODE1 || cur_state == `MODE2 || 
			cur_state == `MODE3 || cur_state == `FINAL_WRITE || cur_state == `LAST_SETUP)
			next_mem_state <= `MEM_WRITE;
		else if (cur_state == `FIRST)
			next_mem_state <= `MEM_CHECK_DONE;
		else
			next_mem_state <= `MEM_DONE;
	end
	`MEM_WRITE:
	begin
		next_mem_state <= `MEM_WRITE_WAIT;
	end
	`MEM_WRITE_WAIT:
	begin
		if (dtu_ack == 1'b1)
		begin
			if (mem_count == write_n)
				next_mem_state <= `MEM_WAIT_DONE;
			else 
				next_mem_state <= `MEM_WRITE;
		end
		else
			next_mem_state <= `MEM_WRITE_WAIT;
	end
	`MEM_WAIT_DONE:
	begin
		if (dtu_done == 1'b1)
			next_mem_state <= `MEM_CHECK_DONE;
		else
			next_mem_state <= `MEM_WAIT_DONE;
	end
	`MEM_CHECK_DONE:
	begin
		if (mem_read == 2'b10)
			next_mem_state <= `MEM_DONE;
		else
			next_mem_state <= `MEM_READ;
	end
	`MEM_READ:
	begin
		next_mem_state <= `MEM_READ_WAIT;
	end
	`MEM_READ_WAIT:
	begin
		if (dtu_ack == 1'b1)
		begin
			if (mem_count == read_n)
				next_mem_state <= `MEM_WAIT_DONE;
			else
				next_mem_state <= `MEM_READ;
		end
		else
			next_mem_state <= `MEM_READ_WAIT;
	end
	default:
		next_mem_state <= `MEM_IDLE;
	endcase
end

always @ (posedge clk)
begin
	if (cur_mem_state == `MEM_DONE || cur_mem_state == `MEM_IDLE)
	begin
		ram_addr <= 7'b0;
		mem_addr <= mem_write;
		if (next_state == `LAST_WAIT || next_state == `FINAL_WAIT || next_state == `STALL)
			mem_read <= 2'b00;
		else if (next_state == `MODE0_SETUP || next_state == `SETUP || cur_state == `MODE0 || next_state == `LAST_SETUP_WAIT)
			mem_read <= 2'b01;
		else
			mem_read <= 2'b10;
		mem_count <= 7'b0;
	end
	else if (cur_mem_state == `MEM_CHECK_DONE)
	begin
		if (mem_read == 2'b10)
		begin
			mem_addr <= mem_left;
			read_n <= loop;
		end
		else
		begin
			mem_addr <= mem_cur;
			read_n <= block_n;
		end
		mem_read <= mem_read - 2'b01;
		mem_count <= 7'b0;
		ram_addr <= 7'b0;
	end
	else if (cur_mem_state == `MEM_WRITE || cur_mem_state == `MEM_READ)
	begin
		ram_addr <= ram_addr + `BLOCKMDIVK;
		mem_addr <= mem_addr + Ndivk;
		mem_count <= mem_count + 2'b01;
	end
	
end

// FSM to determine the block LU factorization algorithm
always @ (posedge clk)
begin
	case (cur_state)
	`START:
	begin
		next_state <= `SETUP;
	end
	`SETUP:
	begin
		next_state <= `WAIT;
	end
	`WAIT:
	begin
		if (mem_done == 1'b1)
			next_state <= `FIRST;
		else
			next_state <= `WAIT;

	end
	`FIRST:
	begin
		if (mcount < comp_N)
			next_state <= `MODE1_SETUP;
		else if (ncount < comp_N)
			next_state <= `MODE2_SETUP;
		else
			next_state <= `LAST_WAIT;
	end
	`MODE0_SETUP:
	begin
		next_state <= `MODE0_WAIT;
	end
	`MODE0_WAIT:
	begin
		if (mem_done == 1'b1 && comp_done == 1'b1)
			next_state <= `MODE0;
		else
			next_state <= `MODE0_WAIT;

	end
	`MODE0:
	begin
		if (mcount < comp_N)
			next_state <= `MODE1_SETUP;
		else if (ncount < comp_N)
			next_state <= `MODE2_SETUP;
		else
		begin
			next_state <= `LAST_WAIT;
		end
	end
	`MODE1_SETUP:
	begin
		next_state <= `MODE1_WAIT;
	end
	`MODE1_WAIT:
	begin
		if (mem_done == 1'b1 && comp_done == 1'b1)
			next_state <= `MODE1;
		else
			next_state <= `MODE1_WAIT;

	end
	`MODE1:
	begin
		if (mcount < comp_N)
			next_state <= `MODE1_SETUP;
		else if (ncount < comp_N)
			next_state <= `MODE2_SETUP;
		else if (comp_N <= `BLOCKN + `BLOCKN)
			next_state <= `STALL;
		else
			next_state <= `MODE0_SETUP;
	end
	`MODE2_SETUP:
	begin
		next_state <= `MODE2_WAIT;
	end
	`MODE2_WAIT:
	begin
		if (mem_done == 1'b1 && comp_done == 1'b1)
			next_state <= `MODE2;
		else
			next_state <= `MODE2_WAIT;
	end
	`MODE2:
	begin
		if (mcount < comp_N)
			next_state <= `MODE3_SETUP;
		else if (ncount < comp_N)
			next_state <= `MODE2_SETUP;
		else if (comp_N <= `BLOCKN + `BLOCKN)
			next_state <= `STALL;
		else
			next_state <= `MODE0_SETUP;
	end
	`MODE3_SETUP:
	begin
		next_state <= `MODE3_WAIT;
	end
	`MODE3_WAIT:
	begin
		if (mem_done == 1'b1 && comp_done == 1'b1)
			next_state <= `MODE3;
		else
			next_state <= `MODE3_WAIT;
	end
	`MODE3:
	begin
		if (mcount < comp_N)
			next_state <= `MODE3_SETUP;
		else if (ncount < comp_N)
			next_state <= `MODE2_SETUP;
		else if (comp_N <= `BLOCKN + `BLOCKN)
			next_state <= `STALL;
		else
			next_state <= `MODE0_SETUP;
	end
	`STALL:
		next_state <= `STALL_WAIT;
	`STALL_WAIT:
		if (mem_done == 1'b1 && comp_done == 1'b1)
			next_state <= `LAST_SETUP;
		else
			next_state <= `STALL_WAIT;
	`LAST_SETUP:
		next_state <= `LAST_SETUP_WAIT;
	`LAST_SETUP_WAIT:
		if (mem_done == 1'b1 && comp_done == 1'b1)
			next_state <= `LAST;
		else
			next_state <= `LAST_SETUP_WAIT;
	`LAST:
		next_state <= `LAST_WAIT;
	`LAST_WAIT:
		if (mem_done == 1'b1 && comp_done == 1'b1)
			next_state <= `FINAL_WRITE;
		else
			next_state <= `LAST_WAIT;
	`FINAL_WRITE:
		next_state <= `FINAL_WAIT;
	`FINAL_WAIT:
		if (mem_done == 1'b1)
			next_state <= `IDLE;
		else
			next_state <= `FINAL_WAIT;
	`IDLE:
		if (start)
			next_state <= `SETUP;
		else
			next_state <= `IDLE;
	default:
		next_state <= `START;
	endcase
end

always @ (posedge clk)
begin
	if (start)
	begin
		cur_state <= `START;
		cur_mem_state <= `MEM_IDLE;
	end
	else
	begin
		cur_state <= next_state;
		cur_mem_state <= next_mem_state;
	end
end

always @ (cur_state)
begin
	case (cur_state)
	`MODE1:
		mode = 2'b01;
	`MODE2:
		mode = 2'b10;
	`MODE3:
		mode = 2'b11;
	default:
		mode = 2'b00;
	endcase
end

always @ (posedge clk)
begin
	if (start)
	begin
		comp_N <= input_N;
		N <= input_N;
	end
	else if (next_state == `MODE0)
	begin
		comp_N <= comp_N - `BLOCKN;
	end

	Ndivk <= ((N+`BLOCKM-1)>>6)<<5;
	mem_N <= Ndivk<<6;

	if (start)
	begin
		mem_base <= offset;
		mem_top <= offset;
		mem_left <= offset;
		mem_cur <= offset;
	end
	else if (cur_state == `MODE0_SETUP)
	begin
		mem_base <= mem_base + mem_N+`MEMBLOCKN;
		mem_top <= mem_base + mem_N+`MEMBLOCKN;
		mem_cur <= mem_base + mem_N+`MEMBLOCKN;
		mem_left <= mem_base + mem_N+`MEMBLOCKN;
	end
	else if (cur_state == `MODE1_SETUP)
	begin
		mem_cur <= mem_cur + `MEMBLOCKM;
	end	
	else if (cur_state == `MODE3_SETUP)
	begin
		mem_cur <= mem_cur + `MEMBLOCKM;
		mem_left <= mem_left + `MEMBLOCKM;
	end
	else if (cur_state == `MODE2_SETUP)
	begin
		mem_cur <= mem_top + mem_N;
		mem_top <= mem_top + mem_N;
		mem_left <= mem_base;
	end

	if (cur_state == `SETUP)
	begin
		mem_write <= 24'b0;
		mem_write_buf <= 24'b0;
		mem_write_size <= `BLOCKMDIVK;
		mem_write_size_buf <= `BLOCKMDIVK;
		write_n <= block_n;
		write_n_buf <= block_n;
	end
	else if (cur_mem_state == `MEM_CHECK_DONE && mem_read == 0)
	begin
		mem_write <= mem_write_buf;
		mem_write_buf <= mem_cur;
		mem_write_size <= mem_write_size_buf;
		mem_write_size_buf <= mem_read_size;
		write_n <= write_n_buf;
		write_n_buf <= block_n;
	end

	mem_read_size <= `BLOCKMDIVK;

	if (start) begin
		loop <= `BLOCKN;
	end else if (next_state == `LAST) begin
		loop <= comp_N[8:0] - `BLOCKN;
	end

	if (cur_state == `MODE0_SETUP || cur_state == `MODE2_SETUP || start) begin
		mcount <= `BLOCKM;
	end else if (cur_state == `MODE1_SETUP || cur_state == `MODE3_SETUP) begin
		mcount <= mcount+`BLOCKM;
	end

	if (cur_state == `MODE0_SETUP || start) begin
		ncount <= `BLOCKN;
	end else if (cur_state == `MODE2_SETUP) begin
		ncount <= ncount+`BLOCKN;
	end

	if (mcount < comp_N) begin
		block_m <= `BLOCKM;
	end else begin
		block_m <= comp_N - mcount + `BLOCKM;
	end 

	if (ncount < comp_N) begin
		block_n <= `BLOCKN;
	end else begin
		block_n <= comp_N - ncount + `BLOCKN;
	end

	if (start) begin
		cur_mem_sel <= 1'b0;
	end else if ((cur_state == `MODE0)||(cur_state == `MODE1)||(cur_state == `MODE2)||(cur_state == `MODE3)||
		 (cur_state == `FIRST)||(cur_state == `FINAL_WRITE)||(cur_state == `LAST_SETUP)||(cur_state == `LAST)) begin
		cur_mem_sel <= !cur_mem_sel;
	end 

	if (start) begin
		no_left_switch <= 1'b0;
	end else if ((cur_state == `MODE0)||(cur_state == `FIRST)) begin
		no_left_switch <= 1'b1;
	end else if ((cur_state == `MODE1)||(cur_state == `MODE2)||(cur_state == `MODE3)||
		 (cur_state == `FINAL_WRITE)||(cur_state == `LAST_SETUP)) begin
		no_left_switch <= 1'b0;
	end

	if (start) begin
		left_mem_sel <= 1'b0;
	end else if (((cur_state == `MODE0)||(cur_state ==`MODE1)||(cur_state == `MODE2)||(cur_state == `MODE3)||
		 (cur_state == `FIRST)||(cur_state == `FINAL_WRITE)||(cur_state == `LAST_SETUP))&&(no_left_switch == 1'b0)) begin
		left_mem_sel <= !left_mem_sel;
	end 
end

endmodule
