// ----------------------- i2cSlave_define.v --------------------

// stream states
`define STREAM_IDLE 2'b00
`define STREAM_READ 2'b01
`define STREAM_WRITE_ADDR 2'b10
`define STREAM_WRITE_DATA 2'b11

// start stop detection states
`define NULL_DET 2'b00
`define START_DET 2'b01
`define STOP_DET 2'b10

// i2c ack and nak
`define I2C_NAK 1'b1
`define I2C_ACK 1'b0

// ----------------------------------------------------------------
// ------------- modify constants below this line -----------------
// ----------------------------------------------------------------

// i2c device address
`define I2C_ADDRESS 7'h3c

// System clock frequency in MHz
// If you are using a clock frequency below 24MHz, then the macro
// for SDA_DEL_LEN will result in compile errors for i2cSlave.v
// you will need to hand tweak the SDA_DEL_LEN constant definition
`define CLK_FREQ 48

// Debounce SCL and SDA over this many clock ticks
// The rise time of SCL and SDA can be up to 1000nS (in standard mode)
// so it is essential to debounce the inputs.
// The spec requires 0.05V of hysteresis, but in practise
// simply debouncing the inputs is sufficient
// I2C spec requires suppresion of spikes of 
// maximum duration 50nS, so this debounce time should be greater than 50nS
// Also increases data hold time and decreases data setup time
// during an I2C read operation
// 10 ticks = 208nS @ 48MHz
`define DEB_I2C_LEN (10*`CLK_FREQ)/48

// Delay SCL for use as internal sampling clock
// Using delayed version of SCL to ensure that 
// SDA is stable when it is sampled.
// Not entirely citical, as according to I2C spec
// SDA should have a minimum of 100nS of set up time
// with respect to SCL rising edge. But with the very slow edge 
// speeds used in I2C it is better to err on the side of caution.
// This delay also has the effect of adding extra hold time to the data
// with respect to SCL falling edge. I2C spec requires 0nS of data hold time.
// 10 ticks = 208nS @ 48MHz
`define SCL_DEL_LEN (10*`CLK_FREQ)/48

// Delay SDA for use in start/stop detection
// Use delayed SDA during start/stop detection to avoid
// incorrect detection at SCL falling edge.
// From I2C spec start/stop setup is 600nS with respect to SCL rising edge
// and start/stop hold is 600nS wrt SCL falling edge.
// So it is relatively easy to discriminate start/stop,
// but data setup time is a minimum of 100nS with respect to SCL rising edge
// and 0nS hold wrt to SCL falling edge.
// So the tricky part is providing robust start/stop detection
// in the presence of regular data transitions.
// This delay time should be less than 100nS
// 4 ticks = 83nS @ 48MHz
`define SDA_DEL_LEN (4*`CLK_FREQ)/48

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// i2cSlaveTop.v                                                   ////
////                                                              ////
//// This file is part of the i2cSlave opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// You will need to modify this file to implement your 
//// interface.
////                                                              ////
//// To Do:                                                       ////
//// 
////                                                              ////
//// Author(s):                                                   ////
//// - Steve Fielding, sfielding@base2designs.com                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Steve Fielding and OPENCORES.ORG          ////
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
//// PURPOSE. See the GNU Lesser General Public License for more  ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from <http://www.opencores.org/lgpl.shtml>                   ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
`include "i2cSlave_define.v"


module i2cSlaveTop (
  clk,
  rst,
  sda,
  scl,
  myReg0
);
input clk;
input rst;
inout sda;
input scl;
output [7:0] myReg0;


i2cSlave u_i2cSlave(
  .clk(clk),
  .rst(rst),
  .sda(sda),
  .scl(scl),
  .myReg0(myReg0),
  .myReg1(),
  .myReg2(),
  .myReg3(),
  .myReg4(8'h12),
  .myReg5(8'h34),
  .myReg6(8'h56),
  .myReg7(8'h78)

);


endmodule


 
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// i2cSlave.v                                                   ////
////                                                              ////
//// This file is part of the i2cSlave opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// You will need to modify this file to implement your 
//// interface.
////                                                              ////
//// To Do:                                                       ////
//// 
////                                                              ////
//// Author(s):                                                   ////
//// - Steve Fielding, sfielding@base2designs.com                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Steve Fielding and OPENCORES.ORG          ////
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
//// PURPOSE. See the GNU Lesser General Public License for more  ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from <http://www.opencores.org/lgpl.shtml>                   ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
`include "i2cSlave_define.v"


module i2cSlave (
  clk,
  rst,
  sda,
  scl,
  myReg0,
  myReg1,
  myReg2,
  myReg3,
  myReg4,
  myReg5,
  myReg6,
  myReg7
);

input clk;
input rst;
inout sda;
input scl;
output [7:0] myReg0;
output [7:0] myReg1;
output [7:0] myReg2;
output [7:0] myReg3;
input [7:0] myReg4;
input [7:0] myReg5;
input [7:0] myReg6;
input [7:0] myReg7;


// local wires and regs
reg sdaDeb;
reg sclDeb;
reg [`DEB_I2C_LEN-1:0] sdaPipe;
reg [`DEB_I2C_LEN-1:0] sclPipe;

reg [`SCL_DEL_LEN-1:0] sclDelayed;
reg [`SDA_DEL_LEN-1:0] sdaDelayed;
reg [1:0] startStopDetState;
wire clearStartStopDet;
wire sdaOut;
wire sdaIn;
wire [7:0] regAddr;
wire [7:0] dataToRegIF;
wire writeEn;
wire [7:0] dataFromRegIF;
reg [1:0] rstPipe;
wire rstSyncToClk;
reg startEdgeDet;

assign sda = (sdaOut == 1'b0) ? 1'b0 : 1'bz;
assign sdaIn = sda;

// sync rst rsing edge to clk
always @(posedge clk) begin
  if (rst == 1'b1)
    rstPipe <= 2'b11;
  else
    rstPipe <= {rstPipe[0], 1'b0};
end

assign rstSyncToClk = rstPipe[1];

// debounce sda and scl
always @(posedge clk) begin
  if (rstSyncToClk == 1'b1) begin
    sdaPipe <= {`DEB_I2C_LEN{1'b1}};
    sdaDeb <= 1'b1;
    sclPipe <= {`DEB_I2C_LEN{1'b1}};
    sclDeb <= 1'b1;
  end
  else begin
    sdaPipe <= {sdaPipe[`DEB_I2C_LEN-2:0], sdaIn};
    sclPipe <= {sclPipe[`DEB_I2C_LEN-2:0], scl};
    if (&sclPipe[`DEB_I2C_LEN-1:1] == 1'b1)
      sclDeb <= 1'b1;
    else if (|sclPipe[`DEB_I2C_LEN-1:1] == 1'b0)
      sclDeb <= 1'b0;
    if (&sdaPipe[`DEB_I2C_LEN-1:1] == 1'b1)
      sdaDeb <= 1'b1;
    else if (|sdaPipe[`DEB_I2C_LEN-1:1] == 1'b0)
      sdaDeb <= 1'b0;
  end
end


// delay scl and sda
// sclDelayed is used as a delayed sampling clock
// sdaDelayed is only used for start stop detection
// Because sda hold time from scl falling is 0nS
// sda must be delayed with respect to scl to avoid incorrect
// detection of start/stop at scl falling edge. 
always @(posedge clk) begin
  if (rstSyncToClk == 1'b1) begin
    sclDelayed <= {`SCL_DEL_LEN{1'b1}};
    sdaDelayed <= {`SDA_DEL_LEN{1'b1}};
  end
  else begin
    sclDelayed <= {sclDelayed[`SCL_DEL_LEN-2:0], sclDeb};
    sdaDelayed <= {sdaDelayed[`SDA_DEL_LEN-2:0], sdaDeb};
  end
end

// start stop detection
always @(posedge clk) begin
  if (rstSyncToClk == 1'b1) begin
    startStopDetState <= `NULL_DET;
    startEdgeDet <= 1'b0;
  end
  else begin
    if (sclDeb == 1'b1 && sdaDelayed[`SDA_DEL_LEN-2] == 1'b0 && sdaDelayed[`SDA_DEL_LEN-1] == 1'b1)
      startEdgeDet <= 1'b1;
    else
      startEdgeDet <= 1'b0;
    if (clearStartStopDet == 1'b1)
      startStopDetState <= `NULL_DET;
    else if (sclDeb == 1'b1) begin
      if (sdaDelayed[`SDA_DEL_LEN-2] == 1'b1 && sdaDelayed[`SDA_DEL_LEN-1] == 1'b0) 
        startStopDetState <= `STOP_DET;
      else if (sdaDelayed[`SDA_DEL_LEN-2] == 1'b0 && sdaDelayed[`SDA_DEL_LEN-1] == 1'b1)
        startStopDetState <= `START_DET;
    end
  end
end


registerInterface u_registerInterface(
  .clk(clk),
  .addr(regAddr),
  .dataIn(dataToRegIF),
  .writeEn(writeEn),
  .dataOut(dataFromRegIF),
  .myReg0(myReg0),
  .myReg1(myReg1),
  .myReg2(myReg2),
  .myReg3(myReg3),
  .myReg4(myReg4),
  .myReg5(myReg5),
  .myReg6(myReg6),
  .myReg7(myReg7)
);

serialInterface u_serialInterface (
  .clk(clk), 
  .rst(rstSyncToClk | startEdgeDet), 
  .dataIn(dataFromRegIF), 
  .dataOut(dataToRegIF), 
  .writeEn(writeEn),
  .regAddr(regAddr), 
  .scl(sclDelayed[`SCL_DEL_LEN-1]), 
  .sdaIn(sdaDeb), 
  .sdaOut(sdaOut), 
  .startStopDetState(startStopDetState),
  .clearStartStopDet(clearStartStopDet) 
);


endmodule


 
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// registerInterface.v                                          ////
////                                                              ////
//// This file is part of the i2cSlave opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// You will need to modify this file to implement your 
//// interface.
//// Add your control and status bytes/bits to module inputs and outputs,
//// and also to the I2C read and write process blocks  
////                                                              ////
//// To Do:                                                       ////
//// 
////                                                              ////
//// Author(s):                                                   ////
//// - Steve Fielding, sfielding@base2designs.com                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Steve Fielding and OPENCORES.ORG          ////
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
//// PURPOSE. See the GNU Lesser General Public License for more  ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from <http://www.opencores.org/lgpl.shtml>                   ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
`include "i2cSlave_define.v"


module registerInterface (
  clk,
  addr,
  dataIn,
  writeEn,
  dataOut,
  myReg0,
  myReg1,
  myReg2,
  myReg3,
  myReg4,
  myReg5,
  myReg6,
  myReg7

);
input clk;
input [7:0] addr;
input [7:0] dataIn;
input writeEn;
output [7:0] dataOut;
output [7:0] myReg0;
output [7:0] myReg1;
output [7:0] myReg2;
output [7:0] myReg3;
input [7:0] myReg4;
input [7:0] myReg5;
input [7:0] myReg6;
input [7:0] myReg7;

reg [7:0] dataOut;
reg [7:0] myReg0;
reg [7:0] myReg1;
reg [7:0] myReg2;
reg [7:0] myReg3;

// --- I2C Read
always @(posedge clk) begin
  case (addr)
    8'h00: dataOut <= myReg0;  
    8'h01: dataOut <= myReg1;  
    8'h02: dataOut <= myReg2;  
    8'h03: dataOut <= myReg3;  
    8'h04: dataOut <= myReg4;  
    8'h05: dataOut <= myReg5;  
    8'h06: dataOut <= myReg6;  
    8'h07: dataOut <= myReg7;  
    default: dataOut <= 8'h00;
  endcase
end

// --- I2C Write
always @(posedge clk) begin
  if (writeEn == 1'b1) begin
    case (addr)
      8'h00: myReg0 <= dataIn;  
      8'h01: myReg1 <= dataIn;
      8'h02: myReg2 <= dataIn;
      8'h03: myReg3 <= dataIn;
    endcase
  end
end

endmodule


 

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// serialInterface.v                                                 ////
////                                                              ////
//// This file is part of the i2cSlave opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// Perform all serial to parallel, and parallel
//// to serial conversions. Perform device address matching
//// Handle arbitrary length I2C reads terminated by NAK
//// from host, and arbitrary length I2C writes terminated
//// by STOP from host
//// The second byte of a I2C write is always interpreted
//// as a register address, and becomes the base register address
//// for all read and write transactions.
//// I2C WRITE:    devAddr, regAddr, data[regAddr], data[regAddr+1], ..... data[regAddr+N]
//// I2C READ:    data[regAddr], data[regAddr+1], ..... data[regAddr+N]
//// Note that when regAddR reaches 255 it will automatically wrap round to 0
////                                                              ////
//// To Do:                                                       ////
//// 
////                                                              ////
//// Author(s):                                                   ////
//// - Steve Fielding, sfielding@base2designs.com                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2008 Steve Fielding and OPENCORES.ORG          ////
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
//// PURPOSE. See the GNU Lesser General Public License for more  ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from <http://www.opencores.org/lgpl.shtml>                   ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
`include "timescale.v"
`include "i2cSlave_define.v"

module serialInterface (clearStartStopDet, clk, dataIn, dataOut, regAddr, rst, scl, sdaIn, sdaOut, startStopDetState, writeEn);
input   clk;
input   [7:0]dataIn;
input   rst;
input   scl;
input   sdaIn;
input   [1:0]startStopDetState;
output  clearStartStopDet;
output  [7:0]dataOut;
output  [7:0]regAddr;
output  sdaOut;
output  writeEn;

reg     clearStartStopDet, next_clearStartStopDet;
wire    clk;
wire    [7:0]dataIn;
reg     [7:0]dataOut, next_dataOut;
reg     [7:0]regAddr, next_regAddr;
wire    rst;
wire    scl;
wire    sdaIn;
reg     sdaOut, next_sdaOut;
wire    [1:0]startStopDetState;
reg     writeEn, next_writeEn;

// diagram signals declarations
reg  [2:0]bitCnt, next_bitCnt;
reg  [7:0]rxData, next_rxData;
reg  [1:0]streamSt, next_streamSt;
reg  [7:0]txData, next_txData;

// BINARY ENCODED state machine: SISt
// State codes definitions:
`define START 4'b0000
`define CHK_RD_WR 4'b0001
`define READ_RD_LOOP 4'b0010
`define READ_WT_HI 4'b0011
`define READ_CHK_LOOP_FIN 4'b0100
`define READ_WT_LO 4'b0101
`define READ_WT_ACK 4'b0110
`define WRITE_WT_LO 4'b0111
`define WRITE_WT_HI 4'b1000
`define WRITE_CHK_LOOP_FIN 4'b1001
`define WRITE_LOOP_WT_LO 4'b1010
`define WRITE_ST_LOOP 4'b1011
`define WRITE_WT_LO2 4'b1100
`define WRITE_WT_HI2 4'b1101
`define WRITE_CLR_WR 4'b1110
`define WRITE_CLR_ST_STOP 4'b1111

reg [3:0]CurrState_SISt, NextState_SISt;

// Diagram actions (continuous assignments allowed only: assign ...)
// diagram ACTION


// Machine: SISt

// NextState logic (combinatorial)
always @ (startStopDetState or streamSt or scl or txData or bitCnt or rxData or sdaIn or regAddr or dataIn or sdaOut or writeEn or dataOut or clearStartStopDet or CurrState_SISt)
begin
  NextState_SISt <= CurrState_SISt;
  // Set default values for outputs and signals
  next_streamSt <= streamSt;
  next_txData <= txData;
  next_rxData <= rxData;
  next_sdaOut <= sdaOut;
  next_writeEn <= writeEn;
  next_dataOut <= dataOut;
  next_bitCnt <= bitCnt;
  next_clearStartStopDet <= clearStartStopDet;
  next_regAddr <= regAddr;
  case (CurrState_SISt)  // synopsys parallel_case full_case
    `START:
    begin
      next_streamSt <= `STREAM_IDLE;
      next_txData <= 8'h00;
      next_rxData <= 8'h00;
      next_sdaOut <= 1'b1;
      next_writeEn <= 1'b0;
      next_dataOut <= 8'h00;
      next_bitCnt <= 3'b000;
      next_clearStartStopDet <= 1'b0;
      NextState_SISt <= `CHK_RD_WR;
    end
    `CHK_RD_WR:
    begin
      if (streamSt == `STREAM_READ)
      begin
        NextState_SISt <= `READ_RD_LOOP;
        next_txData <= dataIn;
        next_regAddr <= regAddr + 1'b1;
        next_bitCnt <= 3'b001;
      end
      else
      begin
        NextState_SISt <= `WRITE_WT_HI;
        next_rxData <= 8'h00;
      end
    end
    `READ_RD_LOOP:
    begin
      if (scl == 1'b0)
      begin
        NextState_SISt <= `READ_WT_HI;
        next_sdaOut <= txData [7];
        next_txData <= {txData [6:0], 1'b0};
      end
    end
    `READ_WT_HI:
    begin
      if (scl == 1'b1)
      begin
        NextState_SISt <= `READ_CHK_LOOP_FIN;
      end
    end
    `READ_CHK_LOOP_FIN:
    begin
      if (bitCnt == 3'b000)
      begin
        NextState_SISt <= `READ_WT_LO;
      end
      else
      begin
        NextState_SISt <= `READ_RD_LOOP;
        next_bitCnt <= bitCnt + 1'b1;
      end
    end
    `READ_WT_LO:
    begin
      if (scl == 1'b0)
      begin
        NextState_SISt <= `READ_WT_ACK;
        next_sdaOut <= 1'b1;
      end
    end
    `READ_WT_ACK:
    begin
      if (scl == 1'b1)
      begin
        NextState_SISt <= `CHK_RD_WR;
        if (sdaIn == `I2C_NAK)
        next_streamSt <= `STREAM_IDLE;
      end
    end
    `WRITE_WT_LO:
    begin
      if ((scl == 1'b0) && (startStopDetState == `STOP_DET || 
        (streamSt == `STREAM_IDLE && startStopDetState == `NULL_DET)))
      begin
        NextState_SISt <= `WRITE_CLR_ST_STOP;
        case (startStopDetState)
        `NULL_DET:
        next_bitCnt <= bitCnt + 1'b1;
        `START_DET: begin
        next_streamSt <= `STREAM_IDLE;
        next_rxData <= 8'h00;
        end
        default: ;
        endcase
        next_streamSt <= `STREAM_IDLE;
        next_clearStartStopDet <= 1'b1;
      end
      else if (scl == 1'b0)
      begin
        NextState_SISt <= `WRITE_ST_LOOP;
        case (startStopDetState)
        `NULL_DET:
        next_bitCnt <= bitCnt + 1'b1;
        `START_DET: begin
        next_streamSt <= `STREAM_IDLE;
        next_rxData <= 8'h00;
        end
        default: ;
        endcase
      end
    end
    `WRITE_WT_HI:
    begin
      if (scl == 1'b1)
      begin
        NextState_SISt <= `WRITE_WT_LO;
        next_rxData <= {rxData [6:0], sdaIn};
        next_bitCnt <= 3'b000;
      end
    end
    `WRITE_CHK_LOOP_FIN:
    begin
      if (bitCnt == 3'b111)
      begin
        NextState_SISt <= `WRITE_CLR_WR;
        next_sdaOut <= `I2C_ACK;
        case (streamSt)
        `STREAM_IDLE: begin
        if (rxData[7:1] == `I2C_ADDRESS &&
        startStopDetState == `START_DET) begin
        if (rxData[0] == 1'b1)
        next_streamSt <= `STREAM_READ;
        else
        next_streamSt <= `STREAM_WRITE_ADDR;
        end
        else
        next_sdaOut <= `I2C_NAK;
        end
        `STREAM_WRITE_ADDR: begin
        next_streamSt <= `STREAM_WRITE_DATA;
        next_regAddr <= rxData;
        end
        `STREAM_WRITE_DATA: begin
        next_dataOut <= rxData;
        next_writeEn <= 1'b1;
        end
        default:
        next_streamSt <= streamSt;
        endcase
      end
      else
      begin
        NextState_SISt <= `WRITE_ST_LOOP;
        next_bitCnt <= bitCnt + 1'b1;
      end
    end
    `WRITE_LOOP_WT_LO:
    begin
      if (scl == 1'b0)
      begin
        NextState_SISt <= `WRITE_CHK_LOOP_FIN;
      end
    end
    `WRITE_ST_LOOP:
    begin
      if (scl == 1'b1)
      begin
        NextState_SISt <= `WRITE_LOOP_WT_LO;
        next_rxData <= {rxData [6:0], sdaIn};
      end
    end
    `WRITE_WT_LO2:
    begin
      if (scl == 1'b0)
      begin
        NextState_SISt <= `CHK_RD_WR;
        next_sdaOut <= 1'b1;
      end
    end
    `WRITE_WT_HI2:
    begin
      next_clearStartStopDet <= 1'b0;
      if (scl == 1'b1)
      begin
        NextState_SISt <= `WRITE_WT_LO2;
      end
    end
    `WRITE_CLR_WR:
    begin
      if (writeEn == 1'b1)
      next_regAddr <= regAddr + 1'b1;
      next_writeEn <= 1'b0;
      next_clearStartStopDet <= 1'b1;
      NextState_SISt <= `WRITE_WT_HI2;
    end
    `WRITE_CLR_ST_STOP:
    begin
      next_clearStartStopDet <= 1'b0;
      NextState_SISt <= `CHK_RD_WR;
    end
  endcase
end

// Current State Logic (sequential)
always @ (posedge clk)
begin
  if (rst == 1'b1)
    CurrState_SISt <= `START;
  else
    CurrState_SISt <= NextState_SISt;
end

// Registered outputs logic
always @ (posedge clk)
begin
  if (rst == 1'b1)
  begin
    sdaOut <= 1'b1;
    writeEn <= 1'b0;
    dataOut <= 8'h00;
    clearStartStopDet <= 1'b0;
    // regAddr <=     // Initialization in the reset state or default value required!!
    streamSt <= `STREAM_IDLE;
    txData <= 8'h00;
    rxData <= 8'h00;
    bitCnt <= 3'b000;
  end
  else 
  begin
    sdaOut <= next_sdaOut;
    writeEn <= next_writeEn;
    dataOut <= next_dataOut;
    clearStartStopDet <= next_clearStartStopDet;
    regAddr <= next_regAddr;
    streamSt <= next_streamSt;
    txData <= next_txData;
    rxData <= next_rxData;
    bitCnt <= next_bitCnt;
  end
end

endmodule//////////////////////////////////////////////////////////////////////
// timescale.v                                              
//////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

