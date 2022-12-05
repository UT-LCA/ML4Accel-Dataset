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

module Channel(
	input clk, 
	input rst,
	input start,
	input fetcher_done,

	input [`MAT_VAL_BITS-1:0] mat_val,
	input mat_val_empty,
	output mat_val_rd_en,

	input [`VEC_VAL_BITS-1:0] vec_val,
	input vec_val_empty,
	output vec_val_rd_en,

	output [`MULT_BITS-1:0] mult_out,
	output mult_empty,
	input mult_rd_en,

	output done 
	);

	parameter FIFO_DEPTH = 8;
	// parameter FIFO_DEPTH_BITS = `LOG2(FIFO_DEPTH);
	parameter FIFO_DEPTH_BITS = $clog2(8);

	reg [`MULT_BITS-1:0] mult;
	reg mult_wr_en;
	wire mult_full;
	
	reg vec_val_rd_en_reg;
	reg mat_val_rd_en_reg;

	generic_fifo_sc_a #(
		.dw(`MULT_BITS),
		.aw(FIFO_DEPTH_BITS)
		) fifo_mult (
		.clk(clk),
		.rst(rst),
		.clr(0),
		.din(mult),
		.we(mult_wr_en),
		.re(mult_rd_en),
		.dout(mult_out),
		.full(mult_full),
		.empty(mult_empty)
	);

	assign done = mat_val_empty & fetcher_done & start;

	assign vec_val_rd_en = start & (~vec_val_empty) & (~mat_val_empty) & (~mult_full);
	assign mat_val_rd_en = start & (~vec_val_empty) & (~mat_val_empty) & (~mult_full);

	always@(posedge clk) begin
		vec_val_rd_en_reg <= vec_val_rd_en;
		mat_val_rd_en_reg <= mat_val_rd_en;

		if(vec_val_rd_en_reg && mat_val_rd_en_reg) begin
			mult <= vec_val * mat_val;
			mult_wr_en <= 1;
		end
		else begin
			mult_wr_en <= 0;
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



