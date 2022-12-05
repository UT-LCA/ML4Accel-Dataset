/////////////////////////////////////////////////////////////////////
////                                                             ////
////  USB CRC5 and CRC16 Modules                                 ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_crc16.v,v 1.2 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.2 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.1.0.1  2001/02/28 08:10:42  rudi
//               Initial Release
//
//                            

`include "usbf_defines.v"

///////////////////////////////////////////////////////////////////
//
// CRC16
//
///////////////////////////////////////////////////////////////////

module usbf_crc16(crc_in, din, crc_out);
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
////  USB CRC5 and CRC16 Modules                                 ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_crc5.v,v 1.2 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.2 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.1.0.1  2001/02/28 08:10:42  rudi
//               Initial Release
//
//                            

`include "usbf_defines.v"

///////////////////////////////////////////////////////////////////
//
// CRC5
//
///////////////////////////////////////////////////////////////////

module usbf_crc5(crc_in, din, crc_out);
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
////  USB function defines file                                  ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_defines.v,v 1.6 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.6 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.5  2001/11/04 12:22:43  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.4  2001/09/23 08:39:33  rudi
//
//               Renamed DEBUG and VERBOSE_DEBUG to USBF_DEBUG and USBF_VERBOSE_DEBUG ...
//
//               Revision 1.3  2001/09/13 13:14:02  rudi
//
//               Fixed a problem that would sometimes prevent the core to come out of
//               reset and immediately be operational ...
//
//               Revision 1.2  2001/08/10 08:48:33  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:52  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.2  2001/03/07 09:08:13  rudi
//
//               Added USB control signaling (Line Status) block. Fixed some minor
//               typos, added resume bit and signal.
//
//               Revision 0.1.0.1  2001/02/28 08:11:35  rudi
//               Initial Release
//
//

`timescale 1ns / 10ps

// Uncomment the lines below to get various levels of debugging
// verbosity ...
`define USBF_DEBUG
//`define USBF_VERBOSE_DEBUG

// Uncomment the line below to run the test bench
// Comment it out to use your own address parameters ...
`define USBF_TEST_IMPL

// For each endpoint that should actually be instantiated,
// set the below define value to a one. Uncomment the define
// statement for unused endpoints. The endpoints should be
// sequential, e.q. 1,2,3. I have not tested what happens if
// you select endpoints in a non sequential manner e.g. 1,4,6
// Actual (logical) endpoint IDs are set by the software. There
// is no correlation between the physical endpoint number (below)
// and the actual (logical) endpoint number.
`ifdef USBF_TEST_IMPL
		// Do not modify this section
		// this is to run the test bench
		`define	USBF_HAVE_EP1	1
		`define	USBF_HAVE_EP2	1
		`define	USBF_HAVE_EP3	1
`else
		// Modify this section to suit your implementation
		`define	USBF_HAVE_EP1	1
		`define	USBF_HAVE_EP2	1
		`define	USBF_HAVE_EP3	1
		//`define	USBF_HAVE_EP4	1
		//`define	USBF_HAVE_EP5	1
		//`define	USBF_HAVE_EP6	1
		//`define	USBF_HAVE_EP7	1
		//`define	USBF_HAVE_EP8	1
		//`define	USBF_HAVE_EP9	1
		//`define	USBF_HAVE_EP10	1
		//`define	USBF_HAVE_EP11	1
		//`define	USBF_HAVE_EP12	1
		//`define	USBF_HAVE_EP13	1
		//`define	USBF_HAVE_EP14	1
		//`define	USBF_HAVE_EP15	1
`endif


// Highest address line number that goes to the USB core
// Typically only A0 through A17 are needed, where A17
// selects between the internal buffer memory and the
// register file.
// Implementations may choose to have a more complex address
// decoding ....

`ifdef USBF_TEST_IMPL
		// Do not modify this section
		// this is to run the test bench
		`define USBF_UFC_HADR	17
		`define USBF_RF_SEL	(!wb_addr_i[17])
		`define USBF_MEM_SEL	(wb_addr_i[17])
		`define USBF_SSRAM_HADR	14
		//`define USBF_ASYNC_RESET

`else
		// Modify this section to suit your implementation
		`define USBF_UFC_HADR	12
		// Address Decoding for Register File select
		`define USBF_RF_SEL	(!wb_addr_i[12])
		// Address Decoding for Buffer Memory select
		`define USBF_MEM_SEL	(wb_addr_i[12])
		`define USBF_SSRAM_HADR	9
		// The next statement determines if reset is async or sync.
		// If the define is uncommented the reset will be ASYNC.
		//`define USBF_ASYNC_RESET
`endif


/////////////////////////////////////////////////////////////////////
//
// Items below this point should NOT be modified by the end user
// UNLESS you know exactly what you are doing !
// Modify at you own risk !!!
//
/////////////////////////////////////////////////////////////////////

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
// delay must be 30 phy clocks: 500ns / 16.667nS = 30 clocks
`define USBF_HMS_DEL		5'h1c

// After sending Data in response to an IN token from host, the
// host must reply with an ack. The host has 622nS in Full Speed
// mode and 400nS in High Speed mode to reply. RX_ACK_TO_VAL_FS
// and RX_ACK_TO_VAL_HS are the numbers of UTMI clock cycles
// minus 2 for Full and High Speed modes.
`define USBF_RX_ACK_TO_VAL_FS	8'd36
`define USBF_RX_ACK_TO_VAL_HS	8'd22


// After sending an OUT token the host must send a data packet.
// The host has 622nS in Full Speed mode and 400nS in High Speed
// mode to send the data packet.
// TX_DATA_TO_VAL_FS and TX_DATA_TO_VAL_HS are is the numbers of
// UTMI clock cycles minus 2.
`define USBF_TX_DATA_TO_VAL_FS	8'd36
`define USBF_TX_DATA_TO_VAL_HS	8'd22


// --------------------------------------------------
// USB Line state & Speed Negotiation Time Values


// Prescaler Clear value.
// The prescaler generates a 0.25uS pulse, from a nominal PHY clock of
// 60 Mhz. 250nS/16.667ns=15. The prescaler has to be cleared every 15
// cycles. Due to the pipeline, subtract 2 from 15, resulting in 13 cycles.
// !!! This is the only place that needs to be changed if a PHY with different
// !!! clock output is used.
`define	USBF_T1_PS_250_NS	4'd13

// uS counter representation of 2.5uS (2.5/0.25=10)
`define	USBF_T1_C_2_5_US	8'd10

// uS counter clear value
// The uS counter counts the time in 0.25uS intervals. It also generates
// a count enable to the mS counter, every 62.5 uS.
// The clear value is 62.5uS/0.25uS=250 cycles.
`define USBF_T1_C_62_5_US	8'd250

// mS counter representation of 3.0mS (3.0/0.0625=48)
`define USBF_T1_C_3_0_MS	8'd48

// mS counter representation of 3.125mS (3.125/0.0625=50)
`define USBF_T1_C_3_125_MS	8'd50

// mS counter representation of 5mS (5/0.0625=80)
`define USBF_T1_C_5_MS		8'd80

// Multi purpose Counter Prescaler, generate 2.5 uS period
// 2500/16.667ns=150 (minus 2 for pipeline)
`define	USBF_T2_C_2_5_US	8'd148

// Generate 0.5mS period from the 2.5 uS clock
// 500/2.5 = 200
`define	USBF_T2_C_0_5_MS	8'd200

// Indicate when internal wakeup has completed
// me_cnt counts 0.5 mS intervals. E.g.: 5.0mS are (5/0.5) 10 ticks
// Must be 0 =< 10 mS
`define USBF_T2_C_WAKEUP	8'd10

// Indicate when 100uS have passed
// me_ps2 counts 2.5uS intervals. 100uS are (100/2.5) 40 ticks
`define USBF_T2_C_100_US	8'd40

// Indicate when 1.0 mS have passed
// me_cnt counts 0.5 mS intervals. 1.0mS are (1/0.5) 2 ticks
`define USBF_T2_C_1_0_MS	8'd2

// Indicate when 1.2 mS have passed
// me_cnt counts 0.5 mS intervals. 1.2mS are (1.2/0.5) 2 ticks
`define USBF_T2_C_1_2_MS	8'd2

// Indicate when 100 mS have passed
// me_cnt counts 0.5 mS intervals. 100mS are (100/0.5) 200 ticks
`define USBF_T2_C_100_MS	8'd200

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Dummy Endpoint register File                               ////
////  This module contains termination for registers in ONE      ////
////  endpoint. It is used to replace the actual endpoint        ////
////  register file for non existing endpoints.                  ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_ep_rf_dummy.v,v 1.2 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.2 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.1  2001/03/31 12:45:13  rudi
//
//               This is the endpoint register file for non existing endpoints. It will be used for
//               endpoints that are commented out in the usd_defines.v file.
//               It will terminate all outputs to a known good level ...
//
//
//

`include "usbf_defines.v"

// Endpoint register File
module usbf_ep_rf_dummy(
		clk, wclk, rst,

		// Wishbone Interface
		adr, re, we, din, dout, inta, intb,
		dma_req, dma_ack,

		// Internal Interface

		idin,
		ep_sel, ep_match,
		buf0_rl, buf0_set, buf1_set,
		uc_bsel_set, uc_dpd_set,

		int_buf1_set, int_buf0_set, int_upid_set,
		int_crc16_set, int_to_set, int_seqerr_set,
		out_to_small,

		csr, buf0, buf1, dma_in_buf_sz1, dma_out_buf_avail
		);

input		clk, wclk, rst;
input	[1:0]	adr;
input		re;
input		we;
input	[31:0]	din;
output	[31:0]	dout;
output		inta, intb;
output		dma_req;
input		dma_ack;

input	[31:0]	idin;		// Data Input
input	[3:0]	ep_sel;		// Endpoint Number Input
output		ep_match;	// Asserted to indicate a ep no is matched
input		buf0_rl;	// Reload Buf 0 with original values

input		buf0_set;	// Write to buf 0
input		buf1_set;	// Write to buf 1
input		uc_bsel_set;	// Write to the uc_bsel field
input		uc_dpd_set;	// Write to the uc_dpd field
input		int_buf1_set;	// Set buf1 full/empty interrupt
input		int_buf0_set;	// Set buf0 full/empty interrupt
input		int_upid_set;	// Set unsupported PID interrupt
input		int_crc16_set;	// Set CRC16 error interrupt
input		int_to_set;	// Set time out interrupt
input		int_seqerr_set;	// Set PID sequence error interrupt
input		out_to_small;	// OUT packet was to small for DMA operation

output	[31:0]	csr;		// Internal CSR Output
output	[31:0]	buf0;		// Internal Buf 0 Output
output	[31:0]	buf1;		// Internal Buf 1 Output
output		dma_in_buf_sz1;	// Indicates that the DMA IN buffer has 1 max_pl_sz
				// packet available
output		dma_out_buf_avail;// Indicates that there is space for at least
				// one MAX_PL_SZ packet in the buffer

///////////////////////////////////////////////////////////////////
//
// Internal Access
//

assign	dout = 32'h0;
assign	inta = 1'b0;
assign	intb = 1'b0;
assign	dma_req = 1'b0;
assign	ep_match = 1'b0;
assign	csr = 32'h0;
assign	buf0 = 32'hffff_ffff;
assign	buf1 = 32'hffff_ffff;
assign	dma_in_buf_sz1 = 1'b0;
assign	dma_out_buf_avail = 1'b0;

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Endpoint register File                                     ////
////  This module contains all registers for ONE endpoint        ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_ep_rf.v,v 1.4 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.4 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.3  2001/11/04 12:22:44  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.2  2001/11/03 03:26:22  rudi
//
//               - Fixed several interrupt and error condition reporting bugs
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:51  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.1.0.1  2001/02/28 08:10:44  rudi
//               Initial Release
//
//                            

`include "usbf_defines.v"

// Endpoint register File
module usbf_ep_rf(clk, wclk, rst,

		// Wishbone Interface
		adr, re, we, din, dout, inta, intb,
		dma_req, dma_ack,

		// Internal Interface

		idin,
		ep_sel, ep_match,
		buf0_rl, buf0_set, buf1_set,
		uc_bsel_set, uc_dpd_set,

		int_buf1_set, int_buf0_set, int_upid_set,
		int_crc16_set, int_to_set, int_seqerr_set,
		out_to_small,

		csr, buf0, buf1, dma_in_buf_sz1, dma_out_buf_avail
		);

input		clk, wclk, rst;
input	[1:0]	adr;
input		re;
input		we;
input	[31:0]	din;
output	[31:0]	dout;
output		inta, intb;
output		dma_req;
input		dma_ack;

input	[31:0]	idin;		// Data Input
input	[3:0]	ep_sel;		// Endpoint Number Input
output		ep_match;	// Asserted to indicate a ep no is matched
input		buf0_rl;	// Reload Buf 0 with original values

input		buf0_set;	// Write to buf 0
input		buf1_set;	// Write to buf 1
input		uc_bsel_set;	// Write to the uc_bsel field
input		uc_dpd_set;	// Write to the uc_dpd field
input		int_buf1_set;	// Set buf1 full/empty interrupt
input		int_buf0_set;	// Set buf0 full/empty interrupt
input		int_upid_set;	// Set unsupported PID interrupt
input		int_crc16_set;	// Set CRC16 error interrupt
input		int_to_set;	// Set time out interrupt
input		int_seqerr_set;	// Set PID sequence error interrupt
input		out_to_small;	// OUT packet was to small for DMA operation

output	[31:0]	csr;		// Internal CSR Output
output	[31:0]	buf0;		// Internal Buf 0 Output
output	[31:0]	buf1;		// Internal Buf 1 Output
output		dma_in_buf_sz1;	// Indicates that the DMA IN buffer has 1 max_pl_sz
				// packet available
output		dma_out_buf_avail;// Indicates that there is space for at least
				// one MAX_PL_SZ packet in the buffer

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

reg	[31:0]	dout;

// CSR
reg	[12:0]	csr0;
reg		ots_stop;
reg	[12:0]	csr1;
reg	[1:0]	uc_bsel, uc_dpd;

reg	[5:0]	iena, ienb;	// Interrupt enables
reg	[6:0]	int_stat;		// Interrupt status

wire		we0, we1, we2, we3;
reg	[31:0]	buf0;
reg	[31:0]	buf1;
reg	[31:0]	buf0_orig;

reg		inta, intb;

// DMA Logic Registers
reg	[11:0]	dma_out_cnt;
wire		dma_out_cnt_is_zero;
reg		dma_out_buf_avail;
reg	[11:0]	dma_out_left;

reg	[11:0]	dma_in_cnt;
reg		dma_in_buf_sz1;

reg		dma_req_r;
wire		dma_req_d;
wire		dma_req_in_d;
wire		dma_req_out_d;
reg		r1, r2, r4, r5;
wire		dma_ack_i;
reg		dma_req_out_hold, dma_req_in_hold ;
reg	[11:0]	buf0_orig_m3;
wire		dma_req_hold;
reg		set_r;
reg		ep_match_r; 
reg		int_re;

// Aliases
wire	[31:0]	csr;
wire	[31:0]	int;
wire		dma_en;
wire	[10:0]	max_pl_sz;
wire		ep_in;
wire		ep_out;

assign csr = {uc_bsel, uc_dpd, csr1, 1'h0, ots_stop, csr0};
assign int = {2'h0, iena, 2'h0,ienb, 9'h0, int_stat};
assign dma_en = csr[15];
assign max_pl_sz = csr[10:0];
assign ep_in  = csr[27:26]==2'b01;
assign ep_out = csr[27:26]==2'b10;

///////////////////////////////////////////////////////////////////
//
// WISHBONE Access
//

always @(adr or csr or int or buf0 or buf1)
	case(adr)	// synopsys full_case parallel_case
	   2'h0: dout = csr;
	   2'h1: dout = int;
	   2'h2: dout = buf0;
	   2'h3: dout = buf1;
	endcase

assign we0 = (adr==2'h0) & we;
assign we1 = (adr==2'h1) & we;
assign we2 = (adr==2'h2) & we;
assign we3 = (adr==2'h3) & we;

// Endpoint CSR Register
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)
	   begin
		csr0 <= 13'h0;
		csr1 <= 13'h0;
		ots_stop <= 1'b0;
	   end
	else
	if(we0)
	   begin
		csr0 <= din[12:0];
		ots_stop <= din[13];
		csr1 <= din[27:15];
	   end
	else
	if(ots_stop && out_to_small)
		csr1[8:7] <= 2'b01;	

// Endpoint Interrupt Register
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)
	   begin
		ienb <= 6'h0;
		iena <= 6'h0;
	   end
	else
	if(we1)
	   begin
		ienb <= din[21:16];
		iena <= din[29:24];
	   end

// Endpoint Buffer Registers
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			buf0 <= 32'hffff_ffff;
	else
	if(we2)				buf0 <= din;
	else
	if(ep_match_r && buf0_rl)	buf0 <= buf0_orig;
	else
	if(ep_match_r && buf0_set)	buf0 <= idin;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			buf1 <= 32'hffff_ffff;
	else
	if(we3)				buf1 <= din;
	else
	if(ep_match_r &&
	(buf1_set || out_to_small))	buf1 <= idin;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			buf0_orig <= 32'hffff_ffff;
	else
	if(we2)				buf0_orig <= din;

///////////////////////////////////////////////////////////////////
//
// Internal Access
//


// Indicates that this register file matches the current
// endpoint from token
assign ep_match = (ep_sel == csr[21:18]);

always @(posedge clk)
	ep_match_r <= ep_match;

always @(posedge clk)
	int_re <= re & (adr == 2'h1);

// Interrupt Sources
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			int_stat <= 7'h0;
	else
	if(int_re)			int_stat <= 7'h0;
	else
	if(ep_match_r)
	   begin
		if(out_to_small)	int_stat[6] <= 1'b1;
		if(int_seqerr_set)	int_stat[5] <= 1'b1;
		if(int_buf1_set)	int_stat[4] <= 1'b1;
		if(int_buf0_set)	int_stat[3] <= 1'b1;
		if(int_upid_set)	int_stat[2] <= 1'b1;
		if(int_crc16_set)	int_stat[1] <= 1'b1;
		if(int_to_set)		int_stat[0] <= 1'b1;
	   end

// PID toggle track bits
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			uc_dpd <= 2'h0;
	else
	if(ep_match_r && uc_dpd_set)	uc_dpd <= idin[3:2];

// Buffer toggle track bits
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			uc_bsel <= 2'h0;
	else
	if(ep_match_r && uc_bsel_set)	uc_bsel <= idin[1:0];

///////////////////////////////////////////////////////////////////
//
// Endpoint Interrupt Generation
//

always @(posedge wclk)
	inta <=		(int_stat[0] & iena[0]) |
			(int_stat[1] & iena[1]) |
			(int_stat[2] & iena[2]) |
			(int_stat[3] & iena[3]) |
			(int_stat[4] & iena[3]) |
			(int_stat[5] & iena[4]) |
			(int_stat[6] & iena[5]);

always @(posedge wclk)
	intb <=		(int_stat[0] & ienb[0]) |
			(int_stat[1] & ienb[1]) |
			(int_stat[2] & ienb[2]) |
			(int_stat[3] & ienb[3]) |
			(int_stat[4] & ienb[3]) |
			(int_stat[5] & ienb[4]) |
			(int_stat[6] & ienb[5]);

///////////////////////////////////////////////////////////////////
//
// Endpoint DMA Request Logic
//

// DMA OUT endpoint counter
always @(posedge clk)
	if(!dma_en)		dma_out_cnt <= 12'h0;
	else
	if(dma_ack_i)		dma_out_cnt <= dma_out_cnt - 12'h1;
	else
	if(ep_match_r && (set_r || buf0_set || buf0_rl))
				dma_out_cnt <= dma_out_cnt + {3'h0, max_pl_sz[10:2]};

// If buf0_set or buf0_rl was asserted at the same time as dma_ack_i
// remember it and perform the add next cycle ...
always @(posedge clk)
	set_r <= dma_ack_i & (buf0_set | buf0_rl);

// This signal is used to keep dma_req asserted when we know there is
// plenty of data in the buffer.
// When the buffer is "low", we do one dma_req and wait to see if there
// is more data and repeat until the buffer is empty.
// This is because of the sync logic - it has to propagate first
// before we can determine that the buffer is really empty.
always @(posedge wclk)
	dma_req_out_hold <= |dma_out_cnt[11:2] & ep_out;

assign dma_out_cnt_is_zero = dma_out_cnt == 12'h0;

// DMA IN endpoint counter
always @(posedge clk)
	if(!dma_en)		dma_in_cnt <= 12'h0;
	else
	if(dma_ack_i)		dma_in_cnt <= dma_in_cnt + 12'h1;
	else
	if(ep_match_r && (set_r || buf0_set || buf0_rl))
				dma_in_cnt <= dma_in_cnt - {3'h0, max_pl_sz[10:2]};

// Indicates to Protocol Engine when we have gotten at least one packet in to buffer
// This is for IN transfers only
always @(posedge clk)
	dma_in_buf_sz1 <=	(dma_in_cnt >= {3'h0,max_pl_sz[10:2]}) &
				(max_pl_sz[10:0] != 11'h0);

// Indicates to Protocol Engine that there is space for at least one MAX_PL_SZ
// packet in buffer. OUT transfers only.
always @(posedge clk)
	dma_out_left <= (buf0_orig[30:19] - dma_out_cnt);

always @(posedge clk)
	dma_out_buf_avail <= (dma_out_left >= {3'h0, max_pl_sz[10:2]});

// DMA Request Generation
assign dma_req_d = dma_en & (dma_req_in_d | dma_req_out_d);

// For OUT
assign dma_req_out_d = ep_out & !dma_out_cnt_is_zero;

// FOR IN
assign	dma_req_in_d = ep_in & (dma_in_cnt < buf0_orig[30:19]);


always @(posedge wclk)
	buf0_orig_m3 <= buf0_orig[30:19] - 12'h3;

reg	dma_req_in_hold2;

always @(posedge wclk)
	dma_req_in_hold2 <= (dma_in_cnt < buf0_orig_m3);

always @(posedge wclk)
	dma_req_in_hold <= ep_in & |buf0_orig[30:21];

assign dma_req_hold = ep_out ? dma_req_out_hold : (dma_req_in_hold & dma_req_in_hold2);

// Generate a Sync. Request
assign dma_req = dma_req_r;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)			dma_req_r <= 1'b0;
	else
	if(r1 && !r2)			dma_req_r <= 1'b1;
	else
	if(dma_ack && !dma_req_hold)	dma_req_r <= 1'b0;

always @(posedge wclk)
	r1 <= dma_req_d & !r2 & !r4 & !r5;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)	r2 <= 1'b0;
	else
	if(r1)		r2 <= 1'b1;
	else
	if(r4)		r2 <= 1'b0;

// Synchronize ACK
reg	dma_ack_wr1;
reg	dma_ack_clr1;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		dma_ack_wr1 <= 1'b0;
	else
	if(dma_ack)		dma_ack_wr1 <= 1'b1;
	else
	if(dma_ack_clr1)	dma_ack_wr1 <= 1'b0;

always @(posedge wclk)
	dma_ack_clr1 <= r4;

always @(posedge clk)
	r4 <= dma_ack_wr1;

always @(posedge clk)
	r5 <= r4;

assign dma_ack_i = r5;

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
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_idma.v,v 1.8 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.8 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.7  2001/11/04 12:22:45  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.6  2001/11/03 03:26:22  rudi
//
//               - Fixed several interrupt and error condition reporting bugs
//
//               Revision 1.5  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.4  2001/09/23 08:39:33  rudi
//
//               Renamed DEBUG and VERBOSE_DEBUG to USBF_DEBUG and USBF_VERBOSE_DEBUG ...
//
//               Revision 1.3  2001/09/19 14:38:57  rudi
//
//               Fixed TxValid handling bug.
//
//               Revision 1.2  2001/09/13 13:14:02  rudi
//
//               Fixed a problem that would sometimes prevent the core to come out of
//               reset and immediately be operational ...
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:51  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.1.0.1  2001/02/28 08:10:50  rudi
//               Initial Release
//
//                            

`include "usbf_defines.v"

