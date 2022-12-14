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
