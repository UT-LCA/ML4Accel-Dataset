`timescale 1ns / 10ps
/////////////////////////////////////////////////////////////////////
////                                                             ////
////  USB 1.1 function IP core                                   ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_core.v,v 1.2 2002-10-11 05:48:20 rudi Exp $
//
//  $Date: 2002-10-11 05:48:20 $
//  $Revision: 1.2 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.1  2002/09/25 06:06:49  rudi
//               - Added New Top Level
//               - Remove old top level and associated files
//               - Moved FIFOs to "Generic FIFOs" project
//
//
//
//
//
//
//

`include "usb1_defines.v"

/*

		// USB PHY Interface
		tx_dp, tx_dn, tx_oe,
		rx_d, rx_dp, rx_dn,
These pins are a semi-standard interface to USB 1.1 transceivers.
Just match up the signal names with the IOs of the transceiver.

		// USB Misc
		phy_tx_mode, usb_rst, 
The PHY supports single ended and differential output to the
transceiver Depending on which device you are using, you have
to tie the phy_tx_mode high or low.
usb_rst is asserted whenever the host signals reset on the USB
bus. The USB core will internally reset itself automatically.
This output is provided for external logic that needs to be
reset when the USB bus is reset.

		// Interrupts
		dropped_frame, misaligned_frame,
		crc16_err,
dropped_frame, misaligned_frame are interrupt to indicate error
conditions in Block Frame mode.
crc16_err, indicates when a crc 16 error was detected on the
payload of a USB packet.

		// Vendor Features
		v_set_int, v_set_feature, wValue,
		wIndex, vendor_data,
This signals allow to control vendor specific registers and logic
that can be manipulated and monitored via the control endpoint
through vendor defined commands.

		// USB Status
		usb_busy, ep_sel,
usb_busy is asserted when the USB core is busy transferring
data ep_sel indicated the endpoint that is currently busy.
This information might be useful if one desires to reset/clear
the attached FIFOs and want to do this when the endpoint is idle.

		// Endpoint Interface
This implementation supports 8 endpoints. Endpoint 0 is the
control endpoint and used internally. Endpoints 1-7 are available
to the user. replace 'N' with the endpoint number.

		epN_cfg,
This is a constant input used to configure the endpoint by ORing
these defines together and adding the max packet size for this
endpoint:
`IN and `OUT select the transfer direction for this endpoint
`ISO, `BULK and `INT determine the endpoint type

Example: "`BULK | `IN  | 14'd064" defines a BULK IN endpoint with
max packet size of 64 bytes

		epN_din,  epN_we, epN_full,
This is the OUT FIFO interface. If this is a IN endpoint, ground
all unused inputs and leave outputs unconnected.

		epN_dout, epN_re, epN_empty,
this is the IN FIFO interface. If this is a OUT endpoint ground
all unused inputs and leave outputs unconnected.

		epN_bf_en, epN_bf_size,
These two constant configure the Block Frame feature.

*/


module usb1_core(clk_i, rst_i,

		// USB PHY Interface
		tx_dp, tx_dn, tx_oe,
		rx_d, rx_dp, rx_dn,

		// USB Misc
		phy_tx_mode, usb_rst, 

		// Interrupts
		dropped_frame, misaligned_frame,
		crc16_err,

		// Vendor Features
		v_set_int, v_set_feature, wValue,
		wIndex, vendor_data,

		// USB Status
		usb_busy, ep_sel,

		// Endpoint Interface
		ep1_cfg,
		ep1_din,  ep1_we, ep1_full,
		ep1_dout, ep1_re, ep1_empty,
		ep1_bf_en, ep1_bf_size,

		ep2_cfg,
		ep2_din,  ep2_we, ep2_full,
		ep2_dout, ep2_re, ep2_empty,
		ep2_bf_en, ep2_bf_size,

		ep3_cfg,
		ep3_din,  ep3_we, ep3_full,
		ep3_dout, ep3_re, ep3_empty,
		ep3_bf_en, ep3_bf_size,

		ep4_cfg,
		ep4_din,  ep4_we, ep4_full,
		ep4_dout, ep4_re, ep4_empty,
		ep4_bf_en, ep4_bf_size,

		ep5_cfg,
		ep5_din,  ep5_we, ep5_full,
		ep5_dout, ep5_re, ep5_empty,
		ep5_bf_en, ep5_bf_size,

		ep6_cfg,
		ep6_din,  ep6_we, ep6_full,
		ep6_dout, ep6_re, ep6_empty,
		ep6_bf_en, ep6_bf_size,

		ep7_cfg,
		ep7_din,  ep7_we, ep7_full,
		ep7_dout, ep7_re, ep7_empty,
		ep7_bf_en, ep7_bf_size

		); 		

input		clk_i;
input		rst_i;

output		tx_dp, tx_dn, tx_oe;
input		rx_d, rx_dp, rx_dn;

input		phy_tx_mode;
output		usb_rst;
output		dropped_frame, misaligned_frame;
output		crc16_err;

output		v_set_int;
output		v_set_feature;
output	[15:0]	wValue;
output	[15:0]	wIndex;
input	[15:0]	vendor_data;

output		usb_busy;
output	[3:0]	ep_sel;

// Endpoint Interfaces
input	[13:0]	ep1_cfg;
input	[7:0]	ep1_din;
output	[7:0]	ep1_dout;
output		ep1_we, ep1_re;
input		ep1_empty, ep1_full;
input		ep1_bf_en;
input	[6:0]	ep1_bf_size;

input	[13:0]	ep2_cfg;
input	[7:0]	ep2_din;
output	[7:0]	ep2_dout;
output		ep2_we, ep2_re;
input		ep2_empty, ep2_full;
input		ep2_bf_en;
input	[6:0]	ep2_bf_size;

input	[13:0]	ep3_cfg;
input	[7:0]	ep3_din;
output	[7:0]	ep3_dout;
output		ep3_we, ep3_re;
input		ep3_empty, ep3_full;
input		ep3_bf_en;
input	[6:0]	ep3_bf_size;

input	[13:0]	ep4_cfg;
input	[7:0]	ep4_din;
output	[7:0]	ep4_dout;
output		ep4_we, ep4_re;
input		ep4_empty, ep4_full;
input		ep4_bf_en;
input	[6:0]	ep4_bf_size;

input	[13:0]	ep5_cfg;
input	[7:0]	ep5_din;
output	[7:0]	ep5_dout;
output		ep5_we, ep5_re;
input		ep5_empty, ep5_full;
input		ep5_bf_en;
input	[6:0]	ep5_bf_size;

input	[13:0]	ep6_cfg;
input	[7:0]	ep6_din;
output	[7:0]	ep6_dout;
output		ep6_we, ep6_re;
input		ep6_empty, ep6_full;
input		ep6_bf_en;
input	[6:0]	ep6_bf_size;

input	[13:0]	ep7_cfg;
input	[7:0]	ep7_din;
output	[7:0]	ep7_dout;
output		ep7_we, ep7_re;
input		ep7_empty, ep7_full;
input		ep7_bf_en;
input	[6:0]	ep7_bf_size;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

// UTMI Interface
wire	[7:0]	DataOut;
wire		TxValid;
wire		TxReady;
wire	[7:0]	DataIn;
wire		RxValid;
wire		RxActive;
wire		RxError;
wire	[1:0]	LineState;

wire	[7:0]	rx_data;
wire		rx_valid, rx_active, rx_err;
wire	[7:0]	tx_data;
wire		tx_valid;
wire		tx_ready;
wire		tx_first;
wire		tx_valid_last;

// Internal Register File Interface
wire	[6:0]	funct_adr;	// This functions address (set by controller)
wire	[3:0]	ep_sel;		// Endpoint Number Input
wire		crc16_err;	// Set CRC16 error interrupt
wire		int_to_set;	// Set time out interrupt
wire		int_seqerr_set;	// Set PID sequence error interrupt
wire	[31:0]	frm_nat;	// Frame Number and Time Register
wire		nse_err;	// No Such Endpoint Error
wire		pid_cs_err;	// PID CS error
wire		crc5_err;	// CRC5 Error

reg	[7:0]	tx_data_st;
wire	[7:0]	rx_data_st;
reg	[13:0]	cfg;
reg		ep_empty;
reg		ep_full;
wire	[7:0]	rx_size;
wire		rx_done;

wire	[7:0]	ep0_din;
wire	[7:0]	ep0_dout;
wire		ep0_re, ep0_we;
wire	[13:0]	ep0_cfg;
wire	[7:0]	ep0_size;
wire	[7:0]	ep0_ctrl_dout, ep0_ctrl_din;
wire		ep0_ctrl_re, ep0_ctrl_we;
wire	[3:0]	ep0_ctrl_stat;

wire		ctrl_setup, ctrl_in, ctrl_out;
wire		send_stall;
wire		token_valid;
reg		rst_local;		// internal reset
wire		dropped_frame;
wire		misaligned_frame;
wire		v_set_int;
wire		v_set_feature;
wire	[15:0]	wValue;
wire	[15:0]	wIndex;

reg		ep_bf_en;
reg	[6:0]	ep_bf_size;
wire	[6:0]	rom_adr;
wire	[7:0]	rom_data;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

// Endpoint type and Max transfer size
assign ep0_cfg = `CTRL | ep0_size;

always @(posedge clk_i)
	rst_local <= #1 rst_i & ~usb_rst;

///////////////////////////////////////////////////////////////////
//
// Module Instantiations
//

usb_phy phy(
		.clk(			clk_i			),
		.rst(			rst_i			),	// ONLY external reset
		.phy_tx_mode(		phy_tx_mode		),
		.usb_rst(		usb_rst			),

		// Transceiver Interface
		.rxd(			rx_d			),
		.rxdp(			rx_dp			),
		.rxdn(			rx_dn			),
		.txdp(			tx_dp			),
		.txdn(			tx_dn			),
		.txoe(			tx_oe			),

		// UTMI Interface
		.DataIn_o(		DataIn			),
		.RxValid_o(		RxValid			),
		.RxActive_o(		RxActive		),
		.RxError_o(		RxError			),
		.DataOut_i(		DataOut			),
		.TxValid_i(		TxValid			),
		.TxReady_o(		TxReady			),
		.LineState_o(		LineState		)
		);

// UTMI Interface
usb1_utmi_if	u0(
		.phy_clk(		clk_i			),
		.rst(			rst_local		),
		.DataOut(		DataOut			),
		.TxValid(		TxValid			),
		.TxReady(		TxReady			),
		.RxValid(		RxValid			),
		.RxActive(		RxActive		),
		.RxError(		RxError			),
		.DataIn(		DataIn			),
		.rx_data(		rx_data			),
		.rx_valid(		rx_valid		),
		.rx_active(		rx_active		),
		.rx_err(		rx_err			),
		.tx_data(		tx_data			),
		.tx_valid(		tx_valid		),
		.tx_valid_last(		tx_valid_last		),
		.tx_ready(		tx_ready		),
		.tx_first(		tx_first		)
		);

// Protocol Layer
usb1_pl  u1(	.clk(			clk_i			),
		.rst(			rst_local		),
		.rx_data(		rx_data			),
		.rx_valid(		rx_valid		),
		.rx_active(		rx_active		),
		.rx_err(		rx_err			),
		.tx_data(		tx_data			),
		.tx_valid(		tx_valid		),
		.tx_valid_last(		tx_valid_last		),
		.tx_ready(		tx_ready		),
		.tx_first(		tx_first		),
		.tx_valid_out(		TxValid			),
		.token_valid(		token_valid		),
		.fa(			funct_adr		),
		.ep_sel(		ep_sel			),
		.x_busy(		usb_busy		),
		.int_crc16_set(		crc16_err		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.frm_nat(		frm_nat			),
		.pid_cs_err(		pid_cs_err		),
		.nse_err(		nse_err			),
		.crc5_err(		crc5_err		),
		.rx_size(		rx_size			),
		.rx_done(		rx_done			),
		.ctrl_setup(		ctrl_setup		),
		.ctrl_in(		ctrl_in			),
		.ctrl_out(		ctrl_out		),
		.ep_bf_en(		ep_bf_en		),
		.ep_bf_size(		ep_bf_size		),
		.dropped_frame(		dropped_frame		),
		.misaligned_frame(	misaligned_frame	),
		.csr(			cfg			),
		.tx_data_st(		tx_data_st		),
		.rx_data_st(		rx_data_st		),
		.idma_re(		idma_re			),
		.idma_we(		idma_we			),
		.ep_empty(		ep_empty		),
		.ep_full(		ep_full			),
		.send_stall(		send_stall		)
		);

usb1_ctrl  u4(	.clk(			clk_i			),
		.rst(			rst_local		),

		.rom_adr(		rom_adr			),
		.rom_data(		rom_data		),

		.ctrl_setup(		ctrl_setup		),
		.ctrl_in(		ctrl_in			),
		.ctrl_out(		ctrl_out		),

		.ep0_din(		ep0_ctrl_dout		),
		.ep0_dout(		ep0_ctrl_din		),
		.ep0_re(		ep0_ctrl_re		),
		.ep0_we(		ep0_ctrl_we		),
		.ep0_stat(		ep0_ctrl_stat		),
		.ep0_size(		ep0_size		),

		.send_stall(		send_stall		),
		.frame_no(		frm_nat[26:16]		),
		.funct_adr(		funct_adr 		),
		.configured(					),
		.halt(						),

		.v_set_int(		v_set_int		),
		.v_set_feature(		v_set_feature		),
		.wValue(		wValue			),
		.wIndex(		wIndex			),
		.vendor_data(		vendor_data		)
		);


usb1_rom1 rom1(	.clk(		clk_i		),
		.adr(		rom_adr		),
		.dout(		rom_data	)
		);

// CTRL Endpoint FIFO
generic_fifo_sc_a #(8,6,0) u10(
		.clk(			clk_i			),
		.rst(			rst_i			),
		.clr(			usb_rst			),
		.din(			rx_data_st		),
		.we(			ep0_we			),
		.dout(			ep0_ctrl_dout		),
		.re(			ep0_ctrl_re		),
		.full_r(					),
		.empty_r(					),
		.full(			ep0_full		),
		.empty(			ep0_ctrl_stat[1]	),
		.full_n(					),
		.empty_n(					),
		.full_n_r(					),
		.empty_n_r(					),
		.level(						)
		);

generic_fifo_sc_a #(8,6,0) u11(
		.clk(			clk_i			),
		.rst(			rst_i			),
		.clr(			usb_rst			),
		.din(			ep0_ctrl_din		),
		.we(			ep0_ctrl_we		),
		.dout(			ep0_dout		),
		.re(			ep0_re			),
		.full_r(					),
		.empty_r(					),
		.full(			ep0_ctrl_stat[2]	),
		.empty(			ep0_empty		),
		.full_n(					),
		.empty_n(					),
		.full_n_r(					),
		.empty_n_r(					),
		.level(						)
		);

///////////////////////////////////////////////////////////////////
//
// Endpoint FIFO Interfaces
//

always @(ep_sel or ep0_cfg or ep1_cfg or ep2_cfg or ep3_cfg or
		ep4_cfg or ep5_cfg or ep6_cfg or ep7_cfg)
	case(ep_sel)	// synopsys full_case parallel_case
	   4'h0:	cfg = ep0_cfg;
	   4'h1:	cfg = ep1_cfg;
	   4'h2:	cfg = ep2_cfg;
	   4'h3:	cfg = ep3_cfg;
	   4'h4:	cfg = ep4_cfg;
	   4'h5:	cfg = ep5_cfg;
	   4'h6:	cfg = ep6_cfg;
	   4'h7:	cfg = ep7_cfg;
	endcase

// In endpoints only
always @(posedge clk_i)
	case(ep_sel)	// synopsys full_case parallel_case
	   4'h0:	tx_data_st <= #1 ep0_dout;
	   4'h1:	tx_data_st <= #1 ep1_din;
	   4'h2:	tx_data_st <= #1 ep2_din;
	   4'h3:	tx_data_st <= #1 ep3_din;
	   4'h4:	tx_data_st <= #1 ep4_din;
	   4'h5:	tx_data_st <= #1 ep5_din;
	   4'h6:	tx_data_st <= #1 ep6_din;
	   4'h7:	tx_data_st <= #1 ep7_din;
	endcase

// In endpoints only
always @(posedge clk_i)
	case(ep_sel)	// synopsys full_case parallel_case
	   4'h0:	ep_empty <= #1 ep0_empty;
	   4'h1:	ep_empty <= #1 ep1_empty;
	   4'h2:	ep_empty <= #1 ep2_empty;
	   4'h3:	ep_empty <= #1 ep3_empty;
	   4'h4:	ep_empty <= #1 ep4_empty;
	   4'h5:	ep_empty <= #1 ep5_empty;
	   4'h6:	ep_empty <= #1 ep6_empty;
	   4'h7:	ep_empty <= #1 ep7_empty;
	endcase

// OUT endpoints only
always @(ep_sel or ep0_full or ep1_full or ep2_full or ep3_full or
		ep4_full or ep5_full or ep6_full or ep7_full)
	case(ep_sel)	// synopsys full_case parallel_case
	   4'h0:	ep_full = ep0_full;
	   4'h1:	ep_full = ep1_full;
	   4'h2:	ep_full = ep2_full;
	   4'h3:	ep_full = ep3_full;
	   4'h4:	ep_full = ep4_full;
	   4'h5:	ep_full = ep5_full;
	   4'h6:	ep_full = ep6_full;
	   4'h7:	ep_full = ep7_full;
	endcase

always @(posedge clk_i)
	case(ep_sel)	// synopsys full_case parallel_case
	   4'h0:	ep_bf_en = 1'b0;
	   4'h1:	ep_bf_en = ep1_bf_en;
	   4'h2:	ep_bf_en = ep2_bf_en;
	   4'h3:	ep_bf_en = ep3_bf_en;
	   4'h4:	ep_bf_en = ep4_bf_en;
	   4'h5:	ep_bf_en = ep5_bf_en;
	   4'h6:	ep_bf_en = ep6_bf_en;
	   4'h7:	ep_bf_en = ep7_bf_en;
	endcase

always @(posedge clk_i)
	case(ep_sel)	// synopsys full_case parallel_case
	   4'h1:	ep_bf_size = ep1_bf_size;
	   4'h2:	ep_bf_size = ep2_bf_size;
	   4'h3:	ep_bf_size = ep3_bf_size;
	   4'h4:	ep_bf_size = ep4_bf_size;
	   4'h5:	ep_bf_size = ep5_bf_size;
	   4'h6:	ep_bf_size = ep6_bf_size;
	   4'h7:	ep_bf_size = ep7_bf_size;
	endcase

assign ep1_dout = rx_data_st;
assign ep2_dout = rx_data_st;
assign ep3_dout = rx_data_st;
assign ep4_dout = rx_data_st;
assign ep5_dout = rx_data_st;
assign ep6_dout = rx_data_st;
assign ep7_dout = rx_data_st;

assign ep0_re = idma_re & (ep_sel == 4'h00);
assign ep1_re = idma_re & (ep_sel == 4'h01) & !ep1_empty;
assign ep2_re = idma_re & (ep_sel == 4'h02) & !ep2_empty;
assign ep3_re = idma_re & (ep_sel == 4'h03) & !ep3_empty;
assign ep4_re = idma_re & (ep_sel == 4'h04) & !ep4_empty;
assign ep5_re = idma_re & (ep_sel == 4'h05) & !ep5_empty;
assign ep6_re = idma_re & (ep_sel == 4'h06) & !ep6_empty;
assign ep7_re = idma_re & (ep_sel == 4'h07) & !ep7_empty;

assign ep0_we = idma_we & (ep_sel == 4'h00);
assign ep1_we = idma_we & (ep_sel == 4'h01) & !ep1_full;
assign ep2_we = idma_we & (ep_sel == 4'h02) & !ep2_full;
assign ep3_we = idma_we & (ep_sel == 4'h03) & !ep3_full;
assign ep4_we = idma_we & (ep_sel == 4'h04) & !ep4_full;
assign ep5_we = idma_we & (ep_sel == 4'h05) & !ep5_full;
assign ep6_we = idma_we & (ep_sel == 4'h06) & !ep6_full;
assign ep7_we = idma_we & (ep_sel == 4'h07) & !ep7_full;

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  USB CRC16 Modules                                          ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_crc16.v,v 1.1.1.1 2002-09-19 12:07:39 rudi Exp $
//
//  $Date: 2002-09-19 12:07:39 $
//  $Revision: 1.1.1.1 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//
//
//
//
//
//
//                            

`include "usb1_defines.v"

