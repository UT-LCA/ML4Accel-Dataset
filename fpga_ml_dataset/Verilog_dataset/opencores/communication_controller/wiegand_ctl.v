//////////////////////////////////////////////////////////////////////
////                                                              ////
////  fifos.v                                                     ////
////                                                              ////
////                                                              ////
////  This file is part of the Wiegand Protocol Controller        ////
////  http://www.opencores.org/projects/wiegand/                  ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Jeff Anderson                                          ////
////       jeaander@opencores.org                                 ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2013 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
//  Revisions at end of file
//
 
// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "wiegand_defines.v"

//pulling in data bus width from WIEGAND_defines file
`ifdef WIEGAND_WIDTH64
  `define WIEGAND_FIFODATAWIDTH 64
`elsif WIEGAND_WIDTH32
  `define WIEGAND_FIFODATAWIDTH 32
`elsif WIEGAND_WIDTH16
  `define WIEGAND_FIFODATAWIDTH 16
`else
  `define WIEGAND_FIFODATAWIDTH 8
`endif

//define depth of FIFO; pulling in depth from WIEGAND_defines
//`define WIEGAND_FIFODEPTH 16
  
//uncomment a single implementation of FIFO; pulling in implementation from WIEGAND_defines
//`define WIEGAND_CUSTOMFIFO

module fifo_wieg
( 
  clk_rd,
  clk_wr,
  d_i,
  d_o,
  rst,
  wr_en,
  rd_en,
  full,
  empty
);
  input clk_rd;
  input clk_wr;
  input [`WIEGAND_FIFODATAWIDTH-1:0] d_i;
  output [`WIEGAND_FIFODATAWIDTH-1:0] d_o;
  input rst;
  input wr_en;
  input rd_en;
  output full;
  output empty;
  
`ifdef WIEGAND_CUSTOMFIFO
  `ifdef WIEGAND_WIDTH64
    wire [7:0] full_int;
    wire [7:0] empty_int;
    assign full = |full_int;
    assign empty = |empty_int;
    custom_fifo_dp custom_fifo_dp1(clk_rd,clk_wr,d_i[63:56],d_o[63:56],rst,wr_en,rd_en,full_int[0],empty_int[0]);
    custom_fifo_dp custom_fifo_dp2(clk_rd,clk_wr,d_i[55:48],d_o[55:48],rst,wr_en,rd_en,full_int[1],empty_int[1]);
    custom_fifo_dp custom_fifo_dp3(clk_rd,clk_wr,d_i[47:40],d_o[47:40],rst,wr_en,rd_en,full_int[2],empty_int[2]);
    custom_fifo_dp custom_fifo_dp4(clk_rd,clk_wr,d_i[39:32],d_o[39:32],rst,wr_en,rd_en,full_int[3],empty_int[3]);
    custom_fifo_dp custom_fifo_dp5(clk_rd,clk_wr,d_i[31:24],d_o[31:24],rst,wr_en,rd_en,full_int[4],empty_int[4]);
    custom_fifo_dp custom_fifo_dp6(clk_rd,clk_wr,d_i[23:16],d_o[23:16],rst,wr_en,rd_en,full_int[5],empty_int[5]);
    custom_fifo_dp custom_fifo_dp7(clk_rd,clk_wr,d_i[15:8],d_o[15:8],rst,wr_en,rd_en,full_int[6],empty_int[6]);
    custom_fifo_dp custom_fifo_dp8(clk_rd,clk_wr,d_i[7:0],d_o[7:0],rst,wr_en,rd_en,full_int[7],empty_int[7]);
  `elsif WIEGAND_WIDTH32
    wire [3:0] full_int;
    wire [3:0] empty_int;
    assign full = |full_int;
    assign empty = |empty_int;
    custom_fifo_dp custom_fifo_dp5(clk_rd,clk_wr,d_i[31:24],d_o[31:24],rst,wr_en,rd_en,full_int[0],empty_int[0]);
    custom_fifo_dp custom_fifo_dp6(clk_rd,clk_wr,d_i[23:16],d_o[23:16],rst,wr_en,rd_en,full_int[1],empty_int[1]);
    custom_fifo_dp custom_fifo_dp7(clk_rd,clk_wr,d_i[15:8],d_o[15:8],rst,wr_en,rd_en,full_int[2],empty_int[2]);
    custom_fifo_dp custom_fifo_dp8(clk_rd,clk_wr,d_i[7:0],d_o[7:0],rst,wr_en,rd_en,full_int[3],empty_int[3]);
  `elsif WIEGAND_WIDTH16
    wire [1:0] full_int;
    wire [1:0] empty_int;
    assign full = |full_int;
    assign empty = |empty_int;
    custom_fifo_dp custom_fifo_dp7(clk_rd,clk_wr,d_i[15:8],d_o[15:8],rst,wr_en,rd_en,full_int[0],empty_int[0]);
    custom_fifo_dp custom_fifo_dp8(clk_rd,clk_wr,d_i[7:0],d_o[7:0],rst,wr_en,rd_en,full_int[1],empty_int[1]);
  `else
    custom_fifo_dp custom_fifo_dp8(clk_rd,clk_wr,d_i[7:0],d_o[7:0],rst,wr_en,rd_en,full,empty);
  `endif
