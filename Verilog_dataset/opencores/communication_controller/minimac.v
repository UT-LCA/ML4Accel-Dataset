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

module minimac_ctlif #(
	parameter csr_addr = 4'h0
) (
	input sys_clk,
	input sys_rst,

	input [13:0] csr_a,
	input csr_we,
	input [31:0] csr_di,
	output reg [31:0] csr_do,

	output reg irq_rx,
	output reg irq_tx,

	output reg rx_rst,
	output reg tx_rst,

	output rx_valid,
	output [29:0] rx_adr,
	input rx_resetcount,
	input rx_incrcount,
	input rx_endframe,
	input fifo_full,

	output tx_valid,
	output reg [29:0] tx_adr,
	output reg [1:0] tx_bytecount,
	input tx_next,

	output reg phy_mii_clk,
	inout phy_mii_data
);

reg mii_data_oe;
reg mii_data_do;
assign phy_mii_data = mii_data_oe ? mii_data_do : 1'bz;

/* Be paranoid about metastability */
reg mii_data_di1;
reg mii_data_di;
always @(posedge sys_clk) begin
	mii_data_di1 <= phy_mii_data;
	mii_data_di <= mii_data_di1;
end

/*
 * RX Slots
 *
 * State:
 * 00 -> slot is not in use
 * 01 -> slot has been loaded with a buffer
 * 10 -> slot has received a packet
 * 11 -> invalid
 */
reg [1:0] slot0_state;
reg [29:0] slot0_adr;
reg [10:0] slot0_count;
reg [1:0] slot1_state;
reg [29:0] slot1_adr;
reg [10:0] slot1_count;
reg [1:0] slot2_state;
reg [29:0] slot2_adr;
reg [10:0] slot2_count;
reg [1:0] slot3_state;
reg [29:0] slot3_adr;
reg [10:0] slot3_count;

wire select0 = slot0_state[0];
wire select1 = slot1_state[0] & ~slot0_state[0];
wire select2 = slot2_state[0] & ~slot1_state[0] & ~slot0_state[0];
wire select3 = slot3_state[0] & ~slot2_state[0] & ~slot1_state[0] & ~slot0_state[0];

assign rx_valid = slot0_state[0] | slot1_state[0] | slot2_state[0] | slot3_state[0];
assign rx_adr =  {30{select0}} & slot0_adr
		|{30{select1}} & slot1_adr
		|{30{select2}} & slot2_adr
		|{30{select3}} & slot3_adr;

/*
 * TX
 */
reg [10:0] tx_remaining;
assign tx_valid = |tx_remaining;

wire csr_selected = csr_a[13:10] == csr_addr;