///////////////////////////////////////////////////////////////////
//
// CRC16
//
///////////////////////////////////////////////////////////////////

module usb1_crc16(crc_in, din, crc_out);
input	[15:0]	crc_in;
input	[7:0]	din;
output	[15:0]	crc_out;

assign crc_out[0] =	din[7] ^ din[6] ^ din[5] ^ din[4] ^ din[3] ^
			din[2] ^ din[1] ^ din[0] ^ crc_in[8] ^ crc_in[9] ^
			crc_in[10] ^ crc_in[11] ^ crc_in[12] ^ crc_in[13] ^
			crc_in[14] ^ crc_in[15];
assign crc_out[1] =	din[7] ^ din[6] ^ din[5] ^ din[4] ^ din[3] ^ din[2] ^
			din[1] ^ crc_in[9] ^ crc_in[10] ^ crc_in[11] ^
			crc_in[12] ^ crc_in[13] ^ crc_in[14] ^ crc_in[15];
assign crc_out[2] =	din[1] ^ din[0] ^ crc_in[8] ^ crc_in[9];
assign crc_out[3] =	din[2] ^ din[1] ^ crc_in[9] ^ crc_in[10];
assign crc_out[4] =	din[3] ^ din[2] ^ crc_in[10] ^ crc_in[11];
assign crc_out[5] =	din[4] ^ din[3] ^ crc_in[11] ^ crc_in[12];
assign crc_out[6] =	din[5] ^ din[4] ^ crc_in[12] ^ crc_in[13];
assign crc_out[7] =	din[6] ^ din[5] ^ crc_in[13] ^ crc_in[14];
assign crc_out[8] =	din[7] ^ din[6] ^ crc_in[0] ^ crc_in[14] ^ crc_in[15];
assign crc_out[9] =	din[7] ^ crc_in[1] ^ crc_in[15];
assign crc_out[10] =	crc_in[2];
assign crc_out[11] =	crc_in[3];
assign crc_out[12] =	crc_in[4];
assign crc_out[13] =	crc_in[5];
assign crc_out[14] =	crc_in[6];
assign crc_out[15] =	din[7] ^ din[6] ^ din[5] ^ din[4] ^ din[3] ^ din[2] ^
			din[1] ^ din[0] ^ crc_in[7] ^ crc_in[8] ^ crc_in[9] ^
			crc_in[10] ^ crc_in[11] ^ crc_in[12] ^ crc_in[13] ^
			crc_in[14] ^ crc_in[15];

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  USB CRC5 Modules                                           ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_crc5.v,v 1.1.1.1 2002-09-19 12:07:05 rudi Exp $
//
//  $Date: 2002-09-19 12:07:05 $
//  $Revision: 1.1.1.1 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//
//
//
//
//
//
//                            

`include "usb1_defines.v"

///////////////////////////////////////////////////////////////////
//
// CRC5
//
///////////////////////////////////////////////////////////////////

module usb1_crc5(crc_in, din, crc_out);
input	[4:0]	crc_in;
input	[10:0]	din;
output	[4:0]	crc_out;

assign crc_out[0] =	din[10] ^ din[9] ^ din[6] ^ din[5] ^ din[3] ^
			din[0] ^ crc_in[0] ^ crc_in[3] ^ crc_in[4];

assign crc_out[1] =	din[10] ^ din[7] ^ din[6] ^ din[4] ^ din[1] ^
			crc_in[0] ^ crc_in[1] ^ crc_in[4];

assign crc_out[2] =	din[10] ^ din[9] ^ din[8] ^ din[7] ^ din[6] ^
			din[3] ^ din[2] ^ din[0] ^ crc_in[0] ^ crc_in[1] ^
			crc_in[2] ^ crc_in[3] ^ crc_in[4];

assign crc_out[3] =	din[10] ^ din[9] ^ din[8] ^ din[7] ^ din[4] ^ din[3] ^
			din[1] ^ crc_in[1] ^ crc_in[2] ^ crc_in[3] ^ crc_in[4];

assign crc_out[4] =	din[10] ^ din[9] ^ din[8] ^ din[5] ^ din[4] ^ din[2] ^
			crc_in[2] ^ crc_in[3] ^ crc_in[4];

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Internal Setup Engine                                      ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_ctrl.v,v 1.2 2002-09-25 06:06:49 rudi Exp $
//
//  $Date: 2002-09-25 06:06:49 $
//  $Revision: 1.2 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.1.1.1  2002/09/19 12:07:09  rudi
//               Initial Checkin
//
//
//
//
//
//

`include "usb1_defines.v"

module usb1_ctrl(	clk, rst,

			rom_adr, rom_data,

			ctrl_setup, ctrl_in, ctrl_out,

			ep0_din, ep0_dout, ep0_re, ep0_we, ep0_stat,
			ep0_size,

			send_stall, frame_no,
			funct_adr, configured, halt,

			v_set_int, v_set_feature, wValue, wIndex, vendor_data
		);

input		clk, rst;

output	[6:0]	rom_adr;
input	[7:0]	rom_data;

input		ctrl_setup;
input		ctrl_in;
input		ctrl_out;

input	[7:0]	ep0_din;
output	[7:0]	ep0_dout;
output		ep0_re, ep0_we;
input	[3:0]	ep0_stat;
output	[7:0]	ep0_size;

output		send_stall;
input	[10:0]	frame_no;
output	[6:0]	funct_adr;
output		configured, halt;

output		v_set_int;
output		v_set_feature;
output	[15:0]	wValue;
output	[15:0]	wIndex;
input	[15:0]	vendor_data;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

parameter	IDLE			=	20'b0000_0000_0000_0000_0001,
		GET_HDR			=	20'b0000_0000_0000_0000_0010,
		GET_STATUS_S		=	20'b0000_0000_0000_0000_0100,
		CLEAR_FEATURE_S		=	20'b0000_0000_0000_0000_1000,
		SET_FEATURE_S		=	20'b0000_0000_0000_0001_0000,
		SET_ADDRESS_S		=	20'b0000_0000_0000_0010_0000,
		GET_DESCRIPTOR_S	=	20'b0000_0000_0000_0100_0000,
		SET_DESCRIPTOR_S	=	20'b0000_0000_0000_1000_0000,
		GET_CONFIG_S		=	20'b0000_0000_0001_0000_0000,
		SET_CONFIG_S		=	20'b0000_0000_0010_0000_0000,
		GET_INTERFACE_S		=	20'b0000_0000_0100_0000_0000,
		SET_INTERFACE_S		=	20'b0000_0000_1000_0000_0000,
		SYNCH_FRAME_S		=	20'b0000_0001_0000_0000_0000,
		WAIT_IN_DATA		=	20'b0000_0010_0000_0000_0000,
		STATUS_IN		=	20'b0000_0100_0000_0000_0000,
		STATUS_OUT		=	20'b0000_1000_0000_0000_0000,
		V_SET_INT_S		=	20'b0001_0000_0000_0000_0000,
		V_GET_STATUS_S		=	20'b0010_0000_0000_0000_0000;


wire	[7:0]	bmReqType, bRequest;
wire	[15:0]	wValue, wIndex, wLength;
wire		bm_req_dir;
wire	[1:0]	bm_req_type;
wire	[4:0]	bm_req_recp;

reg		get_status, clear_feature, set_feature, set_address;
reg		get_descriptor, set_descriptor, get_config, set_config;
reg		get_interface, set_interface, synch_frame;
reg		hdr_done_r, config_err;
reg		v_set_int, v_set_feature, v_get_status;

wire		fifo_re1, fifo_full, fifo_empty;
reg		fifo_we_d;
reg	[4:0]	data_sel;
reg		ep0_we;
reg	[7:0]	ep0_dout;
reg	[7:0]	ep0_size;
reg		send_stall;
reg	[19:0]	state, next_state;
reg		get_hdr;
reg	[7:0]	le;
wire		hdr_done;
reg		adv;
reg	[7:0]	hdr0, hdr1, hdr2, hdr3, hdr4, hdr5, hdr6, hdr7;
reg	[6:0]	funct_adr;
reg		set_adr_pending;
reg	[6:0]	funct_adr_tmp;

reg		in_size_0;
reg		in_size_1;
reg		in_size_2;
wire		high_sel;
reg		write_done, write_done_r;

///////////////////////////////////////////////////////////////////
//
// FIFO interface
//

assign ep0_re = fifo_re1;
assign fifo_empty = ep0_stat[1];
assign fifo_full = ep0_stat[2];

///////////////////////////////////////////////////////////////////
//
// Current States
//
reg	addressed;
reg	configured;
reg	halt;
wire	clr_halt;
wire	set_halt=0;	// FIX_ME

// For this implementation we do not implement HALT for the
// device nor for any of the endpoints. This is useless for
// this device, but can be added here later ...
// FYI, we report device/endpoint errors via interrupts,
// instead of halting the entire or part of the device, much
// nicer for non-critical errors.

assign clr_halt = ctrl_setup;

always @(posedge clk)
	if(!rst)	addressed <= #1 1'b0;
	else
	if(set_address)	addressed <= #1 1'b1;

always @(posedge clk)
	if(!rst)	configured <= #1 1'b0;
	else
	if(set_config)	configured <= #1 1'b1;

always @(posedge clk)
	if(!rst)	halt <= #1 1'b0;
	else
	if(clr_halt)	halt <= #1 1'b0;
	else
	if(set_halt)	halt <= #1 1'b1;

///////////////////////////////////////////////////////////////////
//
// Descriptor ROM
//
reg	[6:0]	rom_adr;
reg		rom_sel, rom_sel_r;
wire		rom_done;
reg	[6:0]	rom_size;
reg		fifo_we_rom_r;
reg		fifo_we_rom_r2;
wire		fifo_we_rom;
reg	[7:0]	rom_start_d;
reg	[6:0]	rom_size_dd;
wire	[6:0]	rom_size_d;