`endif 
 
endmodule

module custom_fifo_dp (
  clk_rd,
  clk_wr,
  d_i,
  d_o,
  rst,
  wr_en,
  rd_en,
  full,
  empty
);
  input clk_rd;
  input clk_wr;
  input [7:0] d_i;
  output [7:0] d_o;
  input rst;
  input wr_en;
  input rd_en;
  output full;
  output empty;
  
  reg [`WIEGAND_FIFODEPTH-1:0] addr_rd;
  reg [`WIEGAND_FIFODEPTH-1:0] addr_wr;
  reg [7:0] fifo_out;
  wire [7:0] mem_byte_out;
  wire [`WIEGAND_FIFODEPTH-1:0] full_int;
  
  //bytewide memory array in FIFO.  user sets depth.
  genvar c;
  generate
    for (c = 0; c < `WIEGAND_FIFODEPTH; c = c + 1) begin: mem
      mem_byte mem_byte(rst,clk_wr,d_i,mem_byte_out,addr_wr[c],addr_rd[c]);
    end
  endgenerate
  
  //read logic needed here to handle clock domain change
  assign d_o = fifo_out;
  always @(posedge clk_rd or posedge rst) begin
    if (rst)  fifo_out <= 8'h0;
    else      fifo_out <= mem_byte_out;
  end
  
  //addressing logic is simply a circular shift register that gets reset to 1
  always @(posedge clk_wr or posedge rst) begin
    if (rst)  addr_wr <= `WIEGAND_FIFODEPTH'h1;
    else if (wr_en&(~full)) begin
      addr_wr[`WIEGAND_FIFODEPTH-1:1] <= addr_wr[`WIEGAND_FIFODEPTH-2:0];
      addr_wr[0] <= addr_wr[`WIEGAND_FIFODEPTH-1];
    end
  end
  
  always @(posedge clk_rd or posedge rst) begin
    if (rst)  addr_rd <= `WIEGAND_FIFODEPTH'h1;
    else if (rd_en&(~empty)) begin
      addr_rd[`WIEGAND_FIFODEPTH-1:1] <= addr_rd[`WIEGAND_FIFODEPTH-2:0];
      addr_rd[0] <= addr_rd[`WIEGAND_FIFODEPTH-1];
    end
  end
  
  //use address logic for flags
  assign empty = (addr_wr == addr_rd);              //when read addr catches write addr, we're empty
  
  assign full = empty?1'b0:|full_int;              //if fifo isn't empty, then OR all full flag outputs
 
  assign full_int[0] = (addr_wr[`WIEGAND_FIFODEPTH-1] & addr_rd[0]);  //when we've written to entire mem, we're full
  genvar d;
  generate
    for (d = 1; d < `WIEGAND_FIFODEPTH; d = d + 1) begin: flag
      assign full_int[d] = (addr_wr[d-1] & addr_rd[d]);   //when we've written to entire mem, we're full
    end
  endgenerate
  
endmodule

module mem_byte(
  rst,
  clk,
  din,
  dout,
  wen,
  ren
);

  input rst;
  input clk;
  input[7:0] din;
  output [7:0] dout;
  input wen;
  input ren;
  
  reg[7:0] byte_reg;
  
  //just a byte-wide register with input and output enables
  assign dout = ren?byte_reg:8'bz;
  
  always @(posedge clk or posedge rst) begin
    if (rst)        byte_reg <= 8'h0;
    else if (wen)   byte_reg <= din;
  end
  
endmodule

//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: $
//`timescale 10ns/1ns
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  wb_interface.v                                              ////
////                                                              ////
////                                                              ////
////  This file is part of the Weigand Controller                 ////
////  http://www.opencores.org/projects/wiegand/                  ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Jeff Anderson                                          ////
////       jeaander@opencores.org                                 ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2013 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
//  Revisions at end of file
//

 
// synopsys translate_off
`include "timescale.v"
// synopsys translate_on

 //WB interface definitions imported from wiegand_defines
`include "wiegand_defines.v"

module wb_interface_wieg (
      // WB bus
    wb_rst_i,
    wb_clk_i,
 
    wb_stb_i,
    wb_ack_o,
    wb_addr_i,
    wb_we_i,
    wb_dat_i,
    wb_sel_i,
    wb_dat_o,
    wb_cyc_i,
    wb_cti_i,
    wb_err_o,
    wb_rty_o,
                    
    rst_o,
    dat_o,
    dat_i,
    msgLength,
    start_tx,
    p2p,
    pulsewidth,
    clk_o,
    full,
    lock_cfg_i,
    wb_wr_en,
    rst_FIFO,
    wb_rd_en
); 

//--------------------------------------
// Wish Bone Interface
// -------------------------------------      
input                       wb_rst_i;
input                       wb_clk_i;
input                       wb_stb_i;
output                      wb_ack_o;
input [`WB_ADDR_WIDTH-1:0]  wb_addr_i;
input                       wb_we_i; // 1 - Write , 0 - Read
input [`WB_WIDTH-1:0]       wb_dat_i;
input [(`WB_WIDTH/8)-1:0]   wb_sel_i; // Byte enable
output [`WB_WIDTH-1:0]      dat_o;
input [`WB_WIDTH-1:0]       dat_i;    //data to and from WB interface, but not on WB
output [`WB_WIDTH-1:0]      wb_dat_o;
input                       wb_cyc_i;
input  [2:0]                wb_cti_i;
output                      wb_err_o;
output                      wb_rty_o;
 
//----------------------------------------
// interface to Weigand control logic
//----------------------------------------
output                      rst_o;
wire                        rst;
wire                        rty_int;
wire                        err_int;

output reg [`WB_WIDTH-1:0]  pulsewidth;
output reg [`WB_WIDTH-1:0]  p2p;
output     [6:0]            msgLength;
output                      start_tx;
output                      clk_o;
input                       full;
input                       lock_cfg_i;
output                      wb_wr_en;        
output                      rst_FIFO;
output                      wb_rd_en;

wire [`WB_WIDTH-1:0]        wb_dat_rdbk;          
reg [8:0]                   size;
assign msgLength = size[6:0];
/************************  standard WB stuff  ***************************/
reg ack,err,rty;
assign wb_ack_o = ack;
assign wb_err_o = err;
assign wb_rty_o = rty;
assign rst_o = wb_rst_i;
assign rst = wb_rst_i;
assign dat_o = wb_dat_i;
assign ack_o = ack;
assign stb_o = wb_stb_i;
assign cyc_o = wb_cyc_i;
assign we_o = wb_we_i;

//ACK logic
always @(posedge wb_clk_i or posedge rst) begin
  if (rst)  ack <= 1'b0;
  else      ack <= (~|(`WIEG_ADDR_MASK & wb_addr_i) & wb_stb_i & wb_cyc_i & ~lock_cfg_i & ~err_int & ~rty_int);
end

//ERR logic if the FIFO is full
assign err_int = (~(wb_addr_i ^ `WIEGAND_ADDR) & wb_stb_i & wb_cyc_i & wb_we_i & full);
always @(posedge wb_clk_i or posedge rst) begin
  if (rst)      err <= 1'b0;
  else          err <= err_int;
end

//retry if we're in the middle of a write cycle
assign rty_int = (~|(`WIEG_ADDR_MASK & wb_addr_i) & wb_stb_i & wb_cyc_i & wb_we_i & lock_cfg_i);
always @(posedge wb_clk_i or posedge rst) begin
  if (rst) rty <= 1'b0;
  else     rty <= rty_int;
end

//pass-thru clock
assign clk_o = wb_clk_i;

/************************  configuration registers  *************************/
//defines the pulse width of the controller
always @(negedge wb_clk_i or posedge rst) begin
  if (rst)        pulsewidth <= `WB_WIDTH'hA;
  else if ((wb_addr_i == `WB_CNFG_PW) && (wb_stb_i & wb_cyc_i & wb_we_i & ~lock_cfg_i)) pulsewidth <= wb_dat_i;
