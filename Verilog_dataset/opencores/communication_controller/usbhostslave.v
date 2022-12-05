//////////////////////////////////////////////////////////////////////
////                                                              ////
//// endpMux.v                                                    ////
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
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
`include "usbSlaveControl_h.v" 

module endpMux (
  clk, 
  rst,
  currEndP,
  NAKSent,
  stallSent,
  CRCError,
  bitStuffError,
  RxOverflow,
  RxTimeOut,
  dataSequence,
  ACKRxed,
  transType,
  transTypeNAK,
  endPControlReg,
  clrEPRdy,
  endPMuxErrorsWEn,
  endP0ControlReg,
  endP1ControlReg,
  endP2ControlReg,
  endP3ControlReg,
  endP0StatusReg,
  endP1StatusReg,
  endP2StatusReg,
  endP3StatusReg,
  endP0TransTypeReg,
  endP1TransTypeReg,
  endP2TransTypeReg,
  endP3TransTypeReg,
  endP0NAKTransTypeReg,
  endP1NAKTransTypeReg,
  endP2NAKTransTypeReg,
  endP3NAKTransTypeReg,
  clrEP0Rdy,
  clrEP1Rdy,
  clrEP2Rdy,
  clrEP3Rdy);


input clk; 
input rst;
input [3:0] currEndP;
input NAKSent;
input stallSent;
input CRCError;
input bitStuffError;
input RxOverflow;
input RxTimeOut;
input dataSequence;
input ACKRxed;
input [1:0] transType;
input [1:0] transTypeNAK;
output [4:0] endPControlReg;
input clrEPRdy;
input endPMuxErrorsWEn;
input [4:0] endP0ControlReg;
input [4:0] endP1ControlReg;
input [4:0] endP2ControlReg;
input [4:0] endP3ControlReg;
output [7:0] endP0StatusReg;
output [7:0] endP1StatusReg;
output [7:0] endP2StatusReg;
output [7:0] endP3StatusReg;
output [1:0] endP0TransTypeReg;
output [1:0] endP1TransTypeReg;
output [1:0] endP2TransTypeReg;
output [1:0] endP3TransTypeReg;
output [1:0] endP0NAKTransTypeReg;
output [1:0] endP1NAKTransTypeReg;
output [1:0] endP2NAKTransTypeReg;
output [1:0] endP3NAKTransTypeReg;
output clrEP0Rdy;
output clrEP1Rdy;
output clrEP2Rdy;
output clrEP3Rdy;

wire clk; 
wire rst;
wire [3:0] currEndP;
wire NAKSent;
wire stallSent;
wire CRCError;
wire bitStuffError;
wire RxOverflow;
wire RxTimeOut;
wire dataSequence;
wire ACKRxed;
wire [1:0] transType;
wire [1:0] transTypeNAK;
reg [4:0] endPControlReg;
wire clrEPRdy;
wire endPMuxErrorsWEn;
wire [4:0] endP0ControlReg;
wire [4:0] endP1ControlReg;
wire [4:0] endP2ControlReg;
wire [4:0] endP3ControlReg;
reg [7:0] endP0StatusReg;
reg [7:0] endP1StatusReg;
reg [7:0] endP2StatusReg;
reg [7:0] endP3StatusReg;
reg [1:0] endP0TransTypeReg;
reg [1:0] endP1TransTypeReg;
reg [1:0] endP2TransTypeReg;
reg [1:0] endP3TransTypeReg;
reg [1:0] endP0NAKTransTypeReg;
reg [1:0] endP1NAKTransTypeReg;
reg [1:0] endP2NAKTransTypeReg;
reg [1:0] endP3NAKTransTypeReg;
reg clrEP0Rdy;
reg clrEP1Rdy;
reg clrEP2Rdy;
reg clrEP3Rdy;

//internal wires and regs
reg [7:0] endPStatusCombine;

//mux endPControlReg and clrEPRdy
always @(posedge clk)
begin
  case (currEndP[1:0])
    2'b00: begin
      endPControlReg <= endP0ControlReg;
      clrEP0Rdy <= clrEPRdy;
    end
    2'b01: begin
      endPControlReg <= endP1ControlReg;
      clrEP1Rdy <= clrEPRdy;
    end
    2'b10: begin
      endPControlReg <= endP2ControlReg;
      clrEP2Rdy <= clrEPRdy;
    end
    2'b11: begin
      endPControlReg <= endP3ControlReg;
      clrEP3Rdy <= clrEPRdy;
    end
  endcase  
end      

//mux endPNAKTransType, endPTransType, endPStatusReg
//If there was a NAK sent then set the NAKSent bit, and leave the other status reg bits untouched.
//else update the entire status reg
always @(posedge clk)
begin
  if (rst) begin
    endP0NAKTransTypeReg <= 2'b00;
    endP1NAKTransTypeReg <= 2'b00;
    endP2NAKTransTypeReg <= 2'b00;
    endP3NAKTransTypeReg <= 2'b00;
    endP0TransTypeReg <= 2'b00;
    endP1TransTypeReg <= 2'b00;
    endP2TransTypeReg <= 2'b00;
    endP3TransTypeReg <= 2'b00;
    endP0StatusReg <= 4'h0;
    endP1StatusReg <= 4'h0;
    endP2StatusReg <= 4'h0;
    endP3StatusReg <= 4'h0;
  end
  else begin
    if (endPMuxErrorsWEn == 1'b1) begin
      if (NAKSent == 1'b1) begin
        case (currEndP[1:0])
          2'b00: begin
            endP0NAKTransTypeReg <= transTypeNAK;
            endP0StatusReg <= endP0StatusReg | `NAK_SET_MASK; 
          end
          2'b01: begin
            endP1NAKTransTypeReg <= transTypeNAK;
            endP1StatusReg <= endP1StatusReg | `NAK_SET_MASK; 
          end
          2'b10: begin
            endP2NAKTransTypeReg <= transTypeNAK;
            endP2StatusReg <= endP2StatusReg | `NAK_SET_MASK; 
          end
          2'b11: begin
            endP3NAKTransTypeReg <= transTypeNAK;
            endP3StatusReg <= endP3StatusReg | `NAK_SET_MASK; 
          end
        endcase
      end
      else begin
        case (currEndP[1:0])
          2'b00: begin
            endP0TransTypeReg <= transType;
            endP0StatusReg <= endPStatusCombine; 
          end
          2'b01: begin
            endP1TransTypeReg <= transType;
            endP1StatusReg <= endPStatusCombine; 
          end
          2'b10: begin
            endP2TransTypeReg <= transType;
            endP2StatusReg <= endPStatusCombine; 
          end
          2'b11: begin
            endP3TransTypeReg <= transType;
            endP3StatusReg <= endPStatusCombine; 
          end
        endcase
      end
    end
  end
end
        

//combine status bits into a single word
always @(dataSequence or ACKRxed or stallSent or RxTimeOut or RxOverflow or bitStuffError or CRCError)
begin
  endPStatusCombine <= {dataSequence, ACKRxed, stallSent, 1'b0, RxTimeOut, RxOverflow, bitStuffError, CRCError};
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// fifoMux.v                                                    ////
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
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

module fifoMux (
  currEndP,
  //TxFifo
  TxFifoREn,
  TxFifoEP0REn,
  TxFifoEP1REn,
  TxFifoEP2REn,
  TxFifoEP3REn,
  TxFifoData,
  TxFifoEP0Data,
  TxFifoEP1Data,
  TxFifoEP2Data,
  TxFifoEP3Data,
  TxFifoEmpty,
  TxFifoEP0Empty,
  TxFifoEP1Empty,
  TxFifoEP2Empty,
  TxFifoEP3Empty,
  //RxFifo
  RxFifoWEn,
  RxFifoEP0WEn,
  RxFifoEP1WEn,
  RxFifoEP2WEn,
  RxFifoEP3WEn,
  RxFifoFull,
  RxFifoEP0Full,
  RxFifoEP1Full,
  RxFifoEP2Full,
  RxFifoEP3Full
    );


input [3:0] currEndP;
//TxFifo
input TxFifoREn;
output TxFifoEP0REn;
output TxFifoEP1REn;
output TxFifoEP2REn;
output TxFifoEP3REn;
output [7:0] TxFifoData;
input [7:0] TxFifoEP0Data;
input [7:0] TxFifoEP1Data;
input [7:0] TxFifoEP2Data;
input [7:0] TxFifoEP3Data;
output TxFifoEmpty;
input TxFifoEP0Empty;
input TxFifoEP1Empty;
input TxFifoEP2Empty;
input TxFifoEP3Empty;
  //RxFifo
input RxFifoWEn;
output RxFifoEP0WEn;
output RxFifoEP1WEn;
output RxFifoEP2WEn;
output RxFifoEP3WEn;
output RxFifoFull;
input RxFifoEP0Full;
input RxFifoEP1Full;
input RxFifoEP2Full;
input RxFifoEP3Full;

wire [3:0] currEndP;
//TxFifo
wire TxFifoREn;
reg TxFifoEP0REn;
reg TxFifoEP1REn;
reg TxFifoEP2REn;
reg TxFifoEP3REn;
reg [7:0] TxFifoData;
wire [7:0] TxFifoEP0Data;
wire [7:0] TxFifoEP1Data;
wire [7:0] TxFifoEP2Data;
wire [7:0] TxFifoEP3Data;
reg TxFifoEmpty;
wire TxFifoEP0Empty;
wire TxFifoEP1Empty;
wire TxFifoEP2Empty;
wire TxFifoEP3Empty;
  //RxFifo
wire RxFifoWEn;
reg RxFifoEP0WEn;
reg RxFifoEP1WEn;
reg RxFifoEP2WEn;
reg RxFifoEP3WEn;
reg RxFifoFull;
wire RxFifoEP0Full;
wire RxFifoEP1Full;
wire RxFifoEP2Full;
wire RxFifoEP3Full;

//internal wires and regs

//combinatorially mux TX and RX fifos for end points 0 through 3
always @(currEndP or
  TxFifoREn or
  RxFifoWEn or
  TxFifoEP0Data or
  TxFifoEP1Data or
  TxFifoEP2Data or
  TxFifoEP3Data or
  TxFifoEP0Empty or
  TxFifoEP1Empty or
  TxFifoEP2Empty or
  TxFifoEP3Empty or
  RxFifoEP0Full or
  RxFifoEP1Full or
  RxFifoEP2Full or
  RxFifoEP3Full)
begin
  case (currEndP[1:0])
    2'b00: begin
      TxFifoEP0REn <= TxFifoREn;
      TxFifoEP1REn <= 1'b0;
      TxFifoEP2REn <= 1'b0;
      TxFifoEP3REn <= 1'b0;
      TxFifoData <= TxFifoEP0Data;
      TxFifoEmpty <= TxFifoEP0Empty;
      RxFifoEP0WEn <= RxFifoWEn;
      RxFifoEP1WEn <= 1'b0;
      RxFifoEP2WEn <= 1'b0;
      RxFifoEP3WEn <= 1'b0;
      RxFifoFull <= RxFifoEP0Full;
    end
    2'b01: begin
      TxFifoEP0REn <= 1'b0;
      TxFifoEP1REn <= TxFifoREn;
      TxFifoEP2REn <= 1'b0;
      TxFifoEP3REn <= 1'b0;
      TxFifoData <= TxFifoEP1Data;
      TxFifoEmpty <= TxFifoEP1Empty;
      RxFifoEP0WEn <= 1'b0;
      RxFifoEP1WEn <= RxFifoWEn;
      RxFifoEP2WEn <= 1'b0;
      RxFifoEP3WEn <= 1'b0;
      RxFifoFull <= RxFifoEP1Full;
    end
    2'b10: begin
      TxFifoEP0REn <= 1'b0;
      TxFifoEP1REn <= 1'b0;
      TxFifoEP2REn <= TxFifoREn;
      TxFifoEP3REn <= 1'b0;
      TxFifoData <= TxFifoEP2Data;
      TxFifoEmpty <= TxFifoEP2Empty;
      RxFifoEP0WEn <= 1'b0;
      RxFifoEP1WEn <= 1'b0;
      RxFifoEP2WEn <= RxFifoWEn;
      RxFifoEP3WEn <= 1'b0;
      RxFifoFull <= RxFifoEP2Full;
    end
    2'b11: begin
      TxFifoEP0REn <= 1'b0;
      TxFifoEP1REn <= 1'b0;
      TxFifoEP2REn <= 1'b0;
      TxFifoEP3REn <= TxFifoREn;
      TxFifoData <= TxFifoEP3Data;
      TxFifoEmpty <= TxFifoEP3Empty;
      RxFifoEP0WEn <= 1'b0;
      RxFifoEP1WEn <= 1'b0;
      RxFifoEP2WEn <= 1'b0;
      RxFifoEP3WEn <= RxFifoWEn;
      RxFifoFull <= RxFifoEP3Full;
    end
  endcase  
end      


endmodule

// File        : ../RTL/slaveController/sctxportarbiter.v
// Generated   : 11/10/06 05:37:24
// From        : ../RTL/slaveController/sctxportarbiter.asf
// By          : FSM2VHDL ver. 5.0.0.9

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// SCTxPortArbiter
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
//// http://www.opencores.org/cores/usbhostslave/                 ////
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
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
`include "timescale.v"

module SCTxPortArbiter (SCTxPortCntl, SCTxPortData, SCTxPortRdyIn, SCTxPortRdyOut, SCTxPortWEnable, clk, directCntlCntl, directCntlData, directCntlGnt, directCntlReq, directCntlWEn, rst, sendPacketCntl, sendPacketData, sendPacketGnt, sendPacketReq, sendPacketWEn);
input   SCTxPortRdyIn;
input   clk;
input   [7:0] directCntlCntl;
input   [7:0] directCntlData;
input   directCntlReq;
input   directCntlWEn;
input   rst;
input   [7:0] sendPacketCntl;
input   [7:0] sendPacketData;
input   sendPacketReq;
input   sendPacketWEn;
output  [7:0] SCTxPortCntl;
output  [7:0] SCTxPortData;
output  SCTxPortRdyOut;
output  SCTxPortWEnable;
output  directCntlGnt;
output  sendPacketGnt;

reg     [7:0] SCTxPortCntl, next_SCTxPortCntl;
reg     [7:0] SCTxPortData, next_SCTxPortData;
wire    SCTxPortRdyIn;
reg     SCTxPortRdyOut, next_SCTxPortRdyOut;
reg     SCTxPortWEnable, next_SCTxPortWEnable;
wire    clk;
wire    [7:0] directCntlCntl;
wire    [7:0] directCntlData;
reg     directCntlGnt, next_directCntlGnt;
wire    directCntlReq;
wire    directCntlWEn;
wire    rst;
wire    [7:0] sendPacketCntl;
wire    [7:0] sendPacketData;
reg     sendPacketGnt, next_sendPacketGnt;
wire    sendPacketReq;
wire    sendPacketWEn;

// diagram signals declarations
reg  muxDCEn, next_muxDCEn;