always @(wValue)
	case(wValue[11:8])		// synopsys full_case parallel_case
	   4'h1:	rom_start_d = `ROM_START0;
	   4'h2:	rom_start_d = `ROM_START1;
	   4'h3:
		case(wValue[3:0])	// synopsys full_case parallel_case
		   4'h00:	rom_start_d = `ROM_START2A;
		   4'h01:	rom_start_d = `ROM_START2B;
		   4'h02:	rom_start_d = `ROM_START2C;
		   4'h03:	rom_start_d = `ROM_START2D;
		   default:	rom_start_d = `ROM_START2A;
		endcase
	   default:	rom_start_d = 7'h00;
	endcase

always @(wValue)
	case(wValue[11:8])		// synopsys full_case parallel_case
	   4'h1:	rom_size_dd = `ROM_SIZE0;
	   4'h2:	rom_size_dd = `ROM_SIZE1;
	   4'h3:
		case(wValue[3:0])	// synopsys full_case parallel_case
		   4'h00:	rom_size_dd = `ROM_SIZE2A;
		   4'h01:	rom_size_dd = `ROM_SIZE2B;
		   4'h02:	rom_size_dd = `ROM_SIZE2C;
		   4'h03:	rom_size_dd = `ROM_SIZE2D;
		   default:	rom_size_dd = `ROM_SIZE2A;
		endcase
	   default:	rom_size_dd = 7'h01;
	endcase

assign rom_size_d = (rom_size_dd > wLength[6:0]) ? wLength[6:0] : rom_size_dd;

always @(posedge clk)
	rom_sel_r <= #1 rom_sel;

always @(posedge clk)
	if(!rst)			rom_adr <= #1 7'h0;
	else
	if(rom_sel & !rom_sel_r)	rom_adr <= #1 rom_start_d;
	else
	if(rom_sel & !fifo_full)	rom_adr <= #1 rom_adr + 7'h1;

always @(posedge clk)
	if(!rst)			rom_size <= #1 7'h0;
	else
	if(rom_sel & !rom_sel_r)	rom_size <= #1 rom_size_d;
	else
	if(rom_sel & !fifo_full)	rom_size <= #1 rom_size - 7'h01;

always @(posedge clk)
	fifo_we_rom_r <= #1 rom_sel;

always @(posedge clk)
	fifo_we_rom_r2 <= #1 fifo_we_rom_r;

assign fifo_we_rom = rom_sel & fifo_we_rom_r2;

assign rom_done = (rom_size == 7'h0) & !(rom_sel & !rom_sel_r);

///////////////////////////////////////////////////////////////////
//
// Get Header
//

assign fifo_re1 = get_hdr & !fifo_empty;

always @(posedge clk)
	adv <= #1 get_hdr & !fifo_empty & !adv;

always @(posedge clk)
	if(!rst)	le <= #1 8'h0;
	else
	if(!get_hdr)	le <= #1 8'h0;
	else
	if(!(|le))	le <= #1 8'h1;
	else
	if(adv)		le <= #1 {le[6:0], 1'b0};

always @(posedge clk)
	if(le[0])	hdr0 <= #1 ep0_din;

always @(posedge clk)
	if(le[1])	hdr1 <= #1 ep0_din;

always @(posedge clk)
	if(le[2])	hdr2 <= #1 ep0_din;

always @(posedge clk)
	if(le[3])	hdr3 <= #1 ep0_din;

always @(posedge clk)
	if(le[4])	hdr4 <= #1 ep0_din;

always @(posedge clk)
	if(le[5])	hdr5 <= #1 ep0_din;

always @(posedge clk)
	if(le[6])	hdr6 <= #1 ep0_din;

always @(posedge clk)
	if(le[7])	hdr7 <= #1 ep0_din;

assign hdr_done = le[7] & adv;

///////////////////////////////////////////////////////////////////
//
// Send Data to Host
//
parameter	ZERO_DATA	=	5'b00001,
		ZERO_ONE_DATA	=	5'b00010,
		CONFIG_DATA	=	5'b00100,
		SYNC_FRAME_DATA	=	5'b01000,
		VEND_DATA	=	5'b10000;

assign high_sel = write_done_r;

always @(posedge clk)
	case(data_sel)		// synopsys full_case parallel_case
	   ZERO_DATA:		ep0_dout <= #1 rom_sel ? rom_data : 8'h0;
	   ZERO_ONE_DATA:	ep0_dout <= #1 high_sel ? 8'h1 : 8'h0;
	   CONFIG_DATA:		ep0_dout <= #1 {7'h0, configured};	// return configuration
	   SYNC_FRAME_DATA:	ep0_dout <= #1 high_sel ? {5'h0, frame_no[10:8]} : frame_no[7:0];
	   VEND_DATA:		ep0_dout <= #1 high_sel ? vendor_data[15:8] : vendor_data[7:0];
	endcase

always @(posedge clk)
	ep0_we <= #1 fifo_we_d | fifo_we_rom;

always @(posedge clk)
	if(in_size_0)	ep0_size <= #1 8'h0;
	else
	if(in_size_1)	ep0_size <= #1 8'h1;
	else
	if(in_size_2)	ep0_size <= #1 8'h2;
	else
	if(rom_sel)	ep0_size <= #1 {1'b0, rom_size_d};


always @(posedge clk)
	write_done_r <= #1 in_size_2 & !fifo_full & fifo_we_d &
				!write_done_r & !write_done;

always @(posedge clk)
	write_done <= #1 in_size_2 & !fifo_full & fifo_we_d &
				write_done_r & !write_done;

///////////////////////////////////////////////////////////////////
//
// Decode Header
//

// Valid bRequest Codes
parameter	GET_STATUS	=	8'h00,
		CLEAR_FEATURE	=	8'h01,
		SET_FEATURE	=	8'h03,
		SET_ADDRESS	=	8'h05,
		GET_DESCRIPTOR	=	8'h06,
		SET_DESCRIPTOR	=	8'h07,
		GET_CONFIG	=	8'h08,
		SET_CONFIG	=	8'h09,
		GET_INTERFACE	=	8'h0a,
		SET_INTERFACE	=	8'h0b,
		SYNCH_FRAME	=	8'h0c;

parameter	V_SET_INT	=	8'h0f;
		

assign bmReqType = hdr0;
assign bm_req_dir = bmReqType[7];	// 0-Host to device; 1-device to host 
assign bm_req_type = bmReqType[6:5];	// 0-standard; 1-class; 2-vendor; 3-RESERVED
assign bm_req_recp = bmReqType[4:0];	// 0-device; 1-interface; 2-endpoint; 3-other
					// 4..31-reserved
assign bRequest =  hdr1;
assign wValue   = {hdr3, hdr2};
assign wIndex   = {hdr5, hdr4};
assign wLength  = {hdr7, hdr6};

always @(posedge clk)
	hdr_done_r <= #1 hdr_done;

// Standard commands that MUST support
always @(posedge clk)
	get_status <= #1	hdr_done & (bRequest == GET_STATUS) &
								(bm_req_type==2'h0);

always @(posedge clk)
	clear_feature <= #1	hdr_done & (bRequest == CLEAR_FEATURE) &
								(bm_req_type==2'h0);

always @(posedge clk)
	set_feature <= #1	hdr_done & (bRequest == SET_FEATURE) &
								(bm_req_type==2'h0);

always @(posedge clk)
	set_address <= #1	hdr_done & (bRequest == SET_ADDRESS) &
								(bm_req_type==2'h0);

always @(posedge clk)
	get_descriptor <= #1	hdr_done & (bRequest == GET_DESCRIPTOR) &
								(bm_req_type==2'h0);

always @(posedge clk)
	set_descriptor <= #1	hdr_done & (bRequest == SET_DESCRIPTOR) &
								(bm_req_type==2'h0);

always @(posedge clk)
	get_config <= #1	hdr_done & (bRequest == GET_CONFIG) &
								(bm_req_type==2'h0);

always @(posedge clk)
	set_config <= #1	hdr_done & (bRequest == SET_CONFIG) &
								(bm_req_type==2'h0);

always @(posedge clk)
	get_interface <= #1	hdr_done & (bRequest == GET_INTERFACE) &
								(bm_req_type==2'h0);

always @(posedge clk)
	set_interface <= #1	hdr_done & (bRequest == SET_INTERFACE) &
								(bm_req_type==2'h0);

always @(posedge clk)
	synch_frame <= #1	hdr_done & (bRequest == SYNCH_FRAME) &
								(bm_req_type==2'h0);

always @(posedge clk)
	v_set_int <= #1		hdr_done & (bRequest == V_SET_INT) &
								(bm_req_type==2'h2);

always @(posedge clk)
	v_set_feature <= #1	hdr_done & (bRequest == SET_FEATURE) &
								(bm_req_type==2'h2);

always @(posedge clk)
	v_get_status <= #1	hdr_done & (bRequest == GET_STATUS) &
								(bm_req_type==2'h2);

// A config err must cause the device to send a STALL for an ACK
always @(posedge clk)
	config_err <= #1 hdr_done_r & !(get_status | clear_feature |
			set_feature | set_address | get_descriptor |
			set_descriptor | get_config | set_config |
			get_interface | set_interface | synch_frame |
			v_set_int | v_set_feature | v_get_status);

always @(posedge clk)
	send_stall <= #1 config_err;

///////////////////////////////////////////////////////////////////
//
// Set address
//

always @(posedge clk)
	if(!rst)				set_adr_pending <= #1 1'b0;
	else
	if(ctrl_in | ctrl_out | ctrl_setup)	set_adr_pending <= #1 1'b0;
	else
	if(set_address)				set_adr_pending <= #1 1'b1;

always @(posedge clk)
	if(!rst)			funct_adr_tmp <= #1 7'h0;
	else
	if(set_address)			funct_adr_tmp <= #1 wValue[6:0];

always @(posedge clk)
	if(!rst)			funct_adr <= #1 7'h0;
	else
	if(set_adr_pending & ctrl_in)	funct_adr <= #1 funct_adr_tmp;

///////////////////////////////////////////////////////////////////
//
// Main FSM
//

always @(posedge clk)
	if(!rst)	state <= #1 IDLE;
	else		state <= next_state;

always @(state or ctrl_setup or ctrl_in or ctrl_out or hdr_done or
	fifo_full or rom_done or write_done_r or wValue or bm_req_recp or
	get_status or clear_feature or set_feature or set_address or
	get_descriptor or set_descriptor or get_config or set_config or
	get_interface or set_interface or synch_frame or v_set_int or
	v_set_feature or v_get_status
	)
   begin
	next_state = state;
	get_hdr  = 1'b0;
	data_sel = ZERO_DATA;
	fifo_we_d = 1'b0;
	in_size_0 = 1'b0;
	in_size_1 = 1'b0;
	in_size_2 = 1'b0;
	rom_sel = 1'b0;

	case(state)	// synopsys full_case parallel_case

		// Wait for Setup token
	   IDLE:
		   begin
			if(ctrl_setup)		next_state = GET_HDR;
			if(get_status)		next_state = GET_STATUS_S;
			if(clear_feature)	next_state = CLEAR_FEATURE_S;
			if(set_feature)		next_state = SET_FEATURE_S;
			if(set_address)		next_state = SET_ADDRESS_S;
			if(get_descriptor)	next_state = GET_DESCRIPTOR_S;
			if(set_descriptor)	next_state = SET_DESCRIPTOR_S;
			if(get_config)		next_state = GET_CONFIG_S;
			if(set_config)		next_state = SET_CONFIG_S;
			if(get_interface)	next_state = GET_INTERFACE_S;
			if(set_interface)	next_state = SET_INTERFACE_S;
			if(synch_frame)		next_state = SYNCH_FRAME_S;
			if(v_set_int)		next_state = V_SET_INT_S;
			if(v_set_feature)	next_state = V_SET_INT_S;
			if(v_get_status)	next_state = V_GET_STATUS_S;
		   end

		// Retrieve Setup Header
	   GET_HDR:
		   begin
			get_hdr = 1'b1;
			if(hdr_done)	next_state = IDLE;
		   end


		// Actions for supported commands
	   GET_STATUS_S:
		   begin
			// Returns to host
			// 16'h0001 for device
			// 16'h0000 for interface
			// 16'h0000 for endpoint
			if(bm_req_recp == 5'h00)	data_sel = ZERO_ONE_DATA;
			else				data_sel = ZERO_DATA;

			in_size_2 = 1'b1;
			if(!fifo_full)
			   begin
				fifo_we_d = 1'b1;
				if(write_done_r)	next_state = WAIT_IN_DATA;
			   end

		   end
	   V_GET_STATUS_S:
		   begin
			data_sel = VEND_DATA;
			in_size_2 = 1'b1;
			if(!fifo_full)
			   begin
				fifo_we_d = 1'b1;
				if(write_done_r)	next_state = WAIT_IN_DATA;
			   end
		   end

	   CLEAR_FEATURE_S:
		   begin
			// just ignore this for now
			next_state = STATUS_IN;
		   end

	   SET_FEATURE_S:
		   begin
			// just ignore this for now
			next_state = STATUS_IN;
		   end

	   SET_ADDRESS_S:
		   begin
			// done elsewhere ....
			next_state = STATUS_IN;
		   end

	   GET_DESCRIPTOR_S:
		   begin
			if(	wValue[15:8] == 8'h01 |
				wValue[15:8] == 8'h02 | 
				wValue[15:8] == 8'h03	)
				rom_sel = 1'b1;
			else
				next_state = IDLE;

			if(rom_done)
				next_state = IDLE;
		   end

	   SET_DESCRIPTOR_S:
		   begin
			// This doesn't do anything since we do not support
			// setting the descriptor
			next_state = IDLE;
		   end

	   GET_CONFIG_S:
		   begin
			// Send one byte back that indicates current status
			in_size_1 = 1'b1;
			data_sel = CONFIG_DATA;
			if(!fifo_full)
			   begin
				fifo_we_d = 1'b1;
				next_state = WAIT_IN_DATA;
			   end
		   end

	   SET_CONFIG_S:
		   begin
			// done elsewhere ....
			next_state = STATUS_IN;
		   end

	   GET_INTERFACE_S:
		   begin
			// Return interface '0'
			in_size_1 = 1'b1;
			if(!fifo_full)
			   begin
				fifo_we_d = 1'b1;
				next_state = WAIT_IN_DATA;
			   end
		   end

	   SET_INTERFACE_S:
		   begin
			// just ignore this for now
			next_state = STATUS_IN;
		   end

	   SYNCH_FRAME_S:
		   begin
			// Return Frame current frame number
			data_sel = SYNC_FRAME_DATA;
			in_size_2 = 1'b1;
			if(!fifo_full)
			   begin
				fifo_we_d = 1'b1;
				if(write_done_r)	next_state = WAIT_IN_DATA;
			   end
		   end

	   V_SET_INT_S:
		   begin
			// done elsewhere ....
			next_state = STATUS_IN;
		   end

	   WAIT_IN_DATA:
		   begin
			if(ctrl_in)	next_state = STATUS_OUT;
		   end

	   STATUS_IN:
		   begin
			in_size_0 = 1'b1;
			if(ctrl_in)	next_state = IDLE;
		   end

	   STATUS_OUT:
		   begin
			if(ctrl_out)	next_state = IDLE;
		   end
	endcase
   end

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  USB 1.1 function defines file                              ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_defines.v,v 1.3 2002-09-25 06:06:49 rudi Exp $
//
//  $Date: 2002-09-25 06:06:49 $
//  $Revision: 1.3 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.2  2002/09/20 11:46:54  rudi
//               fixed a type 'define' was missing ...
//
//               Revision 1.1.1.1  2002/09/19 12:07:40  rudi
//               Initial Checkin
//
//
//
//
//
//
//
//

`include "timescale.v"

//`define USBF_DEBUG
//`define USBF_VERBOSE_DEBUG

// Enable or disable Block Frames
//`define USB1_BF_ENABLE

/////////////////////////////////////////////////////////////////////
//
// Items below this point should NOT be modified by the end user
// UNLESS you know exactly what you are doing !
// Modify at you own risk !!!
//
/////////////////////////////////////////////////////////////////////

`define	ROM_SIZE0	7'd018	// Device Descriptor Length
`define	ROM_SIZE1	7'd053	// Configuration Descriptor Length
`define	ROM_SIZE2A	7'd004	// Language ID Descriptor Start Length
`define	ROM_SIZE2B	7'd010	// String Descriptor Length
`define	ROM_SIZE2C	7'd010	// for future use
`define	ROM_SIZE2D	7'd010	// for future use

`define	ROM_START0	7'h00	// Device Descriptor Start Address
`define	ROM_START1	7'h12	// Configuration Descriptor Start Address
`define	ROM_START2A	7'h47	// Language ID Descriptor Start Address
`define	ROM_START2B	7'h50	// String Descriptor Start Address
`define	ROM_START2C	7'h60	// for future use
`define	ROM_START2D	7'h70	// for future use

// Endpoint Configuration Constants
`define IN	14'b00_001_000000000
`define OUT	14'b00_010_000000000
`define CTRL	14'b10_100_000000000
`define ISO	14'b01_000_000000000
`define BULK	14'b10_000_000000000
`define INT	14'b00_000_000000000

// PID Encodings
`define USBF_T_PID_OUT		4'b0001
`define USBF_T_PID_IN		4'b1001
`define USBF_T_PID_SOF		4'b0101
`define USBF_T_PID_SETUP	4'b1101
`define USBF_T_PID_DATA0	4'b0011
`define USBF_T_PID_DATA1	4'b1011
`define USBF_T_PID_DATA2	4'b0111
`define USBF_T_PID_MDATA	4'b1111
`define USBF_T_PID_ACK		4'b0010
`define USBF_T_PID_NACK		4'b1010
`define USBF_T_PID_STALL	4'b1110
`define USBF_T_PID_NYET		4'b0110
`define USBF_T_PID_PRE		4'b1100
`define USBF_T_PID_ERR		4'b1100
`define USBF_T_PID_SPLIT	4'b1000
`define USBF_T_PID_PING		4'b0100
`define USBF_T_PID_RES		4'b0000

// The HMS_DEL is a constant for the "Half Micro Second"
// Clock pulse generator. This constant specifies how many
// Phy clocks there are between two hms_clock pulses. This
// constant plus 2 represents the actual delay.
// Example: For a 60 Mhz (16.667 nS period) Phy Clock, the
// delay must be 30 phy clock: 500ns / 16.667nS = 30 clocks
`define USBF_HMS_DEL		5'h16

// After sending Data in response to an IN token from host, the
// host must reply with an ack. The host has 622nS in Full Speed
// mode and 400nS in High Speed mode to reply. RX_ACK_TO_VAL_FS
// and RX_ACK_TO_VAL_HS are the numbers of UTMI clock cycles
// minus 2 for Full and High Speed modes.
//`define USBF_RX_ACK_TO_VAL_FS	8'd36
`define USBF_RX_ACK_TO_VAL_FS	8'd200

// After sending a OUT token the host must send a data packet.
// The host has 622nS in Full Speed mode and 400nS in High Speed
// mode to send the data packet.
// TX_DATA_TO_VAL_FS and TX_DATA_TO_VAL_HS are is the numbers of
// UTMI clock cycles minus 2.
//`define USBF_TX_DATA_TO_VAL_FS	8'd36
`define USBF_TX_DATA_TO_VAL_FS	8'd200
/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Fast FIFO 2 entries deep                                   ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_fifo2.v,v 1.1.1.1 2002-09-19 12:07:31 rudi Exp $
//
//  $Date: 2002-09-19 12:07:31 $
//  $Revision: 1.1.1.1 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//
//
//
//
//

`include "timescale.v"

