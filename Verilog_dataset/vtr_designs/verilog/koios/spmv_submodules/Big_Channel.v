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

module Big_Channel(
	input clk, 
	input rst, 
	input start,
	input fetcher_done,
	
	input [`MAT_VAL_BITS * `NUM_CHANNEL -1 :0] mat_val,
	input [`NUM_CHANNEL - 1 : 0] mat_val_empty,
	output [`NUM_CHANNEL - 1 : 0] mat_val_rd_en,

	input [`VEC_VAL_BITS * `NUM_CHANNEL - 1 : 0] vec_val,
	input [`NUM_CHANNEL-1:0] vec_val_empty,
	output [`NUM_CHANNEL-1:0] vec_val_rd_en,

	input [`ROW_ID_BITS * `NUM_CHANNEL -1:0] row_id,
	input [`NUM_CHANNEL-1:0] row_id_empty,
	output [`NUM_CHANNEL-1:0] row_id_rd_en,

	output [`MULT_BITS * `NUM_CHANNEL -1:0] data_out,
	output [`NUM_CHANNEL-1:0] data_out_empty,
	output [`ROW_ID_BITS * `NUM_CHANNEL -1:0] addr_out,
	input [`NUM_CHANNEL-1:0] out_rd_en,

	output [`NUM_CHANNEL-1:0] done
);
	
	Channel_Accumulator CH_0 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(0+1)*`MAT_VAL_BITS-1:0*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[0]), 
		.mat_val_rd_en(mat_val_rd_en[0]), 
		.vec_val(vec_val[(0+1)*`VEC_VAL_BITS-1:0*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[0]), 
		.vec_val_rd_en(vec_val_rd_en[0]), 
		.row_id(row_id[(0+1)*`ROW_ID_BITS-1:0*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[0]), 
		.row_id_rd_en(row_id_rd_en[0]), 
		.data_out(data_out[(0+1)*`MULT_BITS-1:0*`MULT_BITS]), 
		.data_out_empty(data_out_empty[0]), 
		.addr_out(addr_out[(0+1)*`ROW_ID_BITS-1:0*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[0]), 
		.done(done[0]) 
	);

	Channel_Accumulator CH_1 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(1+1)*`MAT_VAL_BITS-1:1*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[1]), 
		.mat_val_rd_en(mat_val_rd_en[1]), 
		.vec_val(vec_val[(1+1)*`VEC_VAL_BITS-1:1*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[1]), 
		.vec_val_rd_en(vec_val_rd_en[1]), 
		.row_id(row_id[(1+1)*`ROW_ID_BITS-1:1*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[1]), 
		.row_id_rd_en(row_id_rd_en[1]), 
		.data_out(data_out[(1+1)*`MULT_BITS-1:1*`MULT_BITS]), 
		.data_out_empty(data_out_empty[1]), 
		.addr_out(addr_out[(1+1)*`ROW_ID_BITS-1:1*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[1]), 
		.done(done[1]) 
	);

	Channel_Accumulator CH_2 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(2+1)*`MAT_VAL_BITS-1:2*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[2]), 
		.mat_val_rd_en(mat_val_rd_en[2]), 
		.vec_val(vec_val[(2+1)*`VEC_VAL_BITS-1:2*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[2]), 
		.vec_val_rd_en(vec_val_rd_en[2]), 
		.row_id(row_id[(2+1)*`ROW_ID_BITS-1:2*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[2]), 
		.row_id_rd_en(row_id_rd_en[2]), 
		.data_out(data_out[(2+1)*`MULT_BITS-1:2*`MULT_BITS]), 
		.data_out_empty(data_out_empty[2]), 
		.addr_out(addr_out[(2+1)*`ROW_ID_BITS-1:2*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[2]), 
		.done(done[2]) 
	);

	Channel_Accumulator CH_3 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(3+1)*`MAT_VAL_BITS-1:3*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[3]), 
		.mat_val_rd_en(mat_val_rd_en[3]), 
		.vec_val(vec_val[(3+1)*`VEC_VAL_BITS-1:3*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[3]), 
		.vec_val_rd_en(vec_val_rd_en[3]), 
		.row_id(row_id[(3+1)*`ROW_ID_BITS-1:3*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[3]), 
		.row_id_rd_en(row_id_rd_en[3]), 
		.data_out(data_out[(3+1)*`MULT_BITS-1:3*`MULT_BITS]), 
		.data_out_empty(data_out_empty[3]), 
		.addr_out(addr_out[(3+1)*`ROW_ID_BITS-1:3*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[3]), 
		.done(done[3]) 
	);

	Channel_Accumulator CH_4 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(4+1)*`MAT_VAL_BITS-1:4*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[4]), 
		.mat_val_rd_en(mat_val_rd_en[4]), 
		.vec_val(vec_val[(4+1)*`VEC_VAL_BITS-1:4*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[4]), 
		.vec_val_rd_en(vec_val_rd_en[4]), 
		.row_id(row_id[(4+1)*`ROW_ID_BITS-1:4*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[4]), 
		.row_id_rd_en(row_id_rd_en[4]), 
		.data_out(data_out[(4+1)*`MULT_BITS-1:4*`MULT_BITS]), 
		.data_out_empty(data_out_empty[4]), 
		.addr_out(addr_out[(4+1)*`ROW_ID_BITS-1:4*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[4]), 
		.done(done[4]) 
	);

	Channel_Accumulator CH_5 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(5+1)*`MAT_VAL_BITS-1:5*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[5]), 
		.mat_val_rd_en(mat_val_rd_en[5]), 
		.vec_val(vec_val[(5+1)*`VEC_VAL_BITS-1:5*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[5]), 
		.vec_val_rd_en(vec_val_rd_en[5]), 
		.row_id(row_id[(5+1)*`ROW_ID_BITS-1:5*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[5]), 
		.row_id_rd_en(row_id_rd_en[5]), 
		.data_out(data_out[(5+1)*`MULT_BITS-1:5*`MULT_BITS]), 
		.data_out_empty(data_out_empty[5]), 
		.addr_out(addr_out[(5+1)*`ROW_ID_BITS-1:5*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[5]), 
		.done(done[5]) 
	);

	Channel_Accumulator CH_6 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(6+1)*`MAT_VAL_BITS-1:6*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[6]), 
		.mat_val_rd_en(mat_val_rd_en[6]), 
		.vec_val(vec_val[(6+1)*`VEC_VAL_BITS-1:6*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[6]), 
		.vec_val_rd_en(vec_val_rd_en[6]), 
		.row_id(row_id[(6+1)*`ROW_ID_BITS-1:6*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[6]), 
		.row_id_rd_en(row_id_rd_en[6]), 
		.data_out(data_out[(6+1)*`MULT_BITS-1:6*`MULT_BITS]), 
		.data_out_empty(data_out_empty[6]), 
		.addr_out(addr_out[(6+1)*`ROW_ID_BITS-1:6*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[6]), 
		.done(done[6]) 
	);

	Channel_Accumulator CH_7 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(7+1)*`MAT_VAL_BITS-1:7*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[7]), 
		.mat_val_rd_en(mat_val_rd_en[7]), 
		.vec_val(vec_val[(7+1)*`VEC_VAL_BITS-1:7*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[7]), 
		.vec_val_rd_en(vec_val_rd_en[7]), 
		.row_id(row_id[(7+1)*`ROW_ID_BITS-1:7*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[7]), 
		.row_id_rd_en(row_id_rd_en[7]), 
		.data_out(data_out[(7+1)*`MULT_BITS-1:7*`MULT_BITS]), 
		.data_out_empty(data_out_empty[7]), 
		.addr_out(addr_out[(7+1)*`ROW_ID_BITS-1:7*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[7]), 
		.done(done[7]) 
	);

	Channel_Accumulator CH_8 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(8+1)*`MAT_VAL_BITS-1:8*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[8]), 
		.mat_val_rd_en(mat_val_rd_en[8]), 
		.vec_val(vec_val[(8+1)*`VEC_VAL_BITS-1:8*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[8]), 
		.vec_val_rd_en(vec_val_rd_en[8]), 
		.row_id(row_id[(8+1)*`ROW_ID_BITS-1:8*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[8]), 
		.row_id_rd_en(row_id_rd_en[8]), 
		.data_out(data_out[(8+1)*`MULT_BITS-1:8*`MULT_BITS]), 
		.data_out_empty(data_out_empty[8]), 
		.addr_out(addr_out[(8+1)*`ROW_ID_BITS-1:8*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[8]), 
		.done(done[8]) 
	);

	Channel_Accumulator CH_9 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(9+1)*`MAT_VAL_BITS-1:9*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[9]), 
		.mat_val_rd_en(mat_val_rd_en[9]), 
		.vec_val(vec_val[(9+1)*`VEC_VAL_BITS-1:9*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[9]), 
		.vec_val_rd_en(vec_val_rd_en[9]), 
		.row_id(row_id[(9+1)*`ROW_ID_BITS-1:9*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[9]), 
		.row_id_rd_en(row_id_rd_en[9]), 
		.data_out(data_out[(9+1)*`MULT_BITS-1:9*`MULT_BITS]), 
		.data_out_empty(data_out_empty[9]), 
		.addr_out(addr_out[(9+1)*`ROW_ID_BITS-1:9*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[9]), 
		.done(done[9]) 
	);

	Channel_Accumulator CH_10 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(10+1)*`MAT_VAL_BITS-1:10*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[10]), 
		.mat_val_rd_en(mat_val_rd_en[10]), 
		.vec_val(vec_val[(10+1)*`VEC_VAL_BITS-1:10*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[10]), 
		.vec_val_rd_en(vec_val_rd_en[10]), 
		.row_id(row_id[(10+1)*`ROW_ID_BITS-1:10*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[10]), 
		.row_id_rd_en(row_id_rd_en[10]), 
		.data_out(data_out[(10+1)*`MULT_BITS-1:10*`MULT_BITS]), 
		.data_out_empty(data_out_empty[10]), 
		.addr_out(addr_out[(10+1)*`ROW_ID_BITS-1:10*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[10]), 
		.done(done[10]) 
	);

	Channel_Accumulator CH_11 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(11+1)*`MAT_VAL_BITS-1:11*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[11]), 
		.mat_val_rd_en(mat_val_rd_en[11]), 
		.vec_val(vec_val[(11+1)*`VEC_VAL_BITS-1:11*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[11]), 
		.vec_val_rd_en(vec_val_rd_en[11]), 
		.row_id(row_id[(11+1)*`ROW_ID_BITS-1:11*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[11]), 
		.row_id_rd_en(row_id_rd_en[11]), 
		.data_out(data_out[(11+1)*`MULT_BITS-1:11*`MULT_BITS]), 
		.data_out_empty(data_out_empty[11]), 
		.addr_out(addr_out[(11+1)*`ROW_ID_BITS-1:11*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[11]), 
		.done(done[11]) 
	);

	Channel_Accumulator CH_12 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(12+1)*`MAT_VAL_BITS-1:12*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[12]), 
		.mat_val_rd_en(mat_val_rd_en[12]), 
		.vec_val(vec_val[(12+1)*`VEC_VAL_BITS-1:12*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[12]), 
		.vec_val_rd_en(vec_val_rd_en[12]), 
		.row_id(row_id[(12+1)*`ROW_ID_BITS-1:12*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[12]), 
		.row_id_rd_en(row_id_rd_en[12]), 
		.data_out(data_out[(12+1)*`MULT_BITS-1:12*`MULT_BITS]), 
		.data_out_empty(data_out_empty[12]), 
		.addr_out(addr_out[(12+1)*`ROW_ID_BITS-1:12*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[12]), 
		.done(done[12]) 
	);

	Channel_Accumulator CH_13 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(13+1)*`MAT_VAL_BITS-1:13*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[13]), 
		.mat_val_rd_en(mat_val_rd_en[13]), 
		.vec_val(vec_val[(13+1)*`VEC_VAL_BITS-1:13*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[13]), 
		.vec_val_rd_en(vec_val_rd_en[13]), 
		.row_id(row_id[(13+1)*`ROW_ID_BITS-1:13*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[13]), 
		.row_id_rd_en(row_id_rd_en[13]), 
		.data_out(data_out[(13+1)*`MULT_BITS-1:13*`MULT_BITS]), 
		.data_out_empty(data_out_empty[13]), 
		.addr_out(addr_out[(13+1)*`ROW_ID_BITS-1:13*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[13]), 
		.done(done[13]) 
	);

	Channel_Accumulator CH_14 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(14+1)*`MAT_VAL_BITS-1:14*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[14]), 
		.mat_val_rd_en(mat_val_rd_en[14]), 
		.vec_val(vec_val[(14+1)*`VEC_VAL_BITS-1:14*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[14]), 
		.vec_val_rd_en(vec_val_rd_en[14]), 
		.row_id(row_id[(14+1)*`ROW_ID_BITS-1:14*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[14]), 
		.row_id_rd_en(row_id_rd_en[14]), 
		.data_out(data_out[(14+1)*`MULT_BITS-1:14*`MULT_BITS]), 
		.data_out_empty(data_out_empty[14]), 
		.addr_out(addr_out[(14+1)*`ROW_ID_BITS-1:14*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[14]), 
		.done(done[14]) 
	);

	Channel_Accumulator CH_15 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(15+1)*`MAT_VAL_BITS-1:15*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[15]), 
		.mat_val_rd_en(mat_val_rd_en[15]), 
		.vec_val(vec_val[(15+1)*`VEC_VAL_BITS-1:15*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[15]), 
		.vec_val_rd_en(vec_val_rd_en[15]), 
		.row_id(row_id[(15+1)*`ROW_ID_BITS-1:15*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[15]), 
		.row_id_rd_en(row_id_rd_en[15]), 
		.data_out(data_out[(15+1)*`MULT_BITS-1:15*`MULT_BITS]), 
		.data_out_empty(data_out_empty[15]), 
		.addr_out(addr_out[(15+1)*`ROW_ID_BITS-1:15*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[15]), 
		.done(done[15]) 
	);

	Channel_Accumulator CH_16 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(16+1)*`MAT_VAL_BITS-1:16*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[16]), 
		.mat_val_rd_en(mat_val_rd_en[16]), 
		.vec_val(vec_val[(16+1)*`VEC_VAL_BITS-1:16*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[16]), 
		.vec_val_rd_en(vec_val_rd_en[16]), 
		.row_id(row_id[(16+1)*`ROW_ID_BITS-1:16*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[16]), 
		.row_id_rd_en(row_id_rd_en[16]), 
		.data_out(data_out[(16+1)*`MULT_BITS-1:16*`MULT_BITS]), 
		.data_out_empty(data_out_empty[16]), 
		.addr_out(addr_out[(16+1)*`ROW_ID_BITS-1:16*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[16]), 
		.done(done[16]) 
	);

	Channel_Accumulator CH_17 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(17+1)*`MAT_VAL_BITS-1:17*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[17]), 
		.mat_val_rd_en(mat_val_rd_en[17]), 
		.vec_val(vec_val[(17+1)*`VEC_VAL_BITS-1:17*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[17]), 
		.vec_val_rd_en(vec_val_rd_en[17]), 
		.row_id(row_id[(17+1)*`ROW_ID_BITS-1:17*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[17]), 
		.row_id_rd_en(row_id_rd_en[17]), 
		.data_out(data_out[(17+1)*`MULT_BITS-1:17*`MULT_BITS]), 
		.data_out_empty(data_out_empty[17]), 
		.addr_out(addr_out[(17+1)*`ROW_ID_BITS-1:17*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[17]), 
		.done(done[17]) 
	);

	Channel_Accumulator CH_18 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(18+1)*`MAT_VAL_BITS-1:18*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[18]), 
		.mat_val_rd_en(mat_val_rd_en[18]), 
		.vec_val(vec_val[(18+1)*`VEC_VAL_BITS-1:18*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[18]), 
		.vec_val_rd_en(vec_val_rd_en[18]), 
		.row_id(row_id[(18+1)*`ROW_ID_BITS-1:18*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[18]), 
		.row_id_rd_en(row_id_rd_en[18]), 
		.data_out(data_out[(18+1)*`MULT_BITS-1:18*`MULT_BITS]), 
		.data_out_empty(data_out_empty[18]), 
		.addr_out(addr_out[(18+1)*`ROW_ID_BITS-1:18*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[18]), 
		.done(done[18]) 
	);

	Channel_Accumulator CH_19 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(19+1)*`MAT_VAL_BITS-1:19*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[19]), 
		.mat_val_rd_en(mat_val_rd_en[19]), 
		.vec_val(vec_val[(19+1)*`VEC_VAL_BITS-1:19*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[19]), 
		.vec_val_rd_en(vec_val_rd_en[19]), 
		.row_id(row_id[(19+1)*`ROW_ID_BITS-1:19*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[19]), 
		.row_id_rd_en(row_id_rd_en[19]), 
		.data_out(data_out[(19+1)*`MULT_BITS-1:19*`MULT_BITS]), 
		.data_out_empty(data_out_empty[19]), 
		.addr_out(addr_out[(19+1)*`ROW_ID_BITS-1:19*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[19]), 
		.done(done[19]) 
	);

	Channel_Accumulator CH_20 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(20+1)*`MAT_VAL_BITS-1:20*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[20]), 
		.mat_val_rd_en(mat_val_rd_en[20]), 
		.vec_val(vec_val[(20+1)*`VEC_VAL_BITS-1:20*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[20]), 
		.vec_val_rd_en(vec_val_rd_en[20]), 
		.row_id(row_id[(20+1)*`ROW_ID_BITS-1:20*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[20]), 
		.row_id_rd_en(row_id_rd_en[20]), 
		.data_out(data_out[(20+1)*`MULT_BITS-1:20*`MULT_BITS]), 
		.data_out_empty(data_out_empty[20]), 
		.addr_out(addr_out[(20+1)*`ROW_ID_BITS-1:20*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[20]), 
		.done(done[20]) 
	);

	Channel_Accumulator CH_21 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(21+1)*`MAT_VAL_BITS-1:21*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[21]), 
		.mat_val_rd_en(mat_val_rd_en[21]), 
		.vec_val(vec_val[(21+1)*`VEC_VAL_BITS-1:21*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[21]), 
		.vec_val_rd_en(vec_val_rd_en[21]), 
		.row_id(row_id[(21+1)*`ROW_ID_BITS-1:21*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[21]), 
		.row_id_rd_en(row_id_rd_en[21]), 
		.data_out(data_out[(21+1)*`MULT_BITS-1:21*`MULT_BITS]), 
		.data_out_empty(data_out_empty[21]), 
		.addr_out(addr_out[(21+1)*`ROW_ID_BITS-1:21*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[21]), 
		.done(done[21]) 
	);

	Channel_Accumulator CH_22 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(22+1)*`MAT_VAL_BITS-1:22*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[22]), 
		.mat_val_rd_en(mat_val_rd_en[22]), 
		.vec_val(vec_val[(22+1)*`VEC_VAL_BITS-1:22*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[22]), 
		.vec_val_rd_en(vec_val_rd_en[22]), 
		.row_id(row_id[(22+1)*`ROW_ID_BITS-1:22*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[22]), 
		.row_id_rd_en(row_id_rd_en[22]), 
		.data_out(data_out[(22+1)*`MULT_BITS-1:22*`MULT_BITS]), 
		.data_out_empty(data_out_empty[22]), 
		.addr_out(addr_out[(22+1)*`ROW_ID_BITS-1:22*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[22]), 
		.done(done[22]) 
	);

	Channel_Accumulator CH_23 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(23+1)*`MAT_VAL_BITS-1:23*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[23]), 
		.mat_val_rd_en(mat_val_rd_en[23]), 
		.vec_val(vec_val[(23+1)*`VEC_VAL_BITS-1:23*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[23]), 
		.vec_val_rd_en(vec_val_rd_en[23]), 
		.row_id(row_id[(23+1)*`ROW_ID_BITS-1:23*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[23]), 
		.row_id_rd_en(row_id_rd_en[23]), 
		.data_out(data_out[(23+1)*`MULT_BITS-1:23*`MULT_BITS]), 
		.data_out_empty(data_out_empty[23]), 
		.addr_out(addr_out[(23+1)*`ROW_ID_BITS-1:23*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[23]), 
		.done(done[23]) 
	);

	Channel_Accumulator CH_24 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(24+1)*`MAT_VAL_BITS-1:24*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[24]), 
		.mat_val_rd_en(mat_val_rd_en[24]), 
		.vec_val(vec_val[(24+1)*`VEC_VAL_BITS-1:24*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[24]), 
		.vec_val_rd_en(vec_val_rd_en[24]), 
		.row_id(row_id[(24+1)*`ROW_ID_BITS-1:24*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[24]), 
		.row_id_rd_en(row_id_rd_en[24]), 
		.data_out(data_out[(24+1)*`MULT_BITS-1:24*`MULT_BITS]), 
		.data_out_empty(data_out_empty[24]), 
		.addr_out(addr_out[(24+1)*`ROW_ID_BITS-1:24*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[24]), 
		.done(done[24]) 
	);

	Channel_Accumulator CH_25 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(25+1)*`MAT_VAL_BITS-1:25*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[25]), 
		.mat_val_rd_en(mat_val_rd_en[25]), 
		.vec_val(vec_val[(25+1)*`VEC_VAL_BITS-1:25*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[25]), 
		.vec_val_rd_en(vec_val_rd_en[25]), 
		.row_id(row_id[(25+1)*`ROW_ID_BITS-1:25*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[25]), 
		.row_id_rd_en(row_id_rd_en[25]), 
		.data_out(data_out[(25+1)*`MULT_BITS-1:25*`MULT_BITS]), 
		.data_out_empty(data_out_empty[25]), 
		.addr_out(addr_out[(25+1)*`ROW_ID_BITS-1:25*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[25]), 
		.done(done[25]) 
	);

	Channel_Accumulator CH_26 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(26+1)*`MAT_VAL_BITS-1:26*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[26]), 
		.mat_val_rd_en(mat_val_rd_en[26]), 
		.vec_val(vec_val[(26+1)*`VEC_VAL_BITS-1:26*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[26]), 
		.vec_val_rd_en(vec_val_rd_en[26]), 
		.row_id(row_id[(26+1)*`ROW_ID_BITS-1:26*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[26]), 
		.row_id_rd_en(row_id_rd_en[26]), 
		.data_out(data_out[(26+1)*`MULT_BITS-1:26*`MULT_BITS]), 
		.data_out_empty(data_out_empty[26]), 
		.addr_out(addr_out[(26+1)*`ROW_ID_BITS-1:26*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[26]), 
		.done(done[26]) 
	);

	Channel_Accumulator CH_27 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(27+1)*`MAT_VAL_BITS-1:27*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[27]), 
		.mat_val_rd_en(mat_val_rd_en[27]), 
		.vec_val(vec_val[(27+1)*`VEC_VAL_BITS-1:27*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[27]), 
		.vec_val_rd_en(vec_val_rd_en[27]), 
		.row_id(row_id[(27+1)*`ROW_ID_BITS-1:27*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[27]), 
		.row_id_rd_en(row_id_rd_en[27]), 
		.data_out(data_out[(27+1)*`MULT_BITS-1:27*`MULT_BITS]), 
		.data_out_empty(data_out_empty[27]), 
		.addr_out(addr_out[(27+1)*`ROW_ID_BITS-1:27*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[27]), 
		.done(done[27]) 
	);

	Channel_Accumulator CH_28 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(28+1)*`MAT_VAL_BITS-1:28*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[28]), 
		.mat_val_rd_en(mat_val_rd_en[28]), 
		.vec_val(vec_val[(28+1)*`VEC_VAL_BITS-1:28*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[28]), 
		.vec_val_rd_en(vec_val_rd_en[28]), 
		.row_id(row_id[(28+1)*`ROW_ID_BITS-1:28*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[28]), 
		.row_id_rd_en(row_id_rd_en[28]), 
		.data_out(data_out[(28+1)*`MULT_BITS-1:28*`MULT_BITS]), 
		.data_out_empty(data_out_empty[28]), 
		.addr_out(addr_out[(28+1)*`ROW_ID_BITS-1:28*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[28]), 
		.done(done[28]) 
	);

	Channel_Accumulator CH_29 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(29+1)*`MAT_VAL_BITS-1:29*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[29]), 
		.mat_val_rd_en(mat_val_rd_en[29]), 
		.vec_val(vec_val[(29+1)*`VEC_VAL_BITS-1:29*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[29]), 
		.vec_val_rd_en(vec_val_rd_en[29]), 
		.row_id(row_id[(29+1)*`ROW_ID_BITS-1:29*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[29]), 
		.row_id_rd_en(row_id_rd_en[29]), 
		.data_out(data_out[(29+1)*`MULT_BITS-1:29*`MULT_BITS]), 
		.data_out_empty(data_out_empty[29]), 
		.addr_out(addr_out[(29+1)*`ROW_ID_BITS-1:29*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[29]), 
		.done(done[29]) 
	);

	Channel_Accumulator CH_30 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(30+1)*`MAT_VAL_BITS-1:30*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[30]), 
		.mat_val_rd_en(mat_val_rd_en[30]), 
		.vec_val(vec_val[(30+1)*`VEC_VAL_BITS-1:30*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[30]), 
		.vec_val_rd_en(vec_val_rd_en[30]), 
		.row_id(row_id[(30+1)*`ROW_ID_BITS-1:30*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[30]), 
		.row_id_rd_en(row_id_rd_en[30]), 
		.data_out(data_out[(30+1)*`MULT_BITS-1:30*`MULT_BITS]), 
		.data_out_empty(data_out_empty[30]), 
		.addr_out(addr_out[(30+1)*`ROW_ID_BITS-1:30*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[30]), 
		.done(done[30]) 
	);

	Channel_Accumulator CH_31 ( 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.fetcher_done(fetcher_done), 
		.mat_val(mat_val[(31+1)*`MAT_VAL_BITS-1:31*`MAT_VAL_BITS]), 
		.mat_val_empty(mat_val_empty[31]), 
		.mat_val_rd_en(mat_val_rd_en[31]), 
		.vec_val(vec_val[(31+1)*`VEC_VAL_BITS-1:31*`VEC_VAL_BITS]), 
		.vec_val_empty(vec_val_empty[31]), 
		.vec_val_rd_en(vec_val_rd_en[31]), 
		.row_id(row_id[(31+1)*`ROW_ID_BITS-1:31*`ROW_ID_BITS]), 
		.row_id_empty(row_id_empty[31]), 
		.row_id_rd_en(row_id_rd_en[31]), 
		.data_out(data_out[(31+1)*`MULT_BITS-1:31*`MULT_BITS]), 
		.data_out_empty(data_out_empty[31]), 
		.addr_out(addr_out[(31+1)*`ROW_ID_BITS-1:31*`ROW_ID_BITS]),
		.out_rd_en(out_rd_en[31]), 
		.done(done[31]) 
	);
endmodule
module Channel_Accumulator(
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

	input [`ROW_ID_BITS-1:0] row_id,
	input row_id_empty,
	output row_id_rd_en,

	output [`MULT_BITS-1:0] data_out,
	output data_out_empty,
	output [`ROW_ID_BITS-1:0] addr_out,
	input out_rd_en,

	output done
	);
 
	wire mult_rd_en;
	wire mult_empty;
	wire [`MULT_BITS-1:0] mult_out;
	wire mult_done;
	
	Channel CH0(.clk(clk), 
				.rst(rst),
				.start(start),
				.fetcher_done(fetcher_done),
				.mat_val(mat_val), 
				.mat_val_empty(mat_val_empty), 
				.mat_val_rd_en(mat_val_rd_en),
				.vec_val(vec_val), 
				.vec_val_empty(vec_val_empty), 
				.vec_val_rd_en(vec_val_rd_en),
				.mult_out(mult_out),
				.mult_empty(mult_empty), 
				.mult_rd_en(mult_rd_en), 
				.done(mult_done)
	);
					
	Accumulator A0(	.clk(clk), 
					.rst(rst), 
					.start(start),
					.mult_done(mult_done),
					.row_id(row_id), 
					.row_id_empty(row_id_empty), 
					.row_id_rd_en(row_id_rd_en), 
					.mult_out(mult_out),
					.mult_empty(mult_empty), 
					.mult_rd_en(mult_rd_en), 
					.data_out(data_out),
					.data_out_empty(data_out_empty),
					.addr_out(addr_out),
					.out_rd_en(out_rd_en),
					.done(done)			
	);

endmodule
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