// BINARY ENCODED state machine: SCTxArb
// State codes definitions:
`define SARB1_WAIT_REQ 2'b00
`define SARB_SEND_PACKET 2'b01
`define SARB_DC 2'b10
`define START_SARB 2'b11

reg [1:0] CurrState_SCTxArb;
reg [1:0] NextState_SCTxArb;

// Diagram actions (continuous assignments allowed only: assign ...)

// SOFController/directContol/sendPacket mux
always @(SCTxPortRdyIn)
begin
    SCTxPortRdyOut <= SCTxPortRdyIn;
end
always @(muxDCEn or
		 		 directCntlWEn or directCntlData or directCntlCntl or
                  directCntlWEn or directCntlData or directCntlCntl or
 		  		 sendPacketWEn or sendPacketData or sendPacketCntl)
begin
if (muxDCEn == 1'b1)
    begin
        SCTxPortWEnable <= directCntlWEn;
        SCTxPortData <= directCntlData;
        SCTxPortCntl <= directCntlCntl;
    end
else
    begin
        SCTxPortWEnable <= sendPacketWEn;
        SCTxPortData <= sendPacketData;
        SCTxPortCntl <= sendPacketCntl;
    end
end

//--------------------------------------------------------------------
// Machine: SCTxArb
//--------------------------------------------------------------------
//----------------------------------
// Next State Logic (combinatorial)
//----------------------------------
always @ (sendPacketReq or directCntlReq or sendPacketGnt or muxDCEn or directCntlGnt or CurrState_SCTxArb)
begin : SCTxArb_NextState
  NextState_SCTxArb <= CurrState_SCTxArb;
  // Set default values for outputs and signals
  next_sendPacketGnt <= sendPacketGnt;
  next_muxDCEn <= muxDCEn;
  next_directCntlGnt <= directCntlGnt;
  case (CurrState_SCTxArb)
    `SARB1_WAIT_REQ:
      if (sendPacketReq == 1'b1)	
      begin
        NextState_SCTxArb <= `SARB_SEND_PACKET;
        next_sendPacketGnt <= 1'b1;
        next_muxDCEn <= 1'b0;
      end
      else if (directCntlReq == 1'b1)	
      begin
        NextState_SCTxArb <= `SARB_DC;
        next_directCntlGnt <= 1'b1;
        next_muxDCEn <= 1'b1;
      end
    `SARB_SEND_PACKET:
      if (sendPacketReq == 1'b0)	
      begin
        NextState_SCTxArb <= `SARB1_WAIT_REQ;
        next_sendPacketGnt <= 1'b0;
      end
    `SARB_DC:
      if (directCntlReq == 1'b0)	
      begin
        NextState_SCTxArb <= `SARB1_WAIT_REQ;
        next_directCntlGnt <= 1'b0;
      end
    `START_SARB:
      NextState_SCTxArb <= `SARB1_WAIT_REQ;
  endcase
end

//----------------------------------
// Current State Logic (sequential)
//----------------------------------
always @ (posedge clk)
begin : SCTxArb_CurrentState
  if (rst)	
    CurrState_SCTxArb <= `START_SARB;
  else
    CurrState_SCTxArb <= NextState_SCTxArb;
end

//----------------------------------
// Registered outputs logic
//----------------------------------
always @ (posedge clk)
begin : SCTxArb_RegOutput
  if (rst)	
  begin
    muxDCEn <= 1'b0;
    sendPacketGnt <= 1'b0;
    directCntlGnt <= 1'b0;
  end
  else 
  begin
    muxDCEn <= next_muxDCEn;
    sendPacketGnt <= next_sendPacketGnt;
    directCntlGnt <= next_directCntlGnt;
  end
end

endmodule
// File        : ../RTL/slaveController/slavecontroller.v
// Generated   : 11/10/06 05:37:25
// From        : ../RTL/slaveController/slavecontroller.asf
// By          : FSM2VHDL ver. 5.0.0.9

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// slaveController
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
//// http://www.opencores.org/cores/usbhostslave/                 ////
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
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
`include "timescale.v"
`include "usbSerialInterfaceEngine_h.v"
`include "usbSlaveControl_h.v"
`include "usbConstants_h.v"


module slavecontroller (CRCError, NAKSent, RxByte, RxDataWEn, RxOverflow, RxStatus, RxTimeOut, SCGlobalEn, SOFRxed, USBEndPControlReg, USBEndPNakTransTypeReg, USBEndPTransTypeReg, USBEndP, USBTgtAddress, bitStuffError, clk, clrEPRdy, endPMuxErrorsWEn, endPointReadyToGetPkt, frameNum, getPacketREn, getPacketRdy, rst, sendPacketPID, sendPacketRdy, sendPacketWEn, stallSent, transDone);
input   CRCError;
input   [7:0] RxByte;
input   RxDataWEn;
input   RxOverflow;
input   [7:0] RxStatus;
input   RxTimeOut;
input   SCGlobalEn;
input   [4:0] USBEndPControlReg;
input   [6:0] USBTgtAddress;
input   bitStuffError;
input   clk;
input   getPacketRdy;
input   rst;
input   sendPacketRdy;
output  NAKSent;
output  SOFRxed;
output  [1:0] USBEndPNakTransTypeReg;
output  [1:0] USBEndPTransTypeReg;
output  [3:0] USBEndP;
output  clrEPRdy;
output  endPMuxErrorsWEn;
output  endPointReadyToGetPkt;
output  [10:0] frameNum;
output  getPacketREn;
output  [3:0] sendPacketPID;
output  sendPacketWEn;
output  stallSent;
output  transDone;

wire    CRCError;
reg     NAKSent, next_NAKSent;
wire    [7:0] RxByte;
wire    RxDataWEn;
wire    RxOverflow;
wire    [7:0] RxStatus;
wire    RxTimeOut;
wire    SCGlobalEn;
reg     SOFRxed, next_SOFRxed;
wire    [4:0] USBEndPControlReg;
reg     [1:0] USBEndPNakTransTypeReg, next_USBEndPNakTransTypeReg;
reg     [1:0] USBEndPTransTypeReg, next_USBEndPTransTypeReg;
reg     [3:0] USBEndP, next_USBEndP;
wire    [6:0] USBTgtAddress;
wire    bitStuffError;
wire    clk;
reg     clrEPRdy, next_clrEPRdy;
reg     endPMuxErrorsWEn, next_endPMuxErrorsWEn;
reg     endPointReadyToGetPkt, next_endPointReadyToGetPkt;
reg     [10:0] frameNum, next_frameNum;
reg     getPacketREn, next_getPacketREn;
wire    getPacketRdy;
wire    rst;
reg     [3:0] sendPacketPID, next_sendPacketPID;
wire    sendPacketRdy;
reg     sendPacketWEn, next_sendPacketWEn;
reg     stallSent, next_stallSent;
reg     transDone, next_transDone;

// diagram signals declarations
reg  [7:0]PIDByte, next_PIDByte;
reg  [6:0]USBAddress, next_USBAddress;
reg  [4:0]USBEndPControlRegCopy, next_USBEndPControlRegCopy;
reg  [7:0]addrEndPTemp, next_addrEndPTemp;
reg  [7:0]endpCRCTemp, next_endpCRCTemp;
reg  [1:0]tempUSBEndPTransTypeReg, next_tempUSBEndPTransTypeReg;

// BINARY ENCODED state machine: slvCntrl
// State codes definitions:
`define WAIT_RX1 5'b00000
`define FIN_SC 5'b00001
`define GET_TOKEN_WAIT_CRC 5'b00010
`define GET_TOKEN_WAIT_ADDR 5'b00011
`define GET_TOKEN_WAIT_STOP 5'b00100
`define CHK_PID 5'b00101
`define GET_TOKEN_CHK_SOF 5'b00110
`define PID_ERROR 5'b00111
`define CHK_RDY 5'b01000
`define IN_NAK_STALL 5'b01001
`define IN_CHK_RDY 5'b01010
`define SETUP_OUT_CHK 5'b01011
`define SETUP_OUT_SEND 5'b01100
`define SETUP_OUT_GET_PKT 5'b01101
`define START_S1 5'b01110
`define GET_TOKEN_DELAY 5'b01111
`define GET_TOKEN_CHK_ADDR 5'b10000
`define IN_RESP_GET_RESP 5'b10001
`define IN_RESP_DATA 5'b10010
`define IN_RESP_CHK_ISO 5'b10011

reg [4:0] CurrState_slvCntrl;
reg [4:0] NextState_slvCntrl;


//--------------------------------------------------------------------
// Machine: slvCntrl
//--------------------------------------------------------------------
//----------------------------------
// Next State Logic (combinatorial)
//----------------------------------
always @ (RxByte or tempUSBEndPTransTypeReg or endpCRCTemp or addrEndPTemp or USBEndPControlReg or RxDataWEn or RxStatus or PIDByte or USBEndPControlRegCopy or NAKSent or sendPacketRdy or getPacketRdy or CRCError or bitStuffError or RxOverflow or RxTimeOut or USBEndP or USBAddress or USBTgtAddress or SCGlobalEn or stallSent or SOFRxed or transDone or clrEPRdy or endPMuxErrorsWEn or getPacketREn or sendPacketWEn or sendPacketPID or USBEndPTransTypeReg or USBEndPNakTransTypeReg or frameNum or endPointReadyToGetPkt or CurrState_slvCntrl)
begin : slvCntrl_NextState
  NextState_slvCntrl <= CurrState_slvCntrl;
  // Set default values for outputs and signals
  next_stallSent <= stallSent;
  next_NAKSent <= NAKSent;
  next_SOFRxed <= SOFRxed;
  next_PIDByte <= PIDByte;
  next_transDone <= transDone;
  next_clrEPRdy <= clrEPRdy;
  next_endPMuxErrorsWEn <= endPMuxErrorsWEn;
  next_tempUSBEndPTransTypeReg <= tempUSBEndPTransTypeReg;
  next_getPacketREn <= getPacketREn;
  next_sendPacketWEn <= sendPacketWEn;
  next_sendPacketPID <= sendPacketPID;
  next_USBEndPTransTypeReg <= USBEndPTransTypeReg;
  next_USBEndPNakTransTypeReg <= USBEndPNakTransTypeReg;
  next_endpCRCTemp <= endpCRCTemp;
  next_addrEndPTemp <= addrEndPTemp;
  next_frameNum <= frameNum;
  next_USBAddress <= USBAddress;
  next_USBEndP <= USBEndP;
  next_USBEndPControlRegCopy <= USBEndPControlRegCopy;
  next_endPointReadyToGetPkt <= endPointReadyToGetPkt;
  case (CurrState_slvCntrl)
    `WAIT_RX1:
    begin
      next_stallSent <= 1'b0;
      next_NAKSent <= 1'b0;
      next_SOFRxed <= 1'b0;
      if (RxDataWEn == 1'b1 && 
        RxStatus == `RX_PACKET_START && 
        RxByte[1:0] == `TOKEN)	
      begin
        NextState_slvCntrl <= `GET_TOKEN_WAIT_ADDR;
        next_PIDByte <= RxByte;
      end
    end
    `FIN_SC:
    begin
      next_transDone <= 1'b0;
      next_clrEPRdy <= 1'b0;
      next_endPMuxErrorsWEn <= 1'b0;
      NextState_slvCntrl <= `WAIT_RX1;
    end
    `CHK_PID:
      if (PIDByte[3:0] == `SETUP)	
      begin
        NextState_slvCntrl <= `SETUP_OUT_GET_PKT;
        next_tempUSBEndPTransTypeReg <= `SC_SETUP_TRANS;
        next_getPacketREn <= 1'b1;
      end
      else if (PIDByte[3:0] == `OUT)	
      begin
        NextState_slvCntrl <= `SETUP_OUT_GET_PKT;
        next_tempUSBEndPTransTypeReg <= `SC_OUTDATA_TRANS;
        next_getPacketREn <= 1'b1;
      end
      else if ((PIDByte[3:0] == `IN) && (USBEndPControlRegCopy[`ENDPOINT_ISO_ENABLE_BIT] == 1'b0))	
      begin
        NextState_slvCntrl <= `IN_CHK_RDY;
        next_tempUSBEndPTransTypeReg <= `SC_IN_TRANS;
      end
      else if (((PIDByte[3:0] == `IN) && (USBEndPControlRegCopy [`ENDPOINT_READY_BIT] == 1'b1)) && (USBEndPControlRegCopy [`ENDPOINT_OUTDATA_SEQUENCE_BIT] == 1'b0))	
      begin
        NextState_slvCntrl <= `IN_RESP_DATA;
        next_tempUSBEndPTransTypeReg <= `SC_IN_TRANS;
        next_sendPacketWEn <= 1'b1;
        next_sendPacketPID <= `DATA0;
      end
      else if ((PIDByte[3:0] == `IN) && (USBEndPControlRegCopy [`ENDPOINT_READY_BIT] == 1'b1))	
      begin
        NextState_slvCntrl <= `IN_RESP_DATA;
        next_tempUSBEndPTransTypeReg <= `SC_IN_TRANS;
        next_sendPacketWEn <= 1'b1;
        next_sendPacketPID <= `DATA1;
      end
      else if (PIDByte[3:0] == `IN)	
      begin
        NextState_slvCntrl <= `CHK_RDY;
        next_tempUSBEndPTransTypeReg <= `SC_IN_TRANS;
      end
      else
        NextState_slvCntrl <= `PID_ERROR;
    `PID_ERROR:
      NextState_slvCntrl <= `WAIT_RX1;
    `CHK_RDY:
      if (USBEndPControlRegCopy [`ENDPOINT_READY_BIT] == 1'b1)	
      begin
        NextState_slvCntrl <= `FIN_SC;
        next_transDone <= 1'b1;
        next_clrEPRdy <= 1'b1;
        next_USBEndPTransTypeReg <= tempUSBEndPTransTypeReg;
        next_endPMuxErrorsWEn <= 1'b1;
      end
      else if (NAKSent == 1'b1)	
      begin
        NextState_slvCntrl <= `FIN_SC;
        next_USBEndPNakTransTypeReg <= tempUSBEndPTransTypeReg;
        next_endPMuxErrorsWEn <= 1'b1;
      end
      else
        NextState_slvCntrl <= `FIN_SC;
    `SETUP_OUT_CHK:
      if (USBEndPControlRegCopy [`ENDPOINT_READY_BIT] == 1'b0)	
      begin
        NextState_slvCntrl <= `SETUP_OUT_SEND;
        next_sendPacketWEn <= 1'b1;
        next_sendPacketPID <= `NAK;
        next_NAKSent <= 1'b1;
      end
      else if (USBEndPControlRegCopy [`ENDPOINT_SEND_STALL_BIT] == 1'b1)	
      begin
        NextState_slvCntrl <= `SETUP_OUT_SEND;
        next_sendPacketWEn <= 1'b1;
        next_sendPacketPID <= `STALL;
        next_stallSent <= 1'b1;
      end
      else
      begin
        NextState_slvCntrl <= `SETUP_OUT_SEND;
        next_sendPacketWEn <= 1'b1;
        next_sendPacketPID <= `ACK;
      end
    `SETUP_OUT_SEND:
    begin
      next_sendPacketWEn <= 1'b0;
      if (sendPacketRdy == 1'b1)	
        NextState_slvCntrl <= `CHK_RDY;
    end
    `SETUP_OUT_GET_PKT:
    begin
      next_getPacketREn <= 1'b0;
      if ((getPacketRdy == 1'b1) && (USBEndPControlRegCopy [`ENDPOINT_ISO_ENABLE_BIT] == 1'b1))	
        NextState_slvCntrl <= `CHK_RDY;
      else if ((getPacketRdy == 1'b1) && (CRCError == 1'b0 &&
        bitStuffError == 1'b0 && 
        RxOverflow == 1'b0 && 
        RxTimeOut == 1'b0))	
        NextState_slvCntrl <= `SETUP_OUT_CHK;
      else if (getPacketRdy == 1'b1)	
        NextState_slvCntrl <= `CHK_RDY;
    end
    `IN_NAK_STALL:
    begin
      next_sendPacketWEn <= 1'b0;
      if (sendPacketRdy == 1'b1)	
        NextState_slvCntrl <= `CHK_RDY;
    end
    `IN_CHK_RDY:
      if (USBEndPControlRegCopy [`ENDPOINT_READY_BIT] == 1'b0)	
      begin
        NextState_slvCntrl <= `IN_NAK_STALL;
        next_sendPacketWEn <= 1'b1;
        next_sendPacketPID <= `NAK;
        next_NAKSent <= 1'b1;
      end
      else if (USBEndPControlRegCopy [`ENDPOINT_SEND_STALL_BIT] == 1'b1)	
      begin
        NextState_slvCntrl <= `IN_NAK_STALL;
        next_sendPacketWEn <= 1'b1;
        next_sendPacketPID <= `STALL;
        next_stallSent <= 1'b1;
      end
      else if (USBEndPControlRegCopy [`ENDPOINT_OUTDATA_SEQUENCE_BIT] == 1'b0)	
      begin
        NextState_slvCntrl <= `IN_RESP_DATA;
        next_sendPacketWEn <= 1'b1;
        next_sendPacketPID <= `DATA0;
      end
      else
      begin
        NextState_slvCntrl <= `IN_RESP_DATA;
        next_sendPacketWEn <= 1'b1;
        next_sendPacketPID <= `DATA1;
      end
    `IN_RESP_GET_RESP:
    begin
      next_getPacketREn <= 1'b0;
      if (getPacketRdy == 1'b1)	
        NextState_slvCntrl <= `CHK_RDY;
    end
    `IN_RESP_DATA:
    begin
      next_sendPacketWEn <= 1'b0;
      if (sendPacketRdy == 1'b1)	
        NextState_slvCntrl <= `IN_RESP_CHK_ISO;
    end
    `IN_RESP_CHK_ISO:
      if (USBEndPControlRegCopy [`ENDPOINT_ISO_ENABLE_BIT] == 1'b1)	
        NextState_slvCntrl <= `CHK_RDY;
      else
      begin
        NextState_slvCntrl <= `IN_RESP_GET_RESP;
        next_getPacketREn <= 1'b1;
      end
    `START_S1:
      NextState_slvCntrl <= `WAIT_RX1;
    `GET_TOKEN_WAIT_CRC:
      if (RxDataWEn == 1'b1 && 
        RxStatus == `RX_PACKET_STREAM)	
      begin
        NextState_slvCntrl <= `GET_TOKEN_WAIT_STOP;
        next_endpCRCTemp <= RxByte;
      end
      else if (RxDataWEn == 1'b1 && 
        RxStatus != `RX_PACKET_STREAM)	
        NextState_slvCntrl <= `WAIT_RX1;
    `GET_TOKEN_WAIT_ADDR:
      if (RxDataWEn == 1'b1 && 
        RxStatus == `RX_PACKET_STREAM)	
      begin
        NextState_slvCntrl <= `GET_TOKEN_WAIT_CRC;
        next_addrEndPTemp <= RxByte;
      end
      else if (RxDataWEn == 1'b1 && 
        RxStatus != `RX_PACKET_STREAM)	
        NextState_slvCntrl <= `WAIT_RX1;
    `GET_TOKEN_WAIT_STOP:
      if ((RxDataWEn == 1'b1) && (RxByte[`CRC_ERROR_BIT] == 1'b0 &&
        RxByte[`BIT_STUFF_ERROR_BIT] == 1'b0 &&
        RxByte [`RX_OVERFLOW_BIT] == 1'b0))	
        NextState_slvCntrl <= `GET_TOKEN_CHK_SOF;
      else if (RxDataWEn == 1'b1)	
        NextState_slvCntrl <= `WAIT_RX1;
    `GET_TOKEN_CHK_SOF:
      if (PIDByte[3:0] == `SOF)	
      begin
        NextState_slvCntrl <= `WAIT_RX1;
        next_frameNum <= {endpCRCTemp[2:0],addrEndPTemp};
        next_SOFRxed <= 1'b1;
      end
      else
      begin
        NextState_slvCntrl <= `GET_TOKEN_DELAY;
        next_USBAddress <= addrEndPTemp[6:0];
        next_USBEndP <= { endpCRCTemp[2:0], addrEndPTemp[7]};
      end
    `GET_TOKEN_DELAY:    // Insert delay to allow USBEndP etc to update
      NextState_slvCntrl <= `GET_TOKEN_CHK_ADDR;
    `GET_TOKEN_CHK_ADDR:
      if (USBEndP < `NUM_OF_ENDPOINTS  &&
        USBAddress == USBTgtAddress &&
        SCGlobalEn == 1'b1 &&
        USBEndPControlReg[`ENDPOINT_ENABLE_BIT] == 1'b1)	
      begin
        NextState_slvCntrl <= `CHK_PID;
        next_USBEndPControlRegCopy <= USBEndPControlReg;
        next_endPointReadyToGetPkt <= USBEndPControlReg [`ENDPOINT_READY_BIT];
      end
      else
        NextState_slvCntrl <= `WAIT_RX1;
  endcase
end

//----------------------------------
// Current State Logic (sequential)
//----------------------------------
always @ (posedge clk)
begin : slvCntrl_CurrentState
  if (rst)	
    CurrState_slvCntrl <= `START_S1;
  else
    CurrState_slvCntrl <= NextState_slvCntrl;
end

//----------------------------------
// Registered outputs logic
//----------------------------------
always @ (posedge clk)
begin : slvCntrl_RegOutput
  if (rst)	
  begin
    tempUSBEndPTransTypeReg <= 2'b00;
    addrEndPTemp <= 8'h00;
    endpCRCTemp <= 8'h00;
    USBAddress <= 7'b0000000;
    PIDByte <= 8'h00;
    USBEndPControlRegCopy <= 5'b00000;
    transDone <= 1'b0;
    getPacketREn <= 1'b0;
    sendPacketPID <= 4'b0;
    sendPacketWEn <= 1'b0;
    clrEPRdy <= 1'b0;
    USBEndPTransTypeReg <= 2'b00;
    USBEndPNakTransTypeReg <= 2'b00;
    NAKSent <= 1'b0;
    stallSent <= 1'b0;
    SOFRxed <= 1'b0;
    endPMuxErrorsWEn <= 1'b0;
    frameNum <= 11'b00000000000;
    USBEndP <= 4'h0;
    endPointReadyToGetPkt <= 1'b0;
  end
  else 
  begin
    tempUSBEndPTransTypeReg <= next_tempUSBEndPTransTypeReg;
    addrEndPTemp <= next_addrEndPTemp;
    endpCRCTemp <= next_endpCRCTemp;
    USBAddress <= next_USBAddress;
    PIDByte <= next_PIDByte;
    USBEndPControlRegCopy <= next_USBEndPControlRegCopy;
    transDone <= next_transDone;
    getPacketREn <= next_getPacketREn;
    sendPacketPID <= next_sendPacketPID;
    sendPacketWEn <= next_sendPacketWEn;
    clrEPRdy <= next_clrEPRdy;
    USBEndPTransTypeReg <= next_USBEndPTransTypeReg;
    USBEndPNakTransTypeReg <= next_USBEndPNakTransTypeReg;
    NAKSent <= next_NAKSent;
    stallSent <= next_stallSent;
    SOFRxed <= next_SOFRxed;
    endPMuxErrorsWEn <= next_endPMuxErrorsWEn;
    frameNum <= next_frameNum;
    USBEndP <= next_USBEndP;
    endPointReadyToGetPkt <= next_endPointReadyToGetPkt;
  end
end

endmodule
// File        : ../RTL/slaveController/slaveDirectcontrol.v
// Generated   : 11/10/06 05:37:25
// From        : ../RTL/slaveController/slaveDirectcontrol.asf
// By          : FSM2VHDL ver. 5.0.0.9

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// slaveDirectControl
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
//// http://www.opencores.org/cores/usbhostslave/                 ////
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
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
//
`include "timescale.v"
`include "usbSerialInterfaceEngine_h.v"

module slaveDirectControl (SCTxPortCntl, SCTxPortData, SCTxPortGnt, SCTxPortRdy, SCTxPortReq, SCTxPortWEn, clk, directControlEn, directControlLineState, rst);
input   SCTxPortGnt;
input   SCTxPortRdy;
input   clk;
input   directControlEn;
input   [1:0] directControlLineState;
input   rst;
output  [7:0] SCTxPortCntl;
output  [7:0] SCTxPortData;
output  SCTxPortReq;
output  SCTxPortWEn;

reg     [7:0] SCTxPortCntl, next_SCTxPortCntl;
reg     [7:0] SCTxPortData, next_SCTxPortData;
wire    SCTxPortGnt;
wire    SCTxPortRdy;
reg     SCTxPortReq, next_SCTxPortReq;
reg     SCTxPortWEn, next_SCTxPortWEn;
wire    clk;
wire    directControlEn;
wire    [1:0] directControlLineState;
wire    rst;

// BINARY ENCODED state machine: slvDrctCntl
// State codes definitions:
`define START_SDC 3'b000
`define CHK_DRCT_CNTL 3'b001
`define DRCT_CNTL_WAIT_GNT 3'b010
`define DRCT_CNTL_CHK_LOOP 3'b011
`define DRCT_CNTL_WAIT_RDY 3'b100
`define IDLE_FIN 3'b101
`define IDLE_WAIT_GNT 3'b110
`define IDLE_WAIT_RDY 3'b111

reg [2:0] CurrState_slvDrctCntl;
reg [2:0] NextState_slvDrctCntl;

// Diagram actions (continuous assignments allowed only: assign ...)

// diagram ACTION

//--------------------------------------------------------------------
// Machine: slvDrctCntl
//--------------------------------------------------------------------
//----------------------------------
// Next State Logic (combinatorial)
//----------------------------------
always @ (directControlLineState or directControlEn or SCTxPortGnt or SCTxPortRdy or SCTxPortReq or SCTxPortWEn or SCTxPortData or SCTxPortCntl or CurrState_slvDrctCntl)
begin : slvDrctCntl_NextState
  NextState_slvDrctCntl <= CurrState_slvDrctCntl;
  // Set default values for outputs and signals
  next_SCTxPortReq <= SCTxPortReq;
  next_SCTxPortWEn <= SCTxPortWEn;
  next_SCTxPortData <= SCTxPortData;
  next_SCTxPortCntl <= SCTxPortCntl;
  case (CurrState_slvDrctCntl)
    `START_SDC:
      NextState_slvDrctCntl <= `CHK_DRCT_CNTL;
    `CHK_DRCT_CNTL:
      if (directControlEn == 1'b1)	
      begin
        NextState_slvDrctCntl <= `DRCT_CNTL_WAIT_GNT;
        next_SCTxPortReq <= 1'b1;
      end
      else
      begin
        NextState_slvDrctCntl <= `IDLE_WAIT_GNT;
        next_SCTxPortReq <= 1'b1;
      end
    `DRCT_CNTL_WAIT_GNT:
      if (SCTxPortGnt == 1'b1)	
        NextState_slvDrctCntl <= `DRCT_CNTL_WAIT_RDY;
    `DRCT_CNTL_CHK_LOOP:
    begin
      next_SCTxPortWEn <= 1'b0;
      if (directControlEn == 1'b0)	
      begin
        NextState_slvDrctCntl <= `CHK_DRCT_CNTL;
        next_SCTxPortReq <= 1'b0;
      end
      else
        NextState_slvDrctCntl <= `DRCT_CNTL_WAIT_RDY;
    end
    `DRCT_CNTL_WAIT_RDY:
      if (SCTxPortRdy == 1'b1)	
      begin
        NextState_slvDrctCntl <= `DRCT_CNTL_CHK_LOOP;
        next_SCTxPortWEn <= 1'b1;
        next_SCTxPortData <= {6'b000000, directControlLineState};
        next_SCTxPortCntl <= `TX_DIRECT_CONTROL;
      end
    `IDLE_FIN:
    begin
      next_SCTxPortWEn <= 1'b0;
      next_SCTxPortReq <= 1'b0;
      NextState_slvDrctCntl <= `CHK_DRCT_CNTL;
    end
    `IDLE_WAIT_GNT:
      if (SCTxPortGnt == 1'b1)	
        NextState_slvDrctCntl <= `IDLE_WAIT_RDY;
    `IDLE_WAIT_RDY:
      if (SCTxPortRdy == 1'b1)	
      begin
        NextState_slvDrctCntl <= `IDLE_FIN;
        next_SCTxPortWEn <= 1'b1;
        next_SCTxPortData <= 8'h00;
        next_SCTxPortCntl <= `TX_IDLE;
      end
  endcase
end

//----------------------------------
// Current State Logic (sequential)
//----------------------------------
always @ (posedge clk)
begin : slvDrctCntl_CurrentState
  if (rst)	
    CurrState_slvDrctCntl <= `START_SDC;
  else
    CurrState_slvDrctCntl <= NextState_slvDrctCntl;
end

//----------------------------------
// Registered outputs logic
//----------------------------------
always @ (posedge clk)
begin : slvDrctCntl_RegOutput
  if (rst)	
  begin
    SCTxPortCntl <= 8'h00;
    SCTxPortData <= 8'h00;
    SCTxPortWEn <= 1'b0;
    SCTxPortReq <= 1'b0;
  end
  else 
  begin
    SCTxPortCntl <= next_SCTxPortCntl;
    SCTxPortData <= next_SCTxPortData;
    SCTxPortWEn <= next_SCTxPortWEn;
    SCTxPortReq <= next_SCTxPortReq;
  end
end

endmodule
// File        : ../RTL/slaveController/slaveGetpacket.v
// Generated   : 11/10/06 05:37:25
// From        : ../RTL/slaveController/slaveGetpacket.asf
// By          : FSM2VHDL ver. 5.0.0.9

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// slaveGetPacket
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
//// http://www.opencores.org/cores/usbhostslave/                 ////
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
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
`include "timescale.v"
`include "usbSerialInterfaceEngine_h.v"
`include "usbConstants_h.v"

module slaveGetPacket (ACKRxed, CRCError, RXDataIn, RXDataValid, RXFifoData, RXFifoFull, RXFifoWEn, RXOverflow, RXPacketRdy, RXStreamStatusIn, RXTimeOut, RxPID, SIERxTimeOut, SIERxTimeOutEn, bitStuffError, clk, dataSequence, endPointReady, getPacketEn, rst);
input   [7:0] RXDataIn;
input   RXDataValid;
input   RXFifoFull;
input   [7:0] RXStreamStatusIn;
input   SIERxTimeOut;		// Single cycle pulse
input   clk;
input   endPointReady;
input   getPacketEn;
input   rst;
output  ACKRxed;
output  CRCError;
output  [7:0] RXFifoData;
output  RXFifoWEn;
output  RXOverflow;
output  RXPacketRdy;
output  RXTimeOut;
output  [3:0] RxPID;
output  SIERxTimeOutEn;
output  bitStuffError;
output  dataSequence;

reg     ACKRxed, next_ACKRxed;
reg     CRCError, next_CRCError;
wire    [7:0] RXDataIn;
wire    RXDataValid;
reg     [7:0] RXFifoData, next_RXFifoData;
wire    RXFifoFull;
reg     RXFifoWEn, next_RXFifoWEn;
reg     RXOverflow, next_RXOverflow;
reg     RXPacketRdy, next_RXPacketRdy;
wire    [7:0] RXStreamStatusIn;
reg     RXTimeOut, next_RXTimeOut;
reg     [3:0] RxPID, next_RxPID;
wire    SIERxTimeOut;
reg     SIERxTimeOutEn, next_SIERxTimeOutEn;
reg     bitStuffError, next_bitStuffError;
wire    clk;
reg     dataSequence, next_dataSequence;
wire    endPointReady;
wire    getPacketEn;
wire    rst;

// diagram signals declarations
reg  [7:0]RXByteOld, next_RXByteOld;
reg  [7:0]RXByteOldest, next_RXByteOldest;
reg  [7:0]RXByte, next_RXByte;
reg  [7:0]RXStreamStatus, next_RXStreamStatus;

// BINARY ENCODED state machine: slvGetPkt
// State codes definitions:
`define PROC_PKT_CHK_PID 5'b00000
`define PROC_PKT_HS 5'b00001
`define PROC_PKT_DATA_W_D1 5'b00010
`define PROC_PKT_DATA_CHK_D1 5'b00011
`define PROC_PKT_DATA_W_D2 5'b00100
`define PROC_PKT_DATA_FIN 5'b00101
`define PROC_PKT_DATA_CHK_D2 5'b00110
`define PROC_PKT_DATA_W_D3 5'b00111
`define PROC_PKT_DATA_CHK_D3 5'b01000
`define PROC_PKT_DATA_LOOP_CHK_FIFO 5'b01001
`define PROC_PKT_DATA_LOOP_FIFO_FULL 5'b01010
`define PROC_PKT_DATA_LOOP_W_D 5'b01011
`define START_GP 5'b01100
`define WAIT_PKT 5'b01101
`define CHK_PKT_START 5'b01110
`define WAIT_EN 5'b01111
`define PKT_RDY 5'b10000
`define PROC_PKT_DATA_LOOP_DELAY 5'b10001
`define PROC_PKT_DATA_LOOP_EP_N_RDY 5'b10010

reg [4:0] CurrState_slvGetPkt;
reg [4:0] NextState_slvGetPkt;


//--------------------------------------------------------------------
// Machine: slvGetPkt
//--------------------------------------------------------------------
//----------------------------------
// Next State Logic (combinatorial)
//----------------------------------
always @ (RXDataIn or RXStreamStatusIn or RXByte or RXByteOldest or RXByteOld or RXDataValid or SIERxTimeOut or RXStreamStatus or getPacketEn or endPointReady or RXFifoFull or CRCError or bitStuffError or RXOverflow or RXTimeOut or ACKRxed or dataSequence or SIERxTimeOutEn or RxPID or RXPacketRdy or RXFifoWEn or RXFifoData or CurrState_slvGetPkt)
begin : slvGetPkt_NextState
  NextState_slvGetPkt <= CurrState_slvGetPkt;
  // Set default values for outputs and signals
  next_CRCError <= CRCError;
  next_bitStuffError <= bitStuffError;
  next_RXOverflow <= RXOverflow;
  next_RXTimeOut <= RXTimeOut;
  next_ACKRxed <= ACKRxed;
  next_dataSequence <= dataSequence;
  next_SIERxTimeOutEn <= SIERxTimeOutEn;
  next_RXByte <= RXByte;
  next_RXStreamStatus <= RXStreamStatus;
  next_RxPID <= RxPID;
  next_RXPacketRdy <= RXPacketRdy;
  next_RXByteOldest <= RXByteOldest;
  next_RXByteOld <= RXByteOld;
  next_RXFifoWEn <= RXFifoWEn;
  next_RXFifoData <= RXFifoData;
  case (CurrState_slvGetPkt)
    `START_GP:
      NextState_slvGetPkt <= `WAIT_EN;
    `WAIT_PKT:
    begin
      next_CRCError <= 1'b0;
      next_bitStuffError <= 1'b0;
      next_RXOverflow <= 1'b0;
      next_RXTimeOut <= 1'b0;
      next_ACKRxed <= 1'b0;
      next_dataSequence <= 1'b0;
      next_SIERxTimeOutEn <= 1'b1;
      if (RXDataValid == 1'b1)	
      begin
        NextState_slvGetPkt <= `CHK_PKT_START;
        next_RXByte <= RXDataIn;
        next_RXStreamStatus <= RXStreamStatusIn;
      end
      else if (SIERxTimeOut == 1'b1)	
      begin
        NextState_slvGetPkt <= `PKT_RDY;
        next_RXTimeOut <= 1'b1;
      end
    end
    `CHK_PKT_START:
      if (RXStreamStatus == `RX_PACKET_START)	
      begin
        NextState_slvGetPkt <= `PROC_PKT_CHK_PID;
        next_RxPID <= RXByte[3:0];
      end
      else
      begin
        NextState_slvGetPkt <= `PKT_RDY;
        next_RXTimeOut <= 1'b1;
      end
    `WAIT_EN:
    begin
      next_RXPacketRdy <= 1'b0;
      next_SIERxTimeOutEn <= 1'b0;
      if (getPacketEn == 1'b1)	
        NextState_slvGetPkt <= `WAIT_PKT;
    end
    `PKT_RDY:
    begin
      next_RXPacketRdy <= 1'b1;
      NextState_slvGetPkt <= `WAIT_EN;
    end
    `PROC_PKT_CHK_PID:
      if (RXByte[1:0] == `HANDSHAKE)	
        NextState_slvGetPkt <= `PROC_PKT_HS;
      else if (RXByte[1:0] == `DATA)	
        NextState_slvGetPkt <= `PROC_PKT_DATA_W_D1;
      else
        NextState_slvGetPkt <= `PKT_RDY;
    `PROC_PKT_HS:
      if (RXDataValid == 1'b1)	
      begin
        NextState_slvGetPkt <= `PKT_RDY;
        next_RXOverflow <= RXDataIn[`RX_OVERFLOW_BIT];
        next_ACKRxed <= RXDataIn[`ACK_RXED_BIT];
      end
    `PROC_PKT_DATA_W_D1:
      if (RXDataValid == 1'b1)	
      begin
        NextState_slvGetPkt <= `PROC_PKT_DATA_CHK_D1;
        next_RXByte <= RXDataIn;
        next_RXStreamStatus <= RXStreamStatusIn;
      end
    `PROC_PKT_DATA_CHK_D1:
      if (RXStreamStatus == `RX_PACKET_STREAM)	
      begin
        NextState_slvGetPkt <= `PROC_PKT_DATA_W_D2;
        next_RXByteOldest <= RXByte;
      end
      else
        NextState_slvGetPkt <= `PROC_PKT_DATA_FIN;
    `PROC_PKT_DATA_W_D2:
      if (RXDataValid == 1'b1)	
      begin
        NextState_slvGetPkt <= `PROC_PKT_DATA_CHK_D2;
        next_RXByte <= RXDataIn;
        next_RXStreamStatus <= RXStreamStatusIn;
      end
    `PROC_PKT_DATA_FIN:
    begin
      next_CRCError <= RXByte[`CRC_ERROR_BIT];
      next_bitStuffError <= RXByte[`BIT_STUFF_ERROR_BIT];
      next_dataSequence <= RXByte[`DATA_SEQUENCE_BIT];
      NextState_slvGetPkt <= `PKT_RDY;
    end
    `PROC_PKT_DATA_CHK_D2:
      if (RXStreamStatus == `RX_PACKET_STREAM)	
      begin
        NextState_slvGetPkt <= `PROC_PKT_DATA_W_D3;
        next_RXByteOld <= RXByte;
      end
      else
        NextState_slvGetPkt <= `PROC_PKT_DATA_FIN;
    `PROC_PKT_DATA_W_D3:
      if (RXDataValid == 1'b1)	
      begin
        NextState_slvGetPkt <= `PROC_PKT_DATA_CHK_D3;
        next_RXByte <= RXDataIn;
        next_RXStreamStatus <= RXStreamStatusIn;
      end
    `PROC_PKT_DATA_CHK_D3:
      if (RXStreamStatus == `RX_PACKET_STREAM)	
        NextState_slvGetPkt <= `PROC_PKT_DATA_LOOP_CHK_FIFO;
      else
        NextState_slvGetPkt <= `PROC_PKT_DATA_FIN;
    `PROC_PKT_DATA_LOOP_CHK_FIFO:
      if (endPointReady == 1'b0)	
        NextState_slvGetPkt <= `PROC_PKT_DATA_LOOP_EP_N_RDY;
      else if (RXFifoFull == 1'b1)	
      begin
        NextState_slvGetPkt <= `PROC_PKT_DATA_LOOP_FIFO_FULL;
        next_RXOverflow <= 1'b1;
      end
      else
      begin
        NextState_slvGetPkt <= `PROC_PKT_DATA_LOOP_W_D;
        next_RXFifoWEn <= 1'b1;
        next_RXFifoData <= RXByteOldest;
        next_RXByteOldest <= RXByteOld;
        next_RXByteOld <= RXByte;
      end
    `PROC_PKT_DATA_LOOP_FIFO_FULL:
      NextState_slvGetPkt <= `PROC_PKT_DATA_LOOP_W_D;
    `PROC_PKT_DATA_LOOP_W_D:
    begin
      next_RXFifoWEn <= 1'b0;
      if ((RXDataValid == 1'b1) && (RXStreamStatusIn == `RX_PACKET_STREAM))	
      begin
        NextState_slvGetPkt <= `PROC_PKT_DATA_LOOP_DELAY;
        next_RXByte <= RXDataIn;
      end
      else if (RXDataValid == 1'b1)	
      begin
        NextState_slvGetPkt <= `PROC_PKT_DATA_FIN;
        next_RXByte <= RXDataIn;
      end
    end
    `PROC_PKT_DATA_LOOP_DELAY:
      NextState_slvGetPkt <= `PROC_PKT_DATA_LOOP_CHK_FIFO;
    `PROC_PKT_DATA_LOOP_EP_N_RDY:    // Discard data
      NextState_slvGetPkt <= `PROC_PKT_DATA_LOOP_W_D;
  endcase
end

//----------------------------------
// Current State Logic (sequential)
//----------------------------------
always @ (posedge clk)
begin : slvGetPkt_CurrentState
  if (rst)	
    CurrState_slvGetPkt <= `START_GP;
  else
    CurrState_slvGetPkt <= NextState_slvGetPkt;
end

//----------------------------------
// Registered outputs logic
//----------------------------------
always @ (posedge clk)
begin : slvGetPkt_RegOutput
  if (rst)	
  begin
    RXByteOld <= 8'h00;
    RXByteOldest <= 8'h00;
    RXByte <= 8'h00;
    RXStreamStatus <= 8'h00;
    RXPacketRdy <= 1'b0;
    RXFifoWEn <= 1'b0;
    RXFifoData <= 8'h00;
    CRCError <= 1'b0;
    bitStuffError <= 1'b0;
    RXOverflow <= 1'b0;
    RXTimeOut <= 1'b0;
    ACKRxed <= 1'b0;
    dataSequence <= 1'b0;
    SIERxTimeOutEn <= 1'b0;
    RxPID <= 4'h0;
  end
  else 
  begin
    RXByteOld <= next_RXByteOld;
    RXByteOldest <= next_RXByteOldest;
    RXByte <= next_RXByte;
    RXStreamStatus <= next_RXStreamStatus;
    RXPacketRdy <= next_RXPacketRdy;
    RXFifoWEn <= next_RXFifoWEn;
    RXFifoData <= next_RXFifoData;
    CRCError <= next_CRCError;
    bitStuffError <= next_bitStuffError;
    RXOverflow <= next_RXOverflow;
    RXTimeOut <= next_RXTimeOut;
    ACKRxed <= next_ACKRxed;
    dataSequence <= next_dataSequence;
    SIERxTimeOutEn <= next_SIERxTimeOutEn;
    RxPID <= next_RxPID;
  end
end

endmodule//////////////////////////////////////////////////////////////////////
////                                                              ////
//// slaveRxStatusMonitor.v                                       ////
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
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

module slaveRxStatusMonitor(connectStateIn, connectStateOut, resumeDetectedIn, resetEventOut, resumeIntOut, clk, rst);

input [1:0] connectStateIn;
input resumeDetectedIn;
input clk;
input rst;
output resetEventOut;
output [1:0] connectStateOut;
output resumeIntOut;

wire [1:0] connectStateIn;
wire resumeDetectedIn;
reg resetEventOut;
reg [1:0] connectStateOut;
reg resumeIntOut;
wire clk;
wire rst;

reg [1:0]oldConnectState;
reg oldResumeDetected;

always @(connectStateIn)
begin
  connectStateOut <= connectStateIn;
end


always @(posedge clk)
begin
  if (rst == 1'b1)
  begin
    oldConnectState <= connectStateIn;
    oldResumeDetected <= resumeDetectedIn;
  end
  else
  begin
    oldConnectState <= connectStateIn;
    oldResumeDetected <= resumeDetectedIn;
    if (oldConnectState != connectStateIn)
      resetEventOut <= 1'b1;
    else
      resetEventOut <= 1'b0;
    if (resumeDetectedIn == 1'b1 && oldResumeDetected == 1'b0)
      resumeIntOut <= 1'b1;
    else 
      resumeIntOut <= 1'b0;
  end
end

endmodule

// File        : ../RTL/slaveController/slaveSendpacket.v
// Generated   : 11/10/06 05:37:26
// From        : ../RTL/slaveController/slaveSendpacket.asf
// By          : FSM2VHDL ver. 5.0.0.9

//////////////////////////////////////////////////////////////////////
////                                                              ////
//// slaveSendPacket
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
//// http://www.opencores.org/cores/usbhostslave/                 ////
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
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
//
`include "timescale.v"
`include "usbSerialInterfaceEngine_h.v"
`include "usbConstants_h.v"

module slaveSendPacket (PID, SCTxPortCntl, SCTxPortData, SCTxPortGnt, SCTxPortRdy, SCTxPortReq, SCTxPortWEn, clk, fifoData, fifoEmpty, fifoReadEn, rst, sendPacketRdy, sendPacketWEn);
input   [3:0] PID;
input   SCTxPortGnt;
input   SCTxPortRdy;
input   clk;
input   [7:0] fifoData;
input   fifoEmpty;
input   rst;
input   sendPacketWEn;
output  [7:0] SCTxPortCntl;
output  [7:0] SCTxPortData;
output  SCTxPortReq;
output  SCTxPortWEn;
output  fifoReadEn;
output  sendPacketRdy;

wire    [3:0] PID;
reg     [7:0] SCTxPortCntl, next_SCTxPortCntl;
reg     [7:0] SCTxPortData, next_SCTxPortData;
wire    SCTxPortGnt;
wire    SCTxPortRdy;
reg     SCTxPortReq, next_SCTxPortReq;
reg     SCTxPortWEn, next_SCTxPortWEn;
wire    clk;
wire    [7:0] fifoData;
wire    fifoEmpty;
reg     fifoReadEn, next_fifoReadEn;
wire    rst;
reg     sendPacketRdy, next_sendPacketRdy;
wire    sendPacketWEn;

// diagram signals declarations
reg  [7:0]PIDNotPID;

// BINARY ENCODED state machine: slvSndPkt
// State codes definitions:
`define START_SP1 4'b0000
`define SP_WAIT_ENABLE 4'b0001
`define SP1_WAIT_GNT 4'b0010
`define SP_SEND_PID_WAIT_RDY 4'b0011
`define SP_SEND_PID_FIN 4'b0100
`define FIN_SP1 4'b0101
`define SP_D0_D1_READ_FIFO 4'b0110
`define SP_D0_D1_WAIT_READ_FIFO 4'b0111
`define SP_D0_D1_FIFO_EMPTY 4'b1000
`define SP_D0_D1_FIN 4'b1001
`define SP_D0_D1_TERM_BYTE 4'b1010
`define SP_NOT_DATA 4'b1011
`define SP_D0_D1_CLR_WEN 4'b1100
`define SP_D0_D1_CLR_REN 4'b1101

reg [3:0] CurrState_slvSndPkt;
reg [3:0] NextState_slvSndPkt;

// Diagram actions (continuous assignments allowed only: assign ...)

always @(PID)
begin
    PIDNotPID <=  { (PID ^ 4'hf), PID };
end

//--------------------------------------------------------------------
// Machine: slvSndPkt
//--------------------------------------------------------------------
//----------------------------------
// Next State Logic (combinatorial)
//----------------------------------
always @ (PIDNotPID or fifoData or sendPacketWEn or SCTxPortGnt or SCTxPortRdy or PID or fifoEmpty or sendPacketRdy or SCTxPortReq or SCTxPortWEn or SCTxPortData or SCTxPortCntl or fifoReadEn or CurrState_slvSndPkt)
begin : slvSndPkt_NextState
  NextState_slvSndPkt <= CurrState_slvSndPkt;
  // Set default values for outputs and signals
  next_sendPacketRdy <= sendPacketRdy;
  next_SCTxPortReq <= SCTxPortReq;
  next_SCTxPortWEn <= SCTxPortWEn;
  next_SCTxPortData <= SCTxPortData;
  next_SCTxPortCntl <= SCTxPortCntl;
  next_fifoReadEn <= fifoReadEn;
  case (CurrState_slvSndPkt)
    `START_SP1:
      NextState_slvSndPkt <= `SP_WAIT_ENABLE;
    `SP_WAIT_ENABLE:
      if (sendPacketWEn == 1'b1)	
      begin
        NextState_slvSndPkt <= `SP1_WAIT_GNT;
        next_sendPacketRdy <= 1'b0;
        next_SCTxPortReq <= 1'b1;
      end
    `SP1_WAIT_GNT:
      if (SCTxPortGnt == 1'b1)	
        NextState_slvSndPkt <= `SP_SEND_PID_WAIT_RDY;
    `FIN_SP1:
    begin
      NextState_slvSndPkt <= `SP_WAIT_ENABLE;
      next_sendPacketRdy <= 1'b1;
      next_SCTxPortReq <= 1'b0;
    end
    `SP_NOT_DATA:
      NextState_slvSndPkt <= `FIN_SP1;
    `SP_SEND_PID_WAIT_RDY:
      if (SCTxPortRdy == 1'b1)	
      begin
        NextState_slvSndPkt <= `SP_SEND_PID_FIN;
        next_SCTxPortWEn <= 1'b1;
        next_SCTxPortData <= PIDNotPID;
        next_SCTxPortCntl <= `TX_PACKET_START;
      end
    `SP_SEND_PID_FIN:
    begin
      next_SCTxPortWEn <= 1'b0;
      if (PID == `DATA0 || PID == `DATA1)	
        NextState_slvSndPkt <= `SP_D0_D1_FIFO_EMPTY;
      else
        NextState_slvSndPkt <= `SP_NOT_DATA;
    end
    `SP_D0_D1_READ_FIFO:
    begin
      next_SCTxPortWEn <= 1'b1;
      next_SCTxPortData <= fifoData;
      next_SCTxPortCntl <= `TX_PACKET_STREAM;
      NextState_slvSndPkt <= `SP_D0_D1_CLR_WEN;
    end
    `SP_D0_D1_WAIT_READ_FIFO:
      if (SCTxPortRdy == 1'b1)	
      begin
        NextState_slvSndPkt <= `SP_D0_D1_CLR_REN;
        next_fifoReadEn <= 1'b1;
      end
    `SP_D0_D1_FIFO_EMPTY:
      if (fifoEmpty == 1'b0)	
        NextState_slvSndPkt <= `SP_D0_D1_WAIT_READ_FIFO;
      else
        NextState_slvSndPkt <= `SP_D0_D1_TERM_BYTE;
    `SP_D0_D1_FIN:
    begin
      next_SCTxPortWEn <= 1'b0;
      NextState_slvSndPkt <= `FIN_SP1;
    end
    `SP_D0_D1_TERM_BYTE:
      if (SCTxPortRdy == 1'b1)	
      begin
        NextState_slvSndPkt <= `SP_D0_D1_FIN;
        //Last byte is not valid data,
        //but the 'TX_PACKET_STOP' flag is required
        //by the SIE state machine to detect end of data packet
        next_SCTxPortWEn <= 1'b1;
        next_SCTxPortData <= 8'h00;
        next_SCTxPortCntl <= `TX_PACKET_STOP;
      end
    `SP_D0_D1_CLR_WEN:
    begin
      next_SCTxPortWEn <= 1'b0;
      NextState_slvSndPkt <= `SP_D0_D1_FIFO_EMPTY;
    end
    `SP_D0_D1_CLR_REN:
    begin
      next_fifoReadEn <= 1'b0;
      NextState_slvSndPkt <= `SP_D0_D1_READ_FIFO;
    end
  endcase
end

//----------------------------------
// Current State Logic (sequential)
//----------------------------------
always @ (posedge clk)
begin : slvSndPkt_CurrentState
  if (rst)	
    CurrState_slvSndPkt <= `START_SP1;
  else
    CurrState_slvSndPkt <= NextState_slvSndPkt;
end

//----------------------------------
// Registered outputs logic
//----------------------------------
always @ (posedge clk)
begin : slvSndPkt_RegOutput
  if (rst)	
  begin
    sendPacketRdy <= 1'b1;
    SCTxPortReq <= 1'b0;
    SCTxPortWEn <= 1'b0;
    SCTxPortData <= 8'h00;
    SCTxPortCntl <= 8'h00;
    fifoReadEn <= 1'b0;
  end
  else 
  begin
    sendPacketRdy <= next_sendPacketRdy;
    SCTxPortReq <= next_SCTxPortReq;
    SCTxPortWEn <= next_SCTxPortWEn;
    SCTxPortData <= next_SCTxPortData;
    SCTxPortCntl <= next_SCTxPortCntl;
    fifoReadEn <= next_fifoReadEn;
  end
end

endmodule//////////////////////////////////////////////////////////////////////
////                                                              ////
//// USBSlaveControlBI.v                                          ////
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
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
`include "usbSlaveControl_h.v"
 
module USBSlaveControlBI (address, dataIn, dataOut, writeEn,
  strobe_i,
  busClk, 
  rstSyncToBusClk,
  usbClk, 
  rstSyncToUsbClk,
  SOFRxedIntOut, resetEventIntOut, resumeIntOut, transDoneIntOut, NAKSentIntOut, vBusDetIntOut,
  endP0TransTypeReg, endP0NAKTransTypeReg,
  endP1TransTypeReg, endP1NAKTransTypeReg,
  endP2TransTypeReg, endP2NAKTransTypeReg,
  endP3TransTypeReg, endP3NAKTransTypeReg,
  endP0ControlReg,
  endP1ControlReg,
  endP2ControlReg,
  endP3ControlReg,
  EP0StatusReg,
  EP1StatusReg,
  EP2StatusReg,
  EP3StatusReg,
  SCAddrReg, frameNum,
  connectStateIn,
  vBusDetectIn,
  SOFRxedIn, resetEventIn, resumeIntIn, transDoneIn, NAKSentIn,
  slaveControlSelect,
  clrEP0Ready, clrEP1Ready, clrEP2Ready, clrEP3Ready,
  TxLineState,
  LineDirectControlEn,
  fullSpeedPol, 
  fullSpeedRate,
  connectSlaveToHost,
  SCGlobalEn
  );
input [4:0] address;
input [7:0] dataIn;
input writeEn; 
input strobe_i;
input busClk; 
input rstSyncToBusClk;
input usbClk; 
input rstSyncToUsbClk;
output [7:0] dataOut;
output SOFRxedIntOut;
output resetEventIntOut;
output resumeIntOut;
output transDoneIntOut;
output NAKSentIntOut;
output vBusDetIntOut;

input [1:0] endP0TransTypeReg;
input [1:0] endP0NAKTransTypeReg;
input [1:0] endP1TransTypeReg; 
input [1:0] endP1NAKTransTypeReg;
input [1:0] endP2TransTypeReg; 
input [1:0] endP2NAKTransTypeReg;
input [1:0] endP3TransTypeReg; 
input [1:0] endP3NAKTransTypeReg;
output [4:0] endP0ControlReg;
output [4:0] endP1ControlReg;
output [4:0] endP2ControlReg;
output [4:0] endP3ControlReg;
input [7:0] EP0StatusReg;
input [7:0] EP1StatusReg;
input [7:0] EP2StatusReg;
input [7:0] EP3StatusReg;
output [6:0] SCAddrReg;
input [10:0] frameNum;
input [1:0] connectStateIn;
input vBusDetectIn;
input SOFRxedIn;
input resetEventIn;
input resumeIntIn;
input transDoneIn;
input NAKSentIn;
input slaveControlSelect;
input clrEP0Ready;
input clrEP1Ready;
input clrEP2Ready;
input clrEP3Ready;
output [1:0] TxLineState;
output LineDirectControlEn;
output fullSpeedPol; 
output fullSpeedRate;
output connectSlaveToHost;
output SCGlobalEn;

wire [4:0] address;
wire [7:0] dataIn;
wire writeEn;
wire strobe_i;
wire busClk; 
wire rstSyncToBusClk;
wire usbClk; 
wire rstSyncToUsbClk;
reg [7:0] dataOut;

reg SOFRxedIntOut;
reg resetEventIntOut;
reg resumeIntOut;
reg transDoneIntOut;
reg NAKSentIntOut;
reg vBusDetIntOut;

wire [1:0] endP0TransTypeReg;
wire [1:0] endP0NAKTransTypeReg;
wire [1:0] endP1TransTypeReg; 
wire [1:0] endP1NAKTransTypeReg;
wire [1:0] endP2TransTypeReg; 
wire [1:0] endP2NAKTransTypeReg;
wire [1:0] endP3TransTypeReg; 
wire [1:0] endP3NAKTransTypeReg;
reg [4:0] endP0ControlReg;
reg [4:0] endP0ControlReg1;
reg [4:0] endP1ControlReg;
reg [4:0] endP1ControlReg1;
reg [4:0] endP2ControlReg;
reg [4:0] endP2ControlReg1;
reg [4:0] endP3ControlReg;
reg [4:0] endP3ControlReg1;
wire [7:0] EP0StatusReg;
wire [7:0] EP1StatusReg;
wire [7:0] EP2StatusReg;
wire [7:0] EP3StatusReg;
reg [6:0] SCAddrReg;
reg [3:0] TxEndPReg;
wire [10:0] frameNum;
wire [1:0] connectStateIn;

wire SOFRxedIn;
wire resetEventIn;
wire resumeIntIn;
wire transDoneIn;
wire NAKSentIn;
wire slaveControlSelect;
wire clrEP0Ready;
wire clrEP1Ready;
wire clrEP2Ready;
wire clrEP3Ready;
reg [1:0] TxLineState;
reg [1:0] TxLineState_reg1;
reg LineDirectControlEn;
reg LineDirectControlEn_reg1;
reg fullSpeedPol; 
reg fullSpeedPol_reg1; 
reg fullSpeedRate;
reg fullSpeedRate_reg1;
reg connectSlaveToHost;
reg connectSlaveToHost_reg1;
reg SCGlobalEn;
reg SCGlobalEn_reg1;

//internal wire and regs
reg [6:0] SCControlReg;
reg clrVBusDetReq;
reg clrNAKReq;
reg clrSOFReq;
reg clrResetReq;
reg clrResInReq;
reg clrTransDoneReq;
reg SOFRxedInt;
reg resetEventInt;
reg resumeInt;
reg transDoneInt;
reg vBusDetInt;
reg NAKSentInt;
reg [5:0] interruptMaskReg;
reg EP0SetReady;
reg EP1SetReady;
reg EP2SetReady;
reg EP3SetReady;
reg EP0SendStall;
reg EP1SendStall;
reg EP2SendStall;
reg EP3SendStall;
reg EP0IsoEn;
reg EP1IsoEn;
reg EP2IsoEn;
reg EP3IsoEn;
reg EP0DataSequence;
reg EP1DataSequence;
reg EP2DataSequence;
reg EP3DataSequence;
reg EP0Enable;
reg EP1Enable;
reg EP2Enable;
reg EP3Enable;
reg EP0Ready;
reg EP1Ready;
reg EP2Ready;
reg EP3Ready;
reg [2:0] SOFRxedInExtend;
reg [2:0] resetEventInExtend;
reg [2:0] resumeIntInExtend;
reg [2:0] transDoneInExtend;
reg [2:0] NAKSentInExtend;
reg [2:0] clrEP0ReadyExtend;
reg [2:0] clrEP1ReadyExtend;
reg [2:0] clrEP2ReadyExtend;
reg [2:0] clrEP3ReadyExtend;


//clock domain crossing sync registers
//STB = Sync To Busclk
reg [4:0] endP0ControlRegSTB;
reg [4:0] endP1ControlRegSTB;
reg [4:0] endP2ControlRegSTB;
reg [4:0] endP3ControlRegSTB;
reg [2:0] NAKSentInSTB;
reg [2:0] SOFRxedInSTB;
reg [2:0] resetEventInSTB;
reg [2:0] resumeIntInSTB;
reg [2:0] transDoneInSTB;
reg [2:0] clrEP0ReadySTB;
reg [2:0] clrEP1ReadySTB;
reg [2:0] clrEP2ReadySTB;
reg [2:0] clrEP3ReadySTB;
reg SCGlobalEnSTB;
reg [1:0] TxLineStateSTB;
reg LineDirectControlEnSTB;
reg fullSpeedPolSTB; 
reg fullSpeedRateSTB;
reg connectSlaveToHostSTB;
reg [7:0] EP0StatusRegSTB;
reg [7:0] EP0StatusRegSTB_reg1;
reg [7:0] EP1StatusRegSTB;
reg [7:0] EP1StatusRegSTB_reg1;
reg [7:0] EP2StatusRegSTB;
reg [7:0] EP2StatusRegSTB_reg1;
reg [7:0] EP3StatusRegSTB;
reg [7:0] EP3StatusRegSTB_reg1;
reg [1:0] endP0TransTypeRegSTB;
reg [1:0] endP0TransTypeRegSTB_reg1;
reg [1:0] endP0NAKTransTypeRegSTB;
reg [1:0] endP0NAKTransTypeRegSTB_reg1;
reg [1:0] endP1TransTypeRegSTB; 
reg [1:0] endP1TransTypeRegSTB_reg1; 
reg [1:0] endP1NAKTransTypeRegSTB;
reg [1:0] endP1NAKTransTypeRegSTB_reg1;
reg [1:0] endP2TransTypeRegSTB; 
reg [1:0] endP2TransTypeRegSTB_reg1; 
reg [1:0] endP2NAKTransTypeRegSTB;
reg [1:0] endP2NAKTransTypeRegSTB_reg1;
reg [1:0] endP3TransTypeRegSTB; 
reg [1:0] endP3TransTypeRegSTB_reg1; 
reg [1:0] endP3NAKTransTypeRegSTB;
reg [1:0] endP3NAKTransTypeRegSTB_reg1;
reg [10:0] frameNumSTB;
reg [10:0] frameNumSTB_reg1;
reg [2:0] vBusDetectInSTB;
reg [1:0] connectStateInSTB;
reg [1:0] connectStateInSTB_reg1;

  
//sync write demux
always @(posedge busClk)
begin   
  if (rstSyncToBusClk == 1'b1) begin
    EP0IsoEn <= 1'b0;
    EP0SendStall <= 1'b0;
    EP0DataSequence <= 1'b0;
    EP0Enable <= 1'b0;
    EP1IsoEn <= 1'b0;
    EP1SendStall <= 1'b0;
    EP1DataSequence <= 1'b0;
    EP1Enable <= 1'b0;
    EP2IsoEn <= 1'b0;
    EP2SendStall <= 1'b0;
    EP2DataSequence <= 1'b0;
    EP2Enable <= 1'b0;
    EP3IsoEn <= 1'b0;
    EP3SendStall <= 1'b0;
    EP3DataSequence <= 1'b0;
    EP3Enable <= 1'b0;
    SCControlReg <= 7'h00;
    SCAddrReg <= 7'h00;
    interruptMaskReg <= 6'h00;
  end
  else begin
    clrVBusDetReq <= 1'b0;
    clrNAKReq <= 1'b0;
    clrSOFReq <= 1'b0;
    clrResetReq <= 1'b0;
    clrResInReq <= 1'b0;
    clrTransDoneReq <= 1'b0;
    EP0SetReady <= 1'b0;
    EP1SetReady <= 1'b0;
    EP2SetReady <= 1'b0;
    EP3SetReady <= 1'b0;
    if (writeEn == 1'b1 && strobe_i == 1'b1 && slaveControlSelect == 1'b1)
    begin
      case (address)
        `EP0_CTRL_REG : begin
          EP0IsoEn <= dataIn[`ENDPOINT_ISO_ENABLE_BIT];
          EP0SendStall <= dataIn[`ENDPOINT_SEND_STALL_BIT];
          EP0DataSequence <= dataIn[`ENDPOINT_OUTDATA_SEQUENCE_BIT];
          EP0SetReady <= dataIn[`ENDPOINT_READY_BIT];
          EP0Enable <= dataIn[`ENDPOINT_ENABLE_BIT];
        end
        `EP1_CTRL_REG : begin
          EP1IsoEn <= dataIn[`ENDPOINT_ISO_ENABLE_BIT];
          EP1SendStall <= dataIn[`ENDPOINT_SEND_STALL_BIT];
          EP1DataSequence <= dataIn[`ENDPOINT_OUTDATA_SEQUENCE_BIT];
          EP1SetReady <= dataIn[`ENDPOINT_READY_BIT];
          EP1Enable <= dataIn[`ENDPOINT_ENABLE_BIT];
        end
        `EP2_CTRL_REG : begin
          EP2IsoEn <= dataIn[`ENDPOINT_ISO_ENABLE_BIT];
          EP2SendStall <= dataIn[`ENDPOINT_SEND_STALL_BIT];
          EP2DataSequence <= dataIn[`ENDPOINT_OUTDATA_SEQUENCE_BIT];
          EP2SetReady <= dataIn[`ENDPOINT_READY_BIT];
          EP2Enable <= dataIn[`ENDPOINT_ENABLE_BIT];
        end
        `EP3_CTRL_REG : begin
          EP3IsoEn <= dataIn[`ENDPOINT_ISO_ENABLE_BIT];
          EP3SendStall <= dataIn[`ENDPOINT_SEND_STALL_BIT];
          EP3DataSequence <= dataIn[`ENDPOINT_OUTDATA_SEQUENCE_BIT];
          EP3SetReady <= dataIn[`ENDPOINT_READY_BIT];
          EP3Enable <= dataIn[`ENDPOINT_ENABLE_BIT];
        end
        `SC_CONTROL_REG : SCControlReg <= dataIn[6:0];
        `SC_ADDRESS : SCAddrReg <= dataIn[6:0];
        `SC_INTERRUPT_STATUS_REG : begin
          clrVBusDetReq <= dataIn[`VBUS_DET_INT_BIT];
          clrNAKReq <= dataIn[`NAK_SENT_INT_BIT];
          clrSOFReq <= dataIn[`SOF_RECEIVED_BIT];
          clrResetReq <= dataIn[`RESET_EVENT_BIT];
          clrResInReq <= dataIn[`RESUME_INT_BIT];
          clrTransDoneReq <= dataIn[`TRANS_DONE_BIT];
        end
        `SC_INTERRUPT_MASK_REG  : interruptMaskReg <= dataIn[5:0];
      endcase
    end
  end
end

//interrupt control 
always @(posedge busClk)
begin
  if (rstSyncToBusClk == 1'b1) begin
    vBusDetInt <= 1'b0;
    NAKSentInt <= 1'b0;
    SOFRxedInt <= 1'b0;
    resetEventInt <= 1'b0;
    resumeInt <= 1'b0;
    transDoneInt <= 1'b0;
  end
  else begin
    if (vBusDetectInSTB[0] != vBusDetectInSTB[1])
      vBusDetInt <= 1'b1;
    else if (clrVBusDetReq == 1'b1)
      vBusDetInt <= 1'b0; 

    if (NAKSentInSTB[1] == 1'b1 && NAKSentInSTB[0] == 1'b0)
      NAKSentInt <= 1'b1;
    else if (clrNAKReq == 1'b1)
      NAKSentInt <= 1'b0; 
    
    if (SOFRxedInSTB[1] == 1'b1 && SOFRxedInSTB[0] == 1'b0)
      SOFRxedInt <= 1'b1;
    else if (clrSOFReq == 1'b1)
      SOFRxedInt <= 1'b0;
    
    if (resetEventInSTB[1] == 1'b1 && resetEventInSTB[0] == 1'b0)
      resetEventInt <= 1'b1;
    else if (clrResetReq == 1'b1)
      resetEventInt <= 1'b0;
    
    if (resumeIntInSTB[1] == 1'b1 && resumeIntInSTB[0] == 1'b0)
      resumeInt <= 1'b1;
    else if (clrResInReq == 1'b1)
      resumeInt <= 1'b0;

    if (transDoneInSTB[1] == 1'b1 && transDoneInSTB[0] == 1'b0)
      transDoneInt <= 1'b1;
    else if (clrTransDoneReq == 1'b1)
      transDoneInt <= 1'b0;
  end
end

//mask interrupts
always @(*) begin
  transDoneIntOut <= transDoneInt & interruptMaskReg[`TRANS_DONE_BIT];
  resumeIntOut <= resumeInt & interruptMaskReg[`RESUME_INT_BIT];
  resetEventIntOut <= resetEventInt & interruptMaskReg[`RESET_EVENT_BIT];
  SOFRxedIntOut <= SOFRxedInt & interruptMaskReg[`SOF_RECEIVED_BIT];
  NAKSentIntOut <= NAKSentInt & interruptMaskReg[`NAK_SENT_INT_BIT];
  vBusDetIntOut <= vBusDetInt & interruptMaskReg[`VBUS_DET_INT_BIT];
end  

//end point ready, set/clear
//Since 'busClk' can be a higher freq than 'usbClk',
//'EP0SetReady' etc must be delayed with respect to other control signals, thus
//ensuring that control signals have been clocked through to 'usbClk' clock
//domain before the ready is asserted.
//Not sure this is required because there is at least two 'usbClk' ticks between
//detection of 'EP0Ready' and sampling of related control signals.
always @(posedge busClk)
begin
  if (rstSyncToBusClk == 1'b1) begin
    EP0Ready <= 1'b0;
    EP1Ready <= 1'b0;
    EP2Ready <= 1'b0;
    EP3Ready <= 1'b0;
  end
  else begin
    if (EP0SetReady == 1'b1)
      EP0Ready <= 1'b1;
    else if (clrEP0ReadySTB[1] == 1'b1 && clrEP0ReadySTB[0] == 1'b0)
      EP0Ready <= 1'b0;
    
    if (EP1SetReady == 1'b1)
      EP1Ready <= 1'b1;
    else if (clrEP1ReadySTB[1] == 1'b1 && clrEP1ReadySTB[0] == 1'b0)
      EP1Ready <= 1'b0;
    
    if (EP2SetReady == 1'b1)
      EP2Ready <= 1'b1;
    else if (clrEP2ReadySTB[1] == 1'b1 && clrEP2ReadySTB[0] == 1'b0)
      EP2Ready <= 1'b0;
    
    if (EP3SetReady == 1'b1)
      EP3Ready <= 1'b1;
    else if (clrEP3ReadySTB[1] == 1'b1 && clrEP3ReadySTB[0] == 1'b0)
      EP3Ready <= 1'b0;
  end
end  
  
//break out control signals
always @(SCControlReg) begin
  SCGlobalEnSTB <= SCControlReg[`SC_GLOBAL_ENABLE_BIT];
  TxLineStateSTB <= SCControlReg[`SC_TX_LINE_STATE_MSBIT:`SC_TX_LINE_STATE_LSBIT];
  LineDirectControlEnSTB <= SCControlReg[`SC_DIRECT_CONTROL_BIT];
  fullSpeedPolSTB <= SCControlReg[`SC_FULL_SPEED_LINE_POLARITY_BIT]; 
  fullSpeedRateSTB <= SCControlReg[`SC_FULL_SPEED_LINE_RATE_BIT];
  connectSlaveToHostSTB <= SCControlReg[`SC_CONNECT_TO_HOST_BIT];
end

//combine endpoint control signals 
always @(*) 
begin
  endP0ControlRegSTB <= {EP0IsoEn, EP0SendStall, EP0DataSequence, EP0Ready, EP0Enable};
  endP1ControlRegSTB <= {EP1IsoEn, EP1SendStall, EP1DataSequence, EP1Ready, EP1Enable};
  endP2ControlRegSTB <= {EP2IsoEn, EP2SendStall, EP2DataSequence, EP2Ready, EP2Enable};
  endP3ControlRegSTB <= {EP3IsoEn, EP3SendStall, EP3DataSequence, EP3Ready, EP3Enable};
end
      
      
// async read mux
always @(*)
begin
  case (address)
      `EP0_CTRL_REG : dataOut <= endP0ControlRegSTB;
      `EP0_STS_REG : dataOut <= EP0StatusRegSTB;
      `EP0_TRAN_TYPE_STS_REG : dataOut <= endP0TransTypeRegSTB;
      `EP0_NAK_TRAN_TYPE_STS_REG : dataOut <= endP0NAKTransTypeRegSTB;
      `EP1_CTRL_REG : dataOut <= endP1ControlRegSTB;
      `EP1_STS_REG :  dataOut <= EP1StatusRegSTB;
      `EP1_TRAN_TYPE_STS_REG : dataOut <= endP1TransTypeRegSTB;
      `EP1_NAK_TRAN_TYPE_STS_REG : dataOut <= endP1NAKTransTypeRegSTB;
      `EP2_CTRL_REG : dataOut <= endP2ControlRegSTB;
      `EP2_STS_REG :  dataOut <= EP2StatusRegSTB;
      `EP2_TRAN_TYPE_STS_REG : dataOut <= endP2TransTypeRegSTB;
      `EP2_NAK_TRAN_TYPE_STS_REG : dataOut <= endP2NAKTransTypeRegSTB;
      `EP3_CTRL_REG : dataOut <= endP3ControlRegSTB;
      `EP3_STS_REG :  dataOut <= EP3StatusRegSTB;
      `EP3_TRAN_TYPE_STS_REG : dataOut <= endP3TransTypeRegSTB;
      `EP3_NAK_TRAN_TYPE_STS_REG : dataOut <= endP3NAKTransTypeRegSTB;
      `SC_CONTROL_REG : dataOut <= SCControlReg;
      `SC_LINE_STATUS_REG : dataOut <= {5'b00000, vBusDetectInSTB[0], connectStateInSTB}; 
      `SC_INTERRUPT_STATUS_REG :  dataOut <= {2'b00, vBusDetInt, NAKSentInt, SOFRxedInt, resetEventInt, resumeInt, transDoneInt};
      `SC_INTERRUPT_MASK_REG  : dataOut <= {2'b00, interruptMaskReg};
      `SC_ADDRESS : dataOut <= {1'b0, SCAddrReg};
      `SC_FRAME_NUM_MSP : dataOut <= {5'b00000, frameNumSTB[10:8]};
      `SC_FRAME_NUM_LSP : dataOut <= frameNumSTB[7:0];
      default: dataOut <= 8'h00;
  endcase
end


//Extend SOFRxedIn, resetEventIn, resumeIntIn, transDoneIn, NAKSentIn from 1 tick
//pulses to 3 tick pulses
always @(posedge usbClk) begin
  if (rstSyncToUsbClk == 1'b1) begin
    SOFRxedInExtend <= 3'b000;
    resetEventInExtend <= 3'b000;
    resumeIntInExtend <= 3'b000;
    transDoneInExtend <= 3'b000;
    NAKSentInExtend <= 3'b000;
    clrEP0ReadyExtend <= 3'b000;
    clrEP1ReadyExtend <= 3'b000;
    clrEP2ReadyExtend <= 3'b000;
    clrEP3ReadyExtend <= 3'b000;
  end
  else begin
    if (SOFRxedIn == 1'b1)
      SOFRxedInExtend <= 3'b111;
    else
      SOFRxedInExtend <= {1'b0, SOFRxedInExtend[2:1]};
    if (resetEventIn == 1'b1)
      resetEventInExtend <= 3'b111;
    else
      resetEventInExtend <= {1'b0, resetEventInExtend[2:1]};
    if (resumeIntIn == 1'b1)
      resumeIntInExtend <= 3'b111;
    else
      resumeIntInExtend <= {1'b0, resumeIntInExtend[2:1]};
    if (transDoneIn == 1'b1)
      transDoneInExtend <= 3'b111;
    else
      transDoneInExtend <= {1'b0, transDoneInExtend[2:1]};
    if (NAKSentIn == 1'b1)
      NAKSentInExtend <= 3'b111;
    else
      NAKSentInExtend <= {1'b0, NAKSentInExtend[2:1]};
    if (clrEP0Ready == 1'b1)
      clrEP0ReadyExtend <= 3'b111;
    else
      clrEP0ReadyExtend <= {1'b0, clrEP0ReadyExtend[2:1]};
    if (clrEP1Ready == 1'b1)
      clrEP1ReadyExtend <= 3'b111;
    else
      clrEP1ReadyExtend <= {1'b0, clrEP1ReadyExtend[2:1]};
    if (clrEP2Ready == 1'b1)
      clrEP2ReadyExtend <= 3'b111;
    else
      clrEP2ReadyExtend <= {1'b0, clrEP2ReadyExtend[2:1]};
    if (clrEP3Ready == 1'b1)
      clrEP3ReadyExtend <= 3'b111;
    else
      clrEP3ReadyExtend <= {1'b0, clrEP3ReadyExtend[2:1]};
  end
end

//re-sync from busClk to usbClk. 
always @(posedge usbClk) begin
  if (rstSyncToUsbClk == 1'b1) begin
    endP0ControlReg <= {5{1'b0}};
    endP0ControlReg1 <= {5{1'b0}};
    endP1ControlReg <= {5{1'b0}};
    endP1ControlReg1 <= {5{1'b0}};
    endP2ControlReg <= {5{1'b0}};
    endP2ControlReg1 <= {5{1'b0}};
    endP3ControlReg <= {5{1'b0}};
    endP3ControlReg1 <= {5{1'b0}};
    SCGlobalEn <= 1'b0;
    SCGlobalEn_reg1 <= 1'b0;
    TxLineState <= 2'b00;
    TxLineState_reg1 <= 2'b00;
    LineDirectControlEn <= 1'b0;
    LineDirectControlEn_reg1 <= 1'b0;
    fullSpeedPol <= 1'b0;
    fullSpeedPol_reg1 <= 1'b0;
    fullSpeedRate <= 1'b0;
    fullSpeedRate_reg1 <= 1'b0;
    connectSlaveToHost <= 1'b0;
    connectSlaveToHost_reg1 <= 1'b0;
  end
  else begin
    endP0ControlReg1 <= endP0ControlRegSTB;
    endP0ControlReg <= endP0ControlReg1;
    endP1ControlReg1 <= endP1ControlRegSTB;
    endP1ControlReg <= endP1ControlReg1;
    endP2ControlReg1 <= endP2ControlRegSTB;
    endP2ControlReg <= endP2ControlReg1;
    endP3ControlReg1 <= endP3ControlRegSTB;
    endP3ControlReg <= endP3ControlReg1;
    SCGlobalEn_reg1 <= SCGlobalEnSTB;
    SCGlobalEn <= SCGlobalEn_reg1;
    TxLineState_reg1 <= TxLineStateSTB;
    TxLineState <= TxLineState_reg1;
    LineDirectControlEn_reg1 <= LineDirectControlEnSTB;
    LineDirectControlEn <= LineDirectControlEn_reg1;
    fullSpeedPol_reg1 <= fullSpeedPolSTB; 
    fullSpeedPol <= fullSpeedPol_reg1; 
    fullSpeedRate_reg1 <= fullSpeedRateSTB;
    fullSpeedRate <= fullSpeedRate_reg1;
    connectSlaveToHost_reg1 <= connectSlaveToHostSTB;
    connectSlaveToHost <= connectSlaveToHost_reg1;
  end
end

//re-sync from usbClk and async inputs to busClk. Since 'NAKSentIn', 'SOFRxedIn' etc 
//are only asserted for 3 usbClk ticks
//busClk freq must be greater than usbClk/3 (plus some allowance for setup and hold) freq
always @(posedge busClk) begin
  if (rstSyncToBusClk == 1'b1) begin
    vBusDetectInSTB <= 3'b000;
    NAKSentInSTB <= 3'b000;
    SOFRxedInSTB <= 3'b000;
    resetEventInSTB <= 3'b000;
    resumeIntInSTB <= 3'b000;
    transDoneInSTB <= 3'b000;
    clrEP0ReadySTB <= 3'b000;
    clrEP1ReadySTB <= 3'b000;
    clrEP2ReadySTB <= 3'b000;
    clrEP3ReadySTB <= 3'b000;
    EP0StatusRegSTB <= 8'h00;
    EP0StatusRegSTB_reg1 <= 8'h00;
    EP1StatusRegSTB <= 8'h00;
    EP1StatusRegSTB_reg1 <= 8'h00;
    EP2StatusRegSTB <= 8'h00;
    EP2StatusRegSTB_reg1 <= 8'h00;
    EP3StatusRegSTB <= 8'h00;
    EP3StatusRegSTB_reg1 <= 8'h00;
    endP0TransTypeRegSTB <= 2'b00;
    endP0TransTypeRegSTB_reg1 <= 2'b00;
    endP1TransTypeRegSTB <= 2'b00;
    endP1TransTypeRegSTB_reg1 <= 2'b00;
    endP2TransTypeRegSTB <= 2'b00;
    endP2TransTypeRegSTB_reg1 <= 2'b00;
    endP3TransTypeRegSTB <= 2'b00;
    endP3TransTypeRegSTB_reg1 <= 2'b00;
    endP0NAKTransTypeRegSTB <= 2'b00;
    endP0NAKTransTypeRegSTB_reg1 <= 2'b00;
    endP1NAKTransTypeRegSTB <= 2'b00;
    endP1NAKTransTypeRegSTB_reg1 <= 2'b00;
    endP2NAKTransTypeRegSTB <= 2'b00;
    endP2NAKTransTypeRegSTB_reg1 <= 2'b00;
    endP3NAKTransTypeRegSTB <= 2'b00;
    endP3NAKTransTypeRegSTB_reg1 <= 2'b00;
    frameNumSTB <= {11{1'b0}};
    frameNumSTB_reg1 <= {11{1'b0}};
    connectStateInSTB <= 2'b00;
    connectStateInSTB_reg1 <= 2'b00;
  end
  else begin
    vBusDetectInSTB <= {vBusDetectIn, vBusDetectInSTB[2:1]};
    NAKSentInSTB <= {NAKSentInExtend[0], NAKSentInSTB[2:1]};
    SOFRxedInSTB <= {SOFRxedInExtend[0], SOFRxedInSTB[2:1]};
    resetEventInSTB <= {resetEventInExtend[0], resetEventInSTB[2:1]};
    resumeIntInSTB <= {resumeIntInExtend[0], resumeIntInSTB[2:1]};
    transDoneInSTB <= {transDoneInExtend[0], transDoneInSTB[2:1]};
    clrEP0ReadySTB <= {clrEP0ReadyExtend[0], clrEP0ReadySTB[2:1]};
    clrEP1ReadySTB <= {clrEP1ReadyExtend[0], clrEP1ReadySTB[2:1]};
    clrEP2ReadySTB <= {clrEP2ReadyExtend[0], clrEP2ReadySTB[2:1]};
    clrEP3ReadySTB <= {clrEP3ReadyExtend[0], clrEP3ReadySTB[2:1]};
    EP0StatusRegSTB_reg1 <= EP0StatusReg;
    EP0StatusRegSTB <= EP0StatusRegSTB_reg1;
    EP1StatusRegSTB_reg1 <= EP1StatusReg;
    EP1StatusRegSTB <= EP1StatusRegSTB_reg1;
    EP2StatusRegSTB_reg1 <= EP2StatusReg;
    EP2StatusRegSTB <= EP2StatusRegSTB_reg1;
    EP3StatusRegSTB_reg1 <= EP3StatusReg;
    EP3StatusRegSTB <= EP3StatusRegSTB_reg1;
    endP0TransTypeRegSTB_reg1 <= endP0TransTypeReg;
    endP0TransTypeRegSTB <= endP0TransTypeRegSTB_reg1;
    endP1TransTypeRegSTB_reg1 <= endP1TransTypeReg;
    endP1TransTypeRegSTB <= endP1TransTypeRegSTB_reg1;
    endP2TransTypeRegSTB_reg1 <= endP2TransTypeReg;
    endP2TransTypeRegSTB <= endP2TransTypeRegSTB_reg1;
    endP3TransTypeRegSTB_reg1 <= endP3TransTypeReg;
    endP3TransTypeRegSTB <= endP3TransTypeRegSTB_reg1;
    endP0NAKTransTypeRegSTB_reg1 <= endP0NAKTransTypeReg;
    endP0NAKTransTypeRegSTB <= endP0NAKTransTypeRegSTB_reg1;
    endP1NAKTransTypeRegSTB_reg1 <= endP1NAKTransTypeReg;
    endP1NAKTransTypeRegSTB <= endP1NAKTransTypeRegSTB_reg1;
    endP2NAKTransTypeRegSTB_reg1 <= endP2NAKTransTypeReg;
    endP2NAKTransTypeRegSTB <= endP2NAKTransTypeRegSTB_reg1;
    endP3NAKTransTypeRegSTB_reg1 <= endP3NAKTransTypeReg;
    endP3NAKTransTypeRegSTB <= endP3NAKTransTypeRegSTB_reg1;
    frameNumSTB_reg1 <= frameNum;
    frameNumSTB <= frameNumSTB_reg1;
    connectStateInSTB_reg1 <= connectStateIn;
    connectStateInSTB <= connectStateInSTB_reg1;
  end
end


endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// usbSlaveControl.v                                            ////
////                                                              ////
//// This file is part of the usbhostslave opencores effort.
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

module usbSlaveControl(
  busClk, 
  rstSyncToBusClk,
  usbClk, 
  rstSyncToUsbClk,
  //getPacket
  RxByteStatus, RxData, RxDataValid,
  SIERxTimeOut, RxFifoData, SIERxTimeOutEn,
  //speedCtrlMux
  fullSpeedRate, fullSpeedPol,
  connectSlaveToHost,
  //SCTxPortArbiter
  SCTxPortEn, SCTxPortRdy,
  SCTxPortData, SCTxPortCtrl,
  //rxStatusMonitor
  vBusDetect,
  connectStateIn, 
  resumeDetectedIn,
  //USBHostControlBI 
  busAddress,
  busDataIn, 
  busDataOut, 
  busWriteEn,
  busStrobe_i,
  SOFRxedIntOut, 
  resetEventIntOut, 
  resumeIntOut, 
  transDoneIntOut,
  vBusDetIntOut,
  NAKSentIntOut,
  slaveControlSelect,
  //fifoMux
  TxFifoEP0REn,
  TxFifoEP1REn,
  TxFifoEP2REn,
  TxFifoEP3REn,
  TxFifoEP0Data,
  TxFifoEP1Data,
  TxFifoEP2Data,
  TxFifoEP3Data,
  TxFifoEP0Empty,
  TxFifoEP1Empty,
  TxFifoEP2Empty,
  TxFifoEP3Empty,
  RxFifoEP0WEn,
  RxFifoEP1WEn,
  RxFifoEP2WEn,
  RxFifoEP3WEn,
  RxFifoEP0Full,
  RxFifoEP1Full,
  RxFifoEP2Full,
  RxFifoEP3Full
    );

input busClk; 
input rstSyncToBusClk;
input usbClk; 
input rstSyncToUsbClk;
//getPacket
input [7:0] RxByteStatus;
input [7:0] RxData;
input RxDataValid;
input SIERxTimeOut; 
output SIERxTimeOutEn;
output [7:0] RxFifoData;
//speedCtrlMux
output fullSpeedRate;
output fullSpeedPol;
output connectSlaveToHost;
//HCTxPortArbiter
output SCTxPortEn;
input SCTxPortRdy;
output [7:0] SCTxPortData;
output [7:0] SCTxPortCtrl;
//rxStatusMonitor
input vBusDetect;
input [1:0] connectStateIn;
input resumeDetectedIn;
//USBHostControlBI 
input [4:0] busAddress;
input [7:0] busDataIn; 
output [7:0] busDataOut; 
input busWriteEn;
input busStrobe_i;
output SOFRxedIntOut; 
output resetEventIntOut; 
output resumeIntOut; 
output transDoneIntOut;
output vBusDetIntOut;
output NAKSentIntOut;
input slaveControlSelect;
//fifoMux
output TxFifoEP0REn;
output TxFifoEP1REn;
output TxFifoEP2REn;
output TxFifoEP3REn;
input [7:0] TxFifoEP0Data;
input [7:0] TxFifoEP1Data;
input [7:0] TxFifoEP2Data;
input [7:0] TxFifoEP3Data;
input TxFifoEP0Empty;
input TxFifoEP1Empty;
input TxFifoEP2Empty;
input TxFifoEP3Empty;
output RxFifoEP0WEn;
output RxFifoEP1WEn;
output RxFifoEP2WEn;
output RxFifoEP3WEn;
input RxFifoEP0Full;
input RxFifoEP1Full;
input RxFifoEP2Full;
input RxFifoEP3Full;

wire busClk; 
wire rstSyncToBusClk;
wire usbClk; 
wire rstSyncToUsbClk;
wire [7:0] RxByteStatus;
wire [7:0] RxData;
wire RxDataValid;
wire SIERxTimeOut;
wire SIERxTimeOutEn;
wire [7:0] RxFifoData;
wire fullSpeedRate;
wire fullSpeedPol;
wire connectSlaveToHost;
wire [7:0] SCTxPortData;
wire [7:0] SCTxPortCtrl;
wire [1:0] connectStateIn;
wire resumeDetectedIn;
wire [4:0] busAddress;
wire [7:0] busDataIn; 
wire [7:0] busDataOut; 
wire busWriteEn;
wire busStrobe_i;
wire SOFRxedIntOut; 
wire resetEventIntOut; 
wire resumeIntOut; 
wire transDoneIntOut;
wire vBusDetIntOut;
wire NAKSentIntOut;
wire slaveControlSelect;
wire TxFifoEP0REn;
wire TxFifoEP1REn;
wire TxFifoEP2REn;
wire TxFifoEP3REn;
wire [7:0] TxFifoEP0Data;
wire [7:0] TxFifoEP1Data;
wire [7:0] TxFifoEP2Data;
wire [7:0] TxFifoEP3Data;
wire TxFifoEP0Empty;
wire TxFifoEP1Empty;
wire TxFifoEP2Empty;
wire TxFifoEP3Empty;
wire RxFifoEP0WEn;
wire RxFifoEP1WEn;
wire RxFifoEP2WEn;
wire RxFifoEP3WEn;
wire RxFifoEP0Full;
wire RxFifoEP1Full;
wire RxFifoEP2Full;
wire RxFifoEP3Full;

//internal wiring
wire [7:0] directCntlCntl;
wire [7:0] directCntlData;
wire directCntlGnt;
wire directCntlReq;
wire directCntlWEn;
wire [7:0] sendPacketCntl;
wire [7:0] sendPacketData;
wire sendPacketGnt;
wire sendPacketReq;
wire sendPacketWEn;    
wire SCTxPortArbRdyOut;
wire transDone;
wire [1:0] directLineState;
wire directLineCtrlEn;
wire [3:0] RxPID;
wire [1:0] connectStateOut;
wire resumeIntFromRxStatusMon;
wire [1:0] endP0TransTypeReg;
wire [1:0] endP1TransTypeReg;
wire [1:0] endP2TransTypeReg;
wire [1:0] endP3TransTypeReg;
wire [1:0] endP0NAKTransTypeReg;
wire [1:0] endP1NAKTransTypeReg;
wire [1:0] endP2NAKTransTypeReg;
wire [1:0] endP3NAKTransTypeReg;
wire [4:0] endP0ControlReg;
wire [4:0] endP1ControlReg;
wire [4:0] endP2ControlReg;
wire [4:0] endP3ControlReg;
wire [7:0] endP0StatusReg;
wire [7:0] endP1StatusReg;
wire [7:0] endP2StatusReg;
wire [7:0] endP3StatusReg;
wire [6:0] USBTgtAddress;
wire [10:0] frameNum;
wire clrEP0Rdy;
wire clrEP1Rdy;
wire clrEP2Rdy;
wire clrEP3Rdy;
wire SCGlobalEn;
wire ACKRxed; 
wire CRCError; 
wire RXOverflow; 
wire RXTimeOut; 
wire bitStuffError; 
wire dataSequence; 
wire stallSent;
wire NAKSent;
wire SOFRxed;
wire [4:0] endPControlReg;
wire [1:0] transTypeNAK;
wire [1:0] transType;
wire [3:0] currEndP;
wire getPacketREn;
wire getPacketRdy;
wire [3:0] slaveControllerPIDOut;
wire slaveControllerReadyIn;
wire slaveControllerWEnOut;
wire TxFifoRE;
wire [7:0] TxFifoData;
wire TxFifoEmpty;
wire RxFifoWE;
wire RxFifoFull;
wire resetEventFromRxStatusMon;
wire clrEPRdy;
wire endPMuxErrorsWEn;
wire endPointReadyFromSlaveCtrlrToGetPkt;

USBSlaveControlBI u_USBSlaveControlBI
  (.address(busAddress),
  .dataIn(busDataIn), 
  .dataOut(busDataOut), 
  .writeEn(busWriteEn),
  .strobe_i(busStrobe_i),
  .busClk(busClk), 
  .rstSyncToBusClk(rstSyncToBusClk),
  .usbClk(usbClk), 
  .rstSyncToUsbClk(rstSyncToUsbClk),
  .SOFRxedIntOut(SOFRxedIntOut), 
  .resetEventIntOut(resetEventIntOut), 
  .resumeIntOut(resumeIntOut), 
  .transDoneIntOut(transDoneIntOut),
  .vBusDetIntOut(vBusDetIntOut),
  .NAKSentIntOut(NAKSentIntOut),
  .endP0TransTypeReg(endP0TransTypeReg), 
  .endP0NAKTransTypeReg(endP0NAKTransTypeReg),
  .endP1TransTypeReg(endP1TransTypeReg), 
  .endP1NAKTransTypeReg(endP1NAKTransTypeReg),
  .endP2TransTypeReg(endP2TransTypeReg), 
  .endP2NAKTransTypeReg(endP2NAKTransTypeReg),
  .endP3TransTypeReg(endP3TransTypeReg), 
  .endP3NAKTransTypeReg(endP3NAKTransTypeReg),
  .endP0ControlReg(endP0ControlReg),
  .endP1ControlReg(endP1ControlReg),
  .endP2ControlReg(endP2ControlReg),
  .endP3ControlReg(endP3ControlReg),
  .EP0StatusReg(endP0StatusReg),
  .EP1StatusReg(endP1StatusReg),
  .EP2StatusReg(endP2StatusReg),
  .EP3StatusReg(endP3StatusReg),
  .SCAddrReg(USBTgtAddress), 
  .frameNum(frameNum),
  .connectStateIn(connectStateOut),
  .vBusDetectIn(vBusDetect),
  .SOFRxedIn(SOFRxed), 
  .resetEventIn(resetEventFromRxStatusMon), 
  .resumeIntIn(resumeIntFromRxStatusMon), 
  .transDoneIn(transDone),
  .NAKSentIn(NAKSent),
  .slaveControlSelect(slaveControlSelect),
  .clrEP0Ready(clrEP0Rdy), 
  .clrEP1Ready(clrEP1Rdy), 
  .clrEP2Ready(clrEP2Rdy), 
  .clrEP3Ready(clrEP3Rdy),
  .TxLineState(directLineState),
  .LineDirectControlEn(directLineCtrlEn),
  .fullSpeedPol(fullSpeedPol), 
  .fullSpeedRate(fullSpeedRate),
  .connectSlaveToHost(connectSlaveToHost),
  .SCGlobalEn(SCGlobalEn)
  );

slavecontroller u_slavecontroller
  (.CRCError(CRCError), 
  .NAKSent(NAKSent), 
  .RxByte(RxData), 
  .RxDataWEn(RxDataValid), 
  .RxOverflow(RXOverflow), 
  .RxStatus(RxByteStatus), 
  .RxTimeOut(RXTimeOut), 
  .SCGlobalEn(SCGlobalEn), 
  .SOFRxed(SOFRxed), 
  .USBEndPControlReg(endPControlReg), 
  .USBEndPNakTransTypeReg(transTypeNAK), 
  .USBEndPTransTypeReg(transType), 
  .USBEndP(currEndP), 
  .USBTgtAddress(USBTgtAddress),
  .bitStuffError(bitStuffError), 
  .clk(usbClk), 
  .clrEPRdy(clrEPRdy), 
  .endPMuxErrorsWEn(endPMuxErrorsWEn), 
  .frameNum(frameNum), 
  .getPacketREn(getPacketREn), 
  .getPacketRdy(getPacketRdy), 
  .rst(rstSyncToUsbClk), 
  .sendPacketPID(slaveControllerPIDOut), 
  .sendPacketRdy(slaveControllerReadyIn), 
  .sendPacketWEn(slaveControllerWEnOut), 
  .stallSent(stallSent), 
  .transDone(transDone),
  .endPointReadyToGetPkt(endPointReadyFromSlaveCtrlrToGetPkt)
    );


endpMux u_endpMux (
  .clk(usbClk), 
  .rst(rstSyncToUsbClk),
  .currEndP(currEndP),
  .NAKSent(NAKSent),
  .stallSent(stallSent),
  .CRCError(CRCError),
  .bitStuffError(bitStuffError),
  .RxOverflow(RXOverflow),
  .RxTimeOut(RXTimeOut),
  .dataSequence(dataSequence),
  .ACKRxed(ACKRxed),
  .transType(transType),
  .transTypeNAK(transTypeNAK),
  .endPControlReg(endPControlReg),
  .clrEPRdy(clrEPRdy),
  .endPMuxErrorsWEn(endPMuxErrorsWEn),
  .endP0ControlReg(endP0ControlReg),
  .endP1ControlReg(endP1ControlReg),
  .endP2ControlReg(endP2ControlReg),
  .endP3ControlReg(endP3ControlReg),
  .endP0StatusReg(endP0StatusReg),
  .endP1StatusReg(endP1StatusReg),
  .endP2StatusReg(endP2StatusReg),
  .endP3StatusReg(endP3StatusReg),
  .endP0TransTypeReg(endP0TransTypeReg),
  .endP1TransTypeReg(endP1TransTypeReg),
  .endP2TransTypeReg(endP2TransTypeReg),
  .endP3TransTypeReg(endP3TransTypeReg),
  .endP0NAKTransTypeReg(endP0NAKTransTypeReg),
  .endP1NAKTransTypeReg(endP1NAKTransTypeReg),
  .endP2NAKTransTypeReg(endP2NAKTransTypeReg),
  .endP3NAKTransTypeReg(endP3NAKTransTypeReg),
  .clrEP0Rdy(clrEP0Rdy),
  .clrEP1Rdy(clrEP1Rdy),
  .clrEP2Rdy(clrEP2Rdy),
  .clrEP3Rdy(clrEP3Rdy)
    );

slaveSendPacket u_slaveSendPacket
  (.PID(slaveControllerPIDOut), 
  .SCTxPortCntl(sendPacketCntl),
  .SCTxPortData(sendPacketData),
  .SCTxPortGnt(sendPacketGnt),
  .SCTxPortRdy(SCTxPortArbRdyOut),
  .SCTxPortReq(sendPacketReq),
  .SCTxPortWEn(sendPacketWEn),
  .clk(usbClk),
  .fifoData(TxFifoData),
  .fifoEmpty(TxFifoEmpty),
  .fifoReadEn(TxFifoRE),
  .rst(rstSyncToUsbClk),
  .sendPacketRdy(slaveControllerReadyIn),
  .sendPacketWEn(slaveControllerWEnOut) );

slaveDirectControl u_slaveDirectControl
  (.SCTxPortCntl(directCntlCntl),
  .SCTxPortData(directCntlData),
  .SCTxPortGnt(directCntlGnt),
  .SCTxPortRdy(SCTxPortArbRdyOut),
  .SCTxPortReq(directCntlReq),
  .SCTxPortWEn(directCntlWEn),
  .clk(usbClk),
  .directControlEn(directLineCtrlEn),
  .directControlLineState(directLineState),
  .rst(rstSyncToUsbClk) ); 

SCTxPortArbiter u_SCTxPortArbiter
  (.SCTxPortCntl(SCTxPortCtrl),
  .SCTxPortData(SCTxPortData),
  .SCTxPortRdyIn(SCTxPortRdy),
  .SCTxPortRdyOut(SCTxPortArbRdyOut),
  .SCTxPortWEnable(SCTxPortEn),
  .clk(usbClk),
  .directCntlCntl(directCntlCntl),
  .directCntlData(directCntlData),
  .directCntlGnt(directCntlGnt),
  .directCntlReq(directCntlReq),
  .directCntlWEn(directCntlWEn),
  .rst(rstSyncToUsbClk),
  .sendPacketCntl(sendPacketCntl),
  .sendPacketData(sendPacketData),
  .sendPacketGnt(sendPacketGnt),
  .sendPacketReq(sendPacketReq),
  .sendPacketWEn(sendPacketWEn) );    


slaveGetPacket u_slaveGetPacket
  (.ACKRxed(ACKRxed), 
  .CRCError(CRCError), 
  .RXDataIn(RxData),
  .RXDataValid(RxDataValid),
  .RXFifoData(RxFifoData),
  .RXFifoFull(RxFifoFull),
  .RXFifoWEn(RxFifoWE),
  .RXPacketRdy(getPacketRdy),
  .RXStreamStatusIn(RxByteStatus),
  .RxPID(RxPID),
  .SIERxTimeOut(SIERxTimeOut),
  .SIERxTimeOutEn(SIERxTimeOutEn),
  .clk(usbClk),
  .RXOverflow(RXOverflow), 
  .RXTimeOut(RXTimeOut), 
  .bitStuffError(bitStuffError), 
  .dataSequence(dataSequence), 
  .getPacketEn(getPacketREn),
  .rst(rstSyncToUsbClk),
  .endPointReady(endPointReadyFromSlaveCtrlrToGetPkt)
  ); 

slaveRxStatusMonitor  u_slaveRxStatusMonitor
  (.connectStateIn(connectStateIn),
  .connectStateOut(connectStateOut),
  .resumeDetectedIn(resumeDetectedIn),
  .resetEventOut(resetEventFromRxStatusMon),
  .resumeIntOut(resumeIntFromRxStatusMon),
  .clk(usbClk),
  .rst(rstSyncToUsbClk)  );    
  
fifoMux u_fifoMux (
  .currEndP(currEndP),
  //TxFifo
  .TxFifoREn(TxFifoRE),
  .TxFifoEP0REn(TxFifoEP0REn),
  .TxFifoEP1REn(TxFifoEP1REn),
  .TxFifoEP2REn(TxFifoEP2REn),
  .TxFifoEP3REn(TxFifoEP3REn),
  .TxFifoData(TxFifoData),
  .TxFifoEP0Data(TxFifoEP0Data),
  .TxFifoEP1Data(TxFifoEP1Data),
  .TxFifoEP2Data(TxFifoEP2Data),
  .TxFifoEP3Data(TxFifoEP3Data),
  .TxFifoEmpty(TxFifoEmpty),
  .TxFifoEP0Empty(TxFifoEP0Empty),
  .TxFifoEP1Empty(TxFifoEP1Empty),
  .TxFifoEP2Empty(TxFifoEP2Empty),
  .TxFifoEP3Empty(TxFifoEP3Empty),
  //RxFifo
  .RxFifoWEn(RxFifoWE),
  .RxFifoEP0WEn(RxFifoEP0WEn),
  .RxFifoEP1WEn(RxFifoEP1WEn),
  .RxFifoEP2WEn(RxFifoEP2WEn),
  .RxFifoEP3WEn(RxFifoEP3WEn),
  .RxFifoFull(RxFifoFull),
  .RxFifoEP0Full(RxFifoEP0Full),
  .RxFifoEP1Full(RxFifoEP1Full),
  .RxFifoEP2Full(RxFifoEP2Full),
  .RxFifoEP3Full(RxFifoEP3Full)
    );

endmodule

  
  




