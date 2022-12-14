/*
 * This IP is a 'classic' Nintendo NES serial -> parallel converter
 * 
 * Copyright (C) 2019, Yvo Zoer
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
 
module nescontroller (
	clk,
	reset_n,
	frame,
	nes_latch,
	nes_clk,
	nes_data0,
	nes_data1,
	q0,
	q1,
	busy
	);
	
	input clk;
	input reset_n;
	input frame;
	output nes_latch;
	output nes_clk;
	input nes_data0, nes_data1;
	output [7:0] q0, q1;
	output busy = (frame != STATE_IDLE);

	// states for state-machine
	parameter STATE_IDLE		= 3'd0;
	parameter STATE_LATCH_HI	= 3'd1;	
	parameter STATE_LATCH_LO	= 3'd2;
	parameter STATE_CLOCK_LO	= 3'd3;
	parameter STATE_CLOCK_HI	= 3'd4;
	parameter STATE_DONE		= 3'd5;

	// start bit to catch single clock frame event
	reg start;
	always @(posedge clk or negedge reset_n)
		if (!reset_n)
			start <= 1'b0;
		else if ( frame )
			start <= 1'b1;
		else if ( state != STATE_IDLE )
			start <= 1'b0;
			
	// clock divider / enable -- clock needs to be around 1.5mhz or lower
	reg [3:0] clkdiv;
	always @(posedge clk or negedge reset_n)
		if (!reset_n)
			clkdiv <= 4'd0;
		else
			clkdiv <= clkdiv + 4'd1;
			
	wire enable = &clkdiv;

	// main state machine
	reg [3:0] state, next_state;
	always @(*)
		case (state)
			STATE_IDLE : begin
				if ( start )
					next_state = STATE_LATCH_HI;
				else
					next_state = STATE_IDLE;
				end
			STATE_LATCH_HI : next_state = STATE_LATCH_LO;
			STATE_LATCH_LO : next_state = STATE_CLOCK_LO;
			STATE_CLOCK_LO : next_state = STATE_CLOCK_HI;
			STATE_CLOCK_HI : begin
				if ( &count )
					next_state = STATE_DONE;
				else
					next_state = STATE_CLOCK_LO;
				end
			default : begin
				next_state = STATE_IDLE;
				end
		endcase
		
	reg nes_latch;
	always @(posedge clk or negedge reset_n)
		if (!reset_n)
			nes_latch <= 1'b0;
		else
			nes_latch <= (state == STATE_LATCH_HI);

	reg nes_clk;
	always @(posedge clk or negedge reset_n)
		if (!reset_n)
			nes_clk <= 1'b1;
		else
			nes_clk = (state == STATE_CLOCK_LO ) ? 1'b0 : 1'b1;

	reg [2:0] count, next_count;
	always @(*)
		if ( state == STATE_CLOCK_HI )
			next_count = count + 3'd1;
		else
			next_count = count;
			
	reg [7:0] q0, next_q0;
	reg [7:0] q1, next_q1;
	always @(*)
		if ( state == STATE_CLOCK_LO )
			begin
				next_q0 = { q0[6:0], nes_data1 };		// reversed due to board layout
				next_q1 = { q1[6:0], nes_data0 };
			end
		else
			begin
				next_q0 = q0;
				next_q1 = q1;
			end

	always @(posedge clk or negedge reset_n )
		if (!reset_n)
			begin
				state <= STATE_IDLE;
				count <= 3'd0;
				q0 <= 8'h00;
				q1 <= 8'h00;
			end
		else if ( enable )
			begin
				state <= next_state;
				count <= next_count;
				q0 <= next_q0;
				q1 <= next_q1;
			end
	
endmodule
