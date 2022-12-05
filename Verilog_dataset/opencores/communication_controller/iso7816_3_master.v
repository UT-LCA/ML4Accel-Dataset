/*
Author: Sebastien Riou (acapola)
Creation date: 18:05:27 01/09/2011 

$LastChangedDate: 2011-01-29 13:16:17 +0100 (Sat, 29 Jan 2011) $
$LastChangedBy: acapola $
$LastChangedRevision: 11 $
$HeadURL: file:///svn/iso7816_3_master/iso7816_3_master/trunk/sources/ClkDivider.v $				 

This file is under the BSD licence:
Copyright (c) 2011, Sebastien Riou

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
The names of contributors may not be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`default_nettype none
/*
Basic clock divider

if divider=0
	dividedClk=clk
else
	F(dividedClk)=F(clk)/(divider*2)
	dividedClk has a duty cycle of 50%	

WARNING:	
	To change divider on the fly:
		1. set it to 0 at least for one cycle
		2. set it to the new value.
*/
module ClkDivider
#(//parameters to override
	parameter DIVIDER_WIDTH = 16
)
(
	input wire nReset,
	input wire clk,									// input clock
	input wire [DIVIDER_WIDTH-1:0] divider,	// divide factor
	output wire dividedClk,						// divided clock
	output wire divideBy1,
	output wire match,
	output wire risingMatch,
	output wire fallingMatch
	); 

	
	reg out;//internal divided clock
	reg [DIVIDER_WIDTH-1:0] cnt;
  
	// if divider=0, dividedClk = clk.
	assign divideBy1 = |divider ? 1'b0 : 1'b1;
	assign dividedClk = divideBy1 ? clk : out;
	
	assign match = (cnt==(divider-1));
	assign risingMatch = match & ~out;
	assign fallingMatch = match & out;
	
	always @(posedge clk, negedge nReset)
	begin
		if(~nReset | divideBy1) begin
			cnt <= 0;
			out <= 1'b0;
		end else if(~divideBy1)	begin
			if(match) begin
				cnt <= 0;
				out <= ~out;
			end else begin
				cnt <= cnt + 1'b1;
			end
		end
	end

endmodule
`default_nettype wire
/*
Author: Sebastien Riou (acapola)
Creation date: 23:57:02 08/31/2010 

$LastChangedDate: 2011-01-29 13:16:17 +0100 (Sat, 29 Jan 2011) $
$LastChangedBy: acapola $
$LastChangedRevision: 11 $
$HeadURL: file:///svn/iso7816_3_master/iso7816_3_master/trunk/sources/Counter.v $				 

This file is under the BSD licence:
Copyright (c) 2011, Sebastien Riou

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
The names of contributors may not be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`default_nettype none
/*
A counter with increment and clear operation
*/
module Counter
#(//parameters to override
	parameter DIVIDER_WIDTH = 16,
	parameter WIDTH = 8,
	parameter WIDTH_INIT = 1
)
(
    output reg [WIDTH-1:0] counter,
    output wire earlyMatch,
	 output reg match,
	 output wire dividedClk,
	 input wire [DIVIDER_WIDTH-1:0] divider,	// clock divide factor
	 input wire [WIDTH-1:0] compare,
	 input wire inc,
	 input wire clear,
	 input wire [WIDTH_INIT-1:0] initVal,
	 input wire clk,
    input wire nReset
    );

wire divideBy1;
wire divMatch;
wire divRisingMatch;
wire divFallingMatch;

ClkDivider #(.DIVIDER_WIDTH(DIVIDER_WIDTH))
	clkDivider(
		.nReset(nReset),
		.clk(clk),
		.divider(divider),
		.dividedClk(dividedClk),
		.divideBy1(divideBy1),
		.match(divMatch),
		.risingMatch(divRisingMatch),
		.fallingMatch(divFallingMatch)
		);

wire [WIDTH-1:0] nextCounter = counter+1'b1;

wire doInc = divideBy1 ? inc :inc & divRisingMatch;
wire doEarlyMatch = divideBy1 ? (compare == nextCounter) : (compare == counter) & divRisingMatch;

reg earlyMatchReg;
assign earlyMatch = divideBy1 ? earlyMatchReg : doEarlyMatch;

always @(posedge clk, negedge nReset) begin
	if(~nReset) begin
		counter <= 0;//initVal;
      earlyMatchReg <= 0;
		match <= 0;
	end else begin
		if(clear) begin
			counter <= initVal;
		end else if(doInc) begin
			if(compare == counter)
				counter <= initVal;
			else
				counter <= nextCounter;
		end
		if(doEarlyMatch)
			earlyMatchReg <= 1;
		else begin
			earlyMatchReg <= 0;
		end
      match <= divideBy1 ? earlyMatchReg : doEarlyMatch;
	end					
end

endmodule
`default_nettype wire
/*
Author: Sebastien Riou (acapola)
Creation date: 19:57:35 10/31/2010 

$LastChangedDate: 2011-04-17 23:31:29 +0200 (Sun, 17 Apr 2011) $
$LastChangedBy: acapola $
$LastChangedRevision: 19 $
$HeadURL: file:///svn/iso7816_3_master/iso7816_3_master/trunk/sources/HalfDuplexUartIf.v $				 

This file is under the BSD licence:
Copyright (c) 2011, Sebastien Riou

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
The names of contributors may not be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`default_nettype none

module HalfDuplexUartIf
#(//parameters to override
	parameter DIVIDER_WIDTH = 1,
	parameter CLOCK_PER_BIT_WIDTH = 13	//allow to support default speed of ISO7816
)
(
    input wire nReset,
    input wire clk,
    input wire [DIVIDER_WIDTH-1:0] clkPerCycle,
	 input wire [7:0] dataIn,
    input wire nWeDataIn,
    input wire [CLOCK_PER_BIT_WIDTH-1:0] clocksPerBit,
    input wire stopBit2,//0: 1 stop bit, 1: 2 stop bits
	 input wire oddParity, //if 1, parity bit is such that data+parity have an odd number of 1
    input wire msbFirst,  //if 1, bits order is: startBit, b7, b6, b5...b0, parity
	 output wire [7:0] dataOut,
    input wire nCsDataOut,
    output wire [7:0] statusOut,
    input wire nCsStatusOut,
    input wire serialIn,
	 output wire serialOut,
	 output wire comClk
    );


   reg [7:0] dataReg;

	// Inputs
	wire [7:0] txData;
	reg txPending;
	wire ackFlags;

	// Outputs
	wire [7:0] rxData;
	wire overrunErrorFlag;
	wire dataOutReadyFlag;
	wire frameErrorFlag;
	wire txRun;
   wire endOfRx;
	wire rxRun;
	wire rxStartBit;
	wire txFull;
	wire isTx;
   
   wire rxFlagsSet = dataOutReadyFlag | overrunErrorFlag | frameErrorFlag;
   reg bufferFull;
   reg [1:0] flagsReg;
   
   assign txData = dataReg;
   
   assign dataOut=dataReg;
   assign statusOut[7:0]={txRun, txPending, rxRun, rxStartBit, isTx, flagsReg, bufferFull};