always @(posedge sys_clk) begin
	if(sys_rst) begin
		csr_do <= 32'd0;

		rx_rst <= 1'b1;
		tx_rst <= 1'b1;

		mii_data_oe <= 1'b0;
		mii_data_do <= 1'b0;
		phy_mii_clk <= 1'b0;

		slot0_state <= 2'b00;
		slot0_adr <= 30'd0;
		slot0_count <= 11'd0;
		slot1_state <= 2'b00;
		slot1_adr <= 30'd0;
		slot1_count <= 11'd0;
		slot2_state <= 2'b00;
		slot2_adr <= 30'd0;
		slot2_count <= 11'd0;
		slot3_state <= 2'b00;
		slot3_adr <= 30'd0;
		slot3_count <= 11'd0;

		tx_remaining <= 11'd0;
		tx_adr <= 30'd0;
		tx_bytecount <= 2'd0;
	end else begin
		csr_do <= 32'd0;
		if(csr_selected) begin
			if(csr_we) begin
				case(csr_a[3:0])
					4'd0 : begin
						tx_rst <= csr_di[1];
						rx_rst <= csr_di[0];
					end

					4'd1 : begin
						phy_mii_clk <= csr_di[3];
						mii_data_oe <= csr_di[2];
						mii_data_do <= csr_di[0];
					end

					4'd2 : begin
						slot0_state <= csr_di[1:0];
						slot0_count <= 11'd0;
					end
					4'd3 : slot0_adr <= csr_di[31:2];
					// slot0_count is read-only
					4'd5 : begin
						slot1_state <= csr_di[1:0];
						slot1_count <= 11'd0;
					end
					4'd6 : slot1_adr <= csr_di[31:2];
					// slot1_count is read-only
					4'd8 : begin
						slot2_state <= csr_di[1:0];
						slot2_count <= 11'd0;
					end
					4'd9 : slot2_adr <= csr_di[31:2];
					// slot2_count is read-only
					4'd11: begin
						slot3_state <= csr_di[1:0];
						slot3_count <= 11'd0;
					end
					4'd12: slot3_adr <= csr_di[31:2];
					// slot3_count is read-only

					4'd14: tx_adr <= csr_di[31:2];
					4'd15: begin
						tx_remaining <= csr_di[10:0];
						tx_bytecount <= 2'd0;
					end
				endcase
			end
			case(csr_a[3:0])
				4'd0 : csr_do <= {tx_rst, rx_rst};

				4'd1 : csr_do <= {phy_mii_clk, mii_data_oe, mii_data_di, mii_data_do};
				
				4'd2 : csr_do <= slot0_state;
				4'd3 : csr_do <= {slot0_adr, 2'd0};
				4'd4 : csr_do <= slot0_count;
				4'd5 : csr_do <= slot1_state;
				4'd6 : csr_do <= {slot1_adr, 2'd0};
				4'd7 : csr_do <= slot1_count;
				4'd8 : csr_do <= slot2_state;
				4'd9 : csr_do <= {slot2_adr, 2'd0};
				4'd10: csr_do <= slot2_count;
				4'd11: csr_do <= slot3_state;
				4'd12: csr_do <= {slot3_adr, 2'd0};
				4'd13: csr_do <= slot3_count;

				4'd14: csr_do <= tx_adr;
				4'd15: csr_do <= tx_remaining;
			endcase
		end

		if(fifo_full)
			rx_rst <= 1'b1;

		if(rx_resetcount) begin
			if(select0)
				slot0_count <= 11'd0;
			if(select1)
				slot1_count <= 11'd0;
			if(select2)
				slot2_count <= 11'd0;
			if(select3)
				slot3_count <= 11'd0;
		end
		if(rx_incrcount) begin
			if(select0)
				slot0_count <= slot0_count + 11'd1;
			if(select1)
				slot1_count <= slot1_count + 11'd1;
			if(select2)
				slot2_count <= slot2_count + 11'd1;
			if(select3)
				slot3_count <= slot3_count + 11'd1;
		end
		if(rx_endframe) begin
			if(select0)
				slot0_state <= 2'b10;
			if(select1)
				slot1_state <= 2'b10;
			if(select2)
				slot2_state <= 2'b10;
			if(select3)
				slot3_state <= 2'b10;
		end

		if(tx_next) begin
			tx_remaining <= tx_remaining - 11'd1;
			tx_bytecount <= tx_bytecount + 2'd1;
			if(tx_bytecount == 2'd3)
				tx_adr <= tx_adr + 30'd1;
		end
	end
end

/* Interrupt logic */

reg tx_valid_r;

always @(posedge sys_clk) begin
	if(sys_rst) begin
		irq_rx <= 1'b0;
		tx_valid_r <= 1'b0;
		irq_tx <= 1'b0;
	end else begin
		irq_rx <= slot0_state[1] | slot1_state[1] | slot2_state[1] | slot3_state[1] | rx_rst;
		tx_valid_r <= tx_valid;
		irq_tx <= tx_valid_r & ~tx_valid;
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

module minimac_rxfifo(
	input sys_clk,
	input rx_rst,

	input phy_rx_clk,
	input [3:0] phy_rx_data,
	input phy_dv,
	input phy_rx_er,

	output empty,
	input ack,
	output eof,
	output [7:0] data,

	output reg fifo_full
);

/*
 * EOF = 0		frame data
 * EOF = 1, data[0] = 0	frame completed without errors
 * EOF = 1, data[0] = 1	frame completed with errors
 */

wire [8:0] fifo_out;
assign eof = fifo_out[8];
assign data = fifo_out[7:0];

reg fifo_eof;
reg [3:0] fifo_hi;
reg [3:0] fifo_lo;
wire [8:0] fifo_in = {fifo_eof, fifo_hi, fifo_lo};
reg fifo_we;
wire full;

asfifo #(
	.data_width(9),
	.address_width(7)
) fifo (
	.data_out(fifo_out),
	.empty(empty),
	.read_en(ack),
	.clk_read(sys_clk),

	.data_in(fifo_in),
	.full(full),
	.write_en(fifo_we),
	.clk_write(phy_rx_clk),
	
	.rst(rx_rst)
);

