/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/* Double-port RAM with double write-capable port */

module softusb_dpram #(
	parameter depth = 11, /* < log2 of the capacity in words */
	parameter width = 32,
	parameter initfile = ""
) (
	input clk,
	input clk2,

	input [depth-1:0] a,
	input we,
	input [width-1:0] di,
	output reg [width-1:0] do,

	input ce2,
	input [depth-1:0] a2,
	input we2,
	input [width-1:0] di2,
	output reg [width-1:0] do2
);

reg [width-1:0] ram[0:(1 << depth)-1];

// synthesis translate_off
initial if(initfile != "") $readmemh(initfile, ram);
// synthesis translate_on

always @(posedge clk) begin
	if(we)
		ram[a] <= di;
	else
		do <= ram[a];
end

always @(posedge clk2) begin
	if(ce2) begin
		if(we2)
			ram[a2] <= di2;
		else
			do2 <= ram[a2];
	end
end

endmodule
/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module softusb_filter(
	input usb_clk,

	input rcv,
	input vp,
	input vm,

	output reg rcv_s,
	output reg vp_s,
	output reg vm_s
);

reg rcv_s0;
reg vp_s0;
reg vm_s0;
reg rcv_s1;
reg vp_s1;
reg vm_s1;

/* synchronizer */
always @(posedge usb_clk) begin
	rcv_s0 <= rcv;
	vp_s0 <= vp;
	vm_s0 <= vm;
	rcv_s <= rcv_s0;
	vp_s <= vp_s0;
	vm_s <= vm_s0;
end

/* glitch filter */
/*reg rcv_s2;
reg vp_s2;
reg vm_s2;
always @(posedge usb_clk) begin
	rcv_s2 <= rcv_s1;
	vp_s2 <= vp_s1;
	vm_s2 <= vm_s1;

	if(rcv_s2 == rcv_s1)
		rcv_s <= rcv_s2;
	if(vp_s2 == vp_s1)
		vp_s <= vp_s2;
	if(vm_s2 == vm_s1)
		vm_s <= vm_s2;
end*/

endmodule
/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module softusb_hostif #(
	parameter csr_addr = 4'h0
) (
	input sys_clk,
	input sys_rst,

	input usb_clk,
	output reg usb_rst,

	input [13:0] csr_a,
	input csr_we,
	input [31:0] csr_di,
	output reg [31:0] csr_do,

	output irq,

	input io_we,
	input [5:0] io_a
);

wire csr_selected = csr_a[13:10] == csr_addr;

reg usb_rst0;

always @(posedge sys_clk) begin
	if(sys_rst) begin
		usb_rst0 <= 1'b1;
		csr_do <= 1'b0;
	end else begin
		csr_do <= 1'b0;
		if(csr_selected) begin
			if(csr_we)
				usb_rst0 <= csr_di[0];
			csr_do <= usb_rst0;
		end
	end
end

/* Synchronize USB Reset to the USB clock domain */
reg usb_rst1;

always @(posedge usb_clk) begin
	usb_rst1 <= usb_rst0;
	usb_rst <= usb_rst1;
end

/* Generate IRQs */