reg waitTxFull0;//internal reg for managing bufferFull bit in Tx

assign ackFlags=~txPending & ~txRun & rxFlagsSet & ((bufferFull & ~nCsDataOut)| ~bufferFull);

always @(posedge clk, negedge nReset) begin
   if(~nReset) begin
      bufferFull <= 1'b0;
      flagsReg <= 2'b00;
      txPending <= 1'b0;
   end else begin
      if(ackFlags) begin
         dataReg <= rxData;
         flagsReg <= {overrunErrorFlag, frameErrorFlag};
         if(rxFlagsSet)
            bufferFull <= 1'b1;
         else
            bufferFull <= 1'b0;
      end else if(txPending) begin
         if(waitTxFull0) begin
            if(~txFull)
               waitTxFull0 <= 1'b0;
         end else if(txFull) begin//tx actually started, clear txPending and free buffer
            txPending <= 1'b0;
            bufferFull <= 1'b0; //buffer is empty
         end
      end else if(~nCsDataOut) begin
         bufferFull <= 1'b0;
      end else if(~nWeDataIn) begin
         dataReg <= dataIn;
         bufferFull <= 1'b1;
         txPending <= 1'b1;
         waitTxFull0 <= txFull;
      end
   end
end   
wire endOfTx;
	BasicHalfDuplexUart #(
		.DIVIDER_WIDTH(DIVIDER_WIDTH),
		.CLOCK_PER_BIT_WIDTH(CLOCK_PER_BIT_WIDTH)
		)
	uart (
		.rxData(rxData), 
		.overrunErrorFlag(overrunErrorFlag), 
		.dataOutReadyFlag(dataOutReadyFlag), 
		.frameErrorFlag(frameErrorFlag), 
		.txRun(txRun), 
		.endOfRx(endOfRx),
		.endOfTx(endOfTx),
      .rxRun(rxRun), 
		.rxStartBit(rxStartBit), 
		.txFull(txFull), 
		.isTx(isTx), 
		.serialIn(serialIn),
		.serialOut(serialOut),
		.comClk(comClk),
		.txData(txData), 
		.clocksPerBit(clocksPerBit), 
		.stopBit2(stopBit2), 
		.oddParity(oddParity), 
      .msbFirst(msbFirst),  
	   .startTx(txPending), 
		.ackFlags(ackFlags),
		.clkPerCycle(clkPerCycle),
		.clk(clk), 
		.nReset(nReset)
	);

endmodule
`default_nettype wire
/*
Author: Sebastien Riou (acapola)
Creation date: 17:16:40 01/09/2011 

$LastChangedDate: 2011-03-07 14:17:52 +0100 (Mon, 07 Mar 2011) $
$LastChangedBy: acapola $
$LastChangedRevision: 18 $
$HeadURL: file:///svn/iso7816_3_master/iso7816_3_master/trunk/sources/Iso7816_3_Master.v $				 

This file is under the BSD licence:
Copyright (c) 2011, Sebastien Riou

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
The names of contributors may not be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`default_nettype none
module Iso7816_3_Master(
    input wire nReset,
    input wire clk,
	 input wire [15:0] clkPerCycle,//not supported yet
	 input wire startActivation,//Starts activation sequence
	 input wire startDeactivation,//Starts deactivation sequence
    input wire [7:0] dataIn,
    input wire nWeDataIn,
	 input wire [12:0] cyclesPerEtu,
    output reg [7:0] dataOut,
    input wire nCsDataOut,
    output wire [7:0] statusOut,
    input wire nCsStatusOut,
	 output reg isActivated,//set to high by activation sequence, set to low by deactivation sequence
	 output wire useIndirectConvention,
	 output wire tsError,//high if TS character is wrong
	 output wire tsReceived,
	 output wire atrIsEarly,//high if TS received before 400 cycles after reset release
	 output wire atrIsLate,//high if TS is still not received after 40000 cycles after reset release
	 //ISO7816 signals
    //inout wire isoSio,//not synthesisable on FPGA :-S
	 output wire isTx,
	 input wire isoSioIn,
	 output wire isoSioOut,
	 output wire isoClk,
	 output reg isoReset,
	 output reg isoVdd
    );

wire txRun,txPending, rxRun, rxStartBit, overrunErrorFlag, frameErrorFlag, bufferFull;
assign {txRun, txPending, rxRun, rxStartBit, isTx, overrunErrorFlag, frameErrorFlag, bufferFull} = statusOut;

//wire serialOut;
//not synthesisable on FPGA :-S
//assign isoSio = isTx ? serialOut : 1'bz;
//pullup(isoSio);
wire comClk;

wire stopBit2=1'b1;//0: 1 stop bit, 1: 2 stop bits 
wire msbFirst = useIndirectConvention;//if 1, bits order is: startBit, b7, b6, b5...b0, parity
wire oddParity = 1'b0;//if 1, parity bit is such that data+parity have an odd number of 1
wire sioHighValue = ~useIndirectConvention;//apply only to data bits