/* we assume f(sys_clk) > f(phy_rx_clk) */
reg fifo_full1;
always @(posedge sys_clk) begin
	fifo_full1 <= full;
	fifo_full <= fifo_full1;
end

reg rx_rst1;
reg rx_rst2;

always @(posedge phy_rx_clk) begin
	rx_rst1 <= rx_rst;
	rx_rst2 <= rx_rst1;
end

reg hi_nibble;
reg abort;
reg phy_dv_r;

always @(posedge phy_rx_clk) begin
	if(rx_rst2) begin
		fifo_we <= 1'b0;
		fifo_eof <= 1'b0;
		fifo_hi <= 4'd0;
		fifo_lo <= 4'd0;
		hi_nibble <= 1'b0;
		abort <= 1'b0;
		phy_dv_r <= 1'b0;
	end else begin
		fifo_eof <= 1'b0;
		fifo_we <= 1'b0;

		/* Transfer data */
		if(~abort) begin
			if(~hi_nibble) begin
				fifo_lo <= phy_rx_data;
				if(phy_dv)
					hi_nibble <= 1'b1;
			end else begin
				fifo_hi <= phy_rx_data;
				fifo_we <= 1'b1;
				hi_nibble <= 1'b0;
			end
		end

		/* Detect error events */
		if(phy_dv & phy_rx_er) begin
			fifo_eof <= 1'b1;
			fifo_hi <= 4'd0;
			fifo_lo <= 4'd1;
			fifo_we <= 1'b1;
			abort <= 1'b1;
			hi_nibble <= 1'b0;
		end

		/* Detect end of frame */
		phy_dv_r <= phy_dv;
		if(phy_dv_r & ~phy_dv) begin
			if(~abort) begin
				fifo_eof <= 1'b1;
				fifo_hi <= 4'd0;
				fifo_lo <= 4'd0;
				fifo_we <= 1'b1;
			end
			abort <= 1'b0;
			hi_nibble <= 1'b0;
		end
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

module minimac_rx(
	input sys_clk,
	input sys_rst,
	input rx_rst,

	output [31:0] wbm_adr_o,
	output wbm_cyc_o,
	output wbm_stb_o,
	input wbm_ack_i,
	output reg [31:0] wbm_dat_o,

	input rx_valid,
	input [29:0] rx_adr,
	output rx_resetcount,
	output rx_incrcount,
	output rx_endframe,

	output fifo_full,

	input phy_rx_clk,
	input [3:0] phy_rx_data,
	input phy_dv,
	input phy_rx_er
);

reg rx_resetcount_r;
reg rx_endframe_r;
assign rx_resetcount = rx_resetcount_r;
assign rx_endframe = rx_endframe_r;

reg bus_stb;
assign wbm_cyc_o = bus_stb;
assign wbm_stb_o = bus_stb;