module usbf_idma(	clk, rst,

		// Packet Disassembler/Assembler interface
		rx_data_st, rx_data_valid, rx_data_done, 
		send_data, tx_data_st, rd_next,

		// Protocol Engine
		rx_dma_en, tx_dma_en,
		abort, idma_done,
		buf_size, dma_en,
		send_zero_length,

		// Register File Manager Interface
		adr, size, sizu_c,

		// Memory Arb interface
		madr, mdout, mdin, mwe, mreq, mack
		);

parameter	SSRAM_HADR = 14;

// Packet Disassembler/Assembler interface
input		clk, rst;
input	[7:0]	rx_data_st;
input		rx_data_valid;
input		rx_data_done;
output		send_data;
output	[7:0]	tx_data_st;
input		rd_next;

// Protocol Engine
input		rx_dma_en;	// Allows the data to be stored
input		tx_dma_en;	// Allows for data to be retrieved
input		abort;		// Abort Transfer (time_out, crc_err or rx_error)
output		idma_done;	// DMA is done
input	[13:0]	buf_size;	// Actual buffer size
input		dma_en;		// External DMA enabled
input		send_zero_length;

// Register File Manager Interface
input	[SSRAM_HADR + 2:0]	adr;	// Byte Address
input	[13:0]	size;		// Size in bytes
output	[10:0]	sizu_c;		// Up and Down counting size registers, used to update

// Memory Arb interface
output	[SSRAM_HADR:0]	madr;	// word address
output	[31:0]	mdout;
input	[31:0]	mdin;
output		mwe;
output		mreq;
input		mack;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

parameter	[7:0]	// synopsys enum state
		IDLE		= 8'b00000001,
		WAIT_MRD	= 8'b00000010,
		MEM_WR		= 8'b00000100,
		MEM_WR1		= 8'b00001000,
		MEM_WR2		= 8'b00010000,
		MEM_RD1		= 8'b00100000,
		MEM_RD2		= 8'b01000000,
		MEM_RD3		= 8'b10000000;

reg	[7:0]	/* synopsys enum state */ state, next_state;
// synopsys state_vector state

reg		tx_dma_en_r, rx_dma_en_r;

reg	[SSRAM_HADR:0]	adr_cw;		// Internal word address counter
reg	[2:0]	adr_cb;			// Internal byte address counter
reg	[SSRAM_HADR:0]	adrw_next;	// next address
reg	[SSRAM_HADR:0]	adrw_next1;	// next address (after overrun check)
reg	[SSRAM_HADR:0]	last_buf_adr;	// Last Buffer Address
reg	[2:0]	adrb_next;		// next byte address
reg	[13:0]	sizd_c;			// Internal size counter
reg	[10:0]	sizu_c;			// Internal size counter
wire		adr_incw;
wire		adr_incb;
wire		siz_dec;
wire		siz_inc;

reg		word_done;		// Indicates that a word has been
					// assembled
reg		mreq_d;			// Memory request from State Machine
reg	[31:0]	dtmp_r;			// Temp data assembly register
reg	[31:0]	dout_r;			// Data output register
reg		mwe_d;			// Memory Write enable
reg		dtmp_sel;		// Selects tmp data register for pre-fetch

reg		sizd_is_zero;		// Indicates when all bytes have been
					// transferred
wire		sizd_is_zero_d;

reg	[7:0]	tx_data_st;		// Data output to packet assembler
reg	[31:0]	rd_buf0, rd_buf1;	// Mem Rd. buffers for TX
reg		rd_first;		// Indicates initial fill of buffers

reg		idma_done;		// DMA transfer is done

reg		mack_r;
wire		send_data;		// Enable UTMI Transmitter
reg		send_data_r;

reg		word_done_r;
reg		wr_last;
reg		wr_last_en;
reg		wr_done;
reg		wr_done_r;
reg		dtmp_sel_r;
reg		mwe;
reg		rx_data_done_r2;
wire		fill_buf0, fill_buf1;
wire		adrb_is_3;

reg		rx_data_done_r;
reg		rx_data_valid_r;
reg	[7:0]	rx_data_st_r;

reg		send_zero_length_r;

///////////////////////////////////////////////////////////////////
//
// Memory Arb interface
//

// Memory Request
assign mreq = (mreq_d & !mack_r) | word_done_r;

// Output Data
assign mdout = dout_r;

// Memory Address
assign madr = adr_cw;

always @(posedge clk)
	mwe <= mwe_d;

always @(posedge clk)
	mack_r <= mreq & mack;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

always @(posedge clk)
	rx_data_valid_r <= rx_data_valid;

always @(posedge clk)
	rx_data_st_r <= rx_data_st;

always @(posedge clk)
	rx_data_done_r <= rx_data_done;

always @(posedge clk)
	rx_data_done_r2 <= rx_data_done_r;

// Generate one cycle pulses for tx and rx dma enable
always @(posedge clk)
	tx_dma_en_r <= tx_dma_en;

always @(posedge clk)
	rx_dma_en_r <= rx_dma_en;

always @(posedge clk)
	send_zero_length_r <= send_zero_length;

// address counter
always @(posedge clk)
	if(rx_dma_en_r || tx_dma_en_r)	adr_cw <= adr[SSRAM_HADR + 2:2];
	else				adr_cw <= adrw_next1;