module usb1_fifo2(clk, rst, clr,  din, we, dout, re);

input		clk, rst;
input		clr;
input   [7:0]	din;
input		we;
output  [7:0]	dout;
input		re;


////////////////////////////////////////////////////////////////////
//
// Local Wires
//

reg     [7:0]	mem[0:1];
reg		wp;
reg		rp;

////////////////////////////////////////////////////////////////////
//
// Misc Logic
//

always @(posedge clk or negedge rst)
        if(!rst)	wp <= #1 1'h0;
        else
        if(clr)		wp <= #1 1'h0;
        else
        if(we)		wp <= #1 ~wp;

always @(posedge clk or negedge rst)
        if(!rst)	rp <= #1 1'h0;
        else
        if(clr)		rp <= #1 1'h0;
        else
        if(re)		rp <= #1 ~rp;

// Fifo Output
assign  dout = mem[ rp ];

// Fifo Input 
always @(posedge clk)
        if(we)     mem[ wp ] <= #1 din;

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Internal DMA Engine                                        ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_idma.v,v 1.2 2002-09-25 06:06:49 rudi Exp $
//
//  $Date: 2002-09-25 06:06:49 $
//  $Revision: 1.2 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.1.1.1  2002/09/19 12:07:38  rudi
//               Initial Checkin
//
//
//
//
//
//

`include "usb1_defines.v"

module usb1_idma(	clk, rst,

		// Packet Disassembler/Assembler interface
		rx_data_valid,
		rx_data_done, 
		send_data,
		rd_next,

		tx_valid,
		tx_data_st_i,
		tx_data_st_o,

		// Protocol Engine
		tx_dma_en, rx_dma_en, idma_done,
		ep_sel,

		// Register File Manager Interface
		size,
		rx_cnt, rx_done,
		tx_busy,

		// Block Frames
		ep_bf_en, ep_bf_size,
		dropped_frame, misaligned_frame,

		// Memory Arb interface
		mwe, mre, ep_empty, ep_empty_int, ep_full
		);


// Packet Disassembler/Assembler interface
input		clk, rst;
input		rx_data_valid;
input		rx_data_done;
output		send_data;
input		rd_next;

input		tx_valid;
input	[7:0]	tx_data_st_i;
output	[7:0]	tx_data_st_o;

// Protocol Engine
input		tx_dma_en;
input		rx_dma_en;
output		idma_done;	// DMA is done
input	[3:0]	ep_sel;

// Register File Manager Interface
input	[8:0]	size;		// MAX PL Size in bytes
output	[7:0]	rx_cnt;
output		rx_done;
output		tx_busy;

input		ep_bf_en;
input	[6:0]	ep_bf_size;
output		dropped_frame;
output		misaligned_frame;

// Memory Arb interface
output		mwe;
output		mre;
input		ep_empty;
output		ep_empty_int;
input		ep_full;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

reg		tx_dma_en_r;
reg	[8:0]	sizd_c;			// Internal size counter
wire		adr_incw;
wire		adr_incb;
wire		siz_dec;
wire		mwe;			// Memory Write enable
wire		mre;			// Memory Read enable
reg		mwe_r;
reg		sizd_is_zero;		// Indicates when all bytes have been
					// transferred
wire		sizd_is_zero_d;
reg		idma_done;		// DMA transfer is done
wire		send_data;		// Enable UTMI Transmitter
reg		rx_data_done_r;
reg		rx_data_valid_r;
wire		ff_re, ff_full, ff_empty;
reg		ff_we, ff_we1;
reg		tx_dma_en_r1;
reg		tx_dma_en_r2;
reg		tx_dma_en_r3;
reg		send_data_r;
wire		ff_clr;
reg	[7:0]	rx_cnt;
reg	[7:0]	rx_cnt_r;
reg		ep_empty_r;
reg		ep_empty_latched;
wire		ep_empty_int;
reg	[6:0]	ec;
wire		ec_clr;
reg		dropped_frame;
reg	[6:0]	rc_cnt;
wire		rc_clr;
reg		ep_full_latched;
wire		ep_full_int;
reg		misaligned_frame;
reg		tx_valid_r;
wire		tx_valid_e;

///////////////////////////////////////////////////////////////////
//
// For IN Block Frames transmit frames in [ep_bf_size] byte quantities
//

`ifdef USB1_BF_ENABLE

always @(posedge clk)
	if(!rst)		ec <= #1 7'h0;
	else
	if(!ep_bf_en | ec_clr)	ec <= #1 7'h0;
	else
	if(mre)			ec <= #1 ec + 7'h1;

assign ec_clr = (ec == ep_bf_size) | tx_dma_en; 

always @(posedge clk)
	if(!rst)	ep_empty_latched <= #1 1'b0;
	else
	if(ec_clr)	ep_empty_latched <= #1 ep_empty;

assign ep_empty_int = ep_bf_en ? ep_empty_latched : ep_empty;
`else
assign ep_empty_int = ep_empty;
`endif
///////////////////////////////////////////////////////////////////
//
// For OUT Block Frames always store in [ep_bf_size] byte chunks
// if fifo can't accept [ep_bf_size] bytes junk the entire [ep_bf_size]
// byte frame
//

`ifdef USB1_BF_ENABLE
always @(posedge clk)
	if(!rst)		rc_cnt <= #1 7'h0;
	else
	if(!ep_bf_en | rc_clr)	rc_cnt <= #1 7'h0;
	else
	if(mwe_r)		rc_cnt <= #1 rc_cnt + 7'h1;

assign rc_clr = ((rc_cnt == ep_bf_size) & mwe_r) | rx_dma_en; 

always @(posedge clk)
	if(!rst)	ep_full_latched <= #1 1'b0;
	else
	if(rc_clr)	ep_full_latched <= #1 ep_full;

assign ep_full_int = ep_bf_en ? ep_full_latched : ep_full;

always @(posedge clk)
	dropped_frame <= #1 rc_clr & ep_full & ep_bf_en;

always @(posedge clk)
	misaligned_frame <= #1 rx_data_done_r & ep_bf_en & (rc_cnt!=7'd00);
`else
assign ep_full_int = ep_full;

always @(posedge clk)
	dropped_frame <= #1 1'b0;

always @(posedge clk)
	misaligned_frame <= #1 1'b0;

`endif

// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
always @(posedge dropped_frame)
	$display("WARNING: BF: Droped one OUT frame (no space in FIFO) (%t)",$time);

always @(posedge misaligned_frame)
	$display("WARNING: BF: Received misaligned frame (%t)",$time);
`endif
// synopsys translate_on

///////////////////////////////////////////////////////////////////
//
// FIFO interface
//

always @(posedge clk)
	mwe_r <= #1 rx_data_valid;

assign mwe = mwe_r & !ep_full_int;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

always @(posedge clk)
	rx_data_valid_r <= #1 rx_data_valid;

always @(posedge clk)
	rx_data_done_r <= #1 rx_data_done;

// Generate one cycle pulses for tx and rx dma enable
always @(posedge clk)
	tx_dma_en_r <= #1 tx_dma_en;

always @(posedge clk)
	tx_dma_en_r1 <= tx_dma_en_r;

always @(posedge clk)
	tx_dma_en_r2 <= tx_dma_en_r1;

always @(posedge clk)
	tx_dma_en_r3 <= tx_dma_en_r2;

// DMA Done Indicator
always @(posedge clk)
	idma_done <= #1 (rx_data_done_r | sizd_is_zero_d | ep_empty_int);

///////////////////////////////////////////////////////////////////
//
// RX Size Counter
//

always @(posedge clk or negedge rst)
	if(!rst)			rx_cnt_r <= #1 8'h00;
	else
	if(rx_data_done_r)		rx_cnt_r <= #1 8'h00;
	else
	if(rx_data_valid)		rx_cnt_r <= #1 rx_cnt_r + 8'h01;

always @(posedge clk or negedge rst)
	if(!rst)		rx_cnt <= #1 8'h00;
	else
	if(rx_data_done_r)	rx_cnt <= #1 rx_cnt_r;

assign rx_done = rx_data_done_r;

///////////////////////////////////////////////////////////////////
//
// Transmit Size Counter (counting backward from input size)
// For MAX packet size
//

always @(posedge clk or negedge rst)
	if(!rst)			sizd_c <= #1 9'h1ff;
	else
	if(tx_dma_en)			sizd_c <= #1 size;
	else
	if(siz_dec)			sizd_c <= #1 sizd_c - 9'h1;

assign siz_dec = (tx_dma_en_r | tx_dma_en_r1 | rd_next) & !sizd_is_zero_d;

assign sizd_is_zero_d = sizd_c == 9'h0;

always @(posedge clk)
	sizd_is_zero <= #1 sizd_is_zero_d;

///////////////////////////////////////////////////////////////////
//
// TX Logic
//

assign tx_busy = send_data | tx_dma_en_r | tx_dma_en;

always @(posedge clk)
	tx_valid_r <= #1 tx_valid;

assign tx_valid_e = tx_valid_r & !tx_valid;

// Since we are prefetching two entries in to our fast fifo, we
// need to know when exactly ep_empty was asserted, as we might
// only need 1 or 2 bytes. This is for ep_empty_r

always @(posedge clk or negedge rst)
	if(!rst)				ep_empty_r <= #1 1'b0;
	else
	if(!tx_valid)				ep_empty_r <= #1 1'b0;
	else
	if(tx_dma_en_r2)			ep_empty_r <= #1 ep_empty_int;

always @(posedge clk or negedge rst)
	if(!rst)				send_data_r <= #1 1'b0;
	else
	if((tx_dma_en_r & !ep_empty_int))		send_data_r <= #1 1'b1;
	else
	if(rd_next & (sizd_is_zero_d | (ep_empty_int & !sizd_is_zero_d)) )
						send_data_r <= #1 1'b0;