wire fifo_empty;
reg fifo_ack;
wire fifo_eof;
wire [7:0] fifo_data;
minimac_rxfifo rxfifo(
	.sys_clk(sys_clk),
	.rx_rst(rx_rst),

	.phy_rx_clk(phy_rx_clk),
	.phy_rx_data(phy_rx_data),
	.phy_dv(phy_dv),
	.phy_rx_er(phy_rx_er),

	.empty(fifo_empty),
	.ack(fifo_ack),
	.eof(fifo_eof),
	.data(fifo_data),

	.fifo_full(fifo_full)
);

reg start_of_frame;
reg end_of_frame;
reg in_frame;
always @(posedge sys_clk) begin
	if(sys_rst|rx_rst)
		in_frame <= 1'b0;
	else begin
		if(start_of_frame)
			in_frame <= 1'b1;
		if(end_of_frame)
			in_frame <= 1'b0;
	end
end

reg loadbyte_en;
reg [1:0] loadbyte_counter;
always @(posedge sys_clk) begin
	if(sys_rst|rx_rst)
		loadbyte_counter <= 1'b0;
	else begin
		if(start_of_frame)
			loadbyte_counter <= 1'b0;
		else if(loadbyte_en)
			loadbyte_counter <= loadbyte_counter + 2'd1;
		if(loadbyte_en) begin
			case(loadbyte_counter)
				2'd0: wbm_dat_o[31:24] <= fifo_data;
				2'd1: wbm_dat_o[23:16] <= fifo_data;
				2'd2: wbm_dat_o[15: 8] <= fifo_data;
				2'd3: wbm_dat_o[ 7: 0] <= fifo_data;
			endcase
		end
	end
end
wire full_word = &loadbyte_counter;
wire empty_word = loadbyte_counter == 2'd0;

parameter MTU = 11'd1530;

reg [10:0] maxcount;
always @(posedge sys_clk) begin
	if(sys_rst|rx_rst)
		maxcount <= MTU;
	else begin
		if(start_of_frame)
			maxcount <= MTU;
		else if(loadbyte_en)
			maxcount <= maxcount - 11'd1;
	end
end
wire still_place = |maxcount;

assign rx_incrcount = loadbyte_en;

reg next_wb_adr;
reg [29:0] adr;
always @(posedge sys_clk) begin
	if(sys_rst)
		adr <= 30'd0;
	else begin
		if(start_of_frame)
			adr <= rx_adr;
		if(next_wb_adr)
			adr <= adr + 30'd1;
	end
end
assign wbm_adr_o = {adr, 2'd0};

reg [2:0] state;
reg [2:0] next_state;

parameter IDLE		= 3'd0;
parameter LOADBYTE	= 3'd1;
parameter WBSTROBE	= 3'd2;
parameter SENDLAST	= 3'd3;
parameter NOMORE	= 3'd3;

always @(posedge sys_clk) begin
	if(sys_rst)
		state <= IDLE;
	else
		state <= next_state;
end

always @(*) begin
	next_state = state;
	fifo_ack = 1'b0;

	rx_resetcount_r = 1'b0;
	rx_endframe_r = 1'b0;

	start_of_frame = 1'b0;
	end_of_frame = 1'b0;

	loadbyte_en = 1'b0;

	bus_stb = 1'b0;

	next_wb_adr = 1'b0;

	case(state)
		IDLE: begin
			if(~fifo_empty & rx_valid) begin
				if(fifo_eof) begin
					fifo_ack = 1'b1;
					if(in_frame) begin
						if(fifo_data[0])
							rx_resetcount_r = 1'b1;
						else begin
							if(empty_word)
								rx_endframe_r = 1'b1;
							else
								next_state = SENDLAST;
						end
						end_of_frame = 1'b1;
					end
				end else begin
					if(~in_frame)
						start_of_frame = 1'b1;
					next_state = LOADBYTE;
				end
			end
		end
		LOADBYTE: begin
			loadbyte_en = 1'b1;
			fifo_ack = 1'b1;
			if(full_word & rx_valid)
				next_state = WBSTROBE;
			else
				next_state = IDLE;
		end
		WBSTROBE: begin
			bus_stb = 1'b1;
			if(wbm_ack_i) begin
				if(still_place)
					next_state = IDLE;
				else
					next_state = NOMORE;
				next_wb_adr = 1'b1;
			end
		end
		SENDLAST: begin
			bus_stb = 1'b1;
			if(wbm_ack_i) begin
				rx_endframe_r = 1'b1;
				next_state = IDLE;
			end
		end
		NOMORE: begin
			fifo_ack = 1'b1;
			if(~fifo_empty & rx_valid) begin
				if(fifo_eof) begin
					rx_resetcount_r = 1'b1;
					end_of_frame = 1'b1;
					next_state = IDLE;
				end
			end
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

module minimac_txfifo(
	input sys_clk,
	input tx_rst,

	input stb,
	input [7:0] data,
	output full,
	input can_tx,
	output reg empty,

	input phy_tx_clk,
	output reg phy_tx_en,
	output reg [3:0] phy_tx_data
);

wire [7:0] fifo_out;
wire fifo_empty;
reg fifo_read;

reg empty2;
always @(posedge sys_clk) begin
	empty2 <= fifo_empty;
	empty <= empty2;
end

asfifo #(
	.data_width(8),
	.address_width(7)
) fifo (
	.data_out(fifo_out),
	.empty(fifo_empty),
	.read_en(fifo_read),
	.clk_read(phy_tx_clk),

	.data_in(data),
	.full(full),
	.write_en(stb),
	.clk_write(sys_clk),

	.rst(tx_rst)
);

