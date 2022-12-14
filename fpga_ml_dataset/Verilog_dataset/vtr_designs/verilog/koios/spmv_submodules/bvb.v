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

module bvb(
	input clk,
	input rst,
	input start,
	// input from column ID FIFO
	input  [(`NUM_CHANNEL*`COL_ID_BITS)-1:0] id,
	input  [`NUM_CHANNEL-1:0] id_empty,
	// input to the column ID FIFO
	output [`NUM_CHANNEL-1:0] id_rd_en,

	// vector value FIFO outputs
	output [(`NUM_CHANNEL*`VEC_VAL_BITS)-1:0] val,
	output [`NUM_CHANNEL-1:0]   val_empty,
	// input to vector value FIFO
	input  [`NUM_CHANNEL-1:0]   val_rd_en
);

	parameter FIFO_DEPTH_BITS = $clog2(`FIFO_DEPTH);

	reg [`NUM_CHANNEL-1:0] val_wr_en;
	wire [`NUM_CHANNEL-1:0] val_full;

	wire [`NUM_VEC_VALS_PER_ADDR*`VEC_VAL_BITS-1:0] ram_out;

	wire fifo_in_val;

	wire [`NUM_VEC_VALS_PER_ADDR*`VEC_VAL_BITS-1:0] din_nc;

	reg [`COL_ID_BITS-1:0] rd_addr;

	wire id_empty_shifted;
	wire val_full_shifted;

	wire id_rd_en_local;
	reg id_rd_en_local_reg;

	reg [`NUM_CHANNEL_BITS-1:0] counter;
	reg [`NUM_CHANNEL_BITS-1:0] counter_delay;

	spram #(
	`ifdef SIMULATION
		.INIT("/home/aatman/Desktop/SpMV/src/coe/vec_val.txt"),
	`endif
		.AWIDTH(`BVB_AWIDTH),
		.NUM_WORDS(`NUM_ADDR),
		.DWIDTH(`NUM_VEC_VALS_PER_ADDR*`VEC_VAL_BITS)
		) vector_ram (
			.clk(clk), 
			.wren(0),
			.address(rd_addr), 
			.din(din_nc), 
			.dout(ram_out)
		);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_0 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[0]), // input wr_en 
		.re(val_rd_en[0]), // input rd_en 
		.dout(val[(0+1)*`VEC_VAL_BITS-1:0*`VEC_VAL_BITS]), 
		.full(val_full[0]), // output full 
		.empty(val_empty[0]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_1 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[1]), // input wr_en 
		.re(val_rd_en[1]), // input rd_en 
		.dout(val[(1+1)*`VEC_VAL_BITS-1:1*`VEC_VAL_BITS]), 
		.full(val_full[1]), // output full 
		.empty(val_empty[1]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_2 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[2]), // input wr_en 
		.re(val_rd_en[2]), // input rd_en 
		.dout(val[(2+1)*`VEC_VAL_BITS-1:2*`VEC_VAL_BITS]), 
		.full(val_full[2]), // output full 
		.empty(val_empty[2]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_3 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[3]), // input wr_en 
		.re(val_rd_en[3]), // input rd_en 
		.dout(val[(3+1)*`VEC_VAL_BITS-1:3*`VEC_VAL_BITS]), 
		.full(val_full[3]), // output full 
		.empty(val_empty[3]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_4 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[4]), // input wr_en 
		.re(val_rd_en[4]), // input rd_en 
		.dout(val[(4+1)*`VEC_VAL_BITS-1:4*`VEC_VAL_BITS]), 
		.full(val_full[4]), // output full 
		.empty(val_empty[4]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_5 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[5]), // input wr_en 
		.re(val_rd_en[5]), // input rd_en 
		.dout(val[(5+1)*`VEC_VAL_BITS-1:5*`VEC_VAL_BITS]), 
		.full(val_full[5]), // output full 
		.empty(val_empty[5]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_6 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[6]), // input wr_en 
		.re(val_rd_en[6]), // input rd_en 
		.dout(val[(6+1)*`VEC_VAL_BITS-1:6*`VEC_VAL_BITS]), 
		.full(val_full[6]), // output full 
		.empty(val_empty[6]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_7 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[7]), // input wr_en 
		.re(val_rd_en[7]), // input rd_en 
		.dout(val[(7+1)*`VEC_VAL_BITS-1:7*`VEC_VAL_BITS]), 
		.full(val_full[7]), // output full 
		.empty(val_empty[7]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_8 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[8]), // input wr_en 
		.re(val_rd_en[8]), // input rd_en 
		.dout(val[(8+1)*`VEC_VAL_BITS-1:8*`VEC_VAL_BITS]), 
		.full(val_full[8]), // output full 
		.empty(val_empty[8]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_9 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[9]), // input wr_en 
		.re(val_rd_en[9]), // input rd_en 
		.dout(val[(9+1)*`VEC_VAL_BITS-1:9*`VEC_VAL_BITS]), 
		.full(val_full[9]), // output full 
		.empty(val_empty[9]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_10 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[10]), // input wr_en 
		.re(val_rd_en[10]), // input rd_en 
		.dout(val[(10+1)*`VEC_VAL_BITS-1:10*`VEC_VAL_BITS]), 
		.full(val_full[10]), // output full 
		.empty(val_empty[10]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_11 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[11]), // input wr_en 
		.re(val_rd_en[11]), // input rd_en 
		.dout(val[(11+1)*`VEC_VAL_BITS-1:11*`VEC_VAL_BITS]), 
		.full(val_full[11]), // output full 
		.empty(val_empty[11]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_12 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[12]), // input wr_en 
		.re(val_rd_en[12]), // input rd_en 
		.dout(val[(12+1)*`VEC_VAL_BITS-1:12*`VEC_VAL_BITS]), 
		.full(val_full[12]), // output full 
		.empty(val_empty[12]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_13 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[13]), // input wr_en 
		.re(val_rd_en[13]), // input rd_en 
		.dout(val[(13+1)*`VEC_VAL_BITS-1:13*`VEC_VAL_BITS]), 
		.full(val_full[13]), // output full 
		.empty(val_empty[13]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_14 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[14]), // input wr_en 
		.re(val_rd_en[14]), // input rd_en 
		.dout(val[(14+1)*`VEC_VAL_BITS-1:14*`VEC_VAL_BITS]), 
		.full(val_full[14]), // output full 
		.empty(val_empty[14]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_15 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[15]), // input wr_en 
		.re(val_rd_en[15]), // input rd_en 
		.dout(val[(15+1)*`VEC_VAL_BITS-1:15*`VEC_VAL_BITS]), 
		.full(val_full[15]), // output full 
		.empty(val_empty[15]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_16 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[16]), // input wr_en 
		.re(val_rd_en[16]), // input rd_en 
		.dout(val[(16+1)*`VEC_VAL_BITS-1:16*`VEC_VAL_BITS]), 
		.full(val_full[16]), // output full 
		.empty(val_empty[16]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_17 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[17]), // input wr_en 
		.re(val_rd_en[17]), // input rd_en 
		.dout(val[(17+1)*`VEC_VAL_BITS-1:17*`VEC_VAL_BITS]), 
		.full(val_full[17]), // output full 
		.empty(val_empty[17]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_18 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[18]), // input wr_en 
		.re(val_rd_en[18]), // input rd_en 
		.dout(val[(18+1)*`VEC_VAL_BITS-1:18*`VEC_VAL_BITS]), 
		.full(val_full[18]), // output full 
		.empty(val_empty[18]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_19 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[19]), // input wr_en 
		.re(val_rd_en[19]), // input rd_en 
		.dout(val[(19+1)*`VEC_VAL_BITS-1:19*`VEC_VAL_BITS]), 
		.full(val_full[19]), // output full 
		.empty(val_empty[19]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_20 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[20]), // input wr_en 
		.re(val_rd_en[20]), // input rd_en 
		.dout(val[(20+1)*`VEC_VAL_BITS-1:20*`VEC_VAL_BITS]), 
		.full(val_full[20]), // output full 
		.empty(val_empty[20]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_21 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[21]), // input wr_en 
		.re(val_rd_en[21]), // input rd_en 
		.dout(val[(21+1)*`VEC_VAL_BITS-1:21*`VEC_VAL_BITS]), 
		.full(val_full[21]), // output full 
		.empty(val_empty[21]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_22 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[22]), // input wr_en 
		.re(val_rd_en[22]), // input rd_en 
		.dout(val[(22+1)*`VEC_VAL_BITS-1:22*`VEC_VAL_BITS]), 
		.full(val_full[22]), // output full 
		.empty(val_empty[22]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_23 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[23]), // input wr_en 
		.re(val_rd_en[23]), // input rd_en 
		.dout(val[(23+1)*`VEC_VAL_BITS-1:23*`VEC_VAL_BITS]), 
		.full(val_full[23]), // output full 
		.empty(val_empty[23]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_24 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[24]), // input wr_en 
		.re(val_rd_en[24]), // input rd_en 
		.dout(val[(24+1)*`VEC_VAL_BITS-1:24*`VEC_VAL_BITS]), 
		.full(val_full[24]), // output full 
		.empty(val_empty[24]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_25 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[25]), // input wr_en 
		.re(val_rd_en[25]), // input rd_en 
		.dout(val[(25+1)*`VEC_VAL_BITS-1:25*`VEC_VAL_BITS]), 
		.full(val_full[25]), // output full 
		.empty(val_empty[25]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_26 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[26]), // input wr_en 
		.re(val_rd_en[26]), // input rd_en 
		.dout(val[(26+1)*`VEC_VAL_BITS-1:26*`VEC_VAL_BITS]), 
		.full(val_full[26]), // output full 
		.empty(val_empty[26]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_27 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[27]), // input wr_en 
		.re(val_rd_en[27]), // input rd_en 
		.dout(val[(27+1)*`VEC_VAL_BITS-1:27*`VEC_VAL_BITS]), 
		.full(val_full[27]), // output full 
		.empty(val_empty[27]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_28 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[28]), // input wr_en 
		.re(val_rd_en[28]), // input rd_en 
		.dout(val[(28+1)*`VEC_VAL_BITS-1:28*`VEC_VAL_BITS]), 
		.full(val_full[28]), // output full 
		.empty(val_empty[28]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_29 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[29]), // input wr_en 
		.re(val_rd_en[29]), // input rd_en 
		.dout(val[(29+1)*`VEC_VAL_BITS-1:29*`VEC_VAL_BITS]), 
		.full(val_full[29]), // output full 
		.empty(val_empty[29]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_30 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[30]), // input wr_en 
		.re(val_rd_en[30]), // input rd_en 
		.dout(val[(30+1)*`VEC_VAL_BITS-1:30*`VEC_VAL_BITS]), 
		.full(val_full[30]), // output full 
		.empty(val_empty[30]) // output empty 
	);

	generic_fifo_sc_a #( 
		.dw(`VEC_VAL_BITS), 
		.aw(FIFO_DEPTH_BITS) 
	) fifo_bvb_31 ( 
		.clk(clk), // input clk 
		.rst(rst), 
		.clr(0), 
		.din(ram_out), 
		.we(val_wr_en[31]), // input wr_en 
		.re(val_rd_en[31]), // input rd_en 
		.dout(val[(31+1)*`VEC_VAL_BITS-1:31*`VEC_VAL_BITS]), 
		.full(val_full[31]), // output full 
		.empty(val_empty[31]) // output empty 
	);

	assign id_empty_shifted = id_empty >> counter;
	assign val_full_shifted = val_full >> counter;
	assign id_rd_en_local = (start & (~id_empty_shifted) & (~val_full_shifted));
	assign id_rd_en = id_rd_en_local << counter;

	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			counter <= 0;
			counter_delay <= 0;
		end
		else if (start) begin
			counter <= counter + 1;
			counter_delay <= counter;
			id_rd_en_local_reg <= id_rd_en_local;
			val_wr_en <= id_rd_en_local_reg << counter_delay;
			rd_addr <= id >> (counter*`COL_ID_BITS);
		end
	end
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