assign send_data = (send_data_r & !ep_empty_r & 
		!(sizd_is_zero & size==9'h01)) | tx_dma_en_r1;

assign mre = (tx_dma_en_r1 | tx_dma_en_r | rd_next) &
		!sizd_is_zero_d & !ep_empty_int & (send_data | tx_dma_en_r1 | tx_dma_en_r);

always @(posedge clk)
	ff_we1 <= mre;

always @(posedge clk)
	ff_we <= ff_we1;

assign ff_re = rd_next;

assign ff_clr = !tx_valid;

///////////////////////////////////////////////////////////////////
//
// IDMA fast prefetch fifo
//

// tx fifo
usb1_fifo2 ff(
	.clk(		clk		),
	.rst(		rst		),
	.clr(		ff_clr		),
	.din(		tx_data_st_i	),
	.we(		ff_we		),
	.dout(		tx_data_st_o	),
	.re(		ff_re		)
	);

endmodule


/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Packet Assembler                                           ////
////  Assembles Token and Data USB packets                       ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_pa.v,v 1.1.1.1 2002-09-19 12:07:13 rudi Exp $
//
//  $Date: 2002-09-19 12:07:13 $
//  $Revision: 1.1.1.1 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//
//
//
//
//
//

`include "usb1_defines.v"

module usb1_pa(	clk, rst,

		// UTMI TX I/F
		tx_data, tx_valid, tx_valid_last, tx_ready,
		tx_first,

		// Protocol Engine Interface
		send_token, token_pid_sel,
		send_data, data_pid_sel,

		// IDMA Interface
		tx_data_st, rd_next,

		ep_empty
		);

input		clk, rst;

// UTMI TX Interface
output	[7:0]	tx_data;
output		tx_valid;
output		tx_valid_last;
input		tx_ready;
output		tx_first;

// Protocol Engine Interface
input		send_token;
input	[1:0]	token_pid_sel;
input		send_data;
input	[1:0]	data_pid_sel;

// IDMA Interface
input	[7:0]	tx_data_st;
output		rd_next;

input		ep_empty;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

parameter	[3:0]	// synopsys enum state
		IDLE   = 4'b0001,
		DATA   = 4'b0010,
		CRC1   = 4'b0100,
		CRC2   = 4'b1000;

reg	[3:0]	/* synopsys enum state */ state, next_state;
// synopsys state_vector state

reg		last;
reg		rd_next;

reg	[7:0]	token_pid, data_pid;	// PIDs from selectors
reg	[7:0]	tx_data_d;
reg	[7:0]	tx_data_data;
reg		dsel;
reg		tx_valid_d;
reg		send_token_r;
reg	[7:0]	tx_spec_data;
reg		crc_sel1, crc_sel2;
reg		tx_first_r;
reg		send_data_r;
wire		crc16_clr;
reg	[15:0]	crc16;
wire	[15:0]	crc16_next;
wire	[15:0]	crc16_rev;
reg		crc16_add;
reg		send_data_r2;
reg		tx_valid_r;
reg		tx_valid_r1;

wire		zero_length;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//
reg		zero_length_r;
assign		zero_length = ep_empty;

always @(posedge clk or negedge rst)
	if(!rst)	zero_length_r <= #1 1'b0;
	else
	if(last)	zero_length_r <= #1 1'b0;
	else
	if(crc16_clr)	zero_length_r <= #1 zero_length;

always @(posedge clk)
	tx_valid_r1 <= #1 tx_valid;

always @(posedge clk)
	tx_valid_r <= #1 tx_valid_r1;

always @(posedge clk or negedge rst)
	if(!rst)	send_token_r <= #1 1'b0;
	else
	if(send_token)	send_token_r <= #1 1'b1;
	else
	if(tx_ready)	send_token_r <= #1 1'b0;

// PID Select
always @(token_pid_sel)
	case(token_pid_sel)		// synopsys full_case parallel_case
	   2'd0: token_pid = {  ~`USBF_T_PID_ACK,   `USBF_T_PID_ACK};
	   2'd1: token_pid = { ~`USBF_T_PID_NACK,  `USBF_T_PID_NACK};
	   2'd2: token_pid = {~`USBF_T_PID_STALL, `USBF_T_PID_STALL};
	   2'd3: token_pid = { ~`USBF_T_PID_NYET,  `USBF_T_PID_NYET};
	endcase

always @(data_pid_sel)
	case(data_pid_sel)		// synopsys full_case parallel_case
	   2'd0: data_pid = { ~`USBF_T_PID_DATA0, `USBF_T_PID_DATA0};
	   2'd1: data_pid = { ~`USBF_T_PID_DATA1, `USBF_T_PID_DATA1};
	   2'd2: data_pid = { ~`USBF_T_PID_DATA2, `USBF_T_PID_DATA2};
	   2'd3: data_pid = { ~`USBF_T_PID_MDATA, `USBF_T_PID_MDATA};
	endcase

// Data path Muxes

always @(send_token or send_token_r or token_pid or tx_data_data)
	if(send_token | send_token_r)	tx_data_d = token_pid;
	else				tx_data_d = tx_data_data;

always @(dsel or tx_data_st or tx_spec_data)
	if(dsel)	tx_data_data = tx_spec_data;
	else		tx_data_data = tx_data_st;

always @(crc_sel1 or crc_sel2 or data_pid or crc16_rev)
	if(!crc_sel1 & !crc_sel2)	tx_spec_data = data_pid;
	else
	if(crc_sel1)			tx_spec_data = crc16_rev[15:8];	// CRC 1
	else				tx_spec_data = crc16_rev[7:0];	// CRC 2

assign tx_data = tx_data_d;

// TX Valid assignment
assign tx_valid_last = send_token | last;
assign tx_valid = tx_valid_d;

always @(posedge clk)
	tx_first_r <= #1 send_token | send_data;

assign tx_first = (send_token | send_data) & ! tx_first_r;

// CRC Logic
always @(posedge clk)
	send_data_r <= #1 send_data;

always @(posedge clk)
	send_data_r2 <= #1 send_data_r;

assign crc16_clr = send_data & !send_data_r;

always @(posedge clk)
	crc16_add <= #1 !zero_length_r &
			((send_data_r & !send_data_r2) | (rd_next & !crc_sel1));

always @(posedge clk)
	if(crc16_clr)		crc16 <= #1 16'hffff;
	else
	if(crc16_add)		crc16 <= #1 crc16_next;

usb1_crc16 u1(
	.crc_in(	crc16		),
	.din(	{tx_data_st[0], tx_data_st[1],
		tx_data_st[2], tx_data_st[3],
		tx_data_st[4], tx_data_st[5],
		tx_data_st[6], tx_data_st[7]}	),
	.crc_out(	crc16_next		) );

assign crc16_rev[15] = ~crc16[8];
assign crc16_rev[14] = ~crc16[9];
assign crc16_rev[13] = ~crc16[10];
assign crc16_rev[12] = ~crc16[11];
assign crc16_rev[11] = ~crc16[12];
assign crc16_rev[10] = ~crc16[13];
assign crc16_rev[9]  = ~crc16[14];
assign crc16_rev[8]  = ~crc16[15];
assign crc16_rev[7]  = ~crc16[0];
assign crc16_rev[6]  = ~crc16[1];
assign crc16_rev[5]  = ~crc16[2];
assign crc16_rev[4]  = ~crc16[3];
assign crc16_rev[3]  = ~crc16[4];
assign crc16_rev[2]  = ~crc16[5];
assign crc16_rev[1]  = ~crc16[6];
assign crc16_rev[0]  = ~crc16[7];

///////////////////////////////////////////////////////////////////
//
// Transmit/Encode state machine
//

always @(posedge clk or negedge rst)
	if(!rst)	state <= #1 IDLE;
	else		state <= #1 next_state;

always @(state or send_data or tx_ready or tx_valid_r or zero_length)
   begin
	next_state = state;	// Default don't change current state
	tx_valid_d = 1'b0;
	dsel = 1'b0;
	rd_next = 1'b0;
	last = 1'b0;
	crc_sel1 = 1'b0;
	crc_sel2 = 1'b0;
	case(state)		// synopsys full_case parallel_case
	   IDLE:
		   begin
			if(zero_length & send_data)
			   begin
				tx_valid_d = 1'b1;
				dsel = 1'b1;
				next_state = CRC1;
			   end
			else
			if(send_data)		// Send DATA packet
			   begin
				tx_valid_d = 1'b1;
				dsel = 1'b1;
				next_state = DATA;
			   end
		   end
	   DATA:
		   begin
			if(tx_ready & tx_valid_r)
				rd_next = 1'b1;

			tx_valid_d = 1'b1;
			if(!send_data & tx_ready & tx_valid_r)
			   begin
				dsel = 1'b1;
				crc_sel1 = 1'b1;
				next_state = CRC1;
			   end
		   end
	   CRC1:
		   begin
			dsel = 1'b1;
			tx_valid_d = 1'b1;
			if(tx_ready)
			   begin
				last = 1'b1;
				crc_sel2 = 1'b1;
				next_state = CRC2;
			   end
			else
			   begin
				tx_valid_d = 1'b1;
				crc_sel1 = 1'b1;
			   end

		   end
	   CRC2:
		   begin
			dsel = 1'b1;
			crc_sel2 = 1'b1;
			if(tx_ready)
			   begin
				next_state = IDLE;
			   end
			else
			   begin
				last = 1'b1;
			   end

		   end
	endcase
   end

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Packet Disassembler                                        ////
////  Disassembles Token and Data USB packets                    ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_pd.v,v 1.2 2002-09-25 06:06:49 rudi Exp $
//
//  $Date: 2002-09-25 06:06:49 $
//  $Revision: 1.2 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.1.1.1  2002/09/19 12:07:17  rudi
//               Initial Checkin
//
//
//
//
//
//
//
//

`include "usb1_defines.v"

module usb1_pd(	clk, rst,

		// UTMI RX I/F
		rx_data, rx_valid, rx_active, rx_err,

		// PID Information
		pid_OUT, pid_IN, pid_SOF, pid_SETUP,
		pid_DATA0, pid_DATA1, pid_DATA2, pid_MDATA,
		pid_ACK, pid_NACK, pid_STALL, pid_NYET,
		pid_PRE, pid_ERR, pid_SPLIT, pid_PING,
		pid_cks_err,

		// Token Information
		token_fadr, token_endp, token_valid, crc5_err,
		frame_no,

		// Receive Data Output
		rx_data_st, rx_data_valid, rx_data_done, crc16_err,

		// Misc.
		seq_err, rx_busy
		);

input		clk, rst;

		//UTMI RX Interface
input	[7:0]	rx_data;
input		rx_valid, rx_active, rx_err;

		// Decoded PIDs (used when token_valid is asserted)
output		pid_OUT, pid_IN, pid_SOF, pid_SETUP;
output		pid_DATA0, pid_DATA1, pid_DATA2, pid_MDATA;
output		pid_ACK, pid_NACK, pid_STALL, pid_NYET;
output		pid_PRE, pid_ERR, pid_SPLIT, pid_PING;
output		pid_cks_err;		// Indicates a PID checksum error


output	[6:0]	token_fadr;		// Function address from token
output	[3:0]	token_endp;		// Endpoint number from token
output		token_valid;		// Token is valid
output		crc5_err;		// Token crc5 error
output	[10:0]	frame_no;		// Frame number for SOF tokens

output	[7:0]	rx_data_st;		// Data to memory store unit
output		rx_data_valid;		// Data on rx_data_st is valid
output		rx_data_done;		// Indicates end of a transfer
output		crc16_err;		// Data packet CRC 16 error

output		seq_err;		// State Machine Sequence Error
output		rx_busy;		// Receivig Data Packet

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

parameter	[3:0]	// synopsys enum state
		IDLE   = 4'b0001,
		ACTIVE = 4'b0010,
		TOKEN  = 4'b0100,
		DATA   = 4'b1000;

reg	[3:0]	/* synopsys enum state */ state, next_state;
// synopsys state_vector state

reg	[7:0]	pid;			// Packet PDI
reg		pid_le_sm;		// PID Load enable from State Machine
wire		pid_ld_en;		// Enable loading of PID (all conditions)
wire		pid_cks_err;		// Indicates a pid checksum err

		// Decoded PID values
wire		pid_OUT, pid_IN, pid_SOF, pid_SETUP;
wire		pid_DATA0, pid_DATA1, pid_DATA2, pid_MDATA;
wire		pid_ACK, pid_NACK, pid_STALL, pid_NYET;
wire		pid_PRE, pid_ERR, pid_SPLIT, pid_PING, pid_RES;
wire		pid_TOKEN;		// All TOKEN packet that we recognize
wire		pid_DATA;		// All DATA packets that we recognize

reg	[7:0]	token0, token1;		// Token Registers
reg		token_le_1, token_le_2;	// Latch enables for token storage registers
wire	[4:0]	token_crc5;

reg	[7:0]	d0, d1, d2;		// Data path delay line (used to filter out crcs)
reg		data_valid_d;		// Data Valid output from State Machine
reg		data_done;		// Data cycle complete output from State Machine
reg		data_valid0; 		// Data valid delay line
reg		rxv1;
reg		rxv2;

reg		seq_err;		// State machine sequence error

reg		pid_ack;

reg		token_valid_r1;
reg		token_valid_str1, token_valid_str2;

reg		rx_active_r;

wire	[4:0]	crc5_out;
wire	[4:0]	crc5_out2;
wire		crc16_clr;
reg	[15:0]	crc16_sum;
wire	[15:0]	crc16_out;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

reg	rx_busy, rx_busy_d;

always @(posedge clk or negedge rst)
	if(!rst)			rx_busy_d <= #1 1'b0;
	else
	if(rx_valid & (state == DATA))	rx_busy_d <= #1 1'b1;
	else
	if(state != DATA)		rx_busy_d <= #1 1'b0;

always @(posedge clk)
	rx_busy <= #1 rx_busy_d;

// PID Decoding Logic
assign pid_ld_en = pid_le_sm & rx_active & rx_valid;

always @(posedge clk or negedge rst)
	if(!rst)		pid <= #1 8'hf0;
	else
	if(pid_ld_en)		pid <= #1 rx_data;

assign	pid_cks_err = (pid[3:0] != ~pid[7:4]);

assign	pid_OUT   = pid[3:0] == `USBF_T_PID_OUT;
assign	pid_IN    = pid[3:0] == `USBF_T_PID_IN;
assign	pid_SOF   = pid[3:0] == `USBF_T_PID_SOF;
assign	pid_SETUP = pid[3:0] == `USBF_T_PID_SETUP;
assign	pid_DATA0 = pid[3:0] == `USBF_T_PID_DATA0;
assign	pid_DATA1 = pid[3:0] == `USBF_T_PID_DATA1;
assign	pid_DATA2 = pid[3:0] == `USBF_T_PID_DATA2;
assign	pid_MDATA = pid[3:0] == `USBF_T_PID_MDATA;
assign	pid_ACK   = pid[3:0] == `USBF_T_PID_ACK;
assign	pid_NACK  = pid[3:0] == `USBF_T_PID_NACK;
assign	pid_STALL = pid[3:0] == `USBF_T_PID_STALL;
assign	pid_NYET  = pid[3:0] == `USBF_T_PID_NYET;
assign	pid_PRE   = pid[3:0] == `USBF_T_PID_PRE;
assign	pid_ERR   = pid[3:0] == `USBF_T_PID_ERR;
assign	pid_SPLIT = pid[3:0] == `USBF_T_PID_SPLIT;
assign	pid_PING  = pid[3:0] == `USBF_T_PID_PING;
assign	pid_RES   = pid[3:0] == `USBF_T_PID_RES;

assign	pid_TOKEN = pid_OUT | pid_IN | pid_SOF | pid_SETUP | pid_PING;
assign	pid_DATA = pid_DATA0 | pid_DATA1 | pid_DATA2 | pid_MDATA;

// Token Decoding LOGIC
always @(posedge clk)
	if(token_le_1)	token0 <= #1 rx_data;

always @(posedge clk)
	if(token_le_2)	token1 <= #1 rx_data;

always @(posedge clk)
	token_valid_r1 <= #1 token_le_2;

always @(posedge clk)
	token_valid_str1 <= #1 token_valid_r1 | pid_ack;

always @(posedge clk)
	token_valid_str2 <= #1 token_valid_str1;

assign token_valid = token_valid_str1;

// CRC 5 should perform the check in one cycle (flow through logic)
// 11 bits and crc5 input, 1 bit output
assign crc5_err = token_valid & (crc5_out2 != token_crc5);

usb1_crc5 u0(
	.crc_in(	5'h1f			),
	.din(	{	token_fadr[0],
			token_fadr[1],
			token_fadr[2],
			token_fadr[3],
			token_fadr[4],
			token_fadr[5],
			token_fadr[6],
			token_endp[0],
			token_endp[1],
			token_endp[2],
			token_endp[3]   }	),
	.crc_out(	crc5_out		) );

// Invert and reverse result bits
assign	crc5_out2 = ~{crc5_out[0], crc5_out[1], crc5_out[2], crc5_out[3],
			crc5_out[4]};

assign frame_no = { token1[2:0], token0};
assign token_fadr = token0[6:0];
assign token_endp = {token1[2:0], token0[7]};
assign token_crc5 = token1[7:3];

// Data receiving logic
// build a delay line and stop when we are about to get crc
always @(posedge clk or negedge rst)
	if(!rst)		rxv1 <= #1 1'b0;
	else
	if(data_valid_d)	rxv1 <= #1 1'b1;
	else
	if(data_done)		rxv1 <= #1 1'b0;

always @(posedge clk or negedge rst)
	if(!rst)		rxv2 <= #1 1'b0;
	else
	if(rxv1 & data_valid_d)	rxv2 <= #1 1'b1;
	else
	if(data_done)		rxv2 <= #1 1'b0;

always @(posedge clk)
	data_valid0 <= #1 rxv2 & data_valid_d;

always @(posedge clk)
   begin
	if(data_valid_d)	d0 <= #1 rx_data;
	if(data_valid_d)	d1 <= #1 d0;
	if(data_valid_d)	d2 <= #1 d1;
   end

assign rx_data_st = d2;
assign rx_data_valid = data_valid0;
assign rx_data_done = data_done;

// crc16 accumulates rx_data as long as data_valid_d is asserted.
// when data_done is asserted, crc16 reports status, and resets itself
// next cycle.
always @(posedge clk)
	rx_active_r <= #1 rx_active;

assign crc16_clr = rx_active & !rx_active_r;

always @(posedge clk)
	if(crc16_clr)		crc16_sum <= #1 16'hffff;
	else
	if(data_valid_d)	crc16_sum <= #1 crc16_out;

usb1_crc16 u1(
	.crc_in(	crc16_sum		),
	.din(	{rx_data[0], rx_data[1], rx_data[2], rx_data[3],
		rx_data[4], rx_data[5], rx_data[6], rx_data[7]}	),
	.crc_out(	crc16_out		) );

// Verify against polynomial 
assign crc16_err = data_done & (crc16_sum != 16'h800d);

///////////////////////////////////////////////////////////////////
//
// Receive/Decode State machine
//

always @(posedge clk or negedge rst)
	if(!rst)	state <= #1 IDLE;
	else		state <= #1 next_state;

always @(state or rx_valid or rx_active or rx_err or pid_ACK or pid_TOKEN
	or pid_DATA)
   begin
	next_state = state;	// Default don't change current state
	pid_le_sm = 1'b0;
	token_le_1 = 1'b0;
	token_le_2 = 1'b0;
	data_valid_d = 1'b0;
	data_done = 1'b0;
	seq_err = 1'b0;
	pid_ack = 1'b0;
	case(state)		// synopsys full_case parallel_case
	   IDLE:
		   begin
			pid_le_sm = 1'b1;
			if(rx_valid & rx_active)	next_state = ACTIVE;
		   end
	   ACTIVE:
		   begin
			// Received a ACK from Host
			if(pid_ACK & !rx_err)
			   begin
				pid_ack = 1'b1;
				if(!rx_active)	next_state = IDLE;
			   end
			else
			// Receiving a TOKEN
			if(pid_TOKEN & rx_valid & rx_active & !rx_err)
			   begin
				token_le_1 = 1'b1;
				next_state = TOKEN;
			   end
			else
			// Receiving DATA
			if(pid_DATA & rx_valid & rx_active & !rx_err)
			   begin
				data_valid_d = 1'b1;
				next_state = DATA;
			   end
			else
			if(	!rx_active | rx_err |
				(rx_valid & !(pid_TOKEN | pid_DATA)) )	// ERROR
			   begin
				seq_err = !rx_err;
				if(!rx_active)	next_state = IDLE;
			   end
		   end
	   TOKEN:
		   begin
			if(rx_valid & rx_active & !rx_err)
			   begin
				token_le_2 = 1'b1;
				next_state = IDLE;
			   end
			else
			if(!rx_active | rx_err)	// ERROR
			   begin
				seq_err = !rx_err;
				if(!rx_active)	next_state = IDLE;
			   end
		   end
	   DATA:
		   begin
			if(rx_valid & rx_active & !rx_err)	data_valid_d = 1'b1;
			if(!rx_active | rx_err)
			   begin
				data_done = 1'b1;
				if(!rx_active)	next_state = IDLE;
			   end
		   end
		
	endcase
   end

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Protocol Engine                                            ////
////  Performs automatic protocol functions                      ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_pe.v,v 1.1.1.1 2002-09-19 12:07:24 rudi Exp $
//
//  $Date: 2002-09-19 12:07:24 $
//  $Revision: 1.1.1.1 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//
//
//
//
//
//

`include "usb1_defines.v"

module usb1_pe(	clk, rst,

		// UTMI Interfaces
		tx_valid, rx_active,

		// PID Information
		pid_OUT, pid_IN, pid_SOF, pid_SETUP,
		pid_DATA0, pid_DATA1, pid_DATA2, pid_MDATA,
		pid_ACK, pid_PING,

		// Token Information
		token_valid, 

		// Receive Data Output
		rx_data_done, crc16_err,

		// Packet Assembler Interface
		send_token, token_pid_sel,
		data_pid_sel,

		// IDMA Interface
		rx_dma_en, tx_dma_en,
		abort,
		idma_done,

		// Register File Interface

		fsel,
		ep_sel, match, nse_err,
		ep_full, ep_empty,

		int_upid_set, int_crc16_set, int_to_set, int_seqerr_set,
		csr,
		send_stall

		);

input		clk, rst;
input		tx_valid, rx_active;

// Packet Disassembler Interface
		// Decoded PIDs (used when token_valid is asserted)
input		pid_OUT, pid_IN, pid_SOF, pid_SETUP;
input		pid_DATA0, pid_DATA1, pid_DATA2, pid_MDATA;
input		pid_ACK, pid_PING;

input		token_valid;		// Token is valid

input		rx_data_done;		// Indicates end of a transfer
input		crc16_err;		// Data packet CRC 16 error

// Packet Assembler Interface
output		send_token;
output	[1:0]	token_pid_sel;
output	[1:0]	data_pid_sel;

// IDMA Interface
output		rx_dma_en;	// Allows the data to be stored
output		tx_dma_en;	// Allows for data to be retrieved
output		abort;		// Abort Transfer (time_out, crc_err or rx_error)
input		idma_done;	// DMA is done indicator

input		ep_full;	// Indicates the endpoints fifo is full
input		ep_empty;	// Indicates the endpoints fifo is empty

// Register File interface
input		fsel;		// This function is selected
input	[3:0]	ep_sel;		// Endpoint Number Input
input		match;		// Endpoint Matched
output		nse_err;	// no such endpoint error

output		int_upid_set;	// Set unsupported PID interrupt
output		int_crc16_set;	// Set CRC16 error interrupt
output		int_to_set;	// Set time out interrupt
output		int_seqerr_set;	// Set PID sequence error interrupt

input	[13:0]	csr;		// Internal CSR Output

input		send_stall;	// Force sending a STALL during setup


///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

// tx token decoding
parameter	ACK   = 0,
		NACK  = 1,
		STALL = 2,
		NYET  = 3;

// State decoding
parameter	[9:0]	// synopsys enum state
		IDLE	= 10'b000000_0001,
		TOKEN	= 10'b000000_0010,
		IN	= 10'b000000_0100,
		IN2	= 10'b000000_1000,
		OUT	= 10'b000001_0000,
		OUT2A	= 10'b000010_0000,
		OUT2B	= 10'b000100_0000,
		UPDATEW	= 10'b001000_0000,
		UPDATE	= 10'b010000_0000,
		UPDATE2	= 10'b100000_0000;

reg	[1:0]	token_pid_sel;
reg	[1:0]	token_pid_sel_d;
reg		send_token;
reg		send_token_d;
reg		rx_dma_en, tx_dma_en;
reg		int_seqerr_set_d;
reg		int_seqerr_set;
reg		int_upid_set;

reg		match_r;

// Endpoint Decoding
wire		IN_ep, OUT_ep, CTRL_ep;		// Endpoint Types
wire		txfr_iso, txfr_bulk, txfr_int;	// Transfer Types

reg	[1:0]	uc_dpd;

// Buffer checks
reg	[9:0]	/* synopsys enum state */ state, next_state;
// synopsys state_vector state

// PID next and current decoders
reg	[1:0]	next_dpid;
reg	[1:0]	this_dpid;
reg		pid_seq_err;
wire	[1:0]	tr_fr_d;

wire	[13:0]	size_next;
wire		buf_smaller;

// After sending Data in response to an IN token from host, the
// host must reply with an ack. The host has XXXnS to reply.
// "rx_ack_to" indicates when this time has expired.
// rx_ack_to_clr, clears the timer
reg		rx_ack_to_clr;
reg		rx_ack_to_clr_d;
reg		rx_ack_to;
reg	[7:0]	rx_ack_to_cnt;

// After sending a OUT token the host must send a data packet.
// The host has XX nS to send the packet. "tx_data_to" indicates
// when this time has expired.
// tx_data_to_clr, clears the timer
wire		tx_data_to_clr;
reg		tx_data_to;
reg	[7:0]	tx_data_to_cnt;

wire	[7:0]	rx_ack_to_val, tx_data_to_val;


wire	[1:0]	next_bsel;
reg		uc_stat_set_d;
reg		uc_dpd_set;

reg		in_token;
reg		out_token;
reg		setup_token;

wire		in_op, out_op;	// Indicate a IN or OUT operation

reg	[1:0]	allow_pid;

reg		nse_err;
reg		abort;

wire	[1:0]	ep_type, txfr_type;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

// Endpoint/CSR Decoding
assign IN_ep   = csr[9];
assign OUT_ep  = csr[10];
assign CTRL_ep = csr[11];

assign txfr_iso  = csr[12];
assign txfr_bulk = csr[13];
assign txfr_int = !csr[12] & !csr[13];

assign ep_type = csr[10:9];
assign txfr_type = csr[13:12];

always @(posedge clk)
	match_r <= #1 match  & fsel;

// No Such Endpoint Indicator
always @(posedge clk)
	nse_err <= #1 token_valid & (pid_OUT | pid_IN | pid_SETUP) & !match;

always @(posedge clk)
	send_token <= #1 send_token_d;

always @(posedge clk)
	token_pid_sel <= #1 token_pid_sel_d;

///////////////////////////////////////////////////////////////////
//
// Data Pid Storage
//

reg	[1:0]	ep0_dpid, ep1_dpid, ep2_dpid, ep3_dpid;
reg	[1:0]	ep4_dpid, ep5_dpid, ep6_dpid, ep7_dpid;

always @(posedge clk or negedge rst)
	if(!rst)				ep0_dpid <= 2'b00;
	else
	if(uc_dpd_set & (ep_sel == 4'h0))	ep0_dpid <= next_dpid;

always @(posedge clk or negedge rst)
	if(!rst)				ep1_dpid <= 2'b00;
	else
	if(uc_dpd_set & (ep_sel == 4'h1))	ep1_dpid <= next_dpid;

always @(posedge clk or negedge rst)
	if(!rst)				ep2_dpid <= 2'b00;
	else
	if(uc_dpd_set & (ep_sel == 4'h2))	ep2_dpid <= next_dpid;

always @(posedge clk or negedge rst)
	if(!rst)				ep3_dpid <= 2'b00;
	else
	if(uc_dpd_set & (ep_sel == 4'h3))	ep3_dpid <= next_dpid;

always @(posedge clk or negedge rst)
	if(!rst)				ep4_dpid <= 2'b00;
	else
	if(uc_dpd_set & (ep_sel == 4'h4))	ep4_dpid <= next_dpid;

always @(posedge clk or negedge rst)
	if(!rst)				ep5_dpid <= 2'b00;
	else
	if(uc_dpd_set & (ep_sel == 4'h5))	ep5_dpid <= next_dpid;

always @(posedge clk or negedge rst)
	if(!rst)				ep6_dpid <= 2'b00;
	else
	if(uc_dpd_set & (ep_sel == 4'h6))	ep6_dpid <= next_dpid;

always @(posedge clk or negedge rst)
	if(!rst)				ep7_dpid <= 2'b00;
	else
	if(uc_dpd_set & (ep_sel == 4'h7))	ep7_dpid <= next_dpid;

always @(posedge clk)
	case(ep_sel)
	   4'h0: uc_dpd <= ep0_dpid;
	   4'h1: uc_dpd <= ep1_dpid;
	   4'h2: uc_dpd <= ep2_dpid;
	   4'h3: uc_dpd <= ep3_dpid;
	   4'h4: uc_dpd <= ep4_dpid;
	   4'h5: uc_dpd <= ep5_dpid;
	   4'h6: uc_dpd <= ep6_dpid;
	   4'h7: uc_dpd <= ep7_dpid;
	endcase

///////////////////////////////////////////////////////////////////
//
// Data Pid Sequencer
//

assign tr_fr_d = 2'h0;

always @(posedge clk)	// tr/mf:ep/type:tr/type:last dpd
	casex({tr_fr_d,ep_type,txfr_type,uc_dpd})	// synopsys full_case parallel_case
	   8'b0?_01_01_??: next_dpid <= #1 2'b00;	// ISO txfr. IN, 1 tr/mf

	   8'b10_01_01_?0: next_dpid <= #1 2'b01;	// ISO txfr. IN, 2 tr/mf
	   8'b10_01_01_?1: next_dpid <= #1 2'b00;	// ISO txfr. IN, 2 tr/mf

	   8'b11_01_01_00: next_dpid <= #1 2'b01;	// ISO txfr. IN, 3 tr/mf
	   8'b11_01_01_01: next_dpid <= #1 2'b10;	// ISO txfr. IN, 3 tr/mf
	   8'b11_01_01_10: next_dpid <= #1 2'b00;	// ISO txfr. IN, 3 tr/mf

	   8'b0?_10_01_??: next_dpid <= #1 2'b00;	// ISO txfr. OUT, 1 tr/mf

	   8'b10_10_01_??: 				// ISO txfr. OUT, 2 tr/mf
			   begin	// Resynchronize in case of PID error
				case({pid_MDATA, pid_DATA1})	// synopsys full_case parallel_case
				  2'b10: next_dpid <= #1 2'b01;
				  2'b01: next_dpid <= #1 2'b00;
				endcase
			   end

	   8'b11_10_01_00: 				// ISO txfr. OUT, 3 tr/mf
			   begin	// Resynchronize in case of PID error
				case({pid_MDATA, pid_DATA2})	// synopsys full_case parallel_case
				  2'b10: next_dpid <= #1 2'b01;
				  2'b01: next_dpid <= #1 2'b00;
				endcase
			   end
	   8'b11_10_01_01: 				// ISO txfr. OUT, 3 tr/mf
			   begin	// Resynchronize in case of PID error
				case({pid_MDATA, pid_DATA2})	// synopsys full_case parallel_case
				  2'b10: next_dpid <= #1 2'b10;
				  2'b01: next_dpid <= #1 2'b00;
				endcase
			   end
	   8'b11_10_01_10: 				// ISO txfr. OUT, 3 tr/mf
			   begin	// Resynchronize in case of PID error
				case({pid_MDATA, pid_DATA2})	// synopsys full_case parallel_case
				  2'b10: next_dpid <= #1 2'b01;
				  2'b01: next_dpid <= #1 2'b00;
				endcase
			   end

	   8'b??_01_00_?0,				// IN/OUT endpoint only
	   8'b??_10_00_?0: next_dpid <= #1 2'b01;	// INT transfers

	   8'b??_01_00_?1,				// IN/OUT endpoint only
	   8'b??_10_00_?1: next_dpid <= #1 2'b00;	// INT transfers

	   8'b??_01_10_?0,				// IN/OUT endpoint only
	   8'b??_10_10_?0: next_dpid <= #1 2'b01;	// BULK transfers

	   8'b??_01_10_?1,				// IN/OUT endpoint only
	   8'b??_10_10_?1: next_dpid <= #1 2'b00;	// BULK transfers

	   8'b??_00_??_??:				// CTRL Endpoint
		casex({setup_token, in_op, out_op, uc_dpd})	// synopsys full_case parallel_case
		   5'b1_??_??: next_dpid <= #1 2'b11;	// SETUP operation
		   5'b0_10_0?: next_dpid <= #1 2'b11;	// IN operation
		   5'b0_10_1?: next_dpid <= #1 2'b01;	// IN operation
		   5'b0_01_?0: next_dpid <= #1 2'b11;	// OUT operation
		   5'b0_01_?1: next_dpid <= #1 2'b10;	// OUT operation
		endcase

	endcase

// Current PID decoder

// Allow any PID for ISO. transfers when mode full speed or tr_fr is zero
always @(pid_DATA0 or pid_DATA1 or pid_DATA2 or pid_MDATA)
	case({pid_DATA0, pid_DATA1, pid_DATA2, pid_MDATA} ) // synopsys full_case parallel_case
	   4'b1000: allow_pid = 2'b00;
	   4'b0100: allow_pid = 2'b01;
	   4'b0010: allow_pid = 2'b10;
	   4'b0001: allow_pid = 2'b11;
	endcase

always @(posedge clk)	// tf/mf:ep/type:tr/type:last dpd
	casex({tr_fr_d,ep_type,txfr_type,uc_dpd})	// synopsys full_case parallel_case
	   8'b0?_01_01_??: this_dpid <= #1 2'b00;	// ISO txfr. IN, 1 tr/mf

	   8'b10_01_01_?0: this_dpid <= #1 2'b01;	// ISO txfr. IN, 2 tr/mf
	   8'b10_01_01_?1: this_dpid <= #1 2'b00;	// ISO txfr. IN, 2 tr/mf

	   8'b11_01_01_00: this_dpid <= #1 2'b10;	// ISO txfr. IN, 3 tr/mf
	   8'b11_01_01_01: this_dpid <= #1 2'b01;	// ISO txfr. IN, 3 tr/mf
	   8'b11_01_01_10: this_dpid <= #1 2'b00;	// ISO txfr. IN, 3 tr/mf

	   8'b00_10_01_??: this_dpid <= #1 allow_pid;	// ISO txfr. OUT, 0 tr/mf
	   8'b01_10_01_??: this_dpid <= #1 2'b00;	// ISO txfr. OUT, 1 tr/mf

	   8'b10_10_01_?0: this_dpid <= #1 2'b11;	// ISO txfr. OUT, 2 tr/mf
	   8'b10_10_01_?1: this_dpid <= #1 2'b01;	// ISO txfr. OUT, 2 tr/mf

	   8'b11_10_01_00: this_dpid <= #1 2'b11;	// ISO txfr. OUT, 3 tr/mf
	   8'b11_10_01_01: this_dpid <= #1 2'b11;	// ISO txfr. OUT, 3 tr/mf
	   8'b11_10_01_10: this_dpid <= #1 2'b10;	// ISO txfr. OUT, 3 tr/mf

	   8'b??_01_00_?0,				// IN/OUT endpoint only
	   8'b??_10_00_?0: this_dpid <= #1 2'b00;	// INT transfers
	   8'b??_01_00_?1,				// IN/OUT endpoint only
	   8'b??_10_00_?1: this_dpid <= #1 2'b01;	// INT transfers

	   8'b??_01_10_?0,				// IN/OUT endpoint only
	   8'b??_10_10_?0: this_dpid <= #1 2'b00;	// BULK transfers
	   8'b??_01_10_?1,				// IN/OUT endpoint only
	   8'b??_10_10_?1: this_dpid <= #1 2'b01;	// BULK transfers

	   8'b??_00_??_??:				// CTRL Endpoint
		casex({setup_token,in_op, out_op, uc_dpd})	// synopsys full_case parallel_case
		   5'b1_??_??: this_dpid <= #1 2'b00;	// SETUP operation
		   5'b0_10_0?: this_dpid <= #1 2'b00;	// IN operation
		   5'b0_10_1?: this_dpid <= #1 2'b01;	// IN operation
		   5'b0_01_?0: this_dpid <= #1 2'b00;	// OUT operation
		   5'b0_01_?1: this_dpid <= #1 2'b01;	// OUT operation
		endcase
	endcase

// Assign PID for outgoing packets
assign data_pid_sel = this_dpid;

// Verify PID for incoming data packets
always @(posedge clk)
	pid_seq_err <= #1 !(	(this_dpid==2'b00 & pid_DATA0) |
				(this_dpid==2'b01 & pid_DATA1) |
				(this_dpid==2'b10 & pid_DATA2) |
				(this_dpid==2'b11 & pid_MDATA)	);

///////////////////////////////////////////////////////////////////
//
// IDMA Setup & src/dst buffer select
//

// For Control endpoints things are different:
// buffer0 is used for OUT (incoming) data packets
// buffer1 is used for IN (outgoing) data packets

// Keep track of last token for control endpoints
always @(posedge clk or negedge rst)
	if(!rst)		in_token <= #1 1'b0;
	else
	if(pid_IN)		in_token <= #1 1'b1;
	else
	if(pid_OUT | pid_SETUP)	in_token <= #1 1'b0;

always @(posedge clk or negedge rst)
	if(!rst)		out_token <= #1 1'b0;
	else
	if(pid_OUT | pid_SETUP)	out_token <= #1 1'b1;
	else
	if(pid_IN)		out_token <= #1 1'b0;

always @(posedge clk or negedge rst)
	if(!rst)		setup_token <= #1 1'b0;
	else
	if(pid_SETUP)		setup_token <= #1 1'b1;
	else
	if(pid_OUT | pid_IN)	setup_token <= #1 1'b0;

// Indicates if we are performing an IN operation
assign	in_op = IN_ep | (CTRL_ep & in_token);

// Indicates if we are performing an OUT operation
assign	out_op = OUT_ep | (CTRL_ep & out_token);


///////////////////////////////////////////////////////////////////
//
// Determine if packet is to small or to large
// This is used to NACK and ignore packet for OUT endpoints
//


///////////////////////////////////////////////////////////////////
//
// Register File Update Logic
//

always @(posedge clk)
	uc_dpd_set <= #1 uc_stat_set_d;

// Abort signal
always @(posedge clk)
	abort <= #1 match & fsel & (state != IDLE);

///////////////////////////////////////////////////////////////////
//
// TIME OUT TIMERS
//

// After sending Data in response to an IN token from host, the
// host must reply with an ack. The host has 622nS in Full Speed
// mode and 400nS in High Speed mode to reply.
// "rx_ack_to" indicates when this time has expired.
// rx_ack_to_clr, clears the timer

always @(posedge clk)
	rx_ack_to_clr <= #1 tx_valid | rx_ack_to_clr_d;

always @(posedge clk)
	if(rx_ack_to_clr)	rx_ack_to_cnt <= #1 8'h0;
	else			rx_ack_to_cnt <= #1 rx_ack_to_cnt + 8'h1;

always @(posedge clk)
	rx_ack_to <= #1 (rx_ack_to_cnt == rx_ack_to_val);

assign rx_ack_to_val = `USBF_RX_ACK_TO_VAL_FS;

// After sending a OUT token the host must send a data packet.
// The host has 622nS in Full Speed mode and 400nS in High Speed
// mode to send the data packet.
// "tx_data_to" indicates when this time has expired.
// "tx_data_to_clr" clears the timer

assign	tx_data_to_clr = rx_active;

always @(posedge clk)
	if(tx_data_to_clr)	tx_data_to_cnt <= #1 8'h0;
	else			tx_data_to_cnt <= #1 tx_data_to_cnt + 8'h1;

always @(posedge clk)
	tx_data_to <= #1 (tx_data_to_cnt == tx_data_to_val);

assign tx_data_to_val = `USBF_TX_DATA_TO_VAL_FS;

///////////////////////////////////////////////////////////////////
//
// Interrupts
//
reg	pid_OUT_r, pid_IN_r, pid_PING_r, pid_SETUP_r;

always @(posedge clk)
	pid_OUT_r <= #1 pid_OUT;

always @(posedge clk)
	pid_IN_r <= #1 pid_IN;

always @(posedge clk)
	pid_PING_r <= #1 pid_PING;

always @(posedge clk)
	pid_SETUP_r <= #1 pid_SETUP;

always @(posedge clk)
	int_upid_set <= #1 match_r & !pid_SOF & (
				( OUT_ep & !(pid_OUT_r | pid_PING_r))		|
				(  IN_ep &  !pid_IN_r)				|
				(CTRL_ep & !(pid_IN_r | pid_OUT_r | pid_PING_r | pid_SETUP_r))
					);


assign int_to_set  = ((state == IN2) & rx_ack_to) | ((state == OUT) & tx_data_to);

assign int_crc16_set = rx_data_done & crc16_err;

always @(posedge clk)
	int_seqerr_set <= #1 int_seqerr_set_d;

reg	send_stall_r;

always @(posedge clk or negedge rst)
	if(!rst)	send_stall_r <= #1 1'b0;
	else
	if(send_stall)	send_stall_r <= #1 1'b1;
	else	
	if(send_token)	send_stall_r <= #1 1'b0;

///////////////////////////////////////////////////////////////////
//
// Main Protocol State Machine
//

always @(posedge clk or negedge rst)
	if(!rst)	state <= #1 IDLE;
	else
	if(match)	state <= #1 IDLE;
	else		state <= #1 next_state;

always @(state or 
	pid_seq_err or idma_done or ep_full or ep_empty or
	token_valid or pid_ACK or rx_data_done or
	tx_data_to or crc16_err or 
	rx_ack_to or pid_PING or txfr_iso or txfr_int or
	CTRL_ep or pid_IN or pid_OUT or IN_ep or OUT_ep or pid_SETUP or pid_SOF
	or match_r or abort or send_stall_r
	)
   begin
	next_state = state;
	token_pid_sel_d = ACK;
	send_token_d = 1'b0;
	rx_dma_en = 1'b0;
	tx_dma_en = 1'b0;
	uc_stat_set_d = 1'b0;
	rx_ack_to_clr_d = 1'b1;
	int_seqerr_set_d = 1'b0;

	case(state)	// synopsys full_case parallel_case
	   IDLE:
		   begin
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state IDLE (%t)", $time);
`endif
`ifdef USBF_DEBUG
		if(rst & match_r & !pid_SOF)
		begin
		if(match_r === 1'bx)	$display("ERROR: IDLE: match_r is unknown. (%t)", $time);
		if(pid_SOF === 1'bx)	$display("ERROR: IDLE: pid_SOF is unknown. (%t)", $time);
		if(CTRL_ep === 1'bx)	$display("ERROR: IDLE: CTRL_ep is unknown. (%t)", $time);
		if(pid_IN === 1'bx)	$display("ERROR: IDLE: pid_IN is unknown. (%t)", $time);
		if(pid_OUT === 1'bx)	$display("ERROR: IDLE: pid_OUT is unknown. (%t)", $time);
		if(pid_SETUP === 1'bx)	$display("ERROR: IDLE: pid_SETUP is unknown. (%t)", $time);
		if(pid_PING === 1'bx)	$display("ERROR: IDLE: pid_PING is unknown. (%t)", $time);
		if(IN_ep === 1'bx)	$display("ERROR: IDLE: IN_ep is unknown. (%t)", $time);
		if(OUT_ep === 1'bx)	$display("ERROR: IDLE: OUT_ep is unknown. (%t)", $time);
		end
`endif
// synopsys translate_on

			if(match_r & !pid_SOF)
			   begin
/*
				if(ep_stall)		// Halt Forced send STALL
				   begin
					token_pid_sel_d = STALL;
					send_token_d = 1'b1;
					next_state = TOKEN;
				   end
				else
*/
				if(IN_ep | (CTRL_ep & pid_IN))
				   begin
					if(txfr_int & ep_empty)
					   begin
						token_pid_sel_d = NACK;
						send_token_d = 1'b1;
						next_state = TOKEN;
					   end
					else
					   begin
						tx_dma_en = 1'b1;
						next_state = IN;
					   end
				   end
				else
				if(OUT_ep | (CTRL_ep & (pid_OUT | pid_SETUP)))
				   begin
					rx_dma_en = 1'b1;
					next_state = OUT;
				   end
			   end
		   end

	   TOKEN:
		   begin
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state TOKEN (%t)", $time);
`endif
// synopsys translate_on
			next_state = IDLE;
		   end

	   IN:
		   begin
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state IN (%t)", $time);
`endif
`ifdef USBF_DEBUG
		if(idma_done === 1'bx)	$display("ERROR: IN: idma_done is unknown. (%t)", $time);
		if(txfr_iso === 1'bx)	$display("ERROR: IN: txfr_iso is unknown. (%t)", $time);
`endif
// synopsys translate_on
			rx_ack_to_clr_d = 1'b0;
			if(idma_done)
			   begin
				if(txfr_iso)	next_state = UPDATE;
				else		next_state = IN2;
			   end

		   end
	   IN2:
		   begin
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state IN2 (%t)", $time);
`endif
`ifdef USBF_DEBUG
		if(rx_ack_to === 1'bx)	$display("ERROR: IN2: rx_ack_to is unknown. (%t)", $time);
		if(token_valid === 1'bx)$display("ERROR: IN2: token_valid is unknown. (%t)", $time);
		if(pid_ACK === 1'bx)	$display("ERROR: IN2: pid_ACK is unknown. (%t)", $time);
`endif
// synopsys translate_on
			rx_ack_to_clr_d = 1'b0;
			// Wait for ACK from HOST or Timeout
			if(rx_ack_to)	next_state = IDLE;
			else
			if(token_valid & pid_ACK)
			   begin
				next_state = UPDATE;
			   end
		   end

	   OUT:
		   begin
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state OUT (%t)", $time);
`endif
`ifdef USBF_DEBUG
		if(tx_data_to === 1'bx)	$display("ERROR: OUT: tx_data_to is unknown. (%t)", $time);
		if(crc16_err === 1'bx)	$display("ERROR: OUT: crc16_err is unknown. (%t)", $time);
		if(abort === 1'bx)	$display("ERROR: OUT: abort is unknown. (%t)", $time);
		if(rx_data_done === 1'bx)$display("ERROR: OUT: rx_data_done is unknown. (%t)", $time);
		if(txfr_iso === 1'bx)	$display("ERROR: OUT: txfr_iso is unknown. (%t)", $time);
		if(pid_seq_err === 1'bx)$display("ERROR: OUT: rx_data_done is unknown. (%t)", $time);
`endif
// synopsys translate_on
			if(tx_data_to | crc16_err | abort )
				next_state = IDLE;
			else
			if(rx_data_done)
			   begin		// Send Ack
				if(txfr_iso)
				   begin
					if(pid_seq_err)		int_seqerr_set_d = 1'b1;
					next_state = UPDATEW;
				   end
				else		next_state = OUT2A;
			   end
		   end

	   OUT2B:
		   begin	// This is a delay State to NACK to small or to
				// large packets. this state could be skipped
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state OUT2B (%t)", $time);
`endif
`ifdef USBF_DEBUG
		if(abort === 1'bx)	$display("ERROR: OUT2A: abort is unknown. (%t)", $time);
`endif
// synopsys translate_on
			if(abort)	next_state = IDLE;
			else		next_state = OUT2B;
		   end
	   OUT2A:
		   begin	// Send ACK/NACK/NYET
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state OUT2A (%t)", $time);
`endif
`ifdef USBF_DEBUG
		if(abort === 1'bx)	$display("ERROR: OUT2A: abort is unknown. (%t)", $time);
		if(pid_seq_err === 1'bx)$display("ERROR: OUT2A: rx_data_done is unknown. (%t)", $time);
`endif
// synopsys translate_on
			if(abort)	next_state = IDLE;
			else

			if(send_stall_r)
			   begin
				token_pid_sel_d = STALL;
				send_token_d = 1'b1;
				next_state = IDLE;
			   end
			else
			if(ep_full)
			   begin
				token_pid_sel_d = NACK;
				send_token_d = 1'b1;
				next_state = IDLE;
			   end
			else
			   begin
				token_pid_sel_d = ACK;
				send_token_d = 1'b1;
				if(pid_seq_err)	next_state = IDLE;
				else		next_state = UPDATE;
			   end
		   end

	   UPDATEW:
		   begin
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state UPDATEW (%t)", $time);
`endif
// synopsys translate_on
			next_state = UPDATE;
		   end

	   UPDATE:
		   begin
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state UPDATE (%t)", $time);
`endif
// synopsys translate_on
			uc_stat_set_d = 1'b1;
			next_state = IDLE;
		   end
	endcase
   end

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Protocol Layer                                             ////
////  This block is typically referred to as the SEI in USB      ////
////  Specification. It encapsulates the Packet Assembler,       ////
////  disassembler, protocol engine and internal DMA             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_fucnt/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_pl.v,v 1.2 2002-09-25 06:06:49 rudi Exp $
//
//  $Date: 2002-09-25 06:06:49 $
//  $Revision: 1.2 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.1.1.1  2002/09/19 12:07:28  rudi
//               Initial Checkin
//
//
//
//
//
//
//
//
//

module usb1_pl(	clk, rst,

		// UTMI Interface
		rx_data, rx_valid, rx_active, rx_err,
		tx_data, tx_valid, tx_valid_last, tx_ready,
		tx_first, tx_valid_out,

		token_valid,

		// Register File Interface
		fa,
		ep_sel, 
		x_busy,
		int_crc16_set, int_to_set, int_seqerr_set,

		// Misc
		frm_nat,
		pid_cs_err, nse_err,
		crc5_err,
		rx_size, rx_done,
		ctrl_setup, ctrl_in, ctrl_out,

		// Block Frames
		ep_bf_en, ep_bf_size,
		dropped_frame, misaligned_frame,

		// EP Interface
		csr,
		tx_data_st, rx_data_st, idma_re, idma_we,
		ep_empty, ep_full, send_stall

		);

// UTMI Interface
input		clk, rst;
input	[7:0]	rx_data;
input		rx_valid, rx_active, rx_err;
output	[7:0]	tx_data;
output		tx_valid;
output		tx_valid_last;
input		tx_ready;
output		tx_first;
input		tx_valid_out;

output		token_valid;

// Register File interface
input	[6:0]	fa;		// Function Address (as set by the controller)
output	[3:0]	ep_sel;		// Endpoint Number Input
output		x_busy;		// Indicates USB is busy

output		int_crc16_set;	// Set CRC16 error interrupt
output		int_to_set;	// Set time out interrupt
output		int_seqerr_set;	// Set PID sequence error interrupt

// Misc
output		pid_cs_err;	// pid checksum error
output		crc5_err;	// crc5 error
output	[31:0]	frm_nat;
output		nse_err;	// no such endpoint error
output	[7:0]	rx_size;
output		rx_done;
output		ctrl_setup;
output		ctrl_in;
output		ctrl_out;
input		ep_bf_en;
input	[6:0]	ep_bf_size;
output		dropped_frame, misaligned_frame;

// Endpoint Interfaces
input	[13:0]	csr;	
input	[7:0]	tx_data_st;
output	[7:0]	rx_data_st;
output		idma_re, idma_we;
input		ep_empty;
input		ep_full;

input		send_stall;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

// Packet Disassembler Interface
wire		clk, rst;
wire	[7:0]	rx_data;
wire		pid_OUT, pid_IN, pid_SOF, pid_SETUP;
wire		pid_DATA0, pid_DATA1, pid_DATA2, pid_MDATA;
wire		pid_ACK, pid_NACK, pid_STALL, pid_NYET;
wire		pid_PRE, pid_ERR, pid_SPLIT, pid_PING;
wire	[6:0]	token_fadr;
wire		token_valid;
wire		crc5_err;
wire	[10:0]	frame_no;
reg	[7:0]	rx_data_st;
wire	[7:0]	rx_data_st_d;
wire		rx_data_valid;
wire		rx_data_done;
wire		crc16_err;
wire		rx_seq_err;

// Packet Assembler Interface
wire		send_token;
wire	[1:0]	token_pid_sel;
wire		send_data;
wire	[1:0]	data_pid_sel;
wire	[7:0]	tx_data_st;
wire	[7:0]	tx_data_st_o;
wire		rd_next;

// IDMA Interface
wire		rx_dma_en;	// Allows the data to be stored
wire		tx_dma_en;	// Allows for data to be retrieved
wire		abort;		// Abort Transfer (time_out, crc_err or rx_error)
wire		idma_done;	// DMA is done

// Memory Arbiter Interface
wire		idma_we;
wire		idma_re;

// Local signals
wire		pid_bad;

reg		hms_clk;	// 0.5 Micro Second Clock
reg	[4:0]	hms_cnt;
reg	[10:0]	frame_no_r;	// Current Frame Number register
wire		frame_no_we;
reg	[11:0]	sof_time;	// Time since last sof
reg		clr_sof_time;
wire		fsel;		// This Function is selected
wire		match_o;

reg		frame_no_we_r;
reg		ctrl_setup;
reg		ctrl_in;
reg		ctrl_out;

wire		idma_we_d;
wire		ep_empty_int;
wire		rx_busy;
wire		tx_busy;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

assign x_busy = tx_busy | rx_busy;

// PIDs we should never receive
assign pid_bad = pid_ACK | pid_NACK | pid_STALL | pid_NYET | pid_PRE |
			pid_ERR | pid_SPLIT |  pid_PING;

assign match_o = !pid_bad & token_valid & !crc5_err;

// Receiving Setup
always @(posedge clk)
	ctrl_setup <= #1 token_valid & pid_SETUP & (ep_sel==4'h0);

always @(posedge clk)
	ctrl_in <= #1 token_valid & pid_IN & (ep_sel==4'h0);

always @(posedge clk)
	ctrl_out <= #1 token_valid & pid_OUT & (ep_sel==4'h0);

// Frame Number (from SOF token)
assign frame_no_we = token_valid & !crc5_err & pid_SOF;

always @(posedge clk)
	frame_no_we_r <= #1 frame_no_we;

always @(posedge clk or negedge rst)
	if(!rst)		frame_no_r <= #1 11'h0;
	else
	if(frame_no_we_r)	frame_no_r <= #1 frame_no;

//SOF delay counter
always @(posedge clk)
	clr_sof_time <= #1 frame_no_we;

always @(posedge clk)
	if(clr_sof_time)	sof_time <= #1 12'h0;
	else
	if(hms_clk)		sof_time <= #1 sof_time + 12'h1;

assign frm_nat = {4'h0, 1'b0, frame_no_r, 4'h0, sof_time};

// 0.5 Micro Seconds Clock Generator
always @(posedge clk or negedge rst)
	if(!rst)				hms_cnt <= #1 5'h0;
	else
	if(hms_clk | frame_no_we_r)		hms_cnt <= #1 5'h0;
	else					hms_cnt <= #1 hms_cnt + 5'h1;

always @(posedge clk)
	hms_clk <= #1 (hms_cnt == `USBF_HMS_DEL);

always @(posedge clk)
	rx_data_st <= rx_data_st_d;

///////////////////////////////////////////////////////////////////

// This function is addressed
assign fsel = (token_fadr == fa);

// Only write when we are addressed !!!
assign idma_we = idma_we_d & fsel; // moved full check to idma ...  & !ep_full;

///////////////////////////////////////////////////////////////////
//
// Module Instantiations
//

//Packet Decoder
usb1_pd	u0(	.clk(		clk		),
		.rst(		rst		),

		.rx_data(	rx_data		),
		.rx_valid(	rx_valid	),
		.rx_active(	rx_active	),
		.rx_err(	rx_err		),
		.pid_OUT(	pid_OUT		),
		.pid_IN(	pid_IN		),
		.pid_SOF(	pid_SOF		),
		.pid_SETUP(	pid_SETUP	),
		.pid_DATA0(	pid_DATA0	),
		.pid_DATA1(	pid_DATA1	),
		.pid_DATA2(	pid_DATA2	),
		.pid_MDATA(	pid_MDATA	),
		.pid_ACK(	pid_ACK		),
		.pid_NACK(	pid_NACK	),
		.pid_STALL(	pid_STALL	),
		.pid_NYET(	pid_NYET	),
		.pid_PRE(	pid_PRE		),
		.pid_ERR(	pid_ERR		),
		.pid_SPLIT(	pid_SPLIT	),
		.pid_PING(	pid_PING	),
		.pid_cks_err(	pid_cs_err	),
		.token_fadr(	token_fadr	),
		.token_endp(	ep_sel		),
		.token_valid(	token_valid	),
		.crc5_err(	crc5_err	),
		.frame_no(	frame_no	),
		.rx_data_st(	rx_data_st_d	),
		.rx_data_valid(	rx_data_valid	),
		.rx_data_done(	rx_data_done	),
		.crc16_err(	crc16_err	),
		.seq_err(	rx_seq_err	),
		.rx_busy(	rx_busy		)
		);

// Packet Assembler
usb1_pa	u1(	.clk(		clk		),
		.rst(		rst		),
		.tx_data(	tx_data		),
		.tx_valid(	tx_valid	),
		.tx_valid_last(	tx_valid_last	),
		.tx_ready(	tx_ready	),
		.tx_first(	tx_first	),
		.send_token(	send_token	),
		.token_pid_sel(	token_pid_sel	),
		.send_data(	send_data	),
		.data_pid_sel(	data_pid_sel	),
		.tx_data_st(	tx_data_st_o	),
		.rd_next(	rd_next		),
		.ep_empty(	ep_empty_int)
		);

// Internal DMA / Memory Arbiter Interface
usb1_idma
	u2(	.clk(		clk		),
		.rst(		rst		),

		.tx_valid(	tx_valid	),
		.rx_data_valid(	rx_data_valid	),
		.rx_data_done(	rx_data_done	),
		.send_data(	send_data	),
		.rd_next(	rd_next		),

		.tx_data_st_i(	tx_data_st	),
		.tx_data_st_o(	tx_data_st_o	),
		.ep_sel(	ep_sel		),

		.ep_bf_en(	ep_bf_en	),
		.ep_bf_size(	ep_bf_size	),
		.dropped_frame(dropped_frame	),
		.misaligned_frame(misaligned_frame),

		.tx_busy(	tx_busy		),

		.tx_dma_en(	tx_dma_en	),
		.rx_dma_en(	rx_dma_en	),
		.idma_done(	idma_done	),
		.size(		csr[8:0]	),
		.rx_cnt(	rx_size		),
		.rx_done(	rx_done		),
		.mwe(		idma_we_d	),
		.mre(		idma_re		),
		.ep_empty(	ep_empty	),
		.ep_empty_int(	ep_empty_int	),
		.ep_full(	ep_full		)
		);

// Protocol Engine
usb1_pe
	u3(	.clk(			clk			),
		.rst(			rst			),

		.tx_valid(		tx_valid_out		),
		.rx_active(		rx_active		),
		.pid_OUT(		pid_OUT			),
		.pid_IN(		pid_IN			),
		.pid_SOF(		pid_SOF			),
		.pid_SETUP(		pid_SETUP		),
		.pid_DATA0(		pid_DATA0		),
		.pid_DATA1(		pid_DATA1		),
		.pid_DATA2(		pid_DATA2		),
		.pid_MDATA(		pid_MDATA		),
		.pid_ACK(		pid_ACK			),
		.pid_PING(		pid_PING		),
		.token_valid(		token_valid		),
		.rx_data_done(		rx_data_done		),
		.crc16_err(		crc16_err		),
		.send_token(		send_token		),
		.token_pid_sel(		token_pid_sel		),
		.data_pid_sel(		data_pid_sel		),
		.rx_dma_en(		rx_dma_en		),
		.tx_dma_en(		tx_dma_en		),
		.abort(			abort			),
		.idma_done(		idma_done		),
		.fsel(			fsel			),
		.ep_sel(		ep_sel			),
		.ep_full(		ep_full			),
		.ep_empty(		ep_empty		),
		.match(			match_o			),
		.nse_err(		nse_err			),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.csr(			csr			),
		.send_stall(		send_stall		)
		);

endmodule
/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Descriptor ROM                                             ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_rom1.v,v 1.1.1.1 2002-09-19 12:07:29 rudi Exp $
//
//  $Date: 2002-09-19 12:07:29 $
//  $Revision: 1.1.1.1 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//
//
//
//
//

`include "usb1_defines.v"

module usb1_rom1(clk, adr, dout);
input		clk;
input	[6:0]	adr;
output	[7:0]	dout;

reg	[7:0]	dout;

always @(posedge clk)
	case(adr)	// synopsys full_case parallel_case

		// ====================================
		// =====    DEVICE Descriptor     =====
		// ====================================

	   7'h00:	dout <= #1 8'd18;	// this descriptor length
	   7'h01:	dout <= #1 8'h01;	// descriptor type
	   7'h02:	dout <= #1 8'h00;	// USB version low byte
	   7'h03:	dout <= #1 8'h01;	// USB version high byte
	   7'h04:	dout <= #1 8'hff;	// device class
	   7'h05:	dout <= #1 8'h00;	// device sub class
	   7'h06:	dout <= #1 8'hff;	// device protocol
	   7'h07:	dout <= #1 8'd64;	// max packet size
	   7'h08:	dout <= #1 8'h34;	// vendor ID low byte
	   7'h09:	dout <= #1 8'h12;	// vendor ID high byte
	   7'h0a:	dout <= #1 8'h78;	// product ID low byte
	   7'h0b:	dout <= #1 8'h56;	// product ID high byte
	   7'h0c:	dout <= #1 8'h10;	// device rel. number low byte
	   7'h0d:	dout <= #1 8'h00;	// device rel. number high byte
	   7'h0e:	dout <= #1 8'h00;	// Manufacturer String Index
	   7'h0f:	dout <= #1 8'h00;	// Product Descr. String Index
	   7'h10:	dout <= #1 8'h00;	// S/N String Index
	   7'h11:	dout <= #1 8'h01;	// Number of possible config.

		// ====================================
		// ===== Configuration Descriptor =====
		// ====================================
	   7'h12:	dout <= #1 8'h09;	// this descriptor length
	   7'h13:	dout <= #1 8'h02;	// descriptor type
	   7'h14:	dout <= #1 8'd53;	// total data length low byte
	   7'h15:	dout <= #1 8'd00;	// total data length high byte
	   7'h16:	dout <= #1 8'h01;	// number of interfaces
	   7'h17:	dout <= #1 8'h01;	// number of configurations
	   7'h18:	dout <= #1 8'h00;	// Conf. String Index
	   7'h19:	dout <= #1 8'h40;	// Config. Characteristics
	   7'h1a:	dout <= #1 8'h00;	// Max. Power Consumption

		// ====================================
		// =====   Interface Descriptor   =====
		// ====================================
	   7'h1b:	dout <= #1 8'h09;	// this descriptor length
	   7'h1c:	dout <= #1 8'h04;	// descriptor type
	   7'h1d:	dout <= #1 8'h00;	// interface number
	   7'h1e:	dout <= #1 8'h00;	// alternate setting
	   7'h1f:	dout <= #1 8'h05;	// number of endpoints
	   7'h20:	dout <= #1 8'hff;	// interface class
	   7'h21:	dout <= #1 8'h01;	// interface sub class
	   7'h22:	dout <= #1 8'hff;	// interface protocol
	   7'h23:	dout <= #1 8'h00;	// interface string index

		// ====================================
		// =====   Endpoint 1 Descriptor  =====
		// ====================================
	   7'h24:	dout <= #1 8'h07;	// this descriptor length
	   7'h25:	dout <= #1 8'h05;	// descriptor type
	   7'h26:	dout <= #1 8'h81;	// endpoint address
	   7'h27:	dout <= #1 8'h01;	// endpoint attributes
	   7'h28:	dout <= #1 8'h00;	// max packet size low byte
	   7'h29:	dout <= #1 8'h01;	// max packet size high byte
	   7'h2a:	dout <= #1 8'h01;	// polling interval

		// ====================================
		// =====   Endpoint 2 Descriptor  =====
		// ====================================
	   7'h2b:	dout <= #1 8'h07;	// this descriptor length
	   7'h2c:	dout <= #1 8'h05;	// descriptor type
	   7'h2d:	dout <= #1 8'h02;	// endpoint address
	   7'h2e:	dout <= #1 8'h01;	// endpoint attributes
	   7'h2f:	dout <= #1 8'h00;	// max packet size low byte
	   7'h30:	dout <= #1 8'h01;	// max packet size high byte
	   7'h31:	dout <= #1 8'h01;	// polling interval

		// ====================================
		// =====   Endpoint 3 Descriptor  =====
		// ====================================
	   7'h32:	dout <= #1 8'h07;	// this descriptor length
	   7'h33:	dout <= #1 8'h05;	// descriptor type
	   7'h34:	dout <= #1 8'h83;	// endpoint address
	   7'h35:	dout <= #1 8'h02;	// endpoint attributes
	   7'h36:	dout <= #1 8'd64;	// max packet size low byte
	   7'h37:	dout <= #1 8'd00;	// max packet size high byte
	   7'h38:	dout <= #1 8'h01;	// polling interval

		// ====================================
		// =====   Endpoint 4 Descriptor  =====
		// ====================================
	   7'h39:	dout <= #1 8'h07;	// this descriptor length
	   7'h3a:	dout <= #1 8'h05;	// descriptor type
	   7'h3b:	dout <= #1 8'h04;	// endpoint address
	   7'h3c:	dout <= #1 8'h02;	// endpoint attributes
	   7'h3d:	dout <= #1 8'd64;	// max packet size low byte
	   7'h3e:	dout <= #1 8'd00;	// max packet size high byte
	   7'h3f:	dout <= #1 8'h01;	// polling interval

		// ====================================
		// =====   Endpoint 5 Descriptor  =====
		// ====================================
	   7'h40:	dout <= #1 8'h07;	// this descriptor length
	   7'h41:	dout <= #1 8'h05;	// descriptor type
	   7'h42:	dout <= #1 8'h85;	// endpoint address
	   7'h43:	dout <= #1 8'h03;	// endpoint attributes
	   7'h44:	dout <= #1 8'd64;	// max packet size low byte
	   7'h45:	dout <= #1 8'd00;	// max packet size high byte
	   7'h46:	dout <= #1 8'h01;	// polling interval

/*
		// ====================================
		// ===== String Descriptor Lang ID=====
		// ====================================

	   7'h47:	dout <= #1 8'd06;	// this descriptor length
	   7'h48:	dout <= #1 8'd03;	// descriptor type

	   7'h49:	dout <= #1 8'd09;	// Language ID 0 low byte
	   7'h4a:	dout <= #1 8'd04;	// Language ID 0 high byte

	   7'h4b:	dout <= #1 8'd09;	// Language ID 1 low byte
	   7'h4c:	dout <= #1 8'd04;	// Language ID 1 high byte

	   7'h4d:	dout <= #1 8'd09;	// Language ID 2 low byte
	   7'h4e:	dout <= #1 8'd04;	// Language ID 2 high byte

		// ====================================
		// =====   String Descriptor 0    =====
		// ====================================

	   7'h50:	dout <= #1 8'd010;	// this descriptor length
	   7'h51:	dout <= #1 8'd03;	// descriptor type
	   7'h52:	dout <= #1 "0";
	   7'h53:	dout <= #1 " ";
	   7'h54:	dout <= #1 "g";
	   7'h55:	dout <= #1 "n";
	   7'h56:	dout <= #1 "i";
	   7'h57:	dout <= #1 "r";
	   7'h58:	dout <= #1 "t";
	   7'h59:	dout <= #1 "S";

		// ====================================
		// =====   String Descriptor 1    =====
		// ====================================

	   7'h60:	dout <= #1 8'd010;	// this descriptor length
	   7'h61:	dout <= #1 8'd03;	// descriptor type
	   7'h62:	dout <= #1 "1";
	   7'h63:	dout <= #1 " ";
	   7'h64:	dout <= #1 "g";
	   7'h65:	dout <= #1 "n";
	   7'h66:	dout <= #1 "i";
	   7'h67:	dout <= #1 "r";
	   7'h68:	dout <= #1 "t";
	   7'h69:	dout <= #1 "S";

		// ====================================
		// =====   String Descriptor 2    =====
		// ====================================

	   7'h70:	dout <= #1 8'd010;	// this descriptor length
	   7'h71:	dout <= #1 8'd03;	// descriptor type
	   7'h72:	dout <= #1 "2";
	   7'h73:	dout <= #1 " ";
	   7'h74:	dout <= #1 "g";
	   7'h75:	dout <= #1 "n";
	   7'h76:	dout <= #1 "i";
	   7'h77:	dout <= #1 "r";
	   7'h78:	dout <= #1 "t";
	   7'h79:	dout <= #1 "S";

*/

		// ====================================
		// ====================================

	   //default:	dout <= #1 8'd00;
	endcase

endmodule
/////////////////////////////////////////////////////////////////////
////                                                             ////
////  UTMI Interface                                             ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb1_funct/////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: usb1_utmi_if.v,v 1.1.1.1 2002-09-19 12:07:14 rudi Exp $
//
//  $Date: 2002-09-19 12:07:14 $
//  $Revision: 1.1.1.1 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//
//
//
//
//
//
//

`include "usb1_defines.v"

module usb1_utmi_if( // UTMI Interface (EXTERNAL)
		phy_clk, rst,
		DataOut, TxValid, TxReady,
		RxValid, RxActive, RxError, DataIn,

		// Internal Interface
		rx_data, rx_valid, rx_active, rx_err,
		tx_data, tx_valid, tx_valid_last, tx_ready,
		tx_first

		);

input		phy_clk;
input		rst;

output	[7:0]	DataOut;
output		TxValid;
input		TxReady;

input	[7:0]	DataIn;
input		RxValid;
input		RxActive;
input		RxError;


output	[7:0]	rx_data;
output		rx_valid, rx_active, rx_err;
input	[7:0]	tx_data;
input		tx_valid;
input		tx_valid_last;
output		tx_ready;
input		tx_first;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//
reg	[7:0]	rx_data;
reg		rx_valid, rx_active, rx_err;
reg	[7:0]	DataOut;
reg		tx_ready;
reg		TxValid;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//


///////////////////////////////////////////////////////////////////
//
// RX Interface Input registers
//

always @(posedge phy_clk or negedge rst)
	if(!rst)	rx_valid <= #1 1'b0;
	else		rx_valid <= #1 RxValid;

always @(posedge phy_clk or negedge rst)
	if(!rst)	rx_active <= #1 1'b0;
	else		rx_active <= #1 RxActive;

always @(posedge phy_clk or negedge rst)
	if(!rst)	rx_err <= #1 1'b0;
	else		rx_err <= #1 RxError;

always @(posedge phy_clk)
		rx_data <= #1 DataIn;

///////////////////////////////////////////////////////////////////
//
// TX Interface Output/Input registers
//

always @(posedge phy_clk)
	if(TxReady | tx_first)	DataOut <= #1 tx_data;

always @(posedge phy_clk)
	tx_ready <= #1 TxReady;

always @(posedge phy_clk or negedge rst)
	if(!rst)	TxValid <= #1 1'b0;
	else
	TxValid <= #1 tx_valid | tx_valid_last | (TxValid & !TxReady);

endmodule