reg can_tx1;
reg can_tx2;
always @(posedge phy_tx_clk) begin
	can_tx1 <= can_tx;
	can_tx2 <= can_tx1;
end

reg tx_rst1;
reg tx_rst2;
always @(posedge phy_tx_clk) begin
	tx_rst1 <= tx_rst;
	tx_rst2 <= tx_rst1;
end

wire interframe_gap;
wire transmitting = can_tx2 & ~fifo_empty & ~interframe_gap;

reg transmitting_r;
always @(posedge phy_tx_clk)
	transmitting_r <= transmitting;

reg [4:0] interframe_counter;
always @(posedge phy_tx_clk) begin
	if(tx_rst2)
		interframe_counter <= 5'd0;
	else begin
		if(transmitting_r & ~transmitting)
			interframe_counter <= 5'd24;
		else if(interframe_counter != 5'd0)
			interframe_counter <= interframe_counter - 5'd1;
	end
end
assign interframe_gap = |interframe_counter;

reg hi_nibble;

always @(posedge phy_tx_clk) begin
	if(tx_rst2) begin
		hi_nibble <= 1'b0;
		phy_tx_en <= 1'b0;
	end else begin
		hi_nibble <= 1'b0;
		phy_tx_en <= 1'b0;
		fifo_read <= 1'b0;

		if(transmitting) begin
			phy_tx_en <= 1'b1;
			if(~hi_nibble) begin
				phy_tx_data <= fifo_out[3:0];
				fifo_read <= 1'b1;
				hi_nibble <= 1'b1;
			end else begin
				phy_tx_data <= fifo_out[7:4];
				hi_nibble <= 1'b0;
			end
		end
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

module minimac_tx(
	input sys_clk,
	input sys_rst,
	input tx_rst,

	input tx_valid,
	input [29:0] tx_adr,
	input [1:0] tx_bytecount,
	output reg tx_next,

	output [31:0] wbtx_adr_o,
	output wbtx_cyc_o,
	output wbtx_stb_o,
	input wbtx_ack_i,
	input [31:0] wbtx_dat_i,

	input phy_tx_clk,
	output phy_tx_en,
	output [3:0] phy_tx_data
);

reg bus_stb;
assign wbtx_cyc_o = bus_stb;
assign wbtx_stb_o = bus_stb;

assign wbtx_adr_o = {tx_adr, 2'd0};

reg stb;
reg [7:0] data;
wire full;
reg can_tx;
wire empty;

minimac_txfifo txfifo(
	.sys_clk(sys_clk),
	.tx_rst(tx_rst),

	.stb(stb),
	.data(data),
	.full(full),
	.can_tx(can_tx),
	.empty(empty),

	.phy_tx_clk(phy_tx_clk),
	.phy_tx_en(phy_tx_en),
	.phy_tx_data(phy_tx_data)
);

reg load_input;
reg [31:0] input_reg;

always @(posedge sys_clk)
	if(load_input)
		input_reg <= wbtx_dat_i;

always @(*) begin
	case(tx_bytecount)
		2'd0: data = input_reg[31:24];
		2'd1: data = input_reg[23:16];
		2'd2: data = input_reg[16: 8];
		2'd3: data = input_reg[ 7: 0];
	endcase
end

wire firstbyte = tx_bytecount == 2'd0;

reg purge;

/* fetch FSM */

reg [1:0] state;
reg [1:0] next_state;

parameter IDLE  = 2'd0;
parameter FETCH = 2'd1;
parameter WRITE1 = 2'd2;

always @(posedge sys_clk) begin
	if(sys_rst)
		state <= IDLE;
	else
		state <= next_state;
end

always @(*) begin
	next_state = state;
	
	load_input = 1'b0;
	tx_next = 1'b0;

	stb = 1'b0;

	bus_stb = 1'b0;

	case(state)
		IDLE: begin
			if(tx_valid & ~full & ~purge) begin
				if(firstbyte)
					next_state = FETCH;
				else begin
					stb = 1'b1;
					tx_next = 1'b1;
				end
			end
		end
		FETCH: begin
			bus_stb = 1'b1;
			load_input = 1'b1;
			if(wbtx_ack_i)
				next_state = WRITE1;
		end
		WRITE1: begin
			stb = 1'b1;
			tx_next = 1'b1;
			next_state = IDLE;
		end
	endcase
end

/* Byte counter */
reg reset_byte_counter;
reg [6:0] byte_counter;

always @(posedge sys_clk) begin
	if(sys_rst)
		byte_counter <= 7'd0;
	else begin
		if(reset_byte_counter)
			byte_counter <= 7'd0;
		else if(stb)
			byte_counter <= byte_counter + 7'd1;
	end
end

wire tx_level_reached = byte_counter[6];

/* FIFO control FSM */

reg [1:0] fstate;
reg [1:0] next_fstate;

parameter FIDLE		= 2'd0;
parameter FWAITFULL	= 2'd1;
parameter FTX		= 2'd2;
parameter FPURGE	= 2'd3;

always @(posedge sys_clk) begin
	if(sys_rst)
		fstate <= FIDLE;
	else
		fstate <= next_fstate;
end

always @(*) begin
	next_fstate = fstate;

	can_tx = 1'b0;
	purge = 1'b0;
	reset_byte_counter = 1'b1;
	
	case(fstate)
		FIDLE: begin
			if(tx_valid)
				next_fstate = FWAITFULL;
		end
		/* Wait for the FIFO to fill to 64 bytes (< ethernet minimum of 72)
		 * before starting transmission. */
		FWAITFULL: begin
			reset_byte_counter = 1'b0;
			if(tx_level_reached)
				next_fstate = FTX;
		end
		FTX: begin
			can_tx = 1'b1;
			if(~tx_valid) begin
				purge = 1'b1;
				next_fstate = FPURGE;
			end
		end
		FPURGE: begin
			can_tx = 1'b1;
			purge = 1'b1;
			if(empty)
				next_fstate = FIDLE;
			/* NB! there is a potential bug because of the latency
			 * introducted by the synchronizer on can_tx in txfifo.
			 * However, the interframe gap prevents it to happen
			 * unless f(sys_clk) >> f(phy_tx_clk).
			 */
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

module minimac #(
	parameter csr_addr = 4'h0
) (
	input sys_clk,
	input sys_rst,

	input [13:0] csr_a,
	input csr_we,
	input [31:0] csr_di,
	output [31:0] csr_do,

	output irq_rx,
	output irq_tx,

	// WE=1 and SEL=1111 are assumed
	output [31:0] wbrx_adr_o,
	output [2:0] wbrx_cti_o,
	output wbrx_cyc_o,
	output wbrx_stb_o,
	input wbrx_ack_i,
	output [31:0] wbrx_dat_o,

	// WE=0 is assumed
	output [31:0] wbtx_adr_o,
	output [2:0] wbtx_cti_o,
	output wbtx_cyc_o,
	output wbtx_stb_o,
	input wbtx_ack_i,
	input [31:0] wbtx_dat_i,

	input phy_tx_clk,
	output [3:0] phy_tx_data,
	output phy_tx_en,
	output phy_tx_er,
	input phy_rx_clk,
	input [3:0] phy_rx_data,
	input phy_dv,
	input phy_rx_er,
	input phy_col,
	input phy_crs,
	output phy_mii_clk,
	inout phy_mii_data
);

assign wbrx_cti_o = 3'd0;
assign wbtx_cti_o = 3'd0;

wire rx_rst;
wire tx_rst;

wire rx_valid;
wire [29:0] rx_adr;
wire rx_resetcount;
wire rx_incrcount;
wire rx_endframe;

wire fifo_full;

wire tx_valid;
wire [29:0] tx_adr;
wire [1:0] tx_bytecount;
wire tx_next;

minimac_ctlif #(
	.csr_addr(csr_addr)
) ctlif (
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),

	.csr_a(csr_a),
	.csr_we(csr_we),
	.csr_di(csr_di),
	.csr_do(csr_do),

	.irq_rx(irq_rx),
	.irq_tx(irq_tx),

	.rx_rst(rx_rst),
	.tx_rst(tx_rst),

	.rx_valid(rx_valid),
	.rx_adr(rx_adr),
	.rx_resetcount(rx_resetcount),
	.rx_incrcount(rx_incrcount),
	.rx_endframe(rx_endframe),

	.fifo_full(fifo_full),

	.tx_valid(tx_valid),
	.tx_adr(tx_adr),
	.tx_bytecount(tx_bytecount),
	.tx_next(tx_next),

	.phy_mii_clk(phy_mii_clk),
	.phy_mii_data(phy_mii_data)
);

