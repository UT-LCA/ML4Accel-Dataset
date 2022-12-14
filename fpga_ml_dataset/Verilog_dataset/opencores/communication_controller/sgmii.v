/*
	Copyright ï¿½ 2012 JeffLieu-lieumychuong@gmail.com
	
	This file is part of SGMII-IP-Core.
    SGMII-IP-Core is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    SGMII-IP-Core is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SGMII-IP-Core.  If not, see <http://www.gnu.org/licenses/>.

File		:
Description	:	
Remarks		:	No Support for Next Page
Revision	:
	Date	Author		Description
02/09/12	Jefflieu
*/

`include "SGMIIDefs.v"

`timescale 1ns/100ps


`define c10ms		(10_000_000/`cSystemClkPeriod)
`define c1p6ms		(00_001_000/`cSystemClkPeriod)




module mANCtrl(
	input 	i_Clk,
	input 	i_ARst_L,
	input	i_Cke,
	input	i_RestartAN,
	input	i_SyncStatus,
	input	i_ANEnable,
	
	input	[20:00] i21_LinkTimer,
	output	[15:00] o16_LpAdvAbility,
	input	[16:01] i16_LcAdvAbility,
	
	input	[15:00] i16_RxConfigReg,
	input	i_RUDIConfig,
	input	i_RUDIIdle,
	input	i_RUDIInvalid,
	output	o_ANComplete,
	output	reg [02:00]	o3_Xmit,
	output	reg [15:00]	o16_TxConfigReg);
	
	
	localparam 	stAN_ENABLE 	= 8'h01,
				stAN_RESTART 	= 8'h02,
				stABILITY_DTECT	= 8'h04,
				stACK_DTECT		= 8'h08,
				stCMPLT_ACK		= 8'h10,
				stIDLE_DTECT	= 8'h20,
				stLINK_OK		= 8'h40,
				stAN_DIS_LINKOK	= 8'h80;
	

	
	reg	[20:00]	r21_LinkTimer;
	reg	[02:00]	r2_RxCfgRegMchCntr;
	wire	w_AbiMatch;
	reg		r_ConsistencyMatch;
	wire	w_AckMatch;
	reg [07:00] r8_State;
	reg r_ANEable;
	wire	w_LinkTimerDone;
	reg [16:01] r16_LpAdvAbility;	//Link partner Advertised Ability, updated every time RUDIConfig is valid
	reg	r_NxtPage;
	reg r_NxtPageLoaded;
	reg r_ToggleTx;
	reg r_ToggleRx;
	reg [01:00] r2_AbilityMatchCnt;
	reg [01:00] r2_ConsistMatchCnt;
	reg [01:00] r2_AcknowlMatchCnt;
	reg [15:00] r16_AbilityReg;		//Captured of Partner Ability before going to Acknowledge Detect
	reg [01:00] r2_IdleMatchCnt;
	wire w_IdleMatch;
	
	assign w_LinkTimerDone = (r21_LinkTimer==i21_LinkTimer)?1'b1:1'b0;
	assign w_AbiMatch = (r2_AbilityMatchCnt==2'b11)?1'b1:1'b0;	
	assign w_AckMatch = (r2_AcknowlMatchCnt==2'b11)?1'b1:1'b0;
	assign w_IdleMatch = (r2_IdleMatchCnt==2'b11)?1'b1:1'b0;
	assign o16_LpAdvAbility = r16_LpAdvAbility;
	assign o_ANComplete = (r8_State==stLINK_OK)?1'b1:1'b0;
	always@(posedge i_Clk or negedge i_ARst_L)
	if(i_ARst_L==1'b0) begin
		r8_State <= stAN_ENABLE;
	end else begin
		r_ANEable <= i_ANEnable;
		if((~i_Cke) || i_RestartAN || (~i_SyncStatus) || i_RUDIInvalid || (r_ANEable^i_ANEnable))
			r8_State <= stAN_ENABLE;
		else
			case(r8_State)
			stAN_ENABLE		:	if(i_ANEnable) r8_State <= stAN_RESTART; else r8_State <= stAN_DIS_LINKOK;
			stAN_RESTART	:	if(w_LinkTimerDone) r8_State <= stABILITY_DTECT;
			stABILITY_DTECT	:	if(w_AbiMatch && r16_LpAdvAbility!=16'h0000) r8_State <= stACK_DTECT;
			stACK_DTECT		:	if((w_AckMatch && (~r_ConsistencyMatch))||(w_AbiMatch && i16_RxConfigReg==16'h0000 && i_RUDIConfig))
									r8_State <= stAN_ENABLE;
								else if(w_AckMatch && r_ConsistencyMatch)
									r8_State <= stCMPLT_ACK;
			stCMPLT_ACK		:	if(w_AbiMatch && r16_LpAdvAbility==16'h0000) r8_State <= stAN_ENABLE; 
								else if(w_LinkTimerDone && (~w_AbiMatch||(r16_LpAdvAbility!=16'h0000)))
												r8_State <= stIDLE_DTECT;								
			stIDLE_DTECT	:	if(w_IdleMatch && w_LinkTimerDone) r8_State <= stLINK_OK; else		
									if(w_AbiMatch && r16_LpAdvAbility==16'h0000) r8_State <= stAN_ENABLE;
						
			stLINK_OK		:	if(w_AbiMatch) r8_State <= stAN_ENABLE;
			stAN_DIS_LINKOK	:	r8_State <= stAN_DIS_LINKOK;	
			endcase			
	end

	always@(posedge i_Clk or negedge i_ARst_L)
	if(!i_ARst_L) begin
		r16_LpAdvAbility	<= 16'h0000;
		o3_Xmit				<= `cXmitIDLE;
		r21_LinkTimer 		<= 21'h0;
		o16_TxConfigReg 	<= 16'h0;	
		r2_IdleMatchCnt		<= 2'b00;		
		r16_AbilityReg 		<= 16'h0;
	end else begin
		//Xmit 
		case(r8_State)
		stAN_ENABLE : if(i_ANEnable) o3_Xmit <= `cXmitCONFIG; else o3_Xmit <= `cXmitIDLE;
		stIDLE_DTECT: o3_Xmit <= `cXmitIDLE;
		stLINK_OK	: o3_Xmit <= `cXmitDATA;
		stAN_DIS_LINKOK: o3_Xmit <= `cXmitDATA;
		endcase
		
		case(r8_State)
		stAN_ENABLE: r21_LinkTimer <= 21'h0;
		stAN_RESTART: if(w_LinkTimerDone==1'b0) r21_LinkTimer <= r21_LinkTimer+21'h1;
		stACK_DTECT : r21_LinkTimer <= 21'h0;
		stCMPLT_ACK	: if(w_LinkTimerDone && (~w_AbiMatch||(r16_LpAdvAbility!=16'h0000))) r21_LinkTimer <= 21'h0; else		
						if(w_LinkTimerDone==1'b0) r21_LinkTimer <= r21_LinkTimer+21'h1;
		stIDLE_DTECT: if(w_LinkTimerDone==1'b0) r21_LinkTimer <= r21_LinkTimer+21'h1;
		stLINK_OK	: r21_LinkTimer <= 21'h0;
		endcase
		
							
		case(r8_State)
		stAN_ENABLE: if(i_ANEnable) o16_TxConfigReg <= 16'h0000;
		stAN_RESTART: if(w_LinkTimerDone) begin
						o16_TxConfigReg[15] <= i16_LcAdvAbility[16];
						o16_TxConfigReg[14] <= 1'b0;
						o16_TxConfigReg[13:0] <= i16_LcAdvAbility[14:1];						
						end
		stACK_DTECT : o16_TxConfigReg[14] <= 1'b1;
		endcase
		
		
		if(r8_State==stABILITY_DTECT) r_ToggleTx <= i16_LcAdvAbility[12];
		else if(r8_State==stCMPLT_ACK) r_ToggleTx <= ~r_ToggleTx;
		
		if(r8_State==stCMPLT_ACK) r_ToggleRx<=i16_RxConfigReg[11];
		
		//Sync Reset
		if(r8_State==stAN_RESTART)
		begin
			r2_AbilityMatchCnt 	<= 2'b00;
			r16_AbilityReg		<= 16'h0;
			r16_LpAdvAbility 	<= 16'h0;
			r2_AcknowlMatchCnt	<= 2'b00;
			r_ConsistencyMatch	<= 1'b0;
			r2_IdleMatchCnt		<= 2'b00;
		end else
		begin		
			//w_AbiMatch		
			if(i_RUDIIdle)
				r2_AbilityMatchCnt <= 2'b00;
			else if(i_RUDIConfig) begin
				if(i16_RxConfigReg[13:00] == r16_LpAdvAbility[14:01] && i16_RxConfigReg[15]==r16_LpAdvAbility[16]) 
					begin
					if(r2_AbilityMatchCnt!=2'b11) r2_AbilityMatchCnt<=r2_AbilityMatchCnt+1;				
					end
				else 
					r2_AbilityMatchCnt <= 2'b01;
			end
			
			if(r8_State==stABILITY_DTECT && w_AbiMatch && r16_LpAdvAbility!=16'h00) r16_AbilityReg <= r16_LpAdvAbility;
				
			//Ack Match
			if(i_RUDIIdle)
				r2_AcknowlMatchCnt <= 2'b00;
			else if(i_RUDIConfig) begin
				if(i16_RxConfigReg[15:00] == r16_LpAdvAbility[16:01] && (i16_RxConfigReg[14]==1'b1)) 
					begin
					if(r2_AcknowlMatchCnt!=2'b11) r2_AcknowlMatchCnt<=r2_AcknowlMatchCnt+1;
					//Consistency Match
					//When the flag acknowledge match is about to be set
					//If the bits are same as r16_LpAdvAbility , consistent
					//Else Not consistent;
					//Consistency match is set at the same time as Acknowledge match
					if(r2_AcknowlMatchCnt==2'b10 && (i16_RxConfigReg[13:00] == r16_AbilityReg[13:00] && i16_RxConfigReg[15]==r16_AbilityReg[15]))
						r_ConsistencyMatch <= 1'b1; else r_ConsistencyMatch<=1'b0;
					end
				else 
					r2_AcknowlMatchCnt <= 2'b01;
			end
					
			
			if(i_RUDIConfig)
				r16_LpAdvAbility <= i16_RxConfigReg;			
		
			if(i_RUDIIdle) r2_IdleMatchCnt <= r2_IdleMatchCnt+2'b01;
				else if(i_RUDIConfig|i_RUDIInvalid) r2_IdleMatchCnt<=2'b00;
		
		end
	end
	
	//synopsys synthesis_off
	reg [239:0] r240_ANStateName;
	always@(*)
	case(r8_State)
	stAN_ENABLE 	:r240_ANStateName<="stAN_ENABLE 	";
	stAN_RESTART 	:r240_ANStateName<="stAN_RESTART 	";
	stABILITY_DTECT	:r240_ANStateName<="stABILITY_DTECT	";
	stACK_DTECT		:r240_ANStateName<="stACK_DTECT		";
	stCMPLT_ACK		:r240_ANStateName<="stCMPLT_ACK		";
	stIDLE_DTECT	:r240_ANStateName<="stIDLE_DTECT	";
	stLINK_OK		:r240_ANStateName<="stLINK_OK		";
	stAN_DIS_LINKOK	:r240_ANStateName<="stAN_DIS_LINKOK	";
	endcase
	//synopsys synthesis_on
	
endmodule
/*
Developed By Subtleware Corporation Pte Ltd 2011
File		:
Description	:	
Remarks		:
Revision	:
	Date	Author		Description
02/09/12	Jefflieu
*/

module mClkBuf(input i_Clk,output o_Clk);

	
	assign o_Clk = i_Clk;
endmodule
/*
	Copyright © 2012 JeffLieu-lieumychuong@gmail.com
	
	This file is part of SGMII-IP-Core.
    SGMII-IP-Core is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    SGMII-IP-Core is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SGMII-IP-Core.  If not, see <http://www.gnu.org/licenses/>.

File		:
Description	:	
Remarks		:
Revision	:
	Date	Author		Description
02/09/12	Jefflieu
*/
module mRateAdapter(
	//MAC Side signal
	input	i_TxClk,	
	input	i_TxEN,
	input	i_TxER,	
	input	[07:00] i8_TxD,
	
	input	i_RxClk,
	output	o_RxEN,
	output	o_RxER,
	output	[07:00] o8_RxD,
	
	input 	[1:0] i2_Speed,
	
	//SGMII PHY side
	input 	i_SamplingClk,
	input	i_GClk,
	output	o_TxEN,
	output	o_TxER,
	output	[07:00]	o8_TxD,

	input	i_RxEN,
	input	i_RxER,
	input	[07:00]	i8_RxD
);

	wire w_TxActive;
	reg r_TxActive;
	reg r_GTxEN;
	reg r_GTxER;
	reg [07:00] r8_GByte;
	reg [07:00] r8_Byte;
	reg [03:00] r4_LowNib;
	reg r_HighNib;	
	reg r_TxEN_D;
	reg r_TxER_D;
	reg r_Active;
	wire w_TxSop;
	wire w_TxEop;
	
	assign w_TxActive = i_TxEN | i_TxER;
	assign w_TxSop = (~r_TxActive & w_TxActive);
	assign w_TxEop = (r_TxActive & ~w_TxActive);
	
	always@(posedge i_TxClk)
	begin
		r_TxActive <= w_TxActive;
		
		r_HighNib <= (w_TxSop)?1'b1:(~r_HighNib);
		
		if(w_TxActive) begin
			if(r_HighNib) r8_Byte <= {i8_TxD[3:0],r4_LowNib};
			if(r_HighNib && (~w_TxSop)) r_TxEN_D <= i_TxEN;
			if(r_HighNib && (~w_TxSop)) r_TxER_D <= i_TxER;
		end else if(r_HighNib)
			 begin
			 r_TxEN_D <= 1'b0;
			 r_TxER_D <= 1'b0; 
			 end		
		if((~r_HighNib)|| (w_TxSop))
			r4_LowNib <= i8_TxD[3:0];
			
	end
	
	always@(posedge i_GClk)
	begin
		if(i_SamplingClk==1'b1) begin
			r8_GByte <= r8_Byte;
			r_GTxEN <= r_TxEN_D;
			r_GTxER <= r_TxER_D;
		end
	end
	
	assign o8_TxD = (i2_Speed==2'b10)?i8_TxD:r8_GByte;
	assign o_TxEN = (i2_Speed==2'b10)?i_TxEN:r_GTxEN;
	assign o_TxER = (i2_Speed==2'b10)?i_TxER:r_GTxER;
	

	//Receive
	//Receive Counter
	wire w_RxActive;
	reg r_RxActive;
	reg [03:00] r4_Cntr;
	wire w_RxSop;
	wire w_RxEop;
	reg [05:00] r6_GByte;
	reg [05:00] r6_MByte;
	
	assign w_RxSop = (~r_RxActive & w_RxActive);
	
	assign w_RxActive = i_RxEN | i_RxER;
	
	always@(posedge i_GClk)
	begin
		r_RxActive <= w_RxActive;		
		if(w_RxSop) r4_Cntr<=4'h0; 
		else if(w_RxActive) r4_Cntr <= ((r4_Cntr==4'h9)?4'h0:(r4_Cntr+4'h1));		
		else r4_Cntr <= 4'h0;
		
		if(r4_Cntr==4'h0) r6_GByte <= {i_RxEN,i_RxER,i8_RxD[3:0]};		
		else if(r4_Cntr==4'h5) r6_GByte <= {i_RxEN,i_RxER,i8_RxD[7:4]};		
	end
	
	always@(posedge i_RxClk)
	begin
		r6_MByte <= r6_GByte;	
	end
	

	assign o8_RxD = (i2_Speed==2'b10)?i8_RxD:{r6_MByte[3:0],r6_MByte[3:0]};
	assign o_RxEN = (i2_Speed==2'b10)?i_RxEN:r6_MByte[5];
	assign o_RxER = (i2_Speed==2'b10)?i_RxER:r6_MByte[4];



endmodule
/*
Developed By Subtleware Corporation Pte Ltd 2011
File		:
Description	:	
Remarks		:
Revision	:
	Date	Author		Description
02/09/12	Jefflieu
*/
`include "SGMIIDefs.v"

module mReceive(

	input	[07:00]	i8_RxCodeGroupIn,
	input	i_RxCodeInvalid,
	input	i_RxCodeCtrl,
	input	i_RxEven,
	input	i_IsComma,
	input	[02:00] i3_Xmit,
	
	input	i_OrderedSetValid,
	input	i_IsI1Set,
	input	i_IsI2Set,
	input	i_IsC1Set,
	input	i_IsC2Set,
	input	i_IsTSet,
	input	i_IsVSet,
	input	i_IsSSet,
	input	i_IsRSet,
	
	input	i_CheckEndKDK,
	input	i_CheckEndKD21_5D0_0,
	input	i_CheckEndKD2_2D0_0,
	input	i_CheckEndTRK,
	input	i_CheckEndTRR,
	input	i_CheckEndRRR,
	input	i_CheckEndRRK,
	input	i_CheckEndRRS,
	
	
	output	reg	[15:00] o16_RxConfigReg,
	output	o_RUDIConfig,
	output	o_RUDIIdle,
	output	o_RUDIInvalid,
	
	output	reg o_RxDV,
	output	reg o_RxER,
	output	reg [07:00] o8_RxD,
	output	reg o_Invalid,
	output	reg o_Receiving,
	
	
	input	i_Clk,
	input	i_ARst_L
);

localparam 	stWAIT_FOR_K 	= 21'h000001,
			stRX_K 			= 21'h000002,
			stRX_CB			= 21'h000004,
			stRX_CC			= 21'h000008,
			stRX_CD			= 21'h000010,
			stRX_INVALID	= 21'h000020,
			stIDLE_D		= 21'h000040,
			stFALSE_CARRIER = 21'h000080,
			stSTART_OF_PKT	= 21'h000100,
			stEARLY_END		= 21'h000200,
			stTRI_RRI		= 21'h000400,
			stTRR_EXTEND	= 21'h000800,
			stPKT_BURST_RRS	= 21'h001000,
			stRX_DATA_ERR	= 21'h002000,
			stRX_DATA		= 21'h004000,
			stEARLY_END_EXT	= 21'h008000,
			stEXT_ERROR		= 21'h010000;
			
			
			
			
reg		[16:00]	r17_State;
reg		[16:00] r21_NxtState;

wire 	wSUDIK28_5;
wire	wSUDID21_5;
wire	wSUDID2_2;
wire	wCarrierDtect;//what is this
wire	wSUDI;

wire	w_IsC1Set;
wire	w_IsC2Set;
wire	w_IsI1Set;
wire	w_IsI2Set;
wire	w_IsRSet;
wire	w_IsSSet;
wire	w_IsTSet;
wire	w_IsVSet;

	//synthesis translate_off
	reg [8*30-1:0] rvStateName;
	always@(*)
	begin
		case(r17_State)
		stWAIT_FOR_K 	:	rvStateName <= "Wait For K";
		stRX_K 			:	rvStateName <= "RX K";
		stRX_CB			:	rvStateName <= "RX CB";
		stRX_CC			:	rvStateName <= "RX CC";
		stRX_CD			:	rvStateName <= "RX CD";
		stRX_INVALID	:	rvStateName <= "RX Invalid";
		stIDLE_D		:	rvStateName <= "IDLE D";
		//stCARRIER_DTEC	:	rvStateName <= "CARRIER DETECT";
		stFALSE_CARRIER :	rvStateName <= "FALSE CARRIER";
		stSTART_OF_PKT	:	rvStateName <= "Start of Packet";
		//stRECEIVE		:	rvStateName <= "Receiving";
		stEARLY_END		:	rvStateName <= "Early End";
		stTRI_RRI		:	rvStateName <= "TRI RRI";
		stTRR_EXTEND	:	rvStateName <= "TRR Extend";
		//stEPD2_CHK_END	:	rvStateName <= "EPD2 Check End";
		stPKT_BURST_RRS	:	rvStateName <= "PKT BURST RRS";
		stRX_DATA_ERR	:	rvStateName <= "RX DATA Error";
		stRX_DATA		:	rvStateName <= "RX DATA";
		stEARLY_END_EXT	:	rvStateName <= "Early End Ext";
		stEXT_ERROR		:	rvStateName <= "Ext Error";
		//stLINK_FAILED	:	rvStateName <= "Link Failed";
		endcase
		//$display("mReceive State: %s",rvStateName);
	end
	//synthesis translate_on
	

	assign w_IsSSet = i_OrderedSetValid && i_IsRSet;
	assign wSUDI	= ~i_RxCodeInvalid;
	assign wCarrierDtect = i_IsRSet|i_IsSSet|i_IsTSet|i_IsVSet;
	
	always@(posedge i_Clk or negedge i_ARst_L)
	if(i_ARst_L==1'b0) begin
		r17_State <= stWAIT_FOR_K;
	end else begin	
		r17_State <= r21_NxtState;
	end
	
	assign wSUDIK28_5 = (!i_RxCodeInvalid) && (i_RxCodeCtrl) && (i8_RxCodeGroupIn==`K28_5);
	assign wSUDID21_5 = (!i_RxCodeInvalid) && (!i_RxCodeCtrl) && (i8_RxCodeGroupIn==`D21_5);
	assign wSUDID2_2 = (!i_RxCodeInvalid) && (!i_RxCodeCtrl) && (i8_RxCodeGroupIn==`D2_2);
	always@(*)
	begin
		case(r17_State)
		stWAIT_FOR_K: if(i_IsComma && i_RxEven) r21_NxtState <= stRX_K; else r21_NxtState<=stWAIT_FOR_K;
		stRX_K		: if(wSUDID21_5||wSUDID2_2)
						r21_NxtState <= stRX_CB; else
						if((!i_RxCodeInvalid) && (i_RxCodeCtrl) && i3_Xmit!=`cXmitDATA)
						r21_NxtState <= stRX_INVALID; else
							if(((!i_RxCodeInvalid) && (!i_RxCodeCtrl) && i3_Xmit!=`cXmitDATA && i8_RxCodeGroupIn!=`D21_5 && i8_RxCodeGroupIn!=`D2_2)||
								((!i_RxCodeInvalid) && i3_Xmit==`cXmitDATA && ((i8_RxCodeGroupIn!=`D21_5 && i8_RxCodeGroupIn!=`D2_2 && (!i_RxCodeCtrl))||i_RxCodeCtrl)))
								r21_NxtState <= stIDLE_D; else
								r21_NxtState <= stRX_K;
		stRX_CB		: 	if((!i_RxCodeInvalid) && (!i_RxCodeCtrl)) r21_NxtState <= stRX_CC; else r21_NxtState <= stRX_INVALID;
		stRX_CC		: 	if((!i_RxCodeInvalid) && (!i_RxCodeCtrl)) r21_NxtState <= stRX_CD; else r21_NxtState <= stRX_INVALID;
		stRX_CD		: 	if((!i_RxCodeInvalid) && (i_RxCodeCtrl) && i8_RxCodeGroupIn==`K28_5 && i_RxEven) 
							r21_NxtState <= stRX_K;
							else 
							r21_NxtState <= stRX_INVALID;
		
		stRX_INVALID: 	if(wSUDIK28_5 && i_RxEven) 
							r21_NxtState <= stRX_K;
							else
							r21_NxtState <= stWAIT_FOR_K;
		
		stIDLE_D	:	if(!wSUDIK28_5 && (i3_Xmit!=`cXmitDATA))
							r21_NxtState <= stRX_INVALID;
						else if(!i_RxCodeInvalid && i3_Xmit==`cXmitDATA && i_IsSSet)
							r21_NxtState <= stSTART_OF_PKT;
						else if((!i_RxCodeInvalid && i3_Xmit==`cXmitDATA && (~wCarrierDtect)) || (wSUDIK28_5 && i_RxEven))
							r21_NxtState <= stRX_K;
						else
							r21_NxtState <= stFALSE_CARRIER;
						
		/*stCARRIER_DTEC: if(i_OrderedSetValid && i_IsSSet)
							r21_NxtState <= stSTART_OF_PKT;
						else
							r21_NxtState <= stFALSE_CARRIER;*/
		stFALSE_CARRIER : if(wSUDIK28_5 && i_RxEven) r21_NxtState <= stRX_K; else r21_NxtState <= stFALSE_CARRIER;
		
		stSTART_OF_PKT	: if(wSUDI)	
							begin 
								if(~i_RxCodeCtrl) r21_NxtState <= stRX_DATA; else
								if((i_CheckEndKDK||i_CheckEndKD21_5D0_0||i_CheckEndKD2_2D0_0) &&i_RxEven)
									r21_NxtState <= stEARLY_END; else
								if(i_CheckEndTRK && i_RxEven) r21_NxtState <= stTRI_RRI; else
								if(i_CheckEndTRR) r21_NxtState <= stTRR_EXTEND; else
								if(i_CheckEndRRR) r21_NxtState <= stEARLY_END_EXT; else																
								r21_NxtState <= stRX_DATA_ERR;					
							end
						  else r21_NxtState <= stRX_DATA_ERR;						  
		//stRECEIVE		: //zero cycle state
		stRX_DATA		: if(wSUDI)	
							begin 
								if(~i_RxCodeCtrl) r21_NxtState <= stRX_DATA; else
								if((i_CheckEndKDK||i_CheckEndKD21_5D0_0||i_CheckEndKD2_2D0_0) &&i_RxEven)
									r21_NxtState <= stEARLY_END; else
								if(i_CheckEndTRK && i_RxEven) r21_NxtState <= stTRI_RRI; else
								if(i_CheckEndTRR) r21_NxtState <= stTRR_EXTEND; else
								if(i_CheckEndRRR) r21_NxtState <= stEARLY_END_EXT; else																
								r21_NxtState <= stRX_DATA_ERR;					
							end
						  else r21_NxtState <= stRX_DATA_ERR;
		stRX_DATA_ERR	: if(wSUDI)	
							begin 
								if(~i_RxCodeCtrl) r21_NxtState <= stRX_DATA; else
								if((i_CheckEndKDK||i_CheckEndKD21_5D0_0||i_CheckEndKD2_2D0_0) &&i_RxEven)
									r21_NxtState <= stEARLY_END; else
								if(i_CheckEndTRK && i_RxEven) r21_NxtState <= stTRI_RRI; else
								if(i_CheckEndTRR) r21_NxtState <= stTRR_EXTEND; else
								if(i_CheckEndRRR) r21_NxtState <= stEARLY_END_EXT; else							
								r21_NxtState <= stRX_DATA_ERR;					
							end
						  else r21_NxtState <= stRX_DATA_ERR;
		stEARLY_END		: if(wSUDID21_5||wSUDID2_2) r21_NxtState <= stRX_CB; else r21_NxtState <= stIDLE_D;
		stTRI_RRI		: if(wSUDIK28_5) r21_NxtState <= stRX_K; else r21_NxtState <= stTRI_RRI;
		stTRR_EXTEND	: if(i_CheckEndRRR) r21_NxtState <= stTRR_EXTEND; else
							if(i_CheckEndRRK && i_RxEven) r21_NxtState <= stTRI_RRI; else
							 if(i_CheckEndRRS) r21_NxtState <= stPKT_BURST_RRS; else
							  if(i_IsVSet) r21_NxtState <= stEXT_ERROR; else
								r21_NxtState <= stTRR_EXTEND;
		stEARLY_END_EXT	: if(i_CheckEndRRR) r21_NxtState <= stTRR_EXTEND; else
							if(i_CheckEndRRK && i_RxEven) r21_NxtState <= stTRI_RRI; else
							 if(i_CheckEndRRS) r21_NxtState <= stPKT_BURST_RRS; else
							  if(i_IsVSet) r21_NxtState <= stEXT_ERROR; else
								r21_NxtState <= stEARLY_END_EXT;
		//This is zero cycle state
		//stEPD2_CHK_END	: if(i_CheckEndRRR) r21_NxtState <= stTRR_EXTEND; else
		//					if(i_CheckEndRRK && i_RxEven) r21_NxtState <= stTRI_RRI; else
		//					 if(i_CheckEndRRS) r21_NxtState <= stPKT_BURST_RRS; else
		//					  r21_NxtState <= stEXT_ERROR; 
		stPKT_BURST_RRS	: if(i_IsSSet && i_OrderedSetValid && wSUDI) r21_NxtState <= stSTART_OF_PKT; else r21_NxtState <= stPKT_BURST_RRS;
		stEXT_ERROR		: if(i_IsSSet && i_OrderedSetValid && wSUDI) r21_NxtState <= stSTART_OF_PKT; else 
							if(wSUDIK28_5 && i_RxEven) r21_NxtState <= stRX_K; else 
								if(i_CheckEndRRR) r21_NxtState <= stTRR_EXTEND; else
								if(i_CheckEndRRK && i_RxEven) r21_NxtState <= stTRI_RRI; else
								if(i_CheckEndRRS) r21_NxtState <= stPKT_BURST_RRS; else
								r21_NxtState <= stEXT_ERROR;
		endcase
	end

	assign o_RUDIConfig = (r17_State==stRX_CD		)?1'b1:1'b0;
	assign o_RUDIIdle 	= (r17_State==stIDLE_D		)?1'b1:1'b0;
	assign o_RUDIInvalid= (r17_State==stRX_INVALID && i3_Xmit==`cXmitCONFIG)?1'b1:1'b0;

	always@(posedge i_Clk or negedge i_ARst_L)
	if(i_ARst_L==1'b0) begin
		o_Receiving <= 1'b0;
		o_RxDV		<= 1'b0;
		o_RxER		<= 1'b0;	
		o8_RxD		<= 8'h0;
		o16_RxConfigReg <= 16'h00;
	end else begin
	
		case(r21_NxtState)
		//stWAIT_FOR_K 	:	
		stRX_K 			:	begin
							o_Receiving <= 1'b0;
							o_RxDV		<= 1'b0;
							o_RxER		<= 1'b0;							
							end			
		//stRX_CB			:  
		stRX_CC			:   o16_RxConfigReg[07:00] <= i8_RxCodeGroupIn;
		stRX_CD			:  	o16_RxConfigReg[15:08] <= i8_RxCodeGroupIn;
		stRX_INVALID	: 	if(i3_Xmit==`cXmitDATA) o_Receiving <= 1'b1;
		stIDLE_D		:	begin
							o_Receiving <= 1'b0;
							o_RxDV		<= 1'b0;
							o_RxER		<= 1'b0;							
							end					
		
		//stCARRIER_DTEC:	o_Receiving <= 1'b1;
		stFALSE_CARRIER :	begin
							o_RxER 		<= 1'b1;
							o8_RxD		<= 8'h0E;
							end
		stSTART_OF_PKT	:	begin
							o_Receiving <= 1'b1;
							o_RxDV		<= 1'b1;
							o_RxER		<= 1'b0;
							o8_RxD		<= 8'h55;							
							end						
		//stRECEIVE		:	
		stEARLY_END		:	o_RxER <= 1'b1;
		stTRI_RRI		:	begin
							o_Receiving <= 1'b0;
							o_RxER		<= 1'b0;
							o_RxDV		<= 1'b0;
							end
		stTRR_EXTEND	:	begin							
							o_RxER		<= 1'b1;
							o_RxDV		<= 1'b0;
							o8_RxD		<= 8'h0F;
							end		
		//stEPD2_CHK_END	:	
		stPKT_BURST_RRS	:	begin
							o_RxDV		<= 1'b0;
							o8_RxD		<= 8'b0000_1111;							
							end							
		stRX_DATA_ERR	:	o_RxER 		<= 1'b1;
		stRX_DATA		:	begin								
							o_RxER		<= 1'b0;
							o8_RxD		<= i8_RxCodeGroupIn;
							end
		stEARLY_END_EXT	:	o_RxER		<= 1'b1;
		stEXT_ERROR		:	begin
							o_RxDV		<= 1'b0;
							o8_RxD		<= 8'b0001_1111;							
							end
		// stLINK_FAILED	:	begin
							// if(o_Receiving==1'b1) 
								// begin 
								// o_Receiving <= 1'b0;
								// o_RxER <= 1'b1; 
								// end else
								// begin
								// o_RxDV <= 1'b0;
								// o_RxER <= 1'b0;
								// end
							// if(i3_Xmit!=`cXmitDATA) 	o_Invalid <= 1'b1;
							// end
		endcase
	end
	
endmodule
/*
Copyright © 2012 JeffLieu-lieumychuong@gmail.com

	This file is part of SGMII-IP-Core.
    SGMII-IP-Core is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    SGMII-IP-Core is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SGMII-IP-Core.  If not, see <http://www.gnu.org/licenses/>.
	
File		:
Description	:	
Remarks		:
Revision	:
	Date	Author		Description
02/09/12	Jefflieu
*/
`timescale 1ns/100ps
`include "SGMIIDefs.v"
module mRegisters(
	input w_ARstLogic_L,
	input i_Clk,
	input i_Cyc,
	input i_Stb,
	input i_WEn,
	input [07:00] i8_Addr,
	input [31:00] i32_WrData,
	output reg [31:00] o32_RdData,
	output reg o_Ack,
	output o_Stall,
	
	inout io_Mdio,
	input i_Mdc,
	
	//This is used in Phy-Side SGMII 
	input 	i_PhyLink,
	input	i_PhyDuplex,
	input 	[1:0] i2_PhySpeed,	
	
	//MAC-Side Speed,
	output	[01:00] o2_SGMIISpeed,
	//MAC-Side Duplex,
	output	o_SGMIIDuplex,
	
	
	//Register in and out,
	output  [20:00] o21_LinkTimer,
	
	input	[02:00] i3_XmitState,
	input	[15:00] i16_TxConfigReg,
	output o_MIIRst_L,
	output o_ANEnable,
	output o_ANRestart,
	output o_Loopback,
	output o_GXBPowerDown,
	output [15:00] o16_LcAdvAbility,
	input 	i_ANComplete,
	input	i_SyncStatus,		
	input [15:00] i16_LpAdvAbility);
	
	//TODO: Local BUs interface to setup registers
	//Register Write	
	wire	w_Write;
	reg 	r_Write;
	wire	w_WritePulse;
	wire	[04:00]	w5_Addr;
	wire	[15:00] w16_WrData;
	reg 	[15:00] r16_CtrlReg0;
	reg 	[15:00] r16_CtrlReg4;
	wire	[15:00]	w16_StatusReg1;
	reg		[15:00] r16_ModeReg;
	wire	[15:00] w16_LcAdvAbility;
	wire 	w_UseAsSGMII;
	reg 	r_Read;
	wire	w_Read;
	wire	w_ReadPulse;
	wire	w_SGMII_PHY;
	reg [20:00] r21_LinkTimer;
	reg [15:00] r16_ScratchRev;
	wire w_UseLcConfig;
	
	assign o21_LinkTimer = r21_LinkTimer;
	assign w5_Addr = i8_Addr[6:2];
	assign w16_WrData = i32_WrData[15:00];
	assign w_Write = (i_Cyc & i_Stb & i_WEn);
	assign w_WritePulse = w_Write & (~r_Write);	
	assign w_Read = (i_Cyc & i_Stb & (~i_WEn));
	assign w_ReadPulse = w_Read & (~r_Read);
	assign o_Stall = (w_Write|w_Read)&(~o_Ack);
	always@(posedge i_Clk or negedge w_ARstLogic_L)
	if(w_ARstLogic_L==1'b0)
		begin
			r16_CtrlReg4 <= `cReg4Default;
			r16_CtrlReg0 <= `cReg0Default;			
			r16_ModeReg  <= `cRegXDefault;
			r21_LinkTimer <= `cRegLinkTimerDefault;
			r16_ScratchRev <= 16'h1_0_00;
		end 
	else
	begin
		//Write Controller
		r_Write <= w_Write;
		o_Ack  <= w_WritePulse|w_ReadPulse;		
		//Control Register 0
		if(w_WritePulse && w5_Addr==5'b00000) r16_CtrlReg0 <= w16_WrData;		
		else begin
			if(i3_XmitState==`cXmitCONFIG) r16_CtrlReg0[9] <= 1'b0;
			r16_CtrlReg0[15] <= 1'b0;
		end
			
		
		if(w_WritePulse && w5_Addr==5'b00100) r16_CtrlReg4 <= w16_WrData;		
		
		if(w_WritePulse && w5_Addr==5'b01000) r21_LinkTimer[15:00] <= w16_WrData;
		if(w_WritePulse && w5_Addr==5'b01001) r21_LinkTimer[20:16] <= w16_WrData[4:0];
		if(w_WritePulse && w5_Addr==5'b01010) r16_ScratchRev 	<= w16_WrData;
		if(w_WritePulse && w5_Addr==5'b11111) r16_ModeReg  		<= w16_WrData;
		
		//Read Controller
		r_Read <= w_Read;	
		
		if(w_ReadPulse) 
			case(w5_Addr)
			5'h00:		o32_RdData <= {16'h0,r16_CtrlReg0};
			5'h01: 		o32_RdData <= {16'h0,w16_StatusReg1};
			5'h02: 		o32_RdData <= 32'h0;
			5'h03: 		o32_RdData <= 32'h0;
			5'h04: 		o32_RdData <= {16'h0,w16_LcAdvAbility};
			5'h05: 		o32_RdData <= {16'h0,i16_LpAdvAbility};
			5'h08:		o32_RdData <= {16'h0,r21_LinkTimer[15:00]};
			5'h09:		o32_RdData <= {16'h0,11'h0,r21_LinkTimer[20:16]};
			5'h0A:		o32_RdData <= r16_ScratchRev;
			5'h1F:		o32_RdData <= r16_ModeReg;
			default: 	o32_RdData <= 32'h0;
			endcase		
	end
	assign o_ANRestart 		= r16_CtrlReg0[9];
	assign o_MIIRst_L		= ~r16_CtrlReg0[15];
	assign o_ANEnable 		= r16_CtrlReg0[12];	
	assign o_Loopback		= r16_CtrlReg0[14];
	assign o_GXBPowerDown 	= r16_CtrlReg0[11];
	assign o16_LcAdvAbility = w16_LcAdvAbility;
	
	assign w16_LcAdvAbility = (w_UseAsSGMII==1'b0)?({1'b0,i16_TxConfigReg[15],r16_CtrlReg4[13:12],3'b000,r16_CtrlReg4[8:7],2'b01,5'b00000})://1000-X mode
								((w_SGMII_PHY==1'b1)?({i_PhyLink,i16_TxConfigReg[15],1'b0,(i_PhyDuplex|r16_CtrlReg4[12]),(i2_PhySpeed|r16_CtrlReg4[11:10]),10'h1})://SGMII mode - PHY Side
								({1'b0,i16_TxConfigReg[15],1'b0,3'b000,10'h1}));//SGMII mode - MAC Side
	
	assign w16_StatusReg1 = {9'h0,i_ANComplete,2'b01,i_SyncStatus,2'b0};
	assign w_UseAsSGMII 	= r16_ModeReg[0];
	assign w_SGMII_PHY		= r16_ModeReg[1];
	assign w_UseLcConfig	= r16_ModeReg[2];
	assign o2_SGMIISpeed	= (w_UseAsSGMII==1'b0)?2'b10:((w_UseLcConfig==1'b0)?i16_LpAdvAbility[11:10]:{r16_CtrlReg0[6]|i2_PhySpeed[1],r16_CtrlReg0[13]|i2_PhySpeed[0]});
	assign o_SGMIIDuplex 	= (w_UseAsSGMII==1'b0)?1'b1:((w_UseLcConfig==1'b0)?i16_LpAdvAbility[12]:{r16_CtrlReg0[8]|i_PhyDuplex});

endmodule
/*
Copyright ï¿½ 2012 JeffLieu-jefflieu@fpga-ipcores.com

	This file is part of SGMII-IP-Core.
    SGMII-IP-Core is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    SGMII-IP-Core is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SGMII-IP-Core.  If not, see <http://www.gnu.org/licenses/>.

File		:
Description	:
	This core implements:
	B1000-X Standard
	PCS/PMA of SGMII MAC Side
Remarks		:
Revision	:
	Date	Author		Description
02/09/12	Jefflieu
*/

`timescale 1ns/10ps
`include "SGMIIDefs.v"

module mSGMII 
(
	//Tranceiver Interface
	input	i_SerRx,
	output	o_SerTx,
	input	i_CalClk,
	input	i_RefClk125M,
	input	i_ARstHardware_L,

	//Local BUS interface
	//Wishbonebus, single transaction mode (non-pipeline slave)
	input	i_Cyc,
	input	i_Stb,
	input	i_WEn,
	input	[31:00] 	i32_WrData,
	input	[07:00]		iv_Addr,
	output	[31:00]		o32_RdData,
	output	o_Ack,
	
	input	i_Mdc,
	inout	io_Mdio,
	
	output	o_Linkup,
	output	o_ANDone,
	//This is used in Phy-Side SGMII 
	input 	i_PhyLink,
	input	i_PhyDuplex,
	input 	[1:0] i2_PhySpeed,	
	
	
	output	[1:0] o2_SGMIISpeed,
	output	o_SGMIIDuplex,
	
	//GMII Interface
	output 	o_TxClk,
	output 	o_RxClk,
	input	[07:00] i8_TxD,
	input	i_TxEN,
	input	i_TxER,
	output	[07:00] o8_RxD,
	output	o_RxDV,
	output	o_RxER,
	output	o_GMIIClk,
	output	o_MIIClk,
	output	o_Col,
	output	o_Crs);
	
	wire 	w_ClkTx,w_ClkRx;	
	wire 	w_ClkSys;
	wire	w_Loopback;
	reg		r_RestartAN;
	wire	w_ANEnable;
	wire	[15:00] w16_Status;
	wire 	w_MIIRst_L;
	wire	w_ANComplete;
	
	wire 	[07:00] w8_RxCG_SyncToRxver;
	wire	w_RxCGInv_SyncToRxver;
	wire	w_RxCGCtrl_SyncToRxver;
	wire	w_SyncStatus,w_RxEven,w_IsComma,w_OSValid;
	wire	w_IsI1Set,w_IsI2Set,w_IsC1Set,w_IsC2Set,w_IsTSet,w_IsVSet,w_IsSSet,w_IsRSet;
	
	wire	w_Receiving;
	wire	w_Transmitting;
	wire	w_CheckEndKDK,w_CheckEndKD21_5D0_0,w_CheckEndKD2_2D0_0,w_CheckEndTRK,w_CheckEndTRR,w_CheckEndRRR,w_CheckEndRRK,w_CheckEndRRS;
	reg		r_CheckEndKDK,r_CheckEndKD21_5D0_0,r_CheckEndKD2_2D0_0,r_CheckEndTRK,r_CheckEndTRR,r_CheckEndRRR,r_CheckEndRRK,r_CheckEndRRS;
	
	wire	[2:0] w3_XmitState;
	wire	[16:01] w16_TxConfigReg;
	wire 	[15:00] w16_RxConfigReg;
	wire	[15:00] w16_LcAdvAbility;
	wire	[15:00] w16_LpAdvAbility;
	wire	w_RUDIConfig;
	wire	w_RUDIIdle;
	wire	w_RUDIInvalid;
	wire	w_ARstLogic_L;
	wire 	w_MIIReset_L;
	wire	w_ANRestart;
	//This delay stage is for the function checkend
	reg	[07:00]	r8_RxCodeGroup[0:2];
	reg 	r_RxCgInvalid[0:2];
	reg 	r_RxCgCtrl[0:2];
	wire  	[2:0] w3_PreCheckIsSSet;
	wire  	[2:0] w3_PreCheckIsTSet;
	wire  	[2:0] w3_PreCheckIsRSet;
	wire	[2:0] w3_PreCheckIsComma;
	wire 	[2:0] w3_PreCheckIsD21_5;
	wire	[2:0] w3_PreCheckIsD2_2;
	wire	[2:0] w3_PreCheckIsD;
	wire	[2:0] w3_PreCheckIsD0_0;
	wire 	w_GxBPowerDown;
	wire	w_TxCodeCtrl, w_TxCodeValid, w_RxCodeInvalid, w_RxCodeCtrl;
	wire 	[07:00] w8_TxCode, w8_RxCode;
	wire	w_SignalDetect;
	wire	w_TxForceNegDisp;
	wire	w_PllLocked;
	wire	[20:00] w21_LinkTimer;
	wire 	w_TxEN,w_TxER,w_RxER, w_RxDV;
	wire	[07:00] w8_RxD, w8_TxD;
	wire 	w_BitSlip;
	wire 	w_Invalid;//Not Used
	wire 	w_TxEven;//Not Used
	wire 	w_CurrentParity;
	
	//MII Clock Gen
	reg [6:0] 	r7_Cntr;
	reg r_MIIClk;
	reg r_MIIClk_D;
	wire w_SamplingClk;
	
	integer DELAY;
	
	assign o_Linkup = w_SyncStatus;
	assign o_ANDone = w_ANComplete;
	assign o_TxClk = w_ClkTx;
	assign o_RxClk = w_ClkRx;
	
	mRateAdapter	u0RateAdapter(
	//MAC Side signal
	.i_TxClk		(o_MIIClk),	
	.i_TxEN			(i_TxEN	),
	.i_TxER			(i_TxER	),	
	.i8_TxD			(i8_TxD	),			
	.i_RxClk		(o_MIIClk),
	.o_RxEN			(o_RxDV),
	.o_RxER			(o_RxER),
	.o8_RxD			(o8_RxD),
	.i2_Speed		(o2_SGMIISpeed),
	//SGMII PHY side
	.i_SamplingClk	(w_SamplingClk),
	.i_GClk			(w_ClkSys),
	.o_TxEN			(w_TxEN),
	.o_TxER			(w_TxER),
	.o8_TxD			(w8_TxD),
	.i_RxEN			(w_RxDV),
	.i_RxER			(w_RxER),
	.i8_RxD			(w8_RxD));
	
	generate
		genvar STAGE;
		for(STAGE=0;STAGE<3;STAGE=STAGE+1)
		begin:PreCheck
			assign w3_PreCheckIsComma[STAGE] 	= (r_RxCgInvalid[STAGE]==1'b0 && r_RxCgCtrl[STAGE]==1'b1 && r8_RxCodeGroup[STAGE]==`K28_5)?1'b1:1'b0;			
			assign w3_PreCheckIsTSet[STAGE] 	= (r_RxCgInvalid[STAGE]==1'b0 && r_RxCgCtrl[STAGE]==1'b1 && r8_RxCodeGroup[STAGE]==`K29_7)?1'b1:1'b0;
			assign w3_PreCheckIsRSet[STAGE] 	= (r_RxCgInvalid[STAGE]==1'b0 && r_RxCgCtrl[STAGE]==1'b1 && r8_RxCodeGroup[STAGE]==`K23_7)?1'b1:1'b0;
			assign w3_PreCheckIsD21_5[STAGE] 	= (r_RxCgInvalid[STAGE]==1'b0 && r_RxCgCtrl[STAGE]==1'b0 && r8_RxCodeGroup[STAGE]==`D21_5)?1'b1:1'b0;
			assign w3_PreCheckIsD2_2[STAGE] 	= (r_RxCgInvalid[STAGE]==1'b0 && r_RxCgCtrl[STAGE]==1'b0 && r8_RxCodeGroup[STAGE]==`D2_2)?1'b1:1'b0;
			assign w3_PreCheckIsD[STAGE]		= (r_RxCgInvalid[STAGE]==1'b0 && r_RxCgCtrl[STAGE]==1'b0)?1'b1:1'b0;
			assign w3_PreCheckIsD0_0[STAGE] 	= (r_RxCgInvalid[STAGE]==1'b0 && r_RxCgCtrl[STAGE]==1'b0 && r8_RxCodeGroup[STAGE]==`D0_0)?1'b1:1'b0;
			assign w3_PreCheckIsSSet[STAGE]		= (r_RxCgInvalid[STAGE]==1'b0 && r_RxCgCtrl[STAGE]==1'b1 && r8_RxCodeGroup[STAGE]==`K27_7)?1'b1:1'b0;
		end
	endgenerate
	
	assign w_CheckEndKDK 		= w3_PreCheckIsComma[2] & w3_PreCheckIsD[1]&w3_PreCheckIsComma[0];
	assign w_CheckEndRRR 		= &(w3_PreCheckIsRSet);
	assign w_CheckEndTRK 		= w3_PreCheckIsTSet[2] & w3_PreCheckIsRSet[1] & w3_PreCheckIsComma[0];
	assign w_CheckEndTRR 		= w3_PreCheckIsTSet[2] & w3_PreCheckIsRSet[1] & w3_PreCheckIsRSet[0];
	assign w_CheckEndKD21_5D0_0	= w3_PreCheckIsComma[2] & w3_PreCheckIsD21_5[1] & w3_PreCheckIsD2_2[0];
	assign w_CheckEndKD2_2D0_0 	= w3_PreCheckIsComma[2] & w3_PreCheckIsD2_2[1] & w3_PreCheckIsD2_2[0];
	assign w_CheckEndRRK		= w3_PreCheckIsRSet[2] & w3_PreCheckIsRSet[1] & w3_PreCheckIsComma[0];
	assign w_CheckEndRRS		= w3_PreCheckIsRSet[2] & w3_PreCheckIsRSet[1] & w3_PreCheckIsSSet[0];
	
	always@(posedge w_ClkRx)
		begin
			r8_RxCodeGroup[0] 	<= w8_RxCode;
			r_RxCgCtrl[0] 		<= w_RxCodeCtrl;
			r_RxCgInvalid[0] 	<= w_RxCodeInvalid;
			for(DELAY=1;DELAY<3;DELAY=DELAY+1)
				begin
				r8_RxCodeGroup[DELAY] 	<= r8_RxCodeGroup[DELAY-1];
				r_RxCgInvalid[DELAY] 	<= r_RxCgInvalid[DELAY-1];
				r_RxCgCtrl[DELAY]		<= r_RxCgCtrl[DELAY-1];				
				end			
		end
		
	assign o_Col = w_Transmitting & w_Receiving;
	assign o_Crs = 1'b0;
	assign w_ARstLogic_L 	= w_PllLocked & i_ARstHardware_L & (w_MIIRst_L);
	mRegisters	u0Registers(
	.w_ARstLogic_L	(w_ARstLogic_L),
	.i_Clk			(w_ClkSys),
	.i_Cyc			(i_Cyc),
	.i_Stb			(i_Stb),
	.i_WEn			(i_WEn),
	.i8_Addr		(iv_Addr),
	.i32_WrData		(i32_WrData),
	.o32_RdData		(o32_RdData),
	.o_Ack			(o_Ack),
	.o_Stall		(),
	
	.io_Mdio		(io_Mdio),
	.i_Mdc			(i_Mdc),
	
	//Register in and out,
	
	//MAC-Side SGMII
	.o2_SGMIISpeed		(o2_SGMIISpeed),
	.o_SGMIIDuplex		(o_SGMIIDuplex),
	
	//Phy-Side SGMII
	.i_PhyLink			(i_PhyLink	),
	.i_PhyDuplex		(i_PhyDuplex),
	.i2_PhySpeed		(i2_PhySpeed),
	.o21_LinkTimer		(w21_LinkTimer),
	
	.i16_TxConfigReg	(w16_TxConfigReg),
	.o_MIIRst_L			(w_MIIRst_L),
	.o_ANEnable			(w_ANEnable),
	.o_ANRestart		(w_ANRestart),
	.o_Loopback			(w_Loopback),
	.o_GXBPowerDown		(w_GxBPowerDown),
	.o16_LcAdvAbility	(w16_LcAdvAbility),
	.i3_XmitState		(w3_XmitState),
	.i_SyncStatus		(w_SyncStatus),	
	.i_ANComplete		(w_ANComplete),
	.i16_LpAdvAbility	(w16_LpAdvAbility));
	
	 mSyncCtrl u0SyncCtrl(
	.i_Clk				(w_ClkRx		),
	.i_Cke				((~w_GxBPowerDown)	),
	.i_ARst_L			(w_ARstLogic_L	),
	.i_CtrlLoopBack		(w_Loopback		),
    
	.i8_RxCodeGroupIn	(r8_RxCodeGroup[2]	),
	.i_RxCodeInvalid	(r_RxCgInvalid[2]	),
	.i_RxCodeCtrl		(r_RxCgCtrl[2]		),
	.i_SignalDetect		(w_SignalDetect		),
	
	.o8_RxCodeGroupOut	(w8_RxCG_SyncToRxver	),	
	.o_RxCodeInvalid	(w_RxCGInv_SyncToRxver	),
	.o_RxCodeCtrl		(w_RxCGCtrl_SyncToRxver	),
	.o_RxEven			(w_RxEven				),
	.o_SyncStatus		(w_SyncStatus			),	
	.o_BitSlip			(w_BitSlip),
	.o_IsComma			(w_IsComma	),
	.o_OrderedSetValid	(w_OSValid	),
	.o_IsI1Set			(w_IsI1Set	),
	.o_IsI2Set			(w_IsI2Set	),
	.o_IsC1Set			(w_IsC1Set	),
	.o_IsC2Set			(w_IsC2Set	),
	.o_IsTSet			(w_IsTSet	),
	.o_IsVSet			(w_IsVSet	),
	.o_IsSSet			(w_IsSSet	),
	.o_IsRSet			(w_IsRSet	));
	
	always@(posedge w_ClkRx)
	begin
	r_CheckEndKDK			<= w_CheckEndKDK;
	r_CheckEndKD21_5D0_0	<= w_CheckEndKD21_5D0_0;
	r_CheckEndKD2_2D0_0	    <= w_CheckEndKD2_2D0_0;
	r_CheckEndTRK			<= w_CheckEndTRK;
	r_CheckEndTRR			<= w_CheckEndTRR;
	r_CheckEndRRR			<= w_CheckEndRRR;	   
	r_CheckEndRRK			<= w_CheckEndRRK;
	r_CheckEndRRS			<= w_CheckEndRRS;
	end
	
	mReceive	u0Receive(
	.i8_RxCodeGroupIn		(w8_RxCG_SyncToRxver	),
	.i_RxCodeInvalid       	(w_RxCGInv_SyncToRxver	),
	.i_RxCodeCtrl          	(w_RxCGCtrl_SyncToRxver	),
	.i_RxEven 	         	(w_RxEven				),
	
	.i3_Xmit				(w3_XmitState),
	
	.i_IsComma				(w_IsComma	),
	.i_OrderedSetValid      (w_OSValid	),
	.i_IsI1Set              (w_IsI1Set	),
	.i_IsI2Set              (w_IsI2Set	),
	.i_IsC1Set              (w_IsC1Set	),
	.i_IsC2Set              (w_IsC2Set	),
	.i_IsTSet               (w_IsTSet	),
	.i_IsVSet               (w_IsVSet	),
	.i_IsSSet               (w_IsSSet	),
	.i_IsRSet               (w_IsRSet	),
	
	.i_CheckEndKDK			(r_CheckEndKDK			),
	.i_CheckEndKD21_5D0_0	(r_CheckEndKD21_5D0_0	),
	.i_CheckEndKD2_2D0_0	(r_CheckEndKD2_2D0_0	),
	.i_CheckEndTRK			(r_CheckEndTRK			),
	.i_CheckEndTRR			(r_CheckEndTRR			),
	.i_CheckEndRRR			(r_CheckEndRRR			),
	.i_CheckEndRRK			(r_CheckEndRRK			),
	.i_CheckEndRRS			(r_CheckEndRRS			),
	
	.o16_RxConfigReg	(w16_RxConfigReg),
	.o_RUDIConfig		(w_RUDIConfig),
	.o_RUDIIdle			(w_RUDIIdle),
	.o_RUDIInvalid		(w_RUDIInvalid),
		
	.o_RxDV				(w_RxDV	),
	.o_RxER				(w_RxER	),
	.o8_RxD				(w8_RxD	),
	.o_Invalid			(w_Invalid),
	.o_Receiving		(w_Receiving),
	.i_Clk				(w_ClkRx),
	.i_ARst_L			(w_ARstLogic_L));
	
	mANCtrl	u0ANCtrl(
	.i_Clk				(w_ClkRx			),
	.i_ARst_L			(w_ARstLogic_L		),
	.i_Cke				((~w_GxBPowerDown)		),
	.i_RestartAN		(w_ANRestart		),
	.i_SyncStatus		(w_SyncStatus		),
	.i_ANEnable			(w_ANEnable			),
	.i21_LinkTimer		(w21_LinkTimer		),
	.i16_LcAdvAbility	(w16_LcAdvAbility	),
	.o16_LpAdvAbility	(w16_LpAdvAbility	),
	.o_ANComplete		(w_ANComplete		),
	.i16_RxConfigReg	(w16_RxConfigReg	),
	.i_RUDIConfig		(w_RUDIConfig		),
	.i_RUDIIdle			(w_RUDIIdle			),
	.i_RUDIInvalid		(w_RUDIInvalid		),	
	.o3_Xmit			(w3_XmitState		),
	.o16_TxConfigReg	(w16_TxConfigReg	));
	
	mTransmit	u0Transmit(
	.i3_Xmit			(w3_XmitState		),
	.i16_ConfigReg		(w16_TxConfigReg	),
		
	.i_TxEN				(w_TxEN				),	
	.i_TxER				(w_TxER				),
	.i8_TxD				(w8_TxD				),
		
		
	.o_Xmitting			(w_Transmitting		),	
	.o_TxEven			(w_TxEven			),
	.o8_TxCodeGroupOut	(w8_TxCode			),
	.o_TxCodeValid		(w_TxCodeValid		),
	.o_TxCodeCtrl		(w_TxCodeCtrl		),
	.i_CurrentParity	(w_CurrentParity	),
	
	.i_Clk				(w_ClkTx			),
	.i_ARst_L			(w_ARstLogic_L		));
	
	assign w_SignalDetect=~w_RxCodeInvalid;
	
	/*mXcver #(.pXcverName("AltArriaV"))u0Xcver(

	.i_SerRx			(i_SerRx			),
	.o_SerTx			(o_SerTx			),
		
	.i_RefClk125M		(i_RefClk125M		),
	.o_TxClk			(w_ClkSys			),
	.i_CalClk			(i_RefClk125M		),
	.i_GxBPwrDwn		(w_GxBPowerDown		),
	.i_XcverDigitalRst	(~w_ARstLogic_L		),	
	.o_PllLocked		(w_PllLocked		),
	
	.o_SignalDetect		(),
	.o8_RxCodeGroup		(w8_RxCode			),
	.o_RxCodeInvalid	(w_RxCodeInvalid	),
	.o_RxCodeCtrl		(w_RxCodeCtrl		),
	
	.i8_TxCodeGroup		(w8_TxCode			),
	.i_TxCodeValid		(w_TxCodeValid		),
	.i_TxCodeCtrl		(w_TxCodeCtrl		),
	.i_TxForceNegDisp	(w_TxForceNegDisp	),
	.o_RunningDisparity	(w_CurrentParity));*/
	
	
	mAltA5GXlvds u0Xcverlvds(
	.i_SerRx			(i_SerRx			),
	.o_SerTx			(o_SerTx			),
		
	.i_RefClk125M		(i_RefClk125M		),
	.o_TxClk			(w_ClkTx			),
	.o_RxClk			(w_ClkRx			),
	.i_GxBPwrDwn		(w_GxBPowerDown		),
	.i_XcverDigitalRst	(~i_ARstHardware_L	),	
	.o_PllLocked		(w_PllLocked		),
	.i_RxBitSlip		(w_BitSlip			),
	
	.o_SignalDetect		(),
	.o8_RxCodeGroup		(w8_RxCode			),
	.o_RxCodeInvalid	(w_RxCodeInvalid	),
	.o_RxCodeCtrl		(w_RxCodeCtrl		),
	
	.i8_TxCodeGroup		(w8_TxCode			),
	.i_TxCodeValid		(w_TxCodeValid		),
	.i_TxCodeCtrl		(w_TxCodeCtrl		),
	.i_TxForceNegDisp	(1'b0	),
	.o_RunningDisparity	(w_CurrentParity));
	
	assign w_ClkSys	 = w_ClkTx;
	assign o_GMIIClk = w_ClkSys;
	
	always@(posedge w_ClkSys or negedge i_ARstHardware_L )
	if(~i_ARstHardware_L)
	begin
		r7_Cntr 	<= 7'h0;
		r_MIIClk 	<= 1'b0;	
	end else		
	begin
		if(o2_SGMIISpeed==2'b01)
			begin
			if(r7_Cntr==7'h4) r7_Cntr<=7'h0; else r7_Cntr<=r7_Cntr+7'h1;
			if(r7_Cntr==7'h4) r_MIIClk<=1'b1; else if(r7_Cntr==7'h1) r_MIIClk<=1'b0;
			end
		else if(o2_SGMIISpeed==2'b00)
			begin
			if(r7_Cntr==7'h49) r7_Cntr<=7'h0; else r7_Cntr<=r7_Cntr+7'h1;
			if(r7_Cntr==7'h49) r_MIIClk<=1'b1; else if(r7_Cntr==7'h24) r_MIIClk<=1'b0;
			end		
		r_MIIClk_D <= r_MIIClk;
	end
	assign w_SamplingClk = (r_MIIClk_D & (~r_MIIClk));
		
	//Insert Clock Buffer or PLL if necessary
	mClkBuf u0ClkBuf(.i_Clk(r_MIIClk),.o_Clk(o_MIIClk));

endmodule





/*
Copyright ï¿½ 2012 JeffLieu-lieumychuong@gmail.com

	This file is part of SGMII-IP-Core.
    SGMII-IP-Core is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    SGMII-IP-Core is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SGMII-IP-Core.  If not, see <http://www.gnu.org/licenses/>.

File		:
Description	:	
Remarks		:	
Revision	:
	Date	Author		Description
02/09/12	Jefflieu
*/

`include "SGMIIDefs.v"
module mSyncCtrl (
	input	i_Clk,
	input 	i_Cke,
	input 	i_ARst_L,
	input	i_CtrlLoopBack,

	input	[07:00]	i8_RxCodeGroupIn,
	input	i_RxCodeInvalid,
	input	i_RxCodeCtrl,
	input	i_SignalDetect,
	output reg	[07:00]	o8_RxCodeGroupOut,
	output	o_RxEven,
	output	reg o_RxCodeInvalid,
	output	reg o_RxCodeCtrl,
	output reg	o_SyncStatus,
	output	o_BitSlip,
	output	o_IsComma,
	output	o_OrderedSetValid,
	output	o_IsI1Set,
	output	o_IsI2Set,
	output	o_IsC1Set,
	output	o_IsC2Set,
	output	reg o_IsTSet,
	output	reg o_IsVSet,
	output	reg o_IsSSet,
	output	reg o_IsRSet);

localparam stLOSS_OF_SYNC		=	13'h0001;
localparam stCOMMA_DTEC_1		=	13'h0002;
localparam stACQ_SYNC_1			=	13'h0004;
localparam stCOMMA_DTEC_2		=	13'h0008;
localparam stACQ_SYNC_2			=	13'h0010;
localparam stCOMMA_DTEC_3		=	13'h0020;
localparam stSYNC_ACQUIRED_1	=	13'h0040;
localparam stSYNC_ACQUIRED_2	=	13'h0080;
localparam stSYNC_ACQUIRED_2A	=	13'h0100;
localparam stSYNC_ACQUIRED_3	=	13'h0200;
localparam stSYNC_ACQUIRED_3A	=	13'h0400;
localparam stSYNC_ACQUIRED_4	=	13'h0800;
localparam stSYNC_ACQUIRED_4A	=	13'h1000;

reg 	[12:00]	r13_State;
reg		r_RxEven;
wire	w_SignalDetectChange;
reg		r_LastSignalDetect;
reg 	[02:00]	r3_GoodCgs;
wire	w_CgBad;
wire	w_IsComma;
wire	w_IsData;
reg		r_IsComma;
wire	w_IsC1Set;
wire	w_IsC2Set;
wire	w_IsI1Set;
wire	w_IsI2Set;
wire	w_IsRSet;
wire	w_IsSSet;
wire	w_IsTSet;
wire	w_IsVSet;
reg		r_IsRSTV;
wire [3:0] w4_ID1;
reg	 [3:0] r4_ID2;

	//MainStatemachine
	assign w_IsComma = (~i_RxCodeInvalid) && (i_RxCodeCtrl) && (i8_RxCodeGroupIn==8'hBC||i8_RxCodeGroupIn==8'h3C||i8_RxCodeGroupIn==8'hFC);
	assign w_IsData	 = (~i_RxCodeInvalid) && (~i_RxCodeCtrl);
	assign w_CgBad 	= i_RxCodeInvalid|(w_IsComma & r_RxEven);
	assign w_SignalDetectChange = r_LastSignalDetect^i_SignalDetect;
	always@(posedge i_Clk or negedge i_ARst_L)
	begin: MainStatemachine
		if(i_ARst_L==1'b0) begin
			r13_State <= stLOSS_OF_SYNC;
		end
		else if(i_Cke) begin
			r_LastSignalDetect <= i_SignalDetect;
			if(w_SignalDetectChange & (~i_RxCodeInvalid) & ~i_CtrlLoopBack)
				r13_State <= stLOSS_OF_SYNC;
			else
				case(r13_State)				
				stLOSS_OF_SYNC		:	if(w_IsComma && (i_SignalDetect||i_CtrlLoopBack)) r13_State <= stCOMMA_DTEC_1;
				stCOMMA_DTEC_1		:	if(w_IsData) r13_State <= stACQ_SYNC_1; else r13_State <= stLOSS_OF_SYNC;
				stACQ_SYNC_1		:	if(w_CgBad) r13_State <= stLOSS_OF_SYNC; else		
											if(r_RxEven==1'b0 && w_IsComma) r13_State <= stCOMMA_DTEC_2;
				stCOMMA_DTEC_2		:	if(w_IsData) r13_State <= stACQ_SYNC_2; else r13_State <= stLOSS_OF_SYNC;
				stACQ_SYNC_2		:	if(w_CgBad) r13_State <= stLOSS_OF_SYNC; else		
											if(r_RxEven==1'b0 && w_IsComma) r13_State <= stCOMMA_DTEC_3;
				stCOMMA_DTEC_3		:	if(w_IsData) r13_State <= stSYNC_ACQUIRED_1; else r13_State <= stLOSS_OF_SYNC;
				stSYNC_ACQUIRED_1	: 	if(w_CgBad) r13_State <= stSYNC_ACQUIRED_2; 
				stSYNC_ACQUIRED_2	: 	if(w_CgBad) r13_State <= stSYNC_ACQUIRED_3; else r13_State <= stSYNC_ACQUIRED_2A;
				stSYNC_ACQUIRED_2A	:	if(w_CgBad) r13_State <= stSYNC_ACQUIRED_3; else		
											if(r3_GoodCgs==3) r13_State <= stSYNC_ACQUIRED_1;
				stSYNC_ACQUIRED_3	:	if(w_CgBad) r13_State <= stSYNC_ACQUIRED_4; else r13_State <= stSYNC_ACQUIRED_3A;
				stSYNC_ACQUIRED_3A	:	if(w_CgBad) r13_State <= stSYNC_ACQUIRED_4; else		
											if(r3_GoodCgs==3) r13_State <= stSYNC_ACQUIRED_2;
				stSYNC_ACQUIRED_4	:	if(w_CgBad) r13_State <= stLOSS_OF_SYNC; else r13_State <= stSYNC_ACQUIRED_4A;
				stSYNC_ACQUIRED_4A	:	if(w_CgBad) r13_State <= stLOSS_OF_SYNC; else		
											if(r3_GoodCgs==3) r13_State <= stSYNC_ACQUIRED_3;
				endcase
		end
	end

	always@(posedge i_Clk or negedge i_ARst_L)
	begin: SignalControl
		if(i_ARst_L==1'b0) begin
			r_RxEven <= 1'b0;
		end
		else if(i_Cke) begin
			if((r13_State==stLOSS_OF_SYNC&&(w_IsComma && (i_SignalDetect||i_CtrlLoopBack)))||
					((r13_State==stACQ_SYNC_1||r13_State==stACQ_SYNC_2)&&(r_RxEven==1'b0 && w_IsComma)))
					r_RxEven<=1'b1;
			else
				r_RxEven <= ~r_RxEven;
			if(r13_State==stSYNC_ACQUIRED_1) 
				o_SyncStatus <= 1'b1;
			else if(r13_State==stLOSS_OF_SYNC)
				o_SyncStatus <= 1'b0;
			
			if(r13_State==stSYNC_ACQUIRED_2A||r13_State==stSYNC_ACQUIRED_3A||r13_State==stSYNC_ACQUIRED_4A)
				r3_GoodCgs <= r3_GoodCgs+3'h1; 
			else if(r13_State==stSYNC_ACQUIRED_2||r13_State==stSYNC_ACQUIRED_3||r13_State==stSYNC_ACQUIRED_4)
				r3_GoodCgs <= 3'h0;
			
			o8_RxCodeGroupOut <= i8_RxCodeGroupIn;
			o_RxCodeInvalid <= i_RxCodeInvalid;
			o_RxCodeCtrl 	<= i_RxCodeCtrl;
		end
	end
	
	assign o_RxEven = r_RxEven;

	//ordered set detection
	assign o_OrderedSetValid = r_IsComma | r_IsRSTV;
	assign w_IsC1Set = r_IsComma && w_IsData && (i8_RxCodeGroupIn==`D21_5);
	assign w_IsC2Set = r_IsComma && w_IsData && (i8_RxCodeGroupIn==`D2_2);
	assign w_IsI1Set = r_IsComma && w_IsData && (i8_RxCodeGroupIn==`D5_6);
	assign w_IsI2Set = r_IsComma && w_IsData && (i8_RxCodeGroupIn==`D16_2);
	assign w_IsRSet	 = i_RxCodeCtrl && (~i_RxCodeInvalid) && (i8_RxCodeGroupIn==`K23_7);
	assign w_IsSSet	 = i_RxCodeCtrl && (~i_RxCodeInvalid) && (i8_RxCodeGroupIn==`K27_7);
	assign w_IsTSet	 = i_RxCodeCtrl && (~i_RxCodeInvalid) && (i8_RxCodeGroupIn==`K29_7);
	assign w_IsVSet	 = i_RxCodeCtrl && (~i_RxCodeInvalid) && (i8_RxCodeGroupIn==`K30_7);
	
	assign o_IsC1Set = w_IsC1Set;
	assign o_IsC2Set = w_IsC2Set;
	assign o_IsI1Set = w_IsI1Set;
	assign o_IsI2Set = w_IsI2Set;	
	assign o_IsComma = r_IsComma;
	
	always@(posedge i_Clk or negedge i_ARst_L )
	if(!i_ARst_L) begin
		r_IsComma <= 1'b0;	
		r_IsRSTV <= 1'b0;
	end else begin	
		r_IsComma <= w_IsComma;	
		r_IsRSTV <= w_IsRSet | w_IsSSet | w_IsTSet | w_IsVSet;
		o_IsRSet <= w_IsRSet;
		o_IsSSet <= w_IsSSet;
		o_IsTSet <= w_IsTSet;
		o_IsVSet <= w_IsVSet;			
	end
	
	//synthesis translate_off
	reg [239:0] r240_SyncStateName;
	always@(*)
	case(r13_State)
	stLOSS_OF_SYNC		: r240_SyncStateName<="stLOSS_OF_SYNC		";
	stCOMMA_DTEC_1		: r240_SyncStateName<="stCOMMA_DTEC_1		";
	stACQ_SYNC_1		: r240_SyncStateName<="stACQ_SYNC_1			";	
	stCOMMA_DTEC_2		: r240_SyncStateName<="stCOMMA_DTEC_2		";
	stACQ_SYNC_2		: r240_SyncStateName<="stACQ_SYNC_2			";	
	stCOMMA_DTEC_3		: r240_SyncStateName<="stCOMMA_DTEC_3		";
	stSYNC_ACQUIRED_1	: r240_SyncStateName<="stSYNC_ACQUIRED_1	";
	stSYNC_ACQUIRED_2	: r240_SyncStateName<="stSYNC_ACQUIRED_2	";
	stSYNC_ACQUIRED_2A	: r240_SyncStateName<="stSYNC_ACQUIRED_2A	";
	stSYNC_ACQUIRED_3	: r240_SyncStateName<="stSYNC_ACQUIRED_3	";
	stSYNC_ACQUIRED_3A	: r240_SyncStateName<="stSYNC_ACQUIRED_3A	";
	stSYNC_ACQUIRED_4	: r240_SyncStateName<="stSYNC_ACQUIRED_4	";
	stSYNC_ACQUIRED_4A	: r240_SyncStateName<="stSYNC_ACQUIRED_4A	";
	endcase	
	//synthesis translate_on
	reg [3:0] r7_SlipTmr =0;		
	always@(posedge i_Clk or negedge i_ARst_L)
	if(~i_ARst_L)
		r7_SlipTmr  <= 7'h0;
	else begin 
		
		if(r13_State==stLOSS_OF_SYNC) begin 
			if(w_IsComma) r7_SlipTmr <= 0;			
			else r7_SlipTmr <= r7_SlipTmr+7'h1;							
			end
		else r7_SlipTmr <= 0;
		end
	assign o_BitSlip = &r7_SlipTmr[3:0]; 	
		
endmodule
/*
Developed By Subtleware Corporation Pte Ltd 2011
File		:
Description	:	
Remarks		:	
Revision	:
	Date	Author		Description
02/09/12	Jefflieu
*/


module mSyncFifo #(parameter pDataWidth=8,pPtrWidth=2)
	(
	input 	[pDataWidth-1:00] iv_Din,
	input	i_Wr,
	output	o_Full,
	output	o_Empty,	
	output	[pDataWidth-1:00] ov_Q,
	input	i_Rd,
	input	i_Clk,
	input	i_ARst_L);
	

	localparam pMemSize=2**pPtrWidth;
	
	reg [pDataWidth-1:00] rv_Ram [0:pMemSize-1];
	
	reg [pPtrWidth-1:00] rv_RdPtr;
	reg [pPtrWidth-1:00] rv_WrPtr;
	reg [pPtrWidth:00] 	 rv_Cntr;
	
	wire w_WrValid;
	wire w_RdValid;
	
	assign o_Full = (rv_Cntr==pMemSize)?1'b1:1'b0;
	assign o_Empty = (rv_Cntr==0)?1'b1:1'b0;
	assign w_WrValid = (~o_Full) & i_Wr;
	assign w_RdValid = (~o_Empty) & i_Rd;
	//DualPortRam
	always@(posedge i_Clk or negedge i_ARst_L)
	if(i_ARst_L==1'b0) begin
			rv_RdPtr<={pPtrWidth{1'b0}};
			rv_WrPtr<={pPtrWidth{1'b0}};
			rv_Cntr <={(pPtrWidth+1){1'b0}};
	end else
	begin
			if(w_WrValid) 
				begin
					rv_WrPtr <= rv_WrPtr+1;
					rv_Ram[rv_WrPtr] <= iv_Din;
				end
			if(w_RdValid)
					rv_RdPtr <= rv_RdPtr+1;
			
			if(w_RdValid & (~w_WrValid)) 
					rv_Cntr <= rv_Cntr-1;
			else if(w_WrValid & (~w_RdValid))
					rv_Cntr <= rv_Cntr+1;
	end
	
	assign ov_Q = rv_Ram[rv_RdPtr];
	
	
	
endmodule
/*
Developed By Subtleware Corporation Pte Ltd 2011
File		:
Description	:	
Remarks		:	
Revision	:
	Date	Author		Description
02/09/12	Jefflieu
*/


`include "SGMIIDefs.v"

module mTransmit(
	input	[02:00]	i3_Xmit,
	input	[15:00]	i16_ConfigReg,
	
	input	i_TxEN,
	input	i_TxER,
	input	[07:00]	i8_TxD,
	
	
	output	reg o_Xmitting,	
	output	reg o_TxEven,
	output	reg [07:00]	o8_TxCodeGroupOut,
	output	o_TxCodeValid,
	output	reg o_TxCodeCtrl,
	input	i_CurrentParity,
	
	input	i_Clk,
	input	i_ARst_L);

/*	
	- Transmit order set Statemachine 	: OSState 	
*/
	
	localparam	stTX_TEST 	= 24'h000001;	//Initial State
	localparam	stCONFIG_C1A= 24'h000002;	//Configuration phase
	localparam 	stCONFIG_C1B= 24'h000004;	//Configuration phase
	localparam 	stCONFIG_C1C= 24'h000008;	//Configuration phase
	localparam	stCONFIG_C1D= 24'h000010;	//Configuration phase
	localparam	stCONFIG_C2A= 24'h000020;	//Configuration phase
	localparam	stCONFIG_C2B= 24'h000040;	//Configuration phase
	localparam	stCONFIG_C2C= 24'h000080;	//Configuration phase
	localparam	stCONFIG_C2D= 24'h000100;	//Configuration phase
	localparam 	stTX_IDLE	= 24'h000200;	//IDLE Phase, Trasmitting Comma Character, this is to wait to sync with the MAC's packet
	localparam  stXMIT_DATA	= 24'h000400;	//Data Phase, Trasmitting Comma Character
	localparam  stIDLE_DATA	= 24'h000800;	//Trasmitting Data Character of /I/ Ordered Set
	localparam 	stTX_SOP	= 24'h001000;	//Transmitting SOP
	localparam 	stTX_PKT	= 24'h002000;	//False state
	localparam	stTX_DATA	= 24'h004000;	//Transmitting Data
	localparam	stTX_EOP	= 24'h008000;	//End of packet without any extension, tramitting T
	localparam  stTX_EOP_EXT= 24'h010000;	//End of packet with extension
	localparam 	stTX_EXT_1	= 24'h020000;	//Extend 1 cycle to align the COMMA to Even Code group
	localparam	stEPD2_NOEXT= 24'h040000;	//Second Cycle of EPD, transmitting /R/
	localparam 	stEPD3		= 24'h080000;	//Third Cycle of EPD, transmitting /R/
	localparam	stCARR_EXT	= 24'h100000;	//Carrier extension
	//localparam	stALIGN_ERR	= 24'h200000;	//Repeater's state, we don't use this, go straight to START ERR
	localparam	stSTART_ERR	= 24'h200000;	//Repeater's state
	localparam	stTX_ERR	= 24'h400000;	//Repeater's state

	
	reg	[22:00]	r13_State;
	reg	[22:00]	w24_NxtState;
	
	
	wire	w_XmitChange;
	reg	[02:00]	r3_LstXmit;
	reg		r_TxEven;
	wire	w_TxOSIndicate;
	
	
	wire	w_FifoTxEn;
	wire	w_FifoTxEr;
	wire [07:00]	w8_FifoData;
	wire	w_UpdateXmitChange;
	wire	w_ResetState;
	reg 	r_ToTxData;				//This signal used in txIDLE_DATA state to comeback to TXIDLE or TXDATA
	wire	w_Disparity;
	wire [09:00] w10_FifoDin;
	wire [09:00] w10_FifoQ;
	wire w_FifoRd,w_FifoEmpty;
	reg	 [07:00] r8_TxData;
	
	assign w_XmitChange = (r3_LstXmit!=i3_Xmit)?1'b1:1'b0;
	assign w_TxOSIndicate = (r13_State==stCONFIG_C1A||r13_State==stCONFIG_C1B||r13_State==stCONFIG_C1C||
								r13_State==stCONFIG_C2A||r13_State==stCONFIG_C2B||r13_State==stCONFIG_C2C||
									r13_State==stTX_IDLE||r13_State==stTX_DATA)?1'b0:1'b1;
	//assign w_UpdateXmitChange = 
	//FIFO
	assign w10_FifoDin = {i_TxEN,i_TxER,i8_TxD};
	assign w_FifoTxEn = w10_FifoQ[9] & (~w_FifoEmpty);
	assign w_FifoTxEr = w10_FifoQ[8] & (~w_FifoEmpty);
	assign w8_FifoData = w10_FifoQ[7:0];
	mSyncFifo #(.pDataWidth(10),.pPtrWidth(2)) u0SyncFifo (
		.iv_Din(w10_FifoDin),
		.i_Wr((i_TxEN|i_TxER)),
		.i_Rd(w_FifoRd),
		.o_Empty(w_FifoEmpty),
		.o_Full(),
		.ov_Q(w10_FifoQ),
		.i_Clk(i_Clk),
		.i_ARst_L(i_ARst_L));	
	//END FIFO
	assign w_FifoRd = ((w_FifoTxEn && (r13_State==stXMIT_DATA||r13_State==stIDLE_DATA)))?1'b0:1'b1;
	
	always@(posedge i_Clk or negedge i_ARst_L)
	if(i_ARst_L==1'b0) begin
		r13_State 	<= stTX_TEST;
		r3_LstXmit  <= `cXmitIDLE;
		r_TxEven	<= 1'b0;
		o_TxEven 	<= 1'b1;
		end
	else
		begin
		if(w_UpdateXmitChange) r3_LstXmit <= i3_Xmit;				
		if(w_ResetState)
			r13_State <= stTX_TEST;
		else 
			r13_State <= w24_NxtState;
		r_TxEven <= ~r_TxEven;
		o_TxEven <= r_TxEven;
		end
	
	// always@(posedge i_Clk or posedge w_ResetState)
	// if(w_ResetState)
		// r13_State <= stTX_TEST;	
	// else 
		// r13_State <= w24_NxtState;
		
	
	assign w_UpdateXmitChange = w_ResetState;
	assign w_ResetState = (i_ARst_L==1'b0)||(w_XmitChange && (o_TxEven==1'b0) && w_TxOSIndicate);
	assign w_Disparity = i_CurrentParity;
	always@(*)
	begin
		
		// else
		case(r13_State)
		stTX_TEST		: 	if(i3_Xmit==`cXmitCONFIG && o_TxEven==1'b0) w24_NxtState <= stCONFIG_C1A; else
							if((i3_Xmit==`cXmitIDLE &&(~o_TxEven)) || ((~o_TxEven) && i3_Xmit==`cXmitDATA && (w_FifoTxEn || w_FifoTxEr))) w24_NxtState <= stTX_IDLE; else
							if(i3_Xmit==`cXmitDATA && (~w_FifoTxEn) && (~w_FifoTxEr)) w24_NxtState <= stXMIT_DATA;
							else w24_NxtState <= stTX_TEST;		
		stCONFIG_C1A	:	w24_NxtState <= stCONFIG_C1B;
		stCONFIG_C1B	:	w24_NxtState <= stCONFIG_C1C;
		stCONFIG_C1C	:	w24_NxtState <= stCONFIG_C1D;
		stCONFIG_C1D	:	if(i3_Xmit==`cXmitCONFIG) w24_NxtState <= stCONFIG_C2A; else
							if(i3_Xmit==`cXmitIDLE || (i3_Xmit==`cXmitDATA && (w_FifoTxEn || w_FifoTxEr))) w24_NxtState <= stTX_IDLE; else
							if(i3_Xmit==`cXmitDATA && (~w_FifoTxEn) && (~w_FifoTxEr)) w24_NxtState <= stXMIT_DATA; else 
							w24_NxtState <= stTX_ERR;
		stCONFIG_C2A	:	w24_NxtState <= stCONFIG_C2B;
		stCONFIG_C2B	:	w24_NxtState <= stCONFIG_C2C;
		stCONFIG_C2C	:	w24_NxtState <= stCONFIG_C2D;
		stCONFIG_C2D	:	if(i3_Xmit==`cXmitCONFIG) w24_NxtState <= stCONFIG_C1A; else
							if(i3_Xmit==`cXmitIDLE || (i3_Xmit==`cXmitDATA && (w_FifoTxEn || w_FifoTxEr))) w24_NxtState <= stTX_IDLE; else
							if(i3_Xmit==`cXmitDATA && (~w_FifoTxEn) && (~w_FifoTxEr)) w24_NxtState <= stXMIT_DATA; else 
							w24_NxtState <= stTX_ERR;
		
		stTX_IDLE		: 	w24_NxtState <= stIDLE_DATA;
		stIDLE_DATA		: 	if(r_ToTxData==1'b0) begin //Data phase of TX_IDLE
								if(i3_Xmit==`cXmitDATA && (~w_FifoTxEn) && (~w_FifoTxEr)) w24_NxtState <= stXMIT_DATA; else
								w24_NxtState <= stTX_IDLE;
								end							
							else 
								begin
									if(w_FifoTxEn & (~w_FifoTxEr)) w24_NxtState <= stTX_SOP; else
									if(w_FifoTxEn & w_FifoTxEr) w24_NxtState <= stSTART_ERR; else
									w24_NxtState <= stXMIT_DATA;							
								end
		stXMIT_DATA		: 	w24_NxtState <= stIDLE_DATA;
		stTX_DATA		: 	if(w_FifoTxEn) w24_NxtState <= stTX_DATA; else
							if((~w_FifoTxEn) & (~w_FifoTxEr)) w24_NxtState <= stTX_EOP; else
							w24_NxtState <= stTX_EOP_EXT; 		
		stTX_SOP		: 	if(w_FifoTxEn) w24_NxtState <= stTX_DATA; else
							if((~w_FifoTxEn) & (~w_FifoTxEr)) w24_NxtState <= stTX_EOP; else
							w24_NxtState <= stTX_EOP_EXT; 
		stTX_EOP		: 	w24_NxtState <= stEPD2_NOEXT; 
		stEPD2_NOEXT	: 	if(r_TxEven) w24_NxtState <= stEPD3; else			
							w24_NxtState <= stXMIT_DATA;
		stEPD3			: 	w24_NxtState <= stXMIT_DATA;
		stTX_EOP_EXT	:	if(~w_FifoTxEr) w24_NxtState <= stTX_EXT_1; else w24_NxtState <= stCARR_EXT;
		stTX_EXT_1		: 	w24_NxtState <= stEPD2_NOEXT;
		stCARR_EXT		: 	if((~w_FifoTxEn) & (~w_FifoTxEr)) w24_NxtState <= stTX_EXT_1; else
							if(w_FifoTxEn & (~w_FifoTxEr)) w24_NxtState <= stTX_SOP; else
							if(w_FifoTxEn & w_FifoTxEr) w24_NxtState <= stSTART_ERR; else
							w24_NxtState <= stCARR_EXT;
		
		//stALIGN_ERR		: 	
		stSTART_ERR		: 	w24_NxtState <= stTX_ERR; 
		stTX_ERR		: 	if(w_FifoTxEn) w24_NxtState <= stTX_DATA; else
							if((~w_FifoTxEn) & (~w_FifoTxEr)) w24_NxtState <= stTX_EOP; else
							w24_NxtState <= stTX_EOP_EXT; 
		endcase
	end
	
	
	assign o_TxCodeValid = 1'b1;
	
	always@(posedge i_Clk or negedge i_ARst_L)
	if(i_ARst_L==1'b0) begin
		o_Xmitting <= 1'b0;
		o_TxCodeCtrl <= 1'b0;
		o8_TxCodeGroupOut <= 8'h00;
	end else begin
		case(w24_NxtState)
		stTX_TEST		: 	begin
							o_Xmitting <= 1'b0;							
							end
		stCONFIG_C1A	:	begin 		
							o8_TxCodeGroupOut <= `K28_5; 
							o_TxCodeCtrl <= 1'b1;							
							end
		stCONFIG_C1B	:	begin 		
							o8_TxCodeGroupOut <= `D21_5; 
							o_TxCodeCtrl <= 1'b0;							
							end
		stCONFIG_C1C	:	o8_TxCodeGroupOut <= i16_ConfigReg[07:00];						
		stCONFIG_C1D	:	o8_TxCodeGroupOut <= i16_ConfigReg[15:08];
							
		stCONFIG_C2A	:	begin 		
							o8_TxCodeGroupOut <= `K28_5; 
							o_TxCodeCtrl <= 1'b1;							
							end
		stCONFIG_C2B	:	begin 		
							o8_TxCodeGroupOut <= `D2_2; 
							o_TxCodeCtrl <= 1'b0;							
							end
		stCONFIG_C2C	:	o8_TxCodeGroupOut <= i16_ConfigReg[07:00];						
		stCONFIG_C2D	:	o8_TxCodeGroupOut <= i16_ConfigReg[15:08];															
		stTX_IDLE		: 	begin 
							o8_TxCodeGroupOut <= `K28_5; 
							o_TxCodeCtrl	<= 1'b1;
							r_ToTxData <= 1'b0;
							end
		stIDLE_DATA		: 	begin
							o8_TxCodeGroupOut <= (w_Disparity==1'b1)?`D5_6:`D16_2;//Disparity = 1 means positive
							o_TxCodeCtrl	<= 1'b0;							
							end
		stXMIT_DATA		: 	begin 
							o8_TxCodeGroupOut <= `K28_5; 
							o_TxCodeCtrl	<= 1'b1;
							r_ToTxData <= 1'b1;
							end
		stTX_DATA		: 	if(((~w_FifoTxEn) & w_FifoTxEr & w8_FifoData != 8'h0F)||(w_FifoTxEn & w_FifoTxEr))
							begin
								o8_TxCodeGroupOut <= `K30_7; 
								o_TxCodeCtrl	<= 1'b1;
							end else							
							begin		
								o8_TxCodeGroupOut <= w8_FifoData;
								o_TxCodeCtrl <= 1'b0;							
							end
		stTX_SOP		: 	begin 
							o_Xmitting	<= 1'b1;
							o8_TxCodeGroupOut <= `K27_7; 
							o_TxCodeCtrl	<= 1'b1;							
							end							
		stTX_EOP		: 	begin 
							o8_TxCodeGroupOut <= `K29_7; 
							o_TxCodeCtrl	<= 1'b1;
							o_Xmitting <= (~r_TxEven);
							end
		stEPD2_NOEXT	: 	begin 
							o8_TxCodeGroupOut <= `K23_7; 
							o_TxCodeCtrl	<= 1'b1;
							o_Xmitting <= 1'b0;
							end
		stEPD3			:	begin 
							o8_TxCodeGroupOut <= `K23_7; 
							o_TxCodeCtrl	<= 1'b1;						
							end
		stTX_EOP_EXT	:	if(((~w_FifoTxEn) & w_FifoTxEr & w8_FifoData != 8'h0F)||(w_FifoTxEn & w_FifoTxEr))
							begin
								o8_TxCodeGroupOut <= `K30_7; 
								o_TxCodeCtrl	<= 1'b1;
							end else
							begin
								o8_TxCodeGroupOut <= `K29_7; 
								o_TxCodeCtrl	<= 1'b1;
							end
		stTX_EXT_1		: 	begin
							o_Xmitting <= (~r_TxEven);
								if(((~w_FifoTxEn) & w_FifoTxEr & w8_FifoData != 8'h0F)||(w_FifoTxEn & w_FifoTxEr))
								begin
									o8_TxCodeGroupOut <= `K30_7; 
									o_TxCodeCtrl	<= 1'b1;
									
								end else
								begin
									o8_TxCodeGroupOut <= `K23_7; 
									o_TxCodeCtrl	<= 1'b1;
								end
							end
		stCARR_EXT		: 	if(((~w_FifoTxEn) & w_FifoTxEr & w8_FifoData != 8'h0F)||(w_FifoTxEn & w_FifoTxEr))
							begin
								o8_TxCodeGroupOut <= `K30_7; 
								o_TxCodeCtrl	<= 1'b1;
							end else
							begin
								o8_TxCodeGroupOut <= `K23_7; 
								o_TxCodeCtrl	<= 1'b1;
							end
		
		//stALIGN_ERR		: 	
		stSTART_ERR		: 	begin 
							o8_TxCodeGroupOut 	<= `K27_7; 
							o_TxCodeCtrl		<= 1'b1;
							o_Xmitting 			<= 1'b1;
							end	
		stTX_ERR		: 	begin 
							o8_TxCodeGroupOut <= `K30_7; 
							o_TxCodeCtrl	<= 1'b1;
							end	
		endcase
	end
	
//synthesis translate_off	
	reg [239:0] r240_TxStateName;
	always@(*)
	case(r13_State)
	stTX_TEST 		: r240_TxStateName<="stTX_TEST 	";
	stCONFIG_C1A    : r240_TxStateName<="stCONFIG_C1A";
	stCONFIG_C1B    : r240_TxStateName<="stCONFIG_C1B";
	stCONFIG_C1C    : r240_TxStateName<="stCONFIG_C1C";
	stCONFIG_C1D    : r240_TxStateName<="stCONFIG_C1D";
	stCONFIG_C2A    : r240_TxStateName<="stCONFIG_C2A";
	stCONFIG_C2B    : r240_TxStateName<="stCONFIG_C2B";
	stCONFIG_C2C    : r240_TxStateName<="stCONFIG_C2C";
	stCONFIG_C2D    : r240_TxStateName<="stCONFIG_C2D";
	stTX_IDLE	    : r240_TxStateName<="stTX_IDLE	 ";
	stXMIT_DATA	    : r240_TxStateName<="stXMIT_DATA";
	stIDLE_DATA	    : r240_TxStateName<="stIDLE_DATA";
	stTX_SOP	    : r240_TxStateName<="stTX_SOP	 ";
	stTX_PKT	    : r240_TxStateName<="stTX_PKT	 ";
	stTX_DATA       : r240_TxStateName<="stTX_DATA   ";
	stTX_EOP	    : r240_TxStateName<="stTX_EOP	 ";
	stTX_EOP_EXT    : r240_TxStateName<="stTX_EOP_EXT";
	stTX_EXT_1	    : r240_TxStateName<="stTX_EXT_1	 ";
	stEPD2_NOEXT    : r240_TxStateName<="stEPD2_NOEXT";
	stEPD3		    : r240_TxStateName<="stEPD3		 ";
	stCARR_EXT	    : r240_TxStateName<="stCARR_EXT	 ";
	//stALIGN_ERR	    : r240_TxStateName<="stALIGN_ERR";
	stSTART_ERR	    : r240_TxStateName<="stSTART_ERR";
	stTX_ERR	    : r240_TxStateName<="stTX_ERR	 ";
	endcase
//synthesis translate_on
endmodule
/*
Developed By Subtleware Corporation Pte Ltd 2011
File		:
Description	:
Remarks		:
Revision	:
	Date	Author	Description
*/

module mXcver #(parameter pXcverName="AltCycIV") (

	input	i_SerRx,
	output	o_SerTx,
	
	input 	i_RefClk125M,
	output 	o_TxClk,
	input	i_CalClk,
	input	i_GxBPwrDwn,
	input	i_XcverDigitalRst,
	output	o_PllLocked,
	output	o_SignalDetect,
	output	[07:00] 	o8_RxCodeGroup,
	output	o_RxCodeInvalid,
	output	o_RxCodeCtrl,
	
	input	[07:00] 	i8_TxCodeGroup,
	input	i_TxCodeValid,
	input	i_TxCodeCtrl,
	input	i_TxForceNegDisp,
	output	o_RunningDisparity);



	generate 		
	if(pXcverName=="AltCycIV")		
		begin:AltCycIVXcver
		wire [04:00] w5_ReconfigFromGxb;
		wire [03:00] w4_ReconfigToGxb;
		wire w_Reconfiguring;
		mAltGX u0AltGX (
		.cal_blk_clk		(i_CalClk),
		.gxb_powerdown		(i_GxBPwrDwn),
		.pll_inclk			(i_RefClk125M),
		.reconfig_clk		(i_CalClk),
		.reconfig_togxb		(w4_ReconfigToGxb),
		.rx_analogreset		(1'b0),
		.pll_locked			(o_PllLocked),
		.reconfig_fromgxb	(w5_ReconfigFromGxb),
		
		.rx_digitalreset	(i_XcverDigitalRst),
		.rx_datain			(i_SerRx),
		.tx_dataout			(o_SerTx),
			
		.tx_ctrlenable		(i_TxCodeCtrl),
		.tx_datain			(i8_TxCodeGroup),
		.tx_digitalreset	(i_XcverDigitalRst),
			
		.rx_errdetect		(o_RxCodeInvalid),
		.rx_ctrldetect		(o_RxCodeCtrl),
		.rx_dataout			(o8_RxCodeGroup),	
		.rx_disperr			(),		
		.rx_patterndetect	(),
		.rx_rlv				(),
		.rx_syncstatus		(o_SignalDetect),
		.tx_clkout			(o_TxClk));
		
		assign o_RunningDisparity = 1'b0;
		
		  mAltGXReconfig u0AltGXReconfig(
			.reconfig_clk		(i_CalClk),
			.reconfig_fromgxb 	(w5_ReconfigFromGxb),
			.busy				(w_Reconfiguring),
			.reconfig_togxb		(w4_ReconfigToGxb));		
		end	
	endgenerate
	
	
	generate 		
	if(pXcverName=="AltArriaV")
		begin:AltArriaVXcver
		wire [091:00] w92_ReconfigFromGxb;
		wire [139:00] w140_ReconfigToGxb;
		wire w_Reconfiguring;		
		mAltAvgxXcver uAltXCver(
		.phy_mgmt_clk			(i_RefClk125M),         //       phy_mgmt_clk.clk
		.phy_mgmt_clk_reset		(1'b0),   		// phy_mgmt_clk_reset.reset
		.phy_mgmt_address		(8'h0),     //           phy_mgmt.address
		.phy_mgmt_read			(1'b0),        //                   .read
		.phy_mgmt_readdata		(),    //                   .readdata
		.phy_mgmt_waitrequest	(), //                   .waitrequest
		.phy_mgmt_write			(1'b0),       //                   .write
		.phy_mgmt_writedata		(32'h0),   //                   .writedata
		.tx_ready			(),             //           tx_ready.export
		.rx_ready			(),             //           rx_ready.export
		.pll_ref_clk		(i_RefClk125M),          //        pll_ref_clk.clk
		.tx_serial_data		(o_SerTx),       //     tx_serial_data.export
		.pll_locked			(o_PllLocked),           //         pll_locked.export
		.rx_serial_data		(i_SerRx),       //     rx_serial_data.export
		.rx_runningdisp		(o_RunningDisparity),       //     rx_runningdisp.export
		.rx_patterndetect	(w_PatternDtec),     //   rx_patterndetect.export
		.rx_disperr			(w_DispErr),           //         rx_disperr.export
		.rx_errdetect		(w_ErrDtec),         //       rx_errdetect.export
		.rx_syncstatus		(w_SyncStatus),        //      rx_syncstatus.export
		.tx_clkout			(o_TxClk),            //          tx_clkout.export
		.rx_clkout			(),            //          rx_clkout.export
		.tx_parallel_data	(i8_TxCodeGroup),     //   tx_parallel_data.export
		.tx_datak			(i_TxCodeCtrl),             //           tx_datak.export
		.rx_parallel_data	(o8_RxCodeGroup),     //   rx_parallel_data.export
		.rx_datak			(o_RxCodeCtrl),             //           rx_datak.export
		.reconfig_from_xcvr	(w92_ReconfigFromGxb),   // reconfig_from_xcvr.reconfig_from_xcvr
		.reconfig_to_xcvr   (w140_ReconfigToGxb)  //   reconfig_to_xcvr.reconfig_to_xcvr
	);	
		assign o_SignalDetect = ~(w_ErrDtec|w_DispErr);
		assign o_RxCodeInvalid = w_ErrDtec;
		
		mAltAvgxReconfig uReconfig(
		.reconfig_busy		(w_Reconfiguring),		// reconfig_busy.reconfig_busy
		.mgmt_clk_clk		(i_CalClk),              	// mgmt_clk_clk.clk
		.mgmt_rst_reset		(i_XcverDigitalRst),            		// mgmt_rst_reset.reset
		.reconfig_mgmt_address		(8'h0),     	// reconfig_mgmt.address
		.reconfig_mgmt_read			(1'b0),        	// .read
		.reconfig_mgmt_readdata		(),    			// .readdata
		.reconfig_mgmt_waitrequest	(), 			// .waitrequest
		.reconfig_mgmt_write		(1'b0),       	// .write
		.reconfig_mgmt_writedata	(32'h0),   		// .writedata
		.reconfig_to_xcvr			(w140_ReconfigToGxb),// reconfig_to_xcvr.reconfig_to_xcvr
		.reconfig_from_xcvr         (w92_ReconfigFromGxb)// reconfig_from_xcvr.reconfig_from_xcvr
	);
		  
		end	
	endgenerate

	
	
endmodule
/*
	Copyright ï¿½ 2012 JeffLieu-lieumychuong@gmail.com
	
	This file is part of SGMII-IP-Core.
    SGMII-IP-Core is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    SGMII-IP-Core is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SGMII-IP-Core.  If not, see <http://www.gnu.org/licenses/>.


File		:
Description	:

Remarks		:

Revision	:
	Date	Author	Description

*/
	

`define cSystemClkPeriod	8

`define cXmitCONFIG		3'b010
`define cXmitIDLE		3'b001
`define cXmitDATA		3'b100

`define D0_0	8'h00
`define D21_5	8'hB5
`define D2_2	8'h42
`define D5_6	8'hC5
`define D16_2	8'h50
`define K28_5	8'hBC
`define K23_7	8'hF7	//R/
`define K27_7	8'hFB	//S/
`define K29_7	8'hFD	//T/
`define K30_7	8'hFE	//V/

`define cReg4Default 	16'h0000
`define cReg0Default	16'h1000
`define cRegXDefault	16'h0003
`define cRegLinkTimerDefault	(10_000_000/8)

`define cLcAbility_FD	16'h0020	
`define cLcAbility_HD	16'h0040	
`define cLcAbility_PS1	16'h0080
`define cLcAbility_PS2	16'h0100
`define cLcAbility_RF1	16'h1000
`define cLcAbility_RF2	16'h2000


	