end


//defines the pulse to pulse delayof the controller
always @(negedge wb_clk_i or posedge rst) begin
  if (rst)                                                                              p2p <= `WB_WIDTH'h0;
  else if ((wb_addr_i == `WB_CNFG_P2P) && (wb_stb_i & wb_cyc_i & wb_we_i & ~lock_cfg_i))  p2p <= wb_dat_i;
end

//defines the message size (in bits) and starts the message tx process (MSB)
//assign msgLength = size[6:0];
//clears TX start bit and reset bit a clock after is they asserted by WB
assign start_tx = size[7];
assign rst_FIFO = size[8];
always @(negedge wb_clk_i or posedge rst) begin
  if (rst)                                                                                  size <= 9'h0;
  else if ((wb_addr_i == `WB_CNFG_MSGSIZE) && (wb_stb_i & wb_cyc_i & wb_we_i & ~lock_cfg_i))  size <= wb_dat_i[8:0];
  else                                                                                       size <= size & 9'h7F;
end

//readback registers on valid WB read cycle
assign wb_dat_rdbk = (wb_addr_i == `WB_CNFG_MSGSIZE)? size : ((wb_addr_i == `WB_CNFG_P2P)? p2p : pulsewidth);
assign wb_dat_o = (wb_stb_i & wb_cyc_i & ~wb_we_i)? wb_dat_rdbk : `WB_WIDTH'hz;

/*******************************  DATA FIFO  ********************************************/

//fifo for TX data.
assign wb_wr_en = (wb_addr_i == `WIEGAND_ADDR) && (wb_stb_i & wb_cyc_i & wb_we_i & ~full);
assign wb_rd_en = (wb_addr_i == `WIEGAND_ADDR) && (wb_stb_i & wb_cyc_i & ~wb_we_i);
endmodule

//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: $
////////////////////////////////////////////////////////////////////////
////                                                              ////
////  wiegand_defines.v                                           ////
////                                                              ////
////                                                              ////
////  This file is part of the Wiegand Controller                 ////
////  http://www.opencores.org/projects/wiegand/                  ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Jeff Anderson                                          ////
////       jeaander@opencores.org                                 ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2013 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
//  Revisions at end of file
//
 
/**********************  WISHBONE DEFINES  ***************************/
// define the WB bus width; uncomment ONE correct width
//`define WB_WIDTH64
`define WB_WIDTH32
//`define WB_WIDTH16
//`define WB_WIDTH08


`ifdef WB_WIDTH64
  `define WB_WIDTH 64
  `define WB_DATA_W 63:0
  `define WIEGAND_WIDTH64
`elsif WB_WIDTH32
  `define WB_WIDTH 32
  `define WB_DATA_W 31:0
  `define WIEGAND_WIDTH32
`elsif WB_WIDTH16
  `define WB_WIDTH 16
  `define WB_DATA_W 15:0
  `define WIEGAND_WIDTH16
`else
  `define WB_WIDTH 8
  `define WB_DATA_W 7:0
  `define WIEGAND_WIDTH8
`endif

//define the width of WB address
`define WB_ADDR_WIDTH 6

/*********************** WIEGAND DEFINES *****************************/
//WIEGAND_WIDTH defined above
`define WB_ADDR_WIDTH_DIV2  (`WIEGAND_ADDR)/2
//define depth of FIFO for 64-bit message format;  largest message I've seen in open literature;  64/`WB_WIDTH
`define WIEGAND_FIFODEPTH 3
  
//uncomment a single implementation of FIFO;
`define WIEGAND_CUSTOMFIFO

//set to base address of controller; base address is data FIFO, and the config registers are relative to it
`define WIEG_ADDR_MASK 6'b111100
`define WIEGAND_ADDR 6'h00

`define WB_CNFG_PW (`WIEGAND_ADDR)+1
`define WB_CNFG_P2P (`WIEGAND_ADDR)+2
`define WB_CNFG_MSGSIZE (`WIEGAND_ADDR)+3

