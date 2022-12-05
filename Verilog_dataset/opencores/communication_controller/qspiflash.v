////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	eqspiflash.v
//
// Project:	Wishbone Controlled Quad SPI Flash Controller
//
// Purpose:	Provide access to the flash device on an Arty, via the Extended
//		SPI interface.  Reads and writes will use the QuadSPI interface
//	(4-bits at a time) all other commands (register and otherwise) will use
//	the SPI interface (1 bit at a time).
//
// Registers:
//	0. Erase register control.  Provides status of pending writes, erases,
//		and commands (sub)sector erase operations.
//	   Bit-Fields:
//		31. WIP (Write-In-Progress), write a '1' to this bit to command
//			an erase sequence.
//		30. WriteEnabled -- set to a '1' to disable write protection and
//			to write a WRITE-ENABLE to the device.  Set to a '0' to
//			disable WRITE-ENABLE-LATCH.  (Key is required to enable
//			writes)
//		29. Quad mode read/writes enabled.  (Rest of controller will use
//			extended SPI mode, but reads and writes will use Quad
//			mode.)
//		28. Subsector erase bit (set 1 to erase a subsector, 0 to 
//			erase a full sector, maintains last value written from
//			an erase command, starts at '0')
//		27. SD ID loaded
//		26. Write protect violation--cleared upon any valid write
//		25. XIP enabled.  (Leave read mode in XIP, so you can start
//			next read faster.)
//		24. Unused
//		23..0: Address of erase sector upon erase command
//		23..14: Sector address (can only be changed w/ key)
//		23..10: Subsector address (can only be changed w/ key)
//		 9.. 0: write protect KEY bits, always read a '0', write
//			commands, such as WP disable or erase, must always
//			write with a '1be' to activate.
//	0. WEL:	All writes that do not command an erase will be used
//			to set/clear the write enable latch.
//			Send 0x06, return, if WP is clear (enable writes)
//			Send 0x04, return
//	1. STATUS
//		Send 0x05, read  1-byte
//		Send 0x01, write 1-byte: i_wb_data[7:0]
//	2. NV-CONFIG (16-bits)
//		Send 0xB5, read  2-bytes
//		Send 0xB1, write 2-bytes: i_wb_data[15:0]
//	3. V-CONFIG (8-bits)
//		Send 0x85, read  1-byte
//		Send 0x81, write 1-byte: i_wb_data[7:0]
//	4. EV-CONFIG (8-bits)
//		Send 0x65, read  1-byte
//		Send 0x61, write 1-byte: i_wb_data[7:0]
//	5. Lock (send 32-bits, rx 1 byte)
//		Send 0xE8, last-sector-addr (3b), read  1-byte
//		Send 0xE5, last-sector-addr (3b), write 1-byte: i_wb_data[7:0]
//	6. Flag Status
//		Send 0x70, read  1-byte
//		Send 0x50, to clear, no bytes to write
//	7. Asynch Read-ID: Write here to cause controller to read ID into buffer
//	8.-12.	ID buffer (20 bytes, 5 words)
//		Attempted reads before buffer is full will stall bus until 
//		buffer is read.  Writes act like the asynch-Read-ID command,
//		and will cause the controller to read the buffer.
//	13. Reset Enable
//	14. Reset Memory
//	15.	OTP control word
//			Write zero to permanently lock OTP
//			Read to determine if OTP is permanently locked
//	16.-31.	OTP (64-bytes, 16 words, buffered until write)
//		(Send DWP before writing to clear write enable latch)
//
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2016, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
// `define	QSPI_READ_ONLY
module	eqspiflash(i_clk_82mhz, i_rst,
		// Incoming wishbone connection(s)
		//	The two strobe lines allow the data to live on a
		//	separate part of the master bus from the control 
		//	registers.  Only one strobe will ever be active at any
		//	time, no strobes will ever be active unless i_wb_cyc
		//	is also active.
		i_wb_cyc, i_wb_data_stb, i_wb_ctrl_stb, i_wb_we,
		i_wb_addr, i_wb_data,
		// Outgoing wishbone data
		o_wb_ack, o_wb_stall, o_wb_data,
		// Quad SPI connections
		o_qspi_sck, o_qspi_cs_n, o_qspi_mod, o_qspi_dat, i_qspi_dat,
		// Interrupt the CPU
		o_interrupt, o_cmd_accepted,
		// Debug the interface
		o_dbg);

	input			i_clk_82mhz, i_rst;
	// Wishbone bus inputs
	input			i_wb_cyc, i_wb_data_stb, i_wb_ctrl_stb, i_wb_we;
	input		[21:0]	i_wb_addr;	// 24 bits of addr space
	input		[31:0]	i_wb_data;
	// Wishbone bus outputs
	output	reg		o_wb_ack;
	output	wire		o_wb_stall;
	output	reg	[31:0]	o_wb_data;
	// Quad SPI connections
	output	wire		o_qspi_sck, o_qspi_cs_n;
	output	wire	[1:0]	o_qspi_mod;
	output	wire	[3:0]	o_qspi_dat;
	input	wire	[3:0]	i_qspi_dat;
	//
	output	reg		o_interrupt;
	//
	output	reg		o_cmd_accepted;
	//
	output	wire	[31:0]	o_dbg;

	initial	o_cmd_accepted = 1'b0;
	always @(posedge i_clk_82mhz)
		o_cmd_accepted=((i_wb_data_stb)||(i_wb_ctrl_stb))&&(~o_wb_stall);
	//
	// lleqspi
	//
	//	Providing the low-level SPI interface
	//
	reg	spi_wr, spi_hold, spi_spd, spi_dir, spi_recycle;
	reg	[31:0]	spi_word;
	reg	[1:0]	spi_len;
	wire	[31:0]	spi_out;
	wire		spi_valid, spi_busy, spi_stopped;
	lleqspi	lowlvl(i_clk_82mhz, spi_wr, spi_hold, spi_word, spi_len,
			spi_spd, spi_dir, spi_recycle, spi_out, spi_valid, spi_busy,
		o_qspi_sck, o_qspi_cs_n, o_qspi_mod, o_qspi_dat, i_qspi_dat);
	assign	spi_stopped = (o_qspi_cs_n)&&(~spi_busy)&&(~spi_wr);


	//
	// Bus module
	//
	//	Providing a shared interface to the WB bus
	//
	// Wishbone data (returns)
	wire		bus_wb_ack, bus_wb_stall;
	wire	[31:0]	bus_wb_data;
	// Latched request data
	wire		bus_wr;
	wire	[21:0]	bus_addr;
	wire	[31:0]	bus_data;
	wire	[21:0]	bus_sector;
	// Strobe commands
	wire	bus_ack;
	wire	bus_readreq, bus_piperd, bus_ereq, bus_wreq,
			bus_pipewr, bus_endwr, bus_ctreq, bus_idreq,
			bus_other_req,
	// Live parameters
			w_xip, w_quad, w_idloaded, w_leave_xip;
	reg		bus_wip;
	qspibus	preproc(i_clk_82mhz, i_rst,
			i_wb_cyc, i_wb_data_stb, i_wb_ctrl_stb,
				i_wb_we, i_wb_addr, i_wb_data,
				bus_wb_ack, bus_wb_stall, bus_wb_data,
			bus_wr, bus_addr, bus_data, bus_sector,
				bus_readreq, bus_piperd,
					bus_wreq, bus_ereq,
					bus_pipewr, bus_endwr,
				bus_ctreq, bus_idreq, bus_other_req, bus_ack,
			w_xip, w_quad, w_idloaded, bus_wip, spi_stopped);

	//
	// Read flash module
	//
	//	Providing a means of (and the logic to support) reading from
	//	the flash
	//
	wire		rd_data_ack;
	wire	[31:0]	rd_data;
	//
	wire		rd_bus_ack;
	//
	wire		rd_qspi_req;
	wire		rd_qspi_grant;
	//
	wire		rd_spi_wr, rd_spi_hold, rd_spi_spd, rd_spi_dir, 
			rd_spi_recycle;
	wire	[31:0]	rd_spi_word;
	wire	[1:0]	rd_spi_len;
	//
	readqspi	rdproc(i_clk_82mhz, bus_readreq, bus_piperd,
					bus_other_req,
				bus_addr, rd_bus_ack,
				rd_qspi_req, rd_qspi_grant,
				rd_spi_wr, rd_spi_hold, rd_spi_word, rd_spi_len,
				rd_spi_spd, rd_spi_dir, rd_spi_recycle,
					spi_out, spi_valid,
					spi_busy, spi_stopped, rd_data_ack, rd_data,
					w_quad, w_xip, w_leave_xip);

	//
	// Write/Erase flash module
	//
	//	Logic to write (program) and erase the flash.
	//
	// Wishbone bus return
	wire		ew_data_ack;
	wire	[31:0]	ew_data;
	// Arbiter interaction
	wire		ew_qspi_req;
	wire		ew_qspi_grant;
	// Bus controller return
	wire		ew_bus_ack;
	// SPI control wires
	wire		ew_spi_wr, ew_spi_hold, ew_spi_spd, ew_spi_dir;
	wire	[31:0]	ew_spi_word;
	wire	[1:0]	ew_spi_len;
	//
	wire		w_ew_wip;
	//
	writeqspi	ewproc(i_clk_82mhz, bus_wreq,bus_ereq,
					bus_pipewr, bus_endwr,
					bus_addr, bus_data,
				ew_bus_ack, ew_qspi_req, ew_qspi_grant,
				ew_spi_wr, ew_spi_hold, ew_spi_word, ew_spi_len,
					ew_spi_spd, ew_spi_dir,
					spi_out, spi_valid, spi_busy, spi_stopped,
				ew_data_ack, w_quad, w_ew_wip);

	//
	// Control module
	//
	//	Logic to read/write status and configuration registers
	//
	// Wishbone bus return
	wire		ct_data_ack;
	wire	[31:0]	ct_data;
	// Arbiter interaction
	wire		ct_qspi_req;
	wire		ct_grant;
	// Bus controller return
	wire		ct_ack;
	// SPI control wires
	wire		ct_spi_wr, ct_spi_hold, ct_spi_spd, ct_spi_dir;
	wire	[31:0]	ct_spi_word;
	wire	[1:0]	ct_spi_len;
	//
	ctrlspi		ctproc(i_clk_82mhz,
				bus_ctreq, bus_wr, bus_addr[3:0], bus_data, bus_sector,
				ct_qspi_req, ct_grant,
				ct_spi_wr, ct_spi_hold, ct_spi_word, ct_spi_len,
					ct_spi_spd, ct_spi_dir,
					spi_out, spi_valid, spi_busy, spi_stopped,
				ct_ack, ct_data_ack, ct_data, w_leave_xip, w_xip, w_quad);
	assign	ct_spi_hold = 1'b0;
	assign	ct_spi_spd  = 1'b0;

	//
	// ID/OTP module
	//
	//	Access to ID and One-Time-Programmable registers, but to read
	//	and to program (the OTP), and to finally lock (OTP) registers.
	//
	// Wishbone bus return
	wire		id_data_ack;
	wire	[31:0]	id_data;
	// Arbiter interaction
	wire		id_qspi_req;
	wire		id_qspi_grant;
	// Bus controller return
	wire		id_bus_ack;
	// SPI control wires
	wire		id_spi_wr, id_spi_hold, id_spi_spd, id_spi_dir;
	wire	[31:0]	id_spi_word;
	wire	[1:0]	id_spi_len;
	//
	wire		w_id_wip;
	//
	idotpqspi	idotp(i_clk_82mhz, bus_idreq,
				bus_wr, bus_pipewr, bus_addr[4:0], bus_data, id_bus_ack,
				id_qspi_req, id_qspi_grant,
				id_spi_wr, id_spi_hold, id_spi_word, id_spi_len,
					id_spi_spd, id_spi_dir,
					spi_out, spi_valid, spi_busy, spi_stopped,
				id_data_ack, id_data, w_idloaded, w_id_wip);

	// Arbitrator
	reg		owned;
	reg	[1:0]	owner;
	initial		owned = 1'b0;
	always @(posedge i_clk_82mhz) // 7 inputs (spi_stopped is the CE)
		if ((~owned)&&(spi_stopped))
		begin
			casez({rd_qspi_req,ew_qspi_req,id_qspi_req,ct_qspi_req})
			4'b1???: begin owned<= 1'b1; owner <= 2'b00; end
			4'b01??: begin owned<= 1'b1; owner <= 2'b01; end
			4'b001?: begin owned<= 1'b1; owner <= 2'b10; end
			4'b0001: begin owned<= 1'b1; owner <= 2'b11; end
			default: begin owned<= 1'b0; owner <= 2'b00; end
			endcase
		end else if ((owned)&&(spi_stopped))
		begin
			casez({rd_qspi_req,ew_qspi_req,id_qspi_req,ct_qspi_req,owner})
			6'b0???00: owned<= 1'b0;
			6'b?0??01: owned<= 1'b0;
			6'b??0?10: owned<= 1'b0;
			6'b???011: owned<= 1'b0;
			default: begin ; end
			endcase
		end

	assign	rd_qspi_grant = (owned)&&(owner == 2'b00);
	assign	ew_qspi_grant = (owned)&&(owner == 2'b01);
	assign	id_qspi_grant = (owned)&&(owner == 2'b10);
	assign	ct_grant      = (owned)&&(owner == 2'b11);

	// Module controller
	always @(posedge i_clk_82mhz)
	case(owner)
	2'b00: begin
		spi_wr      <= (owned)&&(rd_spi_wr);
		spi_hold    <= rd_spi_hold;
		spi_word    <= rd_spi_word;
		spi_len     <= rd_spi_len;
		spi_spd     <= rd_spi_spd;
		spi_dir     <= rd_spi_dir;
		spi_recycle <= rd_spi_recycle;
		end
	2'b01: begin
		spi_wr	    <= (owned)&&(ew_spi_wr);
		spi_hold    <= ew_spi_hold;
		spi_word    <= ew_spi_word;
		spi_len     <= ew_spi_len;
		spi_spd     <= ew_spi_spd;
		spi_dir     <= ew_spi_dir;
		spi_recycle <= 1'b1; // Long recycle time
		end
	2'b10: begin
		spi_wr	    <= (owned)&&(id_spi_wr);
		spi_hold    <= id_spi_hold;
		spi_word    <= id_spi_word;
		spi_len     <= id_spi_len;
		spi_spd     <= id_spi_spd;
		spi_dir     <= id_spi_dir;
		spi_recycle <= 1'b1; // Long recycle time
		end
	2'b11: begin
		spi_wr	    <= (owned)&&(ct_spi_wr);
		spi_hold    <= ct_spi_hold;
		spi_word    <= ct_spi_word;
		spi_len     <= ct_spi_len;
		spi_spd     <= ct_spi_spd;
		spi_dir     <= ct_spi_dir;
		spi_recycle <= 1'b1; // Long recycle time
		end
	endcase

	reg	last_wip;
	initial	bus_wip = 1'b0;
	initial	last_wip = 1'b0;
	initial o_interrupt = 1'b0;
	always @(posedge i_clk_82mhz)
	begin
		bus_wip <= w_ew_wip || w_id_wip;
		last_wip <= bus_wip;
		o_interrupt <= ((~bus_wip)&&(last_wip));
	end


	// Now, let's return values onto the wb bus
	always @(posedge i_clk_82mhz)
	begin
		// Ack our internal bus controller.  This means the command was
		// accepted, and the bus can go on to looking for the next 
		// command.  It controls the i_wb_stall line, just not the
		// i_wb_ack line.

		// Ack the wishbone with any response
		o_wb_ack <= (bus_wb_ack)|(rd_data_ack)|(ew_data_ack)|(id_data_ack)|(ct_data_ack);
		o_wb_data <= (bus_wb_ack)?bus_wb_data
			: (id_data_ack) ? id_data : spi_out;
	end

	assign	o_wb_stall = bus_wb_stall;
	assign	bus_ack = (rd_bus_ack|ew_bus_ack|id_bus_ack|ct_ack);
		
	assign	o_dbg = {
		i_wb_cyc, i_wb_ctrl_stb, i_wb_data_stb, o_wb_ack, bus_ack, //5
		//
		(spi_wr)&&(~spi_busy), spi_valid, spi_word[31:25],
		spi_out[7:2],
		//
		o_qspi_cs_n, o_qspi_sck, o_qspi_mod,	// 4 bits
		o_qspi_dat, i_qspi_dat			// 8 bits
		};
endmodule

module	qspibus(i_clk, i_rst, i_cyc, i_data_stb, i_ctrl_stb,
		i_we, i_addr, i_data,
			o_wb_ack, o_wb_stall, o_wb_data,
		o_wr, o_addr, o_data, o_sector,
		o_readreq, o_piperd, o_wrreq, o_erreq, o_pipewr, o_endwr,
			o_ctreq, o_idreq, o_other,
		i_ack, i_xip, i_quad, i_idloaded, i_wip, i_spi_stopped);
	//
	input			i_clk, i_rst;
	// Wishbone bus inputs
	input			i_cyc, i_data_stb, i_ctrl_stb, i_we;
	input		[21:0]	i_addr;
	input		[31:0]	i_data;
	// Wishbone bus outputs
	output	reg		o_wb_ack;
	output	reg		o_wb_stall;
	output	wire	[31:0]	o_wb_data;
	// Internal signals to the QSPI flash interface
	output	reg		o_wr;
	output	reg	[21:0]	o_addr;
	output	reg	[31:0]	o_data;
	output	wire	[21:0]	o_sector;
	output	reg		o_readreq, o_piperd, o_wrreq, o_erreq,
				o_pipewr, o_endwr,
				o_ctreq, o_idreq;
	output	wire		o_other;
	input			i_ack, i_xip, i_quad, i_idloaded;
	input			i_wip, i_spi_stopped;


	//
	reg	pending, lcl_wrreq, lcl_ctreq, lcl_ack, ack, wp_err, wp;
	reg	lcl_reg;
	reg	[12:0]	esector;
	reg	[21:0]	next_addr;


	reg	pipeable;
	reg	same_page;
	always @(posedge i_clk)
		same_page <= (i_data_stb)&&(i_we)
			&&(i_addr[21:6] == o_addr[21:6])
			&&(i_addr[5:0] == o_addr[5:0] + 6'h1);

	initial	pending = 1'b0;
	initial	o_readreq = 1'b0;
	initial	lcl_wrreq = 1'b0;
	initial	lcl_ctreq = 1'b0;
	initial	o_ctreq   = 1'b0;
	initial	o_idreq   = 1'b0;

	initial	ack = 1'b0;
	always @(posedge i_clk)
		ack <= (i_ack)||(lcl_ack);

	// wire	[9:0]	key;
	// assign	key = 10'h1be;
	reg	lcl_key, set_sector, ctreg_stb;
	initial	lcl_key = 1'b0;
	always @(posedge i_clk)
		// Write protect "key" to enable the disabling of write protect
		lcl_key<= (i_ctrl_stb)&&(~wp)&&(i_we)&&(i_addr[5:0]==6'h00)
				&&(i_data[9:0] == 10'h1be)&&(i_data[31:30]==2'b11);
	initial	set_sector = 1'b0;
	always @(posedge i_clk)
		set_sector <= (i_ctrl_stb)&&(~o_wb_stall)
				&&(i_we)&&(i_addr[5:0]==6'h00)
				&&(i_data[9:0] == 10'h1be);

	always @(posedge i_clk)
		if (i_ctrl_stb)
			lcl_reg <= (i_addr[3:0] == 4'h00);

	initial	ctreg_stb = 1'b0;
	initial	o_wb_stall = 1'b0;
	always @(posedge i_clk)
	begin // Inputs: rst, stb, stb, stall, ack, addr[4:0] -- 9
		if (i_rst)
			o_wb_stall <= 1'b0;
		else
			o_wb_stall <= (((i_data_stb)||(i_ctrl_stb))&&(~o_wb_stall))
				||((pending)&&(~ack));

		ctreg_stb <= (i_ctrl_stb)&&(~o_wb_stall)&&(i_addr[4:0]==5'h00)&&(~pending)
				||(pending)&&(ctreg_stb)&&(~lcl_ack)&&(~i_ack);
		if (~o_wb_stall)
		begin // Bus command accepted!
			if (i_data_stb)
				next_addr <= i_addr + 22'h1;
			if ((i_data_stb)||(i_ctrl_stb))
			begin
				pending <= 1'b1;
				o_addr <= i_addr;
				o_data <= i_data;
				o_wr   <= i_we;
			end

			if ((i_data_stb)&&(~i_we))
				o_readreq <= 1'b1;

			if ((i_data_stb)&&(i_we))
				lcl_wrreq <= 1'b1;
			if ((i_ctrl_stb)&&(~i_addr[4]))
			begin
				casez(i_addr[4:0])
				5'h0: lcl_ctreq<= 1'b1;
				5'h1: lcl_ctreq <= 1'b1;
				5'h2: lcl_ctreq <= 1'b1;
				5'h3: lcl_ctreq <= 1'b1;
				5'h4: lcl_ctreq <= 1'b1;
				5'h5: lcl_ctreq <= 1'b1;
				5'h6: lcl_ctreq <= 1'b1;
				5'h7: lcl_ctreq <= 1'b1;
				5'h8: o_idreq  <= 1'b1;	// ID[0]
				5'h9: o_idreq  <= 1'b1;	// ID[1]
				5'ha: o_idreq  <= 1'b1;	// ID[2]
				5'hb: o_idreq  <= 1'b1;	// ID[3]
				5'hc: o_idreq  <= 1'b1;	// ID[4]
				5'hd: lcl_ctreq <= 1'b1;	//
				5'he: lcl_ctreq <= 1'b1;
				5'hf: o_idreq   <= 1'b1; // Program OTP register
				default: begin o_idreq <= 1'b1; end
				endcase
			end else if (i_ctrl_stb)
				o_idreq <= 1'b1;
		end else if (ack)
		begin
			pending <= 1'b0;
			o_readreq <= 1'b0;
			o_idreq <= 1'b0;
			lcl_ctreq <= 1'b0;
			lcl_wrreq <= 1'b0;
		end

		if(i_rst)
		begin
			pending <= 1'b0;
			o_readreq <= 1'b0;
			o_idreq <= 1'b0;
			lcl_ctreq <= 1'b0;
			lcl_wrreq <= 1'b0;
		end

		if ((i_data_stb)&&((~o_wb_stall)||(i_ack)))
			o_piperd <= ((~i_we)&&(pipeable)&&(i_addr == next_addr));
		else if ((i_ack)&&(~i_data_stb))
			o_piperd <= 1'b0;
		if ((i_data_stb)&&(~o_wb_stall))
			pipeable <= (~i_we);
		else if ((i_ctrl_stb)&&(~o_wb_stall))
			pipeable <= 1'b0;

		o_pipewr <= (same_page)||(pending)&&(o_pipewr);
	end

	reg	r_other, last_wip;

	reg	last_pending;
	always @(posedge i_clk)
		last_pending <= pending;
	always @(posedge i_clk)
		last_wip <= i_wip;
	wire	new_req;
	assign	new_req = (pending)&&(~last_pending);

	initial	esector   = 13'h00;
	initial	o_wrreq   = 1'b0;
	initial	o_erreq   = 1'b0;
	initial	wp_err    = 1'b0;
	initial	lcl_ack   = 1'b0;
	initial	r_other   = 1'b0;
	initial	o_endwr   = 1'b1;
	initial	wp        = 1'b1;
	always @(posedge i_clk)
	begin
		if (i_ack)
		begin
			o_erreq <= 1'b0;
			o_wrreq <= 1'b0;
			o_ctreq <= 1'b0;
			r_other <= 1'b0;
		end

		if ((last_wip)&&(~i_wip))
			wp <= 1'b1;

		// o_endwr  <= ((~i_cyc)||(~o_wr)||(o_pipewr))
				// ||(~new_req)&&(o_endwr);
		o_endwr <= ((pending)&&(~o_pipewr))||((~pending)&&(~i_cyc));

		// Default ACK is always set to zero, unless the following ...
		o_wb_ack <= 1'b0;

		if (set_sector)
		begin
			esector[11:0] <= { o_data[21:14], 4'h0 };
			wp <= (o_data[30])&&(new_req)||(wp)&&(~new_req);
			esector[12] <= o_data[28]; // Subsector
			if (o_data[28])
			begin
				esector[3:0] <= o_data[13:10];
			end
		end

		lcl_ack <= 1'b0;
		if ((i_wip)&&(new_req)&&(~same_page))
		begin
			o_wb_ack <= 1'b1;
			lcl_ack <= 1'b1;
		end else if ((ctreg_stb)&&(new_req))
		begin // A request of the status register
			// Always ack control register, even on failed attempts
			// to erase.
			o_wb_ack <= 1'b1;
			lcl_ack <= 1'b1;

			if (lcl_key)
			begin
				o_ctreq <= 1'b0;
				o_erreq <= 1'b1;
				r_other <= 1'b1;
				lcl_ack <= 1'b0;
			end else if ((o_wr)&&(~o_data[31]))
			begin // WEL or WEL disable
				o_ctreq <= (wp == o_data[30]);
				r_other <= (wp == o_data[30]);
				lcl_ack <= (wp != o_data[30]);
				wp <= !o_data[30];
			end else if (~o_wr)
				lcl_ack <= 1'b1;
			wp_err <= (o_data[31])&&(~lcl_key);
		end else if ((lcl_ctreq)&&(new_req))
		begin
			o_ctreq <= 1'b1;
			r_other <= 1'b1;
		end else if ((lcl_wrreq)&&(new_req))
		begin
			if (~wp)
			begin
				o_wrreq <= 1'b1;
				r_other <= 1'b1;
				o_endwr  <= 1'b0;
				lcl_ack <= 1'b0;
			end else begin
				o_wb_ack <= 1'b1;
				wp_err <= 1'b1;
				lcl_ack <= 1'b1;
			end
		end

		if (i_rst)
		begin
			o_ctreq <= 1'b0;
			o_erreq <= 1'b0;
			o_wrreq <= 1'b0;
			r_other <= 1'b0;
		end

	end


	assign o_wb_data[31:0] = { i_wip, ~wp, i_quad, esector[12],
			i_idloaded, wp_err, i_xip, i_spi_stopped,
			2'b00, esector[11:0], 10'h00 };
	assign	o_sector = { 2'b00, esector[11:0], 8'h00 }; // 22 bits
	assign	o_other = (r_other)||(o_idreq);

endmodule


`define	RD_IDLE			4'h0
`define	RD_IDLE_GET_PORT	4'h1
`define	RD_SLOW_DUMMY		4'h2
`define	RD_SLOW_READ_DATA	4'h3
`define	RD_QUAD_READ_DATA	4'h4
`define	RD_QUAD_DUMMY		4'h5
`define	RD_QUAD_ADDRESS		4'h6
`define	RD_XIP			4'h7
`define	RD_GO_TO_IDLE		4'h8
`define	RD_GO_TO_XIP		4'h9
`define RD_IDLE_QUAD_PORT	4'ha

module	readqspi(i_clk, i_readreq, i_piperd, i_other_req, i_addr, o_bus_ack,
		o_qspi_req, i_grant,
			o_spi_wr, o_spi_hold, o_spi_word, o_spi_len,
				o_spi_spd, o_spi_dir, o_spi_recycle,
			i_spi_data, i_spi_valid, i_spi_busy, i_spi_stopped,
			o_data_ack, o_data, i_quad, i_xip, o_leave_xip);
	input			i_clk;
	input			i_readreq, i_piperd, i_other_req;
	input		[21:0]	i_addr;
	output	reg		o_bus_ack, o_qspi_req;
	input	wire		i_grant;
	output	reg		o_spi_wr;
	output	wire		o_spi_hold;
	output	reg	[31:0]	o_spi_word;
	output	reg	[1:0]	o_spi_len;
	output	reg		o_spi_spd, o_spi_dir, o_spi_recycle;
	input		[31:0]	i_spi_data;
	input			i_spi_valid, i_spi_busy, i_spi_stopped;
	output	reg		o_data_ack;
	output	reg	[31:0]	o_data;
	input			i_quad, i_xip;
	output	wire		o_leave_xip;

	reg	accepted;
	initial	accepted = 1'b0;
	always @(posedge i_clk)
		accepted <= (~i_spi_busy)&&(i_grant)&&(o_spi_wr)&&(~accepted);

	reg	[3:0]	rd_state;
	reg		r_leave_xip, r_xip, r_quad, r_requested;
	reg	[3:0]	invalid_ack_pipe;
	initial	rd_state = `RD_IDLE;
	initial o_data_ack = 1'b0;
	initial o_bus_ack  = 1'b0;
	initial o_qspi_req = 1'b0;
	always @(posedge i_clk)
	begin
		o_data_ack <= 1'b0;
		o_bus_ack <= 1'b0;
		o_spi_recycle <= 1'b0;
		if (i_spi_valid)
			o_data <= i_spi_data;
		invalid_ack_pipe <= { invalid_ack_pipe[2:0], accepted };
		case(rd_state)
		`RD_IDLE: begin
			r_requested <= 1'b0;
			o_qspi_req <= 1'b0;
			// 0x0b is a fast read, uses all SPI protocol
			// 0x6b is a Quad output fast read, uses SPI cmd,
			//			SPI address, QSPI data
			// 0xeb is a Quad I/O fast read, using SPI cmd,
			//			QSPI address and data
			o_spi_word <= { ((i_quad)? 8'hEB: 8'h0b), i_addr, 2'b00 };
			o_spi_wr <= 1'b0;
			o_spi_dir <= 1'b0;
			o_spi_spd <= 1'b0;
			o_spi_len <= (i_quad)? 2'b00 : 2'b11;
			r_xip <= (i_xip)&&(i_quad);
			r_leave_xip <= 1'b0; // Not in it, so can't leave it
			r_quad <= i_quad;
			if (i_readreq)
			begin
				rd_state <= `RD_IDLE_GET_PORT;
				o_bus_ack <= 1'b1;
			end end
		`RD_IDLE_GET_PORT: begin
			o_spi_wr <= 1'b1; // Write the address
			o_qspi_req <= 1'b1;
			if (accepted)
			begin
				rd_state <= (r_quad) ? `RD_IDLE_QUAD_PORT : `RD_SLOW_DUMMY;
				o_spi_word[31:8] <= o_spi_word[23:0];
			end end
		`RD_IDLE_QUAD_PORT: begin
			o_spi_wr <= 1'b1; // Write the command
			o_qspi_req <= 1'b1;
			o_spi_spd <= 1'b1;
			o_spi_dir <= 1'b0;
			o_spi_len <= 2'b10;

			// We haven't saved our address any where but in the
			// SPI word we just sent.  Hence, let's just
			// grab it from there.
			if (accepted)
				rd_state <= `RD_SLOW_DUMMY;
			end
		`RD_SLOW_DUMMY: begin
			o_spi_wr <= 1'b1; // Write 8 dummy clocks--this is the same for
			o_qspi_req <= 1'b1; // both Quad I/O, Quad O, and fast-read commands
			o_spi_dir <= 1'b0;
			o_spi_spd <= r_quad;
			o_spi_word[31:0] <= (r_xip) ? 32'h00 : 32'hffffffff;
			o_spi_len  <= (r_quad)? 2'b11:2'b00; // 8 clocks
			if (accepted)
				rd_state <= (r_quad)?`RD_QUAD_READ_DATA
						: `RD_SLOW_READ_DATA;
			end
		`RD_SLOW_READ_DATA: begin
			o_qspi_req <= 1'b1;
			o_spi_dir <= 1'b1;
			o_spi_spd <= 1'b0;
			o_spi_len <= 2'b11;
			o_spi_wr <= (~r_requested)||(i_piperd);
			invalid_ack_pipe[0] <= (!r_requested);
			o_data_ack <=  (!invalid_ack_pipe[3])&&(i_spi_valid)&&(r_requested);
			o_bus_ack <=   (r_requested)&&(accepted)&&(i_piperd);
			r_requested <= (r_requested)||(accepted);
			if ((i_spi_valid)&&(~o_spi_wr))
				rd_state <= `RD_GO_TO_IDLE;
			end
		`RD_QUAD_READ_DATA: begin
			o_qspi_req <= 1'b1; // Insist that we keep the port
			o_spi_dir <= 1'b1;  // Read
			o_spi_spd <= 1'b1;  // Read at Quad rates
			o_spi_len <= 2'b11; // Read 4-bytes
			o_spi_recycle <= (r_leave_xip)? 1'b1: 1'b0;
			invalid_ack_pipe[0] <= (!r_requested);
			r_requested <= (r_requested)||(accepted); // Make sure at least one request goes through
			o_data_ack <=  (!invalid_ack_pipe[3])&&(i_spi_valid)&&(r_requested)&&(~r_leave_xip);
			o_bus_ack  <= (r_requested)&&(accepted)&&(i_piperd)&&(~r_leave_xip);
			o_spi_wr <= (~r_requested)||(i_piperd);
			// if (accepted)
				// o_spi_wr <= (i_piperd);
			if (accepted) // only happens if (o_spi_wr)
				o_data <= i_spi_data;
			if ((i_spi_valid)&&(~o_spi_wr))
				rd_state <= ((r_leave_xip)||(~r_xip))?`RD_GO_TO_IDLE:`RD_GO_TO_XIP;
			end
		`RD_QUAD_ADDRESS: begin
			o_qspi_req <= 1'b1;
			o_spi_wr <= 1'b1;
			o_spi_dir <= 1'b0; // Write the address
			o_spi_spd <= 1'b1; // High speed
			o_spi_word[31:0] <= { i_addr, 2'b00, 8'h00 };
			o_spi_len  <= 2'b10; // 24 bits, High speed, 6 clocks
			if (accepted)
				rd_state <= `RD_QUAD_DUMMY;
			end
		`RD_QUAD_DUMMY: begin
			o_qspi_req <= 1'b1;
			o_spi_wr <= 1'b1;
			o_spi_dir <= 1'b0; // Write the dummy
			o_spi_spd <= 1'b1; // High speed
			o_spi_word[31:0] <= (r_xip)? 32'h00 : 32'hffffffff;
			o_spi_len  <= 2'b11; // 8 clocks = 32-bits, quad speed
			if (accepted)
				rd_state <= (r_quad)?`RD_QUAD_READ_DATA
						: `RD_SLOW_READ_DATA;
			end
		`RD_XIP: begin
			r_requested <= 1'b0;
			o_qspi_req <= 1'b1;
			o_spi_word <= { i_addr, 2'b00, 8'h00 };
			o_spi_wr <= 1'b0;
			o_spi_dir <= 1'b0; // Write to SPI
			o_spi_spd <= 1'b1; // High speed
			o_spi_len <= 2'b11;
			r_leave_xip <= i_other_req;
			r_xip <= (~i_other_req);
			o_bus_ack <= 1'b0;
			if ((i_readreq)||(i_other_req))
			begin
				rd_state <= `RD_QUAD_ADDRESS;
				o_bus_ack <= i_readreq;
			end end
		`RD_GO_TO_IDLE: begin
			if ((!invalid_ack_pipe[3])&&(i_spi_valid)&&(~r_leave_xip))
				o_data_ack <=  1'b1;
			o_spi_wr   <= 1'b0;
			o_qspi_req <= 1'b0;
			if ((i_spi_stopped)&&(~i_grant))
				rd_state <= `RD_IDLE;
			end
		`RD_GO_TO_XIP: begin
			r_requested <= 1'b0;
			if ((i_spi_valid)&&(!invalid_ack_pipe[3]))
				o_data_ack <=  1'b1;
			o_qspi_req <= 1'b1;
			o_spi_wr   <= 1'b0;
			if (i_spi_stopped)
				rd_state <= `RD_XIP;
			end
		default: begin
			// rd_state <= (i_grant)?`RD_BREAK;
			o_qspi_req <= 1'b0;
			o_spi_wr <= 1'b0;
			if ((i_spi_stopped)&&(~i_grant))
				rd_state <= `RD_IDLE;
			end
		endcase
	end

	assign	o_spi_hold = 1'b0;
	assign	o_leave_xip = r_leave_xip;

endmodule

module	writeqspi(i_clk, i_wreq, i_ereq, i_pipewr, i_endpipe, i_addr, i_data,
			o_bus_ack, o_qspi_req, i_qspi_grant,
				o_spi_wr, o_spi_hold, o_spi_word, o_spi_len,
				o_spi_spd, o_spi_dir, i_spi_data, i_spi_valid,
					i_spi_busy, i_spi_stopped,
				o_data_ack, i_quad, o_wip);
	input		i_clk;
	//
	input		i_wreq, i_ereq, i_pipewr, i_endpipe;
	input		[21:0]	i_addr;
	input		[31:0]	i_data;
	output	reg		o_bus_ack, o_qspi_req;
	input			i_qspi_grant;
	output	reg		o_spi_wr, o_spi_hold;
	output	reg	[31:0]	o_spi_word;
	output	reg	[1:0]	o_spi_len;
	output	reg		o_spi_spd, o_spi_dir;
	input		[31:0]	i_spi_data;
	input			i_spi_valid;
	input			i_spi_busy, i_spi_stopped;
	output	reg		o_data_ack;
	input			i_quad;
	output	reg		o_wip;

`ifdef	QSPI_READ_ONLY
	always @(posedge i_clk)
		o_data_ack <= (i_wreq)||(i_ereq);
	always @(posedge i_clk)
		o_bus_ack <= (i_wreq)||(i_ereq);

	always @(posedge i_clk)
	begin
		o_qspi_req <= 1'b0;
		o_spi_wr   <= 1'b0;
		o_spi_hold <= 1'b0;
		o_spi_dir  <= 1'b1; // Read
		o_spi_spd  <= i_quad;
		o_spi_len  <= 2'b00;
		o_spi_word <= 32'h00;
		o_wip <= 1'b0;
	end
`else

`define	WR_IDLE				4'h0
`define	WR_START_WRITE			4'h1
`define	WR_START_QWRITE			4'h2
`define	WR_PROGRAM			4'h3
`define	WR_PROGRAM_GETNEXT		4'h4
`define	WR_START_ERASE			4'h5
`define	WR_WAIT_ON_STOP			4'h6
`define	WR_REQUEST_STATUS		4'h7
`define	WR_REQUEST_STATUS_NEXT		4'h8
`define	WR_READ_STATUS			4'h9
`define	WR_WAIT_ON_FINAL_STOP		4'ha

	reg	accepted;
	initial	accepted = 1'b0;
	always @(posedge i_clk)
		accepted <= (~i_spi_busy)&&(i_qspi_grant)&&(o_spi_wr)&&(~accepted);


	reg		cyc, chk_wip, valid_status;
	reg	[3:0]	wr_state;
	initial	wr_state = `WR_IDLE;
	initial	cyc = 1'b0;
	always @(posedge i_clk)
	begin
		chk_wip <= 1'b0;
		o_bus_ack  <= 1'b0;
		o_data_ack <= 1'b0;
		case(wr_state)
		`WR_IDLE: begin
			valid_status <= 1'b0;
			o_qspi_req <= 1'b0;
			cyc <= 1'b0;
			if (i_ereq)
				wr_state <= `WR_START_ERASE;
			else if (i_wreq)
				wr_state <= (i_quad)?`WR_START_QWRITE
					: `WR_START_WRITE;
			end
		`WR_START_WRITE: begin
			o_wip      <= 1'b1;
			o_qspi_req <= 1'b1;
			o_spi_wr   <= 1'b1;
			o_spi_dir  <= 1'b0;
			o_spi_len  <= 2'b11;
			o_spi_spd  <= 1'b0;
			o_spi_hold <= 1'b1;
			o_spi_word <= { 8'h02, i_addr, 2'b00 };
			cyc <= 1'b1;
			if (accepted)
			begin
				o_bus_ack  <= 1'b1;
				o_data_ack <= 1'b1;
				wr_state <= `WR_PROGRAM;
				o_spi_word <= i_data;
			end end
		`WR_START_QWRITE: begin
			o_wip      <= 1'b1;
			o_qspi_req <= 1'b1;
			o_spi_wr   <= 1'b1;
			o_spi_dir  <= 1'b0;
			o_spi_len  <= 2'b11;
			o_spi_spd  <= 1'b0;
			o_spi_hold <= 1'b1;
			o_spi_word <= { 8'h32, i_addr, 2'b00 };
			cyc <= 1'b1;
			if (accepted)
			begin
				o_bus_ack  <= 1'b1;
				o_data_ack <= 1'b1;
				wr_state <= `WR_PROGRAM;
				o_spi_word <= i_data;
			end end
		`WR_PROGRAM: begin
			o_wip     <= 1'b1;
			o_qspi_req <= 1'b1;
			o_spi_wr   <= 1'b1;
			o_spi_dir  <= 1'b0;
			o_spi_len  <= 2'b11;
			o_spi_spd  <= i_quad;
			o_spi_hold <= 1'b1;
			// o_spi_word <= i_data;
			if (accepted)
				wr_state <= `WR_PROGRAM_GETNEXT;
			end
		`WR_PROGRAM_GETNEXT: begin
			o_wip      <= 1'b1;
			o_qspi_req <= 1'b1;
			o_spi_wr   <= 1'b0;
			o_spi_dir  <= 1'b0;
			o_spi_len  <= 2'b11;
			o_spi_spd  <= i_quad;
			o_spi_hold <= 1'b1;
			o_spi_word <= i_data;
			cyc <= (cyc)&&(~i_endpipe);
			if (~cyc)
				wr_state <= `WR_WAIT_ON_STOP;
			else if (i_pipewr)
			begin
				o_bus_ack  <= 1'b1;
				o_data_ack <= 1'b1;
				wr_state <= `WR_PROGRAM;
			end end
		`WR_START_ERASE: begin
			o_wip <= 1'b1;
			o_qspi_req <= 1'b1;
			o_spi_wr  <= 1'b1;
			o_spi_dir <= 1'b0;
			o_spi_spd <= 1'b0;
			o_spi_len <= 2'b11;
			if (i_data[28])
				// Subsector erase
				o_spi_word[31:24] <= 8'h20;
			else
				// Sector erase
				o_spi_word[31:24] <= 8'hd8;
			o_spi_word[23:0] <= { i_data[21:10], 12'h0 };
			// Data has already been ack'd, so no need to ack
			// it again.  However, we can now free the QSPI
			// bus processor to accept another command from the
			// bus.
			o_bus_ack <= accepted;
			if (accepted)
				wr_state <= `WR_WAIT_ON_STOP;
			end
		`WR_WAIT_ON_STOP: begin
			o_wip <= 1'b1;
			o_qspi_req <= 1'b0;
			o_spi_wr   <= 1'b0;
			o_spi_hold <= 1'b0;
			if (i_spi_stopped)
				wr_state <= `WR_REQUEST_STATUS;
			end
		`WR_REQUEST_STATUS: begin
			o_wip <= 1'b1;
			o_qspi_req <= 1'b1;
			o_spi_hold <= 1'b0;
			o_spi_wr   <= 1'b1;
			o_spi_spd  <= 1'b0; // Slow speed
			o_spi_len  <= 2'b00; // 8 bytes
			o_spi_dir  <= 1'b0; // Write
			o_spi_word <= { 8'h05, 24'h00 };
			if (accepted)
				wr_state <= `WR_REQUEST_STATUS_NEXT;
			end
		`WR_REQUEST_STATUS_NEXT: begin
			o_wip <= 1'b1;
			o_qspi_req <= 1'b1;
			o_spi_hold <= 1'b0;
			o_spi_wr   <= 1'b1;
			o_spi_spd  <= 1'b0; // Slow speed
			o_spi_len  <= 2'b00; // 8 bytes
			o_spi_dir  <= 1'b1; // Read
			o_spi_word <= 32'h00;
			if (accepted)
				wr_state <= `WR_READ_STATUS;
			valid_status <= 1'b0;
			end
		`WR_READ_STATUS: begin
			o_wip <= 1'b1;
			o_qspi_req <= 1'b1;
			o_spi_hold <= 1'b0;
			o_spi_wr   <= 1'b1;
			o_spi_spd  <= 1'b0; // Slow speed
			o_spi_len  <= 2'b00; // 8 bytes
			o_spi_dir  <= 1'b1; // Read
			o_spi_word <= 32'h00;
			if (i_spi_valid)
				valid_status <= 1'b1;
			if ((i_spi_valid)&&(valid_status))
				chk_wip <= 1'b1;
			if ((chk_wip)&&(~i_spi_data[0]))
				wr_state <= `WR_WAIT_ON_FINAL_STOP;
			end
		// `WR_WAIT_ON_FINAL_STOP: // Same as the default
		default: begin
			o_qspi_req <= 1'b0;
			o_spi_wr <= 1'b0;
			o_wip <= 1'b0;
			if (i_spi_stopped)
				wr_state <= `WR_IDLE;
			end
		endcase
	end
`endif

endmodule


`define	CT_SAFE
`define	CT_IDLE			3'h0
`define	CT_NEXT			3'h1
`define	CT_GRANTED		3'h2
`define	CT_DATA			3'h3
`define	CT_READ_DATA		3'h4
`define	CT_WAIT_FOR_IDLE	3'h5

// CTRL commands:
//	WEL (write-enable latch)
//	Read Status
module	ctrlspi(i_clk, i_req, i_wr, i_addr, i_data, i_sector_address,
				o_spi_req, i_grant,
				o_spi_wr, o_spi_hold, o_spi_word, o_spi_len,
					o_spi_spd, o_spi_dir,
				i_spi_data, i_spi_valid, i_spi_busy,
					i_spi_stopped,
				o_bus_ack, o_data_ack, o_data,
				i_leave_xip, o_xip, o_quad);
	input		i_clk;
	// From the WB bus controller
	input			i_req;
	input			i_wr;
	input		[3:0]	i_addr;
	input		[31:0]	i_data;
	input		[21:0]	i_sector_address;
	// To/from the arbiter
	output	reg		o_spi_req;
	input			i_grant;
	// To/from the low-level SPI driver
	output	reg		o_spi_wr;
	output	wire		o_spi_hold;
	output	reg	[31:0]	o_spi_word;
	output	reg	[1:0]	o_spi_len;
	output	wire		o_spi_spd;
	output	reg		o_spi_dir;
	input		[31:0]	i_spi_data;
	input			i_spi_valid;
	input			i_spi_busy, i_spi_stopped;
	// Return data to the bus controller, and the wishbone bus
	output	reg		o_bus_ack, o_data_ack;
	output	reg	[31:0]	o_data;
	// Configuration items that we may have configured.
	input	wire		i_leave_xip;
	output	reg		o_xip;
	output	wire		o_quad;

	// Command registers
	reg	[1:0]	ctcmd_len;
	reg	[31:0]	ctcmd_word;
	// Data stage registers
	reg		ctdat_skip, // Skip the data phase?
			ctdat_wr;	// Write during data? (or not read)
	wire	[1:0]	ctdat_len;
	reg	[31:0]	ctdat_word;

	reg	[2:0]	ctstate;
	reg		accepted;
	reg	[3:0]	invalid_ack_pipe;


	initial	accepted = 1'b0;
	always @(posedge i_clk)
		accepted <= (~i_spi_busy)&&(i_grant)&&(o_spi_wr)&&(~accepted);

	reg	r_ctdat_len, ctbus_ack, first_valid;
	assign	ctdat_len = { 1'b0, r_ctdat_len };

	// First step, calculate the values for our state machine
	initial	o_xip = 1'b0;
	// initial o_quad = 1'b0;
	always @(posedge i_clk)
	if (i_req) // A request for us to act from the bus controller
	begin
		ctdat_skip <= 1'b0;
		ctbus_ack  <= 1'b1;
		ctcmd_word[23:0] <= { i_sector_address, 2'b00 };
		ctdat_word <= { i_data[7:0], 24'h00 };
		ctcmd_len <= 2'b00; // 8bit command (for all but Lock regs)
		r_ctdat_len <= 1'b0; // 8bit data (read or write)
		ctdat_wr <= i_wr;
		casez({ i_addr[3:0], i_wr, i_data[30] })
		6'b000010: begin // Write Disable
			ctcmd_word[31:24] <= 8'h04;
			ctdat_skip <= 1'b1;
			ctbus_ack  <= 1'b0;
			end
		6'b000011: begin // Write enable
			ctcmd_word[31:24] <= 8'h06;
			ctdat_skip <= 1'b1;
			ctbus_ack  <= 1'b0;
			end
		// 4'b0010?: begin // Read Status register
		//	Moved to defaults section
		6'b00011?: begin // Write Status register (Requires WEL)
			ctcmd_word[31:24] <= 8'h01;
`ifdef	CT_SAFE
			ctdat_word <= { 6'h00, i_data[1:0], 24'h00 };
`else
			ctdat_word <= { i_data[7:0], 24'h00 };
`endif
			end
		6'b00100?: begin // Read NV-Config register (two bytes)
			ctcmd_word[31:24] <= 8'hB5;
			r_ctdat_len <= 1'b1; // 16-bit data
			end
		6'b00101?: begin // Write NV-Config reg (2 bytes, Requires WEL)
			ctcmd_word[31:24] <= 8'hB1;
			r_ctdat_len <= 1'b1; // 16-bit data
`ifdef	CT_SAFE
			ctdat_word <= { 4'h8, 3'h7, 3'h7, i_data[5:1], 1'b1, 16'h00 };
`else
			ctdat_word <= { i_data[15:0], 16'h00 };
`endif
			end
		6'b00110?: begin // Read V-Config register
			ctcmd_word[31:24] <= 8'h85;
			end
		6'b00111?: begin // Write V-Config register (Requires WEL)
			ctcmd_word[31:24] <= 8'h81;
			r_ctdat_len <= 1'b0; // 8-bit data
`ifdef	CT_SAFE
			ctdat_word <= { 4'h8, i_data[3:2], 2'b11, 24'h00 };
`else
			ctdat_word <= { i_data[7:0], 24'h00 };
`endif
			o_xip <= ~i_data[3];
			end
		6'b01000?: begin // Read EV-Config register
			ctcmd_word[31:24] <= 8'h65;
			end
		6'b01001?: begin // Write EV-Config register (Requires WEL)
			ctcmd_word[31:24] <= 8'h61;
			// o_quad <= (~i_data[7]);
`ifdef	CT_SAFE
			ctdat_word <= { 1'b1, 3'h5, 4'hf, 24'h00 };
`else
			ctdat_word <= { i_data[7:0], 24'h00 };
`endif
			end
		6'b01010?: begin // Read Lock register
			ctcmd_word[31:0] <= { 8'he8,  i_sector_address, 2'b00 };
			ctcmd_len <= 2'b11;
			ctdat_wr  <= 1'b0;  // Read, not write
			end
		6'b01011?: begin // Write Lock register (Requires WEL)
			ctcmd_word[31:0] <= { 8'he5, i_sector_address, 2'b00 };
			ctcmd_len <= 2'b11;
			ctdat_wr  <= 1'b1;  // Write
			end
		6'b01100?: begin // Read Flag Status register
			ctcmd_word[31:24] <= 8'h70;
			ctdat_wr  <= 1'b0;  // Read, not write
			end
		6'b01101?: begin // Write/Clear Flag Status register (No WEL required)
			ctcmd_word[31:24] <= 8'h50;
			ctdat_skip <= 1'b1;
			end
		6'b11011?: begin // RESET_ENABLE (when written to)
			ctcmd_word[31:24] <= 8'h66;
			ctdat_skip <= 1'b1;
			end
		6'b11101?: begin // RESET_MEMORY (when written to)
			ctcmd_word[31:24] <= 8'h99;
			ctdat_skip <= 1'b1;
			end
		default: begin // Default to reading the status register
			ctcmd_word[31:24] <= 8'h05;
			ctdat_wr  <= 1'b0;  // Read, not write
			r_ctdat_len <= 1'b0; // 8-bit data
			end
		endcase
	end else if (i_leave_xip)
		o_xip <= 1'b0;

	assign	o_quad = 1'b1;

	reg	nxt_data_ack;

	// Second step, actually drive the state machine
	initial	ctstate = `CT_IDLE;
	always @(posedge i_clk)
	begin
		o_spi_wr <= 1'b1;
		o_bus_ack <= 1'b0;
		o_data_ack <= 1'b0;
		invalid_ack_pipe <= { invalid_ack_pipe[2:0], accepted };
		if (i_spi_valid)
			o_data <= i_spi_data;
		case(ctstate)
		`CT_IDLE: begin
			o_spi_req <= 1'b0;
			o_spi_wr  <= 1'b0;
			if (i_req) // Need a clock to let the digestion
				ctstate <= `CT_NEXT; // process complete
			end
		`CT_NEXT: begin
			o_spi_wr <= 1'b1;
			o_spi_req <= 1'b1;
			o_spi_word <= ctcmd_word;
			o_spi_len <= ctcmd_len;
			o_spi_dir <= 1'b0; // Write
			if (accepted)
			begin
				ctstate <= (ctdat_skip)?`CT_WAIT_FOR_IDLE:`CT_DATA;
				o_bus_ack <= (ctdat_skip);
				o_data_ack <= (ctdat_skip)&&(ctbus_ack);
			end end
		`CT_GRANTED: begin
			o_spi_wr <= 1'b1;
			if ((accepted)&&(ctdat_skip))
				ctstate <= `CT_WAIT_FOR_IDLE;
			else if (accepted)//&&(~ctdat_skip)
				ctstate <= `CT_DATA;
			end
		`CT_DATA: begin
			o_spi_wr   <= 1'b1;
			o_spi_len  <= ctdat_len;
			o_spi_dir  <= ~ctdat_wr;
			o_spi_word <= ctdat_word;
			if (accepted)
				o_bus_ack <= 1'b1;
			if (accepted)
				ctstate <= (ctdat_wr)?`CT_WAIT_FOR_IDLE:`CT_READ_DATA;
			if ((accepted)&&(ctdat_wr))
				o_data_ack <= 1'b1;
			first_valid <= 1'b0;
			end
		`CT_READ_DATA: begin
			o_spi_wr <= 1'b0; // No more words to go, just to wait
			o_spi_req <= 1'b1;
			invalid_ack_pipe[0] <= 1'b0;
			if ((i_spi_valid)&&(!invalid_ack_pipe[3])) // for a value to read
			begin
				o_data_ack <= 1'b1;
				o_data <= i_spi_data;
				ctstate <= `CT_WAIT_FOR_IDLE;
			end end
		default: begin // `CT_WAIT_FOR_IDLE
			o_spi_wr <= 1'b0;
			o_spi_req <= 1'b0;
			if (i_spi_stopped)
				ctstate <= `CT_IDLE;
			end
		endcase
	end
		
	// All of this is done in straight SPI mode, so our speed will always be zero
	assign	o_spi_hold = 1'b0;
	assign	o_spi_spd  = 1'b0;

endmodule

`define	ID_IDLE				5'h00
`define	ID_WAIT_ON_START_ID		5'h01
`define	ID_WAIT_ON_START_OTP		5'h02
`define	ID_WAIT_ON_START_OTP_WRITE	5'h03
`define	ID_READ_DATA_COMMAND		5'h04
`define	ID_GET_DATA			5'h05
`define	ID_LOADED			5'h06
`define	ID_LOADED_NEXT			5'h07
`define	ID_OTP_SEND_DUMMY		5'h08
`define	ID_OTP_CLEAR			5'h09
`define	ID_OTP_GET_DATA			5'h0a
`define	ID_OTP_WRITE			5'h0b
`define	ID_WAIT_ON_STOP			5'h0c
`define	ID_REQ_STATUS			5'h0d
`define	ID_REQ_STATUS_NEXT		5'h0e
`define	ID_READ_STATUS			5'h0f
//
`define	ID_FINAL_STOP			5'h10

module	idotpqspi(i_clk, i_req, i_wr, i_pipewr, i_addr, i_data, o_bus_ack,
		o_qspi_req, i_qspi_grant,
		o_spi_wr, o_spi_hold, o_spi_word, o_spi_len,
		o_spi_spd, o_spi_dir, i_spi_data, i_spi_valid,
		i_spi_busy, i_spi_stopped, o_data_ack, o_data, o_loaded,
		o_wip);
	input			i_clk;
	input			i_req, i_wr, i_pipewr;
	input		[4:0]	i_addr;
	input		[31:0]	i_data;
	output	reg		o_bus_ack, o_qspi_req;
	input			i_qspi_grant;
	output	reg		o_spi_wr, o_spi_hold;
	output	reg	[31:0]	o_spi_word;
	output	reg	[1:0]	o_spi_len;
	output	wire		o_spi_spd;
	output	reg		o_spi_dir;
	input		[31:0]	i_spi_data;
	input			i_spi_valid, i_spi_busy, i_spi_stopped;
	output	reg		o_data_ack;
	output	reg	[31:0]	o_data;
	output	wire		o_loaded;
	output	reg		o_wip;

	reg	id_loaded;
	initial	id_loaded = 1'b0;
	assign	o_loaded= id_loaded;

/*	
	// Only the ID register will be kept in memory, OTP will be read
	// or written upon request
	always @(posedge i_clk)
		if (i_addr[4])
			o_data <= otpmem[i_addr[3:0]];
		else
			o_data <= idmem[i_addr[2:0]];

	always @(posedge i_clk)
		if ((otp_loaded)&&(i_req)&&(i_addr[4]))
			o_data_ack <= 1'b1;
		else if ((id_loaded)&&(i_req)&&(~i_addr[4]))
			o_data_ack <= idmem[i_addr[2:0]];
		else
			o_data_ack <= 1'b0;
*/

	reg	otp_read_request, id_read_request, accepted, otp_wr_request,
		id_read_device, last_id_read;
	reg	[4:0]	req_addr;
	reg	[2:0]	lcl_id_addr;
	reg	[4:0]	id_state;
	always @(posedge i_clk)
	begin
		otp_read_request <= (i_req)&&(~i_wr)&&((i_addr[4])||(i_addr[3:0]==4'hf));
		last_id_read     <= (i_req)&&(~i_addr[4])&&(i_addr[3:0]!=4'hf);
		id_read_request  <= (i_req)&&(~i_addr[4])&&(i_addr[3:0]!=4'hf)&&(~last_id_read);
		id_read_device   <= (i_req)&&(~i_addr[4])&&(i_addr[3:0]!=4'hf)&&(~id_loaded);
		accepted <= (~i_spi_busy)&&(i_qspi_grant)&&(o_spi_wr)&&(~accepted);

		otp_wr_request <= (i_req)&&(i_wr)&&((i_addr[4])||(i_addr[3:0]==4'hf));

		if (id_state == `ID_IDLE)
			req_addr <= (i_addr[4:0]==5'h0f) ? 5'h10
				: { 1'b0, i_addr[3:0] };
	end

	reg	last_addr;
	always @(posedge i_clk)
		last_addr <= (lcl_id_addr >= 3'h4);

	reg	[31:0]	idmem[0:5];
	reg	[31:0]	r_data;

	// Now, quickly, let's deal with the fact that the data from the
	// bus comes one clock later ...
	reg	nxt_data_ack, nxt_data_spi;
	reg	[31:0]	nxt_data;

	reg	set_val, chk_wip, first_valid;
	reg	[2:0]	set_addr;
	reg	[3:0]	invalid_ack_pipe;

	always @(posedge i_clk)
	begin // Depends upon state[4], otp_rd, otp_wr, otp_pipe, id_req, accepted, last_addr
		o_bus_ack <= 1'b0;
		// o_data_ack <= 1'b0;
		o_spi_hold <= 1'b0;
		nxt_data_ack <= 1'b0;
		nxt_data_spi <= 1'b0;
		chk_wip      <= 1'b0;
		set_val <= 1'b0;
		invalid_ack_pipe <= { invalid_ack_pipe[2:0], accepted };
		if ((id_loaded)&&(id_read_request))
		begin
			nxt_data_ack <= 1'b1;
			o_bus_ack  <= 1'b1;
		end
		nxt_data <= idmem[i_addr[2:0]];
		o_spi_wr <= 1'b0; // By default, we send nothing
		case(id_state)
		`ID_IDLE: begin
			o_qspi_req <= 1'b0;
			o_spi_dir <= 1'b0; // Write to SPI
			lcl_id_addr <= 3'h0;
			o_spi_word[23:7] <= 17'h00;
			o_spi_word[6:0] <= { req_addr[4:0], 2'b00 };
			r_data <= i_data;
			o_wip <= 1'b0;
			first_valid <= 1'b0;
			if (otp_read_request)
			begin
				// o_spi_word <= { 8'h48, 8'h00, 8'h00, 8'h00 };
				id_state <= `ID_WAIT_ON_START_OTP;
				o_bus_ack <= 1'b1;
			end else if (otp_wr_request)
			begin
				o_bus_ack <= 1'b1;
				// o_data_ack <= 1'b1;
				nxt_data_ack <= 1'b1;
				id_state <= `ID_WAIT_ON_START_OTP_WRITE;
			end else if (id_read_device)
			begin
				id_state <= `ID_WAIT_ON_START_ID;
				o_bus_ack <= 1'b0;
				o_spi_word[31:24] <= 8'h9f;
			end end
		`ID_WAIT_ON_START_ID: begin
			o_spi_wr <= 1'b1;
			o_qspi_req <= 1'b1;
			o_spi_len <= 2'b0; // 8 bits
			if (accepted)
				id_state <= `ID_READ_DATA_COMMAND;
			end
		`ID_WAIT_ON_START_OTP: begin
			o_spi_wr <= 1'b1;
			o_spi_word[31:24] <= 8'h4B;
			o_qspi_req <= 1'b1;
			o_spi_len <= 2'b11; // 32 bits
			o_spi_word[6:0] <= { req_addr[4:0], 2'b00 };
			if (accepted) // Read OTP command was just sent
				id_state <= `ID_OTP_SEND_DUMMY;
			end
		`ID_WAIT_ON_START_OTP_WRITE: begin
			o_spi_wr <= 1'b1;
			o_qspi_req <= 1'b1;
			o_wip <= 1'b1;
			o_spi_len <= 2'b11; // 32 bits
			o_spi_word[31:24] <= 8'h42;
			if (accepted) // Read OTP command was just sent
				id_state <= `ID_OTP_WRITE;
			end
		`ID_READ_DATA_COMMAND: begin
			o_spi_len <= 2'b11; // 32-bits
			o_spi_wr <= 1'b1; // Still transmitting
			o_spi_dir <= 1'b1; // Read from SPI
			o_qspi_req <= 1'b1;
			if (accepted)
				id_state <= `ID_GET_DATA;
			first_valid <= 1'b0;
			end
		`ID_GET_DATA: begin
			o_spi_len <= 2'b11; // 32-bits
			o_spi_wr <= (~last_addr); // Still transmitting
			o_spi_dir <= 1'b1; // Read from SPI
			o_qspi_req <= 1'b1;
			invalid_ack_pipe[0] <= 1'b0;
			if((i_spi_valid)&&(!invalid_ack_pipe[3]))
			begin
				set_val <= 1'b1;
				set_addr <= lcl_id_addr[2:0];
				// idmem[lcl_id_addr[2:0]] <= i_spi_data;
				lcl_id_addr <= lcl_id_addr + 3'h1;
				if (last_addr)
					id_state <= `ID_LOADED;
			end end
		`ID_LOADED: begin
			id_loaded <= 1'b1;
			o_bus_ack  <= 1'b1;
			o_spi_wr   <= 1'b0;
			nxt_data_ack <= 1'b1;
			id_state   <= `ID_LOADED_NEXT;
			end
		`ID_LOADED_NEXT: begin
			o_spi_len <= 2'b11; // 32-bits
			o_bus_ack  <= 1'b0;
			o_spi_wr   <= 1'b0;
			nxt_data_ack <= 1'b1;
			id_state   <= `ID_IDLE;
			end
		`ID_OTP_SEND_DUMMY: begin
			o_spi_len <= 2'b00; // 1 byte
			o_spi_wr  <= 1'b1; // Still writing
			o_spi_dir <= 1'b0; // Write to SPI
			if (accepted) // Wait for the command to be accepted
				id_state <= `ID_OTP_CLEAR;
			end
		`ID_OTP_CLEAR: begin
			o_spi_wr  <= 1'b1; // Still writing
			o_spi_dir <= 1'b1; // Read from SPI
			o_spi_len <= 2'b11; // Read 32 bits
			if (accepted)
				id_state <= `ID_OTP_GET_DATA;
			end
		`ID_OTP_GET_DATA: begin
			invalid_ack_pipe[0] <= 1'b0;
			if ((i_spi_valid)&&(!invalid_ack_pipe[3]))
			begin
				id_state <= `ID_FINAL_STOP;
				nxt_data_ack <= 1'b1;
				nxt_data_spi <= 1'b1;
			end end
		`ID_OTP_WRITE: begin
			o_spi_wr  <= 1'b1;
			o_spi_len <= 2'b11;
			o_spi_dir <= 1'b0; // Write to SPI
			o_spi_word <= r_data;
			// o_bus_ack  <= (otp_wr_request)&&(accepted)&&(i_pipewr);
			// o_data_ack <= (otp_wr_request)&&(accepted);
			if (accepted) // &&(~i_pipewr)
				id_state <= `ID_WAIT_ON_STOP;
			else if(accepted)
			begin
				o_spi_word <= i_data;
				r_data <= i_data;
			end end
		`ID_WAIT_ON_STOP: begin
			o_spi_wr <= 1'b0;
			if (i_spi_stopped)
				id_state <= `ID_REQ_STATUS;
			end
		`ID_REQ_STATUS: begin
			o_spi_wr <= 1'b1;
			o_spi_hold <= 1'b0;
			o_spi_word[31:24] <= 8'h05;
			o_spi_dir <= 1'b0;
			o_spi_len <= 2'b00;
			if (accepted)
				id_state <= `ID_REQ_STATUS_NEXT;
			end
		`ID_REQ_STATUS_NEXT: begin
			o_spi_wr <= 1'b1;
			o_spi_hold <= 1'b0;
			o_spi_dir <= 1'b1; // Read
			o_spi_len <= 2'b00; // 8 bits
			// o_spi_word <= dont care
			if (accepted)
				id_state <= `ID_READ_STATUS;
			end
		`ID_READ_STATUS: begin
			o_spi_wr <= 1'b1;
			o_spi_hold <= 1'b0;
			o_spi_dir <= 1'b1; // Read
			o_spi_len <= 2'b00; // 8 bits
			// o_spi_word <= dont care
			invalid_ack_pipe[0] <= 1'b0;
			if ((i_spi_valid)&&(~invalid_ack_pipe[3]))
				chk_wip <= 1'b1;
			if ((chk_wip)&&(~i_spi_data[0]))
			begin
				o_wip <= 1'b0;
				id_state <= `ID_FINAL_STOP;
			end end
		default: begin // ID_FINAL_STOP
			o_bus_ack <= 1'b0;
			nxt_data_ack <= 1'b0;
			o_qspi_req <= 1'b0;
			o_spi_wr <= 1'b0;
			o_spi_hold <= 1'b0;
			o_spi_dir <= 1'b1; // Read
			o_spi_len <= 2'b00; // 8 bits
			// o_spi_word <= dont care
			if (i_spi_stopped)
				id_state <= `ID_IDLE;
			end
		endcase
	end

	always @(posedge i_clk)
	begin
		if (nxt_data_ack)
			o_data <= (nxt_data_spi)?i_spi_data : nxt_data;
		o_data_ack <= nxt_data_ack;
	end

	always @(posedge i_clk)
		if (set_val)
			idmem[set_addr] <= i_spi_data;

	assign	o_spi_spd = 1'b0; // Slow, 1-bit at a time

endmodule



////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	flashconfig.v
//
// Project:	Wishbone Controlled Quad SPI Flash Controller
//
// Purpose:	A configuration file, separated from the controller file, so
//		that multiple files can use the same wishbone Quad Spi Flash
//	controller, while each having a separate configuration.  Currently,
//	the configuration only includes whether the flash is read only or not.
//	Other configuration options may be added later.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2017, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`ifndef	FLASH_CONFIG_V
`define	FLASH_CONFIG_V
//
// `define	READ_ONLY
//
`endif
//
////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	lleqspi.v
//
// Project:	Wishbone Controlled Quad SPI Flash Controller
//
// Purpose:	Reads/writes a word (user selectable number of bytes) of data
//		to/from a Quad SPI port.  The port is understood to be 
//		a normal SPI port unless the driver requests four bit mode.
//		When not in use, unlike our previous SPI work, no bits will
//		toggle.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2017, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`define	EQSPI_IDLE	3'h0
`define	EQSPI_START	3'h1
`define	EQSPI_BITS	3'h2
`define	EQSPI_READY	3'h3
`define	EQSPI_HOLDING	3'h4
`define	EQSPI_STOP	3'h5
`define	EQSPI_STOP_B	3'h6
`define	EQSPI_RECYCLE	3'h7

// Modes
`define	EQSPI_MOD_SPI	2'b00
`define	EQSPI_MOD_QOUT	2'b10	// Write
`define	EQSPI_MOD_QIN	2'b11	// Read

module	lleqspi(i_clk,
		// Module interface
		i_wr, i_hold, i_word, i_len, i_spd, i_dir, i_recycle,
			o_word, o_valid, o_busy,
		// QSPI interface
		o_sck, o_cs_n, o_mod, o_dat, i_dat);
	input			i_clk;
	// Chip interface
	//	Can send info
	//		i_dir = 1, i_spd = 0, i_hold = 0, i_wr = 1,
	//			i_word = { 1'b0, 32'info to send },
	//			i_len = # of bytes in word-1
	input			i_wr, i_hold;
	input		[31:0]	i_word;
	input		[1:0]	i_len;	// 0=>8bits, 1=>16 bits, 2=>24 bits, 3=>32 bits
	input			i_spd; // 0 -> normal QPI, 1 -> QSPI
	input			i_dir; // 0 -> read, 1 -> write to SPI
	input			i_recycle; // 0 = 20ns, 1 = 50ns
	output	reg	[31:0]	o_word;
	output	reg		o_valid;
	output	reg		o_busy;
	// Interface with the QSPI lines
	output	reg		o_sck;
	output	reg		o_cs_n;
	output	reg	[1:0]	o_mod;
	output	reg	[3:0]	o_dat;
	input		[3:0]	i_dat;

	// output	wire	[22:0]	o_dbg;
	// assign	o_dbg = { state, spi_len,
		// o_busy, o_valid, o_cs_n, o_sck, o_mod, o_dat, i_dat };

	wire	i_miso;
	assign	i_miso = i_dat[1];

	// These are used in creating a delayed input.
	reg		rd_input, rd_spd, rd_valid;

	reg		r_spd, r_dir;
	reg	[3:0]	r_recycle;
	reg	[5:0]	spi_len;
	reg	[31:0]	r_word;
	reg	[30:0]	r_input;
	reg	[2:0]	state;
	initial	state = `EQSPI_IDLE;
	initial	o_sck   = 1'b1;
	initial	o_cs_n  = 1'b1;
	initial	o_dat   = 4'hd;
	initial	rd_valid = 1'b0;
	initial	o_busy  = 1'b0;
	initial	r_input = 31'h000;
	initial rd_valid = 1'b0;
	always @(posedge i_clk)
	begin
		rd_input <= 1'b0;
		rd_spd   <= r_spd;
		rd_valid <= 1'b0;
		
		if ((state == `EQSPI_IDLE)&&(o_sck))
		begin
			o_cs_n <= 1'b1;
			o_busy  <= 1'b0;
			o_mod <= `EQSPI_MOD_SPI;
			r_word <= i_word;
			r_spd <= i_spd;
			r_dir <= i_dir;
			o_dat <= 4'hc;
			r_recycle <= (i_recycle)? 4'h8 : 4'h2; // 4'ha : 4'h4
			spi_len<= { 1'b0, i_len, 3'b000 } + 6'h8;
			o_sck <= 1'b1;
			if (i_wr)
			begin
				state <= `EQSPI_START;
				o_cs_n <= 1'b0;
				o_busy <= 1'b1;
			end
		end else if (state == `EQSPI_START)
		begin // We come in here with sck high, stay here 'til sck is low
			o_sck <= 1'b0;
			if (o_sck == 1'b0)
			begin
				state <= `EQSPI_BITS;
				spi_len<= spi_len - ( (r_spd)? 6'h4 : 6'h1 );
				if (r_spd)
					r_word <= { r_word[27:0], 4'h0 };
				else
					r_word <= { r_word[30:0], 1'b0 };
			end
			o_mod <= (r_spd) ? { 1'b1, r_dir } : `EQSPI_MOD_SPI;
			o_cs_n <= 1'b0;
			o_busy <= 1'b1;
			if (r_spd)
				o_dat <= r_word[31:28];
			else
				o_dat <= { 3'b110, r_word[31] };
		end else if (~o_sck)
		begin
			o_sck <= 1'b1;
			o_busy <= ((state != `EQSPI_READY)||(~i_wr));
		end else if (state == `EQSPI_BITS)
		begin
			// Should enter into here with at least a spi_len
			// of one, perhaps more
			o_sck <= 1'b0;
			o_busy <= 1'b1;
			if (r_spd)
			begin
				o_dat <= r_word[31:28];
				r_word <= { r_word[27:0], 4'h0 };
				spi_len <= spi_len - 6'h4;
				if (spi_len == 6'h4)
					state <= `EQSPI_READY;
			end else begin
				o_dat <= { 3'b110, r_word[31] };
				r_word <= { r_word[30:0], 1'b0 };
				spi_len <= spi_len - 6'h1;
				if (spi_len == 6'h1)
					state <= `EQSPI_READY;
			end

			rd_input <= 1'b1;
		end else if (state == `EQSPI_READY)
		begin
			o_cs_n <= 1'b0;
			o_busy <= 1'b1;
			// This is the state on the last clock (both low and
			// high clocks) of the data.  Data is valid during
			// this state.  Here we chose to either STOP or
			// continue and transmit more.
			o_sck <= (i_hold); // No clocks while holding
			if((~o_busy)&&(i_wr))// Acknowledge a new request
			begin
				state <= `EQSPI_BITS;
				o_busy <= 1'b1;
				o_sck <= 1'b0;

				// Read the new request off the bus
				r_spd <= i_spd;
				r_dir <= i_dir;
				// Set up the first bits on the bus
				o_mod <= (i_spd) ? { 1'b1, i_dir } : `EQSPI_MOD_SPI;
				if (i_spd)
				begin
					o_dat <= i_word[31:28];
					r_word <= { i_word[27:0], 4'h0 };
					// spi_len <= spi_len - 4;
					spi_len<= { 1'b0, i_len, 3'b000 } + 6'h8
						- 6'h4;
				end else begin
					o_dat <= { 3'b110, i_word[31] };
					r_word <= { i_word[30:0], 1'b0 };
					spi_len<= { 1'b0, i_len, 3'b000 } + 6'h8
						- 6'h1;
				end

				// Read a bit upon any transition
				rd_input <= 1'b1;
				rd_valid <= 1'b1;
			end else begin
				o_sck <= 1'b1;
				state <= (i_hold)?`EQSPI_HOLDING : `EQSPI_STOP;
				o_busy <= (~i_hold);

				// Read a bit upon any transition
				rd_valid <= 1'b1;
				rd_input <= 1'b1;
			end
		end else if (state == `EQSPI_HOLDING)
		begin
			// We need this state so that the o_valid signal
			// can get strobed with our last result.  Otherwise
			// we could just sit in READY waiting for a new command.
			//
			// Incidentally, the change producing this state was
			// the result of a nasty race condition.  See the
			// commends in wbqspiflash for more details.
			//
			rd_valid <= 1'b0;
			o_cs_n <= 1'b0;
			o_busy <= 1'b0;
			if((~o_busy)&&(i_wr))// Acknowledge a new request
			begin
				state  <= `EQSPI_BITS;
				o_busy <= 1'b1;
				o_sck  <= 1'b0;

				// Read the new request off the bus
				r_spd <= i_spd;
				r_dir <= i_dir;
				// Set up the first bits on the bus
				o_mod<=(i_spd)?{ 1'b1, i_dir } : `EQSPI_MOD_SPI;
				if (i_spd)
				begin
					o_dat <= i_word[31:28];
					r_word <= { i_word[27:0], 4'h0 };
					spi_len<= { 1'b0, i_len, 3'b100 };
				end else begin
					o_dat <= { 3'b110, i_word[31] };
					r_word <= { i_word[30:0], 1'b0 };
					spi_len<= { 1'b0, i_len, 3'b111 };
				end
			end else begin
				o_sck <= 1'b1;
				state <= (i_hold)?`EQSPI_HOLDING : `EQSPI_STOP;
				o_busy <= (~i_hold);
			end
		end else if (state == `EQSPI_STOP)
		begin
			o_sck   <= 1'b1; // Stop the clock
			rd_valid <= 1'b0; // Output may have just been valid, but no more
			o_busy  <= 1'b1; // Still busy till port is clear
			state <= `EQSPI_STOP_B;
			// Can't change modes for at least one cycle
			// o_mod <= `EQSPI_MOD_SPI;
		end else if (state == `EQSPI_STOP_B)
		begin
			o_cs_n <= 1'b1;
			o_sck <= 1'b1;
			// Do I need this????
			// spi_len <= 3; // Minimum CS high time before next cmd
			state <= `EQSPI_RECYCLE;
			o_busy <= 1'b1;
			o_mod <= `EQSPI_MOD_SPI;
		end else begin // Recycle state
			r_recycle <= r_recycle - 1'b1;
			o_cs_n <= 1'b1;
			o_sck <= 1'b1;
			o_busy <= 1'b1;
			o_mod <= `EQSPI_MOD_SPI;
			o_dat <= 4'hc;
			if (r_recycle[3:1] == 3'h0)
				state <= `EQSPI_IDLE;
		end
		/*
		end else begin // Invalid states, should never get here
			state   <= `EQSPI_STOP;
			o_valid <= 1'b0;
			o_busy  <= 1'b1;
			o_cs_n  <= 1'b1;
			o_sck   <= 1'b1;
			o_mod   <= `EQSPI_MOD_SPI;
			o_dat   <= 4'hd;
		end
		*/
	end

`define EXTRA_DELAY
	wire	rd_input_N, rd_valid_N, r_spd_N;
`ifdef EXTRA_DELAY
	reg	[2:0]	rd_input_p, rd_valid_p, r_spd_p;
	always @(posedge i_clk)
		rd_input_p <= { rd_input_p[1:0], rd_input };
	always @(posedge i_clk)
		rd_valid_p <= { rd_valid_p[1:0], rd_valid };
	always @(posedge i_clk)
		r_spd_p <= { r_spd_p[1:0], r_spd };

	assign	rd_input_N = rd_input_p[2];
	assign	rd_valid_N = rd_valid_p[2];
	assign	r_spd_N = r_spd_p[2];
`else
	assign	rd_input_N = rd_input;
	assign	rd_valid_N = rd_valid;
	assign	r_spd_N    = rd_spd;
`endif


	always @(posedge i_clk)
	begin
		// if ((state == `EQSPI_IDLE)||(rd_valid_N))
		if (o_valid)
			r_input <= 31'h00;
		if ((rd_input_N)&&(r_spd_N))
			r_input <= { r_input[26:0], i_dat };
		else if (rd_input_N)
			r_input <= { r_input[29:0], i_miso };

		if ((rd_valid_N)&&(r_spd_N))
			o_word  <= { r_input[27:0], i_dat };
		else if (rd_valid_N)
			o_word  <= { r_input[30:0], i_miso };
		o_valid <= rd_valid_N;
	end

endmodule

////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	llqspi.v
//
// Project:	A Set of Wishbone Controlled SPI Flash Controllers
//
// Purpose:	Reads/writes a word (user selectable number of bytes) of data
//		to/from a Quad SPI port.  The port is understood to be 
//		a normal SPI port unless the driver requests four bit mode.
//		When not in use, unlike our previous SPI work, no bits will
//		toggle.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015,2017-2019, Gisselquist Technology, LLC
//
// This file is part of the set of Wishbone controlled SPI flash controllers
// project
//
// The Wishbone SPI flash controller project is free software (firmware):
// you can redistribute it and/or modify it under the terms of the GNU Lesser
// General Public License as published by the Free Software Foundation, either
// version 3 of the License, or (at your option) any later version.
//
// The Wishbone SPI flash controller project is distributed in the hope
// that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
// warranty of MERCHANTIBILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  (It's in the $(ROOT)/doc directory.  Run make
// with no target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	LGPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/lgpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
//
`define	QSPI_IDLE	3'h0
`define	QSPI_START	3'h1
`define	QSPI_BITS	3'h2
`define	QSPI_READY	3'h3
`define	QSPI_HOLDING	3'h4
`define	QSPI_STOP	3'h5
`define	QSPI_STOP_B	3'h6

// Modes
`define	QSPI_MOD_SPI	2'b00
`define	QSPI_MOD_QOUT	2'b10
`define	QSPI_MOD_QIN	2'b11

// Which level of formal proofs will we be doing?  As a component, or a
// top-level?
`ifdef	LLQSPI_TOP
`define	ASSUME	assume
`else
`define	ASSUME	assert
`endif
//
module	llqspi(i_clk,
		// Module interface
		i_wr, i_hold, i_word, i_len, i_spd, i_dir,
			o_word, o_valid, o_busy,
		// QSPI interface
		o_sck, o_cs_n, o_mod, o_dat, i_dat);
	input	wire		i_clk;
	// Chip interface
	//	Can send info
	//		i_dir = 1, i_spd = 0, i_hold = 0, i_wr = 1,
	//			i_word = { 1'b0, 32'info to send },
	//			i_len = # of bytes in word-1
	input	wire		i_wr, i_hold;
	input	wire	[31:0]	i_word;
	input	wire	[1:0]	i_len;	// 0=>8bits, 1=>16 bits, 2=>24 bits, 3=>32 bits
	input	wire		i_spd; // 0 -> normal QPI, 1 -> QSPI
	input	wire		i_dir; // 0 -> read, 1 -> write to SPI
	output	reg	[31:0]	o_word;
	output	reg		o_valid, o_busy;
	// Interface with the QSPI lines
	output	reg		o_sck;
	output	reg		o_cs_n;
	output	reg	[1:0]	o_mod;
	output	reg	[3:0]	o_dat;
	input	wire	[3:0]	i_dat;

	// output	wire	[22:0]	o_dbg;
	// assign	o_dbg = { state, spi_len,
		// o_busy, o_valid, o_cs_n, o_sck, o_mod, o_dat, i_dat };

	// Timing:
	//
	//	Tick	Clk	BSY/WR	CS_n	BIT/MO	STATE
	//	 0	1	0/0	1	 -	
	//	 1	1	0/1	1	 -
	//	 2	1	1/0	0	 -	QSPI_START
	//	 3	0	1/0	0	 -	QSPI_START
	//	 4	0	1/0	0	 0	QSPI_BITS
	//	 5	1	1/0	0	 0	QSPI_BITS
	//	 6	0	1/0	0	 1	QSPI_BITS
	//	 7	1	1/0	0	 1	QSPI_BITS
	//	 8	0	1/0	0	 2	QSPI_BITS
	//	 9	1	1/0	0	 2	QSPI_BITS
	//	10	0	1/0	0	 3	QSPI_BITS
	//	11	1	1/0	0	 3	QSPI_BITS
	//	12	0	1/0	0	 4	QSPI_BITS
	//	13	1	1/0	0	 4	QSPI_BITS
	//	14	0	1/0	0	 5	QSPI_BITS
	//	15	1	1/0	0	 5	QSPI_BITS
	//	16	0	1/0	0	 6	QSPI_BITS
	//	17	1	1/1	0	 6	QSPI_BITS
	//	18	0	1/1	0	 7	QSPI_READY
	//	19	1	0/1	0	 7	QSPI_READY
	//	20	0	1/0/V	0	 8	QSPI_BITS
	//	21	1	1/0	0	 8	QSPI_BITS
	//	22	0	1/0	0	 9	QSPI_BITS
	//	23	1	1/0	0	 9	QSPI_BITS
	//	24	0	1/0	0	10	QSPI_BITS
	//	25	1	1/0	0	10	QSPI_BITS
	//	26	0	1/0	0	11	QSPI_BITS
	//	27	1	1/0	0	11	QSPI_BITS
	//	28	0	1/0	0	12	QSPI_BITS
	//	29	1	1/0	0	12	QSPI_BITS
	//	30	0	1/0	0	13	QSPI_BITS
	//	31	1	1/0	0	13	QSPI_BITS
	//	32	0	1/0	0	14	QSPI_BITS
	//	33	1	1/0	0	14	QSPI_BITS
	//	34	0	1/0	0	15	QSPI_READY
	//	35	1	1/0	0	15	QSPI_READY
	//	36	1	1/0/V	0	 -	QSPI_STOP
	//	37	1	1/0	0	 -	QSPI_STOPB
	//	38	1	1/0	1	 -	QSPI_IDLE
	//	39	1	0/0	1	 -
	// Now, let's switch from single bit to quad mode
	//	40	1	0/0	1	 -	QSPI_IDLE
	//	41	1	0/1	1	 -	QSPI_IDLE
	//	42	1	1/0	0	 -	QSPI_START
	//	43	0	1/0	0	 -	QSPI_START
	//	44	0	1/0	0	 0	QSPI_BITS
	//	45	1	1/0	0	 0	QSPI_BITS
	//	46	0	1/0	0	 1	QSPI_BITS
	//	47	1	1/0	0	 1	QSPI_BITS
	//	48	0	1/0	0	 2	QSPI_BITS
	//	49	1	1/0	0	 2	QSPI_BITS
	//	50	0	1/0	0	 3	QSPI_BITS
	//	51	1	1/0	0	 3	QSPI_BITS
	//	52	0	1/0	0	 4	QSPI_BITS
	//	53	1	1/0	0	 4	QSPI_BITS
	//	54	0	1/0	0	 5	QSPI_BITS
	//	55	1	1/0	0	 5	QSPI_BITS
	//	56	0	1/0	0	 6	QSPI_BITS
	//	57	1	1/1/QR	0	 6	QSPI_BITS
	//	58	0	1/1/QR	0	 7	QSPI_READY
	//	59	1	0/1/QR	0	 7	QSPI_READY
	//	60	0	1/0/?/V	0	 8-11	QSPI_BITS
	//	61	1	1/0/?	0	 8-11	QSPI_BITS
	//	62	0	1/0/?	0	 12-15	QSPI_BITS
	//	63	1	1/0/?	0	 12-15	QSPI_BITS
	//	64	1	1/0/?/V	0	-	QSPI_STOP
	//	65	1	1/0/?	0	-	QSPI_STOPB
	//	66	1	1/0/?	1	-	QSPI_IDLE
	//	67	1	0/0	1	-	QSPI_IDLE
	// Now let's try something entirely in Quad read mode, from the
	// beginning
	//	68	1	0/1/QR	1	-	QSPI_IDLE
	//	69	1	1/0	0	-	QSPI_START
	//	70	0	1/0	0	-	QSPI_START
	//	71	0	1/0	0	0-3	QSPI_BITS
	//	72	1	1/0	0	0-3	QSPI_BITS
	//	73	0	1/1/QR	0	4-7	QSPI_BITS
	//	74	1	0/1/QR	0	4-7	QSPI_BITS
	//	75	0	1/?/?/V	0	8-11	QSPI_BITS
	//	76	1	1/?/?	0	8-11	QSPI_BITS
	//	77	0	1/1/QR	0	12-15	QSPI_BITS
	//	78	1	0/1/QR	0	12-15	QSPI_BITS
	//	79	0	1/?/?/V	0	16-19	QSPI_BITS
	//	80	1	1/0	0	16-19	QSPI_BITS
	//	81	0	1/0	0	20-23	QSPI_BITS
	//	82	1	1/0	0	20-23	QSPI_BITS
	//	83	1	1/0/V	0	-	QSPI_STOP
	//	84	1	1/0	0	-	QSPI_STOPB
	//	85	1	1/0	1	-	QSPI_IDLE
	//	86	1	0/0	1	-	QSPI_IDLE

	wire	i_miso;
	assign	i_miso = i_dat[1];

	reg		r_spd, r_dir;
	reg	[5:0]	spi_len;
	reg	[31:0]	r_word;
	reg	[30:0]	r_input;
	reg	[2:0]	state;
	initial	state = `QSPI_IDLE;
	initial	o_sck   = 1'b1;
	initial	o_cs_n  = 1'b1;
	initial	o_dat   = 4'hd;
	initial	o_valid = 1'b0;
	initial	o_busy  = 1'b0;
	initial	r_input = 31'h000;
	initial o_mod   = `QSPI_MOD_SPI;
	initial o_word  = 0;
	always @(posedge i_clk)
		if ((state == `QSPI_IDLE)&&(o_sck))
		begin
			o_cs_n <= 1'b1;
			o_valid <= 1'b0;
			o_busy  <= 1'b0;
			o_mod <= `QSPI_MOD_SPI;
			r_word <= i_word;
			r_spd <= i_spd;
			r_dir <= i_dir;
			if ((i_wr)&&(!o_busy))
			begin
				state <= `QSPI_START;
				spi_len<= { 1'b0, i_len, 3'b000 } + 6'h8;
				o_cs_n <= 1'b0;
				// o_sck <= 1'b1;
				o_busy <= 1'b1;
			end
		end else if (state == `QSPI_START)
		begin // We come in here with sck high, stay here 'til sck is low
			o_sck <= 1'b0;
			if (o_sck == 1'b0)
			begin
				state <= `QSPI_BITS;
				spi_len<= spi_len - ( (r_spd)? 6'h4 : 6'h1 );
				if (r_spd)
					r_word <= { r_word[27:0], 4'h0 };
				else
					r_word <= { r_word[30:0], 1'b0 };
			end
			o_mod <= (r_spd) ? { 1'b1, r_dir } : `QSPI_MOD_SPI;
			o_cs_n <= 1'b0;
			o_busy <= 1'b1;
			o_valid <= 1'b0;
			if (r_spd)
				o_dat <= r_word[31:28];
			else
				o_dat <= { 3'b110, r_word[31] };
		end else if (!o_sck)
		begin
			o_sck <= 1'b1;
			o_busy <= ((state != `QSPI_READY)||(!i_wr));
			o_valid <= 1'b0;
		end else if (state == `QSPI_BITS)
		begin
			// Should enter into here with at least a spi_len
			// of one, perhaps more
			o_sck <= 1'b0;
			o_busy <= 1'b1;
			if (r_spd)
			begin
				o_dat <= r_word[31:28];
				r_word <= { r_word[27:0], 4'h0 };
				spi_len <= spi_len - 6'h4;
				if (spi_len == 6'h4)
					state <= `QSPI_READY;
			end else begin
				o_dat <= { 3'b110, r_word[31] };
				r_word <= { r_word[30:0], 1'b0 };
				spi_len <= spi_len - 6'h1;
				if (spi_len == 6'h1)
					state <= `QSPI_READY;
			end

			o_valid <= 1'b0;
			if (!o_mod[1])
				r_input <= { r_input[29:0], i_miso };
			else if (o_mod[1])
				r_input <= { r_input[26:0], i_dat };
		end else if (state == `QSPI_READY)
		begin
			o_valid <= 1'b0;
			o_cs_n <= 1'b0;
			o_busy <= 1'b1;
			// This is the state on the last clock (both low and
			// high clocks) of the data.  Data is valid during
			// this state.  Here we chose to either STOP or
			// continue and transmit more.
			o_sck <= (i_hold); // No clocks while holding
			r_spd <= i_spd;
			r_dir <= i_dir;
			if (i_spd)
			begin
				r_word <= { i_word[27:0], 4'h0 };
				spi_len<= { 1'b0, i_len, 3'b000 } + 6'h8 - 6'h4;
			end else begin
				r_word <= { i_word[30:0], 1'b0 };
				spi_len<= { 1'b0, i_len, 3'b000 } + 6'h8 - 6'h1;
			end
			if((!o_busy)&&(i_wr))// Acknowledge a new request
			begin
				state <= `QSPI_BITS;
				o_busy <= 1'b1;
				o_sck <= 1'b0;

				// Read the new request off the bus
				// Set up the first bits on the bus
				o_mod <= (i_spd) ? { 1'b1, i_dir } : `QSPI_MOD_SPI;
				if (i_spd)
					o_dat <= i_word[31:28];
				else
					o_dat <= { 3'b110, i_word[31] };

			end else begin
				o_sck <= 1'b1;
				state <= (i_hold)?`QSPI_HOLDING : `QSPI_STOP;
				o_busy <= (!i_hold);
			end

			// Read a bit upon any transition
			o_valid <= 1'b1;
			if (!o_mod[1])
			begin
				r_input <= { r_input[29:0], i_miso };
				o_word  <= { r_input[30:0], i_miso };
			end else if (o_mod[1])
			begin
				r_input <= { r_input[26:0], i_dat };
				o_word  <= { r_input[27:0], i_dat };
			end
		end else if (state == `QSPI_HOLDING)
		begin
			// We need this state so that the o_valid signal
			// can get strobed with our last result.  Otherwise
			// we could just sit in READY waiting for a new command.
			//
			// Incidentally, the change producing this state was
			// the result of a nasty race condition.  See the
			// commends in wbqspiflash for more details.
			//
			o_valid <= 1'b0;
			o_cs_n <= 1'b0;
			o_busy <= 1'b0;
			r_spd <= i_spd;
			r_dir <= i_dir;
			if (i_spd)
			begin
				r_word <= { i_word[27:0], 4'h0 };
				spi_len<= { 1'b0, i_len, 3'b100 };
			end else begin
				r_word <= { i_word[30:0], 1'b0 };
				spi_len<= { 1'b0, i_len, 3'b111 };
			end
			if((!o_busy)&&(i_wr))// Acknowledge a new request
			begin
				state  <= `QSPI_BITS;
				o_busy <= 1'b1;
				o_sck  <= 1'b0;

				// Read the new request off the bus
				// Set up the first bits on the bus
				o_mod<=(i_spd)?{ 1'b1, i_dir } : `QSPI_MOD_SPI;
				if (i_spd)
					o_dat <= i_word[31:28];
				else
					o_dat <= { 3'b110, i_word[31] };
			end else begin
				o_sck <= 1'b1;
				state <= (i_hold)?`QSPI_HOLDING : `QSPI_STOP;
				o_busy <= (!i_hold);
			end
		end else if (state == `QSPI_STOP)
		begin
			o_sck   <= 1'b1; // Stop the clock
			o_valid <= 1'b0; // Output may have just been valid, but no more
			o_busy  <= 1'b1; // Still busy till port is clear
			state <= `QSPI_STOP_B;
			o_mod <= `QSPI_MOD_SPI;
		end else if (state == `QSPI_STOP_B)
		begin
			o_cs_n <= 1'b1;
			o_sck <= 1'b1;
			// Do I need this????
			// spi_len <= 3; // Minimum CS high time before next cmd
			state <= `QSPI_IDLE;
			o_valid <= 1'b0;
			o_busy <= 1'b1;
			o_mod <= `QSPI_MOD_SPI;
		end else begin // Invalid states, should never get here
			state   <= `QSPI_STOP;
			o_valid <= 1'b0;
			o_busy  <= 1'b1;
			o_cs_n  <= 1'b1;
			o_sck   <= 1'b1;
			o_mod   <= `QSPI_MOD_SPI;
			o_dat   <= 4'hd;
		end

`ifdef	FORMAL
	reg	prev_i_clk, past_valid;

	initial	`ASSUME(i_clk == 1'b0);
	initial	prev_i_clk  = 1;
	always @($global_clock)
	begin
		prev_i_clk  <= i_clk;
		`ASSUME(i_clk != prev_i_clk);
	end

	reg	past_valid;
	initial	past_valid = 1'b0;
	always @(posedge i_clk)
		past_valid <= 1'b1;

	/*
	always @(*)
		if (!$stable(i_spd))
			assert($rose(i_clk));
	*/

	always @(posedge i_clk) begin
		if ((past_valid)&&($past(i_wr))&&($past(o_busy)))
		begin
			// any time i_wr and o_busy are true, nothing changes
			// of spd, len, word or dir
			`ASSUME(i_wr);
			`ASSUME(i_spd  == $past(i_spd));
			`ASSUME(i_len  == $past(i_len));
			`ASSUME(i_word == $past(i_word));
			`ASSUME(i_dir  == $past(i_dir));
			`ASSUME(i_hold == $past(i_hold));
		end
		if ((past_valid)&&($past(i_wr))&&($past(o_busy))&&($past(state == `QSPI_IDLE)))
			assert($past(state)==state);
		if (i_hold == $past(i_hold))
			assert($stable(i_hold));
	end

	always @(*) begin
		if (o_mod == `QSPI_MOD_QOUT)
			`ASSUME(i_dat == o_dat);
		if (o_mod == `QSPI_MOD_SPI)
			`ASSUME(i_dat[3:2] == 2'b11);
		if (o_mod == `QSPI_MOD_SPI)
			`ASSUME(i_dat[0] == o_dat[0]);
	end

	initial	`ASSUME(i_wr == 1'b0);
	initial	`ASSUME(i_word == 0);

	always @($global_clock)
	if (!$rose(i_clk))
	begin
		`ASSUME($stable(i_wr));
		//
		`ASSUME($stable(i_len));
		`ASSUME($stable(i_dir));
		`ASSUME($stable(i_spd));
		`ASSUME($stable(i_word));
		//
		`ASSUME($stable(i_hold));
	end

	always @($global_clock)
	if (!$fell(o_sck))
		assume($stable(i_dat));

	// This is ... not as believable.  There might be a delay here.
	// For now, we'll just assume (not necessarily true) that the
	// output
	always @(posedge i_clk)
		if (past_valid)
		`ASSUME( (i_dat == $past(i_dat)) || (o_sck != $past(o_sck)) );

	reg	f_last_sck;
	always @(posedge i_clk)
		f_last_sck <= o_sck;

	reg	[31:0]	f_shiftreg, f_goal;
	initial	f_shiftreg = 0;
	initial	f_goal = 0;
	always @(posedge i_clk)
		if ((o_sck)&&(!f_last_sck))
		begin
			if (o_mod == `QSPI_MOD_QOUT)
				f_shiftreg <= { f_shiftreg[28:0], o_dat };
			else if (o_mod == `QSPI_MOD_SPI)
				f_shiftreg <= { f_shiftreg[30:0], o_dat[0] };
		end

	reg	[5:0]	f_nsent, f_vsent;
	reg	[2:0]	f_nbits_r;
	wire	[5:0]	f_nbits;
	always @(posedge i_clk)
		if ((i_wr)&&(!o_busy))
		begin
			f_goal <= i_word;
			f_nbits_r <= { 1'b0, i_len } + 3'h1;
		end
	assign	f_nbits = { f_nbits_r, 3'b000 };
	always @(posedge i_clk)
		if ((!o_sck)||(!o_cs_n))
			assert(f_nbits != 0);

	always @(posedge i_clk)
		if (o_cs_n)
			f_nsent <= 0;
		else if ((!o_busy)&&(i_wr))
			f_nsent <= 0;
		else if ((!f_last_sck)&&(o_sck))
		begin
			if (o_mod == `QSPI_MOD_SPI)
				f_nsent <= f_nsent + 6'h1;
			else
				f_nsent <= f_nsent + 6'h4;
		end
	always @(posedge i_clk)
		if (o_cs_n)
			f_vsent <= 0;
		else
			f_vsent <= f_nsent;
	always @(posedge i_clk)
		if ((!o_cs_n)&&(state == `QSPI_BITS)&&(!o_sck))
		begin
			if (o_mod != `QSPI_MOD_SPI)
				assert(f_nsent + spi_len + 6'h4 == f_nbits);
			else
				assert(f_nsent + spi_len + 6'h1 == f_nbits);
		end

	always @(posedge i_clk)
		assert((o_busy)||(f_goal[(f_nbits-1):0] == f_shiftreg[(f_nbits-1):0]));

	always @(posedge i_clk) begin
		// We are only ever in one of three speed modes, fourth mode
		// isn't allowed
		assert(	(o_mod == `QSPI_MOD_SPI)
			||(o_mod == `QSPI_MOD_QIN)
			||(o_mod == `QSPI_MOD_QOUT));

		if ((past_valid)&&($past(i_wr))&&(!$past(o_busy)))
		begin
			// Any accepted request leaves us in an active state
			assert(!o_cs_n);

			// Any accepted request allows us to set our speed
			assert(r_spd == $past(i_spd));
		end

		// We're either busy, or idle with the clock high
		//   or pausing (upon a request) mid-transaction
		assert((o_busy)
			||((state == `QSPI_IDLE)&&(o_sck)&&(o_cs_n))
			||((state == `QSPI_READY)&&(o_sck)&&(!o_cs_n))
			||((state == `QSPI_HOLDING)&&(o_sck)&&(!o_cs_n))
			);

		// Anytime CS is idle, SCK is high
		if (o_cs_n)
			assert(o_sck);


		// What can we assert about i_hold?

		// When i_hold is asserted before a transaction completes,
		// the transaction will "hold" and wait for a next input.
		// i.e. the clock will stop

		// First assert that o_busy will be deasserted any time the
		// currently requested word has been sent
		//
		//if ((($past(i_wr))||(i_hold))
		//		&&(f_nsent == f_nbits)&&(!o_sck)&&(!o_cs_n))
		//	assert(!o_busy);


		// First, assert of i_hold that !o_busy will be set.
		if ((past_valid)&&($past(i_hold))&&(f_nsent == f_nbits)&&(!o_cs_n))
		begin
			assert((!o_busy)||(o_sck));
		end
		if ((past_valid)&&($past(i_hold))&&(!$past(i_wr))
			&&(!$past(o_busy))&&(!$past(o_cs_n)))
		begin
			assert(!o_cs_n);
			assert($past(o_sck)==o_sck);
		end

		// DATA only changes on the falling edge of SCK
		if ((past_valid)&&(o_sck))
			assert(o_dat==$past(o_dat));

		// Valid is only ever true for one clock
		if ((past_valid)&&(o_valid))
			assert(!$past(o_valid));

		// Valid is only ever true after receiving a full number of bits
		if ((past_valid)&&(o_valid))
		begin
			if ((!$past(i_wr))||($past(o_busy)))
				assert(f_nsent == f_nbits);
		end

		// In SPI mode, the top bits of o_dat are always 3'b110
		//
		// This should be true, but there's a problem holding this
		// true
		// assert( (o_mod != `QSPI_MOD_SPI)||(o_dat[3:1] == 3'b110) );

		// Either valid is true (this clock), or our output word is
		// identical to what it was on the last clock
		if (past_valid)
			assert((o_valid) || (o_word == $past(o_word)));
	end
`endif

endmodule
////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	wbspiflash.v
//
// Project:	A Set of Wishbone Controlled SPI Flash Controllers
//
// Purpose:	Access a Quad SPI flash via a WISHBONE interface.  This
//		includes both read and write (and erase) commands to the SPI
//		flash.  All read/write commands are accomplished using the
//		high speed (4-bit) interface.  Further, the device will be
//		left/kept in the 4-bit read interface mode between accesses,
//		for a minimum read latency.
//
//	Wishbone Registers (See spec sheet for more detail):
//	0: local config(r) / erase commands(w) / deep power down cmds / etc.
//	R: (Write in Progress), (dirty-block), (spi_port_busy), 1'b0, 9'h00,
//		{ last_erased_sector, 14'h00 } if (WIP)
//		else { current_sector_being_erased, 14'h00 }
//		current if write in progress, last if written
//	W: (1'b1 to erase), (12'h ignored), next_erased_block, 14'h ignored)
//	1: Configuration register
//	2: Status register (R/w)
//	3: Read ID (read only)
//	(19 bits): Data (R/w, but expect writes to take a while)
//		
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2019, Gisselquist Technology, LLC
//
// This file is part of the set of Wishbone controlled SPI flash controllers
// project
//
// The Wishbone SPI flash controller project is free software (firmware):
// you can redistribute it and/or modify it under the terms of the GNU Lesser
// General Public License as published by the Free Software Foundation, either
// version 3 of the License, or (at your option) any later version.
//
// The Wishbone SPI flash controller project is distributed in the hope
// that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
// warranty of MERCHANTIBILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  (It's in the $(ROOT)/doc directory.  Run make
// with no target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	LGPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/lgpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
//
`default_nettype	none
//
`define	WBQSPI_RESET		5'd0
`define	WBQSPI_RESET_QUADMODE	5'd1
`define	WBQSPI_IDLE		5'd2
`define	WBQSPI_RDIDLE		5'd3	// Idle, but in fast read mode
`define	WBQSPI_WBDECODE		5'd4
`define	WBQSPI_RD_DUMMY		5'd5
`define	WBQSPI_QRD_ADDRESS	5'd6
`define	WBQSPI_QRD_DUMMY	5'd7
`define	WBQSPI_READ_CMD		5'd8
`define	WBQSPI_READ_DATA	5'd9
`define	WBQSPI_WAIT_TIL_RDIDLE	5'd10
`define	WBQSPI_READ_ID_CMD	5'd11
`define	WBQSPI_READ_ID		5'd12
`define	WBQSPI_READ_STATUS	5'd13
`define	WBQSPI_READ_CONFIG	5'd14
`define	WBQSPI_WAIT_TIL_IDLE	5'd15
//
//
`define	WBQSPI_WAIT_WIP_CLEAR	5'd16
`define	WBQSPI_CHECK_WIP_CLEAR	5'd17
`define	WBQSPI_CHECK_WIP_DONE	5'd18
`define	WBQSPI_WEN		5'd19
`define	WBQSPI_PP		5'd20	// Program page
`define	WBQSPI_QPP		5'd21	// Program page, 4 bit mode
`define	WBQSPI_WR_DATA		5'd22
`define	WBQSPI_WR_BUS_CYCLE	5'd23
`define	WBQSPI_WRITE_STATUS	5'd24
`define	WBQSPI_WRITE_CONFIG	5'd25
`define	WBQSPI_ERASE_WEN	5'd26
`define	WBQSPI_ERASE_CMD	5'd27
`define	WBQSPI_ERASE_BLOCK	5'd28
`define	WBQSPI_CLEAR_STATUS	5'd29
`define	WBQSPI_IDLE_CHECK_WIP	5'd30
//
module	wbqspiflash(i_clk,
		// Internal wishbone connections
		i_wb_cyc, i_wb_data_stb, i_wb_ctrl_stb, i_wb_we,
		i_wb_addr, i_wb_data,
		// Wishbone return values
		o_wb_ack, o_wb_stall, o_wb_data,
		// Quad Spi connections to the external device
		o_qspi_sck, o_qspi_cs_n, o_qspi_mod, o_qspi_dat, i_qspi_dat,
		o_interrupt);
	parameter	ADDRESS_WIDTH=22;
	parameter [0:0]	OPT_READ_ONLY = 1'b0;
	localparam	AW = ADDRESS_WIDTH-2;
	input	wire		i_clk;
	// Wishbone, inputs first
	input	wire		i_wb_cyc, i_wb_data_stb, i_wb_ctrl_stb, i_wb_we;
	input	wire	[(AW-1):0]	i_wb_addr;
	input	wire	[31:0]	i_wb_data;
	// then outputs
	output	reg		o_wb_ack;
	output	reg		o_wb_stall;
	output	reg	[31:0]	o_wb_data;
	// Quad SPI control wires
	output	wire		o_qspi_sck, o_qspi_cs_n;
	output	wire	[1:0]	o_qspi_mod;
	output	wire	[3:0]	o_qspi_dat;
	input	wire	[3:0]	i_qspi_dat;
	// Interrupt line
	output	reg		o_interrupt;
	// output	wire	[31:0]	o_debug;

	reg		spi_wr, spi_hold, spi_spd, spi_dir;
	reg	[31:0]	spi_in;
	reg	[1:0]	spi_len;
	wire	[31:0]	spi_out;
	wire		spi_valid, spi_busy;
	wire		w_qspi_sck, w_qspi_cs_n;
	wire	[3:0]	w_qspi_dat;
	wire	[1:0]	w_qspi_mod;
	// wire	[22:0]	spi_dbg;
	llqspi	lldriver(i_clk,
			spi_wr, spi_hold, spi_in, spi_len, spi_spd, spi_dir,
				spi_out, spi_valid, spi_busy,
			w_qspi_sck, w_qspi_cs_n, w_qspi_mod, w_qspi_dat,
				i_qspi_dat);

	// Erase status tracking
	reg		write_in_progress, write_protect;
	reg	[(ADDRESS_WIDTH-17):0]	erased_sector;
	reg		dirty_sector;
	initial	begin
		write_in_progress = 1'b0;
		erased_sector = 0;
		dirty_sector  = 1'b1;
		write_protect = 1'b1;
	end

	wire	[23:0]	w_wb_addr;
	generate
	if (ADDRESS_WIDTH>=24)
		assign w_wb_addr = { i_wb_addr[21:0], 2'b00 };
	else
		assign w_wb_addr = { {(24-ADDRESS_WIDTH){1'b0}}, i_wb_addr, 2'b00 };
	endgenerate

	// Repeat for spif_addr
	reg	[(ADDRESS_WIDTH-3):0]	spif_addr;
	wire	[23:0]	w_spif_addr;
	generate
	if (ADDRESS_WIDTH>=24)
		assign w_spif_addr = { spif_addr[21:0], 2'b00 };
	else
		assign w_spif_addr = { {(24-ADDRESS_WIDTH){1'b0}}, spif_addr, 2'b00 };
	endgenerate
		
	reg	[7:0]	last_status;
	reg	[9:0]	reset_counter;
	reg		quad_mode_enabled;
	reg		spif_cmd, spif_override;
	reg	[31:0]	spif_data;
	reg	[4:0]	state;
	reg		spif_ctrl, spif_req;
	reg		alt_cmd, alt_ctrl;
	wire	[(ADDRESS_WIDTH-17):0]	spif_sector;
	assign	spif_sector = spif_addr[(AW-1):14];

	// assign	o_debug = { spi_wr, spi_spd, spi_hold, state, spi_dbg };

	initial	state = `WBQSPI_RESET;
	initial o_wb_ack   = 1'b0;
	initial o_wb_stall = 1'b1;
	initial spi_wr     = 1'b0;
	initial	spi_len    = 2'b00;
	initial	quad_mode_enabled = 1'b0;
	initial o_interrupt = 1'b0;
	initial	spif_override = 1'b1;
	initial	spif_ctrl     = 1'b0;
	always @(posedge i_clk)
	begin
	spif_override <= 1'b0;
	alt_cmd  <= (reset_counter[9:8]==2'b10)?reset_counter[3]:1'b1; // Toggle CS_n
	alt_ctrl <= (reset_counter[9:8]==2'b10)?reset_counter[0]:1'b1; // Toggle clock too
	if (state == `WBQSPI_RESET)
	begin
		// From a reset, we should
		//	Enable the Quad I/O mode
		//	Disable the Write protection bits in the status register
		//	Chip should already be up and running, so we can start
		//	immediately ....
		o_wb_ack <= 1'b0;
		o_wb_stall <= 1'b1;
		spi_wr   <= 1'b0;
		spi_hold <= 1'b0;
		spi_spd  <= 1'b0;
		spi_dir  <= 1'b0;
		last_status <= 8'h00;
		state <= `WBQSPI_RESET_QUADMODE;
		spif_req <= 1'b0;
		spif_override <= 1'b1;
		last_status   <= 8'h00; //
		reset_counter <= 10'h3fc; //
			// This guarantees that we aren't starting in quad
			// I/O mode, where the FPGA configuration scripts may
			// have left us.
	end else if (state == `WBQSPI_RESET_QUADMODE)
	begin
		// Okay, so here's the problem: we don't know whether or not
		// the Xilinx loader started us up in Quad Read I/O idle mode.
		// So, thus we need to toggle the clock and CS_n, with fewer
		// clocks than are necessary to transmit a word.
		//
		// Not ready to handle the bus yet, so stall any requests
		o_wb_ack   <= 1'b0;
		o_wb_stall <= 1'b1;

		// Do something ...
		if (reset_counter == 10'h00)
		begin
			spif_override <= 1'b0;
			state <= `WBQSPI_IDLE;

			// Find out if we can use Quad I/O mode ...
			state <= `WBQSPI_READ_CONFIG;
			spi_wr <= 1'b1;
			spi_len <= 2'b01;
			spi_in <= { 8'h35, 24'h00};

		end else begin
			reset_counter <= reset_counter - 10'h1;
			spif_override <= 1'b1;
		end
	end else if (state == `WBQSPI_IDLE)
	begin
		o_interrupt <= 1'b0;
		o_wb_stall <= 1'b0;
		o_wb_ack <= 1'b0;
		spif_cmd   <= i_wb_we;
		spif_addr  <= i_wb_addr;
		spif_data  <= i_wb_data;
		spif_ctrl  <= (i_wb_ctrl_stb)&&(!i_wb_data_stb);
		spif_req   <= (i_wb_ctrl_stb)||(i_wb_data_stb);
		spi_wr <= 1'b0; // Keep the port idle, unless told otherwise
		spi_hold <= 1'b0;
		spi_spd  <= 1'b0;
		spi_dir <= 1'b0; // Write (for now, 'cause of cmd)
		// Data register access
		if (i_wb_data_stb)
		begin

			if ((OPT_READ_ONLY)&&(i_wb_we)) // Write request
			begin
				o_wb_ack <= 1'b1;
				o_wb_stall <= 1'b0;
			end else if (i_wb_we) // Request to write a page
			begin
				if((!write_protect)&&(!write_in_progress))
				begin // 00
					spi_wr <= 1'b1;
					spi_len <= 2'b00; // 8 bits
					// Send a write enable command
					spi_in <= { 8'h06, 24'h00 };
					state <= `WBQSPI_WEN;

					o_wb_ack <= 1'b0;
					o_wb_stall <= 1'b1;
				end else if (write_protect)
				begin // whether or not write-in_progress ...
					// Do nothing on a write protect
					// violation
					//
					o_wb_ack <= 1'b1;
					o_wb_stall <= 1'b0;
				end else begin // write is in progress, wait
					// for it to complete
					state <= `WBQSPI_WAIT_WIP_CLEAR;
					o_wb_ack <= 1'b0;
					o_wb_stall <= 1'b1;
				end
			end else if (!write_in_progress)
			begin // Read access, normal mode(s)
				o_wb_ack   <= 1'b0;
				o_wb_stall <= 1'b1;
				spi_wr     <= 1'b1;	// Write cmd to device
				if (quad_mode_enabled)
				begin
					spi_in <= { 8'heb, w_wb_addr };
					state <= `WBQSPI_QRD_ADDRESS;
					spi_len    <= 2'b00; // single byte, cmd only
				end else begin
					spi_in <= { 8'h0b, w_wb_addr };
					state <= `WBQSPI_RD_DUMMY;
					spi_len    <= 2'b11; // cmd+addr,32bits
				end
			end else if (!OPT_READ_ONLY) begin
				// A write is in progress ... need to stall
				// the bus until the write is complete.
				state <= `WBQSPI_WAIT_WIP_CLEAR;
				o_wb_ack   <= 1'b0;
				o_wb_stall <= 1'b1;
			end
		end else if ((OPT_READ_ONLY)&&(i_wb_ctrl_stb)&&(i_wb_we))
		begin
			o_wb_ack   <= 1'b1;
			o_wb_stall <= 1'b0;
		end else if ((i_wb_ctrl_stb)&&(i_wb_we))
		begin
			o_wb_stall <= 1'b1;
			case(i_wb_addr[1:0])
			2'b00: begin // Erase command register
				write_protect <= !i_wb_data[28];
				o_wb_stall <= 1'b0;

				if((i_wb_data[31])&&(!write_in_progress))
				begin
					// Command an erase--ack it immediately

					o_wb_ack <= 1'b1;
					o_wb_stall <= 1'b0;

					if ((i_wb_data[31])&&(!write_protect))
					begin
						spi_wr <= 1'b1;
						spi_len <= 2'b00;
						// Send a write enable command
						spi_in <= { 8'h06, 24'h00 };
						state <= `WBQSPI_ERASE_CMD;
						o_wb_stall <= 1'b1;
					end
				end else if (i_wb_data[31])
				begin
					state <= `WBQSPI_WAIT_WIP_CLEAR;
					o_wb_ack   <= 1'b1;
					o_wb_stall <= 1'b1;
				end else begin
					o_wb_ack   <= 1'b1;
					o_wb_stall <= 1'b0;
				end end
			2'b01: begin
				// Write the configuration register
				o_wb_ack <= 1'b1;
				o_wb_stall <= 1'b1;

				// Need to send a write enable command first
				spi_wr <= 1'b1;
				spi_len <= 2'b00; // 8 bits
				// Send a write enable command
				spi_in <= { 8'h06, 24'h00 };
				state <= `WBQSPI_WRITE_CONFIG;
				end
			2'b10: begin
				// Write the status register
				o_wb_ack <= 1'b1; // Ack immediately
				o_wb_stall <= 1'b1; // Stall other cmds
				// Need to send a write enable command first
				spi_wr <= 1'b1;
				spi_len <= 2'b00; // 8 bits
				// Send a write enable command
				spi_in <= { 8'h06, 24'h00 };
				state <= `WBQSPI_WRITE_STATUS;
				end
			2'b11: begin // Write the ID register??? makes no sense
				o_wb_ack <= 1'b1;
				o_wb_stall <= 1'b0;
				end
			endcase
		end else if (i_wb_ctrl_stb) // &&(!i_wb_we))
		begin
			case(i_wb_addr[1:0])
			2'b00: begin // Read local register
				if (write_in_progress) // Read status
				begin// register, is write still in progress?
					state <= `WBQSPI_READ_STATUS;
					spi_wr <= 1'b1;
					spi_len <= 2'b01;// 8 bits out, 8 bits in
					spi_in <= { 8'h05, 24'h00};

					o_wb_ack <= 1'b0;
					o_wb_stall <= 1'b1;
				end else begin // Return w/o talking to device
					o_wb_ack <= 1'b1;
					o_wb_stall <= 1'b0;
					o_wb_data <= { write_in_progress,
						dirty_sector, spi_busy,
						~write_protect,
						quad_mode_enabled,
						{(29-ADDRESS_WIDTH){1'b0}},
						erased_sector, 14'h000 };
				end end
			2'b01: begin // Read configuration register
				state <= `WBQSPI_READ_CONFIG;
				spi_wr <= 1'b1;
				spi_len <= 2'b01;
				spi_in <= { 8'h35, 24'h00};

				o_wb_ack <= 1'b0;
				o_wb_stall <= 1'b1;
				end
			2'b10: begin // Read status register
				state <= `WBQSPI_READ_STATUS;
				spi_wr <= 1'b1;
				spi_len <= 2'b01; // 8 bits out, 8 bits in
				spi_in <= { 8'h05, 24'h00};

				o_wb_ack <= 1'b0;
				o_wb_stall <= 1'b1;
				end
			2'b11: begin // Read ID register
				state <= `WBQSPI_READ_ID_CMD;
				spi_wr <= 1'b1;
				spi_len <= 2'b00;
				spi_in <= { 8'h9f, 24'h00};

				o_wb_ack <= 1'b0;
				o_wb_stall <= 1'b1;
				end
			endcase
		end else if ((!OPT_READ_ONLY)&&(!i_wb_cyc)&&(write_in_progress))
		begin
			state <= `WBQSPI_IDLE_CHECK_WIP;
			spi_wr <= 1'b1;
			spi_len <= 2'b01; // 8 bits out, 8 bits in
			spi_in <= { 8'h05, 24'h00};

			o_wb_ack <= 1'b0;
			o_wb_stall <= 1'b1;
		end
	end else if (state == `WBQSPI_RDIDLE)
	begin
		spi_wr <= 1'b0;
		o_wb_stall <= 1'b0;
		o_wb_ack <= 1'b0;
		spif_cmd   <= i_wb_we;
		spif_addr  <= i_wb_addr;
		spif_data  <= i_wb_data;
		spif_ctrl  <= (i_wb_ctrl_stb)&&(!i_wb_data_stb);
		spif_req   <= (i_wb_ctrl_stb)||(i_wb_data_stb);
		spi_hold <= 1'b0;
		spi_spd<= 1'b1;
		spi_dir <= 1'b0; // Write (for now)
		if ((i_wb_data_stb)&&(!i_wb_we))
		begin // Continue our read ... send the new address / mode
			o_wb_stall <= 1'b1;
			spi_wr <= 1'b1;
			spi_len <= 2'b10; // Write address, but not mode byte
			spi_in <= { w_wb_addr, 8'ha0 };
			state <= `WBQSPI_QRD_DUMMY;
		end else if((i_wb_ctrl_stb)&&(!i_wb_we)&&(i_wb_addr[1:0] == 2'b00))
		begin
			// A local read that doesn't touch the device, so leave
			// the device in its current state
			o_wb_stall <= 1'b0;
			o_wb_ack <= 1'b1;
			o_wb_data <= { write_in_progress,
					dirty_sector, spi_busy,
					~write_protect,
					quad_mode_enabled,
					{(29-ADDRESS_WIDTH){1'b0}},
					erased_sector, 14'h000 };
		end else if(((i_wb_ctrl_stb)||(i_wb_data_stb)))
		begin // Need to release the device from quad mode for all else
			o_wb_ack   <= 1'b0;
			o_wb_stall <= 1'b1;
			spi_wr <= 1'b1;
			spi_len <= 2'b11;
			spi_in <= 32'h00;
			state <= `WBQSPI_WBDECODE;
		end
	end else if (state == `WBQSPI_WBDECODE)
	begin
		// We were in quad SPI read mode, and had to get out.
		// Now we've got a command (not data read) to read and
		// execute.  Accomplish what we would've done while in the
		// IDLE state here, save only that we don't have to worry
		// about data reads, and we need to operate on a stored
		// version of the bus command
		o_wb_stall <= 1'b1;
		o_wb_ack <= 1'b0;
		spi_wr <= 1'b0; // Keep the port idle, unless told otherwise
		spi_hold <= 1'b0;
		spi_spd <= 1'b0;
		spi_dir <= 1'b0;
		spif_req<= (spif_req) && (i_wb_cyc);
		if ((!spi_busy)&&(o_qspi_cs_n)&&(!spi_wr)) // only in full idle ...
		begin
			// Data register access
			if (!spif_ctrl)
			begin
				if ((OPT_READ_ONLY)&&(spif_cmd)) // Request to write a page
				begin
					o_wb_ack <= spif_req;
					o_wb_stall <= 1'b0;
					state <= `WBQSPI_IDLE;
				end else if (spif_cmd)
				begin
					if((!write_protect)&&(!write_in_progress))
					begin // 00
						spi_wr <= 1'b1;
						spi_len <= 2'b00; // 8 bits
						// Send a write enable command
						spi_in <= { 8'h06, 24'h00 };
						state <= `WBQSPI_WEN;
	
						o_wb_ack <= 1'b0;
						o_wb_stall <= 1'b1;
					end else if (write_protect)
					begin // whether or not write-in_progress ...
						// Do nothing on a write protect
						// violation
						//
						o_wb_ack <= spif_req;
						o_wb_stall <= 1'b0;
						state <= `WBQSPI_IDLE;
					end else begin // write is in progress, wait
						// for it to complete
						state <= `WBQSPI_WAIT_WIP_CLEAR;
						o_wb_ack <= 1'b0;
						o_wb_stall <= 1'b1;
					end
				// end else if (!write_in_progress) // always true
				// but ... we wouldn't get here on a normal read access
				end else begin
					// Something's wrong, we should never
					//   get here
					// Attempt to go to idle to recover
					state <= `WBQSPI_IDLE;
				end
			end else if ((OPT_READ_ONLY)&&(spif_ctrl)&&(spif_cmd))
			begin
				o_wb_ack   <= spif_req;
				o_wb_stall <= 1'b0;
				state <= `WBQSPI_IDLE;
			end else if ((spif_ctrl)&&(spif_cmd)) begin
				o_wb_stall <= 1'b1;
				case(spif_addr[1:0])
				2'b00: begin // Erase command register
					o_wb_ack   <= spif_req;
					o_wb_stall <= 1'b0;
					state <= `WBQSPI_IDLE;
					write_protect <= ~spif_data[28];
					// Are we commanding an erase?
					// We're in read mode, writes cannot
					// be in progress, so ...
					if (spif_data[31]) // Command an erase
					begin
						// Since we're not going back
						// to IDLE, we must stall the
						// bus here
						o_wb_stall <= 1'b1;
						spi_wr <= 1'b1;
						spi_len <= 2'b00;
						// Send a write enable command
						spi_in <= { 8'h06, 24'h00 };
						state <= `WBQSPI_ERASE_CMD;
					end end
				2'b01: begin
					// Write the configuration register
					o_wb_ack <= spif_req;
					o_wb_stall <= 1'b1;

					// Need to send a write enable command first
					spi_wr <= 1'b1;
					spi_len <= 2'b00; // 8 bits
					// Send a write enable command
					spi_in <= { 8'h06, 24'h00 };
					state <= `WBQSPI_WRITE_CONFIG;
					end
				2'b10: begin
					// Write the status register
					o_wb_ack <= spif_req; // Ack immediately
					o_wb_stall <= 1'b1; // Stall other cmds
					// Need to send a write enable command first
					spi_wr <= 1'b1;
					spi_len <= 2'b00; // 8 bits
					// Send a write enable command
					spi_in <= { 8'h06, 24'h00 };
					state <= `WBQSPI_WRITE_STATUS;
					end
				2'b11: begin // Write the ID register??? makes no sense
					o_wb_ack <= spif_req;
					o_wb_stall <= 1'b0;
					state <= `WBQSPI_IDLE;
					end
				endcase
			end else begin // on (!spif_we)
				case(spif_addr[1:0])
				2'b00: begin // Read local register
					// Nonsense case--would've done this
					// already
					state <= `WBQSPI_IDLE;
					o_wb_ack <= spif_req;
					o_wb_stall <= 1'b0;
					end
				2'b01: begin // Read configuration register
					state <= `WBQSPI_READ_CONFIG;
					spi_wr <= 1'b1;
					spi_len <= 2'b01;
					spi_in <= { 8'h35, 24'h00};

					o_wb_ack <= 1'b0;
					o_wb_stall <= 1'b1;
					end
				2'b10: begin // Read status register
					state <= `WBQSPI_READ_STATUS;
					spi_wr <= 1'b1;
					spi_len <= 2'b01; // 8 bits out, 8 bits in
					spi_in <= { 8'h05, 24'h00};

					o_wb_ack <= 1'b0;
					o_wb_stall <= 1'b1;
					end
				2'b11: begin // Read ID register
					state <= `WBQSPI_READ_ID_CMD;
					spi_wr <= 1'b1;
					spi_len <= 2'b00;
					spi_in <= { 8'h9f, 24'h00};

					o_wb_ack <= 1'b0;
					o_wb_stall <= 1'b1;
					end
				endcase
			end
		end
//
//
//	READ DATA section: for both data and commands
//
	end else if (state == `WBQSPI_RD_DUMMY)
	begin
		o_wb_ack   <= 1'b0;
		o_wb_stall <= 1'b1;

		spi_wr <= 1'b1; // Non-stop
		// Need to read one byte of dummy data,
		// just to consume 8 clocks
		spi_in <= { 8'h00, 24'h00 };
		spi_len <= 2'b00; // Read 8 bits
		spi_spd <= 1'b0;
		spi_hold <= 1'b0;
		spif_req<= (spif_req) && (i_wb_cyc);
		
		if ((!spi_busy)&&(!o_qspi_cs_n))
			// Our command was accepted
			state <= `WBQSPI_READ_CMD;
	end else if (state == `WBQSPI_QRD_ADDRESS)
	begin
		// We come in here immediately upon issuing a QRD read
		// command (8-bits), but we have to pause to give the
		// address (24-bits) and mode (8-bits) in quad speed.
		o_wb_ack   <= 1'b0;
		o_wb_stall <= 1'b1;

		spi_wr <= 1'b1; // Non-stop
		spi_in <= { w_spif_addr, 8'ha0 };
		spi_len <= 2'b10; // Write address, not mode byte
		spi_spd <= 1'b1;
		spi_dir <= 1'b0; // Still writing
		spi_hold <= 1'b0;
		spif_req<= (spif_req) && (i_wb_cyc);
		
		if ((!spi_busy)&&(spi_spd))
			// Our command was accepted
			state <= `WBQSPI_QRD_DUMMY;
	end else if (state == `WBQSPI_QRD_DUMMY)
	begin
		o_wb_ack   <= 1'b0;
		o_wb_stall <= 1'b1;

		spi_wr <= 1'b1; // Non-stop
		spi_in <= { 8'ha0, 24'h00 }; // Mode byte, then 2 bytes dummy
		spi_len <= 2'b10; // Write 24 bits
		spi_spd <= 1'b1;
		spi_dir <= 1'b0; // Still writing
		spi_hold <= 1'b0;
		spif_req<= (spif_req) && (i_wb_cyc);
		
		if ((!spi_busy)&&(spi_in[31:28] == 4'ha))
			// Our command was accepted
			state <= `WBQSPI_READ_CMD;
	end else if (state == `WBQSPI_READ_CMD)
	begin // Issue our first command to read 32 bits.
		o_wb_ack   <= 1'b0;
		o_wb_stall <= 1'b1;

		spi_wr <= 1'b1;
		spi_in <= { 8'hff, 24'h00 }; // Empty
		spi_len <= 2'b11; // Read 32 bits
		spi_dir <= 1'b1; // Now reading
		spi_hold <= 1'b0;
		spif_req<= (spif_req) && (i_wb_cyc);
		if ((spi_valid)&&(spi_len == 2'b11))
			state <= `WBQSPI_READ_DATA;
	end else if (state == `WBQSPI_READ_DATA)
	begin
		// Pipelined read support
		spi_wr <=((i_wb_data_stb)&&(!i_wb_we)&&(i_wb_addr== (spif_addr+1)))&&(spif_req);
		spi_in <= 32'h00;
		spi_len <= 2'b11;
		// Don't adjust the speed here, it was set in the setup
		spi_dir <= 1'b1;	// Now we get to read
		// Don't let the device go to idle until the bus cycle ends.
		//	This actually prevents a *really* nasty race condition,
		//	where the strobe comes in after the lower level device
		//	has decided to stop waiting.  The write is then issued,
		//	but no one is listening.  By leaving the device open,
		//	the device is kept in a state where a valid strobe
		//	here will be useful.  Of course, we don't accept
		//	all commands, just reads.  Further, the strobe needs
		//	to be high for two clocks cycles without changing
		//	anything on the bus--one for us to notice it and pull
		//	our head out of the sand, and a second for whoever
		//	owns the bus to realize their command went through.
		spi_hold <= 1'b1;
		spif_req<= (spif_req) && (i_wb_cyc);
		if ((spi_valid)&&(!spi_in[31]))
		begin // Single pulse acknowledge and write data out
			o_wb_ack <= spif_req;
			o_wb_stall <= (!spi_wr);
			// adjust endian-ness to match the PC
			o_wb_data <= spi_out; 
			state <= (spi_wr)?`WBQSPI_READ_DATA
				: ((spi_spd) ? `WBQSPI_WAIT_TIL_RDIDLE : `WBQSPI_WAIT_TIL_IDLE);
			spif_req <= spi_wr;
			spi_hold <= (!spi_wr);
			if (spi_wr)
				spif_addr <= i_wb_addr;
		end else if ((!spif_req)||(!i_wb_cyc))
		begin // FAIL SAFE: If the bus cycle ends, forget why we're
			// here, just go back to idle
			state <= ((spi_spd) ? `WBQSPI_WAIT_TIL_RDIDLE : `WBQSPI_WAIT_TIL_IDLE);
			spi_hold <= 1'b0;
			o_wb_ack <= 1'b0;
			o_wb_stall <= 1'b1;
		end else begin
			o_wb_ack <= 1'b0;
			o_wb_stall <= 1'b1;
		end
	end else if (state == `WBQSPI_WAIT_TIL_RDIDLE)
	begin // Wait 'til idle, but then go to fast read idle instead of full
		spi_wr     <= 1'b0;	// idle
		spi_hold   <= 1'b0;
		o_wb_stall <= 1'b1;
		o_wb_ack   <= 1'b0;
		spif_req   <= 1'b0;
		if ((!spi_busy)&&(o_qspi_cs_n)&&(!spi_wr)) // Wait for a full
		begin // clearing of the SPI port before moving on
			state <= `WBQSPI_RDIDLE;
			o_wb_stall <= 1'b0; 
			o_wb_ack   <= 1'b0;// Shouldn't be acking anything here
		end
	end else if (state == `WBQSPI_READ_ID_CMD)
	begin // We came into here immediately after issuing a 0x9f command
		// Now we need to read 32 bits of data.  Result should be
		// 0x0102154d (8'h manufacture ID, 16'h device ID, followed
		// by the number of extended bytes available 8'h4d).
		o_wb_ack <= 1'b0;
		o_wb_stall<= 1'b1;

		spi_wr <= 1'b1; // No data to send, but need four bytes, since
		spi_len <= 2'b11; // 32 bits of data are ... useful
		spi_in <= 32'h00; // Irrelevant
		spi_spd <= 1'b0; // Slow speed
		spi_dir <= 1'b1; // Reading
		spi_hold <= 1'b0;
		spif_req <= (spif_req) && (i_wb_cyc);
		if ((!spi_busy)&&(!o_qspi_cs_n)&&(spi_len == 2'b11))
			// Our command was accepted, now go read the result
			state <= `WBQSPI_READ_ID;
	end else if (state == `WBQSPI_READ_ID)
	begin
		o_wb_ack <= 1'b0; // Assuming we're still waiting
		o_wb_stall <= 1'b1;

		spi_wr <= 1'b0; // No more writes, we've already written the cmd
		spi_hold <= 1'b0;
		spif_req <= (spif_req) && (i_wb_cyc);

		// Here, we just wait until the result comes back
		// The problem is, the result may be the previous result.
		// So we use spi_len as an indicator
		spi_len <= 2'b00;
		if((spi_valid)&&(spi_len==2'b00))
		begin // Put the results out as soon as possible
			o_wb_data <= spi_out[31:0];
			o_wb_ack <= spif_req;
			spif_req <= 1'b0;
		end else if ((!spi_busy)&&(o_qspi_cs_n))
		begin
			state <= `WBQSPI_IDLE;
			o_wb_stall <= 1'b0;
		end
	end else if (state == `WBQSPI_READ_STATUS)
	begin // We enter after the command has been given, for now just
		// read and return
		spi_wr <= 1'b0;
		o_wb_ack <= 1'b0;
		spi_hold <= 1'b0;
		spif_req <= (spif_req) && (i_wb_cyc);
		if (spi_valid)
		begin
			o_wb_ack <= spif_req;
			o_wb_stall <= 1'b1;
			spif_req <= 1'b0;
			last_status <= spi_out[7:0];
			write_in_progress <= spi_out[0];
			if (spif_addr[1:0] == 2'b00) // Local read, checking
			begin // status, 'cause we're writing
				o_wb_data <= { spi_out[0],
					dirty_sector, spi_busy,
					~write_protect,
					quad_mode_enabled,
					{(29-ADDRESS_WIDTH){1'b0}},
					erased_sector, 14'h000 };
			end else begin
				o_wb_data <= { 24'h00, spi_out[7:0] };
			end
		end

		if ((!spi_busy)&&(!spi_wr))
			state <= `WBQSPI_IDLE;
	end else if (state == `WBQSPI_READ_CONFIG)
	begin // We enter after the command has been given, for now just
		// read and return
		spi_wr <= 1'b0;
		o_wb_ack <= 1'b0;
		o_wb_stall <= 1'b1;
		spi_hold <= 1'b0;
		spif_req <= (spif_req) && (i_wb_cyc);

		if (spi_valid)
		begin
			o_wb_data <= { 24'h00, spi_out[7:0] };
			quad_mode_enabled <= spi_out[1];
		end

		if ((!spi_busy)&&(!spi_wr))
		begin
			state <= `WBQSPI_IDLE;
			o_wb_ack   <= spif_req;
			o_wb_stall <= 1'b0;
			spif_req <= 1'b0;
		end

//
//
//	Write/erase data section
//
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_WAIT_WIP_CLEAR))
	begin
		o_wb_stall <= 1'b1;
		o_wb_ack   <= 1'b0;
		spi_wr <= 1'b0;
		spif_req<= (spif_req) && (i_wb_cyc);
		if (!spi_busy)
		begin
			spi_wr   <= 1'b1;
			spi_in   <= { 8'h05, 24'h0000 };
			spi_hold <= 1'b1;
			spi_len  <= 2'b01; // 16 bits write, so we can read 8
			state <= `WBQSPI_CHECK_WIP_CLEAR;
			spi_spd  <= 1'b0; // Slow speed
			spi_dir  <= 1'b0;
		end
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_CHECK_WIP_CLEAR))
	begin
		o_wb_stall <= 1'b1;
		o_wb_ack   <= 1'b0;
		// Repeat as often as necessary until we are clear
		spi_wr <= 1'b1;
		spi_in <= 32'h0000; // Values here are actually irrelevant
		spi_hold <= 1'b1;
		spi_len <= 2'b00; // One byte at a time
		spi_spd  <= 1'b0; // Slow speed
		spi_dir  <= 1'b0;
		spif_req<= (spif_req) && (i_wb_cyc);
		if ((spi_valid)&&(!spi_out[0]))
		begin
			state <= `WBQSPI_CHECK_WIP_DONE;
			spi_wr   <= 1'b0;
			spi_hold <= 1'b0;
			write_in_progress <= 1'b0;
			last_status <= spi_out[7:0];
		end
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_CHECK_WIP_DONE))
	begin
		o_wb_stall <= 1'b1;
		o_wb_ack   <= 1'b0;
		// Let's let the SPI port come back to a full idle,
		// and the chip select line go low before continuing
		spi_wr   <= 1'b0;
		spi_len  <= 2'b00;
		spi_hold <= 1'b0;
		spi_spd  <= 1'b0; // Slow speed
		spi_dir  <= 1'b0;
		spif_req<= (spif_req) && (i_wb_cyc);
		if ((o_qspi_cs_n)&&(!spi_busy)) // Chip select line is high, we can continue
		begin
			spi_wr   <= 1'b0;
			spi_hold <= 1'b0;

			casez({ spif_cmd, spif_ctrl, spif_addr[1:0] })
			4'b00??: begin // Read data from ... somewhere
				spi_wr     <= 1'b1;	// Write cmd to device
				if (quad_mode_enabled)
				begin
					spi_in <= { 8'heb, w_spif_addr };
					state <= `WBQSPI_QRD_ADDRESS;
					// spi_len    <= 2'b00; // single byte, cmd only
				end else begin
					spi_in <= { 8'h0b, w_spif_addr };
					state <= `WBQSPI_RD_DUMMY;
					spi_len    <= 2'b11; // Send cmd and addr
				end end
			4'b10??: begin // Write data to ... anywhere
				spi_wr <= 1'b1;
				spi_len <= 2'b00; // 8 bits
				// Send a write enable command
				spi_in <= { 8'h06, 24'h00 };
				state <= `WBQSPI_WEN;
				end
			4'b0110: begin // Read status register
				state <= `WBQSPI_READ_STATUS;
				spi_wr <= 1'b1;
				spi_len <= 2'b01; // 8 bits out, 8 bits in
				spi_in <= { 8'h05, 24'h00};
				end
			4'b0111: begin
				state <= `WBQSPI_READ_ID_CMD;
				spi_wr <= 1'b1;
				spi_len <= 2'b00;
				spi_in <= { 8'h9f, 24'h00};
				end
			default: begin //
				o_wb_stall <= 1'b1;
				o_wb_ack <= spif_req;
				state <= `WBQSPI_WAIT_TIL_IDLE;
				end
			endcase
		// spif_cmd   <= i_wb_we;
		// spif_addr  <= i_wb_addr;
		// spif_data  <= i_wb_data;
		// spif_ctrl  <= (i_wb_ctrl_stb)&&(!i_wb_data_stb);
		// spi_wr <= 1'b0; // Keep the port idle, unless told otherwise
		end
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_WEN))
	begin // We came here after issuing a write enable command
		spi_wr <= 1'b0;
		o_wb_ack <= 1'b0;
		o_wb_stall <= 1'b1;
		spif_req<= (spif_req) && (i_wb_cyc);
		if ((!spi_busy)&&(o_qspi_cs_n)&&(!spi_wr)) // Let's come to a full stop
			state <= (quad_mode_enabled)?`WBQSPI_QPP:`WBQSPI_PP;
			// state <= `WBQSPI_PP;
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_PP))
	begin // We come here under a full stop / full port idle mode
		// Issue our command immediately
		spi_wr <= 1'b1;
		spi_in <= { 8'h02, w_spif_addr };
		spi_len <= 2'b11;
		spi_hold <= 1'b1;
		spi_spd  <= 1'b0;
		spi_dir  <= 1'b0; // Writing
		spif_req<= (spif_req) && (i_wb_cyc);

		// Once we get busy, move on
		if (spi_busy)
			state <= `WBQSPI_WR_DATA;
		if (spif_sector == erased_sector)
			dirty_sector <= 1'b1;
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_QPP))
	begin // We come here under a full stop / full port idle mode
		// Issue our command immediately
		spi_wr <= 1'b1;
		spi_in <= { 8'h32, w_spif_addr };
		spi_len <= 2'b11;
		spi_hold <= 1'b1;
		spi_spd  <= 1'b0;
		spi_dir  <= 1'b0; // Writing
		spif_req<= (spif_req) && (i_wb_cyc);

		// Once we get busy, move on
		if (spi_busy)
		begin
			// spi_wr is irrelevant here ...
			// Set the speed value once, but wait til we get busy
			// to do so.
			spi_spd <= 1'b1;
			state <= `WBQSPI_WR_DATA;
		end
		if (spif_sector == erased_sector)
			dirty_sector <= 1'b1;
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_WR_DATA))
	begin
		o_wb_stall <= 1'b1;
		o_wb_ack   <= 1'b0;
		spi_wr   <= 1'b1; // write without waiting
		spi_in   <= spif_data;
		spi_len  <= 2'b11; // Write 4 bytes
		spi_hold <= 1'b1;
		if (!spi_busy)
		begin
			o_wb_ack <= spif_req; // Ack when command given
			state <= `WBQSPI_WR_BUS_CYCLE;
		end
		spif_req<= (spif_req) && (i_wb_cyc);
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_WR_BUS_CYCLE))
	begin
		o_wb_ack <= 1'b0; // Turn off our ack and stall flags
		o_wb_stall <= 1'b1;
		spi_wr <= 1'b0;
		spi_hold <= 1'b1;
		write_in_progress <= 1'b1;
		spif_req<= (spif_req) && (i_wb_cyc);
		if (!i_wb_cyc)
		begin
			state <= `WBQSPI_WAIT_TIL_IDLE;
			spi_hold <= 1'b0;
		end else if (spi_wr)
		begin // Give the SPI a chance to get busy on the last write
			// Do nothing here.
		end else if ((spif_req)&&(i_wb_data_stb)&&(i_wb_we)
				&&(i_wb_addr == (spif_addr+1))
				&&(i_wb_addr[(AW-1):6]==spif_addr[(AW-1):6]))
		begin
			spif_cmd  <= 1'b1;
			spif_data <= i_wb_data;
			spif_addr <= i_wb_addr;
			spif_ctrl  <= 1'b0;
			spif_req<= 1'b1;
			// We'll keep the bus stalled on this request
			// for a while
			state <= `WBQSPI_WR_DATA;
			o_wb_ack   <= 1'b0;
			o_wb_stall <= 1'b0;
		end else if ((i_wb_data_stb|i_wb_ctrl_stb)&&(!o_wb_ack)) // Writing out of bounds
		begin
			spi_hold <= 1'b0;
			spi_wr   <= 1'b0;
			state <= `WBQSPI_WAIT_TIL_IDLE;
		end // Otherwise we stay here
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_WRITE_CONFIG))
	begin // We enter immediately after commanding a WEN
		o_wb_ack   <= 1'b0;
		o_wb_stall <= 1'b1;

		spi_len <= 2'b10;
		spi_in <= { 8'h01, last_status, spif_data[7:0], 8'h00 };
		spi_wr <= 1'b0;
		spi_hold <= 1'b0;
		spif_req <= (spif_req) && (i_wb_cyc);
		if ((!spi_busy)&&(!spi_wr))
		begin
			spi_wr <= 1'b1;
			state <= `WBQSPI_WAIT_TIL_IDLE;
			write_in_progress <= 1'b1;
			quad_mode_enabled <= spif_data[1];
		end
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_WRITE_STATUS))
	begin // We enter immediately after commanding a WEN
		o_wb_ack   <= 1'b0;
		o_wb_stall <= 1'b1;

		spi_len <= 2'b01;
		spi_in <= { 8'h01, spif_data[7:0], 16'h00 };
		// last_status <= i_wb_data[7:0]; // We'll read this in a moment
		spi_wr <= 1'b0;
		spi_hold <= 1'b0;
		spif_req <= (spif_req) && (i_wb_cyc);
		if ((!spi_busy)&&(!spi_wr))
		begin
			spi_wr <= 1'b1;
			last_status <= spif_data[7:0];
			write_in_progress <= 1'b1;
			if(((last_status[6])||(last_status[5]))
				&&((!spif_data[6])&&(!spif_data[5])))
				state <= `WBQSPI_CLEAR_STATUS;
			else
				state <= `WBQSPI_WAIT_TIL_IDLE;
		end
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_ERASE_CMD))
	begin // Know that WIP is clear on entry, WEN has just been commanded
		spi_wr     <= 1'b0;
		o_wb_ack   <= 1'b0;
		o_wb_stall <= 1'b1;
		spi_hold   <= 1'b0;
		spi_spd <= 1'b0;
		spi_dir <= 1'b0;
		spif_req <= (spif_req) && (i_wb_cyc);

		// Here's the erase command
		spi_in <= { 8'hd8, 2'h0, spif_data[19:14], 14'h000, 2'b00 };
		spi_len <= 2'b11; // 32 bit write
		// together with setting our copy of the WIP bit
		write_in_progress <= 1'b1;
		// keeping track of which sector we just erased
		erased_sector <= spif_data[(AW-1):14];
		// and marking this erase sector as no longer dirty
		dirty_sector <= 1'b0;

		// Wait for a full stop before issuing this command
		if ((!spi_busy)&&(!spi_wr)&&(o_qspi_cs_n))
		begin // When our command is accepted, move to the next state
			spi_wr <= 1'b1;
			state <= `WBQSPI_ERASE_BLOCK;
		end
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_ERASE_BLOCK))
	begin
		spi_wr     <= 1'b0;
		spi_hold   <= 1'b0;
		o_wb_stall <= 1'b1;
		o_wb_ack   <= 1'b0;
		spif_req <= (spif_req) && (i_wb_cyc);
		// When the port clears, we can head back to idle
		//	No ack necessary, we ackd before getting
		//	here.
		if ((!spi_busy)&&(!spi_wr))
			state <= `WBQSPI_IDLE;
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_CLEAR_STATUS))
	begin // Issue a clear status command
		spi_wr <= 1'b1;
		spi_hold <= 1'b0;
		spi_len <= 2'b00; // 8 bit command
		spi_in <= { 8'h30, 24'h00 };
		spi_spd <= 1'b0;
		spi_dir <= 1'b0;
		last_status[6:5] <= 2'b00;
		spif_req <= (spif_req) && (i_wb_cyc);
		if ((spi_wr)&&(!spi_busy))
			state <= `WBQSPI_WAIT_TIL_IDLE;
	end else if ((!OPT_READ_ONLY)&&(state == `WBQSPI_IDLE_CHECK_WIP))
	begin // We are now in read status register mode

		// No bus commands have (yet) been given
		o_wb_stall <= 1'b1;
		o_wb_ack   <= 1'b0;
		spif_req <= (spif_req) && (i_wb_cyc);

		// Stay in this mode unless/until we get a command, or
		// 	the write is over
		spi_wr <= (((!i_wb_cyc)||((!i_wb_data_stb)&&(!i_wb_ctrl_stb)))
				&&(write_in_progress));
		spi_len <= 2'b00; // 8 bit reads
		spi_spd <= 1'b0;  // SPI, not quad
		spi_dir <= 1'b1;  // Read
		if (spi_valid)
		begin
			write_in_progress <= spi_out[0];
			if ((!spi_out[0])&&(write_in_progress))
				o_interrupt <= 1'b1;
		end else
			o_interrupt <= 1'b0;

		if ((!spi_wr)&&(!spi_busy)&&(o_qspi_cs_n))
		begin // We can now go to idle and process a command
			o_wb_stall <= 1'b0;
			o_wb_ack   <= 1'b0;
			state <= `WBQSPI_IDLE;
		end
	end else // if (state == `WBQSPI_WAIT_TIL_IDLE) or anything else
	begin
		spi_wr     <= 1'b0;
		spi_hold   <= 1'b0;
		o_wb_stall <= 1'b1;
		o_wb_ack   <= 1'b0;
		spif_req   <= 1'b0;
		if ((!spi_busy)&&(o_qspi_cs_n)&&(!spi_wr)) // Wait for a full
		begin // clearing of the SPI port before moving on
			state <= `WBQSPI_IDLE;
			o_wb_stall <= 1'b0; 
			o_wb_ack   <= 1'b0; // Shouldn't be acking anything here
		end
	end
	end

	// Command and control during the reset sequence
	assign	o_qspi_cs_n = (spif_override)?alt_cmd :w_qspi_cs_n;
	assign	o_qspi_sck  = (spif_override)?alt_ctrl:w_qspi_sck;
	assign	o_qspi_mod  = (spif_override)?  2'b01 :w_qspi_mod;
	assign	o_qspi_dat  = (spif_override)?  4'b00 :w_qspi_dat;
endmodule
