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

module fetcher(
	input clk,
	input rst,

	input  [`NUM_CHANNEL-1:0] mat_val_rd_en,
	input  [`NUM_CHANNEL-1:0] col_id_rd_en,
	input  [`NUM_CHANNEL-1:0] row_id_rd_en,

	output [(`MAT_VAL_BITS*`NUM_CHANNEL)-1:0] mat_val_out,
	output [(`COL_ID_BITS*`NUM_CHANNEL)-1:0] col_id_out,
	output [(`ROW_ID_BITS*`NUM_CHANNEL)-1:0] row_id_out,

	output [`NUM_CHANNEL-1:0] mat_val_empty,
	output [`NUM_CHANNEL-1:0] col_id_empty,
	output [`NUM_CHANNEL-1:0] row_id_empty,

	output done
	);

`ifdef SIMULATION
	parameter MAT_VAL_FILE = "/home/aatman/Desktop/SpMV/src/coe/mat_val.txt";
	parameter COL_ID_FILE = "/home/aatman/Desktop/SpMV/src/coe/col_id.txt";
	parameter ROW_ID_FILE = "/home/aatman/Desktop/SpMV/src/coe/row_id.txt";
`endif

	// parameter FIFO_DEPTH = 8;
	parameter FIFO_DEPTH_BITS = $clog2(`FIFO_DEPTH);

	// parameter ROW_LEN_ROM_DWIDTH = `ROW_LEN_BITS * `NUM_CHANNEL;
	// parameter ROW_LEN_ROM_NUM_ADDR = `NUM_ROW_LENS/`NUM_CHANNEL;
	parameter ROW_ID_ROM_DWIDTH = `ROW_ID_BITS;
	parameter ROW_ID_ROM_NUM_ADDR = `NUM_ROW_IDS;
	parameter ROW_ID_AWIDTH = $clog2(`NUM_ROW_IDS);

	// parameter MAT_VAL_ROM_DWIDTH = `MAT_VAL_BITS * `NUM_CHANNEL;
	// parameter MAT_VAL_ROM_NUM_ADDR = `NUM_MAT_VALS/`NUM_CHANNEL;
	parameter MAT_VAL_ROM_DWIDTH = `MAT_VAL_BITS;
	parameter MAT_VAL_ROM_NUM_ADDR = `NUM_MAT_VALS;
	parameter MAT_VAL_AWIDTH = $clog2(`NUM_MAT_VALS);

	// parameter COL_ID_ROM_DWIDTH = `COL_ID_BITS * `NUM_CHANNEL;
	// parameter COL_ID_ROM_NUM_ADDR = `NUM_COL_IDS/`NUM_CHANNEL;
	parameter COL_ID_ROM_DWIDTH = `COL_ID_BITS;
	parameter COL_ID_ROM_NUM_ADDR = `NUM_COL_IDS;
	parameter COL_ID_AWIDTH = $clog2(`NUM_COL_IDS);

	parameter NUM_CHANNEL_BITS = $clog2(`NUM_CHANNEL);

	reg [MAT_VAL_AWIDTH-1:0] mat_val_addr;
	reg [COL_ID_AWIDTH-1:0] col_id_addr;
	reg [ROW_ID_AWIDTH-1:0] row_id_addr;

	wire [MAT_VAL_ROM_DWIDTH-1:0] mat_val_dout;
	wire [COL_ID_ROM_DWIDTH-1:0] col_id_dout;
	wire [ROW_ID_ROM_DWIDTH-1:0] row_id_dout;

	reg [NUM_CHANNEL_BITS-1:0] mat_val_lane;
	reg [NUM_CHANNEL_BITS-1:0] col_id_lane;
	reg [NUM_CHANNEL_BITS-1:0] row_id_lane;
	 
	reg [`NUM_CHANNEL-1:0] mat_val_wr_en;
	reg [`NUM_CHANNEL-1:0] col_id_wr_en;
	reg [`NUM_CHANNEL-1:0] row_id_wr_en;

	wire [`NUM_CHANNEL-1:0] mat_val_full;
	wire [`NUM_CHANNEL-1:0] col_id_full;
	wire [`NUM_CHANNEL-1:0] row_id_full;

	wire [`NUM_CHANNEL-1:0] mat_val_full_shifted;
	wire [`NUM_CHANNEL-1:0] col_id_full_shifted;
	wire [`NUM_CHANNEL-1:0] row_id_full_shifted;

	// wire done;
	reg [MAT_VAL_AWIDTH:0] counter;

	spram #(
	`ifdef SIMULATION
		.INIT(MAT_VAL_FILE),
	`endif
		.AWIDTH(MAT_VAL_AWIDTH),
		.NUM_WORDS(MAT_VAL_ROM_NUM_ADDR),
		.DWIDTH(MAT_VAL_ROM_DWIDTH)
	) mat_val_rom (
		.clk(clk),
		.address(mat_val_addr),
		.wren(0),
		.din(0),
		.dout(mat_val_dout)
	);

	spram #(
	`ifdef SIMULATION
		.INIT(COL_ID_FILE),
	`endif
		.AWIDTH(COL_ID_AWIDTH),
		.NUM_WORDS(COL_ID_ROM_NUM_ADDR),
		.DWIDTH(COL_ID_ROM_DWIDTH)
	) col_id_rom (
		.clk(clk),
		.address(col_id_addr),
		.wren(0),
		.din(0),
		.dout(col_id_dout)
	);

	spram #(
	`ifdef SIMULATION
		.INIT(ROW_ID_FILE),
	`endif
		.AWIDTH(ROW_ID_AWIDTH),
		.NUM_WORDS(ROW_ID_ROM_NUM_ADDR),
		.DWIDTH(ROW_ID_ROM_DWIDTH)
	) row_id_rom (
		.clk(clk),
		.address(row_id_addr),
		.wren(0),
		.din(0),
		.dout(row_id_dout)
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_0 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[0]), // input wr_en 
		.re(mat_val_rd_en[0]), // input rd_en 
		.dout(mat_val_out[((0+1)*`MAT_VAL_BITS)-1:0*`MAT_VAL_BITS]), 
		.full(mat_val_full[0]), // output full 
		.empty(mat_val_empty[0]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_0 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[0]), // input wr_en 
		.re(col_id_rd_en[0]), // input rd_en 
		.dout(col_id_out[((0+1)*`COL_ID_BITS)-1:0*`COL_ID_BITS]), 
		.full(col_id_full[0]), // output full 
		.empty(col_id_empty[0]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_0 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[0]), // input wr_en 
		.re(row_id_rd_en[0]), // input rd_en 
		.dout(row_id_out[((0+1)*`ROW_ID_BITS)-1:0*`ROW_ID_BITS]), 
		.full(row_id_full[0]), // output full 
		.empty(row_id_empty[0]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_1 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[1]), // input wr_en 
		.re(mat_val_rd_en[1]), // input rd_en 
		.dout(mat_val_out[((1+1)*`MAT_VAL_BITS)-1:1*`MAT_VAL_BITS]), 
		.full(mat_val_full[1]), // output full 
		.empty(mat_val_empty[1]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_1 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[1]), // input wr_en 
		.re(col_id_rd_en[1]), // input rd_en 
		.dout(col_id_out[((1+1)*`COL_ID_BITS)-1:1*`COL_ID_BITS]), 
		.full(col_id_full[1]), // output full 
		.empty(col_id_empty[1]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_1 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[1]), // input wr_en 
		.re(row_id_rd_en[1]), // input rd_en 
		.dout(row_id_out[((1+1)*`ROW_ID_BITS)-1:1*`ROW_ID_BITS]), 
		.full(row_id_full[1]), // output full 
		.empty(row_id_empty[1]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_2 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[2]), // input wr_en 
		.re(mat_val_rd_en[2]), // input rd_en 
		.dout(mat_val_out[((2+1)*`MAT_VAL_BITS)-1:2*`MAT_VAL_BITS]), 
		.full(mat_val_full[2]), // output full 
		.empty(mat_val_empty[2]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_2 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[2]), // input wr_en 
		.re(col_id_rd_en[2]), // input rd_en 
		.dout(col_id_out[((2+1)*`COL_ID_BITS)-1:2*`COL_ID_BITS]), 
		.full(col_id_full[2]), // output full 
		.empty(col_id_empty[2]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_2 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[2]), // input wr_en 
		.re(row_id_rd_en[2]), // input rd_en 
		.dout(row_id_out[((2+1)*`ROW_ID_BITS)-1:2*`ROW_ID_BITS]), 
		.full(row_id_full[2]), // output full 
		.empty(row_id_empty[2]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_3 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[3]), // input wr_en 
		.re(mat_val_rd_en[3]), // input rd_en 
		.dout(mat_val_out[((3+1)*`MAT_VAL_BITS)-1:3*`MAT_VAL_BITS]), 
		.full(mat_val_full[3]), // output full 
		.empty(mat_val_empty[3]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_3 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[3]), // input wr_en 
		.re(col_id_rd_en[3]), // input rd_en 
		.dout(col_id_out[((3+1)*`COL_ID_BITS)-1:3*`COL_ID_BITS]), 
		.full(col_id_full[3]), // output full 
		.empty(col_id_empty[3]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_3 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[3]), // input wr_en 
		.re(row_id_rd_en[3]), // input rd_en 
		.dout(row_id_out[((3+1)*`ROW_ID_BITS)-1:3*`ROW_ID_BITS]), 
		.full(row_id_full[3]), // output full 
		.empty(row_id_empty[3]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_4 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[4]), // input wr_en 
		.re(mat_val_rd_en[4]), // input rd_en 
		.dout(mat_val_out[((4+1)*`MAT_VAL_BITS)-1:4*`MAT_VAL_BITS]), 
		.full(mat_val_full[4]), // output full 
		.empty(mat_val_empty[4]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_4 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[4]), // input wr_en 
		.re(col_id_rd_en[4]), // input rd_en 
		.dout(col_id_out[((4+1)*`COL_ID_BITS)-1:4*`COL_ID_BITS]), 
		.full(col_id_full[4]), // output full 
		.empty(col_id_empty[4]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_4 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[4]), // input wr_en 
		.re(row_id_rd_en[4]), // input rd_en 
		.dout(row_id_out[((4+1)*`ROW_ID_BITS)-1:4*`ROW_ID_BITS]), 
		.full(row_id_full[4]), // output full 
		.empty(row_id_empty[4]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_5 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[5]), // input wr_en 
		.re(mat_val_rd_en[5]), // input rd_en 
		.dout(mat_val_out[((5+1)*`MAT_VAL_BITS)-1:5*`MAT_VAL_BITS]), 
		.full(mat_val_full[5]), // output full 
		.empty(mat_val_empty[5]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_5 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[5]), // input wr_en 
		.re(col_id_rd_en[5]), // input rd_en 
		.dout(col_id_out[((5+1)*`COL_ID_BITS)-1:5*`COL_ID_BITS]), 
		.full(col_id_full[5]), // output full 
		.empty(col_id_empty[5]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_5 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[5]), // input wr_en 
		.re(row_id_rd_en[5]), // input rd_en 
		.dout(row_id_out[((5+1)*`ROW_ID_BITS)-1:5*`ROW_ID_BITS]), 
		.full(row_id_full[5]), // output full 
		.empty(row_id_empty[5]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_6 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[6]), // input wr_en 
		.re(mat_val_rd_en[6]), // input rd_en 
		.dout(mat_val_out[((6+1)*`MAT_VAL_BITS)-1:6*`MAT_VAL_BITS]), 
		.full(mat_val_full[6]), // output full 
		.empty(mat_val_empty[6]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_6 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[6]), // input wr_en 
		.re(col_id_rd_en[6]), // input rd_en 
		.dout(col_id_out[((6+1)*`COL_ID_BITS)-1:6*`COL_ID_BITS]), 
		.full(col_id_full[6]), // output full 
		.empty(col_id_empty[6]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_6 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[6]), // input wr_en 
		.re(row_id_rd_en[6]), // input rd_en 
		.dout(row_id_out[((6+1)*`ROW_ID_BITS)-1:6*`ROW_ID_BITS]), 
		.full(row_id_full[6]), // output full 
		.empty(row_id_empty[6]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_7 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[7]), // input wr_en 
		.re(mat_val_rd_en[7]), // input rd_en 
		.dout(mat_val_out[((7+1)*`MAT_VAL_BITS)-1:7*`MAT_VAL_BITS]), 
		.full(mat_val_full[7]), // output full 
		.empty(mat_val_empty[7]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_7 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[7]), // input wr_en 
		.re(col_id_rd_en[7]), // input rd_en 
		.dout(col_id_out[((7+1)*`COL_ID_BITS)-1:7*`COL_ID_BITS]), 
		.full(col_id_full[7]), // output full 
		.empty(col_id_empty[7]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_7 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[7]), // input wr_en 
		.re(row_id_rd_en[7]), // input rd_en 
		.dout(row_id_out[((7+1)*`ROW_ID_BITS)-1:7*`ROW_ID_BITS]), 
		.full(row_id_full[7]), // output full 
		.empty(row_id_empty[7]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_8 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[8]), // input wr_en 
		.re(mat_val_rd_en[8]), // input rd_en 
		.dout(mat_val_out[((8+1)*`MAT_VAL_BITS)-1:8*`MAT_VAL_BITS]), 
		.full(mat_val_full[8]), // output full 
		.empty(mat_val_empty[8]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_8 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[8]), // input wr_en 
		.re(col_id_rd_en[8]), // input rd_en 
		.dout(col_id_out[((8+1)*`COL_ID_BITS)-1:8*`COL_ID_BITS]), 
		.full(col_id_full[8]), // output full 
		.empty(col_id_empty[8]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_8 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[8]), // input wr_en 
		.re(row_id_rd_en[8]), // input rd_en 
		.dout(row_id_out[((8+1)*`ROW_ID_BITS)-1:8*`ROW_ID_BITS]), 
		.full(row_id_full[8]), // output full 
		.empty(row_id_empty[8]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_9 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[9]), // input wr_en 
		.re(mat_val_rd_en[9]), // input rd_en 
		.dout(mat_val_out[((9+1)*`MAT_VAL_BITS)-1:9*`MAT_VAL_BITS]), 
		.full(mat_val_full[9]), // output full 
		.empty(mat_val_empty[9]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_9 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[9]), // input wr_en 
		.re(col_id_rd_en[9]), // input rd_en 
		.dout(col_id_out[((9+1)*`COL_ID_BITS)-1:9*`COL_ID_BITS]), 
		.full(col_id_full[9]), // output full 
		.empty(col_id_empty[9]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_9 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[9]), // input wr_en 
		.re(row_id_rd_en[9]), // input rd_en 
		.dout(row_id_out[((9+1)*`ROW_ID_BITS)-1:9*`ROW_ID_BITS]), 
		.full(row_id_full[9]), // output full 
		.empty(row_id_empty[9]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_10 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[10]), // input wr_en 
		.re(mat_val_rd_en[10]), // input rd_en 
		.dout(mat_val_out[((10+1)*`MAT_VAL_BITS)-1:10*`MAT_VAL_BITS]), 
		.full(mat_val_full[10]), // output full 
		.empty(mat_val_empty[10]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_10 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[10]), // input wr_en 
		.re(col_id_rd_en[10]), // input rd_en 
		.dout(col_id_out[((10+1)*`COL_ID_BITS)-1:10*`COL_ID_BITS]), 
		.full(col_id_full[10]), // output full 
		.empty(col_id_empty[10]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_10 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[10]), // input wr_en 
		.re(row_id_rd_en[10]), // input rd_en 
		.dout(row_id_out[((10+1)*`ROW_ID_BITS)-1:10*`ROW_ID_BITS]), 
		.full(row_id_full[10]), // output full 
		.empty(row_id_empty[10]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_11 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[11]), // input wr_en 
		.re(mat_val_rd_en[11]), // input rd_en 
		.dout(mat_val_out[((11+1)*`MAT_VAL_BITS)-1:11*`MAT_VAL_BITS]), 
		.full(mat_val_full[11]), // output full 
		.empty(mat_val_empty[11]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_11 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[11]), // input wr_en 
		.re(col_id_rd_en[11]), // input rd_en 
		.dout(col_id_out[((11+1)*`COL_ID_BITS)-1:11*`COL_ID_BITS]), 
		.full(col_id_full[11]), // output full 
		.empty(col_id_empty[11]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_11 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[11]), // input wr_en 
		.re(row_id_rd_en[11]), // input rd_en 
		.dout(row_id_out[((11+1)*`ROW_ID_BITS)-1:11*`ROW_ID_BITS]), 
		.full(row_id_full[11]), // output full 
		.empty(row_id_empty[11]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_12 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[12]), // input wr_en 
		.re(mat_val_rd_en[12]), // input rd_en 
		.dout(mat_val_out[((12+1)*`MAT_VAL_BITS)-1:12*`MAT_VAL_BITS]), 
		.full(mat_val_full[12]), // output full 
		.empty(mat_val_empty[12]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_12 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[12]), // input wr_en 
		.re(col_id_rd_en[12]), // input rd_en 
		.dout(col_id_out[((12+1)*`COL_ID_BITS)-1:12*`COL_ID_BITS]), 
		.full(col_id_full[12]), // output full 
		.empty(col_id_empty[12]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_12 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[12]), // input wr_en 
		.re(row_id_rd_en[12]), // input rd_en 
		.dout(row_id_out[((12+1)*`ROW_ID_BITS)-1:12*`ROW_ID_BITS]), 
		.full(row_id_full[12]), // output full 
		.empty(row_id_empty[12]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_13 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[13]), // input wr_en 
		.re(mat_val_rd_en[13]), // input rd_en 
		.dout(mat_val_out[((13+1)*`MAT_VAL_BITS)-1:13*`MAT_VAL_BITS]), 
		.full(mat_val_full[13]), // output full 
		.empty(mat_val_empty[13]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_13 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[13]), // input wr_en 
		.re(col_id_rd_en[13]), // input rd_en 
		.dout(col_id_out[((13+1)*`COL_ID_BITS)-1:13*`COL_ID_BITS]), 
		.full(col_id_full[13]), // output full 
		.empty(col_id_empty[13]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_13 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[13]), // input wr_en 
		.re(row_id_rd_en[13]), // input rd_en 
		.dout(row_id_out[((13+1)*`ROW_ID_BITS)-1:13*`ROW_ID_BITS]), 
		.full(row_id_full[13]), // output full 
		.empty(row_id_empty[13]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_14 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[14]), // input wr_en 
		.re(mat_val_rd_en[14]), // input rd_en 
		.dout(mat_val_out[((14+1)*`MAT_VAL_BITS)-1:14*`MAT_VAL_BITS]), 
		.full(mat_val_full[14]), // output full 
		.empty(mat_val_empty[14]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_14 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[14]), // input wr_en 
		.re(col_id_rd_en[14]), // input rd_en 
		.dout(col_id_out[((14+1)*`COL_ID_BITS)-1:14*`COL_ID_BITS]), 
		.full(col_id_full[14]), // output full 
		.empty(col_id_empty[14]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_14 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[14]), // input wr_en 
		.re(row_id_rd_en[14]), // input rd_en 
		.dout(row_id_out[((14+1)*`ROW_ID_BITS)-1:14*`ROW_ID_BITS]), 
		.full(row_id_full[14]), // output full 
		.empty(row_id_empty[14]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_15 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[15]), // input wr_en 
		.re(mat_val_rd_en[15]), // input rd_en 
		.dout(mat_val_out[((15+1)*`MAT_VAL_BITS)-1:15*`MAT_VAL_BITS]), 
		.full(mat_val_full[15]), // output full 
		.empty(mat_val_empty[15]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_15 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[15]), // input wr_en 
		.re(col_id_rd_en[15]), // input rd_en 
		.dout(col_id_out[((15+1)*`COL_ID_BITS)-1:15*`COL_ID_BITS]), 
		.full(col_id_full[15]), // output full 
		.empty(col_id_empty[15]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_15 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[15]), // input wr_en 
		.re(row_id_rd_en[15]), // input rd_en 
		.dout(row_id_out[((15+1)*`ROW_ID_BITS)-1:15*`ROW_ID_BITS]), 
		.full(row_id_full[15]), // output full 
		.empty(row_id_empty[15]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_16 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[16]), // input wr_en 
		.re(mat_val_rd_en[16]), // input rd_en 
		.dout(mat_val_out[((16+1)*`MAT_VAL_BITS)-1:16*`MAT_VAL_BITS]), 
		.full(mat_val_full[16]), // output full 
		.empty(mat_val_empty[16]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_16 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[16]), // input wr_en 
		.re(col_id_rd_en[16]), // input rd_en 
		.dout(col_id_out[((16+1)*`COL_ID_BITS)-1:16*`COL_ID_BITS]), 
		.full(col_id_full[16]), // output full 
		.empty(col_id_empty[16]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_16 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[16]), // input wr_en 
		.re(row_id_rd_en[16]), // input rd_en 
		.dout(row_id_out[((16+1)*`ROW_ID_BITS)-1:16*`ROW_ID_BITS]), 
		.full(row_id_full[16]), // output full 
		.empty(row_id_empty[16]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_17 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[17]), // input wr_en 
		.re(mat_val_rd_en[17]), // input rd_en 
		.dout(mat_val_out[((17+1)*`MAT_VAL_BITS)-1:17*`MAT_VAL_BITS]), 
		.full(mat_val_full[17]), // output full 
		.empty(mat_val_empty[17]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_17 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[17]), // input wr_en 
		.re(col_id_rd_en[17]), // input rd_en 
		.dout(col_id_out[((17+1)*`COL_ID_BITS)-1:17*`COL_ID_BITS]), 
		.full(col_id_full[17]), // output full 
		.empty(col_id_empty[17]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_17 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[17]), // input wr_en 
		.re(row_id_rd_en[17]), // input rd_en 
		.dout(row_id_out[((17+1)*`ROW_ID_BITS)-1:17*`ROW_ID_BITS]), 
		.full(row_id_full[17]), // output full 
		.empty(row_id_empty[17]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_18 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[18]), // input wr_en 
		.re(mat_val_rd_en[18]), // input rd_en 
		.dout(mat_val_out[((18+1)*`MAT_VAL_BITS)-1:18*`MAT_VAL_BITS]), 
		.full(mat_val_full[18]), // output full 
		.empty(mat_val_empty[18]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_18 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[18]), // input wr_en 
		.re(col_id_rd_en[18]), // input rd_en 
		.dout(col_id_out[((18+1)*`COL_ID_BITS)-1:18*`COL_ID_BITS]), 
		.full(col_id_full[18]), // output full 
		.empty(col_id_empty[18]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_18 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[18]), // input wr_en 
		.re(row_id_rd_en[18]), // input rd_en 
		.dout(row_id_out[((18+1)*`ROW_ID_BITS)-1:18*`ROW_ID_BITS]), 
		.full(row_id_full[18]), // output full 
		.empty(row_id_empty[18]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_19 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[19]), // input wr_en 
		.re(mat_val_rd_en[19]), // input rd_en 
		.dout(mat_val_out[((19+1)*`MAT_VAL_BITS)-1:19*`MAT_VAL_BITS]), 
		.full(mat_val_full[19]), // output full 
		.empty(mat_val_empty[19]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_19 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[19]), // input wr_en 
		.re(col_id_rd_en[19]), // input rd_en 
		.dout(col_id_out[((19+1)*`COL_ID_BITS)-1:19*`COL_ID_BITS]), 
		.full(col_id_full[19]), // output full 
		.empty(col_id_empty[19]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_19 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[19]), // input wr_en 
		.re(row_id_rd_en[19]), // input rd_en 
		.dout(row_id_out[((19+1)*`ROW_ID_BITS)-1:19*`ROW_ID_BITS]), 
		.full(row_id_full[19]), // output full 
		.empty(row_id_empty[19]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_20 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[20]), // input wr_en 
		.re(mat_val_rd_en[20]), // input rd_en 
		.dout(mat_val_out[((20+1)*`MAT_VAL_BITS)-1:20*`MAT_VAL_BITS]), 
		.full(mat_val_full[20]), // output full 
		.empty(mat_val_empty[20]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_20 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[20]), // input wr_en 
		.re(col_id_rd_en[20]), // input rd_en 
		.dout(col_id_out[((20+1)*`COL_ID_BITS)-1:20*`COL_ID_BITS]), 
		.full(col_id_full[20]), // output full 
		.empty(col_id_empty[20]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_20 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[20]), // input wr_en 
		.re(row_id_rd_en[20]), // input rd_en 
		.dout(row_id_out[((20+1)*`ROW_ID_BITS)-1:20*`ROW_ID_BITS]), 
		.full(row_id_full[20]), // output full 
		.empty(row_id_empty[20]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_21 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[21]), // input wr_en 
		.re(mat_val_rd_en[21]), // input rd_en 
		.dout(mat_val_out[((21+1)*`MAT_VAL_BITS)-1:21*`MAT_VAL_BITS]), 
		.full(mat_val_full[21]), // output full 
		.empty(mat_val_empty[21]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_21 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[21]), // input wr_en 
		.re(col_id_rd_en[21]), // input rd_en 
		.dout(col_id_out[((21+1)*`COL_ID_BITS)-1:21*`COL_ID_BITS]), 
		.full(col_id_full[21]), // output full 
		.empty(col_id_empty[21]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_21 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[21]), // input wr_en 
		.re(row_id_rd_en[21]), // input rd_en 
		.dout(row_id_out[((21+1)*`ROW_ID_BITS)-1:21*`ROW_ID_BITS]), 
		.full(row_id_full[21]), // output full 
		.empty(row_id_empty[21]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_22 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[22]), // input wr_en 
		.re(mat_val_rd_en[22]), // input rd_en 
		.dout(mat_val_out[((22+1)*`MAT_VAL_BITS)-1:22*`MAT_VAL_BITS]), 
		.full(mat_val_full[22]), // output full 
		.empty(mat_val_empty[22]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_22 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[22]), // input wr_en 
		.re(col_id_rd_en[22]), // input rd_en 
		.dout(col_id_out[((22+1)*`COL_ID_BITS)-1:22*`COL_ID_BITS]), 
		.full(col_id_full[22]), // output full 
		.empty(col_id_empty[22]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_22 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[22]), // input wr_en 
		.re(row_id_rd_en[22]), // input rd_en 
		.dout(row_id_out[((22+1)*`ROW_ID_BITS)-1:22*`ROW_ID_BITS]), 
		.full(row_id_full[22]), // output full 
		.empty(row_id_empty[22]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_23 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[23]), // input wr_en 
		.re(mat_val_rd_en[23]), // input rd_en 
		.dout(mat_val_out[((23+1)*`MAT_VAL_BITS)-1:23*`MAT_VAL_BITS]), 
		.full(mat_val_full[23]), // output full 
		.empty(mat_val_empty[23]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_23 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[23]), // input wr_en 
		.re(col_id_rd_en[23]), // input rd_en 
		.dout(col_id_out[((23+1)*`COL_ID_BITS)-1:23*`COL_ID_BITS]), 
		.full(col_id_full[23]), // output full 
		.empty(col_id_empty[23]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_23 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[23]), // input wr_en 
		.re(row_id_rd_en[23]), // input rd_en 
		.dout(row_id_out[((23+1)*`ROW_ID_BITS)-1:23*`ROW_ID_BITS]), 
		.full(row_id_full[23]), // output full 
		.empty(row_id_empty[23]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_24 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[24]), // input wr_en 
		.re(mat_val_rd_en[24]), // input rd_en 
		.dout(mat_val_out[((24+1)*`MAT_VAL_BITS)-1:24*`MAT_VAL_BITS]), 
		.full(mat_val_full[24]), // output full 
		.empty(mat_val_empty[24]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_24 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[24]), // input wr_en 
		.re(col_id_rd_en[24]), // input rd_en 
		.dout(col_id_out[((24+1)*`COL_ID_BITS)-1:24*`COL_ID_BITS]), 
		.full(col_id_full[24]), // output full 
		.empty(col_id_empty[24]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_24 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[24]), // input wr_en 
		.re(row_id_rd_en[24]), // input rd_en 
		.dout(row_id_out[((24+1)*`ROW_ID_BITS)-1:24*`ROW_ID_BITS]), 
		.full(row_id_full[24]), // output full 
		.empty(row_id_empty[24]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_25 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[25]), // input wr_en 
		.re(mat_val_rd_en[25]), // input rd_en 
		.dout(mat_val_out[((25+1)*`MAT_VAL_BITS)-1:25*`MAT_VAL_BITS]), 
		.full(mat_val_full[25]), // output full 
		.empty(mat_val_empty[25]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_25 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[25]), // input wr_en 
		.re(col_id_rd_en[25]), // input rd_en 
		.dout(col_id_out[((25+1)*`COL_ID_BITS)-1:25*`COL_ID_BITS]), 
		.full(col_id_full[25]), // output full 
		.empty(col_id_empty[25]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_25 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[25]), // input wr_en 
		.re(row_id_rd_en[25]), // input rd_en 
		.dout(row_id_out[((25+1)*`ROW_ID_BITS)-1:25*`ROW_ID_BITS]), 
		.full(row_id_full[25]), // output full 
		.empty(row_id_empty[25]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_26 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[26]), // input wr_en 
		.re(mat_val_rd_en[26]), // input rd_en 
		.dout(mat_val_out[((26+1)*`MAT_VAL_BITS)-1:26*`MAT_VAL_BITS]), 
		.full(mat_val_full[26]), // output full 
		.empty(mat_val_empty[26]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_26 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[26]), // input wr_en 
		.re(col_id_rd_en[26]), // input rd_en 
		.dout(col_id_out[((26+1)*`COL_ID_BITS)-1:26*`COL_ID_BITS]), 
		.full(col_id_full[26]), // output full 
		.empty(col_id_empty[26]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_26 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[26]), // input wr_en 
		.re(row_id_rd_en[26]), // input rd_en 
		.dout(row_id_out[((26+1)*`ROW_ID_BITS)-1:26*`ROW_ID_BITS]), 
		.full(row_id_full[26]), // output full 
		.empty(row_id_empty[26]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_27 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[27]), // input wr_en 
		.re(mat_val_rd_en[27]), // input rd_en 
		.dout(mat_val_out[((27+1)*`MAT_VAL_BITS)-1:27*`MAT_VAL_BITS]), 
		.full(mat_val_full[27]), // output full 
		.empty(mat_val_empty[27]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_27 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[27]), // input wr_en 
		.re(col_id_rd_en[27]), // input rd_en 
		.dout(col_id_out[((27+1)*`COL_ID_BITS)-1:27*`COL_ID_BITS]), 
		.full(col_id_full[27]), // output full 
		.empty(col_id_empty[27]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_27 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[27]), // input wr_en 
		.re(row_id_rd_en[27]), // input rd_en 
		.dout(row_id_out[((27+1)*`ROW_ID_BITS)-1:27*`ROW_ID_BITS]), 
		.full(row_id_full[27]), // output full 
		.empty(row_id_empty[27]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_28 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[28]), // input wr_en 
		.re(mat_val_rd_en[28]), // input rd_en 
		.dout(mat_val_out[((28+1)*`MAT_VAL_BITS)-1:28*`MAT_VAL_BITS]), 
		.full(mat_val_full[28]), // output full 
		.empty(mat_val_empty[28]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_28 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[28]), // input wr_en 
		.re(col_id_rd_en[28]), // input rd_en 
		.dout(col_id_out[((28+1)*`COL_ID_BITS)-1:28*`COL_ID_BITS]), 
		.full(col_id_full[28]), // output full 
		.empty(col_id_empty[28]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_28 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[28]), // input wr_en 
		.re(row_id_rd_en[28]), // input rd_en 
		.dout(row_id_out[((28+1)*`ROW_ID_BITS)-1:28*`ROW_ID_BITS]), 
		.full(row_id_full[28]), // output full 
		.empty(row_id_empty[28]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_29 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[29]), // input wr_en 
		.re(mat_val_rd_en[29]), // input rd_en 
		.dout(mat_val_out[((29+1)*`MAT_VAL_BITS)-1:29*`MAT_VAL_BITS]), 
		.full(mat_val_full[29]), // output full 
		.empty(mat_val_empty[29]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_29 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[29]), // input wr_en 
		.re(col_id_rd_en[29]), // input rd_en 
		.dout(col_id_out[((29+1)*`COL_ID_BITS)-1:29*`COL_ID_BITS]), 
		.full(col_id_full[29]), // output full 
		.empty(col_id_empty[29]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_29 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[29]), // input wr_en 
		.re(row_id_rd_en[29]), // input rd_en 
		.dout(row_id_out[((29+1)*`ROW_ID_BITS)-1:29*`ROW_ID_BITS]), 
		.full(row_id_full[29]), // output full 
		.empty(row_id_empty[29]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_30 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[30]), // input wr_en 
		.re(mat_val_rd_en[30]), // input rd_en 
		.dout(mat_val_out[((30+1)*`MAT_VAL_BITS)-1:30*`MAT_VAL_BITS]), 
		.full(mat_val_full[30]), // output full 
		.empty(mat_val_empty[30]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_30 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[30]), // input wr_en 
		.re(col_id_rd_en[30]), // input rd_en 
		.dout(col_id_out[((30+1)*`COL_ID_BITS)-1:30*`COL_ID_BITS]), 
		.full(col_id_full[30]), // output full 
		.empty(col_id_empty[30]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_30 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[30]), // input wr_en 
		.re(row_id_rd_en[30]), // input rd_en 
		.dout(row_id_out[((30+1)*`ROW_ID_BITS)-1:30*`ROW_ID_BITS]), 
		.full(row_id_full[30]), // output full 
		.empty(row_id_empty[30]) // output empty 
	);

	generic_fifo_sc_a #(
		.dw(MAT_VAL_ROM_DWIDTH),
		.aw(FIFO_DEPTH_BITS)
	) fifo_mat_val_31 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(mat_val_dout), 
		.we(mat_val_wr_en[31]), // input wr_en 
		.re(mat_val_rd_en[31]), // input rd_en 
		.dout(mat_val_out[((31+1)*`MAT_VAL_BITS)-1:31*`MAT_VAL_BITS]), 
		.full(mat_val_full[31]), // output full 
		.empty(mat_val_empty[31]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(COL_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_col_id_31 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(col_id_dout), 
		.we(col_id_wr_en[31]), // input wr_en 
		.re(col_id_rd_en[31]), // input rd_en 
		.dout(col_id_out[((31+1)*`COL_ID_BITS)-1:31*`COL_ID_BITS]), 
		.full(col_id_full[31]), // output full 
		.empty(col_id_empty[31]) // output empty 
	); 

	generic_fifo_sc_a #( 
		.dw(ROW_ID_ROM_DWIDTH), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_row_id_31 ( 
		.clk(clk), // input clk 
		.rst(rst), // input clk 
		.clr(0), 
		.din(row_id_dout), 
		.we(row_id_wr_en[31]), // input wr_en 
		.re(row_id_rd_en[31]), // input rd_en 
		.dout(row_id_out[((31+1)*`ROW_ID_BITS)-1:31*`ROW_ID_BITS]), 
		.full(row_id_full[31]), // output full 
		.empty(row_id_empty[31]) // output empty 
	);

	//TODO: done signal check for matrix values only. Should check for all three. Use 3 done signals and the final done is the and of all three.
	assign done = (counter >=`NUM_MAT_VALS);

	assign mat_val_full_shifted = mat_val_full>>mat_val_lane;
	assign col_id_full_shifted = col_id_full>>col_id_lane;
	assign row_id_full_shifted = row_id_full>>row_id_lane;

	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			mat_val_addr <= 0;
			col_id_addr <= 0;
			row_id_addr <= 0;

			mat_val_wr_en <= 0;
			col_id_wr_en <= 0;
			row_id_wr_en <= 0;

			mat_val_lane <= 0;
			col_id_lane <= 0;
			row_id_lane <= 0;

			counter <= 0;
		end
		else begin
			if(!done) begin
				// Write matrix value into its FIFO
				if (!mat_val_full_shifted[0]) begin
					mat_val_wr_en <= (({`NUM_CHANNEL{1'b0}}) | (1<<mat_val_lane));
					mat_val_lane <= mat_val_lane + 1;
					mat_val_addr <= mat_val_addr + 1;
					counter <= counter + 1;
				end

				// Write column ID into its FIFO
				if (!col_id_full_shifted[0]) begin
					col_id_wr_en <= (({`NUM_CHANNEL{1'b0}}) | (1<<col_id_lane));
					col_id_lane <= col_id_lane + 1;
					col_id_addr <= col_id_addr + 1;
				end

				// Write row id into its FIFO
				if (!row_id_full_shifted[0]) begin
					row_id_wr_en <= (({`NUM_CHANNEL{1'b0}}) | (1<<row_id_lane));
					row_id_lane <= row_id_lane + 1;
					row_id_addr <= row_id_addr + 1;
				end
			end
			else begin
				mat_val_wr_en <= 0;
				col_id_wr_en <= 0;
				row_id_wr_en <= 0;
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

module spram #(
`ifdef SIMULATION
	parameter INIT="init.txt",
`endif
	parameter AWIDTH=5,
	parameter NUM_WORDS=32,
	parameter DWIDTH=16)
	(
		input clk,
		input [(AWIDTH-1):0] address,
		input wren,
		input [(DWIDTH-1):0] din,
		output reg [(DWIDTH-1):0] dout
	);
	`ifdef SIMULATION
		reg [DWIDTH-1:0] mem [NUM_WORDS-1:0];

		//initial begin
		//	$readmemh(INIT, mem);
		//end

		always @ (posedge clk) begin 
			if (wren) begin
				mem[address] <= din;
			end
			else begin
				dout <= mem[address];
			end
		end
	`else 

		single_port_ram u_single_port_ram( 
		.addr(address),
		.we(wren),
		.data(din),
		.out(dout),
		.clk(clk)
		);

	`endif 
endmodule