//states in teh state machine
`define BIT  3'b111
`define LASTBIT   3'b100
`define IDLE  3'b000
`define DATA  3'b001
`define TX    3'b101
`define DONE  3'b110


//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: $
//
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  wiegand_rx_top.v                                            ////
////                                                              ////
////                                                              ////
////  This file is part of the Wiegand Protocol Controller        ////
////  Wiegand Receiver IP core                                    ////
////  http://www.opencores.org/projects/wiegand/                  ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Jeff Anderson                                          ////
////       jeaander@opencores.org                                 ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2014 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//// The wiegand protocol is maintained by                        ////
//// This product has been tested to interoperate with certified  ////
//// devices, but has not been certified itself.  This product    ////
//// should be certified through prior to claiming strict         ////
//// adherence to the standard.                                   ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
//  Revisions at end of file
//


// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "wiegand_defines.v"

module wiegand_rx_top(
  one_i,
  zero_i,

  wb_clk_i,
  wb_rst_i,
  wb_dat_i,
  wb_dat_o,
  wb_cyc_i,
  wb_stb_i,
  wb_cti_i,
  wb_sel_i,
  wb_we_i,
  wb_adr_i,
  wb_ack_o,
  wb_err_o,
  wb_rty_o
);
  //to PHY layer
  input one_i;
  input zero_i;
  
  //wishbone interface
  input                       wb_clk_i;
  input                       wb_rst_i;
  input  [`WB_WIDTH-1:0]      wb_dat_i;
  output [`WB_WIDTH-1:0]      wb_dat_o;
  input                       wb_cyc_i;
  input                       wb_stb_i;
  input                       wb_we_i;
  input [(`WB_WIDTH/8)-1:0]   wb_sel_i;
  input [2:0]                 wb_cti_i;
  input  [`WB_ADDR_WIDTH-1:0] wb_adr_i;
  output                      wb_ack_o;
  output                      wb_err_o;
  output                      wb_rty_o;
  
  //intermediate signals
wire                          rst;
reg [`WB_WIDTH:0]             data;

wire [`WB_WIDTH-1:0]          dat_i;
wire [`WB_WIDTH-1:0]          dat_o;
wire [`WB_WIDTH-1:0]          data_o;
wire [`WB_WIDTH-1:0]      pulsewidth;
wire [`WB_WIDTH-1:0]      p2p;
reg  [(`WB_ADDR_WIDTH/2)-1:0] sampleCnt;
wire [6:0]                    msgLength;
reg [`WB_ADDR_WIDTH-1:0]      word_in;
reg [`WB_ADDR_WIDTH-1:0]      fifo_out;
reg [1:0]                     zero_edge, one_edge;
reg [1:0]                     zero_det, one_det;
wire                          clk;
reg                           lock_cfg;
reg [3:0]                     filter1;
reg [3:0]                     filter0;
reg [1:0]                     filterCnt;
reg                           sampleTime;
reg                           filterEn;
reg [5:0]                     bitCount,tpiCnt;
wire                          start_tx;
wire [5:0]                    tpi;
wire                          errorClr;
reg                           msgDone, msgError,msgDoneDly;

  /***************************** RX logic **********************************************************/
  //negedge detectors for each line
  assign zero = ~zero_det[0] & zero_det[1];
  always @(posedge clk or posedge rst) begin
    if (rst)  zero_det <= 2'b11;
    else      zero_det <= {zero_det[0],zero_i};
  end
  
  assign one = ~one_det[0] & one_det[1];
  always @(posedge clk or posedge rst) begin
    if (rst)  one_det <= 2'b11;
    else      one_det <= {one_det[0],one_i};
  end
  
  //posedge detectors for each line
  assign notzero = zero_det[0] & ~zero_det[1];  
  assign notone = one_det[0] & ~one_det[1];
  
  //@ negedge, filter for noise on teh line; filtering for noise by taking samples during the PW
  //starting the sampling at halfway through teh pulse to ensure dampening occurs before sample
  assign filtered1 = (~|filter1) & ~one_det[1];
  assign filtered0 = (~|filter0) & ~zero_det[1];
  always @(posedge clk or posedge rst) begin
    if (rst)  begin
      filter1 <= 4'h0;
      filter0 <= 4'h0;
      filterCnt <= 2'h0;
    end
    else if (sampleTime)   begin
      filter1 <= {filter1[2:0],one_det[0]};
      filter0 <= {filter0[2:0],zero_det[0]};
      filterCnt <= filterCnt+1;
    end
  end
  
  always @(posedge clk or posedge rst) begin
    if (rst)            sampleCnt <= 3'h0;
    else if (filterEn)  sampleCnt <= sampleCnt+1;
  end
  
  always @(posedge clk or posedge rst) begin
    if (rst)                                  sampleTime <= 1'b0;
    else  sampleTime <= ((sampleCnt == {pulsewidth[2:0]}) || (sampleCnt == {1'h0,pulsewidth[2:1]}) || (sampleCnt == {2'h0,pulsewidth[2]}));
  end 
  
  always @(negedge clk or posedge rst) begin
    if (rst)                    filterEn <= 1'b0;
    else if (one | zero)        filterEn <= 1'b1;
    else if (filterCnt == 2'h3) filterEn <= 1'b0;  
  end
  
  //then write bit to appropriate data register sub-bit; increment counter
  always @(negedge clk or posedge rst) begin
    if (rst)                        word_in <= 32'h0;
    else if (filtered1 | filtered0) word_in <= {word_in[30:0],filtered1};
  end
  
  always @(negedge clk or posedge rst) begin
    if (rst)                        bitCount <= 6'h0;
    else if (filtered1 | filtered0) bitCount <= bitCount+1;
    else if (msgDoneDly)            bitCount <= 6'h0;
  end
  
  //when linesa re not being driven, check to see that tpi is not exceeded;
  //exceeded tpi means data transfer is done, and packet length should be checked
  assign tpi = p2p[5:0];
  always @(negedge clk or posedge rst) begin
    if (rst)                                tpiCnt <= 6'h0;
    else if (~|{notzero,notone,zero,one})   tpiCnt <= tpiCnt+1;
    else                                    tpiCnt <= 6'h0;
  end
  
  always @(posedge clk or posedge rst) begin
    if (rst)  msgDone <= 1'b0;
    else      msgDone <= ~|(tpiCnt ^ tpi);
  end
  
  always @(posedge clk or posedge rst) begin
    if (rst)  msgDoneDly <= 1'b0;
    else      msgDoneDly <= msgDone;
  end
  
  //configuration is locked at start_tx/start_rx until a message error is found
  always @(posedge clk or posedge rst) begin
    if (rst)            lock_cfg <= 1'b0;
    else if (start_tx)  lock_cfg <= 1'b1;
    else if (msgError)  lock_cfg <= 1'b0;
  end 
  
  //if rx msglength does not match expected msglength, then flag an error
  assign errorClr = p2p[6];
  always @(negedge clk or posedge rst) begin
    if (rst)            msgError <= 1'b0;
    else if (errorClr)  msgError <= 1'b0;
    else                msgError <= msgDone & |(bitCount ^ msgLength);
  end

  
  /***************************** input FIFO *******************************************************/
  fifo_wieg datafifowrite(~clk,~clk,dat_i,data_o,(rst | rst_FIFO),wr_en,rd_en,full,empty);
  
  always @(posedge clk or posedge rst) begin
    if (rst)        fifo_out <= `WB_WIDTH'h0;
    else if (rd_en) fifo_out <= data_o;
  end
  
  
  
  /***************************** WB interface *******************************************************/
  assign dat_i = fifo_out;
  wb_interface_wieg wb_interface(wb_rst_i,wb_clk_i,wb_stb_i,wb_ack_o,wb_adr_i,wb_we_i,wb_dat_i,wb_sel_i,
                              wb_dat_o,wb_cyc_i,wb_cti_i,wb_err_o,wb_rty_o,rst,dat_o,dat_i,msgLength,start_tx,
                              p2p,pulsewidth,clk,full_dly,lock_cfg,wb_wr_en,rst_FIFO,rd_en); 

endmodule

////////////////////////////////////////////////////////////////////
// CVS Revision History
//
// $Log:  $
////////////////////////////////////////////////////////////////////////
////                                                              ////
////  wiegand_tx_top.v                                            ////
////                                                              ////
////                                                              ////
////  This file is part of the Wiegand Protocol Controller        ////
////  Wiegand Transmitter IP core                                 ////
////  http://www.opencores.org/projects/wiegand/                  ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////       Jeff Anderson                                          ////
////       jeaander@opencores.org                                 ////
////                                                              ////
////                                                              ////
////  All additional information is available in the README.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2014 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
//  Revisions at end of file
//


// synopsys translate_off
`include "timescale.v"
// synopsys translate_on
`include "wiegand_defines.v"

module wiegand_tx_top(
  
  one_o,
  zero_o,

  wb_clk_i,
  wb_rst_i,
  wb_dat_i,
  wb_dat_o,
  wb_cyc_i,
  wb_stb_i,
  wb_cti_i,
  wb_sel_i,
  wb_we_i,
  wb_adr_i,
  wb_ack_o,
  wb_err_o,
  wb_rty_o
);
  //to PHY layer
  output reg one_o;
  output reg zero_o;
  
  //wishbone interface
  input                       wb_clk_i;
  input                       wb_rst_i;
  input  [`WB_WIDTH-1:0]      wb_dat_i;
  output [`WB_WIDTH-1:0]      wb_dat_o;
  input                       wb_cyc_i;
  input                       wb_stb_i;
  input [(`WB_WIDTH/8)-1:0]   wb_sel_i;
  input [2:0]                 wb_cti_i;
  input                       wb_we_i;
  input  [`WB_ADDR_WIDTH-1:0] wb_adr_i;
  output                      wb_ack_o;
  output                      wb_err_o;
  output                      wb_rty_o;
  
  //intermediate signals
wire                      rst;
reg                       idle;

wire [`WB_WIDTH-1:0]      dat_o;
wire [`WB_WIDTH-1:0]      dat_i;
wire [`WB_WIDTH-1:0]      pulsewidth;
wire [`WB_WIDTH-1:0]      p2p;
reg [4:0]                 p2pCnt;
wire [6:0]                msgLength;
reg [31:0]                word_out;
reg [2:0]                 state, next_state;
wire                      clk;
reg                       lock_cfg;
reg                       full_dly;
wire                      full;
reg                       bit, tx, data, done;
reg [`WB_WIDTH-1:0]       pulseCnt;
reg [6:0]                 bitCount, bitCountReg;
wire                      start_tx;
wire [`WB_WIDTH-1:0]      data_o;
wire                      rst_FIFO;
 
  /***************************** TX logic *********************************************************/
  //output registers clocked directly from the state machine
  always @(negedge clk or posedge rst) begin
    if (rst)  begin  
      one_o <= 1'b1;
      zero_o <= 1'b1;
    end
    else if (bit) begin
      if (word_out[31])
        one_o <= 1'b0;
      else
        zero_o <= 1'b0;
    end
    else begin
      one_o <= 1'b1;
      zero_o <= 1'b1;
    end
  end
  
  //counters enabled by state machine for programmable wiegand timing
  
  //pulse to pulse timing
  always @(negedge clk or posedge rst) begin
    if (rst)      p2pCnt <= 5'h0;
    else if (tx)  p2pCnt <= p2pCnt+1;
    else          p2pCnt <= 5'h0;
  end
  
  //pulse width timer
  always @(negedge clk or posedge rst) begin
    if (rst)                pulseCnt <= 5'h0;
    else if (bit)           pulseCnt <= pulseCnt+1;
    else                    pulseCnt <= 5'h0;
  end
  
  //message bit counter
  always @(negedge clk or posedge rst) begin
    if (rst)              bitCount <= 7'h0;
    else if (done)        bitCount <= bitCount+1;
    else if (idle)        bitCount <= 7'h0;
  end  
  
  always @(negedge clk or posedge rst) begin
    if (rst)              bitCountReg <= 7'h0;
    else if (done)        bitCountReg <= bitCountReg+1;
    else if (data)        bitCountReg <= 7'h0;
  end  
  
  //main state machine for transmitter
  always @(posedge clk or posedge rst) begin
    if (rst)  state <= `IDLE;
    else      state <= next_state;
  end
  
  always @ (*) begin
    next_state = `IDLE;
    bit = 1'b0;
    tx = 1'b0;
    data = 1'b0;
    done = 1'b0;
    idle = 1'b0;
    case (state)
      `IDLE: begin
        idle = 1'b1;
        if (start_tx) next_state = `DATA;
        else          next_state = `IDLE;
      end
      `DATA: begin
        data = 1'b1;
        next_state = `TX;
      end
      `TX: begin
        tx = 1'b1;
        if (bitCountReg == 6'h20)
          next_state = `DATA;
        else if (p2pCnt == p2p) begin     
          if (bitCount == msgLength) 
            next_state = `LASTBIT;
          else 
            next_state = `BIT;
        end
        else  next_state = `TX;
      end
      `BIT: begin
        bit = 1'b1;
        if (pulseCnt == pulsewidth) next_state = `DONE;
        else                        next_state = `BIT;
      end
      `LASTBIT: begin
        bit = 1'b1;
        if (pulseCnt == pulsewidth) next_state = `IDLE;
        else                        next_state = `LASTBIT;
      end
      `DONE: begin
        done = 1'b1;
        next_state = `TX;
      end
    endcase
  end
  
  //dont want config being changed during a write cycle
  always @(negedge clk or posedge rst) begin
    if (rst)      lock_cfg <= 1'b0;
    else          lock_cfg <= tx | done | bit | data;
  end
  
  /***************************** output FIFO *******************************************************/
  always @(posedge clk or posedge rst) begin
    if (rst)        word_out <= 32'h0;
    else if (data)  word_out <= data_o;
    else if (done)  word_out <= {word_out[30:0],1'b0};
  end
  
  always @(posedge clk or posedge rst) begin
    if (rst)    full_dly <= 1'b0;
    else        full_dly <= full;
  end
  
  fifo_wieg datafifowrite(~clk,~clk,dat_o,data_o,(rst | rst_FIFO),(~lock_cfg & wb_wr_en),data,full,empty);

  
  /***************************** WB interface *******************************************************/
  assign dat_i = data_o;
  wb_interface_wieg wb_interface(wb_rst_i,wb_clk_i,wb_stb_i,wb_ack_o,wb_adr_i,wb_we_i,wb_dat_i,wb_sel_i,
                              wb_dat_o,wb_cyc_i,wb_cti_i,wb_err_o,wb_rty_o,rst,dat_o,dat_i,msgLength,start_tx,
                              p2p,pulsewidth,clk,full_dly,lock_cfg,wb_wr_en,rst_FIFO,rd_en); 
 
  
endmodule

////////////////////////////////////////////////////////////////////
// CVS Revision History
//
// $Log:  $
//