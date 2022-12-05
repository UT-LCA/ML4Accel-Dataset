`define  n 32
`define max_size 30
`define SIMULATION_MEMORY
//`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset
 `define dwa  60
`define awa  6
//`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset
 `define dwb  32
`define awb  2
//`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset
 `define dwc  61
`define awc 3

module SizedFIFO_b  (CLK, D_IN,ENQ,DEQ,CLR,D_OUT,FULL_N,EMPTY_N);


input CLK;
input [31:0] D_IN;
input ENQ;
input DEQ;
input	CLR;
output [31:0]	D_OUT;
output	FULL_N;
output	EMPTY_N;
		



wire full;
wire empty;
wire full_n;
wire empty_n;
wire full_n_r;
wire empty_n_r;
wire [1:0] level;

wire always_one;
wire always_zero;

assign always_one = 1'b1;
assign always_zero = 1'b0;

generic_fifo_sc_b fifo_1
(.clk(CLK),
 .rst(CLR),
 .clr (CLR),
 .din (D_IN),
 .we (ENQ),
 .dout (D_OUT),
 .re (DEQ),
 .full(full),
 .empty(empty),
 .full_n(full_n),
 .empty_n(empty_n),
 .full_r (FULL_N),
 .empty_r(EMPTY_N),
 .full_n_r (full_n_r),
 .empty_n_r (empty_n_r),
 .level(level)
 );
 







endmodule
module generic_fifo_sc_b(clk, rst, clr, din, we, dout, re,
			 full, empty,
             full_n, empty_n,
             full_r, empty_r,
			 full_n_r, empty_n_r,
             level);
 /*
parameter dw=8;
parameter aw=8;
parameter n=32;
parameter max_size = 1<<aw;
 */
input			clk, rst, clr;
input	[`dwb-1:0]	din;
input			we;
output	[`dwb-1:0]	dout;
input			re;
output			full, full_r;
output			empty, empty_r;
output			full_n, full_n_r;
output			empty_n, empty_n_r;
output	[1:0]		level;
 
////////////////////////////////////////////////////////////////////
//
// Local Wires
//
 
reg	[`awb-1:0]	wp;
wire	[`awb-1:0]	wp_pl1;
wire	[`awb-1:0]	wp_pl2;
reg	[`awb-1:0]	rp;
wire	[`awb-1:0]	rp_pl1;
reg			full_r;
reg			empty_r;
reg			gb;
reg			gb2;
reg	[`awb:0]		cnt;
wire			full_n, empty_n;
reg			full_n_r, empty_n_r;
 
////////////////////////////////////////////////////////////////////
//
// Memory Block
//
 wire always_zero;
 assign always_zero = 1'b0;
 wire [`dwb-1:0] junk_out;
 
 wire [`dwb-1:0] junk_in;
 
 // manually assign
 assign junk_in = 34'b0000000000000000000000000000000000;

defparam ram1.ADDR_WIDTH = `awb;
defparam ram1.DATA_WIDTH = `dwb;
dual_port_ram   ram1(
	.clk(		clk		),
	.addr1(		rp		),
	.addr2(		wp		),
	.we1(		we		),
	.we2(		always_zero		),
	.out1(		dout		),
	.out2(		junk_out		),
	.data1(		din		),
	.data2 (	junk_in)
	);
 
////////////////////////////////////////////////////////////////////
//
// Misc Logic
//
 
always @(posedge clk )
	if(!rst)	wp <=  {2'b00};
	else
	if(clr)		wp <=  {2'b00};
	else
	if(we)		wp <=  wp_pl1;
 
assign wp_pl1 = wp + { {1'b0}, 1'b1};
assign wp_pl2 = wp + {  2'b10};
 
always @(posedge clk )
	if(!rst)	rp <=  {2'b00};
	else
	if(clr)		rp <=  {2'b00};
	else
	if(re)		rp <=  rp_pl1;
 
assign rp_pl1 = rp + { {1'b0}, 1'b1};
 
////////////////////////////////////////////////////////////////////
//
// Combinatorial Full & Empty Flags
//
 
assign empty = ((wp == rp) & !gb);
assign full  = ((wp == rp) &  gb);
 
// Guard Bit ...
always @(posedge clk )
	if(!rst)			gb <=  1'b0;
	else
	if(clr)				gb <=  1'b0;
	else
	if((wp_pl1 == rp) & we)		gb <=  1'b1;
	else
	if(re)				gb <=  1'b0;
 
////////////////////////////////////////////////////////////////////
//
// Registered Full & Empty Flags
//
 
// Guard Bit ...
always @(posedge clk )
	if(!rst)			gb2 <=  1'b0;
	else
	if(clr)				gb2 <=  1'b0;
	else
	if((wp_pl2 == rp) & we)		gb2 <=  1'b1;
	else
	if((wp != rp) & re)		gb2 <=  1'b0;
 
always @(posedge clk )
	if(!rst)				full_r <=  1'b0;
	else
	if(clr)					full_r <=  1'b0;
	else
	if(we & ((wp_pl1 == rp) & gb2) & !re)	full_r <=  1'b1;
	else
	if(re & ((wp_pl1 != rp) | !gb2) & !we)	full_r <=  1'b0;
 
always @(posedge clk )
	if(!rst)				empty_r <=  1'b1;
	else
	if(clr)					empty_r <=  1'b1;
	else
	if(we & ((wp != rp_pl1) | gb2) & !re)	empty_r <=  1'b0;
	else
	if(re & ((wp == rp_pl1) & !gb2) & !we)	empty_r <=  1'b1;
 
////////////////////////////////////////////////////////////////////
//
// Combinatorial Full_n & Empty_n Flags
//
 
assign empty_n = cnt < `n;
assign full_n  = !(cnt < (`max_size-`n+1));
assign level = {{cnt[`awb]}, {cnt[`awb]}} | cnt[`awb-1:`awb-2];
 
// N entries status
always @(posedge clk )
	if(!rst)	cnt <=  {2'b00};
	else
	if(clr)		cnt <=  {2'b00};
	else
	if( re & !we)	cnt <=  cnt + { 3'b111};
	else
	if(!re &  we)	cnt <=  cnt + { {2'b00}, 1'b1};
 
////////////////////////////////////////////////////////////////////
//
// Registered Full_n & Empty_n Flags
//
 
always @(posedge clk )
	if(!rst)				empty_n_r <=  1'b1;
	else
	if(clr)					empty_n_r <=  1'b1;
	else
	if(we & (cnt >= (`n-1) ) & !re)		empty_n_r <=  1'b0;
	else
	if(re & (cnt <= `n ) & !we)		empty_n_r <=  1'b1;
 
always @(posedge clk )
	if(!rst)				full_n_r <=  1'b0;
	else
	if(clr)					full_n_r <=  1'b0;
	else
	if(we & (cnt >= (`max_size-`n) ) & !re)	full_n_r <=  1'b1;
	else
	if(re & (cnt <= (`max_size-`n+1)) & !we)	full_n_r <=  1'b0;

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



