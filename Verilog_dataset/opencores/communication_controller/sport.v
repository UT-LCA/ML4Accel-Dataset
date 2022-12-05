//////////////////////////////////////////////////////////////////////
////                                                              ////
////  fifos.v                                                     ////
////                                                              ////
////                                                              ////
////  This file is part of the SPORT Protocol Controller        ////
////  http://www.opencores.org/projects/SPORT/                  ////
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
`include "SPORT_defines.v"

//pulling in data bus width from SPORT_defines file

  `define SPORT_FIFODATAWIDTH 32

//define depth of FIFO; pulling in depth from SPORT_defines
//`define SPORT_FIFODEPTH 16
  
//uncomment a single implementation of FIFO; pulling in implementation from SPORT_defines
//`define SPORT_CUSTOMFIFO

module fifo_sport
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
  input [`SPORT_FIFODATAWIDTH-1:0] d_i;
  output [`SPORT_FIFODATAWIDTH-1:0] d_o;
  input rst;
  input wr_en;
  input rd_en;
  output full;
  output empty;
  
`ifdef SPORT_CUSTOMFIFO
  `ifdef SPORT_WIDTH64
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
  `elsif SPORT_WIDTH32
    wire [3:0] full_int;
    wire [3:0] empty_int;
    assign full = |full_int;
    assign empty = |empty_int;
    custom_fifo_dp custom_fifo_dp5(clk_rd,clk_wr,d_i[31:24],d_o[31:24],rst,wr_en,rd_en,full_int[0],empty_int[0]);
    custom_fifo_dp custom_fifo_dp6(clk_rd,clk_wr,d_i[23:16],d_o[23:16],rst,wr_en,rd_en,full_int[1],empty_int[1]);
    custom_fifo_dp custom_fifo_dp7(clk_rd,clk_wr,d_i[15:8],d_o[15:8],rst,wr_en,rd_en,full_int[2],empty_int[2]);
    custom_fifo_dp custom_fifo_dp8(clk_rd,clk_wr,d_i[7:0],d_o[7:0],rst,wr_en,rd_en,full_int[3],empty_int[3]);
  `elsif SPORT_WIDTH16
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
  
  reg [`SPORT_FIFODEPTH-1:0] addr_rd;
  reg [`SPORT_FIFODEPTH-1:0] addr_wr;
  reg [7:0] fifo_out;
  wire [7:0] mem_byte_out;
  wire [`SPORT_FIFODEPTH-1:0] full_int;
  
  //bytewide memory array in FIFO.  user sets depth.
  genvar c;
  generate
    for (c = 0; c < `SPORT_FIFODEPTH; c = c + 1) begin: mem
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
    if (rst)  addr_wr <= `SPORT_FIFODEPTH'h1;
    else if (wr_en&(~full)) begin
      addr_wr[`SPORT_FIFODEPTH-1:1] <= addr_wr[`SPORT_FIFODEPTH-2:0];
      addr_wr[0] <= addr_wr[`SPORT_FIFODEPTH-1];
    end
  end
  
  always @(posedge clk_rd or posedge rst) begin
    if (rst)  addr_rd <= `SPORT_FIFODEPTH'h1;
    else if (rd_en&(~empty)) begin
      addr_rd[`SPORT_FIFODEPTH-1:1] <= addr_rd[`SPORT_FIFODEPTH-2:0];
      addr_rd[0] <= addr_rd[`SPORT_FIFODEPTH-1];
    end
  end
  
  //use address logic for flags
  assign empty = (addr_wr == addr_rd);              //when read addr catches write addr, we're empty
  
  assign full = empty?1'b0:|full_int;              //if fifo isn't empty, then OR all full flag outputs
 
  assign full_int[0] = (addr_wr[`SPORT_FIFODEPTH-1] & addr_rd[0]);  //when we've written to entire mem, we're full
  genvar d;
  generate
    for (d = 1; d < `SPORT_FIFODEPTH; d = d + 1) begin: flag
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
////////////////////////////////////////////////////////////////////////
////                                                              ////
////  SPORT_defines.v                                           ////
////                                                              ////
////                                                              ////
////  This file is part of the SPORT Controller                 ////
////  http://www.opencores.org/projects/SPORT/                  ////
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



  `define WB_WIDTH 32
  `define SPORT_WIDTH32

//define the width of WB address
`define WB_ADDR_WIDTH 6

/*********************** SPORT DEFINES *****************************/
//SPORT_WIDTH defined above

//define depth of FIFO 
`define SPORT_FIFODEPTH 10
  
//uncomment a single implementation of FIFO;
`define SPORT_CUSTOMFIFO
//`define SPORT_XILINX
//`define SPORT_ALTERA

//set to base address of controller; base address is data FIFO, and the config registers are relative to it
`define SPORT_ADDR 6'h01
`define SPORT_ADDR_MASK 6'h20

`define WB_CNFG_RX `SPORT_ADDR+1
`define WB_CNFG_TX `SPORT_ADDR+2

`define RESET 3'h0
`define IDLE  3'h1
`define FS    3'h3
`define RX    3'h2
`define TX    3'h2
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: $
//
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  sport_top.v                                                 ////
////                                                              ////
////                                                              ////
////  This file is part of the SPORT controller                   ////
////  http://www.opencores.org/projects/sport/                    ////
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
//// The SPORT protocol is maintained by Analog Devices, Inc      ////
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
`include "sport_defines.v"

module sport_top(
  
  DTxPRI,
  DTxSEC,
  TSCLKx,
  TFSx,
  DRxPRI,
  DRxSEC,
  RSCLKx,
  RFSx,
  
  rx_int,
  rxclk,
  txclk,

  wb_clk_i,
  wb_rst_i,
  wb_dat_i,
  wb_dat_o,
  wb_cyc_i,
  wb_stb_i,
  wb_we_i,
  wb_adr_i,
  wb_ack_o,
  wb_err_o,
  wb_rty_o
);
  //to PHY layer
  output DTxPRI;
  output DTxSEC;
  output TSCLKx;
  output TFSx;
  input DRxPRI;
  input DRxSEC;
  output RSCLKx;
  output RFSx;
  
  //wishbone interface
  input                       wb_clk_i;
  input                       wb_rst_i;
  input  [`WB_WIDTH-1:0]       wb_dat_i;
  output [`WB_WIDTH-1:0]       wb_dat_o;
  input                       wb_cyc_i;
  input                       wb_stb_i;
  input                       wb_we_i;
  input  [`WB_ADDR_WIDTH-1:0]  wb_adr_i;
  output                      wb_ack_o;
  output                      wb_err_o;
  output                      wb_rty_o;
  
  //interrupt signals back to chip
  output                      rx_int;
  input                       rxclk;
  input                       txclk;
  
  //intermediate signals
wire                      rst;
reg [`WB_WIDTH:0]          data;
reg [2:0]                 state, next_state;
reg [2:0]                 rxstate, next_rxstate;
wire                      clk;
reg                       lock_cfg;

reg  [31:0]               rxPri, rxSec;

wire [4:0]                rxsampleCnt;
wire [`SPORT_FIFODEPTH-1:0]                rxpacketCnt;
wire [4:0]                txsampleCnt;
wire [`SPORT_FIFODEPTH-1:0]                txpacketCnt;
wire [31:0]                word_in;
wire [31:0]                word_out;
wire                      rxsecEn;
wire                      rxlateFS_earlyFSn;
wire                      txsecEn;
wire                      txlateFS_earlyFSn;
wire                      tx_actHi;
wire                      rx_actHi;
wire                      msbFirst;
wire                      tx_start, rx_start;

//registers for clock gating between clock domains
reg [4:0]                rxsampleCnt_rxint;
reg [`SPORT_FIFODEPTH-1:0]                rxpacketCnt_rxint;
reg [4:0]                txsampleCnt_txint;
reg [`SPORT_FIFODEPTH-1:0]                txpacketCnt_txint;
reg                      rxsecEn_rxint;
reg                      rxlateFS_earlyFSn_rxint;
reg                      txsecEn_txint;
reg                      txlateFS_earlyFSn_txint;
reg                      tx_actHi_txint;
reg                      rx_actHi_rxint;
reg                      msbFirst_txint;
reg                      tx_start_txint, rx_start_rxint;
reg [4:0]                rxsampleCnt_rx;
reg [`SPORT_FIFODEPTH-1:0]                rxpacketCnt_rx;
reg [4:0]                txsampleCnt_tx;
reg [`SPORT_FIFODEPTH-1:0]                txpacketCnt_tx;
reg                      rxsecEn_rx;
reg                      rxlateFS_earlyFSn_rx;
reg                      txsecEn_tx;
reg                      txlateFS_earlyFSn_tx;
reg                      tx_actHi_tx;
reg                      rx_actHi_rx;
reg                      msbFirst_tx;
reg                      tx_start_tx, rx_start_rx; 
reg                      rxidle;
reg                      rx;
reg                      rxFS;
reg                      txidle;
reg                      tx;
reg                      txFS; 
reg [31:0]               word_outM, word_outL;

reg                      txfs, rxfs;
wire  [31:0]             data_out;

  /***************************** RX logic **********************************************************/
  assign RSCLKx = rxclk;
  assign RFSx = rx_actHi_rxint? rxFS:~rxFS;  
  
  //main RX state machine
  always @(posedge rxclk or posedge rst) begin
    if (rst)    rxstate <= `RESET;
    else        rxstate <= next_rxstate;
  end
  
  always @(*) begin
    next_rxstate = `IDLE;
    rxidle = 1'b0;
    rx = 1'b0;
    rxfs = 1'b0;
    case (state)
      `RESET: begin next_rxstate = `IDLE; end
      `IDLE:  begin
        rxidle = 1'b1;
        if (rx_start_rxint)  next_rxstate = `FS;
        else          next_rxstate = `IDLE;
      end
      `FS: begin
        rxfs = 1'b1;
        next_rxstate = `RX;
      end
      `RX: begin
        rx = 1'b1;
        if (rxsampleCnt_rx == rxsampleCnt_rxint)         next_rxstate = `IDLE;
        else if (rxpacketCnt_rx == rxpacketCnt_rxint) next_rxstate = `FS;
        else                                next_rxstate = `RX;
      end
      default: next_rxstate = `IDLE;
    endcase
  end
  
  //input shift registers
  always @(posedge rxclk or posedge rst) begin
    if (rst) begin
      rxPri <= 32'h0;
      rxSec <= 32'h0;
    end
    else begin
      rxPri <= {rxPri[30:0],DRxPRI};
      rxSec <= {rxSec[30:0],DRxSEC};
    end
  end
  
  //counter for message length
  always @(posedge rxclk or posedge rst) begin
    if (rst)      rxsampleCnt_rx <= 5'h0;
    else if (rx)  begin
      if (rxsecEn_rxint)  rxsampleCnt_rx <= rxsampleCnt_rx+2;
      else        rxsampleCnt_rx <= rxsampleCnt_rx+1;
    end
    else          rxsampleCnt_rx <= 5'h0;
  end
  
  always @(posedge rxclk or posedge rst) begin
    if (rst)      rxpacketCnt_rx <= 5'h0;
    else if (rx)  begin
      if (rxsecEn_rxint)  rxpacketCnt_rx <= rxpacketCnt_rx+2;
      else        rxpacketCnt_rx <= rxpacketCnt_rx+1;
    end
    else          rxpacketCnt_rx <= 5'h0;
  end
  
  //framesync signal
  always @(posedge rxclk or posedge rst) begin
    if (rst)  rxFS <= 1'b0;
    else      rxFS <= rxlateFS_earlyFSn_rxint? rx : rxfs;
  end
  
  /***************************** TX logic **********************************************************/
  assign TSCLKx = txclk;
  assign TFSx = tx_actHi_txint? txFS:~txFS;
  
  //main TX state machine
  always @(posedge txclk or posedge rst) begin
    if (rst)    state <= `RESET;
    else        state <= next_state;
  end
  
  always @(*) begin
    next_state = `IDLE;
    txidle = 1'b0;
    tx = 1'b0;
    txfs = 1'b0;
    case (state)
      `RESET: begin next_state = `IDLE; end
      `IDLE:  begin
        txidle = 1'b1;
        if (tx_start_txint)  next_state = `FS;
        else          next_state = `IDLE;
      end
      `FS: begin
        txfs = 1'b1;
        next_state = `TX;
      end
      `TX: begin
        tx = 1'b1;
        if (txsampleCnt_tx == txsampleCnt_txint)         next_state = `IDLE;
        else if (txpacketCnt_tx == txpacketCnt_txint) next_state = `FS;
        else                                next_state = `TX;
      end
      default: next_state = `IDLE;
    endcase
  end
  
  //counter for message length
  always @(posedge txclk or posedge rst) begin
    if (rst)      txsampleCnt_tx <= 5'h0;
    else if (tx)  begin
      if (txsecEn_txint)  txsampleCnt_tx <= txsampleCnt_tx+2;
      else        txsampleCnt_tx <= txsampleCnt_tx+1;
    end
    else          txsampleCnt_tx <= 5'h0;
  end
  
  always @(posedge txclk or posedge rst) begin
    if (rst)      txpacketCnt_tx <= 5'h0;
    else if (tx) begin
      if (txsecEn_txint)  txpacketCnt_tx <= txpacketCnt_tx+2;
      else        txpacketCnt_tx <= txpacketCnt_tx+1;
    end
    else          txpacketCnt_tx <= 5'h0;
  end
  
  //logic for routing output data to ports
  assign DTxPRI = msbFirst? word_outM[31]:word_outL[31];
  assign DTxSEC = txsecEn_tx? (msbFirst? word_outM[16]:word_outL[16]):1'b0;
  
  //output word MSB first
  always @(posedge txclk or posedge rst) begin
    if (rst)      word_outM <= 32'h0;
    else if (tx)  word_outM <= {word_outM[30:0],1'b0};
    else if (txfs)  word_outM <= data_out;
  end
  
  //output word LSB first
  always @(posedge txclk or posedge rst) begin
    if (rst)      word_outL <= 32'h0;
    else if (tx)  word_outL <= {word_outL[30:0],1'b0};
    else if (txfs)  word_outL <= {data_out[0],data_out[1],data_out[2],data_out[3],data_out[4],data_out[5],data_out[6],data_out[7],
                                data_out[8],data_out[9],data_out[10],data_out[11],data_out[12],data_out[13],data_out[14],data_out[15],
                                data_out[16],data_out[17],data_out[18],data_out[19],data_out[20],data_out[21],data_out[22],data_out[23],
                                data_out[24],data_out[25],data_out[26],data_out[27],data_out[28],data_out[29],data_out[30],data_out[31]};
  end
  
  //framesync signal
  always @(posedge txclk or posedge rst) begin
    if (rst)  txFS <= 1'b0;
    else      txFS <= txlateFS_earlyFSn_txint? tx : txfs;
  end
  
  /***************************** input FIFO *******************************************************/

  fifo_sport datafifowrite(clk,txclk,wb_data_i,data_out,rst,wb_wr_en,wei_rd_en,fullwrite,emptywrite);
  fifo_sport datafiforead(rxclk,clk,wb_data_i,data_o,rst,wb_wr_en,wei_rd_en,fullread,emptyread);

  
  /***************************** WB interface *******************************************************/
  //gate clocks at change in clock domains
  
  always @(posedge rxclk or posedge rst) begin
    if (rst)  rxsampleCnt_rxint <= 5'h0;
    else      rxsampleCnt_rxint <= rxsampleCnt;
  end
  
  always @(posedge rxclk or posedge rst) begin
    if (rst)  rxpacketCnt_rxint <= `SPORT_FIFODEPTH'h0;
    else      rxpacketCnt_rxint <= rxpacketCnt;
  end
  
  always @(posedge txclk or posedge rst) begin
    if (rst)  txsampleCnt_txint <= 5'h0;
    else      txsampleCnt_txint <= txsampleCnt;
  end
  
  always @(posedge txclk or posedge rst) begin
    if (rst)  txpacketCnt_txint <= `SPORT_FIFODEPTH'h0;
    else      txpacketCnt_txint <= txpacketCnt;
  end

  always @(posedge rxclk or posedge rst) begin
    if (rst)  rxsecEn_rxint <= 1'b0;
    else      rxsecEn_rxint <= rxsecEn;
  end

  always @(posedge rxclk or posedge rst) begin
    if (rst)  rxlateFS_earlyFSn_rxint <= 1'b0;
    else      rxlateFS_earlyFSn_rxint <= rxlateFS_earlyFSn;
    
  end
  
  always @(posedge txclk or posedge rst) begin
    if (rst)  txlateFS_earlyFSn_txint <= 1'b0;
    else      txlateFS_earlyFSn_txint <= txlateFS_earlyFSn;
    
  end
  
  always @(posedge txclk or posedge rst) begin
    if (rst)  txsecEn_txint <= 1'b0;
    else      txsecEn_txint <= txsecEn;
  end

  always @(posedge txclk or posedge rst) begin
    if (rst)  txlateFS_earlyFSn_txint <= 1'b0;
    else      txlateFS_earlyFSn_txint <= txlateFS_earlyFSn;
  end

  always @(posedge txclk or posedge rst) begin
    if (rst)  tx_actHi_txint <= 1'b0;
    else      tx_actHi_txint <= tx_actHi;
  end

  always @(posedge rxclk or posedge rst) begin
    if (rst)  rx_actHi_rxint <= 1'b0;
    else      rx_actHi_rxint <= rx_actHi;
  end

  always @(posedge txclk or posedge rst) begin
    if (rst)  msbFirst_txint <= 1'b0;
    else      msbFirst_txint <= msbFirst;
  end

  always @(posedge txclk or posedge rst) begin
    if (rst)  tx_start_txint <= 1'b0;
    else      tx_start_txint <= tx_start;
  end
  
  always @(posedge rxclk or posedge rst) begin
    if (rst)  rx_start_rxint <= 1'b0;
    else      rx_start_rxint <= rx_start;
  end
  
  wb_interface_sport wb_interface(wb_rst_i,wb_clk_i,wb_stb_i,wb_ack_o,wb_adr_i,wb_we_i,wb_dat_i,wb_sel_i,
                              wb_dat_o,wb_cyc_i,wb_cti_i,wb_err_o,wb_rty_o,rxsampleCnt,
                              rxpacketCnt,txsampleCnt,txpacketCnt,word_in,word_out,rxsecEn,rxlateFS_earlyFSn,
                              txsecEn,txlateFS_earlyFSn,tx_actHi,rx_actHi,msbFirst,tx_start, rx_start,rx_int); 
  
endmodule

////////////////////////////////////////////////////////////////////
// CVS Revision History
//
// $Log:  $
////////////////////////////////////////////////////////////////////////
////                                                              ////
////  wb_interface.v                                              ////
////                                                              ////
////                                                              ////
////  This file is part of the SPORT Controller                   ////
////  http://www.opencores.org/projects/sport/                    ////
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
`include "sport_defines.v"

module wb_interface_sport (
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
    
    rxsampleCnt,
    rxpacketCnt,
    txsampleCnt,
    txpacketCnt,
    dat_i,
    dat_o,
    rxsecEn,
    rxlateFS_earlyFSn,
    txsecEn,
    txlateFS_earlyFSn,
    tx_actHi,
    rx_actHi,
    msbFirst,
    tx_start, 
    rx_start,
    rx_int
                    
    
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
// interface to SPORT control logic
//----------------------------------------

output [4:0]                rxsampleCnt;
output [`SPORT_FIFODEPTH-1:0]                rxpacketCnt;
output [4:0]                txsampleCnt;
output [`SPORT_FIFODEPTH-1:0]                txpacketCnt;
output                      rxsecEn;
output                      rxlateFS_earlyFSn;
output                      txsecEn;
output                      txlateFS_earlyFSn;
output                      tx_actHi;
output                      rx_actHi;
output                      msbFirst;
output                      tx_start, rx_start;
output                      rx_int;

reg [`WB_WIDTH-1:0]       rxreg;
reg [`WB_WIDTH-1:0]       txreg;
wire                      err_int;
wire                      rty_int;
wire                      full;


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
  else      ack <= (~|(`SPORT_ADDR_MASK & wb_addr_i) & wb_stb_i & wb_cyc_i & ~err_int & ~rty_int);
end

//ERR logic if the FIFO is full
assign err_int = (~(wb_addr_i ^ `SPORT_ADDR) & wb_stb_i & wb_cyc_i & wb_we_i & full);
always @(posedge wb_clk_i or posedge rst) begin
  if (rst)      err <= 1'b0;
  else          err <= err_int;
end

//retry if we're in the middle of a write cycle
assign rty_int = (~|(`SPORT_ADDR_MASK & wb_addr_i) & wb_stb_i & wb_cyc_i & wb_we_i);
always @(posedge wb_clk_i or posedge rst) begin
  if (rst) rty <= 1'b0;
  else     rty <= rty_int;
end

//pass-thru clock
assign clk_o = wb_clk_i;

/************************  configuration registers  *************************/

assign lock_cfg_rx = rxreg[`SPORT_FIFODEPTH+10];
assign lock_cfg_tx = txreg[`SPORT_FIFODEPTH+10];
assign rxsecEn = rxreg[`SPORT_FIFODEPTH+9];
assign rxlateFS_earlyFSn = rxreg[`SPORT_FIFODEPTH+8];
assign txsecEn = txreg[`SPORT_FIFODEPTH+9];
assign txlateFS_earlyFSn = txreg[`SPORT_FIFODEPTH+8];
assign tx_actHi = txreg[`SPORT_FIFODEPTH+7];
assign rx_actHi = rxreg[`SPORT_FIFODEPTH+7];
assign tx_start = txreg[`SPORT_FIFODEPTH+6];
assign msbFirst = txreg[`SPORT_FIFODEPTH+5];
assign rx_start = rxreg[`SPORT_FIFODEPTH+6];
assign rx_int = rxreg[`SPORT_FIFODEPTH+5];
assign rxsampleCnt = rxreg[`SPORT_FIFODEPTH+4:`SPORT_FIFODEPTH];
assign rxpacketCnt = rxreg[`SPORT_FIFODEPTH-1:0];
assign txsampleCnt = txreg[`SPORT_FIFODEPTH+4:`SPORT_FIFODEPTH];
assign txpacketCnt = txreg[`SPORT_FIFODEPTH-1:0];

//defines the pulse width of the controller
always @(negedge wb_clk_i or posedge rst) begin
  if (rst)        rxreg <= `WB_WIDTH'hA;
  else if ((wb_addr_i == `WB_CNFG_RX) && (wb_stb_i & wb_cyc_i & wb_we_i & ~lock_cfg_rx)) rxreg <= wb_dat_i;
end


//defines the pulse to pulse delayof the controller
always @(negedge wb_clk_i or posedge rst) begin
  if (rst)                                                                              txreg <= `WB_WIDTH'h0;
  else if ((wb_addr_i == `WB_CNFG_TX) && (wb_stb_i & wb_cyc_i & wb_we_i & ~lock_cfg_tx))  txreg <= wb_dat_i;
end

//readback registers on valid WB read cycle
assign wb_dat_rdbk = ((wb_addr_i == `WB_CNFG_RX)? rxreg : txreg);
assign wb_dat_o = (wb_stb_i & wb_cyc_i & ~wb_we_i)? wb_dat_rdbk : `WB_WIDTH'hz;

/*******************************  DATA FIFO  ********************************************/

//fifo for TX data.
assign wb_wr_en = (wb_addr_i == `SPORT_ADDR) && (wb_stb_i & wb_cyc_i & wb_we_i & ~full);
assign wb_rd_en = (wb_addr_i == `SPORT_ADDR) && (wb_stb_i & wb_cyc_i & ~wb_we_i);
endmodule

//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: $
//