wire [7:0] uart_dataOut;
wire [7:0] uart_dataIn = sioHighValue ? dataIn : ~dataIn;
always @(*) dataOut = sioHighValue ? uart_dataOut : ~uart_dataOut;


	HalfDuplexUartIf #(
		.DIVIDER_WIDTH(1'b1),
		.CLOCK_PER_BIT_WIDTH(4'd13)
		)
	uart (
		.nReset(nReset), 
		.clk(clk),
		.clkPerCycle(1'b0),
		.dataIn(uart_dataIn), 
		.nWeDataIn(nWeDataIn), 
		.clocksPerBit(cyclesPerEtu), 
		.stopBit2(stopBit2), 
		.oddParity(oddParity), 
      .msbFirst(msbFirst),  
	   .dataOut(uart_dataOut), 
		.nCsDataOut(nCsDataOut), 
		.statusOut(statusOut), 
		.nCsStatusOut(nCsStatusOut), 
		.serialIn(isoSioIn),
		.serialOut(isoSioOut),
		.comClk(comClk)
	);
	
	reg isoClkEn;
	assign isoClk = isoClkEn ? comClk : 1'b0;
	
reg [16:0] resetCnt;
reg waitTs;
assign tsReceived = ~waitTs;
reg [7:0] ts;
assign atrIsEarly = ~waitTs & (resetCnt<(16'h100+16'd400));
assign atrIsLate = resetCnt>(16'h100+16'd40000);
assign useIndirectConvention = ~waitTs & (ts==8'h3F);
assign tsError = ~waitTs & (ts!=8'h3B) & (ts!=8'h3F);
always @(posedge comClk, negedge nReset) begin
	if(~nReset) begin
		isoClkEn <= 1'b0;
		resetCnt<=16'b0;
		waitTs<=1'b1;
		isoReset <= 1'b0;
		isoVdd <= 1'b0;
		isActivated <= 1'b0;
	end else if(isActivated) begin
		if(waitTs) begin
			if(statusOut[0]) begin
				waitTs<=1'b0;
				case(dataOut)
					8'h3B: ts<=dataOut;
					8'h03: ts<=8'h3F;//03 is 3F written LSB first and complemented
					default: ts<=dataOut;
				endcase
			end
			resetCnt<=resetCnt+1'b1;
		end
		if(startDeactivation) begin
			isoVdd <= 1'b0;
			isoClkEn <= 1'b0;
			isoReset <= 1'b0;
			resetCnt<=16'b0;
			isActivated <= 1'b0;
		end
	end else begin
		if(startActivation) begin
			waitTs <= 1'b1;
			isoVdd <= 1'b1;
			isoClkEn <= 1'b1;
			if(16'h100 == resetCnt) begin
				isActivated <=1'b1;
				isoReset <=1'b1;
			end else
				resetCnt<=resetCnt + 1'b1;
		end else begin
			resetCnt<=16'b0;
		end
	end
end
endmodule
`default_nettype wire
/*
Author: Sebastien Riou (acapola)
Creation date: 23:57:02 08/31/2010 

$LastChangedDate: 2011-01-29 13:16:17 +0100 (Sat, 29 Jan 2011) $
$LastChangedBy: acapola $
$LastChangedRevision: 11 $
$HeadURL: file:///svn/iso7816_3_master/iso7816_3_master/trunk/sources/RxCoreSelfContained.v $				 

This file is under the BSD licence:
Copyright (c) 2011, Sebastien Riou

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
The names of contributors may not be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`default_nettype none
`timescale 1ns / 1ps

module RxCoreSelfContained
#(//parameters to override
	parameter DIVIDER_WIDTH = 1,
	parameter CLOCK_PER_BIT_WIDTH = 13,	//allow to support default speed of ISO7816
	parameter PRECISE_STOP_BIT = 0, //if 1, stopBit signal goes high exactly at start of stop bit instead of middle of parity bit
	//default conventions
	parameter START_BIT = 1'b0,
	parameter STOP_BIT1 = 1'b1,
	parameter STOP_BIT2 = 1'b1
)
(
    output wire [7:0] dataOut,
    output wire overrunErrorFlag,	//new data has been received before dataOut was read
    output wire dataOutReadyFlag,	//new data available
    output wire frameErrorFlag,		//bad parity or bad stop bits
    output wire endOfRx,				//one cycle pulse: 1 during last cycle of last stop bit
    output wire run,					//rx is definitely started, one of the three flag will be set
    output wire startBit,				//rx is started, but we don't know yet if real rx or just a glitch
	 output wire stopBit,				//rx is over but still in stop bits
	 input wire [DIVIDER_WIDTH-1:0] clkPerCycle,
	 input wire [CLOCK_PER_BIT_WIDTH-1:0] clocksPerBit,			
	 input wire stopBit2,//0: 1 stop bit, 1: 2 stop bits
	 input wire oddParity, //if 1, parity bit is such that data+parity have an odd number of 1
    input wire msbFirst,  //if 1, bits order is: startBit, b7, b6, b5...b0, parity
	 input wire ackFlags,
	 input wire serialIn,
    input wire comClk,//not used yet
    input wire clk,
    input wire nReset
    );

wire [CLOCK_PER_BIT_WIDTH-1:0] bitClocksCounter;
wire bitClocksCounterEarlyMatch;
wire bitClocksCounterMatch;
wire [CLOCK_PER_BIT_WIDTH-1:0] bitClocksCounterCompare;
wire bitClocksCounterInc;
wire bitClocksCounterClear;
wire bitClocksCounterInitVal;
wire dividedClk;
Counter #(	.DIVIDER_WIDTH(DIVIDER_WIDTH),
				.WIDTH(CLOCK_PER_BIT_WIDTH),
				.WIDTH_INIT(1)) 
		bitClocksCounterModule(
				.counter(bitClocksCounter),
				.earlyMatch(bitClocksCounterEarlyMatch),
				.match(bitClocksCounterMatch),
				.dividedClk(dividedClk),
				.divider(clkPerCycle),
				.compare(bitClocksCounterCompare),
				.inc(bitClocksCounterInc),
				.clear(bitClocksCounterClear),
				.initVal(bitClocksCounterInitVal),
				.clk(clk),
				.nReset(nReset));

RxCore #(	.CLOCK_PER_BIT_WIDTH(CLOCK_PER_BIT_WIDTH),
				.PRECISE_STOP_BIT(PRECISE_STOP_BIT)
				)
	rxCore (
    .dataOut(dataOut), 
    .overrunErrorFlag(overrunErrorFlag), 
    .dataOutReadyFlag(dataOutReadyFlag), 
    .frameErrorFlag(frameErrorFlag), 
    .endOfRx(endOfRx),
    .run(run), 
    .startBit(startBit),
    .stopBit(stopBit),
    .clocksPerBit(clocksPerBit), 
    .stopBit2(stopBit2), 
    .oddParity(oddParity),
    .msbFirst(msbFirst),
	 .ackFlags(ackFlags), 
    .serialIn(serialIn), 
    .clk(clk), 
    .nReset(nReset),
	.bitClocksCounterEarlyMatch(bitClocksCounterEarlyMatch),
   .bitClocksCounterMatch(bitClocksCounterMatch),
	.bitClocksCounterCompare(bitClocksCounterCompare),
	.bitClocksCounterInc(bitClocksCounterInc),
	.bitClocksCounterClear(bitClocksCounterClear),
	.bitClocksCounterInitVal(bitClocksCounterInitVal),
	.bitClocksCounter(bitClocksCounter)
    );

endmodule
`default_nettype wire
/*
Author: Sebastien Riou (acapola)
Creation date: 23:57:02 09/04/2010 

$LastChangedDate: 2011-01-29 13:16:17 +0100 (Sat, 29 Jan 2011) $
$LastChangedBy: acapola $
$LastChangedRevision: 11 $
$HeadURL: file:///svn/iso7816_3_master/iso7816_3_master/trunk/sources/RxCoreSpec.v $				 

This file is under the BSD licence:
Copyright (c) 2011, Sebastien Riou

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
The names of contributors may not be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`default_nettype none

/*
non synthetizable model used as reference in test bench
*/

module RxCoreSpec(
    output reg [7:0] dataOut,
    output reg overrunErrorFlag,	//new data has been received before dataOut was read
    output reg dataOutReadyFlag,	//new data available
    output reg frameErrorFlag,		//bad parity or bad stop bits
    output reg endOfRx,
    output reg run,					//rx is definitely started, one of the three flag will be set
    output reg startBit,				//rx is started, but we don't know yet if real rx or just a glitch
	 input [CLOCK_PER_BIT_WIDTH-1:0] clocksPerBit,			
	 input stopBit2,//0: 1 stop bit, 1: 2 stop bits
	 input ackFlags,
	 input serialIn,
    input clk,
    input nReset
    );
parameter CLK_PERIOD = 10;//should be %2
//parameters to override
parameter CLOCK_PER_BIT_WIDTH = 13;	//allow to support default speed of ISO7816
//invert the polarity of the output or not
parameter IN_POLARITY = 1'b0;
parameter PARITY_POLARITY = 1'b0;
//default conventions
parameter START_BIT = 1'b0;
parameter STOP_BIT1 = 1'b1;
parameter STOP_BIT2 = 1'b1;

//constant definition for states
localparam IDLE_BIT = ~START_BIT;

integer bitCounter;

reg parityBit;
reg rxStarted;

wire internalIn;
wire parityError;

assign internalIn = serialIn ^ IN_POLARITY;
assign parityError= parityBit ^ internalIn ^ PARITY_POLARITY ^ 1'b1;
reg syncClk;

/*logic to avoid race condition on flags
if internal logic set the flag and at the same time
the signal ackFlags is set (that normally clears the flags), the flag should be set
*/
reg setOverrunErrorFlag;
reg nResetOverrunErrorFlag;
always @(negedge clk) begin
	setOverrunErrorFlag<=1'b0;
end

//flag set has priority over flag nReset
always @(setOverrunErrorFlag,nResetOverrunErrorFlag) begin
	if((setOverrunErrorFlag===1'b1) || (setOverrunErrorFlag===1'bx)) begin
		overrunErrorFlag<=setOverrunErrorFlag;
		if(nResetOverrunErrorFlag)
			nResetOverrunErrorFlag=0;
	end else begin
		if(nResetOverrunErrorFlag) begin
			overrunErrorFlag<=0;
			nResetOverrunErrorFlag=0;
		end
	end
end

reg setDataOutReadyFlag;
reg nResetDataOutReadyFlag;
always @(negedge clk) begin
	setDataOutReadyFlag<=1'b0;
end

//flag set has priority over flag nReset
always @(setDataOutReadyFlag,nResetDataOutReadyFlag) begin
	if((setDataOutReadyFlag===1'b1) || (setDataOutReadyFlag===1'bx)) begin
		dataOutReadyFlag<=setDataOutReadyFlag;
		if(nResetDataOutReadyFlag)
			nResetDataOutReadyFlag=0;
	end else begin
		if(nResetDataOutReadyFlag) begin
			dataOutReadyFlag<=0;
			nResetDataOutReadyFlag=0;
		end
	end
end

reg setFrameErrorFlag;
reg nResetFrameErrorFlag;
always @(negedge clk) begin
	setFrameErrorFlag<=1'b0;
end

//flag set has priority over flag nReset
always @(setFrameErrorFlag,nResetFrameErrorFlag) begin
	if((setFrameErrorFlag===1'b1) || (setFrameErrorFlag===1'bx)) begin
		frameErrorFlag<=setFrameErrorFlag;
		if(nResetFrameErrorFlag)
			nResetFrameErrorFlag=0;
	end else begin
		if(nResetFrameErrorFlag) begin
			frameErrorFlag<=0;
			nResetFrameErrorFlag=0;
		end
	end
end

reg dataOutReadyFlagAckDone;
reg frameErrorFlagAckDone;

always @(posedge clk) begin:ACK_FLAGS
	if(ackFlags) begin
		if(0==rxStarted)
			nResetOverrunErrorFlag<=1;//otherwise, done in OVERRUN_BIT block
		if(dataOutReadyFlag!==1'bx)
			nResetDataOutReadyFlag<=1'b1;
		dataOutReadyFlagAckDone<=1'b1;
		if(frameErrorFlag!==1'bx)
			nResetFrameErrorFlag<=1'b1;
		frameErrorFlagAckDone<=1'b1;
	end
end

reg internalStart;
integer clockCounter;
always@(posedge internalStart) begin:CLOCK_COUNTER
	for(clockCounter=0;clockCounter<(11+stopBit2)*(clocksPerBit+1);clockCounter=clockCounter+1) begin
		syncClk=0;
		#(CLK_PERIOD/2);
		syncClk=1;
		#(CLK_PERIOD/2);
	end
end

reg abortStart;
always@(posedge abortStart) begin:ABORT_START
	abortStart<=0;
	startBit<=1'bx;
	#(CLK_PERIOD*(clocksPerBit+1)/4);
	if(internalIn)
		startBit<=0;
end
//Start bit spec
always@(negedge internalIn) begin:START_BIT_BLK
	if(frameErrorFlag | overrunErrorFlag) begin
		//nothing to do, wait clear from outside 
	end else begin
		internalStart<=1;
		startBit<=1'bx;
		#(CLK_PERIOD*(clocksPerBit+1)/4);
		internalStart<=0;
		startBit<=1;
		#(CLK_PERIOD*(clocksPerBit+1)/4);
		if(internalIn==0) begin
			startBit<=1'bx;
			#(CLK_PERIOD*(clocksPerBit+1)/4);
			startBit<=0;
			#(CLK_PERIOD*(clocksPerBit+1)/4);
			#(CLK_PERIOD*(10+stopBit2)*(clocksPerBit+1));//ignore falling edge until end of the byte
		end else begin
			abortStart<=1;
		end
	end
end

wire [31:0] stopStart=10*(clocksPerBit+1);
wire [31:0] stopEnd=((10+stopBit2)*(clocksPerBit+1)+((clocksPerBit+1)*3)/4);
wire isInStop=(clockCounter>=stopStart) && (clockCounter<stopEnd);
reg runBitSet;
//Run bit spec
always@(negedge internalIn) begin:RUN_BIT_SET
	if(frameErrorFlag | overrunErrorFlag) begin
		//nothing to do, wait clear from outside 
	end else if(~isInStop) begin
		runBitSet<=1'b0;
		#(CLK_PERIOD*(clocksPerBit+1)/2);
		if(internalIn == 0) begin
			fork
				begin
					runBitSet<=1'b1;
					run<=1'bx;
					#(CLK_PERIOD*(clocksPerBit+1)/4);
					run<=1;
				end 
				begin
					#(CLK_PERIOD*(clocksPerBit+1)/2);
					#(CLK_PERIOD*(9+stopBit2)*(clocksPerBit+1));
				end
			join
		end
	end
end

always@(posedge runBitSet) begin:RUN_BIT_CLEAR
	#(CLK_PERIOD*(clocksPerBit+1)/2);
	#(CLK_PERIOD*(((10+stopBit2)*(clocksPerBit+1))-2));
   if(runBitSet)
      endOfRx<=1'bx;
	#(CLK_PERIOD);
	if(runBitSet) begin//might be cleared by nReset
		run<=1'bx;
		#(CLK_PERIOD*(clocksPerBit+1)/4);
      endOfRx<=1'b0;
      run<=0;
	end
end

//overrun  bit spec
reg internalOv;
wire [31:0] minOvCount=(clocksPerBit+1);//WARNING: DATA_OUT block rely on this
wire [31:0] maxOvCount=((clocksPerBit+1)/2)+(clocksPerBit+1)+(clocksPerBit+1)/4;
always@(posedge syncClk) begin:OVERRUN_BIT
	if(clockCounter<maxOvCount) begin//internal requests to set the flag have priority over clear by ackFlags
		if(clockCounter==minOvCount)
			if(dataOutReadyFlag)
				setOverrunErrorFlag <= 1'bx;
	end else if(clockCounter==maxOvCount) begin
		if(1'bx===overrunErrorFlag)
			setOverrunErrorFlag <= 1;
	end else
		if(ackFlags)
			nResetOverrunErrorFlag <= 1;
end

reg [7:0] dataStorage;
reg waitStartBit;
//dataOut spec
//frameErrorFlag spec (1/2)
always@(negedge internalIn) begin:DATA_OUT
	if(frameErrorFlag | overrunErrorFlag) begin
		//nothing to do, wait clear from outside 
	end else begin
		waitStartBit<=1'b0;
		#(CLK_PERIOD*(clocksPerBit+1)/2);
		if(internalIn==0) begin
			#(CLK_PERIOD*(minOvCount-((clocksPerBit+1)/2)));
			fork
				if(0==dataOutReadyFlag) begin
					dataOut<=8'bx;
					#(CLK_PERIOD*(clocksPerBit+1)/2);
					#(CLK_PERIOD*8*(clocksPerBit+1));//wait 8 bits + parity
					parityBit <= ^dataStorage;
					if(0==(^dataStorage) ^ internalIn ^ PARITY_POLARITY ^ 1'b1) begin
						setDataOutReadyFlag<=1'bx;
						dataOutReadyFlagAckDone<=1'b0;
						#(CLK_PERIOD*2);//#(CLK_PERIOD*(clocksPerBit+1)/4);//allow 1/4 bit time latency
						dataOut<=dataStorage;
						if(~dataOutReadyFlagAckDone)
							setDataOutReadyFlag<=1'b1;
						else
							nResetDataOutReadyFlag<=1'b1;
					end else begin
						setFrameErrorFlag <= 1'bx;
						frameErrorFlagAckDone<=1'b0;
						#(CLK_PERIOD*2);//#(CLK_PERIOD*(clocksPerBit+1)/4);//allow 1/4 bit time latency
						if(~frameErrorFlagAckDone)
							setFrameErrorFlag<=1'b1;
						else
							nResetFrameErrorFlag<=1'b1;
					end
				end
				begin
					#(CLK_PERIOD*(clocksPerBit+1)/4);//we can detect start bit a 1/4 of bit time before the actual end of the transfer
					#(CLK_PERIOD*(9+stopBit2)*(clocksPerBit+1));
					#(CLK_PERIOD*(clocksPerBit+1)/2);
				end
			join
		end
		waitStartBit<=1'b1;
	end
end

//frameErrorFlag spec (2/2)
always@(negedge internalIn) begin:FRAME_ERROR
	if(frameErrorFlag | overrunErrorFlag) begin
		//nothing to do, wait clear from outside 
	end else begin
		if(isInStop) begin
			setFrameErrorFlag <= 1'bx;
			frameErrorFlagAckDone<=1'b0;
			#(CLK_PERIOD*(clocksPerBit+1)/1);//allow 1 bit time latency
			if(~frameErrorFlagAckDone)
				setFrameErrorFlag<=1'b1;
			else
				nResetFrameErrorFlag<=1'b1;
		end
	end
end

initial begin
	internalStart=0;
	clockCounter=0;
	abortStart=0;
	internalOv=0;
end

always @(negedge internalIn, negedge nReset) begin:MAIN
	if(~nReset) begin
		bitCounter <= 0;
		parityBit <= 0;
		nResetOverrunErrorFlag <= 1'b1;
		setOverrunErrorFlag <= 1'b0;
		nResetDataOutReadyFlag <= 1'b1;
		setDataOutReadyFlag <= 1'b0;
		nResetFrameErrorFlag <= 1'b1;
		setFrameErrorFlag<=1'b0;
      endOfRx<=1'b0;
		run <= 0;
		startBit <= 0;
		runBitSet<=0;
	end else if(frameErrorFlag | overrunErrorFlag) begin
		//nothing to do, wait clear from outside
	end else begin	
		rxStarted<=1'b1;
		#(CLK_PERIOD*(clocksPerBit+1)/2);
		if(internalIn == 0) begin
			@(posedge clk);
			for(bitCounter=0;bitCounter<8;bitCounter=bitCounter+1) begin
				#(CLK_PERIOD*(clocksPerBit+1)/1);
				if(~dataOutReadyFlag) begin
					dataStorage[bitCounter]<=internalIn;
				end
			end
			#(CLK_PERIOD*(clocksPerBit+1)/1);
			#(CLK_PERIOD*(clocksPerBit+1)/1);
			if(stopBit2) begin
				#(CLK_PERIOD*(clocksPerBit+1)/1);
			end
			rxStarted <= 1'b0;
		end
	end
end

endmodule
`default_nettype wire
/*
Author: Sebastien Riou (acapola)
Creation date: 23:57:02 08/31/2010 

$LastChangedDate: 2011-03-07 14:17:52 +0100 (Mon, 07 Mar 2011) $
$LastChangedBy: acapola $
$LastChangedRevision: 18 $
$HeadURL: file:///svn/iso7816_3_master/iso7816_3_master/trunk/sources/RxCore.v $				 

This file is under the BSD licence:
Copyright (c) 2011, Sebastien Riou

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
The names of contributors may not be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`default_nettype none
`timescale 1ns / 1ps

module RxCore
#(//parameters to override
parameter CLOCK_PER_BIT_WIDTH = 13,	//allow to support default speed of ISO7816
parameter PRECISE_STOP_BIT = 0, //if 1, stopBit signal goes high exactly at start of stop bit instead of middle of parity bit
//default conventions (nothing to do with iso7816's convention, this is configured dynamically by the inputs)
parameter START_BIT = 1'b0,
parameter STOP_BIT1 = 1'b1,
parameter STOP_BIT2 = 1'b1
)
(
   output reg [7:0] dataOut,
   output reg overrunErrorFlag,	//new data has been received before dataOut was read
   output reg dataOutReadyFlag,	//new data available
   output reg frameErrorFlag,		//bad parity or bad stop bits
   output reg endOfRx,				//one cycle pulse: 1 during last cycle of last stop bit
   output reg run,					//rx is definitely started, one of the three flag will be set
   output wire startBit,			//rx is started, but we don't know yet if real rx or just a glitch
	output reg stopBit,				//rx is over but still in stop bits
	input wire [CLOCK_PER_BIT_WIDTH-1:0] clocksPerBit,			
	input wire stopBit2,//0: 1 stop bit, 1: 2 stop bits
	input wire oddParity, //if 1, parity bit is such that data+parity have an odd number of 1
   input wire msbFirst,  //if 1, bits order is: startBit, b7, b6, b5...b0, parity
	input wire ackFlags,
	input wire serialIn,
	input wire clk,
   input wire nReset,
	//to connect to an instance of Counter.v (see RxCoreSelfContained.v for example)
	output reg [CLOCK_PER_BIT_WIDTH-1:0] bitClocksCounterCompare,
	output reg bitClocksCounterInc,
	output reg bitClocksCounterClear,
	output wire bitClocksCounterInitVal,
   input wire bitClocksCounterEarlyMatch,
	input wire bitClocksCounterMatch,
	input wire [CLOCK_PER_BIT_WIDTH-1:0] bitClocksCounter
    );

//constant definition for states
localparam IDLE_STATE = 	3'b000;
localparam START_STATE = 	3'b001;
localparam DATA_STATE = 	3'b011;
localparam PARITY_STATE = 	3'b010;
localparam STOP1_STATE = 	3'b110;
localparam STOP2_STATE = 	3'b111;
localparam END_STATE = 		3'b101;
localparam END2_STATE =    3'b100;

localparam IDLE_BIT = ~START_BIT;

reg [2:0] nextState;

reg [2:0] bitCounter;
wire [2:0] bitIndex = msbFirst ? 7-bitCounter : bitCounter;
reg parityBit;

wire internalIn;
wire parityError;

assign startBit = (nextState == START_STATE);
//assign stopBit = (nextState == STOP1_STATE) | (nextState == STOP2_STATE);
assign internalIn = serialIn;
assign parityError= parityBit ^ internalIn ^ 1'b1;
reg flagsSet;

assign bitClocksCounterInitVal=(nextState==IDLE_STATE);
always @(nextState, clocksPerBit, run, bitClocksCounterMatch) begin
	case(nextState)
		IDLE_STATE: begin
			bitClocksCounterCompare = (clocksPerBit/2);
			bitClocksCounterInc = run & ~bitClocksCounterMatch;//stop when reach 0
			bitClocksCounterClear = ~run;
		end
		START_STATE: begin
			bitClocksCounterCompare = (clocksPerBit/2);
			bitClocksCounterInc = 1;
			bitClocksCounterClear = 0;
		end
		STOP2_STATE: begin
         //make the rx operation is one cycle shorter, 
         //since we detect the start bit at least one cycle later it starts.
			bitClocksCounterCompare = clocksPerBit-1'b1;
			bitClocksCounterInc = 1;
			bitClocksCounterClear = 0;
		end
		default: begin
			bitClocksCounterCompare = clocksPerBit;
			bitClocksCounterInc = 1;
			bitClocksCounterClear = 0;		
		end
	endcase
end

always @(posedge clk, negedge nReset) begin
	if(~nReset) begin
		nextState <= #1 IDLE_STATE;
		bitCounter <= #1 0;
		parityBit <= #1 0;
		overrunErrorFlag <= #1 0;
		dataOutReadyFlag <= #1 0;
		frameErrorFlag <= #1 0;
		run <= #1 0;
      endOfRx <= #1 0;
		stopBit<= #1 0;
	end else begin	
		case(nextState)
			IDLE_STATE: begin
				if(bitClocksCounterEarlyMatch)
               endOfRx <= #1 1'b1;
            if(bitClocksCounterMatch) begin
               endOfRx <= #1 0;
					stopBit <= #1 0;
				end
            if(ackFlags) begin
					//overrunErrorFlag is auto cleared at PARITY_STATE
					//meanwhile, it prevent dataOutReadyFlag to be set by the termination of the lost byte
					dataOutReadyFlag <= #1 0;
					frameErrorFlag <= #1 0;
				end
				if(START_BIT == internalIn) begin
					if(frameErrorFlag | overrunErrorFlag) begin
						//wait clear from outside
						if(bitClocksCounterMatch) begin
                     //endOfRx <= #1 0;
							run <= #1 0;
                  end
					end else begin
						parityBit <= #1 ~oddParity;
						run <= #1 0;
						nextState <= #1 START_STATE;
					end
				end else begin
					if(bitClocksCounterMatch) begin
                  //endOfRx <= #1 0;
						run <= #1 0;
               end
				end
			end
			START_STATE: begin
				if(ackFlags) begin
					dataOutReadyFlag <= #1 0;
					frameErrorFlag <= #1 0;
				end
				if(bitClocksCounterMatch) begin
					if(START_BIT != internalIn) begin
						nextState <= #1 IDLE_STATE;
					end else begin
						run <= #1 1;
						nextState <= #1 DATA_STATE;
					end
				end
			end
			DATA_STATE: begin
				if(ackFlags) begin
					dataOutReadyFlag <= #1 0;
					frameErrorFlag <= #1 0;
				end
				if(bitClocksCounterMatch) begin
					if(dataOutReadyFlag) begin
						overrunErrorFlag <= #1 1;
					end else
						dataOut[bitIndex] <= #1 internalIn;			
					parityBit <= #1 parityBit ^ internalIn;
					bitCounter <= #1 (bitCounter + 1'b1) & 3'b111;
					if(bitCounter == 7)
						nextState <= #1 PARITY_STATE;
				end
			end
			PARITY_STATE: begin
				if(bitClocksCounterMatch) begin
					if(~overrunErrorFlag) begin
						frameErrorFlag <= #1 parityError;
						dataOutReadyFlag <= #1 ~parityError;
					end else if(ackFlags) begin
						frameErrorFlag <= #1 0;
					end
					flagsSet=1;
					if(PRECISE_STOP_BIT==0) stopBit <= #1 1;
					if(stopBit2)
						nextState <= #1 STOP1_STATE;
					else
						nextState <= #1 STOP2_STATE;
				end else if(ackFlags) begin
					dataOutReadyFlag <= #1 0;
					frameErrorFlag <= #1 0;
				end
			end
			STOP1_STATE: begin
				if(ackFlags) begin
					dataOutReadyFlag <= #1 0;
				end
				if(bitClocksCounterMatch) begin
					if(STOP_BIT1 != internalIn) begin
						frameErrorFlag <= #1 parityError;
					end else if(ackFlags) begin
						frameErrorFlag <= #1 0;
					end
					nextState <= #1 STOP2_STATE;
				end else if(ackFlags) begin
					frameErrorFlag <= #1 0;
				end
				if(PRECISE_STOP_BIT!=0) begin
					if(bitClocksCounter==(bitClocksCounterCompare/2)) begin
						stopBit <= #1 1;
					end
				end
			end
			STOP2_STATE: begin
				if(ackFlags) begin
					dataOutReadyFlag <= #1 0;
				end
            if(bitClocksCounterMatch) begin
					if(STOP_BIT2 != internalIn) begin
						frameErrorFlag <= #1 1;
					end else if(ackFlags) begin
						frameErrorFlag <= #1 0;
					end
					nextState <= #1 IDLE_STATE;
				end else if(ackFlags) begin
					frameErrorFlag <= #1 0;
				end
				if(PRECISE_STOP_BIT!=0) begin
					if(bitClocksCounter==(bitClocksCounterCompare/2)) begin
						stopBit <= #1 1;
					end
				end
			end
			default: nextState <= #1 IDLE_STATE;
		endcase
	end
end

endmodule
`default_nettype wire
/*
Author: Sebastien Riou (acapola)
Creation date: 21:16:10 08/29/2010 

$LastChangedDate: 2011-03-07 14:17:52 +0100 (Mon, 07 Mar 2011) $
$LastChangedBy: acapola $
$LastChangedRevision: 18 $
$HeadURL: file:///svn/iso7816_3_master/iso7816_3_master/trunk/sources/TxCore.v $				 

This file is under the BSD licence:
Copyright (c) 2011, Sebastien Riou

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
The names of contributors may not be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`default_nettype none
`timescale 1ns / 1ps

module TxCore
#(//parameters to override
	parameter DIVIDER_WIDTH = 1,
	parameter CLOCK_PER_BIT_WIDTH = 13,//allow to support default speed of ISO7816
	//default conventions
	parameter START_BIT = 1'b0,
	parameter STOP_BIT1 = 1'b1
)
(
    output wire comClk,
    output wire serialOut,
    output wire run,
	 output reg endOfTx,
    output wire full,
    output wire stopBits, //1 during stop bits
    input wire [7:0] dataIn,
    input wire [DIVIDER_WIDTH-1:0] clkPerCycle,
	 input wire [CLOCK_PER_BIT_WIDTH-1:0] clocksPerBit,			
	 input wire loadDataIn,   //evaluated only when full=0, when full goes to one, dataIn has been read
    input wire stopBit2,//0: 1 stop bit, 1: 2 stop bits
    input wire oddParity, //if 1, parity bit is such that data+parity have an odd number of 1
    input wire msbFirst,  //if 1, bits will be send in the order startBit, b7, b6, b5...b0, parity
	 input wire clk,
    input wire nReset
    );

//constant definition for state
localparam IDLE_STATE = 0;
localparam START_STATE = 1;
localparam SEND_DATA_STATE = 2;
localparam SEND_PARITY_STATE = 3;
localparam SEND_STOP1_STATE = 4;
localparam SEND_STOP2_STATE = 5;

localparam IDLE_BIT = ~START_BIT;
localparam STOP_BIT2 = STOP_BIT1;

wire [CLOCK_PER_BIT_WIDTH-1:0] bitClocksCounter;
wire bitClocksCounterEarlyMatch;
wire bitClocksCounterMatch;
reg [CLOCK_PER_BIT_WIDTH-1:0] bitClocksCounterCompare;
reg bitClocksCounterInc;
reg bitClocksCounterClear;
wire bitClocksCounterInitVal;
Counter #(	.DIVIDER_WIDTH(DIVIDER_WIDTH),
				.WIDTH(CLOCK_PER_BIT_WIDTH),
				.WIDTH_INIT(1)) 
		bitClocksCounterModule(
				.counter(bitClocksCounter),
				.earlyMatch(bitClocksCounterEarlyMatch),
				.match(bitClocksCounterMatch),
				.dividedClk(comClk),
				.divider(clkPerCycle),
				.compare(bitClocksCounterCompare),
				.inc(bitClocksCounterInc),
				.clear(bitClocksCounterClear),
				.initVal(bitClocksCounterInitVal),
				.clk(clk),
				.nReset(nReset));

reg [2:0] nextState;
reg [2:0] bitCounter;
reg [7:0] dataBuffer;

reg parityBit;

wire internalOut;
wire dataBit;
//after a tx operation, during the first cycle in IDLE_STATE, run bit must be still set 
//(it is entered one cycle before the completion of the operation, so we use bitClocksCounter[0]
//to implement this behavior)
assign run = (nextState == IDLE_STATE) ? bitClocksCounter[0] : 1'b1;
assign full = (nextState != IDLE_STATE);
assign stopBits = (nextState == SEND_STOP1_STATE)|(nextState == SEND_STOP2_STATE)|((nextState == IDLE_STATE) & bitClocksCounter[0]);

assign serialOut = internalOut;
wire [2:0] bitIndex = msbFirst ? 7-bitCounter : bitCounter;
assign dataBit = dataBuffer[bitIndex];
wire [0:5] bitSel;
assign bitSel = {IDLE_BIT, START_BIT, dataBit, parityBit, STOP_BIT1, STOP_BIT2};
assign internalOut = bitSel[nextState];

assign bitClocksCounterInitVal=0;

always @(*) begin
   case(nextState)
      START_STATE:    
         bitClocksCounterCompare = clocksPerBit-1'b1;
      SEND_STOP2_STATE:    
         bitClocksCounterCompare = clocksPerBit-1'b1;
      default: 
         bitClocksCounterCompare = clocksPerBit;
   endcase
end

always @(nextState) begin
	case(nextState)
		IDLE_STATE: begin
			bitClocksCounterInc = 0;
			bitClocksCounterClear = 1;
		end
		default: begin
			bitClocksCounterInc = 1;
			bitClocksCounterClear = 0;		
		end
	endcase
end

always @(posedge clk, negedge nReset) begin
	if(~nReset) begin
		nextState <= #1 IDLE_STATE;
		bitCounter <= #1 0;
		endOfTx <= #1 1'b0;
	end else begin
		case(nextState)
			IDLE_STATE: begin
				if(loadDataIn) begin
					dataBuffer <= #1 dataIn;
					parityBit <= #1 oddParity;
					nextState <= #1 START_STATE;
				end
			end
			START_STATE: begin
				if(bitClocksCounterMatch) begin
					nextState <= #1 SEND_DATA_STATE;
				end
			end
			SEND_DATA_STATE: begin
				if(bitClocksCounterMatch) begin
					bitCounter <= #1 (bitCounter + 1'b1) & 3'b111;
					parityBit <= #1 parityBit ^ dataBit;
					if(bitCounter == 7)
						nextState <= #1 SEND_PARITY_STATE;
				end
			end
			SEND_PARITY_STATE: begin
				if(bitClocksCounterMatch) begin
					if(stopBit2)
						nextState <= #1 SEND_STOP1_STATE;
					else
						nextState <= #1 SEND_STOP2_STATE;//if single stop bit, we skip STOP1 state
				end
			end
			SEND_STOP1_STATE: begin
				if(bitClocksCounterMatch)
					nextState <= #1 SEND_STOP2_STATE;
			end
			SEND_STOP2_STATE: begin
				if(bitClocksCounterEarlyMatch)
					endOfTx <= #1 1'b1;
				if(bitClocksCounterMatch) begin
               nextState <= #1 IDLE_STATE;
					endOfTx <= #1 1'b0;
				end
         end
			default: nextState <= #1 IDLE_STATE;
		endcase
	end

end

endmodule
`default_nettype wire
/*
Author: Sebastien Riou (acapola)
Creation date: 23:57:02 08/31/2010 

$LastChangedDate: 2011-03-07 14:17:52 +0100 (Mon, 07 Mar 2011) $
$LastChangedBy: acapola $
$LastChangedRevision: 18 $
$HeadURL: file:///svn/iso7816_3_master/iso7816_3_master/trunk/sources/Uart.v $				 

This file is under the BSD licence:
Copyright (c) 2011, Sebastien Riou

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
The names of contributors may not be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`default_nettype none
`timescale 1ns / 1ps

/*
Half duplex UART with 1 byte buffer
*/
module BasicHalfDuplexUart
#(//parameters to override
	parameter DIVIDER_WIDTH = 1,
	parameter CLOCK_PER_BIT_WIDTH = 13,	//allow to support default speed of ISO7816
	//invert the polarity of the output or not
	parameter IN_POLARITY = 1'b0,
	parameter PARITY_POLARITY = 1'b1,
	//default conventions
	parameter START_BIT = 1'b0,
	parameter STOP_BIT1 = 1'b1,
	parameter STOP_BIT2 = 1'b1
)
(
    output wire [7:0] rxData,
    output wire overrunErrorFlag,	//new data has been received before dataOut was read
    output wire dataOutReadyFlag,	//new data available
    output wire frameErrorFlag,		//bad parity or bad stop bits
    output wire txRun,					//tx is started
    output wire endOfRx,           //one cycle pulse: 1 during last cycle of last stop bit of rx
    output wire rxRun,					//rx is definitely started, one of the three flag will be set
    output wire rxStartBit,			//rx is started, but we don't know yet if real rx or just a glitch
    output wire txFull,
    output wire isTx,              //1 only when tx is ongoing. Indicates the direction of the com line.
    output wire endOfTx,           //one cycle pulse: 1 during last cycle of last stop bit of tx
    
	 input wire serialIn,				//signals to merged into a inout signal according to "isTx"
	 output wire serialOut,
	 output wire comClk,
	 
    input wire [DIVIDER_WIDTH-1:0] clkPerCycle,
	 input wire [7:0] txData,
	 input wire [CLOCK_PER_BIT_WIDTH-1:0] clocksPerBit,			
	 input wire stopBit2,//0: 1 stop bit, 1: 2 stop bits
	 input wire oddParity, //if 1, parity bit is such that data+parity have an odd number of 1
    input wire msbFirst,  //if 1, bits order is: startBit, b7, b6, b5...b0, parity
	 input wire startTx,
	 input wire ackFlags,
	 input wire clk,
    input wire nReset
    );

wire rxSerialIn = isTx ? STOP_BIT1 : serialIn;
wire loadDataIn;
wire txStopBits;
assign isTx = txRun & ~txStopBits;
assign loadDataIn = startTx & ~rxStartBit & (~rxRun | endOfRx);

reg [CLOCK_PER_BIT_WIDTH-1:0] safeClocksPerBit;
reg safeStopBit2;
reg safeOddParity;
reg safeMsbFirst;
always @(posedge clk, negedge nReset) begin
	if(~nReset) begin
		/*safeClocksPerBit<=clocksPerBit;
		safeStopBit2<=stopBit2;
		safeOddParity<=oddParity;
		safeMsbFirst<=msbFirst;*/
		safeClocksPerBit<={CLOCK_PER_BIT_WIDTH{1'b0}};
		safeStopBit2<=1'b0;
		safeOddParity<=1'b0;
		safeMsbFirst<=1'b0;
	end else if(endOfRx|endOfTx|~(rxRun|rxStartBit|txRun)) begin
		safeClocksPerBit<=clocksPerBit;
		safeStopBit2<=stopBit2;
		safeOddParity<=oddParity;
		safeMsbFirst<=msbFirst;
	end
end

wire stopBit;
// Instantiate the module
RxCoreSelfContained #(
		.DIVIDER_WIDTH(DIVIDER_WIDTH),
		.CLOCK_PER_BIT_WIDTH(CLOCK_PER_BIT_WIDTH)
		)
	rxCore (
    .dataOut(rxData), 
    .overrunErrorFlag(overrunErrorFlag), 
    .dataOutReadyFlag(dataOutReadyFlag), 
    .frameErrorFlag(frameErrorFlag), 
    .endOfRx(endOfRx),
    .run(rxRun), 
    .startBit(rxStartBit), 
	 .stopBit(stopBit),
    .clkPerCycle(clkPerCycle),
    .clocksPerBit(safeClocksPerBit), 
    .stopBit2(safeStopBit2), 
    .oddParity(safeOddParity),
    .msbFirst(safeMsbFirst),
	 .ackFlags(ackFlags), 
    .serialIn(rxSerialIn), 
    .comClk(comClk), 
    .clk(clk), 
    .nReset(nReset)
    );
TxCore #(.DIVIDER_WIDTH(DIVIDER_WIDTH),
			.CLOCK_PER_BIT_WIDTH(CLOCK_PER_BIT_WIDTH)
		)
	txCore (
	.serialOut(serialOut), 
	.run(txRun),
	.endOfTx(endOfTx),
	.full(txFull), 
   .stopBits(txStopBits),
	.dataIn(txData), 
	.clkPerCycle(clkPerCycle),
	.clocksPerBit(safeClocksPerBit),
	.stopBit2(safeStopBit2),
   .oddParity(safeOddParity),
   .msbFirst(safeMsbFirst),
	.loadDataIn(loadDataIn), 
	.comClk(comClk), 
   .clk(clk), 
   .nReset(nReset)
);

endmodule
`default_nettype wire