reg irq_flip;
always @(posedge usb_clk) begin
	if(usb_rst)
		irq_flip <= 1'b0;
	else if(io_we && (io_a == 6'h15))
		irq_flip <= ~irq_flip;
end

reg irq_flip0;
reg irq_flip1;
reg irq_flip2;

always @(posedge sys_clk) begin
	irq_flip0 <= irq_flip;
	irq_flip1 <= irq_flip0;
	irq_flip2 <= irq_flip1;
end

assign irq = irq_flip1 != irq_flip2;

endmodule

/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module softusb_navre #(
	parameter pmem_width = 11, /* < in 16-bit instructions */
	parameter dmem_width = 13  /* < in bytes */
) (
	input clk,
	input rst,

	output reg pmem_ce,
	output [pmem_width-1:0] pmem_a,
	input [15:0] pmem_d,

	output reg dmem_we,
	output reg [dmem_width-1:0] dmem_a,
	input [7:0] dmem_di,
	output reg [7:0] dmem_do,

	output reg io_re,
	output reg io_we,
	output [5:0] io_a,
	output [7:0] io_do,
	input [7:0] io_di
);

/* Register file */
reg [pmem_width-1:0] PC;
reg [7:0] GPR[0:23];
reg [15:0] U;	/* < R24-R25 */
reg [15:0] pX;	/* < R26-R27 */
reg [15:0] pY;	/* < R28-R29 */
reg [15:0] pZ;	/* < R30-R31 */
reg T, H, S, V, N, Z, C;

/* Stack */
reg [7:0] io_sp;
reg [15:0] SP;
reg push;
reg pop;
always @(posedge clk) begin
	if(rst) begin
		io_sp <= 8'd0;
`ifndef REGRESS
		SP <= 16'd0;
`endif
	end else begin
		io_sp <= io_a[0] ? SP[7:0] : SP[15:8];
		if((io_a == 6'b111101) | (io_a == 6'b111110)) begin
			if(io_we) begin
				if(io_a[0])
					SP[7:0] <= io_do;
				else
					SP[15:8] <= io_do;
			end
		end
		if(push)
			SP <= SP - 16'd1;
		if(pop)
			SP <= SP + 16'd1;
	end
end

/* I/O mapped registers */

parameter IO_SEL_EXT	= 2'd0;
parameter IO_SEL_STACK	= 2'd1;
parameter IO_SEL_SREG	= 2'd2;

reg [1:0] io_sel;
always @(posedge clk) begin
	if(rst)
		io_sel <= IO_SEL_EXT;
	else begin
		case(io_a)
			6'b111101,
			6'b111110: io_sel <= IO_SEL_STACK;
			6'b111111: io_sel <= IO_SEL_SREG;
			default: io_sel <= IO_SEL_EXT;
		endcase
	end
end

/* Register operations */
wire immediate = (pmem_d[14]
	| (pmem_d[15:12] == 4'b0011))		/* CPI */
	& (pmem_d[15:10] != 6'b111111)		/* SBRC - SBRS */
	& (pmem_d[15:10] != 6'b111110);		/* BST - BLD */
reg lpm_en;
wire [4:0] Rd = lpm_en ? 5'd0 : {immediate | pmem_d[8], pmem_d[7:4]};
wire [4:0] Rr = {pmem_d[9], pmem_d[3:0]};
wire [7:0] K = {pmem_d[11:8], pmem_d[3:0]};
wire [2:0] b = pmem_d[2:0];
wire [11:0] Kl = pmem_d[11:0];
wire [6:0] Ks = pmem_d[9:3];
wire [1:0] Rd16 = pmem_d[5:4];
wire [5:0] K16 = {pmem_d[7:6], pmem_d[3:0]};
wire [5:0] q = {pmem_d[13], pmem_d[11:10], pmem_d[2:0]};

wire [7:0] GPR_Rd8 = GPR[Rd];
wire [7:0] GPR_Rr8 = GPR[Rr];
reg [7:0] GPR_Rd;
always @(*) begin
	case(Rd)
		default: GPR_Rd = GPR_Rd8;
		5'd24: GPR_Rd = U[7:0];
		5'd25: GPR_Rd = U[15:8];
		5'd26: GPR_Rd = pX[7:0];
		5'd27: GPR_Rd = pX[15:8];
		5'd28: GPR_Rd = pY[7:0];
		5'd29: GPR_Rd = pY[15:8];
		5'd30: GPR_Rd = pZ[7:0];
		5'd31: GPR_Rd = pZ[15:8];
	endcase
end
reg [7:0] GPR_Rr;
always @(*) begin
	case(Rr)
		default: GPR_Rr = GPR_Rr8;
		5'd24: GPR_Rr = U[7:0];
		5'd25: GPR_Rr = U[15:8];
		5'd26: GPR_Rr = pX[7:0];
		5'd27: GPR_Rr = pX[15:8];
		5'd28: GPR_Rr = pY[7:0];
		5'd29: GPR_Rr = pY[15:8];
		5'd30: GPR_Rr = pZ[7:0];
		5'd31: GPR_Rr = pZ[15:8];
	endcase
end
wire GPR_Rd_b = GPR_Rd[b];

reg [15:0] GPR_Rd16;
always @(*) begin
	case(Rd16)
		2'd0: GPR_Rd16 = U;
		2'd1: GPR_Rd16 = pX;
		2'd2: GPR_Rd16 = pY;
		2'd3: GPR_Rd16 = pZ;
	endcase
end

/* Memorize values to support 16-bit instructions */
reg regmem_ce;

reg [4:0] Rd_r;
reg [7:0] GPR_Rd_r;
always @(posedge clk) begin
	if(regmem_ce)
		Rd_r <= Rd; /* < control with regmem_ce */
	GPR_Rd_r <= GPR_Rd; /* < always loaded */
end

/* PC */

reg [3:0] pc_sel;

parameter PC_SEL_NOP		= 4'd0;
parameter PC_SEL_INC		= 4'd1;
parameter PC_SEL_KL		= 4'd2;
parameter PC_SEL_KS		= 4'd3;
parameter PC_SEL_DMEML		= 4'd4;
parameter PC_SEL_DMEMH		= 4'd6;
parameter PC_SEL_DEC		= 4'd7;
parameter PC_SEL_Z		= 4'd8;

always @(posedge clk) begin
	if(rst) begin
`ifndef REGRESS
		PC <= 0;
`endif
	end else begin
		case(pc_sel)
			PC_SEL_NOP:;
			PC_SEL_INC: PC <= PC + 1;
			// !!! WARNING !!! replace with PC <= PC + {{pmem_width-12{Kl[11]}}, Kl}; if pmem_width>12
			PC_SEL_KL: PC <= PC + Kl;
			PC_SEL_KS: PC <= PC + {{pmem_width-7{Ks[6]}}, Ks};
			PC_SEL_DMEML: PC[7:0] <= dmem_di;
			PC_SEL_DMEMH: PC[pmem_width-1:8] <= dmem_di;
			PC_SEL_DEC: PC <= PC - 1;
			PC_SEL_Z: PC <= pZ - 1;
		endcase
	end
end
reg pmem_selz;
assign pmem_a = rst ?
`ifdef REGRESS
	PC
`else
	0
`endif
	: (pmem_selz ? pZ[15:1] : PC + 1);

/* Load/store operations */
reg [3:0] dmem_sel;

parameter DMEM_SEL_UNDEFINED	= 3'bxxx;
parameter DMEM_SEL_X		= 4'd0;
parameter DMEM_SEL_XPLUS	= 4'd1;
parameter DMEM_SEL_XMINUS	= 4'd2;
parameter DMEM_SEL_YPLUS	= 4'd3;
parameter DMEM_SEL_YMINUS	= 4'd4;
parameter DMEM_SEL_YQ		= 4'd5;
parameter DMEM_SEL_ZPLUS	= 4'd6;
parameter DMEM_SEL_ZMINUS	= 4'd7;
parameter DMEM_SEL_ZQ		= 4'd8;
parameter DMEM_SEL_SP_R		= 4'd9;
parameter DMEM_SEL_SP_PCL	= 4'd10;
parameter DMEM_SEL_SP_PCH	= 4'd11;
parameter DMEM_SEL_PMEM		= 4'd12;

/* ALU */

reg normal_en;
reg lds_writeback;

wire [4:0] write_dest = lds_writeback ? Rd_r : Rd;

// synthesis translate_off
integer i_rst_regf;
// synthesis translate_on
reg [7:0] R;
reg writeback;
reg update_nsz;
reg change_z;
reg [15:0] R16;
reg mode16;
always @(posedge clk) begin
	R = 8'hxx;
	writeback = 1'b0;
	update_nsz = 1'b0;
	change_z = 1'b1;
	R16 = 16'hxxxx;
	mode16 = 1'b0;
	if(rst) begin
`ifndef REGRESS
		/*
		 * Not resetting the register file enables the use of more efficient
		 * distributed block RAM.
		 */
		// synthesis translate_off
		for(i_rst_regf=0;i_rst_regf<24;i_rst_regf=i_rst_regf+1)
			GPR[i_rst_regf] = 8'd0;
		U = 16'd0;
		pX = 16'd0;
		pY = 16'd0;
		pZ = 16'd0;
		// synthesis translate_on
		T = 1'b0;
		H = 1'b0;
		S = 1'b0;
		V = 1'b0;
		N = 1'b0;
		Z = 1'b0;
		C = 1'b0;
`endif
	end else begin
		if(normal_en) begin
			writeback = 1'b1;
			update_nsz = 1'b1;
			casex(pmem_d)
				16'b000x_11xx_xxxx_xxxx: begin
					/* ADD - ADC */
					{C, R} = GPR_Rd + GPR_Rr + (pmem_d[12] & C);
					H = (GPR_Rd[3] & GPR_Rr[3])|(GPR_Rr[3] & ~R[3])|(~R[3] & GPR_Rd[3]);
					V = (GPR_Rd[7] & GPR_Rr[7] & ~R[7])|(~GPR_Rd[7] & ~GPR_Rr[7] & R[7]);
				end
				16'b000x_10xx_xxxx_xxxx, /* subtract */
				16'b000x_01xx_xxxx_xxxx: /* compare  */ begin
					/* SUB - SBC / CP - CPC */
					{C, R} = GPR_Rd - GPR_Rr - (~pmem_d[12] & C);
					H = (~GPR_Rd[3] & GPR_Rr[3])|(GPR_Rr[3] & R[3])|(R[3] & ~GPR_Rd[3]);
					V = (GPR_Rd[7] & ~GPR_Rr[7] & ~R[7])|(~GPR_Rd[7] & GPR_Rr[7] & R[7]);
					if(~pmem_d[12])
						change_z = 1'b0;
					writeback = pmem_d[11];
				end
				16'b010x_xxxx_xxxx_xxxx, /* subtract */
				16'b0011_xxxx_xxxx_xxxx: /* compare  */ begin
					/* SUBI - SBCI / CPI */
					{C, R} = GPR_Rd - K - (~pmem_d[12] & C);
					H = (~GPR_Rd[3] & K[3])|(K[3] & R[3])|(R[3] & ~GPR_Rd[3]);
					V = (GPR_Rd[7] & ~K[7] & ~R[7])|(~GPR_Rd[7] & K[7] & R[7]);
					if(~pmem_d[12])
						change_z = 1'b0;
					writeback = pmem_d[14];
				end
				16'b0010_00xx_xxxx_xxxx: begin
					/* AND */
					R = GPR_Rd & GPR_Rr;
					V = 1'b0;
				end
				16'b0111_xxxx_xxxx_xxxx: begin
					/* ANDI */
					R = GPR_Rd & K;
					V = 1'b0;
				end
				16'b0010_10xx_xxxx_xxxx: begin
					/* OR */
					R = GPR_Rd | GPR_Rr;
					V = 1'b0;
				end
				16'b0110_xxxx_xxxx_xxxx: begin
					/* ORI */
					R = GPR_Rd | K;
					V = 1'b0;
				end
				16'b0010_01xx_xxxx_xxxx: begin
					/* EOR */
					R = GPR_Rd ^ GPR_Rr;
					V = 1'b0;
				end
				16'b1001_010x_xxxx_0000: begin
					/* COM */
					R = ~GPR_Rd;
					V = 1'b0;
					C = 1'b1;
				end
				16'b1001_010x_xxxx_0001: begin
					/* NEG */
					{C, R} = 8'h00 - GPR_Rd;
					H = R[3] | GPR_Rd[3];
					V = R == 8'h80;
				end
				16'b1001_010x_xxxx_0011: begin
					/* INC */
					R = GPR_Rd + 8'd1;
					V = R == 8'h80;
				end
				16'b1001_010x_xxxx_1010: begin
					/* DEC */
					R = GPR_Rd - 8'd1;
					V = R == 8'h7f;
				end
				16'b1001_010x_xxxx_011x: begin
					/* LSR - ROR */
					R = {pmem_d[0] & C, GPR_Rd[7:1]};
					C = GPR_Rd[0];
					V = R[7] ^ GPR_Rd[0];
				end
				16'b1001_010x_xxxx_0101: begin
					/* ASR */
					R = {GPR_Rd[7], GPR_Rd[7:1]};
					C = GPR_Rd[0];
					V = R[7] ^ GPR_Rd[0];
				end
				16'b1001_010x_xxxx_0010: begin
					/* SWAP */
					R = {GPR_Rd[3:0], GPR_Rd[7:4]};
					update_nsz = 1'b0;
				end
				16'b1001_010x_xxxx_1000: begin
					/* BSET - BCLR */
					case(pmem_d[7:4])
						4'b0000: C = 1'b1;
						4'b0001: Z = 1'b1;
						4'b0010: N = 1'b1;
						4'b0011: V = 1'b1;
						4'b0100: S = 1'b1;
						4'b0101: H = 1'b1;
						4'b0110: T = 1'b1;
						4'b1000: C = 1'b0;
						4'b1001: Z = 1'b0;
						4'b1010: N = 1'b0;
						4'b1011: V = 1'b0;
						4'b1100: S = 1'b0;
						4'b1101: H = 1'b0;
						4'b1110: T = 1'b0;
					endcase
					update_nsz = 1'b0;
					writeback = 1'b0;
				end
				16'b1001_011x_xxxx_xxxx: begin
					mode16 = 1'b1;
					if(pmem_d[8]) begin
						/* SBIW */
						{C, R16} = GPR_Rd16 - K16;
						V = GPR_Rd16[15] & ~R16[15];
					end else begin
						/* ADIW */
						{C, R16} = GPR_Rd16 + K16;
						V = ~GPR_Rd16[15] & R16[15];
					end
				end
				/* SBR and CBR are replaced with ORI and ANDI */
				/* TST is replaced with AND */
				/* CLR and SER are replaced with EOR and LDI */
				16'b0010_11xx_xxxx_xxxx: begin
					/* MOV */
					R = GPR_Rr;
					update_nsz = 1'b0;
				end
				16'b1110_xxxx_xxxx_xxxx: begin
					/* LDI */
					R = K;
					update_nsz = 1'b0;
				end
				/* LSL is replaced with ADD */
				/* ROL is replaced with ADC */
				16'b1111_10xx_xxxx_0xxx: begin
					if(pmem_d[9]) begin
						/* BST */
						T = GPR_Rd_b;
						writeback = 1'b0;
					end else begin
						/* BLD */
						case(b)
							3'd0: R = {GPR_Rd[7:1], T};
							3'd1: R = {GPR_Rd[7:2], T, GPR_Rd[0]};
							3'd2: R = {GPR_Rd[7:3], T, GPR_Rd[1:0]};
							3'd3: R = {GPR_Rd[7:4], T, GPR_Rd[2:0]};
							3'd4: R = {GPR_Rd[7:5], T, GPR_Rd[3:0]};
							3'd5: R = {GPR_Rd[7:6], T, GPR_Rd[4:0]};
							3'd6: R = {GPR_Rd[7], T, GPR_Rd[5:0]};
							3'd7: R = {T, GPR_Rd[6:0]};
						endcase
					end
					update_nsz = 1'b0;
				end
				/* SEC, CLC, SEN, CLN, SEZ, CLZ, SEI, CLI, SES, CLS, SEV, CLV, SET, CLT, SEH, CLH
				 * are replaced with BSET and BCLR */
				16'b0000_0000_0000_0000: begin
					/* NOP */
					update_nsz = 1'b0;
					writeback = 1'b0;
				end
				/* SLEEP is not implemented */
				/* WDR is not implemented */
				16'b1001_00xx_xxxx_1111, /* PUSH/POP */
				16'b1001_00xx_xxxx_1100, /*  X   */
				16'b1001_00xx_xxxx_1101, /*  X+  */
				16'b1001_00xx_xxxx_1110, /* -X   */
				16'b1001_00xx_xxxx_1001, /*  Y+  */
				16'b1001_00xx_xxxx_1010, /* -Y   */
				16'b10x0_xxxx_xxxx_1xxx, /*  Y+q */
				16'b1001_00xx_xxxx_0001, /*  Z+  */
				16'b1001_00xx_xxxx_0010, /* -Z   */
				16'b10x0_xxxx_xxxx_0xxx: /*  Z+q */
				begin
					/* LD - POP (run from state WRITEBACK) */
					R = dmem_di;
					update_nsz = 1'b0;
				end
				16'b1011_0xxx_xxxx_xxxx: begin
					/* IN (run from state WRITEBACK) */
					case(io_sel)
						IO_SEL_EXT: R = io_di;
						IO_SEL_STACK: R = io_sp;
						IO_SEL_SREG: R = {1'b0, T, H, S, V, N, Z, C};
						default: R = 8'hxx;
					endcase
					update_nsz = 1'b0;
				end
			endcase
		end /* if(normal_en) */
		if(lds_writeback) begin
			R = dmem_di;
			writeback = 1'b1;
		end
		if(lpm_en) begin
			R = pZ[0] ? pmem_d[15:8] : pmem_d[7:0];
			writeback = 1'b1;
		end
		if(update_nsz) begin
			N = mode16 ? R16[15] : R[7];
			S = N ^ V;
			Z = mode16 ? R16 == 16'h0000 : ((R == 8'h00) & (change_z|Z));
		end
		if(io_we & (io_a == 6'b111111))
			{T, H, S, V, N, Z, C} = io_do[6:0];
		if(writeback) begin
			if(mode16) begin
				// synthesis translate_off
				//$display("REG WRITE(16): %d < %d", Rd16, R16);
				// synthesis translate_on
				case(Rd16)
					2'd0: U = R16;
					2'd1: pX = R16;
					2'd2: pY = R16;
					2'd3: pZ = R16;
				endcase
			end else begin
				// synthesis translate_off
				//$display("REG WRITE: %d < %d", Rd, R);
				// synthesis translate_on
				case(write_dest)
					default: GPR[write_dest] = R;
					5'd24: U[7:0] = R;
					5'd25: U[15:8] = R;
					5'd26: pX[7:0] = R;
					5'd27: pX[15:8] = R;
					5'd28: pY[7:0] = R;
					5'd29: pY[15:8] = R;
					5'd30: pZ[7:0] = R;
					5'd31: pZ[15:8] = R;
				endcase
			end
		end else begin /* if(writeback) */
			case(dmem_sel)
				DMEM_SEL_XPLUS:		pX = pX + 16'd1;
				DMEM_SEL_XMINUS:	pX = pX - 16'd1;
				DMEM_SEL_YPLUS:		pY = pY + 16'd1;
				DMEM_SEL_YMINUS:	pY = pY - 16'd1;
				DMEM_SEL_ZPLUS:		pZ = pZ + 16'd1;
				DMEM_SEL_ZMINUS:	pZ = pZ - 16'd1;
				default:;
			endcase
		end
	end /* if(rst) ... else */
end

/* I/O port */
assign io_a = {pmem_d[10:9], pmem_d[3:0]};
assign io_do = GPR_Rd;

/* Data memory */
always @(*) begin
	case(dmem_sel)
		DMEM_SEL_X,
		DMEM_SEL_XPLUS:		dmem_a = pX;
		DMEM_SEL_XMINUS:	dmem_a = pX - 16'd1;
		DMEM_SEL_YPLUS:		dmem_a = pY;
		DMEM_SEL_YMINUS:	dmem_a = pY - 16'd1;
		DMEM_SEL_YQ:		dmem_a = pY + q;
		DMEM_SEL_ZPLUS:		dmem_a = pZ;
		DMEM_SEL_ZMINUS:	dmem_a = pZ - 16'd1;
		DMEM_SEL_ZQ:		dmem_a = pZ + q;
		DMEM_SEL_SP_R,
		DMEM_SEL_SP_PCL,
		DMEM_SEL_SP_PCH:	dmem_a = SP + pop;
		DMEM_SEL_PMEM:		dmem_a = pmem_d;
		default:		dmem_a = {dmem_width{1'bx}};
	endcase
end

wire [pmem_width-1:0] PC_inc = PC + 1;
always @(*) begin
	case(dmem_sel)
		DMEM_SEL_X,
		DMEM_SEL_XPLUS,
		DMEM_SEL_XMINUS,
		DMEM_SEL_YPLUS,
		DMEM_SEL_YMINUS,
		DMEM_SEL_YQ,
		DMEM_SEL_ZPLUS,
		DMEM_SEL_ZMINUS,
		DMEM_SEL_ZQ,
		DMEM_SEL_SP_R:		dmem_do = GPR_Rd;
		DMEM_SEL_SP_PCL:	dmem_do = PC_inc[7:0];
		DMEM_SEL_SP_PCH:	dmem_do = PC_inc[pmem_width-1:8];
		DMEM_SEL_PMEM:		dmem_do = GPR_Rd_r;
		default:		dmem_do = 8'hxx;
	endcase
end

/* Multi-cycle operation sequencer */

wire reg_equal = GPR_Rd == GPR_Rr;

reg sreg_read;
always @(*) begin
	case(b)
		3'd0: sreg_read = C;
		3'd1: sreg_read = Z;
		3'd2: sreg_read = N;
		3'd3: sreg_read = V;
		3'd4: sreg_read = S;
		3'd5: sreg_read = H;
		3'd6: sreg_read = T;
		3'd7: sreg_read = 1'b0;
	endcase
end

reg [3:0] state;
reg [3:0] next_state;

parameter NORMAL	= 4'd0;
parameter RCALL		= 4'd1;
parameter ICALL		= 4'd2;
parameter STALL		= 4'd3;
parameter RET1		= 4'd4;
parameter RET2		= 4'd5;
parameter RET3		= 4'd6;
parameter LPM		= 4'd7;
parameter STS		= 4'd8;
parameter LDS1		= 4'd9;
parameter LDS2		= 4'd10;
parameter SKIP		= 4'd11;
parameter WRITEBACK	= 4'd12;

always @(posedge clk) begin
	if(rst)
		state <= NORMAL;
	else
		state <= next_state;
end

always @(*) begin
	next_state = state;

	pmem_ce = rst;

	pc_sel = PC_SEL_NOP;
	normal_en = 1'b0;
	lpm_en = 1'b0;

	io_re = 1'b0;
	io_we = 1'b0;

	dmem_we = 1'b0;
	dmem_sel = DMEM_SEL_UNDEFINED;

	push = 1'b0;
	pop = 1'b0;

	pmem_selz = 1'b0;

	regmem_ce = 1'b1;
	lds_writeback = 1'b0;
	
	case(state)
		NORMAL: begin
			casex(pmem_d)
				16'b1100_xxxx_xxxx_xxxx: begin
					/* RJMP */
					pc_sel = PC_SEL_KL;
					next_state = STALL;
				end
				16'b1101_xxxx_xxxx_xxxx: begin
					/* RCALL */
					/* TODO: in which order should we push the bytes? */
					dmem_sel = DMEM_SEL_SP_PCL;
					dmem_we = 1'b1;
					push = 1'b1;
					next_state = RCALL;
				end
				16'b0001_00xx_xxxx_xxxx: begin
					/* CPSE */
					pc_sel = PC_SEL_INC;
					pmem_ce = 1'b1;
					if(reg_equal)
						next_state = SKIP;
				end
				16'b1111_11xx_xxxx_0xxx: begin
					/* SBRC - SBRS */
					pc_sel = PC_SEL_INC;
					pmem_ce = 1'b1;
					if(GPR_Rd_b == pmem_d[9])
						next_state = SKIP;
				end
				/* SBIC, SBIS, SBI, CBI are not implemented */
				16'b1111_0xxx_xxxx_xxxx: begin
					/* BRBS - BRBC */
					pmem_ce = 1'b1;
					if(sreg_read ^ pmem_d[10]) begin
						pc_sel = PC_SEL_KS;
						next_state = STALL;
					end else
						pc_sel = PC_SEL_INC;
				end
				/* BREQ, BRNE, BRCS, BRCC, BRSH, BRLO, BRMI, BRPL, BRGE, BRLT,
				 * BRHS, BRHC, BRTS, BRTC, BRVS, BRVC, BRIE, BRID are replaced
				 * with BRBS/BRBC */
				16'b1001_00xx_xxxx_1100, /*  X   */
				16'b1001_00xx_xxxx_1101, /*  X+  */
				16'b1001_00xx_xxxx_1110, /* -X   */
				16'b1001_00xx_xxxx_1001, /*  Y+  */
				16'b1001_00xx_xxxx_1010, /* -Y   */
				16'b10x0_xxxx_xxxx_1xxx, /*  Y+q */
				16'b1001_00xx_xxxx_0001, /*  Z+  */
				16'b1001_00xx_xxxx_0010, /* -Z   */
				16'b10x0_xxxx_xxxx_0xxx: /*  Z+q */
				begin
					casex({pmem_d[12], pmem_d[3:0]})
						5'b1_1100: dmem_sel = DMEM_SEL_X;
						5'b1_1101: dmem_sel = DMEM_SEL_XPLUS;
						5'b1_1110: dmem_sel = DMEM_SEL_XMINUS;
						5'b1_1001: dmem_sel = DMEM_SEL_YPLUS;
						5'b1_1010: dmem_sel = DMEM_SEL_YMINUS;
						5'b0_1xxx: dmem_sel = DMEM_SEL_YQ;
						5'b1_0001: dmem_sel = DMEM_SEL_ZPLUS;
						5'b1_0010: dmem_sel = DMEM_SEL_ZMINUS;
						5'b0_0xxx: dmem_sel = DMEM_SEL_ZQ;
					endcase
					if(pmem_d[9]) begin
						/* ST */
						pc_sel = PC_SEL_INC;
						pmem_ce = 1'b1;
						dmem_we = 1'b1;
					end else begin
						/* LD */
						next_state = WRITEBACK;
					end
				end
				16'b1011_0xxx_xxxx_xxxx: begin
					/* IN */
					io_re = 1'b1;
					next_state = WRITEBACK;
				end
				16'b1011_1xxx_xxxx_xxxx: begin
					/* OUT */
					io_we = 1'b1;
					pc_sel = PC_SEL_INC;
					pmem_ce = 1'b1;
				end
				16'b1001_00xx_xxxx_xxxx: begin
					if(pmem_d[3:0] == 4'hf) begin
						if(pmem_d[9]) begin
							/* PUSH */
							push = 1'b1;
							dmem_sel = DMEM_SEL_SP_R;
							dmem_we = 1'b1;
							pc_sel = PC_SEL_INC;
							pmem_ce = 1'b1;
						end else begin
							/* POP */
							pop = 1'b1;
							dmem_sel = DMEM_SEL_SP_R;
							next_state = WRITEBACK;
						end
					end else if(pmem_d[3:0] == 4'h0) begin
						pc_sel = PC_SEL_INC;
						pmem_ce = 1'b1;
						if(pmem_d[9])
							/* STS */
							next_state = STS;
						else
							/* LDS */
							next_state = LDS1;
					end
				end
				16'b1001_0101_000x_1000: begin
					/* RET - RETI (treated as RET) */
					/* TODO: in which order should we pop the bytes? */
					dmem_sel = DMEM_SEL_SP_PCH;
					pop = 1'b1;
					next_state = RET1;
				end
				16'b1001_0101_1100_1000: begin
					/* LPM */
					pmem_selz = 1'b1;
					pmem_ce = 1'b1;
					next_state = LPM;
				end
				16'b1001_0100_0000_1001: begin
					/* IJMP */
					pc_sel = PC_SEL_Z;
					next_state = STALL;
				end
				16'b1001_0101_0000_1001: begin
					/* ICALL */
					/* TODO: in which order should we push the bytes? */
					dmem_sel = DMEM_SEL_SP_PCL;
					dmem_we = 1'b1;
					push = 1'b1;
					next_state = ICALL;
				end
				default: begin
					pc_sel = PC_SEL_INC;
					normal_en = 1'b1;
					pmem_ce = 1'b1;
				end
			endcase
		end
		RCALL: begin
			dmem_sel = DMEM_SEL_SP_PCH;
			dmem_we = 1'b1;
			push = 1'b1;
			pc_sel = PC_SEL_KL;
			next_state = STALL;
		end
		ICALL: begin
			dmem_sel = DMEM_SEL_SP_PCH;
			dmem_we = 1'b1;
			push = 1'b1;
			pc_sel = PC_SEL_Z;
			next_state = STALL;
		end
		RET1: begin
			pc_sel = PC_SEL_DMEMH;
			dmem_sel = DMEM_SEL_SP_PCL;
			pop = 1'b1;
			next_state = RET2;
		end
		RET2: begin
			pc_sel = PC_SEL_DMEML;
			next_state = RET3;
		end
		RET3: begin
			pc_sel = PC_SEL_DEC;
			next_state = STALL;
		end
		LPM: begin
			lpm_en = 1'b1;
			pc_sel = PC_SEL_INC;
			pmem_ce = 1'b1;
			next_state = NORMAL;
		end
		STS: begin
			pc_sel = PC_SEL_INC;
			pmem_ce = 1'b1;
			dmem_sel = DMEM_SEL_PMEM;
			dmem_we = 1'b1;
			next_state = NORMAL;
		end
		LDS1: begin
			dmem_sel = DMEM_SEL_PMEM;
			regmem_ce = 1'b0;
			next_state = LDS2;
		end
		LDS2: begin
			pc_sel = PC_SEL_INC;
			pmem_ce = 1'b1;
			lds_writeback = 1'b1;
			next_state = NORMAL;
		end
		SKIP: begin
			pc_sel = PC_SEL_INC;
			pmem_ce = 1'b1;
			/* test for STS and LDS */
			if((pmem_d[15:10] == 6'b100100) & (pmem_d[3:0] == 4'h0))
				next_state = STALL; /* 2-word instruction, skip the second word as well */
			else
				next_state = NORMAL; /* 1-word instruction */
		end
		STALL: begin
			pc_sel = PC_SEL_INC;
			pmem_ce = 1'b1;
			next_state = NORMAL;
		end
		WRITEBACK: begin
			pmem_ce = 1'b1;
			pc_sel = PC_SEL_INC;
			normal_en = 1'b1;
			next_state = NORMAL;
		end
	endcase
end

`ifdef REGRESS
integer i;
integer cycles;
always @(posedge clk) begin
	if(~rst & (state == NORMAL) & (cycles != 0)) begin
		$display("DUMP REGISTERS");
		for(i=0;i<24;i=i+1)
			$display("%x", GPR[i]);
		$display("%x", U[7:0]);
		$display("%x", U[15:8]);
		$display("%x", pX[7:0]);
		$display("%x", pX[15:8]);
		$display("%x", pY[7:0]);
		$display("%x", pY[15:8]);
		$display("%x", pZ[7:0]);
		$display("%x", pZ[15:8]);
		$display("%x", {1'b0, T, H, S, V, N, Z, C});
		$display("%x", SP[15:8]);
		$display("%x", SP[7:0]);
		$display("%x", PC[14:7]);
		$display("%x", {PC[6:0], 1'b0});
		tb_regress.dump;
		$finish;
	end
	if(rst)
		cycles = 0;
	else
		cycles = cycles + 1;
end

reg [7:0] SPR[0:12];
reg I;
initial begin
	$readmemh("gpr.rom", GPR);
	$readmemh("spr.rom", SPR);
	U = {SPR[1], SPR[0]};
	pX = {SPR[3], SPR[2]};
	pY = {SPR[5], SPR[4]};
	pZ = {SPR[7], SPR[6]};
	{I, T, H, S, V, N, Z, C} = SPR[8];
	SP = {SPR[9], SPR[10]};
	PC = {SPR[11], SPR[12]}/2;
end
`endif

endmodule
/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module softusb_phy(
	input usb_clk,
	input usb_rst,

	output usba_spd,
	output usba_oe_n,
	input usba_rcv,
	inout usba_vp,
	inout usba_vm,

	output usbb_spd,
	output usbb_oe_n,
	input usbb_rcv,
	inout usbb_vp,
	inout usbb_vm,

	output usba_discon,
	output usbb_discon,

	output [1:0] line_state_a,
	output [1:0] line_state_b,

	input port_sel_rx,
	input [1:0] port_sel_tx,

	input [7:0] tx_data,
	input tx_valid,
	output tx_ready, /* data acknowledgment */
	output tx_busy, /* busy generating EOP, sending data, etc. */

	input [1:0] generate_reset,

	output [7:0] rx_data,
	output rx_valid,
	output rx_active,

	input tx_low_speed,
	input [1:0] low_speed,
	input generate_eop
);

/* RX synchronizer */

wire vp_s_a;
wire vm_s_a;
wire rcv_s_a;
softusb_filter filter_a(
	.usb_clk(usb_clk),

	.rcv(usba_rcv),
	.vp(usba_vp),
	.vm(usba_vm),

	.rcv_s(rcv_s_a),
	.vp_s(vp_s_a),
	.vm_s(vm_s_a)
);
assign line_state_a = {vm_s_a, vp_s_a};

wire vp_s_b;
wire vm_s_b;
wire rcv_s_b;
softusb_filter filter_b(
	.usb_clk(usb_clk),

	.rcv(usbb_rcv),
	.vp(usbb_vp),
	.vm(usbb_vm),

	.rcv_s(rcv_s_b),
	.vp_s(vp_s_b),
	.vm_s(vm_s_b)
);
assign line_state_b = {vm_s_b, vp_s_b};

/* TX section */

wire txp;
wire txm;
wire txoe;

softusb_tx tx(
	.usb_clk(usb_clk),
	.usb_rst(usb_rst),

	.tx_data(tx_data),
	.tx_valid(tx_valid),
	.tx_ready(tx_ready),

	.txp(txp),
	.txm(txm),
	.txoe(txoe),
	.low_speed(tx_low_speed),
	.generate_eop(generate_eop)
);

assign tx_busy = txoe;

/* RX section */

reg txoe0;
reg txoe1;
always @(posedge usb_clk) begin
	txoe0 <= txoe;
	txoe1 <= txoe0;
end

softusb_rx rx(
	.usb_clk(usb_clk),

	.rxreset(txoe1),

	.rx(port_sel_rx ? rcv_s_b : rcv_s_a),
	.rxp(port_sel_rx ? vp_s_b : vp_s_a),
	.rxm(port_sel_rx ? vm_s_b : vm_s_a),

	.rx_data(rx_data),
	.rx_valid(rx_valid),
	.rx_active(rx_active),

	.low_speed(port_sel_rx ? low_speed[1] : low_speed[0])
);

/* Tri-state enables and drivers */

wire txoe_a = (txoe & port_sel_tx[0])|generate_reset[0];
wire txoe_b = (txoe & port_sel_tx[1])|generate_reset[1];

assign usba_oe_n = ~txoe_a;
assign usba_vp = txoe_a ? (generate_reset[0] ? 1'b0 : txp) : 1'bz;
assign usba_vm = txoe_a ? (generate_reset[0] ? 1'b0 : txm) : 1'bz;
assign usbb_oe_n = ~txoe_b;
assign usbb_vp = txoe_b ? (generate_reset[1] ? 1'b0 : txp) : 1'bz;
assign usbb_vm = txoe_b ? (generate_reset[1] ? 1'b0 : txm) : 1'bz;

/* Assert USB disconnect if we see SE0 for at least 2.5us */

reg [6:0] usba_discon_cnt;
assign usba_discon = (usba_discon_cnt == 7'd127);
always @(posedge usb_clk) begin
	if(usb_rst)
		usba_discon_cnt <= 7'd0;
	else begin
		if(line_state_a != 7'd0)
			usba_discon_cnt <= 7'd0;
		else if(~usba_discon)
			usba_discon_cnt <= usba_discon_cnt + 7'd1;
	end
end

reg [6:0] usbb_discon_cnt;
assign usbb_discon = (usbb_discon_cnt == 7'd127);
always @(posedge usb_clk) begin
	if(usb_rst)
		usbb_discon_cnt <= 7'd0;
	else begin
		if(line_state_b != 2'h0)
			usbb_discon_cnt <= 7'd0;
		else if(~usbb_discon)
			usbb_discon_cnt <= usbb_discon_cnt + 7'd1;
	end
end

assign usba_spd = ~low_speed[0];
assign usbb_spd = ~low_speed[1];

endmodule
/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


module softusb_ram #(
	parameter pmem_width = 11,
	parameter dmem_width = 13
) (
	input sys_clk,
	input sys_rst,

	input usb_clk,
	input usb_rst,

	input [31:0] wb_adr_i,
	output [31:0] wb_dat_o,
	input [31:0] wb_dat_i,
	input [3:0] wb_sel_i,
	input wb_stb_i,
	input wb_cyc_i,
	output reg wb_ack_o,
	input wb_we_i,

	input pmem_ce,
	input [pmem_width-1:0] pmem_a,
	output [15:0] pmem_d,

	input dmem_we,
	input [dmem_width-1:0] dmem_a,
	input [7:0] dmem_di,
	output reg [7:0] dmem_do
);

always @(posedge sys_clk) begin
	if(sys_rst)
		wb_ack_o <= 1'b0;
	else begin
		if(wb_stb_i & wb_cyc_i & ~wb_ack_o)
			wb_ack_o <= 1'b1;
		else
			wb_ack_o <= 1'b0;
	end
end

wire [31:0] wb_dat_o_prog;
softusb_dpram #(
	.depth(pmem_width),
	.width(16),
	.initfile("trx.rom")
) program (
	.clk(sys_clk),
	.clk2(usb_clk),

	.a(wb_adr_i[pmem_width+1:2]),
	.we(wb_stb_i & wb_cyc_i & ~wb_adr_i[17] & wb_we_i & ~wb_ack_o),
	.di(wb_dat_i[15:0]),
	.do(wb_dat_o_prog[15:0]),

	.ce2(pmem_ce),
	.a2(pmem_a),
	.we2(1'b0),
	.di2(16'hxxxx),
	.do2(pmem_d)
);
assign wb_dat_o_prog[31:16] = 16'd0;

wire [7:0] dmem_do0;
wire [7:0] dmem_do1;
wire [7:0] dmem_do2;
wire [7:0] dmem_do3;
wire [31:0] wb_dat_o_data;

softusb_dpram #(
	.depth(dmem_width-2),
	.width(8)
) dataram0 (
	.clk(sys_clk),
	.clk2(usb_clk),

	.a(wb_adr_i[dmem_width-1:2]),
	.we(wb_stb_i & wb_cyc_i & wb_adr_i[17] & wb_we_i & wb_sel_i[0] & ~wb_ack_o),
	.di(wb_dat_i[7:0]),
	.do(wb_dat_o_data[7:0]),

	.ce2(1'b1),
	.a2(dmem_a[dmem_width-1:2]),
	.we2(dmem_we & (dmem_a[1:0] == 2'd3)),
	.di2(dmem_di),
	.do2(dmem_do0)
);

softusb_dpram #(
	.depth(dmem_width-2),
	.width(8)
) dataram1 (
	.clk(sys_clk),
	.clk2(usb_clk),

	.a(wb_adr_i[dmem_width-1:2]),
	.we(wb_stb_i & wb_cyc_i & wb_adr_i[17] & wb_we_i & wb_sel_i[1] & ~wb_ack_o),
	.di(wb_dat_i[15:8]),
	.do(wb_dat_o_data[15:8]),

	.ce2(1'b1),
	.a2(dmem_a[dmem_width-1:2]),
	.we2(dmem_we & (dmem_a[1:0] == 2'd2)),
	.di2(dmem_di),
	.do2(dmem_do1)
);

softusb_dpram #(
	.depth(dmem_width-2),
	.width(8)
) dataram2 (
	.clk(sys_clk),
	.clk2(usb_clk),

	.a(wb_adr_i[dmem_width-1:2]),
	.we(wb_stb_i & wb_cyc_i & wb_adr_i[17] & wb_we_i & wb_sel_i[2] & ~wb_ack_o),
	.di(wb_dat_i[23:16]),
	.do(wb_dat_o_data[23:16]),

	.ce2(1'b1),
	.a2(dmem_a[dmem_width-1:2]),
	.we2(dmem_we & (dmem_a[1:0] == 2'd1)),
	.di2(dmem_di),
	.do2(dmem_do2)
);

softusb_dpram #(
	.depth(dmem_width-2),
	.width(8)
) dataram3 (
	.clk(sys_clk),
	.clk2(usb_clk),

	.a(wb_adr_i[dmem_width-1:2]),
	.we(wb_stb_i & wb_cyc_i & wb_adr_i[17] & wb_we_i & wb_sel_i[3] & ~wb_ack_o),
	.di(wb_dat_i[31:24]),
	.do(wb_dat_o_data[31:24]),

	.ce2(1'b1),
	.a2(dmem_a[dmem_width-1:2]),
	.we2(dmem_we & (dmem_a[1:0] == 2'd0)),
	.di2(dmem_di),
	.do2(dmem_do3)
);

reg [1:0] dmem_a01;
always @(posedge usb_clk) dmem_a01 <= dmem_a[1:0];
always @(*) begin
	case(dmem_a01)
		2'd0: dmem_do = dmem_do3;
		2'd1: dmem_do = dmem_do2;
		2'd2: dmem_do = dmem_do1;
		2'd3: dmem_do = dmem_do0;
	endcase
end

reg datasel;
always @(posedge sys_clk) datasel <= wb_adr_i[17];
assign wb_dat_o = datasel ? wb_dat_o_data : wb_dat_o_prog;

endmodule
/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module softusb_rx(
	input usb_clk,

	input rxreset,

	input rx,
	input rxp,
	input rxm,

	output reg [7:0] rx_data,
	output reg rx_valid,
	output reg rx_active,

	input low_speed
);

wire rx_corrected = rx ^ low_speed;

/* EOP detection */

/*
 * State diagram taken from
 * "Designing a Robust USB Serial Interface Engine (SIE)"
 * USB-IF Technical White Paper
 */
wire se0 = ~rxp & ~rxm;

reg [2:0] eop_state;
reg [2:0] eop_next_state;
always @(posedge usb_clk) begin
	if(rxreset)
		eop_state <= 3'd0;
	else
		eop_state <= eop_next_state;
end

reg eop_detected;

always @(*) begin
	eop_detected = 1'b0;
	eop_next_state = eop_state;

	case(eop_state)
		3'd0: begin
			if(se0)
				eop_next_state = 3'd1;
			else
				eop_next_state = 3'd0;
		end
		3'd1: begin
			if(se0)
				eop_next_state = 3'd2;
			else
				eop_next_state = 3'd0;
		end
		3'd2: begin
			if(se0)
				eop_next_state = 3'd3;
			else
				eop_next_state = 3'd0;
		end
		3'd3: begin
			if(se0)
				eop_next_state = 3'd3;
			else begin
				if(rx_corrected) begin
					eop_detected = 1'b1;
					eop_next_state = 3'd0;
				end else
					eop_next_state = 3'd4;
			end
		end
		3'd4: begin
			if(rx_corrected)
				eop_detected = 1'b1;
			eop_next_state = 3'd0;
		end
	endcase
end

/* DPLL */
reg rx_r;
always @(posedge usb_clk)
	rx_r <= rx;
wire transition = (rx != rx_r);

reg [4:0] dpll_counter;
reg dpll_ce;
always @(posedge usb_clk) begin
	if(rxreset) begin
		dpll_counter <= 5'd0;
		dpll_ce <= 1'b0;
	end else begin
		if(transition)
			dpll_counter <= 5'd0;
		else
			dpll_counter <= dpll_counter + 5'd1;
		dpll_ce <= low_speed ? (dpll_counter == 5'd13) : (transition|(dpll_counter[1:0] == 2'd3));
	end
end

/* Serial->Parallel converter */

reg [2:0] bitcount;
reg [2:0] onecount;
reg lastrx;
reg startrx;
always @(posedge usb_clk) begin
	if(rxreset) begin
		rx_active = 1'b0;
		rx_valid = 1'b0;
	end else begin
		rx_valid = 1'b0;
		if(eop_detected)
			rx_active = 1'b0;
		else if(dpll_ce) begin
			if(rx_active) begin
				if(onecount == 3'd6) begin
					/* skip stuffed bits */
					onecount = 3'd0;
					if((lastrx & rx_corrected)|(~lastrx & ~rx_corrected))
						/* no transition? bitstuff error */
						rx_active = 1'b0;
					lastrx = ~lastrx;
				end else begin
					if(rx_corrected) begin
						rx_data = {lastrx, rx_data[7:1]};
						if(lastrx)
							onecount = onecount + 3'd1;
						else
							onecount = 3'd0;
						lastrx = 1'b1;
					end else begin
						rx_data = {~lastrx, rx_data[7:1]};
						if(~lastrx)
							onecount = onecount + 3'd1;
						else
							onecount = 3'd0;
						lastrx = 1'b0;
					end
					rx_valid = bitcount == 3'd7;
					bitcount = bitcount + 3'd1;
				end
			end else if(startrx) begin
				rx_active = 1'b1;
				bitcount = 3'd0;
				onecount = 3'd1;
				lastrx = 1'b0;
			end
		end
	end
end

/* Find sync pattern */

parameter FS_IDLE	= 4'h0;
parameter K1		= 4'h1;
parameter J1		= 4'h2;
parameter K2		= 4'h3;
parameter J2		= 4'h4;
parameter K3		= 4'h5;
parameter J3		= 4'h6;
parameter K4		= 4'h7;
parameter K5		= 4'h8;

reg [3:0] fs_state;
reg [3:0] fs_next_state;

reg [5:0] fs_timeout_counter;
reg fs_timeout;
always @(posedge usb_clk) begin
	if(rxreset|eop_detected) begin
		fs_timeout_counter <= 6'd0;
		fs_timeout <= 1'b0;
	end else begin
		if((fs_state != fs_next_state) | (fs_state == FS_IDLE))
			fs_timeout_counter <= 6'd0;
		else
			fs_timeout_counter <= fs_timeout_counter + 6'd1;
		if(low_speed)
			fs_timeout <= fs_timeout_counter == 6'd63;
		else
			fs_timeout <= fs_timeout_counter == 6'd7;
	end
end

always @(posedge usb_clk) begin
	if(rxreset|eop_detected|fs_timeout)
		fs_state <= FS_IDLE;
	else
		fs_state <= fs_next_state;
end

always @(*) begin
	startrx = 1'b0;
	fs_next_state = fs_state;

	case(fs_state)
		FS_IDLE: if(~rx_corrected & ~rx_active)
			fs_next_state = K1;
		K1: if(rx_corrected)
			fs_next_state = J1;
		J1: if(~rx_corrected)
			fs_next_state = K2;
		K2: if(rx_corrected)
			fs_next_state = J2;
		J2: if(~rx_corrected)
			fs_next_state = K3;
		K3: if(rx_corrected)
			fs_next_state = J3;
		J3: if(~rx_corrected)
			fs_next_state = K4;
		K4: if(dpll_ce) begin
			if(~rx_corrected)
				fs_next_state = K5;
			else
				fs_next_state = FS_IDLE;
		end
		K5: if(dpll_ce) begin
			if(~rx_corrected)
				startrx = 1'b1;
			fs_next_state = FS_IDLE;
		end
	endcase
end

endmodule
/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module softusb_sie(
	input usb_clk,
	input usb_rst,

	input io_re,
	input io_we,
	input [5:0] io_a,
	input [7:0] io_di,
	output reg [7:0] io_do,

	output usba_spd,
	output usba_oe_n,
	input usba_rcv,
	inout usba_vp,
	inout usba_vm,

	output usbb_spd,
	output usbb_oe_n,
	input usbb_rcv,
	inout usbb_vp,
	inout usbb_vm
);

wire [1:0] line_state_a;
wire [1:0] line_state_b;

wire discon_a;
wire discon_b;

reg port_sel_rx;
reg [1:0] port_sel_tx;

reg [7:0] tx_data;
reg tx_valid;
wire tx_ready;
reg tx_pending;

reg [1:0] generate_reset;

wire [7:0] rx_data;
wire rx_valid;
wire rx_active;
wire tx_busy;

reg [7:0] data_in;
reg rx_pending;

reg tx_low_speed;
reg [1:0] low_speed;
reg generate_eop;

always @(posedge usb_clk) begin
	if(usb_rst) begin
		port_sel_rx <= 1'b0;
		port_sel_tx <= 2'b00;
		tx_valid <= 1'b0;
		tx_pending <= 1'b0;
		generate_reset <= 2'd0;
		rx_pending <= 1'b0;
		tx_low_speed <= 1'b0;
		low_speed <= 2'b00;
		generate_eop <= 1'b0;
		io_do <= 8'd0;
	end else begin
		io_do <= 8'd0;
		generate_eop <= 1'b0;
		case(io_a)
			6'h00: io_do <= line_state_a;
			6'h01: io_do <= line_state_b;
			6'h02: io_do <= discon_a;
			6'h03: io_do <= discon_b;

			6'h04: io_do <= port_sel_rx;
			6'h05: io_do <= port_sel_tx;

			6'h06: io_do <= tx_data;
			6'h07: io_do <= tx_pending;
			6'h08: io_do <= tx_valid;
			6'h09: io_do <= tx_busy;
			6'h0a: io_do <= generate_reset;

			6'h0b: begin
				io_do <= data_in;
				if(io_re)
					rx_pending <= 1'b0;
			end
			6'h0c: io_do <= rx_pending;
			6'h0d: io_do <= rx_active;
			
			6'h0e: io_do <= tx_low_speed;
			6'h0f: io_do <= low_speed;
			6'h10: io_do <= 8'hxx;
		endcase
		if(io_we) begin
			$display("USB SIE W: a=%x dat=%x", io_a, io_di);
			case(io_a)
				6'h04: port_sel_rx <= io_di[0];
				6'h05: port_sel_tx <= io_di[1:0];
				6'h06: begin
					tx_valid <= 1'b1;
					tx_data <= io_di;
					tx_pending <= 1'b1;
				end
				6'h08: tx_valid <= 1'b0;
				6'h0a: generate_reset <= io_di[1:0];
				6'h0e: tx_low_speed <= io_di[0];
				6'h0f: low_speed <= io_di[1:0];
				6'h10: generate_eop <= 1'b1;
			endcase
		end
		if(tx_ready)
			tx_pending <= 1'b0;
		if(rx_valid) begin
			data_in <= rx_data;
			rx_pending <= 1'b1;
		end

		if(io_re) // must be at the end because of the delay!
			#1 $display("USB SIE R: a=%x dat=%x", io_a, io_do);
	end
end

softusb_phy phy(
	.usb_clk(usb_clk),
	.usb_rst(usb_rst),

	.usba_spd(usba_spd),
	.usba_oe_n(usba_oe_n),
	.usba_rcv(usba_rcv),
	.usba_vp(usba_vp),
	.usba_vm(usba_vm),

	.usbb_spd(usbb_spd),
	.usbb_oe_n(usbb_oe_n),
	.usbb_rcv(usbb_rcv),
	.usbb_vp(usbb_vp),
	.usbb_vm(usbb_vm),

	.usba_discon(discon_a),
	.usbb_discon(discon_b),

	.line_state_a(line_state_a),
	.line_state_b(line_state_b),

	.port_sel_rx(port_sel_rx),
	.port_sel_tx(port_sel_tx),

	.tx_data(tx_data),
	.tx_valid(tx_valid),
	.tx_ready(tx_ready),
	.tx_busy(tx_busy),

	.generate_reset(generate_reset),
	
	.rx_data(rx_data),
	.rx_valid(rx_valid),
	.rx_active(rx_active),

	.tx_low_speed(tx_low_speed),
	.low_speed(low_speed),
	.generate_eop(generate_eop)
);

endmodule
/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module softusb_timer(
	input usb_clk,
	input usb_rst,

	input io_we,
	input [5:0] io_a,
	output reg [7:0] io_do
);

reg [31:0] counter;

always @(posedge usb_clk) begin
	if(usb_rst) begin
		counter <= 32'd0;
		io_do <= 32'd0;
	end else begin
		io_do <= 32'd0;
		case(io_a)
			6'h11: io_do <= counter[7:0];
			6'h12: io_do <= counter[15:8];
			6'h13: io_do <= counter[23:16];
			6'h14: io_do <= counter[31:24];
		endcase
		if(io_we & ((io_a == 6'h11)|(io_a == 6'h12)|(io_a == 6'h13)|(io_a == 6'h14)))
			counter <= 32'd0;
		else
			counter <= counter + 32'd1;
	end
end

endmodule
/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module softusb_tx(
	input usb_clk,
	input usb_rst,

	input [7:0] tx_data,
	input tx_valid,
	output reg tx_ready,

	output reg txp,
	output reg txm,
	output reg txoe,

	input low_speed,
	input generate_eop
);

/* Register outputs */
reg txp_r;
reg txm_r;
reg txoe_r;
always @(posedge usb_clk) begin
	txp <= txp_r;
	txm <= txm_r;
	txoe <= txoe_r;
end

/* Clock 'divider' */
reg gce; /* global clock enable */
reg [4:0] gce_counter;
always @(posedge usb_clk) begin
	if(usb_rst) begin
		gce <= 1'b0;
		gce_counter <= 5'd0;
	end else begin
		gce <= low_speed ? (gce_counter == 5'd31) : (gce_counter[1:0] == 2'd3);
		gce_counter <= gce_counter + 5'd1;
	end
end

/* Shift register w/bit stuffing */
reg sr_rst;
reg sr_load;
reg sr_done;
reg sr_out;
reg [2:0] bitcount;
reg [2:0] onecount;
reg [6:0] sr;
always @(posedge usb_clk) begin
	if(sr_rst) begin
		sr_done <= 1'b1;
		onecount <= 3'd0;
	end else if(gce) begin
		if(sr_load) begin
			sr_done <= 1'b0;
			sr_out <= tx_data[0];
			bitcount <= 3'd0;
			if(tx_data[0])
				onecount = onecount + 3'd1;
			else
				onecount = 3'd0;
			sr <= tx_data[7:1];
		end else if(~sr_done) begin
			if(onecount == 3'd6) begin
				onecount <= 3'd0;
				sr_out <= 1'b0;
				if(bitcount == 3'd7)
					sr_done <= 1'b1;
			end else begin
				sr_out <= sr[0];
				if(sr[0])
					onecount <= onecount + 3'd1;
				else
					onecount <= 3'd0;
				bitcount <= bitcount + 3'd1;
				if((bitcount == 3'd6) & (~sr[0] | (onecount != 3'd5)))
					sr_done <= 1'b1;
				sr <= {1'b0, sr[6:1]};
			end
		end
	end
end

/* Output generation */
reg txoe_ctl;
reg generate_se0;
reg generate_j;

always @(posedge usb_clk) begin
	if(usb_rst) begin
		txoe_r <= 1'b0;
		txp_r <= ~low_speed;
		txm_r <= low_speed;
	end else if(gce) begin
		if(~txoe_ctl) begin
			txp_r <= ~low_speed; /* return to J */
			txm_r <= low_speed;
		end else begin
			case({generate_se0, generate_j})
				2'b00: begin
					if(~sr_out) begin
						txp_r <= ~txp_r;
						txm_r <= ~txm_r;
					end
				end
				2'b10: begin
					txp_r <= 1'b0;
					txm_r <= 1'b0;
				end
				2'b01: begin
					txp_r <= ~low_speed;
					txm_r <= low_speed;
				end
				default: begin
					txp_r <= 1'bx;
					txm_r <= 1'bx;
				end
			endcase
		end
		txoe_r <= txoe_ctl;
	end
end

/* Sequencer */

parameter IDLE		= 3'd0;
parameter DATA		= 3'd1;
parameter EOP1		= 3'd2;
parameter EOP2		= 3'd3;
parameter J		= 3'd4;
parameter GEOP1		= 3'd5;
parameter GEOP2		= 3'd6;
parameter GJ		= 3'd7;

reg [2:0] state;
reg [2:0] next_state;

always @(posedge usb_clk) begin
	if(usb_rst)
		state <= IDLE;
	else if(gce)
		state <= next_state;
end

reg tx_ready0;
always @(posedge usb_clk)
	tx_ready <= tx_ready0 & gce;

reg tx_valid_r;
reg transmission_continue;
reg transmission_end_ack;
always @(posedge usb_clk) begin
	if(usb_rst) begin
		tx_valid_r <= 1'b0;
		transmission_continue <= 1'b1;
	end else begin
		tx_valid_r <= tx_valid;
		if(tx_valid_r & ~tx_valid)
			transmission_continue <= 1'b0;
		if(transmission_end_ack)
			transmission_continue <= 1'b1;
	end
end

reg generate_eop_pending;
reg generate_eop_clear;
always @(posedge usb_clk) begin
	if(usb_rst)
		generate_eop_pending <= 1'b0;
	else begin
		if(generate_eop)
			generate_eop_pending <= 1'b1;
		if(generate_eop_clear)
			generate_eop_pending <= 1'b0;
	end
end

always @(*) begin
	txoe_ctl = 1'b0;
	sr_rst = 1'b0;
	sr_load = 1'b0;
	generate_se0 = 1'b0;
	generate_j = 1'b0;
	tx_ready0 = 1'b0;
	transmission_end_ack = 1'b0;
	generate_eop_clear = 1'b0;

	next_state = state;

	case(state)
		IDLE: begin
			txoe_ctl = 1'b0;
			if(generate_eop_pending)
				next_state = GEOP1;
			else begin
				if(tx_valid) begin
					sr_load = 1'b1;
					next_state = DATA;
				end else
					sr_rst = 1'b1;
				tx_ready0 = 1'b1;
			end
		end
		DATA: begin
			txoe_ctl = 1'b1;
			if(sr_done) begin
				if(transmission_continue) begin
					sr_load = 1'b1;
					tx_ready0 = 1'b1;
				end else
					next_state = EOP1;
			end
		end
		EOP1: begin
			transmission_end_ack = 1'b1;
			sr_rst = 1'b1;
			txoe_ctl = 1'b1;
			generate_se0 = 1'b1;
			next_state = EOP2;
		end
		EOP2: begin
			sr_rst = 1'b1;
			txoe_ctl = 1'b1;
			generate_se0 = 1'b1;
			next_state = J;
		end
		J: begin
			sr_rst = 1'b1;
			txoe_ctl = 1'b1;
			generate_j = 1'b1;
			next_state = IDLE;
		end
		GEOP1: begin
			sr_rst = 1'b1;
			txoe_ctl = 1'b1;
			generate_se0 = 1'b1;
			next_state = GEOP2;
		end
		GEOP2: begin
			sr_rst = 1'b1;
			txoe_ctl = 1'b1;
			generate_se0 = 1'b1;
			next_state = GJ;
		end
		GJ: begin
			generate_eop_clear = 1'b1;
			sr_rst = 1'b1;
			txoe_ctl = 1'b1;
			generate_j = 1'b1;
			next_state = IDLE;
		end
	endcase
end

endmodule
/*
 * Milkymist VJ SoC
 * Copyright (C) 2007, 2008, 2009, 2010 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module softusb #(
	parameter csr_addr = 4'h0,
	parameter pmem_width = 11,
	parameter dmem_width = 13
) (
	input sys_clk,
	input sys_rst,

	input usb_clk,

	/* CSR interface */
	input [13:0] csr_a,
	input csr_we,
	input [31:0] csr_di,
	output [31:0] csr_do,

	output irq,

	/* WISHBONE to access RAM */
	input [31:0] wb_adr_i,
	output [31:0] wb_dat_o,
	input [31:0] wb_dat_i,
	input [3:0] wb_sel_i,
	input wb_stb_i,
	input wb_cyc_i,
	output wb_ack_o,
	input wb_we_i,

	/* USB port A */
	output usba_spd,
	output usba_oe_n,
	input usba_rcv,
	inout usba_vp,
	inout usba_vm,

	/* USB port B */
	output usbb_spd,
	output usbb_oe_n,
	input usbb_rcv,
	inout usbb_vp,
	inout usbb_vm
);

wire usb_rst;

wire io_re;
wire io_we;
wire [5:0] io_a;
wire [7:0] io_dw;
wire [7:0] io_dr_timer, io_dr_sie;

softusb_timer timer(
	.usb_clk(usb_clk),
	.usb_rst(usb_rst),

	.io_we(io_we),
	.io_a(io_a),
	.io_do(io_dr_timer)
);

softusb_hostif #(
	.csr_addr(csr_addr)
) hostif (
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),

	.usb_clk(usb_clk),
	.usb_rst(usb_rst),

	.csr_a(csr_a),
	.csr_we(csr_we),
	.csr_di(csr_di),
	.csr_do(csr_do),

	.irq(irq),

	.io_we(io_we),
	.io_a(io_a)
);

softusb_sie sie(
	.usb_clk(usb_clk),
	.usb_rst(usb_rst),

	.io_re(io_re),
	.io_we(io_we),
	.io_a(io_a),
	.io_di(io_dw),
	.io_do(io_dr_sie),

	.usba_spd(usba_spd),
	.usba_oe_n(usba_oe_n),
	.usba_rcv(usba_rcv),
	.usba_vp(usba_vp),
	.usba_vm(usba_vm),

	.usbb_spd(usbb_spd),
	.usbb_oe_n(usbb_oe_n),
	.usbb_rcv(usbb_rcv),
	.usbb_vp(usbb_vp),
	.usbb_vm(usbb_vm)
);

wire pmem_ce;
wire [pmem_width-1:0] pmem_a;
wire [15:0] pmem_d;

wire dmem_we;
wire [dmem_width-1:0] dmem_a;
wire [7:0] dmem_dr;
wire [7:0] dmem_dw;

softusb_ram #(
	.pmem_width(pmem_width),
	.dmem_width(dmem_width)
) ram (
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),

	.usb_clk(usb_clk),
	.usb_rst(usb_rst),

	.wb_adr_i(wb_adr_i),
	.wb_dat_o(wb_dat_o),
	.wb_dat_i(wb_dat_i),
	.wb_sel_i(wb_sel_i),
	.wb_stb_i(wb_stb_i),
	.wb_cyc_i(wb_cyc_i),
	.wb_ack_o(wb_ack_o),
	.wb_we_i(wb_we_i),

	.pmem_ce(pmem_ce),
	.pmem_a(pmem_a),
	.pmem_d(pmem_d),

	.dmem_we(dmem_we),
	.dmem_a(dmem_a),
	.dmem_di(dmem_dw),
	.dmem_do(dmem_dr)
);

softusb_navre #(
	.pmem_width(pmem_width),
	.dmem_width(dmem_width)
) navre (
	.clk(usb_clk),
	.rst(usb_rst),

	.pmem_ce(pmem_ce),
	.pmem_a(pmem_a),
	.pmem_d(pmem_d),

	.dmem_we(dmem_we),
	.dmem_a(dmem_a),
	.dmem_di(dmem_dr),
	.dmem_do(dmem_dw),

	.io_re(io_re),
	.io_we(io_we),
	.io_a(io_a),
	.io_do(io_dw),
	.io_di(io_dr_sie|io_dr_timer)
);

endmodule