always @(posedge clk)
	last_buf_adr <= adr + { {SSRAM_HADR+2-13{1'b0}}, buf_size };

always @(dma_en or adrw_next or last_buf_adr)
	if(adrw_next == last_buf_adr && dma_en)	adrw_next1 = {SSRAM_HADR+1{1'b0}};
	else					adrw_next1 = adrw_next;

always @(adr_incw or adr_cw)
	if(adr_incw)	adrw_next = adr_cw + {{SSRAM_HADR{1'b0}}, 1'b1};
	else		adrw_next = adr_cw;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			adr_cb <= 3'h0;
	else
	if(rx_dma_en_r || tx_dma_en_r)	adr_cb <= adr[2:0];
	else				adr_cb <= adrb_next;

always @(adr_incb or adr_cb)
	if(adr_incb)	adrb_next = adr_cb + 3'h1;
	else		adrb_next = adr_cb;

assign adr_incb = rx_data_valid_r | rd_next;
assign adr_incw = !dtmp_sel_r & mack_r;

// Size Counter (counting backward from input size)
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			sizd_c <= 14'h3fff;
	else
	if(tx_dma_en || tx_dma_en_r)	sizd_c <= size;
	else
	if(siz_dec)			sizd_c <= sizd_c - 14'h1;

assign siz_dec = (rd_first & mack_r) | (rd_next & (sizd_c != 14'h0));

assign sizd_is_zero_d = sizd_c == 14'h0;

always @(posedge clk)
	sizd_is_zero <= sizd_is_zero_d;

// Size Counter (counting up from zero)
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)		sizu_c <= 11'h0;
	else
	// Do I need to add "abort" in the next line ???
	if(rx_dma_en_r)		sizu_c <= 11'h0;
	else
	if(siz_inc)		sizu_c <= sizu_c + 11'h1;

assign siz_inc = rx_data_valid_r;

// DMA Done Indicator
always @(posedge clk)
	idma_done <= (rx_data_done_r | sizd_is_zero_d); // & !tx_dma_en;

///////////////////////////////////////////////////////////////////
//
// RX Logic
//

always @(posedge clk)
	dtmp_sel_r <= dtmp_sel;

// Memory data input
always @(posedge clk)
	if(dtmp_sel_r)			dtmp_r <= mdin;
	else
	if(rx_data_valid_r)
	   begin
		if(adr_cb[1:0] == 2'h0)	dtmp_r[07:00] <= rx_data_st_r;
		if(adr_cb[1:0] == 2'h1)	dtmp_r[15:08] <= rx_data_st_r;
		if(adr_cb[1:0] == 2'h2)	dtmp_r[23:16] <= rx_data_st_r;
		if(adr_cb[1:0] == 2'h3)	dtmp_r[31:24] <= rx_data_st_r;
	   end

always @(posedge clk)
	word_done <= ((adr_cb[1:0] == 2'h3) & rx_data_valid_r) | wr_last;

always @(posedge clk)
	word_done_r <= word_done & !word_done_r;

// Store output data and address when we got a word
always @(posedge clk)
	if(word_done)	dout_r <= dtmp_r;

always @(posedge clk)
	wr_last <= (adr_cb[1:0] != 2'h0) & !rx_data_valid_r & wr_last_en;

always @(posedge clk)
	wr_done_r <= rx_data_done_r;

always @(posedge clk)
	wr_done <= wr_done_r;

///////////////////////////////////////////////////////////////////
//
// TX Logic
//

// Fill TX Buffers
always @(posedge clk)
	if(fill_buf0)	rd_buf0 <= mdin;

always @(posedge clk)
	if(fill_buf1)	rd_buf1 <= mdin;

always @(adrb_next or rd_buf0 or rd_buf1)
	case(adrb_next[2:0])	// synopsys full_case parallel_case
	   3'h0: tx_data_st = rd_buf0[07:00];
	   3'h1: tx_data_st = rd_buf0[15:08];
	   3'h2: tx_data_st = rd_buf0[23:16];
	   3'h3: tx_data_st = rd_buf0[31:24];
	   3'h4: tx_data_st = rd_buf1[07:00];
	   3'h5: tx_data_st = rd_buf1[15:08];
	   3'h6: tx_data_st = rd_buf1[23:16];
	   3'h7: tx_data_st = rd_buf1[31:24];
	endcase

assign fill_buf0 = !adr_cw[0] & mack_r;
assign fill_buf1 =  adr_cw[0] & mack_r;

assign	adrb_is_3 = adr_cb[1:0] == 2'h3;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)		send_data_r <= 1'b0;
	else
	if(rd_first)		send_data_r <= 1'b1;
	else
	if(((sizd_c==14'h1) && rd_next) || sizd_is_zero_d)	send_data_r <= 1'b0;

assign send_data = send_data_r | send_zero_length_r;

///////////////////////////////////////////////////////////////////
//
// IDMA Load/Store State Machine
//

// store incoming data to memory until rx_data done
// First pre-fetch data from memory, so that bytes can be stuffed properly

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)	state <= IDLE;
	else		state <= next_state;

always @(state or mack_r or abort or rx_dma_en_r or tx_dma_en_r or 
	sizd_is_zero or wr_last or wr_done or rx_data_done_r2 or 
	rd_next or adrb_is_3 or send_zero_length_r)
   begin
	next_state = state;	// Default do not change state
	mreq_d = 1'b0;
	mwe_d = 1'b0;
	rd_first = 1'b0;
	dtmp_sel = 1'b0;
	wr_last_en = 1'b0;

	case(state)	// synopsys full_case parallel_case
	   IDLE:
		   begin

// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
$display("IDMA: Entered IDLE state (%t)", $time);
`endif
`ifdef USBF_DEBUG
if(rst)
begin
if(rx_dma_en_r === 1'bx)	$display("ERROR: IDMA: IDLE: rx_dma_en_r is unknown. (%t)", $time);
if(tx_dma_en_r === 1'bx)	$display("ERROR: IDMA: IDLE: tx_dma_en_r is unknown. (%t)", $time);
if(abort === 1'bx)		$display("ERROR: IDMA: IDLE: abort is unknown. (%t)", $time);
end
`endif
// synopsys translate_on

			if(rx_dma_en_r && !abort)
			   begin
				next_state = WAIT_MRD;
			   end
			if(tx_dma_en_r && !abort && !send_zero_length_r)
			   begin
				next_state = MEM_RD1;
			   end
		   end

	   WAIT_MRD:	// Pre-fetch a word from memory
		   begin

// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
$display("IDMA: Entered WAIT_MRD state (%t)", $time);
`endif
`ifdef USBF_DEBUG
if(abort === 1'bx)	$display("ERROR: IDMA: WAIT_MRD: abort is unknown. (%t)", $time);
if(mack_r === 1'bx)	$display("ERROR: IDMA: WAIT_MRD: mack_r is unknown. (%t)", $time);
`endif
// synopsys translate_on

			if(abort)	next_state = IDLE;
			else
			if(mack_r)	next_state = MEM_WR;
			else
			   begin
				dtmp_sel = 1'b1;
				mreq_d = 1'b1;
			   end
		   end

	   MEM_WR:
		   begin

// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
$display("IDMA: Entered MEM_WR state (%t)", $time);
`endif
`ifdef USBF_DEBUG
if(abort === 1'bx)	$display("ERROR: IDMA: MEM_WR: abort is unknown. (%t)", $time);
if(rx_data_done_r2 === 1'bx)	$display("ERROR: IDMA: MEM_WR: rx_data_done_r2 is unknown. (%t)", $time);
`endif
// synopsys translate_on

			mwe_d = 1'b1;
			if(abort)			next_state = IDLE;
			else
			if(rx_data_done_r2)	
			   begin
				wr_last_en = 1'b1;
				next_state = MEM_WR1;
			   end

		   end
	   MEM_WR1:
		   begin

// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
$display("IDMA: Entered MEM_WR1 state (%t)", $time);
`endif
`ifdef USBF_DEBUG
if(abort === 1'bx)	$display("ERROR: IDMA: MEM_WR1: abort is unknown. (%t)", $time);
if(wr_last === 1'bx)	$display("ERROR: IDMA: MEM_WR1: wr_last is unknown. (%t)", $time);
if(wr_done === 1'bx)	$display("ERROR: IDMA: MEM_WR1: wr_done is unknown. (%t)", $time);
`endif
// synopsys translate_on

			mwe_d = 1'b1;
			wr_last_en = 1'b1;
			if(abort)			next_state = IDLE;
			else
			if(wr_last)			next_state = MEM_WR2;
			else
			if(wr_done)			next_state = IDLE;
		   end

	   MEM_WR2:
		   begin

// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
$display("IDMA: Entered MEM_WR2 state (%t)", $time);
`endif
`ifdef USBF_DEBUG
if(mack_r === 1'bx)	$display("ERROR: IDMA: MEM_WR2: mack_r is unknown. (%t)", $time);
`endif
// synopsys translate_on

			mwe_d = 1'b1;
			if(mack_r)			next_state = IDLE;
		   end

	   MEM_RD1:
		   begin

// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
$display("IDMA: Entered MEM_RD1 state (%t)", $time);
`endif
`ifdef USBF_DEBUG
if(abort === 1'bx)	$display("ERROR: IDMA: MEM_RD1: abort is unknown. (%t)", $time);
if(mack_r === 1'bx)	$display("ERROR: IDMA: MEM_RD1: mack_r is unknown. (%t)", $time);
`endif
// synopsys translate_on

			mreq_d = 1'b1;
			if(mack_r)		rd_first = 1'b1;
			if(abort)		next_state = IDLE;
			else
			if(mack_r)		next_state = MEM_RD2;
		   end
	   MEM_RD2:
		   begin

// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
$display("IDMA: Entered MEM_RD2 state (%t)", $time);
`endif
`ifdef USBF_DEBUG
if(abort === 1'bx)	$display("ERROR: IDMA: MEM_RD2: abort is unknown. (%t)", $time);
if(mack_r === 1'bx)	$display("ERROR: IDMA: MEM_RD2: mack_r is unknown. (%t)", $time);
`endif
// synopsys translate_on

			mreq_d = 1'b1;
			if(abort)		next_state = IDLE;
			else
			if(mack_r)		next_state = MEM_RD3;
		   end
	   MEM_RD3:
		   begin

// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
$display("IDMA: Entered MEM_RD3 state (%t)", $time);
`endif
`ifdef USBF_DEBUG
if(abort === 1'bx)	$display("ERROR: IDMA: MEM_RD3: abort is unknown. (%t)", $time);
if(sizd_is_zero===1'bx) $display("ERROR: IDMA: MEM_RD3: sizd_is_zero is unknown. (%t)", $time);
if(adrb_is_3 === 1'bx)	$display("ERROR: IDMA: MEM_RD3: adrb_is_3 is unknown. (%t)", $time);
if(rd_next === 1'bx)	$display("ERROR: IDMA: MEM_RD3: rd_next is unknown. (%t)", $time);
`endif
// synopsys translate_on

			if(sizd_is_zero || abort)	next_state = IDLE;
			else
			if(adrb_is_3 && rd_next)	next_state = MEM_RD2;
		   end
	endcase

   end

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Memory Buffer Arbiter                                      ////
////  Arbitrates between the internal DMA and external bus       ////
////  interface for the internal buffer memory                   ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_mem_arb.v,v 1.3 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.3 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.2  2001/11/04 12:22:45  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:51  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.1.0.1  2001/02/28 08:10:52  rudi
//               Initial Release
//
//

`include "usbf_defines.v"

module usbf_mem_arb(	phy_clk, wclk, rst,

		// SSRAM Interface
		sram_adr, sram_din, sram_dout, sram_re, sram_we,

		// IDMA Memory Interface
		madr, mdout, mdin, mwe, mreq, mack,

		// WISHBONE Memory Interface
		wadr, wdout, wdin, wwe, wreq, wack

		);

parameter	SSRAM_HADR = 14;

input		phy_clk, wclk, rst;

output	[SSRAM_HADR:0]	sram_adr;
input	[31:0]	sram_din;
output	[31:0]	sram_dout;
output		sram_re, sram_we;

input	[SSRAM_HADR:0]	madr;
output	[31:0]	mdout;
input	[31:0]	mdin;
input		mwe;
input		mreq;
output		mack;

input	[SSRAM_HADR:0]	wadr;
output	[31:0]	wdout;
input	[31:0]	wdin;
input		wwe;
input		wreq;
output		wack;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

wire		wsel;
reg	[SSRAM_HADR:0]	sram_adr;
reg	[31:0]	sram_dout;
reg		sram_we;
wire		mack;
wire		mcyc;
reg		wack_r;

///////////////////////////////////////////////////////////////////
//
// Memory Arbiter Logic
//

// IDMA has always first priority

// -----------------------------------------
// Ctrl Signals

assign wsel = (wreq | wack) & !mreq;

// -----------------------------------------
// SSRAM Specific
// Data Path
always @(wsel or wdin or mdin)
	if(wsel)	sram_dout = wdin;
	else		sram_dout = mdin;

// Address Path
always @(wsel or wadr or madr)
	if(wsel)	sram_adr = wadr;
	else		sram_adr = madr;

// Write Enable Path
always @(wsel or wwe or wreq or mwe or mcyc)
	if(wsel)	sram_we = wreq & wwe;
	else		sram_we = mwe & mcyc;

assign sram_re = 1'b1;

// -----------------------------------------
// IDMA specific

assign mdout = sram_din;

assign mack = mreq;

assign mcyc = mack;	// Qualifier for writes

// -----------------------------------------
// WISHBONE specific
assign wdout = sram_din;

assign wack = wack_r & !mreq;

`ifdef USBF_ASYNC_RESET
always @(posedge phy_clk or negedge rst)
`else
always @(posedge phy_clk)
`endif
	if(!rst)	wack_r <= 1'b0;
	else		wack_r <= wreq & !mreq & !wack;

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
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_pa.v,v 1.6 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.6 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.5  2001/11/04 12:22:45  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.4  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.3  2001/09/19 14:38:57  rudi
//
//               Fixed TxValid handling bug.
//
//               Revision 1.2  2001/08/10 08:48:33  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.1.0.1  2001/02/28 08:10:54  rudi
//               Initial Release
//
//

`include "usbf_defines.v"

module usbf_pa(	clk, rst,

		// UTMI TX I/F
		tx_data, tx_valid, tx_valid_last, tx_ready,
		tx_first,

		// Protocol Engine Interface
		send_token, token_pid_sel,
		send_data, data_pid_sel,
		send_zero_length,

		// IDMA Interface
		tx_data_st, rd_next
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
input		send_zero_length;

// IDMA Interface
input	[7:0]	tx_data_st;
output		rd_next;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

parameter	[4:0]	// synopsys enum state
		IDLE   = 5'b00001,
		DATA   = 5'b00010,
		CRC1   = 5'b00100,
		CRC2   = 5'b01000,
		WAIT   = 5'b10000;

reg	[4:0]	/* synopsys enum state */ state, next_state;
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
wire		crc16_add;
reg		send_data_r2;
reg		tx_valid_r;
reg		tx_valid_r1;
reg		zero_length_r;
reg		send_zero_length_r;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

always @(posedge clk)
	send_zero_length_r <= send_zero_length;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)	zero_length_r <= 1'b0;
	else
	if(last)	zero_length_r <= 1'b0;
	else
	if(crc16_clr)	zero_length_r <= send_zero_length_r;

always @(posedge clk)
	tx_valid_r1 <= tx_valid;

always @(posedge clk)
	tx_valid_r <= tx_valid_r1;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)	send_token_r <= 1'b0;
	else
	if(send_token)	send_token_r <= 1'b1;
	else
	if(tx_ready)	send_token_r <= 1'b0;

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
	if(send_token || send_token_r)	tx_data_d = token_pid;
	else				tx_data_d = tx_data_data;

always @(dsel or tx_data_st or tx_spec_data)
	if(dsel)	tx_data_data = tx_spec_data;
	else		tx_data_data = tx_data_st;

always @(crc_sel1 or crc_sel2 or data_pid or crc16_rev)
	if(!crc_sel1 && !crc_sel2)	tx_spec_data = data_pid;
	else
	if(crc_sel1)			tx_spec_data = crc16_rev[15:8];	// CRC 1
	else				tx_spec_data = crc16_rev[7:0];	// CRC 2

assign tx_data = tx_data_d;

// TX Valid assignment
assign tx_valid_last = send_token | last;
assign tx_valid = tx_valid_d;

always @(posedge clk)
	tx_first_r <= send_token | send_data;

assign tx_first = (send_token | send_data) & ! tx_first_r;

// CRC Logic
always @(posedge clk)
	send_data_r <= send_data;

always @(posedge clk)
	send_data_r2 <= send_data_r;

assign crc16_clr = send_data & !send_data_r;

assign crc16_add =  !zero_length_r & (send_data_r & !send_data_r2) | (rd_next & !crc_sel1); 

always @(posedge clk)
	if(crc16_clr)		crc16 <= 16'hffff;
	else
	if(crc16_add)		crc16 <= crc16_next;


usbf_crc16 u1(
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

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)	state <= IDLE;
	else		state <= next_state;

always @(state or send_data or tx_ready or tx_valid_r or send_zero_length_r)
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
			if(send_zero_length_r && send_data)
			   begin
				tx_valid_d = 1'b1;
				next_state = WAIT;
				dsel = 1'b1;
			   end
			else
			if(send_data)			// Send DATA packet
			   begin
				tx_valid_d = 1'b1;
				next_state = DATA;
				dsel = 1'b1;
			   end
		   end
	   DATA:
		   begin
			if(tx_ready && tx_valid_r)
				rd_next = 1'b1;

			tx_valid_d = 1'b1;
			if(!send_data && tx_ready && tx_valid_r)
			   begin
				dsel = 1'b1;
				crc_sel1 = 1'b1;
				next_state = CRC1;
			   end
		   end
	   WAIT:		// In case of early tx_ready ...
		   begin
			crc_sel1 = 1'b1;
			dsel = 1'b1;
			tx_valid_d = 1'b1;
			next_state = CRC1;
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
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_pd.v,v 1.7 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.7 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.5  2001/11/03 03:26:22  rudi
//
//               - Fixed several interrupt and error condition reporting bugs
//
//               Revision 1.4  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.3  2001/09/10 15:54:20  rudi
//
//               Fixed crc5 checking.
//
//               Revision 1.2  2001/08/10 08:48:33  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:51  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.1.0.1  2001/02/28 08:10:59  rudi
//               Initial Release
//
//

`include "usbf_defines.v"

module usbf_pd(	clk, rst,

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
		seq_err
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

reg		got_pid_ack;

reg		token_valid_r1;
reg		token_valid_str1;

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

// PID Decoding Logic
assign pid_ld_en = pid_le_sm & rx_active & rx_valid;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)		pid <= 8'hf0;
	else
	if(pid_ld_en)		pid <= rx_data;

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
	if(token_le_1)	token0 <= rx_data;

always @(posedge clk)
	if(token_le_2)	token1 <= rx_data;

always @(posedge clk)
	token_valid_r1 <= token_le_2;

always @(posedge clk)
	token_valid_str1 <= token_valid_r1 | got_pid_ack;

assign token_valid = token_valid_str1;

// CRC 5 should perform the check in one cycle (flow through logic)
// 11 bits and crc5 input, 1 bit output
assign crc5_err = token_valid & (crc5_out2 != token_crc5);

usbf_crc5 u0(
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
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)		rxv1 <= 1'b0;
	else
	if(data_valid_d)	rxv1 <= 1'b1;
	else
	if(data_done)		rxv1 <= 1'b0;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)		rxv2 <= 1'b0;
	else
	if(rxv1 && data_valid_d)rxv2 <= 1'b1;
	else
	if(data_done)		rxv2 <= 1'b0;

always @(posedge clk)
	data_valid0 <= rxv2 & data_valid_d;

always @(posedge clk)
   begin
	if(data_valid_d)	d0 <= rx_data;
	if(data_valid_d)	d1 <= d0;
	if(data_valid_d)	d2 <= d1;
   end

assign rx_data_st = d2;
assign rx_data_valid = data_valid0;
assign rx_data_done = data_done;

// crc16 accumulates rx_data as long as data_valid_d is asserted.
// when data_done is asserted, crc16 reports status, and resets itself
// next cycle.
always @(posedge clk)
	rx_active_r <= rx_active;

assign crc16_clr = rx_active & !rx_active_r;

always @(posedge clk)
	if(crc16_clr)		crc16_sum <= 16'hffff;
	else
	if(data_valid_d)	crc16_sum <= crc16_out;

usbf_crc16 u1(
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

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)	state <= IDLE;
	else		state <= next_state;

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
	got_pid_ack = 1'b0;
	case(state)		// synopsys full_case parallel_case
	   IDLE:
		   begin
			pid_le_sm = 1'b1;
			if(rx_valid && rx_active)	next_state = ACTIVE;
		   end
	   ACTIVE:
		   begin
			// Received a ACK from Host
			if(pid_ACK && !rx_err)
			   begin
				got_pid_ack = 1'b1;
				if(!rx_active)	next_state = IDLE;
			   end
			else
			// Receiving a TOKEN
			if(pid_TOKEN && rx_valid && rx_active && !rx_err)
			   begin
				token_le_1 = 1'b1;
				next_state = TOKEN;
			   end
			else
			// Receiving DATA
			if(pid_DATA && rx_valid && rx_active && !rx_err)
			   begin
				data_valid_d = 1'b1;
				next_state = DATA;
			   end
			else
			if(	!rx_active || rx_err ||
				(rx_valid && !(pid_TOKEN || pid_DATA)) )
			   begin
				seq_err = !rx_err;
				if(!rx_active)	next_state = IDLE;
			   end
		   end
	   TOKEN:
		   begin
			if(rx_valid && rx_active && !rx_err)
			   begin
				token_le_2 = 1'b1;
				next_state = IDLE;
			   end
			else
			if(!rx_active || rx_err)
			   begin
				seq_err = !rx_err;
				if(!rx_active)	next_state = IDLE;
			   end
		   end
	   DATA:
		   begin
			if(rx_valid && rx_active && !rx_err)	data_valid_d = 1'b1;
			if(!rx_active || rx_err)
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
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_pe.v,v 1.8 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.8 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.7  2001/11/04 12:22:45  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.6  2001/11/03 03:26:22  rudi
//
//               - Fixed several interrupt and error condition reporting bugs
//
//               Revision 1.5  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.4  2001/09/23 08:39:33  rudi
//
//               Renamed DEBUG and VERBOSE_DEBUG to USBF_DEBUG and USBF_VERBOSE_DEBUG ...
//
//               Revision 1.3  2001/09/13 13:14:02  rudi
//
//               Fixed a problem that would sometimes prevent the core to come out of
//               reset and immediately be operational ...
//
//               Revision 1.2  2001/08/10 08:48:33  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:51  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.2  2001/03/07 09:08:13  rudi
//
//               Added USB control signaling (Line Status) block. Fixed some minor
//               typos, added resume bit and signal.
//
//               Revision 0.1.0.1  2001/02/28 08:11:07  rudi
//               Initial Release
//
//

`include "usbf_defines.v"

module usbf_pe(	clk, rst,

		// UTMI Interfaces
		tx_valid, rx_active,

		// PID Information
		pid_OUT, pid_IN, pid_SOF, pid_SETUP,
		pid_DATA0, pid_DATA1, pid_DATA2, pid_MDATA,
		pid_ACK, pid_NACK, pid_STALL, pid_NYET,
		pid_PRE, pid_ERR, pid_SPLIT, pid_PING,

		// Speed Mode
		mode_hs,

		// Token Information
		token_valid, crc5_err,

		// Receive Data Output
		rx_data_valid, rx_data_done, crc16_err,

		// Packet Assembler Interface
		send_token, token_pid_sel,
		data_pid_sel, send_zero_length,

		// IDMA Interface
		rx_dma_en, tx_dma_en,
		abort, idma_done,
		adr, size, buf_size,
		sizu_c, dma_en,

		// Register File Interface
		fsel, idin,
		dma_in_buf_sz1, dma_out_buf_avail,
		ep_sel, match, nse_err,
		buf0_rl, buf0_set, buf1_set,
		uc_bsel_set, uc_dpd_set,

		int_buf1_set, int_buf0_set, int_upid_set,
		int_crc16_set, int_to_set, int_seqerr_set,
		out_to_small,

		csr, buf0, buf1

		);

parameter	SSRAM_HADR = 14;

input		clk, rst;
input		tx_valid, rx_active;

// Packet Disassembler Interface
		// Decoded PIDs (used when token_valid is asserted)
input		pid_OUT, pid_IN, pid_SOF, pid_SETUP;
input		pid_DATA0, pid_DATA1, pid_DATA2, pid_MDATA;
input		pid_ACK, pid_NACK, pid_STALL, pid_NYET;
input		pid_PRE, pid_ERR, pid_SPLIT, pid_PING;

input		mode_hs;
input		token_valid;		// Token is valid
input		crc5_err;		// Token crc5 error

input		rx_data_valid;		// Data on rx_data_st is valid
input		rx_data_done;		// Indicates end of a transfer
input		crc16_err;		// Data packet CRC 16 error

// Packet Assembler Interface
output		send_token;
output	[1:0]	token_pid_sel;
output	[1:0]	data_pid_sel;
output		send_zero_length;

// IDMA Interface
output		rx_dma_en;	// Allows the data to be stored
output		tx_dma_en;	// Allows for data to be retrieved
output		abort;		// Abort Transfer (time_out, crc_err or rx_error)
input		idma_done;	// DMA is done indicator
output	[SSRAM_HADR + 2:0]	adr;		// Byte Address
output	[13:0]	size;		// Size in bytes
output	[13:0]	buf_size;	// Actual buffer size
input	[10:0]	sizu_c;		// Up and Down counting size registers, used to update
output		dma_en;		// USB external DMA mode enabled

// Register File interface
input		fsel;		// This function is selected
output	[31:0]	idin;		// Data Output
input	[3:0]	ep_sel;		// Endpoint Number Input
input		match;		// Endpoint Matched
output		nse_err;	// no such endpoint error
input		dma_in_buf_sz1, dma_out_buf_avail;

output		buf0_rl;	// Reload Buf 0 with original values
output		buf0_set;	// Write to buf 0
output		buf1_set;	// Write to buf 1
output		uc_bsel_set;	// Write to the uc_bsel field
output		uc_dpd_set;	// Write to the uc_dpd field
output		int_buf1_set;	// Set buf1 full/empty interrupt
output		int_buf0_set;	// Set buf0 full/empty interrupt
output		int_upid_set;	// Set unsupported PID interrupt
output		int_crc16_set;	// Set CRC16 error interrupt
output		int_to_set;	// Set time out interrupt
output		int_seqerr_set;	// Set PID sequence error interrupt
output		out_to_small;	// OUT packet was to small for DMA operation

input	[31:0]	csr;		// Internal CSR Output
input	[31:0]	buf0;		// Internal Buf 0 Output
input	[31:0]	buf1;		// Internal Buf 1 Output



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
wire		txfr_iso, txfr_bulk;		// Transfer Types
wire		ep_disabled, ep_stall;		// Endpoint forced conditions

wire		lrg_ok, sml_ok;		// Packet size acceptance
wire	[1:0]	tr_fr;			// Number of transfers per micro-frame
wire	[10:0]	max_pl_sz;		// Max payload size

wire	[1:0]	uc_dpd, uc_bsel;

// Buffer checks
wire		buf_sel;
reg		buf0_na, buf1_na;
wire	[SSRAM_HADR + 2:0]	buf0_adr, buf1_adr;
wire	[13:0]	buf0_sz, buf1_sz;
reg	[9:0]	/* synopsys enum state */ state, next_state;
// synopsys state_vector state

// PID next and current decoders
reg	[1:0]	next_dpid;
reg	[1:0]	this_dpid;
reg		pid_seq_err;
wire	[1:0]	tr_fr_d;

wire	[13:0]	size_next;
wire		buf_smaller;

reg	[SSRAM_HADR + 2:0]	adr;
reg	[13:0]	new_size;
reg	[13:0]	new_sizeb;
reg		buffer_full;
reg		buffer_empty;
wire	[SSRAM_HADR + 2:0]	new_adr;
reg		buffer_done;

reg		no_bufs0, no_bufs1;
wire		no_bufs;

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

reg		int_set_en;

wire	[1:0]	next_bsel;
reg		buf_set_d;
reg		uc_stat_set_d;
reg	[31:0]	idin;
reg		buf0_set, buf1_set;
reg		uc_bsel_set;
reg		uc_dpd_set;
reg		buf0_rl_d;
reg		buf0_rl;
wire		no_buf0_dma;
reg		buf0_st_max;
reg		buf1_st_max;

reg	[SSRAM_HADR + 2:0]	adr_r;
reg	[13:0]	size_next_r;

reg		in_token;
reg		out_token;
reg		setup_token;

wire		in_op, out_op;	// Indicate a IN or OUT operation
reg		to_small;	// Indicates a "to small packer" error
reg		to_large;	// Indicates a "to large packer" error

reg		buffer_overflow;
reg	[1:0]	allow_pid;

reg		nse_err;
reg		out_to_small, out_to_small_r;
reg		abort;

reg		buf0_not_aloc, buf1_not_aloc;

reg		send_zero_length;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

// Endpoint/CSR Decoding
assign IN_ep   = csr[27:26]==2'b01;
assign OUT_ep  = csr[27:26]==2'b10;
assign CTRL_ep = csr[27:26]==2'b00;

assign txfr_iso  = csr[25:24]==2'b01;
assign txfr_bulk = csr[25:24]==2'b10;

assign ep_disabled = csr[23:22]==2'b01;
assign ep_stall    = csr[23:22]==2'b10;

assign lrg_ok = csr[17];
assign sml_ok = csr[16];
assign dma_en = csr[15] & !CTRL_ep;

assign tr_fr = csr[12:11];
assign max_pl_sz = csr[10:0];

assign uc_dpd = csr[29:28];
assign uc_bsel = csr[31:30];

// Buffer decoding and allocation checks
assign buf0_adr = buf0[SSRAM_HADR + 2:0];
assign buf1_adr = buf1[SSRAM_HADR + 2:0];
assign buf0_sz  = buf0[30:17];
assign buf1_sz  = buf1[30:17];

// Buffers Not Available
always @(posedge clk)
	buf0_na <= buf0[31] | ( &buf0_adr );

always @(posedge clk)
	buf1_na <= buf1[31] | ( &buf1_adr );

// Buffer Not Allocated
always @(posedge clk)
	buf0_not_aloc <= &buf0_adr;

always @(posedge clk)
	buf1_not_aloc <= &buf1_adr;

always @(posedge clk)
	match_r <= match;

// No Such Endpoint Indicator
always @(posedge clk)
	nse_err <= token_valid & (pid_OUT | pid_IN | pid_SETUP) & !match;

always @(posedge clk)
	send_token <= send_token_d;

always @(posedge clk)
	token_pid_sel <= token_pid_sel_d;

///////////////////////////////////////////////////////////////////
//
// Data Pid Sequencer
//

assign tr_fr_d = mode_hs ? tr_fr : 2'h0;

always @(posedge clk)	// tr/mf:ep/type:tr/type:last dpd
	casex({tr_fr_d,csr[27:26],csr[25:24],uc_dpd})	// synopsys full_case parallel_case
	   8'b0?_01_01_??: next_dpid <= 2'b00;	// ISO txfr. IN, 1 tr/mf

	   8'b10_01_01_?0: next_dpid <= 2'b01;	// ISO txfr. IN, 2 tr/mf
	   8'b10_01_01_?1: next_dpid <= 2'b00;	// ISO txfr. IN, 2 tr/mf

	   8'b11_01_01_00: next_dpid <= 2'b01;	// ISO txfr. IN, 3 tr/mf
	   8'b11_01_01_01: next_dpid <= 2'b10;	// ISO txfr. IN, 3 tr/mf
	   8'b11_01_01_10: next_dpid <= 2'b00;	// ISO txfr. IN, 3 tr/mf

	   8'b0?_10_01_??: next_dpid <= 2'b00;	// ISO txfr. OUT, 1 tr/mf

	   8'b10_10_01_??: 				// ISO txfr. OUT, 2 tr/mf
			   begin	// Resynchronize in case of PID error
				case({pid_MDATA, pid_DATA1})	// synopsys full_case parallel_case
				  2'b10: next_dpid <= 2'b01;
				  2'b01: next_dpid <= 2'b00;
				endcase
			   end

	   8'b11_10_01_00: 				// ISO txfr. OUT, 3 tr/mf
			   begin	// Resynchronize in case of PID error
				case({pid_MDATA, pid_DATA2})	// synopsys full_case parallel_case
				  2'b10: next_dpid <= 2'b01;
				  2'b01: next_dpid <= 2'b00;
				endcase
			   end
	   8'b11_10_01_01: 				// ISO txfr. OUT, 3 tr/mf
			   begin	// Resynchronize in case of PID error
				case({pid_MDATA, pid_DATA2})	// synopsys full_case parallel_case
				  2'b10: next_dpid <= 2'b10;
				  2'b01: next_dpid <= 2'b00;
				endcase
			   end
	   8'b11_10_01_10: 				// ISO txfr. OUT, 3 tr/mf
			   begin	// Resynchronize in case of PID error
				case({pid_MDATA, pid_DATA2})	// synopsys full_case parallel_case
				  2'b10: next_dpid <= 2'b01;
				  2'b01: next_dpid <= 2'b00;
				endcase
			   end

	   8'b??_01_00_?0,				// IN/OUT endpoint only
	   8'b??_10_00_?0: next_dpid <= 2'b01;	// INT transfers

	   8'b??_01_00_?1,				// IN/OUT endpoint only
	   8'b??_10_00_?1: next_dpid <= 2'b00;	// INT transfers

	   8'b??_01_10_?0,				// IN/OUT endpoint only
	   8'b??_10_10_?0: next_dpid <= 2'b01;	// BULK transfers

	   8'b??_01_10_?1,				// IN/OUT endpoint only
	   8'b??_10_10_?1: next_dpid <= 2'b00;	// BULK transfers

	   8'b??_00_??_??:				// CTRL Endpoint
		casex({setup_token, in_op, out_op, uc_dpd})	// synopsys full_case parallel_case
		   5'b1_??_??: next_dpid <= 2'b11;	// SETUP operation
		   5'b0_10_0?: next_dpid <= 2'b11;	// IN operation
		   5'b0_10_1?: next_dpid <= 2'b01;	// IN operation
		   5'b0_01_?0: next_dpid <= 2'b11;	// OUT operation
		   5'b0_01_?1: next_dpid <= 2'b10;	// OUT operation
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
	casex({tr_fr_d,csr[27:26],csr[25:24],uc_dpd})	// synopsys full_case parallel_case
	   8'b0?_01_01_??: this_dpid <= 2'b00;	// ISO txfr. IN, 1 tr/mf

	   8'b10_01_01_?0: this_dpid <= 2'b01;	// ISO txfr. IN, 2 tr/mf
	   8'b10_01_01_?1: this_dpid <= 2'b00;	// ISO txfr. IN, 2 tr/mf

	   8'b11_01_01_00: this_dpid <= 2'b10;	// ISO txfr. IN, 3 tr/mf
	   8'b11_01_01_01: this_dpid <= 2'b01;	// ISO txfr. IN, 3 tr/mf
	   8'b11_01_01_10: this_dpid <= 2'b00;	// ISO txfr. IN, 3 tr/mf

	   8'b00_10_01_??: this_dpid <= allow_pid;	// ISO txfr. OUT, 0 tr/mf
	   8'b01_10_01_??: this_dpid <= 2'b00;	// ISO txfr. OUT, 1 tr/mf

	   8'b10_10_01_?0: this_dpid <= 2'b11;	// ISO txfr. OUT, 2 tr/mf
	   8'b10_10_01_?1: this_dpid <= 2'b01;	// ISO txfr. OUT, 2 tr/mf

	   8'b11_10_01_00: this_dpid <= 2'b11;	// ISO txfr. OUT, 3 tr/mf
	   8'b11_10_01_01: this_dpid <= 2'b11;	// ISO txfr. OUT, 3 tr/mf
	   8'b11_10_01_10: this_dpid <= 2'b10;	// ISO txfr. OUT, 3 tr/mf

	   8'b??_01_00_?0,				// IN/OUT endpoint only
	   8'b??_10_00_?0: this_dpid <= 2'b00;	// INT transfers
	   8'b??_01_00_?1,				// IN/OUT endpoint only
	   8'b??_10_00_?1: this_dpid <= 2'b01;	// INT transfers

	   8'b??_01_10_?0,				// IN/OUT endpoint only
	   8'b??_10_10_?0: this_dpid <= 2'b00;	// BULK transfers
	   8'b??_01_10_?1,				// IN/OUT endpoint only
	   8'b??_10_10_?1: this_dpid <= 2'b01;	// BULK transfers

	   8'b??_00_??_??:				// CTRL Endpoint
		casex({setup_token,in_op, out_op, uc_dpd})	// synopsys full_case parallel_case
		   5'b1_??_??: this_dpid <= 2'b00;	// SETUP operation
		   5'b0_10_0?: this_dpid <= 2'b00;	// IN operation
		   5'b0_10_1?: this_dpid <= 2'b01;	// IN operation
		   5'b0_01_?0: this_dpid <= 2'b00;	// OUT operation
		   5'b0_01_?1: this_dpid <= 2'b01;	// OUT operation
		endcase
	endcase

// Assign PID for outgoing packets
assign data_pid_sel = this_dpid;

// Verify PID for incoming data packets
always @(posedge clk)
	pid_seq_err <= !(	(this_dpid==2'b00 & pid_DATA0) |
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
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			in_token <= 1'b0;
	else
	if(pid_IN)			in_token <= 1'b1;
	else
	if(pid_OUT || pid_SETUP)	in_token <= 1'b0;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			out_token <= 1'b0;
	else
	if(pid_OUT || pid_SETUP)	out_token <= 1'b1;
	else
	if(pid_IN)			out_token <= 1'b0;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)			setup_token <= 1'b0;
	else
	if(pid_SETUP)			setup_token <= 1'b1;
	else
	if(pid_OUT || pid_IN)		setup_token <= 1'b0;

// Indicates if we are performing an IN operation
assign	in_op = IN_ep | (CTRL_ep & in_token);

// Indicates if we are performing an OUT operation
assign	out_op = OUT_ep | (CTRL_ep & out_token);

// Select buffer: buf_sel==0 buffer0; buf_sel==1 buffer1
assign buf_sel =  dma_en ? 1'b0 : CTRL_ep ? in_token : ((uc_bsel[0] | buf0_na) & !buf1_na);

// Select Address for IDMA
always @(posedge clk)
	adr <= buf_sel ? buf1_adr : buf0_adr;

// Size from Buffer
assign buf_size = buf_sel ? buf1_sz  : buf0_sz;

// Determine which is smaller: buffer or max_pl_sz
assign buf_smaller = buf_size < {3'h0, max_pl_sz};

// Determine actual size for this transfer (for IDMA) IN endpoint only
// (OUT endpoint uses sizeu_c from IDMA)
assign size_next = buf_smaller ? buf_size : max_pl_sz;
assign size = size_next;	// "size" is an output for IDMA

// Buffer Full (only for OUT endpoints)
// Indicates that there is not enough space in the buffer for one
// more max_pl_sz packet
always @(posedge clk)
	buffer_full <= new_size < {3'h0, max_pl_sz};

// Buffer Empty (only for IN endpoints)
// Indicates that there are zero bytes left in the buffer
always @(posedge clk)
	buffer_empty <= (new_size == 14'h0);

// Joint buffer full/empty flag This is the "USED" flag
always @(posedge clk)
	buffer_done <= in_op ? buffer_empty : buffer_full;

// No More buffer space at all (For high speed out - issue NYET)
assign no_buf0_dma = dma_en &
		((IN_ep & !dma_in_buf_sz1) | (OUT_ep & !dma_out_buf_avail));

always @(posedge clk)
	buf0_st_max <= (buf0_sz < {3'h0, max_pl_sz});

always @(posedge clk)
	buf1_st_max <= (buf1_sz < {3'h0, max_pl_sz});

always @(posedge clk)
	no_bufs0 <= buf0_na | no_buf0_dma |
			(buf_sel ? buf0_st_max : (buffer_full & !dma_en));

always @(posedge clk)
	no_bufs1 <= buf1_na | (buf_sel ? buffer_full : buf1_st_max);

assign no_bufs = no_bufs0 & no_bufs1;

// New Size (to be written to register file)
always @(posedge clk)
	new_sizeb <= (out_op && dma_en) ? max_pl_sz : (in_op ? size_next : sizu_c);

always @(posedge clk)
	new_size <= buf_size - new_sizeb;


// New Buffer Address (to be written to register file)
always @(posedge clk)
	adr_r <= adr;

always @(posedge clk)
	size_next_r <= size_next;

assign new_adr = adr_r[SSRAM_HADR + 2:0] +
		((out_op && dma_en) ? {{SSRAM_HADR + 2-10{1'b0}}, max_pl_sz[10:0]} :
		(in_op ? {{SSRAM_HADR + 2-13{1'b0}}, size_next_r[13:0] } :
		{ {SSRAM_HADR + 2-10{1'b0}}, sizu_c[10:0]}));

// Buffer Overflow
always @(posedge clk)
	buffer_overflow <= ( {3'h0, sizu_c} > buf_size) & rx_data_valid;


// OUT packet smaller than MAX_PL_SZ in DMA operation
always @(posedge clk)
	out_to_small_r <= uc_stat_set_d & out_op & dma_en & (sizu_c != max_pl_sz);

always @(posedge clk)
	out_to_small <= out_to_small_r;

///////////////////////////////////////////////////////////////////
//
// Determine if packet is to small or to large
// This is used to NACK and ignore packet for OUT endpoints
//

always @(posedge clk)
	to_small <= !sml_ok & (sizu_c < max_pl_sz);

always @(posedge clk)
	to_large <= !lrg_ok & (sizu_c > max_pl_sz);

///////////////////////////////////////////////////////////////////
//
// Register File Update Logic
//

assign next_bsel = dma_en ? 2'h0 : buffer_done ? uc_bsel + 2'h1 : uc_bsel;	// FIX_ME

always @(posedge clk)
	idin[31:17] <= out_to_small_r ? {4'h0,sizu_c} : {buffer_done,new_size};

always @(posedge clk)
	idin[SSRAM_HADR + 2:4] <= out_to_small_r ?	buf0_adr[SSRAM_HADR + 2:4] :
							new_adr[SSRAM_HADR + 2:4];

always @(posedge clk)
	if(buf_set_d)			idin[3:0] <= new_adr[3:0];
	else
	if(out_to_small_r)		idin[3:0] <= buf0_adr[3:0];
	else				idin[3:0] <= {next_dpid, next_bsel};

always @(posedge clk)
	buf0_set <= !buf_sel & buf_set_d;

always @(posedge clk)
	buf1_set <= buf_sel & buf_set_d;

always @(posedge clk)
	uc_bsel_set <= uc_stat_set_d;

always @(posedge clk)
	uc_dpd_set <= uc_stat_set_d;

always @(posedge clk)
	buf0_rl <= buf0_rl_d;

// Abort signal
always @(posedge clk)
	abort <= buffer_overflow | (match & (state != IDLE) ) | (match_r & to_large);

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
	rx_ack_to_clr <= tx_valid | rx_ack_to_clr_d;

always @(posedge clk)
	if(rx_ack_to_clr)	rx_ack_to_cnt <= 8'h0;
	else			rx_ack_to_cnt <= rx_ack_to_cnt + 8'h1;

always @(posedge clk)
	rx_ack_to <= (rx_ack_to_cnt == rx_ack_to_val);

assign rx_ack_to_val = mode_hs ? `USBF_RX_ACK_TO_VAL_HS : `USBF_RX_ACK_TO_VAL_FS;

// After sending a OUT token the host must send a data packet.
// The host has 622nS in Full Speed mode and 400nS in High Speed
// mode to send the data packet.
// "tx_data_to" indicates when this time has expired.
// "tx_data_to_clr" clears the timer

assign	tx_data_to_clr = rx_active;

always @(posedge clk)
	if(tx_data_to_clr)	tx_data_to_cnt <= 8'h0;
	else			tx_data_to_cnt <= tx_data_to_cnt + 8'h1;

always @(posedge clk)
	tx_data_to <= (tx_data_to_cnt == tx_data_to_val);

assign tx_data_to_val = mode_hs ? `USBF_TX_DATA_TO_VAL_HS : `USBF_TX_DATA_TO_VAL_FS;

///////////////////////////////////////////////////////////////////
//
// Interrupts
//
reg	pid_OUT_r, pid_IN_r, pid_PING_r, pid_SETUP_r;

assign int_buf1_set = !buf_sel & buffer_done & int_set_en & !buf1_not_aloc;
assign int_buf0_set =  buf_sel & buffer_done & int_set_en & !buf0_not_aloc;

always @(posedge clk)
	pid_OUT_r <= pid_OUT;

always @(posedge clk)
	pid_IN_r <= pid_IN;

always @(posedge clk)
	pid_PING_r <= pid_PING;

always @(posedge clk)
	pid_SETUP_r <= pid_SETUP;

always @(posedge clk)
	int_upid_set <= match_r & !pid_SOF & (
				( OUT_ep & !(pid_OUT_r | pid_PING_r))		|
				(  IN_ep &  !pid_IN_r)				|
				(CTRL_ep & !(pid_IN_r | pid_OUT_r | pid_PING_r | pid_SETUP_r))
					);

assign int_to_set  = ((state == IN2) & rx_ack_to) | ((state == OUT) & tx_data_to);

assign int_crc16_set = rx_data_done & crc16_err;

always @(posedge clk)
	int_seqerr_set <= int_seqerr_set_d;

///////////////////////////////////////////////////////////////////
//
// Main Protocol State Machine
//

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)	state <= IDLE;
	else
	if(match)	state <= IDLE;
	else		state <= next_state;

always @(state or ep_stall or buf0_na or buf1_na or
	pid_seq_err or idma_done or token_valid or pid_ACK or rx_data_done or
	tx_data_to or crc16_err or ep_disabled or no_bufs or mode_hs
	or dma_en or rx_ack_to or pid_PING or txfr_iso or to_small or to_large or
	CTRL_ep or pid_IN or pid_OUT or IN_ep or OUT_ep or pid_SETUP or pid_SOF
	or match_r or abort or buffer_done or no_buf0_dma or max_pl_sz)
   begin
	next_state = state;
	token_pid_sel_d = ACK;
	send_token_d = 1'b0;
	rx_dma_en = 1'b0;
	tx_dma_en = 1'b0;
	buf_set_d = 1'b0;
	uc_stat_set_d = 1'b0;
	buf0_rl_d = 1'b0;
	int_set_en = 1'b0;
	rx_ack_to_clr_d = 1'b1;
	int_seqerr_set_d = 1'b0;
	send_zero_length = 1'b0;

	case(state)	// synopsys full_case parallel_case
	   IDLE:
		   begin
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state IDLE (%t)", $time);
`endif
`ifdef USBF_DEBUG
		if(rst && match_r && !ep_disabled && !pid_SOF)
		begin
		if(match_r === 1'bx)	$display("ERROR: IDLE: match_r is unknown. (%t)", $time);
		if(ep_disabled === 1'bx)$display("ERROR: IDLE: ep_disabled is unknown. (%t)", $time);
		if(pid_SOF === 1'bx)	$display("ERROR: IDLE: pid_SOF is unknown. (%t)", $time);
		if(ep_stall === 1'bx)	$display("ERROR: IDLE: ep_stall is unknown. (%t)", $time);
		if(buf0_na === 1'bx)	$display("ERROR: IDLE: buf0_na is unknown. (%t)", $time);
		if(buf1_na === 1'bx)	$display("ERROR: IDLE: buf1_na is unknown. (%t)", $time);
		if(no_buf0_dma === 1'bx)$display("ERROR: IDLE: no_buf0_dma is unknown. (%t)", $time);
		if(CTRL_ep === 1'bx)	$display("ERROR: IDLE: CTRL_ep is unknown. (%t)", $time);
		if(pid_IN === 1'bx)	$display("ERROR: IDLE: pid_IN is unknown. (%t)", $time);
		if(pid_OUT === 1'bx)	$display("ERROR: IDLE: pid_OUT is unknown. (%t)", $time);
		if(pid_SETUP === 1'bx)	$display("ERROR: IDLE: pid_SETUP is unknown. (%t)", $time);
		if(pid_PING === 1'bx)	$display("ERROR: IDLE: pid_PING is unknown. (%t)", $time);
		if(mode_hs === 1'bx)	$display("ERROR: IDLE: mode_hs is unknown. (%t)", $time);
		if(IN_ep === 1'bx)	$display("ERROR: IDLE: IN_ep is unknown. (%t)", $time);
		if(OUT_ep === 1'bx)	$display("ERROR: IDLE: OUT_ep is unknown. (%t)", $time);
		end
`endif
// synopsys translate_on

			if(match_r && !ep_disabled && !pid_SOF)
			   begin
				if(ep_stall)		// Halt Forced send STALL
				   begin
					token_pid_sel_d = STALL;
					send_token_d = 1'b1;
					next_state = TOKEN;
				   end
				else
				if(	(buf0_na && buf1_na) || no_buf0_dma ||
					(CTRL_ep && pid_IN   && buf1_na) ||
					(CTRL_ep && pid_OUT  && buf0_na) 
					)
				   begin		// No buffers send NAK
					token_pid_sel_d = NACK;
					send_token_d = 1'b1;
					next_state = TOKEN;
				   end
				else
				if(pid_PING && mode_hs)
				   begin
					token_pid_sel_d = ACK;
					send_token_d = 1'b1;
					next_state = TOKEN;
				   end
				else
				if(IN_ep || (CTRL_ep && pid_IN))
				   begin
					if(max_pl_sz == 11'h0)	send_zero_length = 1'b1;
					tx_dma_en = 1'b1;
					next_state = IN;
				   end
				else
				if(OUT_ep || (CTRL_ep && (pid_OUT || pid_SETUP)))
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
			if(token_valid && pid_ACK)
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
			if(tx_data_to || crc16_err || abort )
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

	   OUT2A:
		   begin	// This is a delay State to NACK to small or to
				// large packets. this state could be skipped
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state OUT2A (%t)", $time);
`endif
`ifdef USBF_DEBUG
		if(abort === 1'bx)	$display("ERROR: OUT2A: abort is unknown. (%t)", $time);
`endif
// synopsys translate_on
			if(abort)	next_state = IDLE;
			else		next_state = OUT2B;
		   end
	   OUT2B:
		   begin	// Send ACK/NACK/NYET
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state OUT2B (%t)", $time);
`endif
`ifdef USBF_DEBUG
		if(abort === 1'bx)	$display("ERROR: OUT2B: abort is unknown. (%t)", $time);
		if(to_small === 1'bx)	$display("ERROR: OUT2B: to_small is unknown. (%t)", $time);
		if(to_large === 1'bx)	$display("ERROR: OUT2B: to_large is unknown. (%t)", $time);
		if(pid_seq_err === 1'bx)$display("ERROR: OUT2B: rx_data_done is unknown. (%t)", $time);
		if(mode_hs === 1'bx)	$display("ERROR: OUT2B: mode_hs is unknown. (%t)", $time);
		if(no_bufs === 1'bx)	$display("ERROR: OUT2B: no_bufs is unknown. (%t)", $time);
`endif
// synopsys translate_on
			if(abort)	next_state = IDLE;
			else
			if(to_small || to_large)
			   begin
				token_pid_sel_d = NACK;
				next_state = IDLE;
			   end
			else
			if(pid_seq_err)	
			   begin
				token_pid_sel_d = ACK;
				send_token_d = 1'b1;
				next_state = IDLE;
			   end
			else
			   begin
				if(mode_hs && no_bufs)	token_pid_sel_d = NYET;
				else			token_pid_sel_d = ACK;
				send_token_d = 1'b1;
				next_state = UPDATE;
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
`ifdef USBF_DEBUG
		if(buffer_done === 1'bx)	$display("ERROR: UPDATE: buffer_done is unknown. (%t)", $time);
		if(dma_en === 1'bx)	$display("ERROR: UPDATE: dma_en is unknown. (%t)", $time);
`endif
// synopsys translate_on
			// Interrupts
			int_set_en = 1'b1;
			// Buffer (used, size, adr) set or reload
			if(buffer_done && dma_en)
			   begin
				buf0_rl_d = 1'b1;
			   end
			else
			   begin
				buf_set_d = 1'b1;
			   end
			next_state = UPDATE2;
		   end
	   UPDATE2:	// Update Register File & state
		   begin
// synopsys translate_off
`ifdef USBF_VERBOSE_DEBUG
		$display("PE: Entered state UPDATE2 (%t)", $time);
`endif
// synopsys translate_on
			// pid sequence & buffer usage
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
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_pl.v,v 1.5 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.5 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.4  2001/11/04 12:22:45  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.3  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.2  2001/08/10 08:48:33  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:52  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.1.0.1  2001/02/28 08:11:11  rudi
//               Initial Release
//
//

`include "usbf_defines.v"

module usbf_pl(	clk, rst,

		// UTMI Interface
		rx_data, rx_valid, rx_active, rx_err,
		tx_data, tx_valid, tx_valid_last, tx_ready,
		tx_first, tx_valid_out,
		mode_hs, usb_reset, usb_suspend, usb_attached,

		// memory interface
		madr, mdout, mdin, mwe, mreq, mack,

		// Register File Interface
		fa, idin,
		ep_sel, match,
		dma_in_buf_sz1, dma_out_buf_avail,
		buf0_rl, buf0_set, buf1_set,
		uc_bsel_set, uc_dpd_set,

		int_buf1_set, int_buf0_set, int_upid_set,
		int_crc16_set, int_to_set, int_seqerr_set,
		out_to_small, csr, buf0, buf1,

		// Misc
		frm_nat,
		pid_cs_err, nse_err,
		crc5_err
		);

parameter	SSRAM_HADR = 14;

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
input		mode_hs;	// High Speed Mode
input		usb_reset;	// USB Reset
input		usb_suspend;	// USB Suspend
input		usb_attached;	// Attached to USB

// Memory Arbiter Interface
output	[SSRAM_HADR:0]	madr;		// word address
output	[31:0]	mdout;
input	[31:0]	mdin;
output		mwe;
output		mreq;
input		mack;

// Register File interface
input	[6:0]	fa;		// Function Address (as set by the controller)
output	[31:0]	idin;		// Data Input
output	[3:0]	ep_sel;		// Endpoint Number Input
input		match;		// Endpoint Matched
input		dma_in_buf_sz1;
input		dma_out_buf_avail;
output		nse_err;	// no such endpoint error

output		buf0_rl;	// Reload Buf 0 with original values
output		buf0_set;	// Write to buf 0
output		buf1_set;	// Write to buf 1
output		uc_bsel_set;	// Write to the uc_bsel field
output		uc_dpd_set;	// Write to the uc_dpd field
output		int_buf1_set;	// Set buf1 full/empty interrupt
output		int_buf0_set;	// Set buf0 full/empty interrupt
output		int_upid_set;	// Set unsupported PID interrupt
output		int_crc16_set;	// Set CRC16 error interrupt
output		int_to_set;	// Set time out interrupt
output		int_seqerr_set;	// Set PID sequence error interrupt
output		out_to_small;	// OUT packet was to small for DMA operation

input	[31:0]	csr;		// Internal CSR Output
input	[31:0]	buf0;		// Internal Buf 0 Output
input	[31:0]	buf1;		// Internal Buf 1 Output

// Misc
output		pid_cs_err;	// pid checksum error
output		crc5_err;	// crc5 error
output	[31:0]	frm_nat;

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
wire	[7:0]	rx_data_st;
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
wire		rd_next;

// IDMA Interface
wire		rx_dma_en;	// Allows the data to be stored
wire		tx_dma_en;	// Allows for data to be retrieved
wire		abort;		// Abort Transfer (time_out, crc_err or rx_error)
wire		idma_done;	// DMA is done
wire	[SSRAM_HADR + 2:0]	adr;		// Byte Address
wire	[13:0]	size;		// Size in bytes
wire	[10:0]	sizu_c;		// Up and Down counting size registers, used
				// to update
wire	[13:0]	buf_size;	// Actual buffer size
wire		dma_en;		// external dma enabled

// Memory Arbiter Interface
wire	[SSRAM_HADR:0]	madr;	// word address
wire	[31:0]	mdout;
wire	[31:0]	mdin;
wire		mwe;
wire		mreq;
wire		mack;

// Local signals
wire		pid_bad, pid_bad1, pid_bad2;

reg		hms_clk;	// 0.5 Micro Second Clock
reg	[4:0]	hms_cnt;
reg	[10:0]	frame_no_r;	// Current Frame Number register
wire		frame_no_we;
reg		frame_no_same;	// Indicates current and prev. frame numbers
				// are equal
reg	[3:0]	mfm_cnt;	// Micro Frame Counter
reg	[11:0]	sof_time;	// Time since last sof
reg		clr_sof_time;
wire		fsel;		// This Function is selected
wire		match_o;

reg		frame_no_we_r;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

// PIDs we should never receive
assign pid_bad1 = pid_ACK | pid_NACK | pid_STALL | pid_NYET | pid_PRE |
			pid_ERR | pid_SPLIT;

// PIDs we should never get in full speed mode (high speed mode only)
assign pid_bad2 = !mode_hs & pid_PING;

// All bad pids
assign pid_bad = pid_bad1 | pid_bad2;

assign match_o = !pid_bad & fsel & match & token_valid & !crc5_err;

// Frame Number (from SOF token)
assign frame_no_we = token_valid & !crc5_err & pid_SOF;

always @(posedge clk)
	frame_no_we_r <= frame_no_we;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)		frame_no_r <= 11'h0;
	else
	if(frame_no_we_r)	frame_no_r <= frame_no;

// Micro Frame Counter
always @(posedge clk)
	frame_no_same <= frame_no_we & (frame_no_r == frame_no);

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)		mfm_cnt <= 4'h0;
	else
	if(frame_no_we_r && !frame_no_same)
				mfm_cnt <= 4'h0;
	else
	if(frame_no_same)	mfm_cnt <= mfm_cnt + 4'h1;

//SOF delay counter
always @(posedge clk)
	clr_sof_time <= frame_no_we;

always @(posedge clk)
	if(clr_sof_time)	sof_time <= 12'h0;
	else
	if(hms_clk)		sof_time <= sof_time + 12'h1;

assign frm_nat = {mfm_cnt, 1'b0, frame_no_r, 4'h0, sof_time};

// 0.5 Micro Seconds Clock Generator
`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)				hms_cnt <= 5'h0;
	else
	if(hms_clk || frame_no_we_r)		hms_cnt <= 5'h0;
	else					hms_cnt <= hms_cnt + 5'h1;

always @(posedge clk)
	hms_clk <= (hms_cnt == `USBF_HMS_DEL);

///////////////////////////////////////////////////////////////////

// This function is addressed
assign fsel = (token_fadr == fa);

///////////////////////////////////////////////////////////////////
//
// Module Instantiations
//

//Packet Decoder
usbf_pd	u0(	.clk(			clk			),
		.rst(			rst			),
		.rx_data(		rx_data			),
		.rx_valid(		rx_valid		),
		.rx_active(		rx_active		),
		.rx_err(		rx_err			),
		.pid_OUT(		pid_OUT			),
		.pid_IN(		pid_IN			),
		.pid_SOF(		pid_SOF			),
		.pid_SETUP(		pid_SETUP		),
		.pid_DATA0(		pid_DATA0		),
		.pid_DATA1(		pid_DATA1		),
		.pid_DATA2(		pid_DATA2		),
		.pid_MDATA(		pid_MDATA		),
		.pid_ACK(		pid_ACK			),
		.pid_NACK(		pid_NACK		),
		.pid_STALL(		pid_STALL		),
		.pid_NYET(		pid_NYET		),
		.pid_PRE(		pid_PRE			),
		.pid_ERR(		pid_ERR			),
		.pid_SPLIT(		pid_SPLIT		),
		.pid_PING(		pid_PING		),
		.pid_cks_err(		pid_cs_err		),
		.token_fadr(		token_fadr		),
		.token_endp(		ep_sel			),
		.token_valid(		token_valid		),
		.crc5_err(		crc5_err		),
		.frame_no(		frame_no		),
		.rx_data_st(		rx_data_st		),
		.rx_data_valid(		rx_data_valid		),
		.rx_data_done(		rx_data_done		),
		.crc16_err(		crc16_err		),
		.seq_err(		rx_seq_err		)
		);

// Packet Assembler
usbf_pa	u1(	.clk(			clk			),
		.rst(			rst			),
		.tx_data(		tx_data			),
		.tx_valid(		tx_valid		),
		.tx_valid_last(		tx_valid_last		),
		.tx_ready(		tx_ready		),
		.tx_first(		tx_first		),
		.send_token(		send_token		),
		.token_pid_sel(		token_pid_sel		),
		.send_data(		send_data		),
		.data_pid_sel(		data_pid_sel		),
		.send_zero_length(	send_zero_length	),
		.tx_data_st(		tx_data_st		),
		.rd_next(		rd_next			)
		);

// Internal DMA / Memory Arbiter Interface
usbf_idma #(SSRAM_HADR)
	u2(	.clk(			clk			),
		.rst(			rst			),
		.rx_data_st(		rx_data_st		),
		.rx_data_valid(		rx_data_valid		),
		.rx_data_done(		rx_data_done		),
		.send_data(		send_data		),
		.tx_data_st(		tx_data_st		),
		.rd_next(		rd_next			),
		.rx_dma_en(		rx_dma_en		),
		.tx_dma_en(		tx_dma_en		),
		.abort(			abort			),
		.idma_done(		idma_done		),
		.adr(			adr			),
		.size(			size			),
		.buf_size(		buf_size		),
		.dma_en(		dma_en			),
		.send_zero_length(	send_zero_length	),
		.madr(			madr			),
		.sizu_c(		sizu_c			),
		.mdout(			mdout			),
		.mdin(			mdin			),
		.mwe(			mwe			),
		.mreq(			mreq			),
		.mack(			mack			)
		);

// Protocol Engine
usbf_pe #(SSRAM_HADR)
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
		.pid_NACK(		pid_NACK		),
		.pid_STALL(		pid_STALL		),
		.pid_NYET(		pid_NYET		),
		.pid_PRE(		pid_PRE			),
		.pid_ERR(		pid_ERR			),
		.pid_SPLIT(		pid_SPLIT		),
		.pid_PING(		pid_PING		),
		.mode_hs(		mode_hs			),
		.token_valid(		token_valid		),
		.crc5_err(		crc5_err		),
		.rx_data_valid(		rx_data_valid		),
		.rx_data_done(		rx_data_done		),
		.crc16_err(		crc16_err		),
		.send_token(		send_token		),
		.token_pid_sel(		token_pid_sel		),
		.data_pid_sel(		data_pid_sel		),
		.send_zero_length(	send_zero_length	),
		.rx_dma_en(		rx_dma_en		),
		.tx_dma_en(		tx_dma_en		),
		.abort(			abort			),
		.idma_done(		idma_done		),
		.adr(			adr			),
		.size(			size			),
		.buf_size(		buf_size		),
		.sizu_c(		sizu_c			),
		.dma_en(		dma_en			),
		.fsel(			fsel			),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.match(			match_o			),
		.dma_in_buf_sz1(	dma_in_buf_sz1		),
		.dma_out_buf_avail(	dma_out_buf_avail	),
		.nse_err(		nse_err			),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			csr			),
		.buf0(			buf0			),
		.buf1(			buf1			)
		);

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Register File                                              ////
////  This module contains all top level registers and           ////
////  instantiates the register files for endpoints              ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_rf.v,v 1.6 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.6 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.5  2001/11/04 12:22:45  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.4  2001/11/03 03:26:23  rudi
//
//               - Fixed several interrupt and error condition reporting bugs
//
//               Revision 1.3  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.2  2001/08/10 08:48:33  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:52  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.2  2001/03/07 09:08:13  rudi
//
//               Added USB controll signaling (Line Status) block. Fixed some minor
//               typos, added resume bit and signal.
//
//               Revision 0.1.0.1  2001/02/28 08:11:32  rudi
//               Initial Release
//
//

`include "usbf_defines.v"

// Endpoint register File
module usbf_rf(	clk, wclk, rst,

		// Wishbone Interface
		adr, re, we, din, dout, inta, intb,
		dma_req, dma_ack,

		// Internal Interface
		idin,
		ep_sel, match,
		buf0_rl, buf0_set, buf1_set,
		uc_bsel_set, uc_dpd_set,

		int_buf1_set, int_buf0_set, int_upid_set,
		int_crc16_set, int_to_set, int_seqerr_set,
		out_to_small,

		csr, buf0, buf1,
		funct_adr,
		dma_in_buf_sz1, dma_out_buf_avail,

		// Misc
		frm_nat,
		utmi_vend_stat, utmi_vend_ctrl, utmi_vend_wr,
		line_stat, usb_attached, mode_hs, suspend,
		attached, usb_reset, pid_cs_err, nse_err,
		crc5_err, rx_err, rf_resume_req
		);

input		clk, wclk, rst;
input	[6:0]	adr;
input		re;
input		we;
input	[31:0]	din;
output	[31:0]	dout;
output		inta, intb;
output	[15:0]	dma_req;
input	[15:0]	dma_ack;

input	[31:0]	idin;		// Data Input
input	[3:0]	ep_sel;		// Endpoint Number Input
output		match;		// Endpoint Matched
input		buf0_rl;	// Reload Buf 0 with original values

input		buf0_set;	// Write to buf 0
input		buf1_set;	// Write to buf 1
input		uc_bsel_set;	// Write to the uc_bsel field
input		uc_dpd_set;	// Write to the uc_dpd field
input		int_buf1_set;	// Set buf1 full/empty interrupt
input		int_buf0_set;	// Set buf0 full/empty interrupt
input		int_upid_set;	// Set unsupported PID interrupt
input		int_crc16_set;	// Set CRC16 error interrupt
input		int_to_set;	// Set time out interrupt
input		int_seqerr_set;	// Set PID Sequence Error Interrupt
input		out_to_small;	// OUT packet was to small for DMA operation

output	[31:0]	csr;		// Internal CSR Output
output	[31:0]	buf0;		// Internal Buf 0 Output
output	[31:0]	buf1;		// Internal Buf 1 Output
output	[6:0]	funct_adr;	// Function Address
output		dma_in_buf_sz1, dma_out_buf_avail;

input	[31:0]	frm_nat;

input	[7:0]	utmi_vend_stat;	// UTMI Vendor C/S bus
output	[3:0]	utmi_vend_ctrl;
output		utmi_vend_wr;

input	[1:0]	line_stat;	// Below are signals for interrupt generation
input		usb_attached;
input		mode_hs;
input		suspend;
input		attached;
input		usb_reset;
input		nse_err;
input		pid_cs_err;
input		crc5_err;
input		rx_err;
output		rf_resume_req;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

wire	[31:0]	ep0_dout, ep1_dout, ep2_dout, ep3_dout;
wire	[31:0]	ep4_dout, ep5_dout, ep6_dout, ep7_dout;
wire	[31:0]	ep8_dout, ep9_dout, ep10_dout, ep11_dout;
wire	[31:0]	ep12_dout, ep13_dout, ep14_dout, ep15_dout;

wire		ep0_re, ep1_re, ep2_re, ep3_re;
wire		ep4_re, ep5_re, ep6_re, ep7_re;
wire		ep8_re, ep9_re, ep10_re, ep11_re;
wire		ep12_re, ep13_re, ep14_re, ep15_re;

wire		ep0_we, ep1_we, ep2_we, ep3_we;
wire		ep4_we, ep5_we, ep6_we, ep7_we;
wire		ep8_we, ep9_we, ep10_we, ep11_we;
wire		ep12_we, ep13_we, ep14_we, ep15_we;

wire		ep0_inta, ep1_inta, ep2_inta, ep3_inta;
wire		ep4_inta, ep5_inta, ep6_inta, ep7_inta;
wire		ep8_inta, ep9_inta, ep10_inta, ep11_inta;
wire		ep12_inta, ep13_inta, ep14_inta, ep15_inta;

wire		ep0_intb, ep1_intb, ep2_intb, ep3_intb;
wire		ep4_intb, ep5_intb, ep6_intb, ep7_intb;
wire		ep8_intb, ep9_intb, ep10_intb, ep11_intb;
wire		ep12_intb, ep13_intb, ep14_intb, ep15_intb;

wire		ep0_match, ep1_match, ep2_match, ep3_match;
wire		ep4_match, ep5_match, ep6_match, ep7_match;
wire		ep8_match, ep9_match, ep10_match, ep11_match;
wire		ep12_match, ep13_match, ep14_match, ep15_match;

wire	[31:0]	ep0_csr, ep1_csr, ep2_csr, ep3_csr;
wire	[31:0]	ep4_csr, ep5_csr, ep6_csr, ep7_csr;
wire	[31:0]	ep8_csr, ep9_csr, ep10_csr, ep11_csr;
wire	[31:0]	ep12_csr, ep13_csr, ep14_csr, ep15_csr;

wire	[31:0]	ep0_buf0, ep1_buf0, ep2_buf0, ep3_buf0;
wire	[31:0]	ep4_buf0, ep5_buf0, ep6_buf0, ep7_buf0;
wire	[31:0]	ep8_buf0, ep9_buf0, ep10_buf0, ep11_buf0;
wire	[31:0]	ep12_buf0, ep13_buf0, ep14_buf0, ep15_buf0;

wire	[31:0]	ep0_buf1, ep1_buf1, ep2_buf1, ep3_buf1;
wire	[31:0]	ep4_buf1, ep5_buf1, ep6_buf1, ep7_buf1;
wire	[31:0]	ep8_buf1, ep9_buf1, ep10_buf1, ep11_buf1;
wire	[31:0]	ep12_buf1, ep13_buf1, ep14_buf1, ep15_buf1;

wire		ep0_dma_in_buf_sz1, ep1_dma_in_buf_sz1;
wire		ep2_dma_in_buf_sz1, ep3_dma_in_buf_sz1;
wire		ep4_dma_in_buf_sz1, ep5_dma_in_buf_sz1;
wire		ep6_dma_in_buf_sz1, ep7_dma_in_buf_sz1;
wire		ep8_dma_in_buf_sz1, ep9_dma_in_buf_sz1;
wire		ep10_dma_in_buf_sz1, ep11_dma_in_buf_sz1;
wire		ep12_dma_in_buf_sz1, ep13_dma_in_buf_sz1;
wire		ep14_dma_in_buf_sz1, ep15_dma_in_buf_sz1;

wire		ep0_dma_out_buf_avail, ep1_dma_out_buf_avail;
wire		ep2_dma_out_buf_avail, ep3_dma_out_buf_avail;
wire		ep4_dma_out_buf_avail, ep5_dma_out_buf_avail;
wire		ep6_dma_out_buf_avail, ep7_dma_out_buf_avail;
wire		ep8_dma_out_buf_avail, ep9_dma_out_buf_avail;
wire		ep10_dma_out_buf_avail, ep11_dma_out_buf_avail;
wire		ep12_dma_out_buf_avail, ep13_dma_out_buf_avail;
wire		ep14_dma_out_buf_avail, ep15_dma_out_buf_avail;

reg		dma_in_buf_sz1;
reg		dma_out_buf_avail;

reg	[31:0]	dtmp;
reg	[31:0]	dout;

wire	[31:0]	main_csr;
reg	[6:0]	funct_adr;
reg	[8:0]	intb_msk, inta_msk;

reg		match_r1;
reg	[31:0]	csr;
reg	[31:0]	buf0;
reg	[31:0]	buf1;

reg	[3:0]	utmi_vend_ctrl;
reg		utmi_vend_wr;
reg	[7:0]	utmi_vend_stat_r;

reg		int_src_re;
reg	[8:0]	int_srcb;
reg	[15:0]	int_srca;
reg		attach_r, attach_r1;
wire		attach, deattach;
reg		suspend_r, suspend_r1;
wire		suspend_start, suspend_end;
reg		usb_reset_r;
reg		rx_err_r;
reg		nse_err_r;
reg		pid_cs_err_r;
reg		crc5_err_r;

reg		rf_resume_req_r, rf_resume_req;

wire		inta_ep, intb_ep;
wire		inta_rf, intb_rf;
reg		inta, intb;

///////////////////////////////////////////////////////////////////
//
// WISHBONE Access
//

// Main CSR Alias
assign main_csr = {27'h0, line_stat, usb_attached, mode_hs, suspend};

// Read Registers Logic
always @(adr or main_csr or funct_adr or inta_msk or intb_msk or int_srca
	or int_srcb or frm_nat or utmi_vend_stat_r)
	case(adr[2:0])		// synopsys full_case parallel_case
	   3'h0: dtmp = main_csr;
	   3'h1: dtmp = { 25'h0, funct_adr};
	   3'h2: dtmp = {  7'h0, intb_msk, 7'h0, inta_msk};
	   3'h3: dtmp = {  3'h0, int_srcb, 4'h0, int_srca};
	   3'h4: dtmp = frm_nat;
	   3'h5: dtmp = { 24'h0, utmi_vend_stat_r};
	endcase

// Interrupt Source Read Register
always @(posedge wclk)
	int_src_re <= adr[6:0] == 7'h3 & re;

// UTMI Vendor Control Stuff
always @(posedge wclk)
	utmi_vend_stat_r <= utmi_vend_stat;

reg		utmi_vend_wr_r;
`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)			utmi_vend_wr_r <= 1'b0;
	else
	if(adr[6:0] == 7'h5 && we)	utmi_vend_wr_r <= 1'b1;	
	else
	if(utmi_vend_wr)		utmi_vend_wr_r <= 1'b0;

always @(posedge clk)	// Second Stage sync
	utmi_vend_wr <= utmi_vend_wr_r;


reg	[3:0]	utmi_vend_ctrl_r;
always @(posedge wclk)
	if(adr[6:0] == 7'h5 && we)	utmi_vend_ctrl_r <= din[3:0];

always @(posedge clk)	// Second Stage sync
	utmi_vend_ctrl <= utmi_vend_ctrl_r;

// Resume Request
`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)			rf_resume_req_r <= 1'b0;
	else
	if(adr[6:0] == 7'h0 && we)	rf_resume_req_r <= din[5];
	else
	if(rf_resume_req)		rf_resume_req_r <= 1'b0;

always @(posedge clk)	// Second Stage sync
	rf_resume_req <= rf_resume_req_r;

// Function Address Register
`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)			funct_adr <= 7'h0;
	else
	if(adr[6:0] == 7'h1 && we)	funct_adr <= din[6:0];

// Interrup Mask Register
`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)
	   begin
		inta_msk <= 9'h0;
		intb_msk <= 9'h0;
	   end
	else
	if(adr[6:0] == 7'h2 && we)
	   begin
		intb_msk <= din[24:16];
		inta_msk <= din[08:00];
	   end

always @(posedge wclk)
	case(adr[6:2])		// synopsys full_case parallel_case
	 5'h00: dout <= dtmp;		// Addr: 0h
	 5'h01: dout <= dtmp;
	 5'h02: dout <= 32'h0;
	 5'h03: dout <= 32'h0;
	 5'h04: dout <= ep0_dout;
	 5'h05: dout <= ep1_dout;
	 5'h06: dout <= ep2_dout;
	 5'h07: dout <= ep3_dout;
	 5'h08: dout <= ep4_dout;
	 5'h09: dout <= ep5_dout;
	 5'h0a: dout <= ep6_dout;
	 5'h0b: dout <= ep7_dout;
	 5'h0c: dout <= ep8_dout;
	 5'h0d: dout <= ep9_dout;
	 5'h0e: dout <= ep10_dout;
	 5'h0f: dout <= ep11_dout;
	 5'h10: dout <= ep12_dout;
	 5'h11: dout <= ep13_dout;
	 5'h12: dout <= ep14_dout;
	 5'h13: dout <= ep15_dout;
	endcase

assign ep0_re  = (adr[6:2] == 5'h04) & re;
assign ep1_re  = (adr[6:2] == 5'h05) & re;
assign ep2_re  = (adr[6:2] == 5'h06) & re;
assign ep3_re  = (adr[6:2] == 5'h07) & re;
assign ep4_re  = (adr[6:2] == 5'h08) & re;
assign ep5_re  = (adr[6:2] == 5'h09) & re;
assign ep6_re  = (adr[6:2] == 5'h0a) & re;
assign ep7_re  = (adr[6:2] == 5'h0b) & re;
assign ep8_re  = (adr[6:2] == 5'h0c) & re;
assign ep9_re  = (adr[6:2] == 5'h0d) & re;
assign ep10_re = (adr[6:2] == 5'h0e) & re;
assign ep11_re = (adr[6:2] == 5'h0f) & re;
assign ep12_re = (adr[6:2] == 5'h10) & re;
assign ep13_re = (adr[6:2] == 5'h11) & re;
assign ep14_re = (adr[6:2] == 5'h12) & re;
assign ep15_re = (adr[6:2] == 5'h13) & re;

assign ep0_we  = (adr[6:2] == 5'h04) & we;
assign ep1_we  = (adr[6:2] == 5'h05) & we;
assign ep2_we  = (adr[6:2] == 5'h06) & we;
assign ep3_we  = (adr[6:2] == 5'h07) & we;
assign ep4_we  = (adr[6:2] == 5'h08) & we;
assign ep5_we  = (adr[6:2] == 5'h09) & we;
assign ep6_we  = (adr[6:2] == 5'h0a) & we;
assign ep7_we  = (adr[6:2] == 5'h0b) & we;
assign ep8_we  = (adr[6:2] == 5'h0c) & we;
assign ep9_we  = (adr[6:2] == 5'h0d) & we;
assign ep10_we = (adr[6:2] == 5'h0e) & we;
assign ep11_we = (adr[6:2] == 5'h0f) & we;
assign ep12_we = (adr[6:2] == 5'h10) & we;
assign ep13_we = (adr[6:2] == 5'h11) & we;
assign ep14_we = (adr[6:2] == 5'h12) & we;
assign ep15_we = (adr[6:2] == 5'h13) & we;

///////////////////////////////////////////////////////////////////
//
// Internal Access
//

assign match = match_r1;

always @(posedge clk)
	match_r1 <= 	ep0_match | ep1_match | ep2_match | ep3_match |
			ep4_match | ep5_match | ep6_match | ep7_match |
			ep8_match | ep9_match | ep10_match | ep11_match |
			ep12_match | ep13_match | ep14_match | ep15_match;

always @(posedge clk)
	if(ep0_match)	csr <= ep0_csr;
	else
	if(ep1_match)	csr <= ep1_csr;
	else
	if(ep2_match)	csr <= ep2_csr;
	else
	if(ep3_match)	csr <= ep3_csr;
	else
	if(ep4_match)	csr <= ep4_csr;
	else
	if(ep5_match)	csr <= ep5_csr;
	else
	if(ep6_match)	csr <= ep6_csr;
	else
	if(ep7_match)	csr <= ep7_csr;
	else
	if(ep8_match)	csr <= ep8_csr;
	else
	if(ep9_match)	csr <= ep9_csr;
	else
	if(ep10_match)	csr <= ep10_csr;
	else
	if(ep11_match)	csr <= ep11_csr;
	else
	if(ep12_match)	csr <= ep12_csr;
	else
	if(ep13_match)	csr <= ep13_csr;
	else
	if(ep14_match)	csr <= ep14_csr;
	else
	if(ep15_match)	csr <= ep15_csr;

always @(posedge clk)
	if(ep0_match)	buf0 <= ep0_buf0;
	else
	if(ep1_match)	buf0 <= ep1_buf0;
	else
	if(ep2_match)	buf0 <= ep2_buf0;
	else
	if(ep3_match)	buf0 <= ep3_buf0;
	else
	if(ep4_match)	buf0 <= ep4_buf0;
	else
	if(ep5_match)	buf0 <= ep5_buf0;
	else
	if(ep6_match)	buf0 <= ep6_buf0;
	else
	if(ep7_match)	buf0 <= ep7_buf0;
	else
	if(ep8_match)	buf0 <= ep8_buf0;
	else
	if(ep9_match)	buf0 <= ep9_buf0;
	else
	if(ep10_match)	buf0 <= ep10_buf0;
	else
	if(ep11_match)	buf0 <= ep11_buf0;
	else
	if(ep12_match)	buf0 <= ep12_buf0;
	else
	if(ep13_match)	buf0 <= ep13_buf0;
	else
	if(ep14_match)	buf0 <= ep14_buf0;
	else
	if(ep15_match)	buf0 <= ep15_buf0;

always @(posedge clk)
	if(ep0_match)	buf1 <= ep0_buf1;
	else
	if(ep1_match)	buf1 <= ep1_buf1;
	else
	if(ep2_match)	buf1 <= ep2_buf1;
	else
	if(ep3_match)	buf1 <= ep3_buf1;
	else
	if(ep4_match)	buf1 <= ep4_buf1;
	else
	if(ep5_match)	buf1 <= ep5_buf1;
	else
	if(ep6_match)	buf1 <= ep6_buf1;
	else
	if(ep7_match)	buf1 <= ep7_buf1;
	else
	if(ep8_match)	buf1 <= ep8_buf1;
	else
	if(ep9_match)	buf1 <= ep9_buf1;
	else
	if(ep10_match)	buf1 <= ep10_buf1;
	else
	if(ep11_match)	buf1 <= ep11_buf1;
	else
	if(ep12_match)	buf1 <= ep12_buf1;
	else
	if(ep13_match)	buf1 <= ep13_buf1;
	else
	if(ep14_match)	buf1 <= ep14_buf1;
	else
	if(ep15_match)	buf1 <= ep15_buf1;

always @(posedge clk)
	if(ep0_match)	dma_in_buf_sz1 <= ep0_dma_in_buf_sz1;
	else
	if(ep1_match)	dma_in_buf_sz1 <= ep1_dma_in_buf_sz1;
	else
	if(ep2_match)	dma_in_buf_sz1 <= ep2_dma_in_buf_sz1;
	else
	if(ep3_match)	dma_in_buf_sz1 <= ep3_dma_in_buf_sz1;
	else
	if(ep4_match)	dma_in_buf_sz1 <= ep4_dma_in_buf_sz1;
	else
	if(ep5_match)	dma_in_buf_sz1 <= ep5_dma_in_buf_sz1;
	else
	if(ep6_match)	dma_in_buf_sz1 <= ep6_dma_in_buf_sz1;
	else
	if(ep7_match)	dma_in_buf_sz1 <= ep7_dma_in_buf_sz1;
	else
	if(ep8_match)	dma_in_buf_sz1 <= ep8_dma_in_buf_sz1;
	else
	if(ep9_match)	dma_in_buf_sz1 <= ep9_dma_in_buf_sz1;
	else
	if(ep10_match)	dma_in_buf_sz1 <= ep10_dma_in_buf_sz1;
	else
	if(ep11_match)	dma_in_buf_sz1 <= ep11_dma_in_buf_sz1;
	else
	if(ep12_match)	dma_in_buf_sz1 <= ep12_dma_in_buf_sz1;
	else
	if(ep13_match)	dma_in_buf_sz1 <= ep13_dma_in_buf_sz1;
	else
	if(ep14_match)	dma_in_buf_sz1 <= ep14_dma_in_buf_sz1;
	else
	if(ep15_match)	dma_in_buf_sz1 <= ep15_dma_in_buf_sz1;

always @(posedge clk)
	if(ep0_match)	dma_out_buf_avail <= ep0_dma_out_buf_avail;
	else
	if(ep1_match)	dma_out_buf_avail <= ep1_dma_out_buf_avail;
	else
	if(ep2_match)	dma_out_buf_avail <= ep2_dma_out_buf_avail;
	else
	if(ep3_match)	dma_out_buf_avail <= ep3_dma_out_buf_avail;
	else
	if(ep4_match)	dma_out_buf_avail <= ep4_dma_out_buf_avail;
	else
	if(ep5_match)	dma_out_buf_avail <= ep5_dma_out_buf_avail;
	else
	if(ep6_match)	dma_out_buf_avail <= ep6_dma_out_buf_avail;
	else
	if(ep7_match)	dma_out_buf_avail <= ep7_dma_out_buf_avail;
	else
	if(ep8_match)	dma_out_buf_avail <= ep8_dma_out_buf_avail;
	else
	if(ep9_match)	dma_out_buf_avail <= ep9_dma_out_buf_avail;
	else
	if(ep10_match)	dma_out_buf_avail <= ep10_dma_out_buf_avail;
	else
	if(ep11_match)	dma_out_buf_avail <= ep11_dma_out_buf_avail;
	else
	if(ep12_match)	dma_out_buf_avail <= ep12_dma_out_buf_avail;
	else
	if(ep13_match)	dma_out_buf_avail <= ep13_dma_out_buf_avail;
	else
	if(ep14_match)	dma_out_buf_avail <= ep14_dma_out_buf_avail;
	else
	if(ep15_match)	dma_out_buf_avail <= ep15_dma_out_buf_avail;


///////////////////////////////////////////////////////////////////
//
// Interrupt Generation
//

always @(posedge wclk)
	attach_r <= usb_attached;

always @(posedge wclk)
	attach_r1 <= attach_r;

always @(posedge wclk)
	suspend_r <= suspend;

always @(posedge wclk)
	suspend_r1 <= suspend_r;

always @(posedge wclk)
	usb_reset_r <= usb_reset;

always @(posedge wclk)
	rx_err_r <= rx_err;

always @(posedge wclk)
	nse_err_r <= nse_err;

always @(posedge wclk)
	pid_cs_err_r <= pid_cs_err;

always @(posedge wclk)
	crc5_err_r <= crc5_err;

assign	attach = !attach_r1 & attach_r;
assign	deattach = attach_r1 & !attach_r;
assign	suspend_start = !suspend_r1 & suspend_r;
assign	suspend_end   = suspend_r1 & !suspend_r;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		int_srcb[8] <= 1'b0;
	else
	if(int_src_re)		int_srcb[8] <= 1'b0;
	else
	if(usb_reset_r)		int_srcb[8] <= 1'b1;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		int_srcb[7] <= 1'b0;
	else
	if(int_src_re)		int_srcb[7] <= 1'b0;
	else
	if(rx_err_r)		int_srcb[7] <= 1'b1;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		int_srcb[6] <= 1'b0;
	else
	if(int_src_re)		int_srcb[6] <= 1'b0;
	else
	if(deattach)		int_srcb[6] <= 1'b1;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		int_srcb[5] <= 1'b0;
	else
	if(int_src_re)		int_srcb[5] <= 1'b0;
	else
	if(attach)		int_srcb[5] <= 1'b1;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		int_srcb[4] <= 1'b0;
	else
	if(int_src_re)		int_srcb[4] <= 1'b0;
	else
	if(suspend_end)		int_srcb[4] <= 1'b1;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		int_srcb[3] <= 1'b0;
	else
	if(int_src_re)		int_srcb[3] <= 1'b0;
	else
	if(suspend_start)	int_srcb[3] <= 1'b1;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		int_srcb[2] <= 1'b0;
	else
	if(int_src_re)		int_srcb[2] <= 1'b0;
	else
	if(nse_err_r)		int_srcb[2] <= 1'b1;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		int_srcb[1] <= 1'b0;
	else
	if(int_src_re)		int_srcb[1] <= 1'b0;
	else
	if(pid_cs_err_r)	int_srcb[1] <= 1'b1;

`ifdef USBF_ASYNC_RESET
always @(posedge wclk or negedge rst)
`else
always @(posedge wclk)
`endif
	if(!rst)		int_srcb[0] <= 1'b0;
	else
	if(int_src_re)		int_srcb[0] <= 1'b0;
	else
	if(crc5_err_r)		int_srcb[0] <= 1'b1;

always @(posedge wclk)
   begin
	int_srca[15] <= ep15_inta | ep15_intb;
	int_srca[14] <= ep14_inta | ep14_intb;
	int_srca[13] <= ep13_inta | ep13_intb;
	int_srca[12] <= ep12_inta | ep12_intb;
	int_srca[11] <= ep11_inta | ep11_intb;
	int_srca[10] <= ep10_inta | ep10_intb;
	int_srca[09] <= ep9_inta | ep9_intb;
	int_srca[08] <= ep8_inta | ep8_intb;
	int_srca[07] <= ep7_inta | ep7_intb;
	int_srca[06] <= ep6_inta | ep6_intb;
	int_srca[05] <= ep5_inta | ep5_intb;
	int_srca[04] <= ep4_inta | ep4_intb;
	int_srca[03] <= ep3_inta | ep3_intb;
	int_srca[02] <= ep2_inta | ep2_intb;
	int_srca[01] <= ep1_inta | ep1_intb;
	int_srca[00] <= ep0_inta | ep0_intb;
   end

assign inta_ep =ep0_inta  | ep1_inta  | ep2_inta  | ep3_inta  |
		ep4_inta  | ep5_inta  | ep6_inta  | ep7_inta  |
		ep8_inta  | ep9_inta  | ep10_inta | ep11_inta |
		ep12_inta | ep13_inta | ep14_inta | ep15_inta;

assign intb_ep =ep0_intb  | ep1_intb  | ep2_intb  | ep3_intb  |
		ep4_intb  | ep5_intb  | ep6_intb  | ep7_intb  |
		ep8_intb  | ep9_intb  | ep10_intb | ep11_intb |
		ep12_intb | ep13_intb | ep14_intb | ep15_intb;

assign inta_rf = |(int_srcb & inta_msk);
assign intb_rf = |(int_srcb & intb_msk);

always @(posedge wclk)
	inta <= inta_ep | inta_rf;

always @(posedge wclk)
	intb <= intb_ep | intb_rf;

///////////////////////////////////////////////////////////////////
//
// Endpoint Register Files
//

usbf_ep_rf	u0(
		.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep0_re			),
		.we(			ep0_we			),
		.din(			din			),
		.dout(			ep0_dout		),
		.inta(			ep0_inta		),
		.intb(			ep0_intb		),
		.dma_req(		dma_req[0]		),
		.dma_ack(		dma_ack[0]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep0_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep0_csr			),
		.buf0(			ep0_buf0		),
		.buf1(			ep0_buf1		),
		.dma_in_buf_sz1(	ep0_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep0_dma_out_buf_avail	)
		);

`ifdef USBF_HAVE_EP1
usbf_ep_rf	u1(
		.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep1_re			),
		.we(			ep1_we			),
		.din(			din			),
		.dout(			ep1_dout		),
		.inta(			ep1_inta		),
		.intb(			ep1_intb		),
		.dma_req(		dma_req[1]		),
		.dma_ack(		dma_ack[1]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep1_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep1_csr			),
		.buf0(			ep1_buf0		),
		.buf1(			ep1_buf1		),
		.dma_in_buf_sz1(	ep1_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep1_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u1(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep1_re			),
		.we(			ep1_we			),
		.din(			din			),
		.dout(			ep1_dout		),
		.inta(			ep1_inta		),
		.intb(			ep1_intb		),
		.dma_req(		dma_req[1]		),
		.dma_ack(		dma_ack[1]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep1_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep1_csr			),
		.buf0(			ep1_buf0		),
		.buf1(			ep1_buf1		),
		.dma_in_buf_sz1(	ep1_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep1_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP2
usbf_ep_rf	u2(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep2_re			),
		.we(			ep2_we			),
		.din(			din			),
		.dout(			ep2_dout		),
		.inta(			ep2_inta		),
		.intb(			ep2_intb		),
		.dma_req(		dma_req[2]		),
		.dma_ack(		dma_ack[2]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep2_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep2_csr			),
		.buf0(			ep2_buf0		),
		.buf1(			ep2_buf1		),
		.dma_in_buf_sz1(	ep2_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep2_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u2(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep2_re			),
		.we(			ep2_we			),
		.din(			din			),
		.dout(			ep2_dout		),
		.inta(			ep2_inta		),
		.intb(			ep2_intb		),
		.dma_req(		dma_req[2]		),
		.dma_ack(		dma_ack[2]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep2_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep2_csr			),
		.buf0(			ep2_buf0		),
		.buf1(			ep2_buf1		),
		.dma_in_buf_sz1(	ep2_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep2_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP3
usbf_ep_rf	u3(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep3_re			),
		.we(			ep3_we			),
		.din(			din			),
		.dout(			ep3_dout		),
		.inta(			ep3_inta		),
		.intb(			ep3_intb		),
		.dma_req(		dma_req[3]		),
		.dma_ack(		dma_ack[3]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep3_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep3_csr			),
		.buf0(			ep3_buf0		),
		.buf1(			ep3_buf1		),
		.dma_in_buf_sz1(	ep3_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep3_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u3(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep3_re			),
		.we(			ep3_we			),
		.din(			din			),
		.dout(			ep3_dout		),
		.inta(			ep3_inta		),
		.intb(			ep3_intb		),
		.dma_req(		dma_req[3]		),
		.dma_ack(		dma_ack[3]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep3_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep3_csr			),
		.buf0(			ep3_buf0		),
		.buf1(			ep3_buf1		),
		.dma_in_buf_sz1(	ep3_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep3_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP4
usbf_ep_rf	u4(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep4_re			),
		.we(			ep4_we			),
		.din(			din			),
		.dout(			ep4_dout		),
		.inta(			ep4_inta		),
		.intb(			ep4_intb		),
		.dma_req(		dma_req[4]		),
		.dma_ack(		dma_ack[4]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep4_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep4_csr			),
		.buf0(			ep4_buf0		),
		.buf1(			ep4_buf1		),
		.dma_in_buf_sz1(	ep4_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep4_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u4(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep4_re			),
		.we(			ep4_we			),
		.din(			din			),
		.dout(			ep4_dout		),
		.inta(			ep4_inta		),
		.intb(			ep4_intb		),
		.dma_req(		dma_req[4]		),
		.dma_ack(		dma_ack[4]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep4_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep4_csr			),
		.buf0(			ep4_buf0		),
		.buf1(			ep4_buf1		),
		.dma_in_buf_sz1(	ep4_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep4_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP5
usbf_ep_rf	u5(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep5_re			),
		.we(			ep5_we			),
		.din(			din			),
		.dout(			ep5_dout		),
		.inta(			ep5_inta		),
		.intb(			ep5_intb		),
		.dma_req(		dma_req[5]		),
		.dma_ack(		dma_ack[5]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep5_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep5_csr			),
		.buf0(			ep5_buf0		),
		.buf1(			ep5_buf1		),
		.dma_in_buf_sz1(	ep5_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep5_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u5(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep5_re			),
		.we(			ep5_we			),
		.din(			din			),
		.dout(			ep5_dout		),
		.inta(			ep5_inta		),
		.intb(			ep5_intb		),
		.dma_req(		dma_req[5]		),
		.dma_ack(		dma_ack[5]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep5_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep5_csr			),
		.buf0(			ep5_buf0		),
		.buf1(			ep5_buf1		),
		.dma_in_buf_sz1(	ep5_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep5_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP6
usbf_ep_rf	u6(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep6_re			),
		.we(			ep6_we			),
		.din(			din			),
		.dout(			ep6_dout		),
		.inta(			ep6_inta		),
		.intb(			ep6_intb		),
		.dma_req(		dma_req[6]		),
		.dma_ack(		dma_ack[6]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep6_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep6_csr			),
		.buf0(			ep6_buf0		),
		.buf1(			ep6_buf1		),
		.dma_in_buf_sz1(	ep6_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep6_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u6(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep6_re			),
		.we(			ep6_we			),
		.din(			din			),
		.dout(			ep6_dout		),
		.inta(			ep6_inta		),
		.intb(			ep6_intb		),
		.dma_req(		dma_req[6]		),
		.dma_ack(		dma_ack[6]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep6_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep6_csr			),
		.buf0(			ep6_buf0		),
		.buf1(			ep6_buf1		),
		.dma_in_buf_sz1(	ep6_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep6_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP7
usbf_ep_rf	u7(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep7_re			),
		.we(			ep7_we			),
		.din(			din			),
		.dout(			ep7_dout		),
		.inta(			ep7_inta		),
		.intb(			ep7_intb		),
		.dma_req(		dma_req[7]		),
		.dma_ack(		dma_ack[7]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep7_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep7_csr			),
		.buf0(			ep7_buf0		),
		.buf1(			ep7_buf1		),
		.dma_in_buf_sz1(	ep7_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep7_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u7(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep7_re			),
		.we(			ep7_we			),
		.din(			din			),
		.dout(			ep7_dout		),
		.inta(			ep7_inta		),
		.intb(			ep7_intb		),
		.dma_req(		dma_req[7]		),
		.dma_ack(		dma_ack[7]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep7_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep7_csr			),
		.buf0(			ep7_buf0		),
		.buf1(			ep7_buf1		),
		.dma_in_buf_sz1(	ep7_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep7_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP8
usbf_ep_rf	u8(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep8_re			),
		.we(			ep8_we			),
		.din(			din			),
		.dout(			ep8_dout		),
		.inta(			ep8_inta		),
		.intb(			ep8_intb		),
		.dma_req(		dma_req[8]		),
		.dma_ack(		dma_ack[8]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep8_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep8_csr			),
		.buf0(			ep8_buf0		),
		.buf1(			ep8_buf1		),
		.dma_in_buf_sz1(	ep8_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep8_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u8(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep8_re			),
		.we(			ep8_we			),
		.din(			din			),
		.dout(			ep8_dout		),
		.inta(			ep8_inta		),
		.intb(			ep8_intb		),
		.dma_req(		dma_req[8]		),
		.dma_ack(		dma_ack[8]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep8_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep8_csr			),
		.buf0(			ep8_buf0		),
		.buf1(			ep8_buf1		),
		.dma_in_buf_sz1(	ep8_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep8_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP9
usbf_ep_rf	u9(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep9_re			),
		.we(			ep9_we			),
		.din(			din			),
		.dout(			ep9_dout		),
		.inta(			ep9_inta		),
		.intb(			ep9_intb		),
		.dma_req(		dma_req[9]		),
		.dma_ack(		dma_ack[9]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep9_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep9_csr			),
		.buf0(			ep9_buf0		),
		.buf1(			ep9_buf1		),
		.dma_in_buf_sz1(	ep9_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep9_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u9(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep9_re			),
		.we(			ep9_we			),
		.din(			din			),
		.dout(			ep9_dout		),
		.inta(			ep9_inta		),
		.intb(			ep9_intb		),
		.dma_req(		dma_req[9]		),
		.dma_ack(		dma_ack[9]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep9_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep9_csr			),
		.buf0(			ep9_buf0		),
		.buf1(			ep9_buf1		),
		.dma_in_buf_sz1(	ep9_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep9_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP10
usbf_ep_rf	u10(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep10_re			),
		.we(			ep10_we			),
		.din(			din			),
		.dout(			ep10_dout		),
		.inta(			ep10_inta		),
		.intb(			ep10_intb		),
		.dma_req(		dma_req[10]		),
		.dma_ack(		dma_ack[10]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep10_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep10_csr			),
		.buf0(			ep10_buf0		),
		.buf1(			ep10_buf1		),
		.dma_in_buf_sz1(	ep10_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep10_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u10(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep10_re			),
		.we(			ep10_we			),
		.din(			din			),
		.dout(			ep10_dout		),
		.inta(			ep10_inta		),
		.intb(			ep10_intb		),
		.dma_req(		dma_req[10]		),
		.dma_ack(		dma_ack[10]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep10_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep10_csr			),
		.buf0(			ep10_buf0		),
		.buf1(			ep10_buf1		),
		.dma_in_buf_sz1(	ep10_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep10_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP11
usbf_ep_rf	u11(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep11_re			),
		.we(			ep11_we			),
		.din(			din			),
		.dout(			ep11_dout		),
		.inta(			ep11_inta		),
		.intb(			ep11_intb		),
		.dma_req(		dma_req[11]		),
		.dma_ack(		dma_ack[11]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep11_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep11_csr			),
		.buf0(			ep11_buf0		),
		.buf1(			ep11_buf1		),
		.dma_in_buf_sz1(	ep11_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep11_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u11(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep11_re			),
		.we(			ep11_we			),
		.din(			din			),
		.dout(			ep11_dout		),
		.inta(			ep11_inta		),
		.intb(			ep11_intb		),
		.dma_req(		dma_req[11]		),
		.dma_ack(		dma_ack[11]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep11_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep11_csr			),
		.buf0(			ep11_buf0		),
		.buf1(			ep11_buf1		),
		.dma_in_buf_sz1(	ep11_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep11_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP12
usbf_ep_rf	u12(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep12_re			),
		.we(			ep12_we			),
		.din(			din			),
		.dout(			ep12_dout		),
		.inta(			ep12_inta		),
		.intb(			ep12_intb		),
		.dma_req(		dma_req[12]		),
		.dma_ack(		dma_ack[12]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep12_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep12_csr			),
		.buf0(			ep12_buf0		),
		.buf1(			ep12_buf1		),
		.dma_in_buf_sz1(	ep12_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep12_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u12(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep12_re			),
		.we(			ep12_we			),
		.din(			din			),
		.dout(			ep12_dout		),
		.inta(			ep12_inta		),
		.intb(			ep12_intb		),
		.dma_req(		dma_req[12]		),
		.dma_ack(		dma_ack[12]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep12_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep12_csr			),
		.buf0(			ep12_buf0		),
		.buf1(			ep12_buf1		),
		.dma_in_buf_sz1(	ep12_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep12_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP13
usbf_ep_rf	u13(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep13_re			),
		.we(			ep13_we			),
		.din(			din			),
		.dout(			ep13_dout		),
		.inta(			ep13_inta		),
		.intb(			ep13_intb		),
		.dma_req(		dma_req[13]		),
		.dma_ack(		dma_ack[13]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep13_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep13_csr			),
		.buf0(			ep13_buf0		),
		.buf1(			ep13_buf1		),
		.dma_in_buf_sz1(	ep13_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep13_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u13(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep13_re			),
		.we(			ep13_we			),
		.din(			din			),
		.dout(			ep13_dout		),
		.inta(			ep13_inta		),
		.intb(			ep13_intb		),
		.dma_req(		dma_req[13]		),
		.dma_ack(		dma_ack[13]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep13_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep13_csr			),
		.buf0(			ep13_buf0		),
		.buf1(			ep13_buf1		),
		.dma_in_buf_sz1(	ep13_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep13_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP14
usbf_ep_rf	u14(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep14_re			),
		.we(			ep14_we			),
		.din(			din			),
		.dout(			ep14_dout		),
		.inta(			ep14_inta		),
		.intb(			ep14_intb		),
		.dma_req(		dma_req[14]		),
		.dma_ack(		dma_ack[14]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep14_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep14_csr			),
		.buf0(			ep14_buf0		),
		.buf1(			ep14_buf1		),
		.dma_in_buf_sz1(	ep14_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep14_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u14(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep14_re			),
		.we(			ep14_we			),
		.din(			din			),
		.dout(			ep14_dout		),
		.inta(			ep14_inta		),
		.intb(			ep14_intb		),
		.dma_req(		dma_req[14]		),
		.dma_ack(		dma_ack[14]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep14_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep14_csr			),
		.buf0(			ep14_buf0		),
		.buf1(			ep14_buf1		),
		.dma_in_buf_sz1(	ep14_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep14_dma_out_buf_avail	)
		);
`endif

`ifdef USBF_HAVE_EP15
usbf_ep_rf	u15(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep15_re			),
		.we(			ep15_we			),
		.din(			din			),
		.dout(			ep15_dout		),
		.inta(			ep15_inta		),
		.intb(			ep15_intb		),
		.dma_req(		dma_req[15]		),
		.dma_ack(		dma_ack[15]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep15_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep15_csr			),
		.buf0(			ep15_buf0		),
		.buf1(			ep15_buf1		),
		.dma_in_buf_sz1(	ep15_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep15_dma_out_buf_avail	)
		);

`else
usbf_ep_rf_dummy u15(	.clk(			clk			),
		.wclk(			wclk			),
		.rst(			rst			),
		.adr(			adr[1:0]		),
		.re(			ep15_re			),
		.we(			ep15_we			),
		.din(			din			),
		.dout(			ep15_dout		),
		.inta(			ep15_inta		),
		.intb(			ep15_intb		),
		.dma_req(		dma_req[15]		),
		.dma_ack(		dma_ack[15]		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.ep_match(		ep15_match		),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			ep15_csr			),
		.buf0(			ep15_buf0		),
		.buf1(			ep15_buf1		),
		.dma_in_buf_sz1(	ep15_dma_in_buf_sz1	),
		.dma_out_buf_avail(	ep15_dma_out_buf_avail	)
		);
`endif

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  USB function core                                          ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_top.v,v 1.7 2003-11-11 07:15:16 rudi Exp $
//
//  $Date: 2003-11-11 07:15:16 $
//  $Revision: 1.7 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.6  2003/10/17 02:36:57  rudi
//               - Disabling bit stuffing and NRZI encoding during speed negotiation
//               - Now the core can send zero size packets
//               - Fixed register addresses for some of the higher endpoints
//                 (conversion between decimal/hex was wrong)
//               - The core now does properly evaluate the function address to
//                 determine if the packet was intended for it.
//               - Various other minor bugs and typos
//
//               Revision 1.5  2001/11/04 12:22:45  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.4  2001/11/03 03:26:23  rudi
//
//               - Fixed several interrupt and error condition reporting bugs
//
//               Revision 1.3  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.2  2001/08/10 08:48:33  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:52  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.2  2001/03/07 09:08:13  rudi
//
//               Added USB control signaling (Line Status) block. Fixed some minor
//               typos, added resume bit and signal.
//
//               Revision 0.1.0.1  2001/02/28 08:11:40  rudi
//               Initial Release
//
//

`include "usbf_defines.v"

module usbf_top(// WISHBONE Interface
		clk_i, rst_i, wb_addr_i, wb_data_i, wb_data_o,
		wb_ack_o, wb_we_i, wb_stb_i, wb_cyc_i, inta_o, intb_o,
		dma_req_o, dma_ack_i, susp_o, resume_req_i,

		// UTMI Interface
		phy_clk_pad_i, phy_rst_pad_o,
		DataOut_pad_o, TxValid_pad_o, TxReady_pad_i,

		RxValid_pad_i, RxActive_pad_i, RxError_pad_i,
		DataIn_pad_i, XcvSelect_pad_o, TermSel_pad_o,
		SuspendM_pad_o, LineState_pad_i,

		OpMode_pad_o, usb_vbus_pad_i,
		VControl_Load_pad_o, VControl_pad_o, VStatus_pad_i,

		// Buffer Memory Interface
		sram_adr_o, sram_data_i, sram_data_o, sram_re_o, sram_we_o

		);

parameter	SSRAM_HADR = `USBF_SSRAM_HADR;
input		clk_i;
input		rst_i;
input	[`USBF_UFC_HADR:0]	wb_addr_i;
input	[31:0]	wb_data_i;
output	[31:0]	wb_data_o;
output		wb_ack_o;
input		wb_we_i;
input		wb_stb_i;
input		wb_cyc_i;
output		inta_o;
output		intb_o;
output	[15:0]	dma_req_o;
input	[15:0]	dma_ack_i;
output		susp_o;
input		resume_req_i;

input		phy_clk_pad_i;
output		phy_rst_pad_o;

output	[7:0]	DataOut_pad_o;
output		TxValid_pad_o;
input		TxReady_pad_i;

input	[7:0]	DataIn_pad_i;
input		RxValid_pad_i;
input		RxActive_pad_i;
input		RxError_pad_i;

output		XcvSelect_pad_o;
output		TermSel_pad_o;
output		SuspendM_pad_o;
input	[1:0]	LineState_pad_i;
output	[1:0]	OpMode_pad_o;
input		usb_vbus_pad_i;
output		VControl_Load_pad_o;
output	[3:0]	VControl_pad_o;
input	[7:0]	VStatus_pad_i;

output	[SSRAM_HADR:0]	sram_adr_o;
input	[31:0]	sram_data_i;
output	[31:0]	sram_data_o;
output		sram_re_o;
output		sram_we_o;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

// UTMI Interface
wire	[7:0]	rx_data;
wire		rx_valid, rx_active, rx_err;
wire	[7:0]	tx_data;
wire		tx_valid;
wire		tx_ready;
wire		tx_first;
wire		tx_valid_last;

// Misc UTMI USB status
wire		mode_hs;	// High Speed Mode
wire		usb_reset;	// USB Reset
wire		usb_suspend;	// USB Sleep
wire		usb_attached;	// Attached to USB
wire		resume_req;	// Resume Request

// Memory Arbiter Interface
wire	[SSRAM_HADR:0]	madr;		// word address
wire	[31:0]	mdout;
wire	[31:0]	mdin;
wire		mwe;
wire		mreq;
wire		mack;
wire		rst;

// Wishbone Memory interface
wire	[`USBF_UFC_HADR:0]	ma_adr;
wire	[31:0]	ma2wb_d;
wire	[31:0]	wb2ma_d;
wire		ma_we;
wire		ma_req;
wire		ma_ack;

// WISHBONE Register File interface
wire		rf_re;
wire		rf_we;
wire	[31:0]	wb2rf_d;
wire	[31:0]	rf2wb_d;

// Internal Register File Interface
wire	[6:0]	funct_adr;	// This functions address (set by controller)
wire	[31:0]	idin;		// Data Input
wire	[3:0]	ep_sel;		// Endpoint Number Input
wire		match;		// Endpoint Matched
wire		dma_in_buf_sz1;
wire		dma_out_buf_avail;
wire		buf0_rl;	// Reload Buf 0 with original values
wire		buf0_set;	// Write to buf 0
wire		buf1_set;	// Write to buf 1
wire		uc_bsel_set;	// Write to the uc_bsel field
wire		uc_dpd_set;	// Write to the uc_dpd field
wire		int_buf1_set;	// Set buf1 full/empty interrupt
wire		int_buf0_set;	// Set buf0 full/empty interrupt
wire		int_upid_set;	// Set unsupported PID interrupt
wire		int_crc16_set;	// Set CRC16 error interrupt
wire		int_to_set;	// Set time out interrupt
wire		int_seqerr_set;	// Set PID sequence error interrupt
wire		out_to_small;	// OUT packet was to small for DMA operation
wire	[31:0]	csr;		// Internal CSR Output
wire	[31:0]	buf0;		// Internal Buf 0 Output
wire	[31:0]	buf1;		// Internal Buf 1 Output
wire	[31:0]	frm_nat;	// Frame Number and Time Register
wire		nse_err;	// No Such Endpoint Error
wire		pid_cs_err;	// PID CS error
wire		crc5_err;	// CRC5 Error
wire		rf_resume_req;	// Resume Request From main CSR

reg		susp_o;
reg	[1:0]	LineState_r;	// Added to make a full synchronizer
reg	[7:0]	VStatus_r;	// Added to make a full synchronizer

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//
assign rst = rst_i;
assign phy_rst_pad_o = rst_i;
assign resume_req = resume_req_i;

always @(posedge clk_i)
	susp_o <= usb_suspend;

always @(posedge phy_clk_pad_i)		// First Stage Synchronizer
	LineState_r <= LineState_pad_i;

always @(posedge phy_clk_pad_i)		// First Stage Synchronizer
	VStatus_r <= VStatus_pad_i;

///////////////////////////////////////////////////////////////////
//
// Module Instantiations
//

reg		resume_req_r;
reg		suspend_clr_wr;
wire		suspend_clr;

always @(posedge clk_i)
	suspend_clr_wr <= suspend_clr;

`ifdef USBF_ASYNC_RESET
always @(posedge clk_i or negedge rst)
`else
always @(posedge clk_i)
`endif
	if(!rst)		resume_req_r <= 1'b0;
	else
	if(suspend_clr_wr)	resume_req_r <= 1'b0;
	else
	if(resume_req)		resume_req_r <= 1'b1;


// UTMI Interface
usbf_utmi_if	u0(
		.phy_clk(	phy_clk_pad_i	),
		.rst(		rst		),
		.DataOut(	DataOut_pad_o	),
		.TxValid(	TxValid_pad_o	),
		.TxReady(	TxReady_pad_i	),
		.RxValid(	RxValid_pad_i	),
		.RxActive(	RxActive_pad_i	),
		.RxError(	RxError_pad_i	),
		.DataIn(	DataIn_pad_i	),
		.XcvSelect(	XcvSelect_pad_o	),
		.TermSel(	TermSel_pad_o	),
		.SuspendM(	SuspendM_pad_o	),
		.LineState(	LineState_pad_i	),
		.OpMode(	OpMode_pad_o	),
		.usb_vbus(	usb_vbus_pad_i	),
		.rx_data(	rx_data		),
		.rx_valid(	rx_valid	),
		.rx_active(	rx_active	),
		.rx_err(	rx_err		),
		.tx_data(	tx_data		),
		.tx_valid(	tx_valid	),
		.tx_valid_last(	tx_valid_last	),
		.tx_ready(	tx_ready	),
		.tx_first(	tx_first	),
		.mode_hs(	mode_hs		),
		.usb_reset(	usb_reset	),
		.usb_suspend(	usb_suspend	),
		.usb_attached(	usb_attached	),
		.resume_req(	resume_req_r	),
		.suspend_clr(	suspend_clr	)
		);

// Protocol Layer
usbf_pl #(SSRAM_HADR)
	u1(	.clk(			phy_clk_pad_i		),
		.rst(			rst			),
		.rx_data(		rx_data			),
		.rx_valid(		rx_valid		),
		.rx_active(		rx_active		),
		.rx_err(		rx_err			),
		.tx_data(		tx_data			),
		.tx_valid(		tx_valid		),
		.tx_valid_last(		tx_valid_last		),
		.tx_ready(		tx_ready		),
		.tx_first(		tx_first		),
		.tx_valid_out(		TxValid_pad_o		),
		.mode_hs(		mode_hs			),
		.usb_reset(		usb_reset		),
		.usb_suspend(		usb_suspend		),
		.usb_attached(		usb_attached		),
		.madr(			madr			),
		.mdout(			mdout			),
		.mdin(			mdin			),
		.mwe(			mwe			),
		.mreq(			mreq			),
		.mack(			mack			),
		.fa(			funct_adr		),
		.dma_in_buf_sz1(	dma_in_buf_sz1		),
		.dma_out_buf_avail(	dma_out_buf_avail	),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.match(			match			),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			csr			),
		.buf0(			buf0			),
		.buf1(			buf1			),
		.frm_nat(		frm_nat			),
		.pid_cs_err(		pid_cs_err		),
		.nse_err(		nse_err			),
		.crc5_err(		crc5_err		)
		);

// Memory Arbiter
usbf_mem_arb	#(SSRAM_HADR)
	u2(	.phy_clk(	phy_clk_pad_i	),
		.wclk(		clk_i		),
		.rst(		rst		),

		.sram_adr(	sram_adr_o	),
		.sram_din(	sram_data_i	),
		.sram_dout(	sram_data_o	),
		.sram_re(	sram_re_o	),
		.sram_we(	sram_we_o	),

		.madr(		madr		),
		.mdout(		mdin		),
		.mdin(		mdout		),
		.mwe(		mwe		),
		.mreq(		mreq		),
		.mack(		mack		),

		.wadr(		ma_adr[SSRAM_HADR + 2:2]	),
		.wdout(		ma2wb_d		),
		.wdin(		wb2ma_d		),
		.wwe(		ma_we		),
		.wreq(		ma_req		),
		.wack(		ma_ack		)
		);

// Register File 
usbf_rf u4(	.clk(			phy_clk_pad_i		),
		.wclk(			clk_i			),
		.rst(			rst			),

		.adr(			ma_adr[8:2]		),
		.re(			rf_re			),
		.we(			rf_we			),
		.din(			wb2rf_d			),
		.dout(			rf2wb_d			),

		.inta(			inta_o			),
		.intb(			intb_o			),
		.dma_req(		dma_req_o		),
		.dma_ack(		dma_ack_i		),
		.idin(			idin			),
		.ep_sel(		ep_sel			),
		.match(			match			),
		.buf0_rl(		buf0_rl			),
		.buf0_set(		buf0_set		),
		.buf1_set(		buf1_set		),
		.uc_bsel_set(		uc_bsel_set		),
		.uc_dpd_set(		uc_dpd_set		),
		.int_buf1_set(		int_buf1_set		),
		.int_buf0_set(		int_buf0_set		),
		.int_upid_set(		int_upid_set		),
		.int_crc16_set(		int_crc16_set		),
		.int_to_set(		int_to_set		),
		.int_seqerr_set(	int_seqerr_set		),
		.out_to_small(		out_to_small		),
		.csr(			csr			),
		.buf0(			buf0			),
		.buf1(			buf1			),
		.funct_adr(		funct_adr		),
		.dma_in_buf_sz1(	dma_in_buf_sz1		),
		.dma_out_buf_avail(	dma_out_buf_avail	),
		.frm_nat(		frm_nat			),
		.utmi_vend_stat(	VStatus_r		),
		.utmi_vend_ctrl(	VControl_pad_o		),
		.utmi_vend_wr(		VControl_Load_pad_o	),
		.line_stat(		LineState_r		),
		.usb_attached(		usb_attached		),
		.mode_hs(		mode_hs			),
		.suspend(		usb_suspend		),
		.attached(		usb_attached		),
		.usb_reset(		usb_reset		),
		.pid_cs_err(		pid_cs_err		),
		.nse_err(		nse_err			),
		.crc5_err(		crc5_err		),
		.rx_err(		rx_err			),
		.rf_resume_req(		rf_resume_req		)
		);


// WISHBONE Interface
usbf_wb	u5(	.phy_clk(	phy_clk_pad_i	),
		.wb_clk(	clk_i		),
		.rst(		rst		),
		.wb_addr_i(	wb_addr_i	),
		.wb_data_i(	wb_data_i	),
		.wb_data_o(	wb_data_o	),
		.wb_ack_o(	wb_ack_o	),
		.wb_we_i(	wb_we_i		),
		.wb_stb_i(	wb_stb_i	),
		.wb_cyc_i(	wb_cyc_i	),

		.ma_adr(	ma_adr		),
		.ma_dout(	wb2ma_d		),
		.ma_din(	ma2wb_d		),
		.ma_we(		ma_we		),
		.ma_req(	ma_req		),
		.ma_ack(	ma_ack		),

		.rf_re(		rf_re		),
		.rf_we(		rf_we		),
		.rf_dout(	wb2rf_d		),
		.rf_din(	rf2wb_d		)
		);


///////////////////////////////////////////////////////////////////
//
// Initialization
// This section does not add any functionality. It is only provided
// to make sure that the core is configured properly and to provide
// configuration information for simulations.
//

// synopsys translate_off
integer 	ep_cnt, ep_cnt2;
reg	[15:0]	ep_check;
initial
   begin
	$display("\n");
	ep_cnt = 1;
	ep_cnt2 = 0;
	ep_check = 0;

`ifdef	USBF_HAVE_EP1	
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP2	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP3	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP4	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP5	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP6	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP7	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP8	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP9	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP10	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP11	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP12	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP13	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP14	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif
ep_cnt2 = ep_cnt2 + 1;
`ifdef	USBF_HAVE_EP15	
	if(!ep_check[ep_cnt2-1])
		$display("ERROR: USBF_TOP: Endpoint %0d not defined but endpoint %0d defined", ep_cnt2, ep_cnt2+1);
	ep_cnt = ep_cnt + 1;
	ep_check[ep_cnt2] = 1;
`endif

	$display("");
	$display("INFO: USB Function core instantiated (%m)");
	$display("      Supported Endpoints: %0d (0 through %0d)",ep_cnt, ep_cnt-1);
	$display("      WISHBONE Address bus size: A%0d:0", `USBF_UFC_HADR );
	$display("      SSRAM Address bus size: A%0d:0", SSRAM_HADR );
	$display("      Buffer Memory Size: %0d bytes", (1<<SSRAM_HADR+1) * 4 );
	$display("");

   end

// synopsys translate_on

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
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_utmi_if.v,v 1.5 2003-11-11 07:15:16 rudi Exp $
//
//  $Date: 2003-11-11 07:15:16 $
//  $Revision: 1.5 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.4  2003/10/17 02:36:57  rudi
//               - Disabling bit stuffing and NRZI encoding during speed negotiation
//               - Now the core can send zero size packets
//               - Fixed register addresses for some of the higher endpoints
//                 (conversion between decimal/hex was wrong)
//               - The core now does properly evaluate the function address to
//                 determine if the packet was intended for it.
//               - Various other minor bugs and typos
//
//               Revision 1.3  2001/11/04 12:22:45  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.2  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:52  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.2  2001/03/07 09:08:13  rudi
//
//               Added USB control signaling (Line Status) block. Fixed some minor
//               typos, added resume bit and signal.
//
//               Revision 0.1.0.1  2001/02/28 08:11:45  rudi
//               Initial Release
//
//

`include "usbf_defines.v"

module usbf_utmi_if( // UTMI Interface (EXTERNAL)
		phy_clk, rst,
		DataOut, TxValid, TxReady,
		RxValid, RxActive, RxError, DataIn,
		XcvSelect, TermSel, SuspendM, LineState,
		OpMode, usb_vbus,

		// Internal Interface
		rx_data, rx_valid, rx_active, rx_err,
		tx_data, tx_valid, tx_valid_last, tx_ready,
		tx_first,

		// Misc Interfaces
		mode_hs, usb_reset, usb_suspend, usb_attached,
		resume_req, suspend_clr
		);

input		phy_clk;
//input		wclk;
input		rst;

output	[7:0]	DataOut;
output		TxValid;
input		TxReady;

input	[7:0]	DataIn;
input		RxValid;
input		RxActive;
input		RxError;

output		XcvSelect;
output		TermSel;
output		SuspendM;
input	[1:0]	LineState;
output	[1:0]	OpMode;
input		usb_vbus;

output	[7:0]	rx_data;
output		rx_valid, rx_active, rx_err;
input	[7:0]	tx_data;
input		tx_valid;
input		tx_valid_last;
output		tx_ready;
input		tx_first;

output		mode_hs;	// High Speed Mode
output		usb_reset;	// USB Reset
output		usb_suspend;	// USB Suspend
output		usb_attached;	// Attached to USB
input		resume_req;

output		suspend_clr;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//
reg	[7:0]	rx_data;
reg		rx_valid, rx_active, rx_err;
reg	[7:0]	DataOut;
reg		tx_ready;
reg		TxValid;
wire		drive_k;
reg		drive_k_r;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//


///////////////////////////////////////////////////////////////////
//
// RX Interface Input registers
//

`ifdef USBF_ASYNC_RESET
always @(posedge phy_clk or negedge rst)
`else
always @(posedge phy_clk)
`endif
	if(!rst)	rx_valid <= 1'b0;
	else		rx_valid <= RxValid;

`ifdef USBF_ASYNC_RESET
always @(posedge phy_clk or negedge rst)
`else
always @(posedge phy_clk)
`endif
	if(!rst)	rx_active <= 1'b0;
	else		rx_active <= RxActive;

`ifdef USBF_ASYNC_RESET
always @(posedge phy_clk or negedge rst)
`else
always @(posedge phy_clk)
`endif
	if(!rst)	rx_err <= 1'b0;
	else		rx_err <= RxError;

always @(posedge phy_clk)
		rx_data <= DataIn;

///////////////////////////////////////////////////////////////////
//
// TX Interface Output/Input registers
//

always @(posedge phy_clk)
	if(TxReady || tx_first)	DataOut <= tx_data;
	else
	if(drive_k)		DataOut <= 8'h00;

always @(posedge phy_clk)
	tx_ready <= TxReady;

always @(posedge phy_clk)
	drive_k_r <= drive_k;


`ifdef USBF_ASYNC_RESET
always @(posedge phy_clk or negedge rst)
`else
always @(posedge phy_clk)
`endif
	if(!rst)	TxValid <= 1'b0;
	else
	TxValid <= tx_valid | drive_k | tx_valid_last | (TxValid & !(TxReady | drive_k_r));

///////////////////////////////////////////////////////////////////
//
// Line Status Signaling & Speed Negotiation Block
//

usbf_utmi_ls	u0(
		.clk(		phy_clk		),
		.rst(		rst		),
		.resume_req(	resume_req	),
		.rx_active(	rx_active	),
		.tx_ready(	tx_ready	),
		.drive_k(	drive_k		),
		.XcvSelect(	XcvSelect	),
		.TermSel(	TermSel		),
		.SuspendM(	SuspendM	),
		.LineState(	LineState	),
		.OpMode(	OpMode		),
		.usb_vbus(	usb_vbus	),
		.mode_hs(	mode_hs		),
		.usb_reset(	usb_reset	),
		.usb_suspend(	usb_suspend	),
		.usb_attached(	usb_attached	),
		.suspend_clr(	suspend_clr	)
		);

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  UTMI Line Status & Speed Negotiation block                 ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_utmi_ls.v,v 1.6 2003-11-11 07:15:16 rudi Exp $
//
//  $Date: 2003-11-11 07:15:16 $
//  $Revision: 1.6 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.5  2003/10/17 02:36:57  rudi
//               - Disabling bit stuffing and NRZI encoding during speed negotiation
//               - Now the core can send zero size packets
//               - Fixed register addresses for some of the higher endpoints
//                 (conversion between decimal/hex was wrong)
//               - The core now does properly evaluate the function address to
//                 determine if the packet was intended for it.
//               - Various other minor bugs and typos
//
//               Revision 1.4  2001/11/04 12:22:45  rudi
//
//               - Fixed previous fix (brocke something else ...)
//               - Majore Synthesis cleanup
//
//               Revision 1.3  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.2  2001/08/10 08:48:33  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:52  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.1  2001/03/07 09:08:13  rudi
//
//               Added USB control signaling (Line Status) block. Fixed some minor
//               typos, added resume bit and signal.
//
//
//


`include "usbf_defines.v"

module usbf_utmi_ls( clk, rst,

		resume_req,

		// UTMI Interface
		rx_active, tx_ready, drive_k,
		XcvSelect, TermSel, SuspendM, LineState, OpMode,
		usb_vbus,

		// Misc Interfaces
		mode_hs, usb_reset, usb_suspend, usb_attached,
		suspend_clr
		);

input		clk;
//input		wclk;
input		rst;

input		resume_req;
input		rx_active, tx_ready;

output		drive_k;
output		XcvSelect;
output		TermSel;
output		SuspendM;
input	[1:0]	LineState;
output	[1:0]	OpMode;
input		usb_vbus;

output		mode_hs;	// High Speed Mode
output		usb_reset;	// USB Reset
output		usb_suspend;	// USB Suspend
output		usb_attached;	// Attached to USB

output		suspend_clr;

///////////////////////////////////////////////////////////////////
//
// Parameters
//
parameter	[14:0]	// synopsys enum state
	POR		= 15'b000_0000_0000_0001,
	NORMAL		= 15'b000_0000_0000_0010,
	RES_SUSP	= 15'b000_0000_0000_0100,
	SUSPEND		= 15'b000_0000_0000_1000,
	RESUME		= 15'b000_0000_0001_0000,
	RESUME_REQUEST	= 15'b000_0000_0010_0000,
	RESUME_WAIT	= 15'b000_0000_0100_0000,
	RESUME_SIG	= 15'b000_0000_1000_0000,
	ATTACH		= 15'b000_0001_0000_0000,
	RESET		= 15'b000_0010_0000_0000,
	SPEED_NEG	= 15'b000_0100_0000_0000,
	SPEED_NEG_K	= 15'b000_1000_0000_0000,
	SPEED_NEG_J	= 15'b001_0000_0000_0000,
	SPEED_NEG_HS	= 15'b010_0000_0000_0000,
	SPEED_NEG_FS	= 15'b100_0000_0000_0000;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

reg	[14:0]	/* synopsys enum state */ state, next_state;
// synopsys state_vector state

reg	[1:0]	line_state_r;

reg		mode_hs, mode_set_hs, mode_set_fs;
reg		usb_suspend, suspend_set, suspend_clr;
reg		usb_attached, attached_set, attached_clr;
reg		TermSel, fs_term_on, fs_term_off;
reg		XcvSelect, xcv_set_hs, xcv_set_fs;
reg	[1:0]	OpMode;
reg		bit_stuff_on, bit_stuff_off;
reg		usb_reset, usb_reset_d;

wire		ls_se0, ls_j, ls_k, ls_se1;
reg		ls_k_r, ls_j_r, ls_se0_r;
reg		ls_idle_r;
wire		ls_idle;
reg		idle_long;
wire		idle_long_set, idle_long_clr;
wire		k_long, j_long, se0_long;

reg		drive_k, drive_k_d;

reg	[3:0]	ps_cnt;
reg		ps_cnt_clr;
reg		idle_cnt_clr;
reg		idle_cnt1_clr;
reg	[7:0]	idle_cnt1, idle_cnt1_next;
reg		T1_gt_2_5_uS, T1_st_3_0_mS, T1_gt_3_0_mS;
reg		T1_gt_3_125_mS, T1_gt_5_0_mS;
reg	[7:0]	me_ps;
reg		me_cnt_clr;
reg		me_ps_2_5_us;
reg	[7:0]	me_ps2;
reg		me_ps2_0_5_ms;
reg	[7:0]	me_cnt;
reg		me_cnt_100_ms;
reg		T2_gt_100_uS, T2_wakeup, T2_gt_1_0_mS, T2_gt_1_2_mS;

reg	[2:0]	chirp_cnt;
reg		chirp_cnt_clr, chirp_cnt_inc;
reg		chirp_cnt_is_6;

reg		resume_req_s1;
reg		resume_req_s;

///////////////////////////////////////////////////////////////////
//
// Misc Logic
//

always @(posedge clk)
	drive_k <= drive_k_d;

assign SuspendM = (usb_suspend & !resume_req_s) | (LineState == 2'b10);

always @(posedge clk)
	resume_req_s1 <= resume_req;

always @(posedge clk)
	resume_req_s <= resume_req_s1;

// ---------------------------------------------------------
// USB State/Operation Mode JK Flops
always @(posedge clk)
	if(mode_set_fs)		mode_hs <= 1'b0;
	else
	if(mode_set_hs)		mode_hs <= 1'b1;

always @(posedge clk)
	if(suspend_clr)		usb_suspend <= 1'b0;
	else
	if(suspend_set)		usb_suspend <= 1'b1;

always @(posedge clk)
	if(attached_clr)	usb_attached <= 1'b0;
	else
	if(attached_set)	usb_attached <= 1'b1;

always @(posedge clk)
	if(fs_term_off)		TermSel <= 1'b0;
	else
	if(fs_term_on)		TermSel <= 1'b1;

always @(posedge clk)
	if(xcv_set_fs)		XcvSelect <= 1'b1;
	else
	if(xcv_set_hs)		XcvSelect <= 1'b0;

always @(posedge clk)
	if(bit_stuff_off)	OpMode <= 2'b10;
	else
	if(bit_stuff_on)	OpMode <= 2'b00;

always @(posedge clk)
	usb_reset <= usb_reset_d;

// ---------------------------------------------------------
// Line State Detector

always @(posedge clk)
	line_state_r <= LineState;

assign ls_se0 = (line_state_r == 2'b00);
assign ls_j   = (line_state_r == 2'b01);
assign ls_k   = (line_state_r == 2'b10);
assign ls_se1 = (line_state_r == 2'b11);

assign ls_idle = mode_hs ? ls_se0 : ls_j;

// Idle Detection
// Idle Has to persist for at least two cycles in a roe in the
// same state to recognized
always @(posedge clk)
	ls_idle_r <= ls_idle;

assign idle_long_set = ls_idle & ls_idle_r;
assign idle_long_clr = !ls_idle & !ls_idle_r;

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)		idle_long <= 1'b0;
	else
	if(idle_long_clr)	idle_long <= 1'b0;
	else
	if(idle_long_set)	idle_long <= 1'b1;

// Detect Signals for two cycles ina row before making a transaction ...
always @(posedge clk)
	ls_k_r <= ls_k;

always @(posedge clk)
	ls_j_r <= ls_j;

always @(posedge clk)
	ls_se0_r <= ls_se0;

assign k_long = ls_k & ls_k_r;
assign j_long = ls_j & ls_j_r;
assign se0_long = ls_se0 & ls_se0_r;

///////////////////////////////////////////////////////////////////
//
// Counters
//

// ---------------------------------------------------------
// idle Counter

// Pre-Scaler
// Generates a 0.25 uS Count Enable (ps_cnt_clr)
always @(posedge clk)
	if(!idle_long || idle_cnt_clr || ps_cnt_clr)	ps_cnt <= 4'd0;
	else						ps_cnt <= ps_cnt + 4'd1;

always @(posedge clk)		// Clear the pre-scaler in 250 nS intervals
	ps_cnt_clr <= (ps_cnt == `USBF_T1_PS_250_NS);

// Count uS
always @(posedge clk)
	if(!idle_long || idle_cnt1_clr || idle_cnt_clr)	idle_cnt1 <= 8'h0;
	else
	if(!T1_gt_5_0_mS && ps_cnt_clr)			idle_cnt1 <= idle_cnt1_next;

always @(posedge clk)
	idle_cnt1_next <= idle_cnt1 + 8'h1;

always @(posedge clk)		// Clear the uS counter every 62.5 uS
	idle_cnt1_clr <= idle_cnt1 == `USBF_T1_C_62_5_US;

always @(posedge clk)	// Greater Than 2.5uS (Actual Time will be T0+2.75uS)
	T1_gt_2_5_uS <= !idle_cnt_clr & (idle_cnt1 > `USBF_T1_C_2_5_US);

always @(posedge clk)	// Smaller Than 3 mS (Actual Time will be 0-2.9375mS)
	T1_st_3_0_mS <= !idle_cnt_clr & (idle_cnt1 < `USBF_T1_C_3_0_MS);

always @(posedge clk)	// Greater Than 3 mS (Actual Time will be T0+3.0625mS)
	T1_gt_3_0_mS <= !idle_cnt_clr & (idle_cnt1 > `USBF_T1_C_3_0_MS);

always @(posedge clk)	// Greater Than 3.125 mS (Actual Time will be T0+3.1875uS)
	T1_gt_3_125_mS <= !idle_cnt_clr & (idle_cnt1 > `USBF_T1_C_3_125_MS);

always @(posedge clk)	// Greater Than 3.125 mS (Actual Time will be T0+3.1875uS)
	T1_gt_5_0_mS <= !idle_cnt_clr & (idle_cnt1 > `USBF_T1_C_5_MS);

// ---------------------------------------------------------
// Misc Events Counter

// Pre-scaler - 2.5uS
always @(posedge clk)
	if(me_cnt_clr || me_ps_2_5_us)		me_ps <= 8'h0;
	else					me_ps <= me_ps + 8'h1;

always @(posedge clk)	// Generate a pulse every 2.5 uS
	me_ps_2_5_us <= (me_ps == `USBF_T2_C_2_5_US);

// Second Pre-scaler - 0.5mS
always @(posedge clk)
	if(me_cnt_clr || me_ps2_0_5_ms )	me_ps2 <= 8'h0;
	else
	if(me_ps_2_5_us)			me_ps2 <= me_ps2 + 8'h1;

always @(posedge clk)	// Generate a pulse every 0.5 mS
	me_ps2_0_5_ms <= (me_ps2 == `USBF_T2_C_0_5_MS) & !me_ps2_0_5_ms;

// final misc Counter
always @(posedge clk)
	if(me_cnt_clr)				me_cnt <= 8'h0;
	else
	if(!me_cnt_100_ms && me_ps2_0_5_ms)	me_cnt <= me_cnt + 8'h1;

always @(posedge clk)	// Indicate when 100uS have passed
	T2_gt_100_uS <= !me_cnt_clr & (me_ps2 > `USBF_T2_C_100_US);	// Actual Time: 102.5 uS

always @(posedge clk)	// Indicate when wakeup period has passed
	T2_wakeup <= !me_cnt_clr & (me_cnt > `USBF_T2_C_WAKEUP);

always @(posedge clk)	// Indicate when 1 mS has passed
	T2_gt_1_0_mS <= !me_cnt_clr & (me_cnt > `USBF_T2_C_1_0_MS);	// Actual Time: 1.5 mS

always @(posedge clk)	// Indicate when 1.2 mS has passed
	T2_gt_1_2_mS <= !me_cnt_clr & (me_cnt > `USBF_T2_C_1_2_MS);	// Actual Time: 1.5 mS

always @(posedge clk)	// Generate a pulse after 100 mS
	me_cnt_100_ms <= !me_cnt_clr & (me_cnt == `USBF_T2_C_100_MS); // Actual Time: 100 mS

// ---------------------------------------------------------
// Chirp Counter

always @(posedge clk)
	if(chirp_cnt_clr)	chirp_cnt <= 3'h0;
	else
	if(chirp_cnt_inc)	chirp_cnt <= chirp_cnt + 3'h1;

always @(posedge clk)
	chirp_cnt_is_6 <= (chirp_cnt == 3'h6);

///////////////////////////////////////////////////////////////////
//
// Main State Machine
//

`ifdef USBF_ASYNC_RESET
always @(posedge clk or negedge rst)
`else
always @(posedge clk)
`endif
	if(!rst)		state <= POR;
	else
	if(usb_vbus)		state <= POR;
	else			state <= next_state;

always @(state or mode_hs or idle_long or resume_req_s or me_cnt_100_ms or
	j_long or k_long or se0_long or ls_se0 or
	T1_gt_2_5_uS or T1_st_3_0_mS or T1_gt_3_0_mS or
	T1_gt_5_0_mS or T2_gt_100_uS or T2_wakeup or T2_gt_1_0_mS or
	T2_gt_1_2_mS or chirp_cnt_is_6)
   begin
	next_state = state;	// Default don't change state

	mode_set_hs = 1'b0;
	mode_set_fs = 1'b0;
	suspend_set = 1'b0;
	suspend_clr = 1'b0;
	attached_set = 1'b0;
	attached_clr = 1'b0;
	usb_reset_d = 1'b0;

	fs_term_on = 1'b0;
	fs_term_off = 1'b0;
	xcv_set_hs = 1'b0;
	xcv_set_fs = 1'b0;
	bit_stuff_on  = 1'b0;
	bit_stuff_off = 1'b0;

	idle_cnt_clr = 1'b0;
	me_cnt_clr = 1'b0;
	drive_k_d = 1'b0;
	chirp_cnt_clr = 1'b0;
	chirp_cnt_inc = 1'b0;

	case(state)	// synopsys full_case parallel_case
	   POR:		// Power On/Reset
	     begin
		me_cnt_clr = 1'b1;
		xcv_set_fs = 1'b1;
		fs_term_on = 1'b1;
		mode_set_fs = 1'b1;
		attached_clr = 1'b1;
		bit_stuff_on  = 1'b0;
		suspend_clr = 1'b1;
		next_state = ATTACH;
	     end

	   NORMAL:	// Normal Operation
	     begin
		if(!mode_hs && T1_gt_2_5_uS && T1_st_3_0_mS && !idle_long)
		   begin
			me_cnt_clr = 1'b1;
			next_state = RESET;
		   end
		else
		if(!mode_hs && T1_gt_3_0_mS)			
		   begin
			idle_cnt_clr = 1'b1;
			suspend_set = 1'b1;
			next_state = SUSPEND;
		   end
		else
		if(mode_hs && T1_gt_3_0_mS)
		   begin			// Switch to FS mode, and decide
						// if it's a RESET or SUSPEND
			me_cnt_clr = 1'b1;
			xcv_set_fs = 1'b1;
			fs_term_on = 1'b1;
			next_state = RES_SUSP;
		   end
	     end

	   RES_SUSP:	// Decide if it's a Reset or Suspend Signaling
	     begin	// We are now in FS mode, wait 100uS first
		if(T2_gt_100_uS && se0_long)
		   begin
			me_cnt_clr = 1'b1;
			next_state = RESET;
		   end
		else
		if(T2_gt_100_uS && j_long)
		   begin
			idle_cnt_clr = 1'b1;
			suspend_set = 1'b1;
			next_state = SUSPEND;
		   end
	     end

	   SUSPEND:	// In Suspend
	     begin
		if(T1_gt_2_5_uS && se0_long)
		   begin
			suspend_clr = 1'b1;
			me_cnt_clr = 1'b1;
			next_state = RESET;
		   end
		else
		if(k_long)			// Start Resuming
			next_state = RESUME;
		else
		if(T1_gt_5_0_mS && resume_req_s)
			next_state = RESUME_REQUEST;
	     end

	   RESUME:
	     begin
		suspend_clr = 1'b1;
		if(ls_se0)
		   begin
			if(mode_hs)
			   begin	// Switch Back to HS mode
				xcv_set_hs = 1'b1;
				fs_term_off = 1'b1;
			   end
			bit_stuff_on  = 1'b1;	// Enable Bit Stuffing and NRZI encoding
			me_cnt_clr = 1'b1;
			next_state = RESUME_WAIT;
		   end
	     end

	   RESUME_WAIT:
	     begin
		if(T2_gt_100_uS)	next_state = NORMAL;
	     end

	   RESUME_REQUEST:	// Function Resume Request
	     begin
		suspend_clr = 1'b1;
		// Wait for internal wake up
		if(T2_wakeup)
		   begin
			fs_term_on = 1'b1;	// Switch Termination to Full Speed
			bit_stuff_off  = 1'b1;	// disable Bit Stuffing and NRZI encoding
			me_cnt_clr = 1'b1;
			next_state = RESUME_SIG;
		   end
	     end

	   RESUME_SIG:	// Signal resume
	     begin
		// Drive Resume ('K') for 1-15 mS
		drive_k_d = 1'b1;
		// Stop driving after 1.5 mS
		if(T2_gt_1_0_mS)		next_state = RESUME;
	     end

	   ATTACH:	// Attach To USB Detected
	     begin
		idle_cnt_clr = 1'b1;
		if(me_cnt_100_ms)
		//if(me_cnt_100_ms && j_long)
		   begin
			attached_set = 1'b1;
			next_state = NORMAL;
		   end
		/*
		if(me_cnt_100_ms && se0_long)
		   begin
			attached_set = 1'b1;
			me_cnt_clr = 1'b1;
			next_state = RESET;
		   end
		*/
	     end

	   RESET:	// In Reset
	     begin
		usb_reset_d = 1'b1;	// Assert Internal USB Reset
		xcv_set_hs = 1'b1;	// Switch xcvr to HS mode
		fs_term_on = 1'b1;	// Turn FS termination On
		mode_set_fs = 1'b1;	// Change mode to FS
		bit_stuff_off  = 1'b1;	// disable Bit Stuffing and NRZI encoding
		// Get out of reset after 1.5 mS
		if(T2_gt_1_0_mS)
		   begin
			me_cnt_clr = 1'b1;
			next_state = SPEED_NEG;
		   end
	     end

	   SPEED_NEG:	// Speed Negotiation
	     begin
		drive_k_d = 1'b1;
		chirp_cnt_clr = 1'b1;
		// Start looking for 'K' after 1.5 mS
		if(T2_gt_1_2_mS)	next_state = SPEED_NEG_K;
	     end

	   SPEED_NEG_K:
	     begin
		if(chirp_cnt_is_6)	next_state = SPEED_NEG_HS;
		else
		   begin
			if(k_long)
			   begin
				chirp_cnt_inc = 1'b1;
				next_state = SPEED_NEG_J;
			   end
			if(se0_long)
				next_state = SPEED_NEG_FS;
		   end
	     end

	   SPEED_NEG_J:
	     begin
		if(chirp_cnt_is_6)	next_state = SPEED_NEG_HS;
		else
		   begin
			if(j_long)
			   begin
				chirp_cnt_inc = 1'b1;
				next_state = SPEED_NEG_K;
			   end
			if(se0_long)
				next_state = SPEED_NEG_FS;
		   end
	     end

	   SPEED_NEG_HS:
	     begin
		bit_stuff_on  = 1'b1;	// Enable Bit Stuffing and NRZI encoding
		xcv_set_hs = 1'b1;	// Switch xcvr to HS mode
		fs_term_off = 1'b1;	// Turn FS termination Off
		mode_set_hs = 1'b1;	// Change mode to HS
		if(se0_long)		next_state = NORMAL;
	     end

	   SPEED_NEG_FS:
	     begin
		bit_stuff_on  = 1'b1;	// Enable Bit Stuffing and NRZI encoding
		xcv_set_fs = 1'b1;	// Switch xcvr to FS mode
		fs_term_on = 1'b1;	// Turn FS termination On
		mode_set_fs = 1'b1;	// Change mode to FS
		next_state = NORMAL;
	     end

	endcase
   end

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  WISHBONE Interface                                         ////
////  This is the external bus interface, that is WISHBONE       ////
////  SoC compliant.                                             ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/usb/       ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2003 Rudolf Usselmann                    ////
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
//  $Id: usbf_wb.v,v 1.4 2003-10-17 02:36:57 rudi Exp $
//
//  $Date: 2003-10-17 02:36:57 $
//  $Revision: 1.4 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.3  2001/09/24 01:15:28  rudi
//
//               Changed reset to be active high async.
//
//               Revision 1.2  2001/08/10 08:48:33  rudi
//
//               - Changed IO names to be more clear.
//               - Uniquifyed define names to be core specific.
//
//               Revision 1.1  2001/08/03 05:30:09  rudi
//
//
//               1) Reorganized directory structure
//
//               Revision 1.2  2001/03/31 13:00:52  rudi
//
//               - Added Core configuration
//               - Added handling of OUT packets less than MAX_PL_SZ in DMA mode
//               - Modified WISHBONE interface and sync logic
//               - Moved SSRAM outside the core (added interface)
//               - Many small bug fixes ...
//
//               Revision 1.0  2001/03/07 09:17:12  rudi
//
//
//               Changed all revisions to revision 1.0. This is because OpenCores CVS
//               interface could not handle the original '0.1' revision ....
//
//               Revision 0.1.0.1  2001/02/28 08:11:47  rudi
//               Initial Release
//
//

`include "usbf_defines.v"

module usbf_wb(	// WISHBONE Interface
		wb_clk, phy_clk, rst, wb_addr_i, wb_data_i, wb_data_o, 
		wb_ack_o, wb_we_i, wb_stb_i, wb_cyc_i,

		// Memory Arbiter Interface
		ma_adr, ma_dout, ma_din, ma_we, ma_req, ma_ack,

		// Register File interface
		rf_re, rf_we, rf_din, rf_dout);

input		wb_clk, phy_clk;
input		rst;
input	[`USBF_UFC_HADR:0]	wb_addr_i;
input	[31:0]	wb_data_i;
output	[31:0]	wb_data_o;
output		wb_ack_o;
input		wb_we_i;
input		wb_stb_i;
input		wb_cyc_i;

// Memory Arbiter Interface
output	[`USBF_UFC_HADR:0]	ma_adr;
output	[31:0]	ma_dout;
input	[31:0]	ma_din;
output		ma_we;
output		ma_req;
input		ma_ack;

// Register File interface
output		rf_re;
output		rf_we;
input	[31:0]	rf_din;
output	[31:0]	rf_dout;

///////////////////////////////////////////////////////////////////
//
// Local Wires and Registers
//

parameter	[5:0]	// synopsys enum state
		IDLE	= 6'b00_0001,
		MA_WR	= 6'b00_0010,
		MA_RD	= 6'b00_0100,
		W0	= 6'b00_1000,
		W1	= 6'b01_0000,
		W2	= 6'b10_0000;

reg	[5:0]	/* synopsys enum state */ state, next_state;
// synopsys state_vector state

reg		wb_req_s1;
reg		wb_ack_d, wb_ack_s1, wb_ack_s1a, wb_ack_s2;
reg		ma_we;
reg		rf_re, rf_we_d;
reg		ma_req;
reg		wb_ack_o;
reg	[31:0]	wb_data_o;

///////////////////////////////////////////////////////////////////
//
// Interface Logic
//

assign ma_adr = wb_addr_i;
assign ma_dout = wb_data_i;
assign rf_dout = wb_data_i;

always @(posedge wb_clk)
	if( `USBF_RF_SEL )	wb_data_o <= rf_din;
	else			wb_data_o <= ma_din;

// Sync WISHBONE Request
always @(posedge phy_clk)
	wb_req_s1 <= wb_stb_i & wb_cyc_i;

// Sync WISHBONE Ack
always @(posedge wb_clk)
	wb_ack_s1 <= wb_ack_d;

always @(posedge wb_clk)
	wb_ack_o <= wb_ack_s1 & !wb_ack_s2 & !wb_ack_o;

always @(posedge wb_clk)
	wb_ack_s1a <= wb_ack_s1;

always @(posedge wb_clk)
	wb_ack_s2 <= wb_ack_s1a;

assign	rf_we = rf_we_d;

///////////////////////////////////////////////////////////////////
//
// Interface State Machine
//

`ifdef USBF_ASYNC_RESET
always @(posedge phy_clk or negedge rst)
`else
always @(posedge phy_clk)
`endif
	if(!rst)	state <= IDLE;
	else		state <= next_state;

always @(state or wb_req_s1 or wb_addr_i or ma_ack or wb_we_i)
   begin
	next_state = state;
	ma_req = 1'b0;
	ma_we = 1'b0;
	wb_ack_d = 1'b0;
	rf_re = 1'b0;
	rf_we_d = 1'b0;

	case(state)		// synopsys full_case parallel_case
	   IDLE:
	     begin
		if(wb_req_s1 && `USBF_MEM_SEL && wb_we_i)	
		   begin
			ma_req = 1'b1;
			ma_we = 1'b1;
			next_state = MA_WR;
		   end
		if(wb_req_s1 && `USBF_MEM_SEL && !wb_we_i)
		   begin
			ma_req = 1'b1;
			next_state = MA_RD;
		   end
		if(wb_req_s1 && `USBF_RF_SEL && wb_we_i)
		   begin
			rf_we_d = 1'b1;
			next_state = W0;
		   end
		if(wb_req_s1 && `USBF_RF_SEL && !wb_we_i)
		   begin
			rf_re = 1'b1;
			next_state = W0;
		   end
	     end

	   MA_WR:
	     begin
		if(!ma_ack)
		   begin
			ma_req = 1'b1;
			ma_we = 1'b1;
		   end
		else
		   begin
			wb_ack_d = 1'b1;
			next_state = W1;
		   end
	     end

	   MA_RD:
	     begin
		if(!ma_ack)
		   begin
			ma_req = 1'b1;
		   end
		else
		   begin
			wb_ack_d = 1'b1;
			next_state = W1;
		   end
	     end

	   W0:
	     begin
			wb_ack_d = 1'b1;
			next_state = W1;
	     end

	   W1:
	     begin
			next_state = W2;
	     end

	   W2:
	     begin
			next_state = IDLE;
	     end

	endcase
   end

endmodule

