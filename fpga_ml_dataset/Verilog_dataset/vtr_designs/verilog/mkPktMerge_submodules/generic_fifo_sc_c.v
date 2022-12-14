`define SIMULATION_MEMORY
//`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset
`define dw 153
`define  aw 4
`define  n 32
`define max_size 30
//`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset
//`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset

module generic_fifo_sc_c(clk, rst, clr, din, we, dout, re,
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
input	[`dw-1:0]	din;
input			we;
output	[`dw-1:0]	dout;
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
 
reg	[`aw-1:0]	wp;
wire	[`aw-1:0]	wp_pl1;
wire	[`aw-1:0]	wp_pl2;
reg	[`aw-1:0]	rp;
wire	[`aw-1:0]	rp_pl1;
reg			full_r;
reg			empty_r;
reg			gb;
reg			gb2;
reg	[`aw:0]		cnt;
wire			full_n, empty_n;
reg			full_n_r, empty_n_r;
 
////////////////////////////////////////////////////////////////////
//
// Memory Block
//
 wire always_zero;
 assign always_zero = 1'b0;
 wire [`dw-1:0] junk_out;
 
 wire [`dw-1:0] junk_in;
 
 // manually assign
 assign junk_in = 0;

defparam ram1.ADDR_WIDTH = `aw;
defparam ram1.DATA_WIDTH = `dw;
dual_port_ram   ram1(
	.clk(		clk		),
	.addr1(		rp		),
	.addr2(		wp		),
	.we1(		we		),
	.we2(		always_zero		),
	.out1(		doutz		),
	.out2(		junk_out		),
	.data1(		din		),
	.data2 (	junk_in)
	);
 
 wire [`dw-1:0] doutz;
assign dout = (1'b1) ? doutz: junk_out;

////////////////////////////////////////////////////////////////////
//
// Misc Logic
//
 
always @(posedge clk )
begin
	if(!rst)	wp <=  {4'b0000};
	else
	if(clr)		wp <=  {4'b0000};
	else
	if(we)		wp <=  wp_pl1;
 end
assign wp_pl1 = wp + { {3'b000}, 1'b1};
assign wp_pl2 = wp + { {2'b00}, 2'b10};
 
always @(posedge clk )
begin
	if(!rst)	rp <=  {4'b0000};
	else
	if(clr)		rp <=  {4'b0000};
	else
	if(re)		rp <=  rp_pl1;
 end
assign rp_pl1 = rp + { {3'b000}, 1'b1};
 
////////////////////////////////////////////////////////////////////
//
// Combinatorial Full & Empty Flags
//
 
assign empty = ((wp == rp) && !gb);
assign full  = ((wp == rp) &&  gb);
 
// Guard Bit ...
always @(posedge clk )
begin
	if(!rst)			gb <=  1'b0;
	else
	if(clr)				gb <=  1'b0;
	else
	if((wp_pl1 == rp) && we)		gb <=  1'b1;
	else
	if(re)				gb <=  1'b0;
 end
////////////////////////////////////////////////////////////////////
//
// Registered Full & Empty Flags
//
 
// Guard Bit ...
always @(posedge clk )
begin
	if(!rst)			gb2 <=  1'b0;
	else
	if(clr)				gb2 <=  1'b0;
	else
	if((wp_pl2 == rp) && we)		gb2 <=  1'b1;
	else
	if((wp != rp) && re)		gb2 <=  1'b0;
 end
always @(posedge clk )
begin
	if(!rst)				full_r <=  1'b0;
	else
	if(clr)					full_r <=  1'b0;
	else
	if(we && ((wp_pl1 == rp) && gb2) && !re)	full_r <=  1'b1;
	else
	if(re && ((wp_pl1 != rp) | !gb2) && !we)	full_r <=  1'b0;
 end
always @(posedge clk )
begin
	if(!rst)				empty_r <=  1'b1;
	else
	if(clr)					empty_r <=  1'b1;
	else
	if(we && ((wp != rp_pl1) | gb2) && !re)	empty_r <=  1'b0;
	else
	if(re && ((wp == rp_pl1) && !gb2) && !we)	empty_r <=  1'b1;
 end
////////////////////////////////////////////////////////////////////
//
// Combinatorial Full_n && Empty_n Flags
//
 
assign empty_n = cnt < `n;
assign full_n  = !(cnt < (`max_size-`n+1));
assign level = {{cnt[`aw]}, {cnt[`aw]}} | cnt[`aw-1:`aw-2];
 
// N entries status
always @(posedge clk )
begin
	if(!rst)	cnt <=  {4'b0000};
	else
	if(clr)		cnt <=  {4'b0000};
	else
	if( re && !we)	cnt <=  cnt + { 5'b11111};
	else
	if(!re &&  we)	cnt <=  cnt + { {4'b0000}, 1'b1};
 end
////////////////////////////////////////////////////////////////////
//
// Registered Full_n && Empty_n Flags
//
 
always @(posedge clk )
begin
	if(!rst)				empty_n_r <=  1'b1;
	else
	if(clr)					empty_n_r <=  1'b1;
	else
	if(we && (cnt >= (`n-1) ) && !re)		empty_n_r <=  1'b0;
	else
	if(re && (cnt <= `n ) && !we)		empty_n_r <=  1'b1;
 end
always @(posedge clk )
begin
	if(!rst)				full_n_r <=  1'b0;
	else
	if(clr)					full_n_r <=  1'b0;
	else
	if(we && (cnt >= (`max_size-`n) ) && !re)	full_n_r <=  1'b1;
	else
	if(re && (cnt <= (`max_size-`n+1)) && !we)	full_n_r <=  1'b0;
end
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
