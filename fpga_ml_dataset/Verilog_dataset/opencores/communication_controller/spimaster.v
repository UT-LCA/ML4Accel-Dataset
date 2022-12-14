//////////////////////////////////////////////////////////////////////
////                                                              ////
//// ctrlStsRegBI.v                                               ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// Wishbone bus interface to spiMaster control and status regs
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
`include "spiMaster_defines.v"

module ctrlStsRegBI (
  busClk, 
  rstFromWire, 
  dataIn, 
  dataOut, 
  address, 
  writeEn, 
  strobe_i, 
  spiSysClk,
  spiTransType, 
  spiTransCtrl, 
  spiTransStatus,
  spiDirectAccessTxData,
  spiDirectAccessRxData, 
  ctrlStsRegSel, 
  rstSyncToBusClkOut, 
  rstSyncToSpiClkOut,
  SDWriteError,
  SDReadError,
  SDInitError,
  SDAddr,
  spiClkDelay
);

input [7:0] dataIn;
input [7:0] address;
input writeEn;
input strobe_i;
input busClk;
input spiSysClk;
output [7:0] dataOut;
input ctrlStsRegSel;
output [1:0] spiTransType;
output spiTransCtrl;
input spiTransStatus;
output [7:0] spiDirectAccessTxData;
reg [7:0] spiDirectAccessTxData;
input [7:0] spiDirectAccessRxData;
input rstFromWire;
output rstSyncToBusClkOut;
output rstSyncToSpiClkOut;
input [1:0] SDWriteError;
input [1:0] SDReadError;
input [1:0] SDInitError;
output [31:0] SDAddr;
reg [31:0] SDAddr;
output [7:0] spiClkDelay;
reg [7:0] spiClkDelay;

wire [7:0] dataIn;
wire [7:0] address;
wire writeEn;
wire strobe_i;
wire clk;
reg [7:0] dataOut;
reg [1:0] spiTransType;
reg spiTransCtrl;
wire ctrlStsRegSel;
wire rstFromWire;
reg rstSyncToBusClkOut;
reg rstSyncToSpiClkOut;

//internal wire and regs
reg [5:0] rstShift;
reg rstFromBus;
reg [7:0] spiDirectAccessTxDataSTB;
reg [7:0] spiDirectAccessRxDataSTB;
reg [1:0] spiTransTypeSTB;
reg spiTransCtrlSTB;
reg spiTransStatusSTB;
reg rstSyncToSpiClkFirst;
reg [5:0] spiTransCtrlShift;
reg spiTransStatusReg1;
reg spiTransStatusReg2;
reg spiTransStatusReg3;
reg [1:0] SDWriteErrorSTB;
reg [1:0] SDReadErrorSTB;
reg [1:0] SDInitErrorSTB;
reg spiTransCtrl_reg1;
reg spiTransCtrl_reg2;
reg spiTransCtrl_reg3;

//sync write demux
always @(posedge busClk)
begin
  if (rstSyncToBusClkOut == 1'b1) begin
    spiTransTypeSTB <= `DIRECT_ACCESS;
    spiTransCtrlSTB <= `TRANS_STOP;
    spiDirectAccessTxDataSTB <= 8'h00;
    spiClkDelay <= `FAST_SPI_CLK;
  end
  else begin
    if (writeEn == 1'b1 && ctrlStsRegSel == 1'b1 && strobe_i == 1'b1 && address == `SPI_MASTER_CONTROL_REG && dataIn[0] == 1'b1 )
      rstFromBus <= 1'b1;
    else
      rstFromBus <= 1'b0;
    if (writeEn == 1'b1 && ctrlStsRegSel == 1'b1 && strobe_i == 1'b1 && address == `TRANS_CTRL_REG && dataIn[0] == 1'b1 )
      spiTransCtrlSTB <= 1'b1;
    else
      spiTransCtrlSTB <= 1'b0;
    if (writeEn == 1'b1 && ctrlStsRegSel == 1'b1 && strobe_i == 1'b1) begin
      case (address)
        `TRANS_TYPE_REG: spiTransTypeSTB <= dataIn[1:0];
        `SD_ADDR_7_0_REG: SDAddr[7:0] <= dataIn;
        `SD_ADDR_15_8_REG: SDAddr[15:8] <= dataIn;
        `SD_ADDR_23_16_REG: SDAddr[23:16] <= dataIn;
        `SD_ADDR_31_24_REG: SDAddr[31:24] <= dataIn;
        `SPI_CLK_DEL_REG: spiClkDelay <= dataIn;
        `DIRECT_ACCESS_DATA_REG: spiDirectAccessTxDataSTB <= dataIn;
      endcase
    end
  end
end

// async read mux
always @(address or spiTransTypeSTB or spiTransCtrlSTB or
         spiTransStatusSTB or spiDirectAccessRxDataSTB or
         SDAddr or SDInitErrorSTB or SDReadErrorSTB or SDWriteErrorSTB or
         spiClkDelay)
begin
  case (address)
    `SPI_MASTER_VERSION_REG: dataOut <= `SPI_MASTER_VERSION_NUM;
    `TRANS_TYPE_REG: dataOut <= { 6'b000000, spiTransTypeSTB};
    `TRANS_CTRL_REG: dataOut <= { 7'b0000000, spiTransCtrlSTB};
    `TRANS_STS_REG: dataOut <= { 7'b0000000, spiTransStatusSTB};
    `TRANS_ERROR_REG: dataOut <= {2'b00, SDWriteErrorSTB, SDReadErrorSTB, SDInitErrorSTB};
    `SD_ADDR_7_0_REG: dataOut <= SDAddr[7:0];
    `SD_ADDR_15_8_REG: dataOut <= SDAddr[15:8];
    `SD_ADDR_23_16_REG: dataOut <= SDAddr[23:16];
    `SD_ADDR_31_24_REG: dataOut <= SDAddr[31:24];
    `SPI_CLK_DEL_REG: dataOut <= spiClkDelay;
    `DIRECT_ACCESS_DATA_REG: dataOut <= spiDirectAccessRxDataSTB;
    default: dataOut <= 8'h00;
  endcase
end

// reset control
//generate 'rstSyncToBusClk'
//assuming that 'busClk' < 5 * 'spiSysClk'.
always @(posedge busClk) begin
  if (rstFromWire == 1'b1 || rstFromBus == 1'b1) 
    rstShift <= 6'b111111;
  else
    rstShift <= {1'b0, rstShift[5:1]};
end

always @(rstShift)
  rstSyncToBusClkOut <= rstShift[0];

// double sync across clock domains to generate 'rstSyncToSpiClkOut'
always @(posedge spiSysClk) begin
    rstSyncToSpiClkFirst <= rstSyncToBusClkOut;
    rstSyncToSpiClkOut <= rstSyncToSpiClkFirst;
end


// spi transaction control
//assuming that 'busClk' < 5 * 'spiSysClk'.
always @(posedge busClk) begin
  if (rstSyncToBusClkOut == 1'b1) 
    spiTransCtrlShift <= 6'b000000;
  else if (spiTransCtrlSTB == 1'b1) 
    spiTransCtrlShift <= 6'b111111;
  else
    spiTransCtrlShift <= {1'b0, spiTransCtrlShift[5:1]};
end

//re-sync to spiSysClk
always @(posedge spiSysClk) begin
  if (rstSyncToSpiClkOut == 1'b1) begin
    spiTransCtrl_reg1 <= 1'b0;
    spiTransCtrl_reg2 <= 1'b0;
    spiTransCtrl_reg3 <= 1'b0;
  end
  else begin
    spiTransCtrl_reg1 <= spiTransCtrlShift[0];
    spiTransCtrl_reg2 <= spiTransCtrl_reg1;
    spiTransCtrl_reg3 <= spiTransCtrl_reg2;
    if (spiTransCtrl_reg3 == 1'b0 && spiTransCtrl_reg2 == 1'b1)
      spiTransCtrl <= `TRANS_START;
    else
      spiTransCtrl <= `TRANS_STOP;
  end
end



//re-sync from busClk to spiSysClk. 
always @(posedge spiSysClk) begin
  if (rstSyncToSpiClkOut == 1'b1) begin
    spiTransType <= `DIRECT_ACCESS;
    spiDirectAccessTxData <= 8'h00;
  end
  else begin
    spiDirectAccessTxData <= spiDirectAccessTxDataSTB;
    spiTransType <= spiTransTypeSTB; 
  end
end

//re-sync from spiSysClk to busClk
always @(posedge busClk) begin
  if (rstSyncToBusClkOut == 1'b1) begin
    spiTransStatusSTB <= `TRANS_NOT_BUSY;
    spiTransStatusReg1 <= `TRANS_NOT_BUSY;
    spiTransStatusReg2 <= `TRANS_NOT_BUSY;
    spiTransStatusReg3 <= `TRANS_NOT_BUSY;
  end
  else begin
    spiTransStatusReg1 <= spiTransStatus;
    spiTransStatusReg2 <= spiTransStatusReg1;
    spiTransStatusReg3 <= spiTransStatusReg2;
    if (spiTransCtrlSTB == `TRANS_START)
      spiTransStatusSTB <= `TRANS_BUSY;
    else if (spiTransStatusReg3 == `TRANS_BUSY && spiTransStatusReg2 == `TRANS_NOT_BUSY)
      spiTransStatusSTB <= `TRANS_NOT_BUSY;
  end
  spiDirectAccessRxDataSTB <= spiDirectAccessRxData;
  SDWriteErrorSTB <= SDWriteError;
  SDReadErrorSTB <= SDReadError;
  SDInitErrorSTB <= SDInitError;
end

endmodule


//////////////////////////////////////////////////////////////////////
////                                                              ////
//// initSD.v                                                 ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// When SDInitReq asserted, initialise SD card
////  
////  
//// 
////                                                              ////
//// To Do:                                                       ////
//// 
////                                                              ////
//// Author(s):                                                   ////
//// - Steve Fielding, sfielding@base2designs.com                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2004 Steve Fielding and OPENCORES.ORG          ////
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
`include "spiMaster_defines.v"

module initSD (checkSumByte, clk, cmdByte, dataByte1, dataByte2, dataByte3, dataByte4, initError, respByte, respTout, rst, rxDataRdy, rxDataRdyClr, SDInitRdy, SDInitReq, sendCmdRdy, sendCmdReq, spiClkDelayIn, spiClkDelayOut, spiCS_n, txDataEmpty, txDataFull, txDataOut, txDataWen);
input   clk;
input   [7:0]respByte;
input   respTout;
input   rst;
input   rxDataRdy;
input   SDInitReq;
input   sendCmdRdy;
input   [7:0]spiClkDelayIn;
input   txDataEmpty;
input   txDataFull;
output  [7:0]checkSumByte;
output  [7:0]cmdByte;
output  [7:0]dataByte1;
output  [7:0]dataByte2;
output  [7:0]dataByte3;
output  [7:0]dataByte4;
output  [1:0]initError;
output  rxDataRdyClr;
output  SDInitRdy;
output  sendCmdReq;
output  [7:0]spiClkDelayOut;
output  spiCS_n;
output  [7:0]txDataOut;
output  txDataWen;

reg     [7:0]checkSumByte, next_checkSumByte;
wire    clk;
reg     [7:0]cmdByte, next_cmdByte;
reg     [7:0]dataByte1, next_dataByte1;
reg     [7:0]dataByte2, next_dataByte2;
reg     [7:0]dataByte3, next_dataByte3;
reg     [7:0]dataByte4, next_dataByte4;
reg     [1:0]initError, next_initError;
wire    [7:0]respByte;
wire    respTout;
wire    rst;
wire    rxDataRdy;
reg     rxDataRdyClr, next_rxDataRdyClr;
reg     SDInitRdy, next_SDInitRdy;
wire    SDInitReq;
wire    sendCmdRdy;
reg     sendCmdReq, next_sendCmdReq;
wire    [7:0]spiClkDelayIn;
reg     [7:0]spiClkDelayOut, next_spiClkDelayOut;
reg     spiCS_n, next_spiCS_n;
wire    txDataEmpty;
wire    txDataFull;
reg     [7:0]txDataOut, next_txDataOut;
reg     txDataWen, next_txDataWen;

// diagram signals declarations
reg  [9:0]delCnt1, next_delCnt1;
reg  [7:0]delCnt2, next_delCnt2;
reg  [7:0]loopCnt, next_loopCnt;

// BINARY ENCODED state machine: initSDSt
// State codes definitions:
`define START 4'b0000
`define WT_INIT_REQ 4'b0001
`define CLK_SEQ_SEND_FF 4'b0010
`define CLK_SEQ_CHK_FIN 4'b0011
`define RESET_SEND_CMD 4'b0100
`define RESET_DEL 4'b0101
`define RESET_WT_FIN 4'b0110
`define RESET_CHK_FIN 4'b0111
`define INIT_WT_FIN 4'b1000
`define INIT_CHK_FIN 4'b1001
`define INIT_SEND_CMD 4'b1010
`define INIT_DEL1 4'b1011
`define INIT_DEL2 4'b1100
`define CLK_SEQ_WT_DATA_EMPTY 4'b1101

reg [3:0]CurrState_initSDSt, NextState_initSDSt;

// Diagram actions (continuous assignments allowed only: assign ...)
// diagram ACTION


// Machine: initSDSt

// NextState logic (combinatorial)
always @ (spiClkDelayIn or SDInitReq or txDataFull or loopCnt or sendCmdRdy or respTout or respByte or delCnt1 or delCnt2 or txDataEmpty or spiClkDelayOut or SDInitRdy or spiCS_n or initError or txDataOut or txDataWen or cmdByte or dataByte1 or dataByte2 or dataByte3 or dataByte4 or checkSumByte or sendCmdReq or rxDataRdyClr or CurrState_initSDSt)
begin
  NextState_initSDSt <= CurrState_initSDSt;
  // Set default values for outputs and signals
  next_spiClkDelayOut <= spiClkDelayOut;
  next_SDInitRdy <= SDInitRdy;
  next_spiCS_n <= spiCS_n;
  next_initError <= initError;
  next_txDataOut <= txDataOut;
  next_txDataWen <= txDataWen;
  next_cmdByte <= cmdByte;
  next_dataByte1 <= dataByte1;
  next_dataByte2 <= dataByte2;
  next_dataByte3 <= dataByte3;
  next_dataByte4 <= dataByte4;
  next_checkSumByte <= checkSumByte;
  next_sendCmdReq <= sendCmdReq;
  next_loopCnt <= loopCnt;
  next_delCnt1 <= delCnt1;
  next_delCnt2 <= delCnt2;
  next_rxDataRdyClr <= rxDataRdyClr;
  case (CurrState_initSDSt)  // synopsys parallel_case full_case
    `START:
    begin
      next_spiClkDelayOut <= spiClkDelayIn;
      next_SDInitRdy <= 1'b0;
      next_spiCS_n <= 1'b1;
      next_initError <= `INIT_NO_ERROR;
      next_txDataOut <= 8'h00;
      next_txDataWen <= 1'b0;
      next_cmdByte <= 8'h00;
      next_dataByte1 <= 8'h00;
      next_dataByte2 <= 8'h00;
      next_dataByte3 <= 8'h00;
      next_dataByte4 <= 8'h00;
      next_checkSumByte <= 8'h00;
      next_sendCmdReq <= 1'b0;
      next_loopCnt <= 8'h00;
      next_delCnt1 <= 10'h000;
      next_delCnt2 <= 8'h00;
      next_rxDataRdyClr <= 1'b0;
      NextState_initSDSt <= `WT_INIT_REQ;
    end
    `WT_INIT_REQ:
    begin
      next_SDInitRdy <= 1'b1;
      next_spiClkDelayOut <= spiClkDelayIn;
      next_cmdByte <= 8'h00;
      next_dataByte1 <= 8'h00;
      next_dataByte2 <= 8'h00;
      next_dataByte3 <= 8'h00;
      next_dataByte4 <= 8'h00;
      next_checkSumByte <= 8'h00;
      if (SDInitReq == 1'b1)
      begin
        NextState_initSDSt <= `CLK_SEQ_SEND_FF;
        next_SDInitRdy <= 1'b0;
        next_loopCnt <= 8'h00;
        next_spiClkDelayOut <= `SLOW_SPI_CLK;
        next_initError <= `INIT_NO_ERROR;
      end
    end
    `CLK_SEQ_SEND_FF:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_initSDSt <= `CLK_SEQ_CHK_FIN;
        next_txDataOut <= 8'hff;
        next_txDataWen <= 1'b1;
        next_loopCnt <= loopCnt + 1'b1;
      end
    end
    `CLK_SEQ_CHK_FIN:
    begin
      next_txDataWen <= 1'b0;
      if (loopCnt == `SD_INIT_START_SEQ_LEN)
      begin
        NextState_initSDSt <= `CLK_SEQ_WT_DATA_EMPTY;
      end
      else
      begin
        NextState_initSDSt <= `CLK_SEQ_SEND_FF;
      end
    end
    `CLK_SEQ_WT_DATA_EMPTY:
    begin
      if (txDataEmpty == 1'b1)
      begin
        NextState_initSDSt <= `RESET_SEND_CMD;
        next_loopCnt <= 8'h00;
      end
    end
    `RESET_SEND_CMD:
    begin
      next_cmdByte <= 8'h40;
      //CMD0
      next_dataByte1 <= 8'h00;
      next_dataByte2 <= 8'h00;
      next_dataByte3 <= 8'h00;
      next_dataByte4 <= 8'h00;
      next_checkSumByte <= 8'h95;
      next_sendCmdReq <= 1'b1;
      next_loopCnt <= loopCnt + 1'b1;
      next_spiCS_n <= 1'b0;
      NextState_initSDSt <= `RESET_DEL;
    end
    `RESET_DEL:
    begin
      next_sendCmdReq <= 1'b0;
      NextState_initSDSt <= `RESET_WT_FIN;
    end
    `RESET_WT_FIN:
    begin
      if (sendCmdRdy == 1'b1)
      begin
        NextState_initSDSt <= `RESET_CHK_FIN;
        next_spiCS_n <= 1'b1;
      end
    end
    `RESET_CHK_FIN:
    begin
      if ((respTout == 1'b1 || respByte != 8'h01) && loopCnt != 8'hff)
      begin
        NextState_initSDSt <= `RESET_SEND_CMD;
      end
      else if (respTout == 1'b1 || respByte != 8'h01)
      begin
        NextState_initSDSt <= `WT_INIT_REQ;
        next_initError <= `INIT_CMD0_ERROR;
      end
      else
      begin
        NextState_initSDSt <= `INIT_SEND_CMD;
      end
    end
    `INIT_WT_FIN:
    begin
      if (sendCmdRdy == 1'b1)
      begin
        NextState_initSDSt <= `INIT_CHK_FIN;
        next_spiCS_n <= 1'b1;
      end
    end
    `INIT_CHK_FIN:
    begin
      if ((respTout == 1'b1 || respByte != 8'h00) && loopCnt != 8'hff)
      begin
        NextState_initSDSt <= `INIT_SEND_CMD;
      end
      else if (respTout == 1'b1 || respByte != 8'h00)
      begin
        NextState_initSDSt <= `WT_INIT_REQ;
        next_initError <= `INIT_CMD1_ERROR;
      end
      else
      begin
        NextState_initSDSt <= `WT_INIT_REQ;
      end
    end
    `INIT_SEND_CMD:
    begin
      next_cmdByte <= 8'h41;
      //CMD1
      next_dataByte1 <= 8'h00;
      next_dataByte2 <= 8'h00;
      next_dataByte3 <= 8'h00;
      next_dataByte4 <= 8'h00;
      next_checkSumByte <= 8'hff;
      next_sendCmdReq <= 1'b1;
      next_loopCnt <= loopCnt + 1'b1;
      next_spiCS_n <= 1'b0;
      next_delCnt1 <= 10'h000;
      NextState_initSDSt <= `INIT_DEL1;
    end
    `INIT_DEL1:
    begin
      next_delCnt1 <= delCnt1 + 1'b1;
      next_delCnt2 <= 8'h00;
      next_sendCmdReq <= 1'b0;
      if (delCnt1 == `TWO_MS)
      begin
        NextState_initSDSt <= `INIT_WT_FIN;
      end
      else
      begin
        NextState_initSDSt <= `INIT_DEL2;
      end
    end
    `INIT_DEL2:
    begin
      next_delCnt2 <= delCnt2 + 1'b1;
      if (delCnt2 == 8'hff)
      begin
        NextState_initSDSt <= `INIT_DEL1;
      end
    end
  endcase
end

// Current State Logic (sequential)
always @ (posedge clk)
begin
  if (rst == 1'b1)
    CurrState_initSDSt <= `START;
  else
    CurrState_initSDSt <= NextState_initSDSt;
end

// Registered outputs logic
always @ (posedge clk)
begin
  if (rst == 1'b1)
  begin
    spiClkDelayOut <= spiClkDelayIn;
    SDInitRdy <= 1'b0;
    spiCS_n <= 1'b1;
    initError <= `INIT_NO_ERROR;
    txDataOut <= 8'h00;
    txDataWen <= 1'b0;
    cmdByte <= 8'h00;
    dataByte1 <= 8'h00;
    dataByte2 <= 8'h00;
    dataByte3 <= 8'h00;
    dataByte4 <= 8'h00;
    checkSumByte <= 8'h00;
    sendCmdReq <= 1'b0;
    rxDataRdyClr <= 1'b0;
    loopCnt <= 8'h00;
    delCnt1 <= 10'h000;
    delCnt2 <= 8'h00;
  end
  else 
  begin
    spiClkDelayOut <= next_spiClkDelayOut;
    SDInitRdy <= next_SDInitRdy;
    spiCS_n <= next_spiCS_n;
    initError <= next_initError;
    txDataOut <= next_txDataOut;
    txDataWen <= next_txDataWen;
    cmdByte <= next_cmdByte;
    dataByte1 <= next_dataByte1;
    dataByte2 <= next_dataByte2;
    dataByte3 <= next_dataByte3;
    dataByte4 <= next_dataByte4;
    checkSumByte <= next_checkSumByte;
    sendCmdReq <= next_sendCmdReq;
    rxDataRdyClr <= next_rxDataRdyClr;
    loopCnt <= next_loopCnt;
    delCnt1 <= next_delCnt1;
    delCnt2 <= next_delCnt2;
  end
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// readWriteSDBlock.v                             ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// If readWriteSDBlockReq equals WRITE_SD_BLOCK or
//// READ_SD_BLOCK, then write or read a 512 byte block
//// of SD memory
//// 
////                                                              ////
//// To Do:                                                       ////
//// 
////                                                              ////
//// Author(s):                                                   ////
//// - Steve Fielding, sfielding@base2designs.com                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2004 Steve Fielding and OPENCORES.ORG          ////
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
`include "spiMaster_defines.v"

module readWriteSDBlock (blockAddr, checkSumByte, clk, cmdByte, dataByte1, dataByte2, dataByte3, dataByte4, readError, readWriteSDBlockRdy, readWriteSDBlockReq, respByte, respTout, rst, rxDataIn, rxDataRdy, rxDataRdyClr, rxFifoData, rxFifoWen, sendCmdRdy, sendCmdReq, spiCS_n, txDataEmpty, txDataFull, txDataOut, txDataWen, txFifoData, txFifoRen, writeError);
input   [31:0]blockAddr;
input   clk;
input   [1:0]readWriteSDBlockReq;
input   [7:0]respByte;
input   respTout;
input   rst;
input   [7:0]rxDataIn;
input   rxDataRdy;
input   sendCmdRdy;
input   txDataEmpty;
input   txDataFull;
input   [7:0]txFifoData;
output  [7:0]checkSumByte;
output  [7:0]cmdByte;
output  [7:0]dataByte1;
output  [7:0]dataByte2;
output  [7:0]dataByte3;
output  [7:0]dataByte4;
output  [1:0]readError;
output  readWriteSDBlockRdy;
output  rxDataRdyClr;
output  [7:0]rxFifoData;
output  rxFifoWen;
output  sendCmdReq;
output  spiCS_n;
output  [7:0]txDataOut;
output  txDataWen;
output  txFifoRen;
output  [1:0]writeError;

wire    [31:0]blockAddr;
reg     [7:0]checkSumByte, next_checkSumByte;
wire    clk;
reg     [7:0]cmdByte, next_cmdByte;
reg     [7:0]dataByte1, next_dataByte1;
reg     [7:0]dataByte2, next_dataByte2;
reg     [7:0]dataByte3, next_dataByte3;
reg     [7:0]dataByte4, next_dataByte4;
reg     [1:0]readError, next_readError;
reg     readWriteSDBlockRdy, next_readWriteSDBlockRdy;
wire    [1:0]readWriteSDBlockReq;
wire    [7:0]respByte;
wire    respTout;
wire    rst;
wire    [7:0]rxDataIn;
wire    rxDataRdy;
reg     rxDataRdyClr, next_rxDataRdyClr;
reg     [7:0]rxFifoData, next_rxFifoData;
reg     rxFifoWen, next_rxFifoWen;
wire    sendCmdRdy;
reg     sendCmdReq, next_sendCmdReq;
reg     spiCS_n, next_spiCS_n;
wire    txDataEmpty;
wire    txDataFull;
reg     [7:0]txDataOut, next_txDataOut;
reg     txDataWen, next_txDataWen;
wire    [7:0]txFifoData;
reg     txFifoRen, next_txFifoRen;
reg     [1:0]writeError, next_writeError;

// diagram signals declarations
reg  [7:0]delCnt1, next_delCnt1;
reg  [7:0]delCnt2, next_delCnt2;
reg  [7:0]locRespByte, next_locRespByte;
reg  [8:0]loopCnt, next_loopCnt;
reg  [11:0]timeOutCnt, next_timeOutCnt;

// BINARY ENCODED state machine: rwBlkSt
// State codes definitions:
`define ST_RW_SD 6'b000000
`define WR_CMD_SEND_CMD 6'b000001
`define WR_CMD_WT_FIN 6'b000010
`define WR_CMD_DEL 6'b000011
`define WT_REQ 6'b000100
`define WR_TOKEN_FF1_FIN 6'b000101
`define WR_TOKEN_FF1_ST 6'b000110
`define WR_TOKEN_FF2_FIN 6'b000111
`define WR_TOKEN_FF2_ST 6'b001000
`define WR_TOKEN_FE_FIN 6'b001001
`define WR_TOKEN_FE_ST 6'b001010
`define WR_DATA_D_FIN 6'b001011
`define WR_DATA_D_ST 6'b001100
`define WR_DATA_RD_FIFO1 6'b001101
`define WR_DATA_RD_FIFO2 6'b001110
`define WR_DATA_LOOP_INIT 6'b001111
`define WR_DATA_CS_ST1 6'b010000
`define WR_DATA_CS_FIN1 6'b010001
`define WR_DATA_CS_FIN2 6'b010010
`define WR_DATA_CS_ST2 6'b010011
`define WR_DATA_CHK_RESP 6'b010100
`define WR_DATA_REQ_RESP_ST 6'b010101
`define WR_DATA_REQ_RESP_FIN 6'b010110
`define RD_CMD_SEND_CMD 6'b010111
`define RD_CMD_WT_FIN 6'b011000
`define RD_CMD_DEL 6'b011001
`define RD_TOKEN_CHK_LOOP 6'b011010
`define RD_TOKEN_WT_FIN 6'b011011
`define RD_TOKEN_SEND_CMD 6'b011100
`define RD_TOKEN_DEL2 6'b011101
`define RD_TOKEN_INIT_LOOP 6'b011110
`define RD_TOKEN_DEL1 6'b011111
`define RD_DATA_ST_LOOP 6'b100000
`define RD_DATA_WT_DATA 6'b100001
`define RD_DATA_CHK_LOOP 6'b100010
`define RD_DATA_CLR_RX 6'b100011
`define RD_DATA_CS_FIN2 6'b100100
`define RD_DATA_CS_FIN1 6'b100101
`define RD_DATA_CS_ST1 6'b100110
`define RD_DATA_CS_ST2 6'b100111
`define WR_BUSY_CHK_FIN 6'b101000
`define WR_BUSY_WT_FIN1 6'b101001
`define WR_BUSY_DEL1 6'b101010
`define WR_BUSY_SEND_CMD1 6'b101011
`define WR_BUSY_DEL2 6'b101100
`define WR_BUSY_INIT_LOOP 6'b101101
`define RD_TOKEN_DEL3 6'b101110
`define WR_DATA_DEL 6'b101111

reg [5:0]CurrState_rwBlkSt, NextState_rwBlkSt;

// Diagram actions (continuous assignments allowed only: assign ...)
// diagram ACTION


// Machine: rwBlkSt

// NextState logic (combinatorial)
always @ (blockAddr or sendCmdRdy or respTout or respByte or readWriteSDBlockReq or txDataFull or loopCnt or txFifoData or txDataEmpty or timeOutCnt or locRespByte or rxDataRdy or rxDataIn or delCnt1 or delCnt2 or readWriteSDBlockRdy or spiCS_n or readError or writeError or txDataOut or txDataWen or rxDataRdyClr or cmdByte or dataByte1 or dataByte2 or dataByte3 or dataByte4 or checkSumByte or sendCmdReq or txFifoRen or rxFifoWen or rxFifoData or CurrState_rwBlkSt)
begin
  NextState_rwBlkSt <= CurrState_rwBlkSt;
  // Set default values for outputs and signals
  next_readWriteSDBlockRdy <= readWriteSDBlockRdy;
  next_spiCS_n <= spiCS_n;
  next_readError <= readError;
  next_writeError <= writeError;
  next_txDataOut <= txDataOut;
  next_txDataWen <= txDataWen;
  next_rxDataRdyClr <= rxDataRdyClr;
  next_cmdByte <= cmdByte;
  next_dataByte1 <= dataByte1;
  next_dataByte2 <= dataByte2;
  next_dataByte3 <= dataByte3;
  next_dataByte4 <= dataByte4;
  next_checkSumByte <= checkSumByte;
  next_sendCmdReq <= sendCmdReq;
  next_loopCnt <= loopCnt;
  next_delCnt1 <= delCnt1;
  next_delCnt2 <= delCnt2;
  next_txFifoRen <= txFifoRen;
  next_rxFifoWen <= rxFifoWen;
  next_rxFifoData <= rxFifoData;
  next_timeOutCnt <= timeOutCnt;
  next_locRespByte <= locRespByte;
  case (CurrState_rwBlkSt)  // synopsys parallel_case full_case
    `ST_RW_SD:
    begin
      next_readWriteSDBlockRdy <= 1'b0;
      next_spiCS_n <= 1'b1;
      next_readError <= 1'b0;
      next_writeError <= 1'b0;
      next_txDataOut <= 8'h00;
      next_txDataWen <= 1'b0;
      next_rxDataRdyClr <= 1'b0;
      next_cmdByte <= 8'h00;
      next_dataByte1 <= 8'h00;
      next_dataByte2 <= 8'h00;
      next_dataByte3 <= 8'h00;
      next_dataByte4 <= 8'h00;
      next_checkSumByte <= 8'h00;
      next_sendCmdReq <= 1'b0;
      next_loopCnt <= 8'h00;
      next_delCnt1 <= 8'h00;
      next_delCnt2 <= 8'h00;
      next_readError <= `READ_NO_ERROR;
      next_writeError <= `WRITE_NO_ERROR;
      next_txFifoRen <= 1'b0;
      next_rxFifoWen <= 1'b0;
      next_rxFifoData <= 8'h00;
      next_timeOutCnt <= 12'h000;
      next_locRespByte <= 8'h00;
      NextState_rwBlkSt <= `WT_REQ;
    end
    `WT_REQ:
    begin
      next_spiCS_n <= 1'b1;
      next_readWriteSDBlockRdy <= 1'b1;
      next_cmdByte <= 8'h00;
      next_dataByte1 <= 8'h00;
      next_dataByte2 <= 8'h00;
      next_dataByte3 <= 8'h00;
      next_dataByte4 <= 8'h00;
      next_checkSumByte <= 8'h00;
      if (readWriteSDBlockReq == `READ_SD_BLOCK)
      begin
        NextState_rwBlkSt <= `RD_CMD_SEND_CMD;
        next_spiCS_n <= 1'b0;
        next_readWriteSDBlockRdy <= 1'b0;
        next_readError <= `READ_NO_ERROR;
      end
      else if (readWriteSDBlockReq == `WRITE_SD_BLOCK)
      begin
        NextState_rwBlkSt <= `WR_CMD_SEND_CMD;
        next_spiCS_n <= 1'b0;
        next_readWriteSDBlockRdy <= 1'b0;
        next_writeError <= `WRITE_NO_ERROR;
      end
    end
    `WR_CMD_SEND_CMD:
    begin
      next_cmdByte <= 8'h58;
      //CMD24 Block Write
      next_dataByte1 <= blockAddr[31:24];
      next_dataByte2 <= blockAddr[23:16];
      next_dataByte3 <= blockAddr[15:8];
      next_dataByte4 <= blockAddr[7:0];
      next_checkSumByte <= 8'hff;
      next_sendCmdReq <= 1'b1;
      NextState_rwBlkSt <= `WR_CMD_DEL;
    end
    `WR_CMD_WT_FIN:
    begin
      if ((sendCmdRdy == 1'b1) && (respTout == 1'b1 || respByte != 8'h00))
      begin
        NextState_rwBlkSt <= `WT_REQ;
        next_writeError <= `WRITE_CMD_ERROR;
      end
      else if (sendCmdRdy == 1'b1)
      begin
        NextState_rwBlkSt <= `WR_TOKEN_FF1_ST;
      end
    end
    `WR_CMD_DEL:
    begin
      next_sendCmdReq <= 1'b0;
      NextState_rwBlkSt <= `WR_CMD_WT_FIN;
    end
    `WR_TOKEN_FF1_FIN:
    begin
      next_txDataWen <= 1'b0;
      NextState_rwBlkSt <= `WR_TOKEN_FF2_ST;
    end
    `WR_TOKEN_FF1_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_rwBlkSt <= `WR_TOKEN_FF1_FIN;
        next_txDataOut <= 8'hff;
        next_txDataWen <= 1'b1;
      end
    end
    `WR_TOKEN_FF2_FIN:
    begin
      next_txDataWen <= 1'b0;
      NextState_rwBlkSt <= `WR_TOKEN_FE_ST;
    end
    `WR_TOKEN_FF2_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_rwBlkSt <= `WR_TOKEN_FF2_FIN;
        next_txDataOut <= 8'hff;
        next_txDataWen <= 1'b1;
      end
    end
    `WR_TOKEN_FE_FIN:
    begin
      next_txDataWen <= 1'b0;
      NextState_rwBlkSt <= `WR_DATA_LOOP_INIT;
    end
    `WR_TOKEN_FE_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_rwBlkSt <= `WR_TOKEN_FE_FIN;
        next_txDataOut <= 8'hfe;
        next_txDataWen <= 1'b1;
      end
    end
    `WR_BUSY_CHK_FIN:
    begin
      if (locRespByte == 8'h00 && timeOutCnt != `TWO_FIFTY_MS)
      begin
        NextState_rwBlkSt <= `WR_BUSY_SEND_CMD1;
        next_timeOutCnt <= timeOutCnt + 1'b1;
      end
      else if (timeOutCnt == `TWO_FIFTY_MS)
      begin
        NextState_rwBlkSt <= `WT_REQ;
        next_writeError <= `WRITE_BUSY_ERROR;
      end
      else
      begin
        NextState_rwBlkSt <= `WT_REQ;
      end
    end
    `WR_BUSY_WT_FIN1:
    begin
      if (rxDataRdy == 1'b1)
      begin
        NextState_rwBlkSt <= `WR_BUSY_CHK_FIN;
        next_locRespByte <= rxDataIn;
      end
    end
    `WR_BUSY_DEL1:
    begin
      next_txDataWen <= 1'b0;
      next_rxDataRdyClr <= 1'b0;
      next_delCnt1 <= delCnt1 + 1'b1;
      next_delCnt2 <= 8'h00;
      if (delCnt1 == `MAX_8_BIT)
      begin
        NextState_rwBlkSt <= `WR_BUSY_WT_FIN1;
      end
      else
      begin
        NextState_rwBlkSt <= `WR_BUSY_DEL2;
      end
    end
    `WR_BUSY_SEND_CMD1:
    begin
      next_txDataOut <= 8'hff;
      next_txDataWen <= 1'b1;
      next_rxDataRdyClr <= 1'b1;
      next_delCnt1 <= 8'h00;
      NextState_rwBlkSt <= `WR_BUSY_DEL1;
    end
    `WR_BUSY_DEL2:
    begin
      next_delCnt2 <= delCnt2 + 1'b1;
      if (delCnt2 == 8'hff)
      begin
        NextState_rwBlkSt <= `WR_BUSY_DEL1;
      end
    end
    `WR_BUSY_INIT_LOOP:
    begin
      next_timeOutCnt <= 12'h000;
      NextState_rwBlkSt <= `WR_BUSY_SEND_CMD1;
    end
    `RD_CMD_SEND_CMD:
    begin
      next_cmdByte <= 8'h51;
      //CMD17 Block Read
      next_dataByte1 <= blockAddr[31:24];
      next_dataByte2 <= blockAddr[23:16];
      next_dataByte3 <= blockAddr[15:8];
      next_dataByte4 <= blockAddr[7:0];
      next_checkSumByte <= 8'hff;
      next_sendCmdReq <= 1'b1;
      NextState_rwBlkSt <= `RD_CMD_DEL;
    end
    `RD_CMD_WT_FIN:
    begin
      if ((sendCmdRdy == 1'b1) && (respTout == 1'b1 || respByte != 8'h00))
      begin
        NextState_rwBlkSt <= `WT_REQ;
        next_readError <= `READ_CMD_ERROR;
      end
      else if (sendCmdRdy == 1'b1)
      begin
        NextState_rwBlkSt <= `RD_TOKEN_INIT_LOOP;
      end
    end
    `RD_CMD_DEL:
    begin
      next_sendCmdReq <= 1'b0;
      NextState_rwBlkSt <= `RD_CMD_WT_FIN;
    end
    `RD_TOKEN_CHK_LOOP:
    begin
      if (locRespByte != 8'hfe && timeOutCnt != `ONE_HUNDRED_MS)
      begin
        NextState_rwBlkSt <= `RD_TOKEN_DEL2;
        next_timeOutCnt <= timeOutCnt + 1'b1;
        next_delCnt1 <= 8'h00;
      end
      else if (timeOutCnt == `ONE_HUNDRED_MS)
      begin
        NextState_rwBlkSt <= `WT_REQ;
        next_readError <= `READ_TOKEN_ERROR;
      end
      else
      begin
        NextState_rwBlkSt <= `RD_DATA_CLR_RX;
        next_rxDataRdyClr <= 1'b1;
      end
    end
    `RD_TOKEN_WT_FIN:
    begin
      if (rxDataRdy == 1'b1)
      begin
        NextState_rwBlkSt <= `RD_TOKEN_CHK_LOOP;
        next_locRespByte <= rxDataIn;
      end
    end
    `RD_TOKEN_SEND_CMD:
    begin
      next_txDataOut <= 8'hff;
      next_txDataWen <= 1'b1;
      next_rxDataRdyClr <= 1'b1;
      NextState_rwBlkSt <= `RD_TOKEN_DEL1;
    end
    `RD_TOKEN_DEL2:
    begin
      next_delCnt1 <= delCnt1 + 1'b1;
      next_delCnt2 <= 8'h00;
      if (delCnt1 == `MAX_8_BIT)
      begin
        NextState_rwBlkSt <= `RD_TOKEN_SEND_CMD;
      end
      else
      begin
        NextState_rwBlkSt <= `RD_TOKEN_DEL3;
      end
    end
    `RD_TOKEN_INIT_LOOP:
    begin
      next_timeOutCnt <= 12'h000;
      NextState_rwBlkSt <= `RD_TOKEN_SEND_CMD;
    end
    `RD_TOKEN_DEL1:
    begin
      next_txDataWen <= 1'b0;
      next_rxDataRdyClr <= 1'b0;
      NextState_rwBlkSt <= `RD_TOKEN_WT_FIN;
    end
    `RD_TOKEN_DEL3:
    begin
      next_delCnt2 <= delCnt2 + 1'b1;
      if (delCnt2 == 8'hff)
      begin
        NextState_rwBlkSt <= `RD_TOKEN_DEL2;
      end
    end
    `RD_DATA_ST_LOOP:
    begin
      next_txDataWen <= 1'b1;
      next_txDataOut <= 8'hff;
      next_loopCnt <= loopCnt + 1'b1;
      NextState_rwBlkSt <= `RD_DATA_WT_DATA;
    end
    `RD_DATA_WT_DATA:
    begin
      next_txDataWen <= 1'b0;
      if (rxDataRdy == 1'b1)
      begin
        NextState_rwBlkSt <= `RD_DATA_CHK_LOOP;
        next_rxFifoWen <= 1'b1;
        next_rxDataRdyClr <= 1'b1;
        next_rxFifoData <= rxDataIn;
      end
    end
    `RD_DATA_CHK_LOOP:
    begin
      if (loopCnt == 9'b000000000)
      begin
        NextState_rwBlkSt <= `RD_DATA_CS_ST1;
        next_rxDataRdyClr <= 1'b0;
        next_rxFifoWen <= 1'b0;
      end
      else
      begin
        NextState_rwBlkSt <= `RD_DATA_ST_LOOP;
        next_rxDataRdyClr <= 1'b0;
        next_rxFifoWen <= 1'b0;
      end
    end
    `RD_DATA_CLR_RX:
    begin
      NextState_rwBlkSt <= `RD_DATA_ST_LOOP;
      next_rxDataRdyClr <= 1'b0;
      next_loopCnt <= 9'b000000000;
    end
    `RD_DATA_CS_FIN2:
    begin
      next_txDataWen <= 1'b0;
      if (txDataEmpty == 1'b1)
      begin
        NextState_rwBlkSt <= `WT_REQ;
      end
    end
    `RD_DATA_CS_FIN1:
    begin
      next_txDataWen <= 1'b0;
      NextState_rwBlkSt <= `RD_DATA_CS_ST2;
    end
    `RD_DATA_CS_ST1:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_rwBlkSt <= `RD_DATA_CS_FIN1;
        next_txDataOut <= 8'hff;
        next_txDataWen <= 1'b1;
      end
    end
    `RD_DATA_CS_ST2:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_rwBlkSt <= `RD_DATA_CS_FIN2;
        next_txDataOut <= 8'hff;
        next_txDataWen <= 1'b1;
      end
    end
    `WR_DATA_D_FIN:
    begin
      next_txDataWen <= 1'b0;
      if (loopCnt == 9'b000000000)
      begin
        NextState_rwBlkSt <= `WR_DATA_CS_ST1;
      end
      else
      begin
        NextState_rwBlkSt <= `WR_DATA_RD_FIFO1;
      end
    end
    `WR_DATA_D_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_rwBlkSt <= `WR_DATA_D_FIN;
        next_txDataOut <= txFifoData;
        next_txDataWen <= 1'b1;
      end
    end
    `WR_DATA_RD_FIFO1:
    begin
      next_txFifoRen <= 1'b1;
      next_loopCnt <= loopCnt + 1'b1;
      NextState_rwBlkSt <= `WR_DATA_RD_FIFO2;
    end
    `WR_DATA_RD_FIFO2:
    begin
      next_txFifoRen <= 1'b0;
      NextState_rwBlkSt <= `WR_DATA_D_ST;
    end
    `WR_DATA_LOOP_INIT:
    begin
      next_loopCnt <= 9'b000000000;
      NextState_rwBlkSt <= `WR_DATA_RD_FIFO1;
    end
    `WR_DATA_CS_ST1:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_rwBlkSt <= `WR_DATA_CS_FIN1;
        next_txDataOut <= 8'hff;
        next_txDataWen <= 1'b1;
      end
    end
    `WR_DATA_CS_FIN1:
    begin
      next_txDataWen <= 1'b0;
      NextState_rwBlkSt <= `WR_DATA_CS_ST2;
    end
    `WR_DATA_CS_FIN2:
    begin
      next_txDataWen <= 1'b0;
      next_timeOutCnt <= 12'h000;
      if (txDataEmpty == 1'b1)
      begin
        NextState_rwBlkSt <= `WR_DATA_REQ_RESP_ST;
      end
    end
    `WR_DATA_CS_ST2:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_rwBlkSt <= `WR_DATA_CS_FIN2;
        next_txDataOut <= 8'hff;
        next_txDataWen <= 1'b1;
      end
    end
    `WR_DATA_CHK_RESP:
    begin
      if (timeOutCnt == `WR_RESP_TOUT)
      begin
        NextState_rwBlkSt <= `WT_REQ;
        next_writeError <= `WRITE_DATA_ERROR;
      end
      else if (locRespByte[4:0] == 5'h5)
      begin
        NextState_rwBlkSt <= `WR_BUSY_INIT_LOOP;
      end
      else
      begin
        NextState_rwBlkSt <= `WR_DATA_REQ_RESP_ST;
      end
    end
    `WR_DATA_REQ_RESP_ST:
    begin
      NextState_rwBlkSt <= `WR_DATA_DEL;
      next_txDataOut <= 8'hff;
      next_txDataWen <= 1'b1;
      next_timeOutCnt <= timeOutCnt + 1'b1;
      next_rxDataRdyClr <= 1'b1;
    end
    `WR_DATA_REQ_RESP_FIN:
    begin
      if (rxDataRdy == 1'b1)
      begin
        NextState_rwBlkSt <= `WR_DATA_CHK_RESP;
        next_locRespByte <= rxDataIn;
      end
    end
    `WR_DATA_DEL:
    begin
      NextState_rwBlkSt <= `WR_DATA_REQ_RESP_FIN;
      next_txDataWen <= 1'b0;
      next_rxDataRdyClr <= 1'b0;
    end
  endcase
end

// Current State Logic (sequential)
always @ (posedge clk)
begin
  if (rst == 1'b1)
    CurrState_rwBlkSt <= `ST_RW_SD;
  else
    CurrState_rwBlkSt <= NextState_rwBlkSt;
end

// Registered outputs logic
always @ (posedge clk)
begin
  if (rst == 1'b1)
  begin
    readWriteSDBlockRdy <= 1'b0;
    spiCS_n <= 1'b1;
    readError <= 1'b0;
    writeError <= 1'b0;
    txDataOut <= 8'h00;
    txDataWen <= 1'b0;
    rxDataRdyClr <= 1'b0;
    cmdByte <= 8'h00;
    dataByte1 <= 8'h00;
    dataByte2 <= 8'h00;
    dataByte3 <= 8'h00;
    dataByte4 <= 8'h00;
    checkSumByte <= 8'h00;
    sendCmdReq <= 1'b0;
    txFifoRen <= 1'b0;
    rxFifoWen <= 1'b0;
    rxFifoData <= 8'h00;
    loopCnt <= 8'h00;
    delCnt1 <= 8'h00;
    delCnt2 <= 8'h00;
    timeOutCnt <= 12'h000;
    locRespByte <= 8'h00;
  end
  else 
  begin
    readWriteSDBlockRdy <= next_readWriteSDBlockRdy;
    spiCS_n <= next_spiCS_n;
    readError <= next_readError;
    writeError <= next_writeError;
    txDataOut <= next_txDataOut;
    txDataWen <= next_txDataWen;
    rxDataRdyClr <= next_rxDataRdyClr;
    cmdByte <= next_cmdByte;
    dataByte1 <= next_dataByte1;
    dataByte2 <= next_dataByte2;
    dataByte3 <= next_dataByte3;
    dataByte4 <= next_dataByte4;
    checkSumByte <= next_checkSumByte;
    sendCmdReq <= next_sendCmdReq;
    txFifoRen <= next_txFifoRen;
    rxFifoWen <= next_rxFifoWen;
    rxFifoData <= next_rxFifoData;
    loopCnt <= next_loopCnt;
    delCnt1 <= next_delCnt1;
    delCnt2 <= next_delCnt2;
    timeOutCnt <= next_timeOutCnt;
    locRespByte <= next_locRespByte;
  end
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// readWriteSPIWireData.v                      ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// Wait for TX data bytes. When data is ready generate
////  SPI TX data, SPI CLK, and read SPI RX data
//// 
////                                                              ////
//// To Do:                                                       ////
//// 
////                                                              ////
//// Author(s):                                                   ////
//// - Steve Fielding, sfielding@base2designs.com                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2004 Steve Fielding and OPENCORES.ORG          ////
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
`include "spiMaster_defines.v"

module readWriteSPIWireData (clk, clkDelay, rst, rxDataOut, rxDataRdySet, spiClkOut, spiDataIn, spiDataOut, txDataEmpty, txDataFull, txDataFullClr, txDataIn);
input   clk;
input   [7:0]clkDelay;
input   rst;
input   spiDataIn;
input   txDataFull;
input   [7:0]txDataIn;
output  [7:0]rxDataOut;
output  rxDataRdySet;
output  spiClkOut;
output  spiDataOut;
output  txDataEmpty;
output  txDataFullClr;

wire    clk;
wire    [7:0]clkDelay;
wire    rst;
reg     [7:0]rxDataOut, next_rxDataOut;
reg     rxDataRdySet, next_rxDataRdySet;
reg     spiClkOut, next_spiClkOut;
wire    spiDataIn;
reg     spiDataOut, next_spiDataOut;
reg     txDataEmpty, next_txDataEmpty;
wire    txDataFull;
reg     txDataFullClr, next_txDataFullClr;
wire    [7:0]txDataIn;

// diagram signals declarations
reg  [3:0]bitCnt, next_bitCnt;
reg  [7:0]clkDelayCnt, next_clkDelayCnt;
reg  [7:0]rxDataShiftReg, next_rxDataShiftReg;
reg  [7:0]txDataShiftReg, next_txDataShiftReg;

// BINARY ENCODED state machine: rwSPISt
// State codes definitions:
`define WT_TX_DATA 2'b00
`define CLK_HI 2'b01
`define CLK_LO 2'b10
`define ST_RW_WIRE 2'b11

reg [1:0]CurrState_rwSPISt, NextState_rwSPISt;

// Diagram actions (continuous assignments allowed only: assign ...)
// diagram ACTION


// Machine: rwSPISt

// NextState logic (combinatorial)
always @ (txDataFull or txDataIn or clkDelayCnt or clkDelay or txDataShiftReg or rxDataShiftReg or spiDataIn or bitCnt or rxDataRdySet or txDataEmpty or txDataFullClr or spiClkOut or spiDataOut or rxDataOut or CurrState_rwSPISt)
begin
  NextState_rwSPISt <= CurrState_rwSPISt;
  // Set default values for outputs and signals
  next_rxDataRdySet <= rxDataRdySet;
  next_txDataEmpty <= txDataEmpty;
  next_txDataShiftReg <= txDataShiftReg;
  next_rxDataShiftReg <= rxDataShiftReg;
  next_bitCnt <= bitCnt;
  next_clkDelayCnt <= clkDelayCnt;
  next_txDataFullClr <= txDataFullClr;
  next_spiClkOut <= spiClkOut;
  next_spiDataOut <= spiDataOut;
  next_rxDataOut <= rxDataOut;
  case (CurrState_rwSPISt)  // synopsys parallel_case full_case
    `WT_TX_DATA:
    begin
      next_rxDataRdySet <= 1'b0;
      next_txDataEmpty <= 1'b1;
      if (txDataFull == 1'b1)
      begin
        NextState_rwSPISt <= `CLK_HI;
        next_txDataShiftReg <= txDataIn;
        next_rxDataShiftReg <= 8'h00;
        next_bitCnt <= 4'h0;
        next_clkDelayCnt <= 8'h00;
        next_txDataFullClr <= 1'b1;
        next_txDataEmpty <= 1'b0;
      end
    end
    `CLK_HI:
    begin
      next_clkDelayCnt <= clkDelayCnt + 1'b1;
      next_txDataFullClr <= 1'b0;
      next_rxDataRdySet <= 1'b0;
      if (clkDelayCnt == clkDelay)
      begin
        NextState_rwSPISt <= `CLK_LO;
        next_spiClkOut <= 1'b0;
        next_spiDataOut <= txDataShiftReg[7];
        next_txDataShiftReg <= {txDataShiftReg[6:0], 1'b0};
        next_rxDataShiftReg <= {rxDataShiftReg[6:0], spiDataIn};
        next_clkDelayCnt <= 8'h00;
      end
    end
    `CLK_LO:
    begin
      next_clkDelayCnt <= clkDelayCnt + 1'b1;
      if ((bitCnt == 4'h8) && (txDataFull == 1'b1))
      begin
        NextState_rwSPISt <= `CLK_HI;
        next_rxDataRdySet <= 1'b1;
        next_rxDataOut <= rxDataShiftReg;
        next_txDataShiftReg <= txDataIn;
        next_bitCnt <= 3'b000;
        next_clkDelayCnt <= 8'h00;
        next_txDataFullClr <= 1'b1;
      end
      else if (bitCnt == 4'h8)
      begin
        NextState_rwSPISt <= `WT_TX_DATA;
        next_rxDataRdySet <= 1'b1;
        next_rxDataOut <= rxDataShiftReg;
      end
      else if (clkDelayCnt == clkDelay)
      begin
        NextState_rwSPISt <= `CLK_HI;
        next_spiClkOut <= 1'b1;
        next_bitCnt <= bitCnt + 1'b1;
        next_clkDelayCnt <= 8'h00;
      end
    end
    `ST_RW_WIRE:
    begin
      next_bitCnt <= 4'h0;
      next_clkDelayCnt <= 8'h00;
      next_txDataFullClr <= 1'b0;
      next_rxDataRdySet <= 1'b0;
      next_txDataShiftReg <= 8'h00;
      next_rxDataShiftReg <= 8'h00;
      next_rxDataOut <= 8'h00;
      next_spiDataOut <= 1'b0;
      next_spiClkOut <= 1'b0;
      next_txDataEmpty <= 1'b0;
      NextState_rwSPISt <= `WT_TX_DATA;
    end
  endcase
end

// Current State Logic (sequential)
always @ (posedge clk)
begin
  if (rst == 1'b1)
    CurrState_rwSPISt <= `ST_RW_WIRE;
  else
    CurrState_rwSPISt <= NextState_rwSPISt;
end

// Registered outputs logic
always @ (posedge clk)
begin
  if (rst == 1'b1)
  begin
    rxDataRdySet <= 1'b0;
    txDataEmpty <= 1'b0;
    txDataFullClr <= 1'b0;
    spiClkOut <= 1'b0;
    spiDataOut <= 1'b0;
    rxDataOut <= 8'h00;
    txDataShiftReg <= 8'h00;
    rxDataShiftReg <= 8'h00;
    bitCnt <= 4'h0;
    clkDelayCnt <= 8'h00;
  end
  else 
  begin
    rxDataRdySet <= next_rxDataRdySet;
    txDataEmpty <= next_txDataEmpty;
    txDataFullClr <= next_txDataFullClr;
    spiClkOut <= next_spiClkOut;
    spiDataOut <= next_spiDataOut;
    rxDataOut <= next_rxDataOut;
    txDataShiftReg <= next_txDataShiftReg;
    rxDataShiftReg <= next_rxDataShiftReg;
    bitCnt <= next_bitCnt;
    clkDelayCnt <= next_clkDelayCnt;
  end
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sendCmd.v                                           ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  If sendCmdReq asserted, then send command to 
////  SD card. Command consists of command byte,
////  4 data bytes, and a checksum byte. 
//// Waits for response byte from SD card
////  or times out if no response
////                                                              ////
//// To Do:                                                       ////
//// 
////                                                              ////
//// Author(s):                                                   ////
//// - Steve Fielding, sfielding@base2designs.com                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2004 Steve Fielding and OPENCORES.ORG          ////
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


module sendCmd (checkSumByte_1, checkSumByte_2, clk, cmdByte_1, cmdByte_2, dataByte1_1, dataByte1_2, dataByte2_1, dataByte2_2, dataByte3_1, dataByte3_2, dataByte4_1, dataByte4_2, respByte, respTout, rst, rxDataIn, rxDataRdy, rxDataRdyClr, sendCmdRdy, sendCmdReq1, sendCmdReq2, txDataEmpty, txDataFull, txDataOut, txDataWen);
input   [7:0]checkSumByte_1;
input   [7:0]checkSumByte_2;
input   clk;
input   [7:0]cmdByte_1;
input   [7:0]cmdByte_2;
input   [7:0]dataByte1_1;
input   [7:0]dataByte1_2;
input   [7:0]dataByte2_1;
input   [7:0]dataByte2_2;
input   [7:0]dataByte3_1;
input   [7:0]dataByte3_2;
input   [7:0]dataByte4_1;
input   [7:0]dataByte4_2;
input   rst;
input   [7:0]rxDataIn;
input   rxDataRdy;
input   sendCmdReq1;
input   sendCmdReq2;
input   txDataEmpty;
input   txDataFull;
output  [7:0]respByte;
output  respTout;
output  rxDataRdyClr;
output  sendCmdRdy;
output  [7:0]txDataOut;
output  txDataWen;

wire    [7:0]checkSumByte_1;
wire    [7:0]checkSumByte_2;
wire    clk;
wire    [7:0]cmdByte_1;
wire    [7:0]cmdByte_2;
wire    [7:0]dataByte1_1;
wire    [7:0]dataByte1_2;
wire    [7:0]dataByte2_1;
wire    [7:0]dataByte2_2;
wire    [7:0]dataByte3_1;
wire    [7:0]dataByte3_2;
wire    [7:0]dataByte4_1;
wire    [7:0]dataByte4_2;
reg     [7:0]respByte, next_respByte;
reg     respTout, next_respTout;
wire    rst;
wire    [7:0]rxDataIn;
wire    rxDataRdy;
reg     rxDataRdyClr, next_rxDataRdyClr;
reg     sendCmdRdy, next_sendCmdRdy;
wire    sendCmdReq1;
wire    sendCmdReq2;
wire    txDataEmpty;
wire    txDataFull;
reg     [7:0]txDataOut, next_txDataOut;
reg     txDataWen, next_txDataWen;

// diagram signals declarations
reg  [7:0]checkSumByte, next_checkSumByte;
reg  [7:0]cmdByte, next_cmdByte;
reg  [7:0]dataByte1, next_dataByte1;
reg  [7:0]dataByte2, next_dataByte2;
reg  [7:0]dataByte3, next_dataByte3;
reg  [7:0]dataByte4, next_dataByte4;
reg sendCmdReq, next_sendCmdReq;
reg  [9:0]timeOutCnt, next_timeOutCnt;

// BINARY ENCODED state machine: sndCmdSt
// State codes definitions:
`define CMD_D_BYTE2_FIN 5'b00000
`define CMD_D_BYTE2_ST 5'b00001
`define CMD_SEND_FF_FIN 5'b00010
`define CMD_CMD_BYTE_FIN 5'b00011
`define CMD_D_BYTE1_FIN 5'b00100
`define CMD_REQ_RESP_ST 5'b00101
`define CMD_REQ_RESP_FIN 5'b00110
`define CMD_CHK_RESP 5'b00111
`define CMD_D_BYTE1_ST 5'b01000
`define CMD_D_BYTE3_FIN 5'b01001
`define CMD_D_BYTE3_ST 5'b01010
`define CMD_D_BYTE4_FIN 5'b01011
`define CMD_D_BYTE4_ST 5'b01100
`define CMD_CS_FIN 5'b01101
`define CMD_CS_ST 5'b01110
`define CMD_SEND_FF_ST 5'b01111
`define CMD_CMD_BYTE_ST 5'b10000
`define WT_CMD 5'b10001
`define ST_S_CMD 5'b10010
`define CMD_DEL 5'b10011

reg [4:0]CurrState_sndCmdSt, NextState_sndCmdSt;

// Diagram actions (continuous assignments allowed only: assign ...)
// diagram ACTION
always @(sendCmdReq1 or sendCmdReq2 ) begin
sendCmdReq <= sendCmdReq1 | sendCmdReq2;
end
always @(posedge clk) begin
cmdByte <= cmdByte_1 | cmdByte_2;
dataByte1 <= dataByte1_1 | dataByte1_2;
dataByte2 <= dataByte2_1 | dataByte2_2;
dataByte3 <= dataByte3_1 | dataByte3_2;
dataByte4 <= dataByte4_1 | dataByte4_2;
checkSumByte <= checkSumByte_1 | checkSumByte_2;
end


// Machine: sndCmdSt

// NextState logic (combinatorial)
always @ (txDataFull or dataByte2 or timeOutCnt or rxDataRdy or rxDataIn or respByte or dataByte1 or dataByte3 or dataByte4 or txDataEmpty or checkSumByte or cmdByte or sendCmdReq or txDataWen or txDataOut or rxDataRdyClr or respTout or sendCmdRdy or CurrState_sndCmdSt)
begin
  NextState_sndCmdSt <= CurrState_sndCmdSt;
  // Set default values for outputs and signals
  next_txDataWen <= txDataWen;
  next_txDataOut <= txDataOut;
  next_timeOutCnt <= timeOutCnt;
  next_rxDataRdyClr <= rxDataRdyClr;
  next_respByte <= respByte;
  next_respTout <= respTout;
  next_sendCmdRdy <= sendCmdRdy;
  case (CurrState_sndCmdSt)  // synopsys parallel_case full_case
    `WT_CMD:
    begin
      next_sendCmdRdy <= 1'b1;
      if (sendCmdReq == 1'b1)
      begin
        NextState_sndCmdSt <= `CMD_SEND_FF_ST;
        next_sendCmdRdy <= 1'b0;
        next_respTout <= 1'b0;
      end
    end
    `ST_S_CMD:
    begin
      next_sendCmdRdy <= 1'b0;
      next_txDataWen <= 1'b0;
      next_txDataOut <= 8'h00;
      next_rxDataRdyClr <= 1'b0;
      next_respByte <= 8'h00;
      next_respTout <= 1'b0;
      next_timeOutCnt <= 10'h000;
      NextState_sndCmdSt <= `WT_CMD;
    end
    `CMD_D_BYTE2_FIN:
    begin
      next_txDataWen <= 1'b0;
      NextState_sndCmdSt <= `CMD_D_BYTE3_ST;
    end
    `CMD_D_BYTE2_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_sndCmdSt <= `CMD_D_BYTE2_FIN;
        next_txDataOut <= dataByte2;
        next_txDataWen <= 1'b1;
      end
    end
    `CMD_SEND_FF_FIN:
    begin
      NextState_sndCmdSt <= `CMD_CMD_BYTE_ST;
    end
    `CMD_CMD_BYTE_FIN:
    begin
      next_txDataWen <= 1'b0;
      NextState_sndCmdSt <= `CMD_D_BYTE1_ST;
    end
    `CMD_D_BYTE1_FIN:
    begin
      next_txDataWen <= 1'b0;
      NextState_sndCmdSt <= `CMD_D_BYTE2_ST;
    end
    `CMD_REQ_RESP_ST:
    begin
      NextState_sndCmdSt <= `CMD_DEL;
      next_txDataOut <= 8'hff;
      next_txDataWen <= 1'b1;
      next_timeOutCnt <= timeOutCnt + 1'b1;
      next_rxDataRdyClr <= 1'b1;
    end
    `CMD_REQ_RESP_FIN:
    begin
      if (rxDataRdy == 1'b1)
      begin
        NextState_sndCmdSt <= `CMD_CHK_RESP;
        next_respByte <= rxDataIn;
      end
    end
    `CMD_CHK_RESP:
    begin
      if (timeOutCnt == 10'h200)
      begin
        NextState_sndCmdSt <= `WT_CMD;
        next_respTout <= 1'b1;
      end
      else if (respByte[7] == 1'b0)
      begin
        NextState_sndCmdSt <= `WT_CMD;
      end
      else
      begin
        NextState_sndCmdSt <= `CMD_REQ_RESP_ST;
      end
    end
    `CMD_D_BYTE1_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_sndCmdSt <= `CMD_D_BYTE1_FIN;
        next_txDataOut <= dataByte1;
        next_txDataWen <= 1'b1;
      end
    end
    `CMD_D_BYTE3_FIN:
    begin
      next_txDataWen <= 1'b0;
      NextState_sndCmdSt <= `CMD_D_BYTE4_ST;
    end
    `CMD_D_BYTE3_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_sndCmdSt <= `CMD_D_BYTE3_FIN;
        next_txDataOut <= dataByte3;
        next_txDataWen <= 1'b1;
      end
    end
    `CMD_D_BYTE4_FIN:
    begin
      next_txDataWen <= 1'b0;
      NextState_sndCmdSt <= `CMD_CS_ST;
    end
    `CMD_D_BYTE4_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_sndCmdSt <= `CMD_D_BYTE4_FIN;
        next_txDataOut <= dataByte4;
        next_txDataWen <= 1'b1;
      end
    end
    `CMD_CS_FIN:
    begin
      next_txDataWen <= 1'b0;
      next_timeOutCnt <= 10'h000;
      if (txDataEmpty == 1'b1)
      begin
        NextState_sndCmdSt <= `CMD_REQ_RESP_ST;
      end
    end
    `CMD_CS_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_sndCmdSt <= `CMD_CS_FIN;
        next_txDataOut <= checkSumByte;
        next_txDataWen <= 1'b1;
      end
    end
    `CMD_SEND_FF_ST:
    begin
      if (txDataFull == 1'b0)
      begin
        NextState_sndCmdSt <= `CMD_SEND_FF_FIN;
        next_txDataOut <= 8'hff;
        next_txDataWen <= 1'b1;
      end
    end
    `CMD_CMD_BYTE_ST:
    begin
      next_txDataWen <= 1'b0;
      if (txDataFull == 1'b0)
      begin
        NextState_sndCmdSt <= `CMD_CMD_BYTE_FIN;
        next_txDataOut <= cmdByte;
        next_txDataWen <= 1'b1;
      end
    end
    `CMD_DEL:
    begin
      NextState_sndCmdSt <= `CMD_REQ_RESP_FIN;
      next_txDataWen <= 1'b0;
      next_rxDataRdyClr <= 1'b0;
    end
  endcase
end

// Current State Logic (sequential)
always @ (posedge clk)
begin
  if (rst == 1'b1)
    CurrState_sndCmdSt <= `ST_S_CMD;
  else
    CurrState_sndCmdSt <= NextState_sndCmdSt;
end

// Registered outputs logic
always @ (posedge clk)
begin
  if (rst == 1'b1)
  begin
    txDataWen <= 1'b0;
    txDataOut <= 8'h00;
    rxDataRdyClr <= 1'b0;
    respByte <= 8'h00;
    respTout <= 1'b0;
    sendCmdRdy <= 1'b0;
    timeOutCnt <= 10'h000;
  end
  else 
  begin
    txDataWen <= next_txDataWen;
    txDataOut <= next_txDataOut;
    rxDataRdyClr <= next_rxDataRdyClr;
    respByte <= next_respByte;
    respTout <= next_respTout;
    sendCmdRdy <= next_sendCmdRdy;
    timeOutCnt <= next_timeOutCnt;
  end
end

endmodule//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_dpMem_dc.v                                                ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// Synchronous dual port memory with dual clocks
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

module sm_dpMem_dc(  addrIn, addrOut, wrClk, rdClk, dataIn, writeEn, readEn, dataOut);
  //FIFO_DEPTH = ADDR_WIDTH^2
  parameter FIFO_WIDTH = 8;
  parameter FIFO_DEPTH = 64; 
  parameter ADDR_WIDTH = 6;   
  
input wrClk;
input rdClk;
input [FIFO_WIDTH-1:0] dataIn;
output [FIFO_WIDTH-1:0] dataOut;
input writeEn;
input readEn;
input [ADDR_WIDTH-1:0] addrIn;
input [ADDR_WIDTH-1:0] addrOut;

wire wrClk;
wire rdClk;
wire [FIFO_WIDTH-1:0] dataIn;
reg [FIFO_WIDTH-1:0] dataOut;
wire writeEn;
wire readEn;
wire [ADDR_WIDTH-1:0] addrIn;
wire [ADDR_WIDTH-1:0] addrOut;

reg [FIFO_WIDTH-1:0] buffer [0:FIFO_DEPTH-1];

// synchronous read. Introduces one clock cycle delay
always @(posedge rdClk) begin
  dataOut <= buffer[addrOut];
end

// synchronous write
always @(posedge wrClk) begin
  if (writeEn == 1'b1)
    buffer[addrIn] <= dataIn;
end                  


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_fifoRTL.v                                                 ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  parameterized dual clock domain fifo. 
////  fifo depth is restricted to 2^ADDR_WIDTH
////  No protection against over runs and under runs.
//// 
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

module sm_fifoRTL(wrClk, rdClk, rstSyncToWrClk, rstSyncToRdClk, dataIn, 
  dataOut, fifoWEn, fifoREn, fifoFull, fifoEmpty,
  forceEmptySyncToWrClk, forceEmptySyncToRdClk, numElementsInFifo);
//FIFO_DEPTH = ADDR_WIDTH^2. Min = 2, Max = 66536
  parameter FIFO_WIDTH = 8;
  parameter FIFO_DEPTH = 64; 
  parameter ADDR_WIDTH = 6;   

// Two clock domains within this module
// These ports are within 'wrClk' domain
input wrClk;
input rstSyncToWrClk;
input [FIFO_WIDTH-1:0] dataIn;
input fifoWEn;
input forceEmptySyncToWrClk;
output fifoFull;

// These ports are within 'rdClk' domain
input rdClk;
input rstSyncToRdClk;
output [FIFO_WIDTH-1:0] dataOut;
input fifoREn;
input forceEmptySyncToRdClk;
output fifoEmpty;
output [15:0]numElementsInFifo; //note that this implies a max fifo depth of 65536

wire wrClk;
wire rdClk;
wire rstSyncToWrClk;
wire rstSyncToRdClk;
wire [FIFO_WIDTH-1:0] dataIn;
reg [FIFO_WIDTH-1:0] dataOut;
wire fifoWEn;
wire fifoREn;
reg fifoFull;
reg fifoEmpty;
wire forceEmpty;
reg  [15:0]numElementsInFifo;


// local registers
reg  [ADDR_WIDTH:0]bufferInIndex; 
reg  [ADDR_WIDTH:0]bufferInIndexSyncToRdClk;
reg  [ADDR_WIDTH:0]bufferOutIndex;
reg  [ADDR_WIDTH:0]bufferOutIndexSyncToWrClk;
reg  [ADDR_WIDTH-1:0]bufferInIndexToMem;
reg  [ADDR_WIDTH-1:0]bufferOutIndexToMem;
reg  [ADDR_WIDTH:0]bufferCnt;
reg  fifoREnDelayed;
wire [FIFO_WIDTH-1:0] dataFromMem;

always @(posedge wrClk)
begin
  bufferOutIndexSyncToWrClk <= bufferOutIndex;
  if (rstSyncToWrClk == 1'b1 || forceEmptySyncToWrClk == 1'b1)
  begin
    fifoFull <= 1'b0;
    bufferInIndex <= 0;
  end
    else
    begin
      if (fifoWEn == 1'b1) begin
        bufferInIndex <= bufferInIndex + 1'b1;
      end 
      if ((bufferOutIndexSyncToWrClk[ADDR_WIDTH-1:0] == bufferInIndex[ADDR_WIDTH-1:0]) &&
          (bufferOutIndexSyncToWrClk[ADDR_WIDTH] != bufferInIndex[ADDR_WIDTH]) )
        fifoFull <= 1'b1;
      else
        fifoFull <= 1'b0;
    end
end

always @(bufferInIndexSyncToRdClk or bufferOutIndex) 
  bufferCnt <= bufferInIndexSyncToRdClk - bufferOutIndex;

always @(posedge rdClk)
begin
  numElementsInFifo <= { {16-ADDR_WIDTH-1{1'b0}}, bufferCnt }; //pad bufferCnt with leading zeroes
  bufferInIndexSyncToRdClk <= bufferInIndex;
  if (rstSyncToRdClk == 1'b1 || forceEmptySyncToRdClk == 1'b1)
  begin
    fifoEmpty <= 1'b1;
    bufferOutIndex <= 0;
    fifoREnDelayed <= 1'b0;
  end
    else
    begin
      fifoREnDelayed <= fifoREn;
      if (fifoREn == 1'b1 && fifoREnDelayed == 1'b0) begin
        dataOut <= dataFromMem;
        bufferOutIndex <= bufferOutIndex + 1'b1;
      end
      if (bufferInIndexSyncToRdClk == bufferOutIndex) 
        fifoEmpty <= 1'b1;
      else
        fifoEmpty <= 1'b0;
    end
end


always @(bufferInIndex or bufferOutIndex) begin
  bufferInIndexToMem <= bufferInIndex[ADDR_WIDTH-1:0];
  bufferOutIndexToMem <= bufferOutIndex[ADDR_WIDTH-1:0];
end

sm_dpMem_dc #(FIFO_WIDTH, FIFO_DEPTH, ADDR_WIDTH)  u_sm_dpMem_dc (
  .addrIn(bufferInIndexToMem),
  .addrOut(bufferOutIndexToMem),
  .wrClk(wrClk),
  .rdClk(rdClk),
  .dataIn(dataIn),
  .writeEn(fifoWEn),
  .readEn(fifoREn),
  .dataOut(dataFromMem));

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_RxfifoBI.v                                                ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// 
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
`include "spiMaster_defines.v"

module sm_RxfifoBI (
  address, 
  writeEn, 
  strobe_i,
  busClk, 
  spiSysClk, 
  rstSyncToBusClk, 
  fifoSelect,
  fifoDataIn,
  busDataIn, 
  busDataOut,
  fifoREn,
  forceEmptySyncToSpiClk,
  forceEmptySyncToBusClk,
  numElementsInFifo
  );
input [2:0] address;
input writeEn;
input strobe_i;
input busClk;
input spiSysClk;
input rstSyncToBusClk;
input [7:0] fifoDataIn;
input [7:0] busDataIn; 
output [7:0] busDataOut;
output fifoREn;
output forceEmptySyncToSpiClk;
output forceEmptySyncToBusClk;
input [15:0] numElementsInFifo;
input fifoSelect;


wire [2:0] address;
wire writeEn;
wire strobe_i;
wire busClk;
wire spiSysClk;
wire rstSyncToBusClk;
wire [7:0] fifoDataIn;
wire [7:0] busDataIn; 
reg [7:0] busDataOut;
reg fifoREn;
wire forceEmptySyncToSpiClk;
wire forceEmptySyncToBusClk;
wire [15:0] numElementsInFifo;
wire fifoSelect;

reg forceEmptyReg;
reg forceEmpty;
reg forceEmptyToggle;
reg [2:0] forceEmptyToggleSyncToSpiClk;

//sync write
always @(posedge busClk)
begin
  if (writeEn == 1'b1 && fifoSelect == 1'b1 && 
    address == `FIFO_CONTROL_REG && strobe_i == 1'b1 && busDataIn[0] == 1'b1)
    forceEmpty <= 1'b1;
  else
    forceEmpty <= 1'b0;
end

//detect rising edge of 'forceEmpty', and generate toggle signal
always @(posedge busClk) begin
  if (rstSyncToBusClk == 1'b1) begin
    forceEmptyReg <= 1'b0;
    forceEmptyToggle <= 1'b0;
  end
  else begin
    if (forceEmpty == 1'b1)
      forceEmptyReg <= 1'b1;
    else
      forceEmptyReg <= 1'b0;
    if (forceEmpty == 1'b1 && forceEmptyReg == 1'b0)
      forceEmptyToggle <= ~forceEmptyToggle;
  end
end
assign forceEmptySyncToBusClk = (forceEmpty == 1'b1 && forceEmptyReg == 1'b0) ? 1'b1 : 1'b0;


// double sync across clock domains to generate 'forceEmptySyncToSpiClk'
always @(posedge spiSysClk) begin
    forceEmptyToggleSyncToSpiClk <= {forceEmptyToggleSyncToSpiClk[1:0], forceEmptyToggle};
end
assign forceEmptySyncToSpiClk = forceEmptyToggleSyncToSpiClk[2] ^ forceEmptyToggleSyncToSpiClk[1];

// async read mux
always @(address or fifoDataIn or numElementsInFifo)
begin
  case (address)
      `FIFO_DATA_REG : busDataOut <= fifoDataIn;
      `FIFO_DATA_COUNT_MSB : busDataOut <= numElementsInFifo[15:8];
      `FIFO_DATA_COUNT_LSB : busDataOut <= numElementsInFifo[7:0];
      default: busDataOut <= 8'h00; 
  endcase
end

//generate fifo read strobe
always @(address or writeEn or strobe_i or fifoSelect) begin
  if (address == `FIFO_DATA_REG &&   writeEn == 1'b0 && 
  strobe_i == 1'b1 &&   fifoSelect == 1'b1)
    fifoREn <= 1'b1;
  else
    fifoREn <= 1'b0;
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_RxFifo.v                                                  ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  parameterized RxFifo wrapper. Min depth = 2, Max depth = 65536
////  fifo read access via bus interface, fifo write access is direct
//// 
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

module sm_RxFifo(
  busClk,
  spiSysClk,
  rstSyncToBusClk, 
  rstSyncToSpiClk, 
  fifoWEn, 
  fifoFull,
  busAddress, 
  busWriteEn, 
  busStrobe_i,
  busFifoSelect,
  busDataIn, 
  busDataOut,
  fifoDataIn  );
  //FIFO_DEPTH = 2^ADDR_WIDTH
  parameter FIFO_DEPTH = 64; 
  parameter ADDR_WIDTH = 6;   
  
input busClk; 
input spiSysClk; 
input rstSyncToBusClk; 
input rstSyncToSpiClk; 
input fifoWEn;
output fifoFull;
input [2:0] busAddress; 
input busWriteEn; 
input busStrobe_i;
input busFifoSelect;
input [7:0] busDataIn; 
output [7:0] busDataOut;
input [7:0] fifoDataIn;

wire busClk; 
wire spiSysClk; 
wire rstSyncToBusClk; 
wire rstSyncToSpiClk; 
wire fifoWEn; 
wire fifoFull;
wire [2:0] busAddress; 
wire busWriteEn; 
wire busStrobe_i;
wire busFifoSelect;
wire [7:0] busDataIn; 
wire [7:0] busDataOut;
wire [7:0] fifoDataIn;

//internal wires and regs
wire [7:0] dataFromFifoToBus;
wire fifoREn;
wire forceEmptySyncToBusClk;
wire forceEmptySyncToSpiClk;
wire [15:0] numElementsInFifo;
wire fifoEmpty;   //not used

sm_fifoRTL #(8, FIFO_DEPTH, ADDR_WIDTH) u_sm_fifo(
  .wrClk(spiSysClk), 
  .rdClk(busClk), 
  .rstSyncToWrClk(rstSyncToSpiClk), 
  .rstSyncToRdClk(rstSyncToBusClk), 
  .dataIn(fifoDataIn), 
  .dataOut(dataFromFifoToBus), 
  .fifoWEn(fifoWEn), 
  .fifoREn(fifoREn), 
  .fifoFull(fifoFull), 
  .fifoEmpty(fifoEmpty), 
  .forceEmptySyncToWrClk(forceEmptySyncToSpiClk), 
  .forceEmptySyncToRdClk(forceEmptySyncToBusClk), 
  .numElementsInFifo(numElementsInFifo) );
  
sm_RxfifoBI u_sm_RxfifoBI(
  .address(busAddress), 
  .writeEn(busWriteEn), 
  .strobe_i(busStrobe_i),
  .busClk(busClk), 
  .spiSysClk(spiSysClk), 
  .rstSyncToBusClk(rstSyncToBusClk), 
  .fifoSelect(busFifoSelect),
  .fifoDataIn(dataFromFifoToBus),
  .busDataIn(busDataIn), 
  .busDataOut(busDataOut),
  .fifoREn(fifoREn),
  .forceEmptySyncToBusClk(forceEmptySyncToBusClk),
  .forceEmptySyncToSpiClk(forceEmptySyncToSpiClk),
  .numElementsInFifo(numElementsInFifo)
  );

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_TxfifoBI.v                                                ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
//// 
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
`include "spiMaster_defines.v"

module sm_TxfifoBI (
  address, writeEn, strobe_i,
  busClk, 
  spiSysClk, 
  rstSyncToBusClk, 
  fifoSelect,
  busDataIn, 
  busDataOut,
  fifoWEn,
  forceEmptySyncToSpiClk,
  forceEmptySyncToBusClk,
  numElementsInFifo
  );
input [2:0] address;
input writeEn;
input strobe_i;
input busClk;
input spiSysClk;
input rstSyncToBusClk;
input [7:0] busDataIn; 
output [7:0] busDataOut;
output fifoWEn;
output forceEmptySyncToSpiClk;
output forceEmptySyncToBusClk;
input [15:0] numElementsInFifo;
input fifoSelect;


wire [2:0] address;
wire writeEn;
wire strobe_i;
wire busClk;
wire spiSysClk;
wire rstSyncToBusClk;
wire [7:0] busDataIn; 
wire [7:0] busDataOut;
reg fifoWEn;
wire forceEmptySyncToSpiClk;
wire forceEmptySyncToBusClk;
wire [15:0] numElementsInFifo;
wire fifoSelect;

reg forceEmptyReg;
reg forceEmpty;
reg forceEmptyToggle;
reg [2:0] forceEmptyToggleSyncToSpiClk;

//sync write
always @(posedge busClk)
begin
  if (writeEn == 1'b1 && fifoSelect == 1'b1 && 
  address == `FIFO_CONTROL_REG && strobe_i == 1'b1 && busDataIn[0] == 1'b1)
    forceEmpty <= 1'b1;
  else
    forceEmpty <= 1'b0;
end

//detect rising edge of 'forceEmpty', and generate toggle signal
always @(posedge busClk) begin
  if (rstSyncToBusClk == 1'b1) begin
    forceEmptyReg <= 1'b0;
    forceEmptyToggle <= 1'b0;
  end
  else begin
    if (forceEmpty == 1'b1)
      forceEmptyReg <= 1'b1;
    else
      forceEmptyReg <= 1'b0;
    if (forceEmpty == 1'b1 && forceEmptyReg == 1'b0)
      forceEmptyToggle <= ~forceEmptyToggle;
  end
end
assign forceEmptySyncToBusClk = (forceEmpty == 1'b1 && forceEmptyReg == 1'b0) ? 1'b1 : 1'b0;

// double sync across clock domains to generate 'forceEmptySyncToSpiClk'
always @(posedge spiSysClk) begin
    forceEmptyToggleSyncToSpiClk <= {forceEmptyToggleSyncToSpiClk[1:0], forceEmptyToggle};
end
assign forceEmptySyncToSpiClk = forceEmptyToggleSyncToSpiClk[2] ^ forceEmptyToggleSyncToSpiClk[1];

// async read mux
assign busDataOut = 8'h00;


//generate fifo write strobe
always @(address or writeEn or strobe_i or fifoSelect or busDataIn) begin
  if (address == `FIFO_DATA_REG &&   writeEn == 1'b1 && 
  strobe_i == 1'b1 &&   fifoSelect == 1'b1)
    fifoWEn <= 1'b1;
  else
    fifoWEn <= 1'b0;
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// sm_TxFifo.v                                                  ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  parameterized TxFifo wrapper. Min depth = 2, Max depth = 65536
////  fifo write access via bus interface, fifo read access is direct
//// 
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

module sm_TxFifo(
  busClk,
  spiSysClk,
  rstSyncToBusClk, 
  rstSyncToSpiClk, 
  fifoREn, 
  fifoEmpty,
  busAddress, 
  busWriteEn, 
  busStrobe_i,
  busFifoSelect,
  busDataIn,
  busDataOut,
  fifoDataOut ); 
  //FIFO_DEPTH = 2^ADDR_WIDTH
  parameter FIFO_DEPTH = 64; 
  parameter ADDR_WIDTH = 6;   
  
input busClk; 
input spiSysClk; 
input rstSyncToBusClk; 
input rstSyncToSpiClk; 
input fifoREn; 
output fifoEmpty;
input [2:0] busAddress; 
input busWriteEn; 
input busStrobe_i;
input busFifoSelect;
input [7:0] busDataIn; 
output [7:0] busDataOut; 
output [7:0] fifoDataOut;

wire busClk; 
wire spiSysClk; 
wire rstSyncToBusClk; 
wire rstSyncToSpiClk; 
wire fifoREn; 
wire fifoEmpty;
wire [2:0] busAddress; 
wire busWriteEn; 
wire busStrobe_i;
wire busFifoSelect;
wire [7:0] busDataIn; 
wire [7:0] busDataOut; 
wire [7:0] fifoDataOut;

//internal wires and regs
wire fifoWEn;
wire forceEmptySyncToSpiClk;
wire forceEmptySyncToBusClk;
wire [15:0] numElementsInFifo;
wire fifoFull;

sm_fifoRTL #(8, FIFO_DEPTH, ADDR_WIDTH) u_sm_fifo(
  .wrClk(busClk), 
  .rdClk(spiSysClk), 
  .rstSyncToWrClk(rstSyncToBusClk), 
  .rstSyncToRdClk(rstSyncToSpiClk), 
  .dataIn(busDataIn), 
  .dataOut(fifoDataOut), 
  .fifoWEn(fifoWEn), 
  .fifoREn(fifoREn), 
  .fifoFull(fifoFull), 
  .fifoEmpty(fifoEmpty), 
  .forceEmptySyncToWrClk(forceEmptySyncToBusClk), 
  .forceEmptySyncToRdClk(forceEmptySyncToSpiClk), 
  .numElementsInFifo(numElementsInFifo) );
  
sm_TxfifoBI u_sm_TxfifoBI(
  .address(busAddress), 
  .writeEn(busWriteEn), 
  .strobe_i(busStrobe_i),
  .busClk(busClk), 
  .spiSysClk(spiSysClk), 
  .rstSyncToBusClk(rstSyncToBusClk), 
  .fifoSelect(busFifoSelect),
  .busDataIn(busDataIn), 
  .busDataOut(busDataOut), 
  .fifoWEn(fifoWEn),
  .forceEmptySyncToBusClk(forceEmptySyncToBusClk),
  .forceEmptySyncToSpiClk(forceEmptySyncToSpiClk),
  .numElementsInFifo(numElementsInFifo)
  );

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// spiCtrl.v                                                 ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  Controls access to the 3 types of SPI access
//// Direct SPI access, SD initialisation, and SD block read/write
//// 
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
`include "spiMaster_defines.v"

module spiCtrl (clk, readWriteSDBlockRdy, readWriteSDBlockReq, rst, rxDataRdy, rxDataRdyClr, SDInitRdy, SDInitReq, spiCS_n, spiTransCtrl, spiTransSts, spiTransType, txDataWen);
input   clk;
input   readWriteSDBlockRdy;
input   rst;
input   rxDataRdy;
input   SDInitRdy;
input   spiTransCtrl;
input   [1:0]spiTransType;
output  [1:0]readWriteSDBlockReq;
output  rxDataRdyClr;
output  SDInitReq;
output  spiCS_n;
output  spiTransSts;
output  txDataWen;

wire    clk;
wire    readWriteSDBlockRdy;
reg     [1:0]readWriteSDBlockReq, next_readWriteSDBlockReq;
wire    rst;
wire    rxDataRdy;
reg     rxDataRdyClr, next_rxDataRdyClr;
wire    SDInitRdy;
reg     SDInitReq, next_SDInitReq;
reg     spiCS_n, next_spiCS_n;
wire    spiTransCtrl;
reg     spiTransSts, next_spiTransSts;
wire    [1:0]spiTransType;
reg     txDataWen, next_txDataWen;

// BINARY ENCODED state machine: spiCtrlSt
// State codes definitions:
`define ST_S_CTRL 3'b000
`define WT_S_CTRL_REQ 3'b001
`define WT_FIN1 3'b010
`define DIR_ACC 3'b011
`define INIT 3'b100
`define WT_FIN2 3'b101
`define RW 3'b110
`define WT_FIN3 3'b111

reg [2:0]CurrState_spiCtrlSt, NextState_spiCtrlSt;

// Diagram actions (continuous assignments allowed only: assign ...)
// diagram ACTION


// Machine: spiCtrlSt

// NextState logic (combinatorial)
always @ (spiTransCtrl or rxDataRdy or spiTransType or SDInitRdy or readWriteSDBlockRdy or readWriteSDBlockReq or txDataWen or SDInitReq or rxDataRdyClr or spiTransSts or spiCS_n or CurrState_spiCtrlSt)
begin
  NextState_spiCtrlSt <= CurrState_spiCtrlSt;
  // Set default values for outputs and signals
  next_readWriteSDBlockReq <= readWriteSDBlockReq;
  next_txDataWen <= txDataWen;
  next_SDInitReq <= SDInitReq;
  next_rxDataRdyClr <= rxDataRdyClr;
  next_spiTransSts <= spiTransSts;
  next_spiCS_n <= spiCS_n;
  case (CurrState_spiCtrlSt)  // synopsys parallel_case full_case
    `ST_S_CTRL:
    begin
      next_readWriteSDBlockReq <= `NO_BLOCK_REQ;
      next_txDataWen <= 1'b0;
      next_SDInitReq <= 1'b0;
      next_rxDataRdyClr <= 1'b0;
      next_spiTransSts <= `TRANS_NOT_BUSY;
      next_spiCS_n <= 1'b1;
      NextState_spiCtrlSt <= `WT_S_CTRL_REQ;
    end
    `WT_S_CTRL_REQ:
    begin
      next_rxDataRdyClr <= 1'b0;
      next_spiTransSts <= `TRANS_NOT_BUSY;
      if ((spiTransCtrl == `TRANS_START) && (spiTransType == `INIT_SD))
      begin
        NextState_spiCtrlSt <= `INIT;
        next_spiTransSts <= `TRANS_BUSY;
        next_SDInitReq <= 1'b1;
      end
      else if ((spiTransCtrl == `TRANS_START) && (spiTransType == `RW_WRITE_SD_BLOCK))
      begin
        NextState_spiCtrlSt <= `RW;
        next_spiTransSts <= `TRANS_BUSY;
        next_readWriteSDBlockReq <= `WRITE_SD_BLOCK;
      end
      else if ((spiTransCtrl == `TRANS_START) && (spiTransType == `RW_READ_SD_BLOCK))
      begin
        NextState_spiCtrlSt <= `RW;
        next_spiTransSts <= `TRANS_BUSY;
        next_readWriteSDBlockReq <= `READ_SD_BLOCK;
      end
      else if ((spiTransCtrl == `TRANS_START) && (spiTransType == `DIRECT_ACCESS))
      begin
        NextState_spiCtrlSt <= `DIR_ACC;
        next_spiTransSts <= `TRANS_BUSY;
        next_txDataWen <= 1'b1;
        next_spiCS_n <= 1'b0;
      end
    end
    `WT_FIN1:
    begin
      if (rxDataRdy == 1'b1)
      begin
        NextState_spiCtrlSt <= `WT_S_CTRL_REQ;
        next_rxDataRdyClr <= 1'b1;
        next_spiCS_n <= 1'b1;
      end
    end
    `DIR_ACC:
    begin
      next_txDataWen <= 1'b0;
      NextState_spiCtrlSt <= `WT_FIN1;
    end
    `INIT:
    begin
      next_SDInitReq <= 1'b0;
      NextState_spiCtrlSt <= `WT_FIN2;
    end
    `WT_FIN2:
    begin
      if (SDInitRdy == 1'b1)
      begin
        NextState_spiCtrlSt <= `WT_S_CTRL_REQ;
      end
    end
    `RW:
    begin
      next_readWriteSDBlockReq <= `NO_BLOCK_REQ;
      NextState_spiCtrlSt <= `WT_FIN3;
    end
    `WT_FIN3:
    begin
      if (readWriteSDBlockRdy == 1'b1)
      begin
        NextState_spiCtrlSt <= `WT_S_CTRL_REQ;
      end
    end
  endcase
end

// Current State Logic (sequential)
always @ (posedge clk)
begin
  if (rst == 1'b1)
    CurrState_spiCtrlSt <= `ST_S_CTRL;
  else
    CurrState_spiCtrlSt <= NextState_spiCtrlSt;
end

// Registered outputs logic
always @ (posedge clk)
begin
  if (rst == 1'b1)
  begin
    readWriteSDBlockReq <= `NO_BLOCK_REQ;
    txDataWen <= 1'b0;
    SDInitReq <= 1'b0;
    rxDataRdyClr <= 1'b0;
    spiTransSts <= `TRANS_NOT_BUSY;
    spiCS_n <= 1'b1;
  end
  else 
  begin
    readWriteSDBlockReq <= next_readWriteSDBlockReq;
    txDataWen <= next_txDataWen;
    SDInitReq <= next_SDInitReq;
    rxDataRdyClr <= next_rxDataRdyClr;
    spiTransSts <= next_spiTransSts;
    spiCS_n <= next_spiCS_n;
  end
end

endmodule// ------------------------ spiMaster_defines.v ----------------------
// Version 0.0 - April 2008. Created
// Version 1.0 - 3rd June 2008. Fixed synchronisation issue between busClk and
//               spiSysClk. Fixed bug in bus accessible reset. Changed names of
//               fifo related modules to avoid conflict with other IP cores.
// Version 1.1 - 23rd August 2008. Modified reset synchronisation. Fixed bug
//               in wb_ack. Fixed file headers, and added description
// Version 1.2 - 25th October 2008. Modified readWriteSPIWireData to clock data
//               from the SPI bus on the rising edge of SCLK. This increases the
//               tsetup timing margin when reading SPI data. It turns out that the timing
//               was marginal for some SD cards when using a 24Mhz SPI clock.
//               Problem was exacerbated by the fact that the design prevents the 
//               final SPI interface Flipflops being pushed into the IO blocks.

`define SPI_MASTER_VERSION_NUM 8'h12
`define SPI_SYS_CLK_48MHZ
//`define SPI_SYS_CLK_30MHZ

//memoryMap
`define CTRL_STS_REG_BASE 8'h00
`define RX_FIFO_BASE 8'h10
`define TX_FIFO_BASE 8'h20
`define ADDRESS_DECODE_MASK 8'hf0
`define SPI_MASTER_VERSION_REG 8'h00
`define SPI_MASTER_CONTROL_REG 8'h01
`define TRANS_TYPE_REG 8'h02
`define TRANS_CTRL_REG 8'h03
`define TRANS_STS_REG 8'h04
`define TRANS_ERROR_REG 8'h05
`define DIRECT_ACCESS_DATA_REG 8'h06
`define SD_ADDR_7_0_REG 8'h07
`define SD_ADDR_15_8_REG 8'h08
`define SD_ADDR_23_16_REG 8'h09
`define SD_ADDR_31_24_REG 8'h0a
`define SPI_CLK_DEL_REG 8'h0b


//FifoAddresses
`define FIFO_DATA_REG 3'b000
`define FIFO_STATUS_REG 3'b001
`define FIFO_DATA_COUNT_MSB 3'b010
`define FIFO_DATA_COUNT_LSB 3'b011
`define FIFO_CONTROL_REG 3'b100


`ifdef SIM_COMPILE
`define SLOW_SPI_CLK 8'h2
`define FAST_SPI_CLK 8'h00
`define TWO_MS 10'h001
`define TWO_FIFTY_MS 12'h001
`define ONE_HUNDRED_MS 12'h00c
`else //not SIM_COMPILE

`ifdef SPI_SYS_CLK_48MHZ

// --------------- spiSysClk = 48MHz
// if you change the clock frequency you will need to change these constants

// SLOW_SPI_CLK controls the SPI clock at start up.
// should be aiming for 400KHz
// SLOW_SPI_CLK = (spiSysClk / (400KHz * 2)) - 1
`define SLOW_SPI_CLK 8'h3b
// controls the SPI clock after init is complete.
// should be aiming for 24MHz ?
// controls the SPI clock after init is complete.
// should be aiming for 24MHz ?
// if spiSysClk >= 48MHz
// FAST_SPI_CLK = (spiSysClk / (24MHz * 2)) - 1
// else FAST_SPI_CLK = 0
`define FAST_SPI_CLK 8'h00
// TWO_MS = ((2mS * spiSysClk) / 256) - 1
`define TWO_MS 10'h177
// TWO_FIFTY_MS = ((250mS * spiSysClk) / 65536) - 1
`define TWO_FIFTY_MS 12'h0b6
// ONE_HUNDRED_MS = ((100mS * spiSysClk) / 65536) - 1
`define ONE_HUNDRED_MS 12'h048

`else //not SPI_SYS_CLK_48MHZ

`ifdef SPI_SYS_CLK_30MHZ
// --------------- spiSysClk = 30MHz
`define SLOW_SPI_CLK 8'h24
`define FAST_SPI_CLK 8'h00
`define TWO_MS 10'h0e9
`define TWO_FIFTY_MS 12'h071
`define ONE_HUNDRED_MS 12'h02c

`endif //SPI_SYS_CLK_30MHZ
`endif //SPI_SYS_CLK_48MHZ
`endif //SIM_COMPILE



`ifdef SIM_COMPILE
`define SD_INIT_START_SEQ_LEN 8'h03
`define MAX_8_BIT 8'h08
`else
`define SD_INIT_START_SEQ_LEN 8'ha0
`define MAX_8_BIT 8'hff
`endif


`define WR_RESP_TOUT 12'hf00

`define NO_BLOCK_REQ 2'b00
`define WRITE_SD_BLOCK 2'b01
`define READ_SD_BLOCK 2'b10

`define READ_NO_ERROR 2'b00
`define READ_CMD_ERROR 2'b01
`define READ_TOKEN_ERROR 2'b10

`define WRITE_NO_ERROR 2'b00
`define WRITE_CMD_ERROR 2'b01
`define WRITE_DATA_ERROR 2'b10
`define WRITE_BUSY_ERROR 2'b11


`define TRANS_NOT_BUSY 1'b0
`define TRANS_BUSY 1'b1

`define TRANS_START 1'b1
`define TRANS_STOP 1'b0

`define DIRECT_ACCESS 2'b00
`define INIT_SD 2'b01
`define RW_READ_SD_BLOCK 2'b10
`define RW_WRITE_SD_BLOCK 2'b11

`define INIT_NO_ERROR 2'b00
`define INIT_CMD0_ERROR 2'b01
`define INIT_CMD1_ERROR 2'b10

`define TX_FIFO_DEPTH 512
`define TX_FIFO_ADDR_WIDTH 9
`define RX_FIFO_DEPTH 512
`define RX_FIFO_ADDR_WIDTH 9

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// spiMaster.v                                                    ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  Top level module
//// 
////  
//// 
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
`include "spiMaster_defines.v"

module spiMaster(
  clk_i,
  rst_i,
  address_i,
  data_i,
  data_o,
  strobe_i,
  we_i,
  ack_o,

  // SPI logic clock
  spiSysClk,

  //SPI bus
  spiClkOut,
  spiDataIn,
  spiDataOut,
  spiCS_n
);

//Wishbone bus
input clk_i;
input rst_i;
input [7:0] address_i;
input [7:0] data_i;
output [7:0] data_o;
input strobe_i;
input we_i;
output ack_o;

// SPI logic clock
input spiSysClk;

//SPI bus
output spiClkOut;
input spiDataIn;
output spiDataOut;
output spiCS_n;

// local wires and regs
wire spiSysClk;
wire [7:0] spiClkDelayFromInitSD;
wire rstSyncToSpiClk;
wire [7:0] rxDataFromRWSPIWireData;
wire rxDataRdySetFromRWSPIWireData;
wire txDataFullFromSpiTxRxData;
wire txDataFullClrFromRWSPIWireData;
wire [7:0] txDataToRWSPIWireData;
wire rxDataRdyClrFromRWSDBlock;
wire rxDataRdyClrFromSendCmd;
wire [7:0] rxDataFromSpiTxRxData;
wire rxDataRdy;
wire [7:0] txDataFromRWSDBlock;
wire txDataWenFromRWSDBlock;
wire [7:0] txDataFromSendCmd;
wire txDataWenFromSendCmd;
wire [7:0] txDataFromInitSD;
wire txDataWenFromInitSD;
wire [7:0] dataFromCtrlStsReg;
wire [7:0] dataFromTxFifo;
wire [7:0] dataFromRxFifo;
wire [1:0] spiTransType;
wire [7:0] spiDirectAccessTxData;
wire [1:0] readWriteSDBlockReq;
wire [1:0] SDWriteError;
wire [1:0] SDReadError;
wire [1:0] SDInitError;
wire [7:0] cmdByteFromInitSD;
wire [7:0] dataByte1FromInitSD;
wire [7:0] dataByte2FromInitSD;
wire [7:0] dataByte3FromInitSD;
wire [7:0] dataByte4FromInitSD;
wire [7:0] checkSumByteFromInitSD;
wire [7:0] sendCmdRespByte;
wire [7:0] cmdByteFromRWSDBlock;
wire [7:0] dataByte1FromRWSDBlock;
wire [7:0] dataByte2FromRWSDBlock;
wire [7:0] dataByte3FromRWSDBlock;
wire [7:0] dataByte4FromRWSDBlock;
wire [7:0] checkSumByteFromRWSDBlock;
wire [7:0] txFifoDataOut;
wire [7:0] rxFifoDataIn;
wire [31:0] SDAddr;
wire [7:0] spiClkDelayFromCtrlStsReg;
wire spiCS_nFromInitSD;
wire spiCS_nFromRWSDBlock;
wire spiCS_nFromSpiCtrl;


assign spiCS_n = spiCS_nFromInitSD & spiCS_nFromRWSDBlock & spiCS_nFromSpiCtrl;

// -----------------------------------
// Instance of Module: wishBoneBI
// -----------------------------------
spiMasterWishBoneBI u_spiMasterWishBoneBI(
  .ack_o(               ack_o                 ),
  .address(             address_i             ),
  .clk(                 clk_i                 ),
  .ctrlStsRegSel(       ctrlStsRegSel         ),
  .dataFromCtrlStsReg(  dataFromCtrlStsReg    ),
  .dataFromRxFifo(      dataFromRxFifo        ),
  .dataFromTxFifo(      dataFromTxFifo        ),
  .dataIn(              data_i                ),
  .dataOut(             data_o                ),
  .rst(                 rst_i                 ),
  .rxFifoSel(           rxFifoSel             ),
  .strobe_i(            strobe_i              ),
  .txFifoSel(           txFifoSel             ),
  .writeEn(             we_i                  )
	);

// -----------------------------------
// Instance of Module: ctrlStsRegBI
// -----------------------------------
ctrlStsRegBI u_ctrlStsRegBI(
  .busClk(              clk_i                 ),
  .spiSysClk(           spiSysClk             ),
  .rstSyncToBusClkOut(  rstSyncToBusClk       ),
  .rstSyncToSpiClkOut(  rstSyncToSpiClk       ),
  .rstFromWire(         rst_i                 ),
  .address(             address_i             ),
  .strobe_i(            strobe_i              ),
  .dataIn(              data_i                ),
  .dataOut(             dataFromCtrlStsReg    ),
  .ctrlStsRegSel(       ctrlStsRegSel         ),
  .spiTransType(        spiTransType          ),
  .spiTransCtrl(        spiTransCtrl          ), 
  .spiTransStatus(      spiTransSts           ),
  .spiDirectAccessTxData(spiDirectAccessTxData),
  .spiDirectAccessRxData(rxDataFromSpiTxRxData), 
  .writeEn(             we_i                  ),
  .SDWriteError(        SDWriteError          ),
  .SDReadError(         SDReadError           ),
  .SDInitError(         SDInitError           ),
  .SDAddr(              SDAddr                ),
  .spiClkDelay(         spiClkDelayFromCtrlStsReg)
	);

// -----------------------------------
// Instance of Module: spiCtrl
// -----------------------------------
spiCtrl u_spiCtrl(
  .clk(                 spiSysClk             ),
  .rst(                 rstSyncToSpiClk       ),
  .SDInitReq(           SDInitReq             ),
  .SDInitRdy(           SDInitRdy             ),
  .readWriteSDBlockReq( readWriteSDBlockReq   ),
  .readWriteSDBlockRdy( readWriteSDBlockRdy   ),
  .rxDataRdy(           rxDataRdyFromSpiTxRxData),
  .rxDataRdyClr(        rxDataRdyClrFromSpiCtrl),
  .spiTransType(        spiTransType          ),
  .spiTransCtrl(        spiTransCtrl          ),
  .spiTransSts(         spiTransSts           ),
  .txDataWen(           txDataWenFromSpiCtrl  ),
  .spiCS_n(             spiCS_nFromSpiCtrl    )
	);


// -----------------------------------
// Instance of Module: initSD
// -----------------------------------
initSD u_initSD(
  .clk(                 spiSysClk             ),
  .rst(                 rstSyncToSpiClk       ),
  .SDInitReq(           SDInitReq             ),
  .SDInitRdy(           SDInitRdy             ),
  .initError(           SDInitError           ),
  .sendCmdReq(          sendCmdReqFromInitSD  ),
  .sendCmdRdy(          sendCmdRdy            ),
  .cmdByte(             cmdByteFromInitSD     ),
  .dataByte1(           dataByte1FromInitSD   ),
  .dataByte2(           dataByte2FromInitSD   ),
  .dataByte3(           dataByte3FromInitSD   ),
  .dataByte4(           dataByte4FromInitSD   ),
  .checkSumByte(        checkSumByteFromInitSD),
  .respByte(            sendCmdRespByte       ),
  .respTout(            sendCmdRespTout       ),
  .spiCS_n(             spiCS_nFromInitSD    ),
  .spiClkDelayOut(      spiClkDelayFromInitSD ),
  .spiClkDelayIn(       spiClkDelayFromCtrlStsReg),
  .txDataFull(          txDataFullFromSpiTxRxData),
  .txDataEmpty(         txDataEmptyFromRWSPIWireData),
  .txDataOut(           txDataFromInitSD      ),
  .txDataWen(           txDataWenFromInitSD   ),
  .rxDataRdy(           rxDataRdyFromSpiTxRxData),
  .rxDataRdyClr(        rxDataRdyClrFromInitSD)
	);

// -----------------------------------
// Instance of Module: readWriteSDBlock
// -----------------------------------
readWriteSDBlock u_readWriteSDBlock(
  .clk(                 spiSysClk             ),
  .rst(                 rstSyncToSpiClk       ),
  .readWriteSDBlockReq( readWriteSDBlockReq   ),
  .readWriteSDBlockRdy( readWriteSDBlockRdy   ),
  .cmdByte(             cmdByteFromRWSDBlock  ),
  .dataByte1(           dataByte1FromRWSDBlock),
  .dataByte2(           dataByte2FromRWSDBlock),
  .dataByte3(           dataByte3FromRWSDBlock),
  .dataByte4(           dataByte4FromRWSDBlock),
  .checkSumByte(        checkSumByteFromRWSDBlock),
  .readError(           SDReadError             ),
  .respByte(            sendCmdRespByte       ),
  .respTout(            sendCmdRespTout       ),
  .rxDataIn(            rxDataFromSpiTxRxData ),
  .rxDataRdy(           rxDataRdyFromSpiTxRxData),
  .rxDataRdyClr(        rxDataRdyClrFromRWSDBlock),
  .sendCmdRdy(          sendCmdRdy            ),
  .sendCmdReq(          sendCmdReqFromRWSDBlock),
  .spiCS_n(             spiCS_nFromRWSDBlock ),
  .txDataFull(          txDataFullFromSpiTxRxData),
  .txDataEmpty(         txDataEmptyFromRWSPIWireData),
  .txDataOut(           txDataFromRWSDBlock   ),
  .txDataWen(           txDataWenFromRWSDBlock),
  .txFifoData(          txFifoDataOut         ),
  .txFifoRen(           txFifoRE              ),
  .rxFifoData(          rxFifoDataIn          ),
  .rxFifoWen(           rRxFifoWE             ),
  .writeError(          SDWriteError          ),
  .blockAddr(           SDAddr                )

	);

// -----------------------------------
// Instance of Module: sendCmd
// -----------------------------------
sendCmd u_sendCmd(
  .clk(                 spiSysClk             ),
  .rst(                 rstSyncToSpiClk       ),
  .sendCmdReq1(         sendCmdReqFromInitSD  ),
  .sendCmdReq2(         sendCmdReqFromRWSDBlock),
  .sendCmdRdy(          sendCmdRdy            ),
  .cmdByte_1(           cmdByteFromInitSD     ),
  .cmdByte_2(           cmdByteFromRWSDBlock  ),
  .dataByte1_1(         dataByte1FromInitSD   ),
  .dataByte1_2(         dataByte1FromRWSDBlock),
  .dataByte2_1(         dataByte2FromInitSD   ),
  .dataByte2_2(         dataByte2FromRWSDBlock),
  .dataByte3_1(         dataByte3FromInitSD   ),
  .dataByte3_2(         dataByte3FromRWSDBlock),
  .dataByte4_1(         dataByte4FromInitSD   ),
  .dataByte4_2(         dataByte4FromRWSDBlock),
  .checkSumByte_1(      checkSumByteFromInitSD),
  .checkSumByte_2(      checkSumByteFromRWSDBlock),
  .respByte(            sendCmdRespByte       ),
  .respTout(            sendCmdRespTout       ),
  .rxDataIn(            rxDataFromSpiTxRxData ),
  .rxDataRdy(           rxDataRdyFromSpiTxRxData),
  .rxDataRdyClr(        rxDataRdyClrFromSendCmd),
  .txDataFull(          txDataFullFromSpiTxRxData),
  .txDataEmpty(         txDataEmptyFromRWSPIWireData),
  .txDataOut(           txDataFromSendCmd     ),
  .txDataWen(           txDataWenFromSendCmd  )
	);

// -----------------------------------
// Instance of Module: spiTxRxData
// -----------------------------------
spiTxRxData u_spiTxRxData(
  .clk(                 spiSysClk             ),
  .rst(                 rstSyncToSpiClk       ),
  .rx1DataRdyClr(       rxDataRdyClrFromRWSDBlock),
  .rx2DataRdyClr(       rxDataRdyClrFromSendCmd),
  .rx3DataRdyClr(       rxDataRdyClrFromInitSD),
  .rx4DataRdyClr(       rxDataRdyClrFromSpiCtrl),
  .rxDataIn(            rxDataFromRWSPIWireData),
  .rxDataOut(           rxDataFromSpiTxRxData ),
  .rxDataRdy(           rxDataRdyFromSpiTxRxData),
  .rxDataRdySet(        rxDataRdySetFromRWSPIWireData),
  .tx1DataIn(           txDataFromRWSDBlock   ),
  .tx1DataWEn(          txDataWenFromRWSDBlock),
  .tx2DataIn(           txDataFromSendCmd     ),
  .tx2DataWEn(          txDataWenFromSendCmd  ),
  .tx3DataIn(           txDataFromInitSD      ),
  .tx3DataWEn(          txDataWenFromInitSD   ),
  .tx4DataIn(           spiDirectAccessTxData ),
  .tx4DataWEn(          txDataWenFromSpiCtrl  ),
  .txDataFull(          txDataFullFromSpiTxRxData),
  .txDataFullClr(       txDataFullClrFromRWSPIWireData),
  .txDataOut(           txDataToRWSPIWireData )
	);

// -----------------------------------
// Instance of Module: readWriteSPIWireData
// -----------------------------------
readWriteSPIWireData u_readWriteSPIWireData(
  .clk(                 spiSysClk             ),
  .clkDelay(            spiClkDelayFromInitSD           ),
  .rst(                 rstSyncToSpiClk       ),
  .rxDataOut(           rxDataFromRWSPIWireData),
  .rxDataRdySet(        rxDataRdySetFromRWSPIWireData),
  .spiClkOut(           spiClkOut             ),
  .spiDataIn(           spiDataIn             ),
  .spiDataOut(          spiDataOut            ),
  .txDataFull(          txDataFullFromSpiTxRxData),
  .txDataFullClr(       txDataFullClrFromRWSPIWireData),
  .txDataIn(            txDataToRWSPIWireData ),
  .txDataEmpty(         txDataEmptyFromRWSPIWireData)
	);

sm_TxFifo #(`TX_FIFO_DEPTH, `TX_FIFO_ADDR_WIDTH) u_sm_txFifo (
  .spiSysClk(spiSysClk), 
  .busClk(clk_i), 
  .rstSyncToBusClk(rstSyncToBusClk), 
  .rstSyncToSpiClk(rstSyncToSpiClk), 
  .fifoREn(txFifoRE), 
  .fifoEmpty(hostTxFifoEmpty),
  .busAddress(address_i[2:0]), 
  .busWriteEn(we_i), 
  .busStrobe_i(strobe_i),
  .busFifoSelect(txFifoSel),
  .busDataIn(data_i), 
  .busDataOut(dataFromTxFifo),
  .fifoDataOut(txFifoDataOut) );


sm_RxFifo #(`RX_FIFO_DEPTH, `RX_FIFO_ADDR_WIDTH) u_sm_rxFifo(
  .spiSysClk(spiSysClk), 
  .busClk(clk_i),
  .rstSyncToBusClk(rstSyncToBusClk), 
  .rstSyncToSpiClk(rstSyncToSpiClk), 
  .fifoWEn(rRxFifoWE), 
  .fifoFull(hostRxFifoFull),
  .busAddress(address_i[2:0]), 
  .busWriteEn(we_i), 
  .busStrobe_i(strobe_i),
  .busFifoSelect(rxFifoSel),
  .busDataIn(data_i), 
  .busDataOut(dataFromRxFifo),
  .fifoDataIn(rxFifoDataIn)  );

endmodule

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// spiMasterWishBoneBI.v                                        ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  Control WB access to fifos and control and status registers 
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
`include "spiMaster_defines.v"

 
module spiMasterWishBoneBI (
  clk, rst,
  address, dataIn, dataOut, writeEn, 
  strobe_i,
  ack_o,
  ctrlStsRegSel, 
  rxFifoSel, txFifoSel,
  dataFromCtrlStsReg,
  dataFromRxFifo,
  dataFromTxFifo  
  );
input clk;
input rst;
input [7:0] address;
input [7:0] dataIn;
output [7:0] dataOut;
input strobe_i;
output ack_o;
input writeEn;
output ctrlStsRegSel;
output rxFifoSel;
output txFifoSel;
input [7:0] dataFromCtrlStsReg;
input [7:0] dataFromRxFifo;
input [7:0] dataFromTxFifo;


wire clk;
wire rst;
wire [7:0] address;
wire [7:0] dataIn;
reg [7:0] dataOut;
wire writeEn;
wire strobe_i;
reg ack_o;
reg ctrlStsRegSel;
reg rxFifoSel;
reg txFifoSel;
wire [7:0] dataFromCtrlStsReg;
wire [7:0] dataFromRxFifo;
wire [7:0] dataFromTxFifo;

//internal wires and regs
reg ack_delayed;
reg ack_immediate;

//address decode and data mux
always @(address or
  dataFromCtrlStsReg or
  dataFromRxFifo or
  dataFromTxFifo)
begin
  ctrlStsRegSel <= 1'b0;
  rxFifoSel <= 1'b0;
  txFifoSel <= 1'b0;
  case (address & `ADDRESS_DECODE_MASK)
    `CTRL_STS_REG_BASE : begin
      ctrlStsRegSel <= 1'b1;
      dataOut <= dataFromCtrlStsReg;
    end
    `RX_FIFO_BASE : begin
      rxFifoSel <= 1'b1;
      dataOut <= dataFromRxFifo;
    end
    `TX_FIFO_BASE : begin
      txFifoSel <= 1'b1;
      dataOut <= dataFromTxFifo;
    end
    default: 
      dataOut <= 8'h00;
  endcase
end

//delayed ack
always @(posedge clk) begin
  ack_delayed <= strobe_i;
end

//immediate ack
always @(strobe_i) begin
  ack_immediate <= strobe_i;
end 

//select between immediate and delayed ack
always @(writeEn or address or ack_delayed or ack_immediate) begin
  if (writeEn == 1'b0 &&
      (address == `RX_FIFO_BASE + `FIFO_DATA_REG ||
       address == `TX_FIFO_BASE + `FIFO_DATA_REG) )
  begin
    ack_o <= ack_delayed & ack_immediate;
  end
  else
  begin
    ack_o <= ack_immediate;
  end
end

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// spiTxRxData.v                                                ////
////                                                              ////
//// This file is part of the spiMaster opencores effort.
//// <http://www.opencores.org/cores//>                           ////
////                                                              ////
//// Module Description:                                          ////
////  Mux access to SPI RX and TX data 
//// 
////  
//// 
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
//`include "timescale.v"

module spiTxRxData (
  clk,
  rst,

  tx1DataIn,
  tx2DataIn,
  tx3DataIn,
  tx4DataIn,
  tx1DataWEn,
  tx2DataWEn,
  tx3DataWEn,
  tx4DataWEn,

  txDataOut,
  txDataFull,
  txDataFullClr,

  rx1DataRdyClr,
  rx2DataRdyClr,
  rx3DataRdyClr,
  rx4DataRdyClr,

  rxDataIn,
  rxDataOut,
  rxDataRdy,
  rxDataRdySet
);

input clk;
input rst;

input [7:0] tx1DataIn;
input [7:0] tx2DataIn;
input [7:0] tx3DataIn;
input [7:0] tx4DataIn;
input tx1DataWEn;
input tx2DataWEn;
input tx3DataWEn;
input tx4DataWEn;

output [7:0] txDataOut;
reg [7:0] txDataOut;
output txDataFull;
reg txDataFull;
input txDataFullClr;

input rx1DataRdyClr;
input rx2DataRdyClr;
input rx3DataRdyClr;
input rx4DataRdyClr;

input [7:0] rxDataIn;
output [7:0] rxDataOut;
reg [7:0] rxDataOut;
output rxDataRdy;
reg rxDataRdy;
input rxDataRdySet;


// --- Transmit control
always @(posedge clk) begin
  if (rst == 1'b1) begin
    txDataOut <= 8'h00;
    txDataFull <= 1'b0;
  end
  else begin
    if (tx1DataWEn == 1'b1) begin
      txDataOut <= tx1DataIn;
      txDataFull <= 1'b1;
    end
    else if (tx2DataWEn == 1'b1) begin
      txDataOut <= tx2DataIn;
      txDataFull <= 1'b1;
    end
    else if (tx3DataWEn == 1'b1) begin
      txDataOut <= tx3DataIn;
      txDataFull <= 1'b1;
    end
    else if (tx4DataWEn == 1'b1) begin
      txDataOut <= tx4DataIn;
      txDataFull <= 1'b1;
    end
    if (txDataFullClr == 1'b1)
      txDataFull <= 1'b0;
  end
end

// --- Receive control
always @(posedge clk) begin
  if (rst == 1'b1) begin
    rxDataOut <= 8'h00;
    rxDataRdy <= 1'b0;
  end
  else begin
    if (rx1DataRdyClr == 1'b1 || rx2DataRdyClr == 1'b1 || rx3DataRdyClr == 1'b1 || rx4DataRdyClr == 1'b1) begin
      rxDataRdy <= 1'b0;
    end
    if (rxDataRdySet == 1'b1) begin
      rxDataRdy <= 1'b1;
      rxDataOut <= rxDataIn;
    end
  end
end

endmodule

//////////////////////////////////////////////////////////////////////
// timescale.v                                              
//////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