minimac_rx rx(
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),
	.rx_rst(rx_rst),

	.wbm_adr_o(wbrx_adr_o),
	.wbm_cyc_o(wbrx_cyc_o),
	.wbm_stb_o(wbrx_stb_o),
	.wbm_ack_i(wbrx_ack_i),
	.wbm_dat_o(wbrx_dat_o),

	.rx_valid(rx_valid),
	.rx_adr(rx_adr),
	.rx_resetcount(rx_resetcount),
	.rx_incrcount(rx_incrcount),
	.rx_endframe(rx_endframe),

	.fifo_full(fifo_full),

	.phy_rx_clk(phy_rx_clk),
	.phy_rx_data(phy_rx_data),
	.phy_dv(phy_dv),
	.phy_rx_er(phy_rx_er)
);

minimac_tx tx(
	.sys_clk(sys_clk),
	.sys_rst(sys_rst),
	.tx_rst(tx_rst),

	.tx_valid(tx_valid),
	.tx_adr(tx_adr),
	.tx_bytecount(tx_bytecount),
	.tx_next(tx_next),

	.wbtx_adr_o(wbtx_adr_o),
	.wbtx_cyc_o(wbtx_cyc_o),
	.wbtx_stb_o(wbtx_stb_o),
	.wbtx_ack_i(wbtx_ack_i),
	.wbtx_dat_i(wbtx_dat_i),

	.phy_tx_clk(phy_tx_clk),
	.phy_tx_en(phy_tx_en),
	.phy_tx_data(phy_tx_data)
);

assign phy_tx_er = 1'b0;

endmodule
