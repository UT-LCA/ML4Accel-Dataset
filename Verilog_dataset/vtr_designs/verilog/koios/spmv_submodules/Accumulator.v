`define SIMULATION
`define COL_ID_BITS 8
`define ROW_ID_BITS 8
`define MAT_VAL_BITS 8
`define VEC_VAL_BITS 8
`define MULT_BITS (`VEC_VAL_BITS + `MAT_VAL_BITS)
`define NUM_CHANNEL 32
`define NUM_CHANNEL_BITS $clog2(`NUM_CHANNEL)
`define LANE_NUM (3 * `NUM_CHANNEL)
// `define LANE_NUM_BITS $clog2(`LANE_NUM)
`define NUM_MAT_VALS 8864
`define NUM_COL_IDS `NUM_MAT_VALS
`define NUM_ROW_IDS `NUM_MAT_VALS
`define NUM_VEC_VALS 128
`define FIFO_DEPTH 8
`define MAX_COLS (1<<`COL_ID_BITS)
`define BYTES_PER_ADDR_PER_BRAM 1
`define NUM_BRAMS 1
`define VEC_VAL_BYTES (`VEC_VAL_BITS/8)
`define VEC_VAL_OFFSET $clog2(`VEC_VAL_BITS)
`define NUM_VEC_VALS_PER_ADDR_PER_BRAM (`BYTES_PER_ADDR_PER_BRAM/`VEC_VAL_BYTES)
`define NUM_VEC_VALS_PER_ADDR `NUM_VEC_VALS_PER_ADDR_PER_BRAM*`NUM_BRAMS
`define NUM_VEC_VALS_PER_ADDR_BITS $clog2(`NUM_VEC_VALS_PER_ADDR)
`define NUM_ADDR (`NUM_VEC_VALS/`NUM_VEC_VALS_PER_ADDR)
`define BVB_AWIDTH `COL_ID_BITS
`define COUNTER_BITS $clog2(`NUM_ADDR)
`define LOCAL_ID_BITS `NUM_VEC_VALS_PER_ADDR_BITS
// `define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
// `define SC_FIFO_ASYNC_RESET	or posedge rst		// Uncomment for Async. reset

module Accumulator(
	input clk, 
	input rst, 
	input start, 
	input mult_done,

	input [`ROW_ID_BITS-1:0] row_id,
	input row_id_empty,
	output row_id_rd_en,

	input [`MULT_BITS-1:0] mult_out,
	input mult_empty,
	output mult_rd_en,

	output [`MULT_BITS-1:0] data_out,
	output data_out_empty,
	output [`ROW_ID_BITS-1:0] addr_out,
	input out_rd_en,

	output reg done
	);
	
	reg first_read;

	reg row_id_rd_en_reg;
	reg mult_rd_en_reg;

	wire data_out_full;
	wire addr_out_full_nc;

	wire addr_out_empty_nc;

	reg [`MULT_BITS-1:0] wr_data;
	reg [`ROW_ID_BITS-1:0] wr_addr;
	reg wr_en;

	reg [`MULT_BITS-1:0] wr_data_delay;
	reg [`ROW_ID_BITS-1:0] wr_addr_delay;

	reg last;

	parameter FIFO_DEPTH_BITS = $clog2(`FIFO_DEPTH);

	generic_fifo_sc_a #(
		.aw(FIFO_DEPTH_BITS),
		.dw(`MULT_BITS)
	) fifo_data_out (
		.clk(clk),
		.rst(rst),
		.clr(0),
		.din(wr_data_delay),
		.we(wr_en),
		.re(out_rd_en),
		.dout(data_out),
		.full(data_out_full),
		.empty(data_out_empty)
	);

	generic_fifo_sc_a #(
		.aw(FIFO_DEPTH_BITS),
		.dw(`ROW_ID_BITS)
	) fifo_addr_out (
		.clk(clk),
		.rst(rst),
		.clr(0),
		.din(wr_addr_delay),
		.we(wr_en),
		.re(out_rd_en),
		.dout(addr_out),
		.full(addr_out_full_nc),
		.empty(addr_out_empty_nc)
	);

	assign row_id_rd_en = start & (~row_id_empty) & (~mult_empty) & (~data_out_full);
	assign mult_rd_en = start & (~row_id_empty) & (~mult_empty) & (~data_out_full);

	always@(posedge clk or posedge rst) begin
		if(rst) begin
			wr_data<=0;
			wr_en<=0;
			first_read <= 0;
			done <= 0;
		end 
		else if(start) begin
			last <= mult_done & row_id_empty;
			row_id_rd_en_reg <= row_id_rd_en;
			mult_rd_en_reg <= mult_rd_en;
			wr_addr_delay <= wr_addr;
			wr_data_delay <= wr_data;

			if(~first_read) begin
				wr_addr <= row_id;
				first_read <= 1;
			end 		
			else if(row_id_rd_en_reg & mult_rd_en_reg) begin
				if(row_id!=wr_addr) begin
					wr_en <= 1;
					wr_data <= mult_out;
					wr_addr <= row_id;
				end
				else begin
					wr_en <= 0;
					wr_data <= wr_data + mult_out;
				end
			end
			else if (last) begin
				wr_en <= 1;
				done <= 1;
			end
			else begin
				wr_en <= 0;
			end
		end
	end
endmodule
module generic_fifo_sc_a
	#(parameter dw=8,
	  parameter aw=8)
	(clk, rst, clr, din, we, dout, re,
	full, empty);

parameter max_size = 1<<aw;

input 			clk, rst, clr;
input 	[dw-1:0]	din;
input 			we;
output	[dw-1:0]	dout;
input 	wire		re;
output			full;
output			empty;

////////////////////////////////////////////////////////////////////
//
// Local Wires
//
wire 	[dw-1:0]	din_nc;
wire 	[dw-1:0]	out_nc;
reg		[aw-1:0]	wp;
wire	[aw-1:0]	wp_pl1;
reg		[aw-1:0]	rp;
wire	[aw-1:0]	rp_pl1;
reg					gb;

////////////////////////////////////////////////////////////////////
//
// Memory Block
//
dpram #(
	.AWIDTH(aw),
	.DWIDTH(dw)
	) u0 (
	.clk(clk),
	.address_a(rp),
	.wren_a(0),
	.data_a(din_nc),
	.out_a(dout),
	.address_b(wp),
	.wren_b(we),
	.data_b(din),
	.out_b(out_nc)
);


////////////////////////////////////////////////////////////////////
//
// Misc Logic
//

always @(posedge clk or posedge rst)
	if(rst)	wp <= {aw{1'b0}};
	else
	if(clr)		wp <= {aw{1'b0}};
	else
	if(we)		wp <= wp_pl1;

assign wp_pl1 = wp + { {aw-1{1'b0}}, 1'b1};

always @(posedge clk or posedge rst)
	if(rst)		rp <= {aw{1'b0}};
	else
	if(clr)		rp <= {aw{1'b0}};
	else
	if(re)		rp <= rp_pl1;

assign rp_pl1 = rp + { {aw-1{1'b0}}, 1'b1};

////////////////////////////////////////////////////////////////////
//
// Combinatorial Full & Empty Flags
//

assign empty = ((wp == rp) & !gb);
assign full  = ((wp == rp) &  gb);

// Guard Bit ...
always @(posedge clk or posedge rst)
	if(rst)						gb <= 1'b0;
	else
	if(clr)						gb <= 1'b0;
	else
	if((wp_pl1 == rp) & we)		gb <= 1'b1;
	else
	if(re)						gb <= 1'b0;

endmodule
module dpram #(
	parameter DWIDTH = 32,
	parameter AWIDTH = 10
  )
  (
	clk,
	address_a,
	address_b,
	wren_a,
	wren_b,
	data_a,
	data_b,
	out_a,
	out_b
);

parameter NUM_WORDS=1<<AWIDTH;

input clk;
input [(AWIDTH-1):0] address_a;
input [(AWIDTH-1):0] address_b;
input  wren_a;
input  wren_b;
input [(DWIDTH-1):0] data_a;
input [(DWIDTH-1):0] data_b;
output reg [(DWIDTH-1):0] out_a;
output reg [(DWIDTH-1):0] out_b;

`ifdef SIMULATION

	reg [DWIDTH-1:0] ram[NUM_WORDS-1:0];

	always @ (posedge clk) begin
		if (wren_a) begin
			ram[address_a] <= data_a;
		end
		else begin
			out_a <= ram[address_a];
		end
	end
	  
	always @ (posedge clk) begin 
		if (wren_b) begin
			ram[address_b] <= data_b;
		end 
		else begin
			out_b <= ram[address_b];
		end
	end

`else

	dual_port_ram u_dual_port_ram(
	.addr1(address_a),
	.we1(wren_a),
	.data1(data_a),
	.out1(out_a),
	.addr2(address_b),
	.we2(wren_b),
	.data2(data_b),
	.out2(out_b),
	.clk(clk)
	);

`endif

endmodule
