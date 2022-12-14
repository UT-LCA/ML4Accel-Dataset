/*
 This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
   
   
AUTHOR:	
	Jagadeesh J, Design Engineer.
	Email : jagadeeshj@kenosys.in
   	Tel   : 91-8098701730
COMPANY:
	KENOSYS EMBEDDED SOLUTIONS, SALEM, TAMILNADU, INDIA			
 */

module nec (
	input clk,rst,
	input ir,
	output reg [7:0]led
	);

wire ir_in;
assign ir_in = ir;

	
reg [8:0]state_reg, state_next;
reg [31:0]led_reg, led_next;
reg [19:0]count_reg;
wire [19:0]count_next;
reg c_bit_next, c_bit_reg;
reg done_tick;
reg c_load;
wire [7:0]led_tmp;

//States
localparam [8:0]	IDLE		=	9'h001,
					START		=	9'h002,
					SYNC		=	9'h004,
					WAIT_HIGH	=	9'h008,
					FETCH		=	9'h010,
					BCOUNT		=	9'h020,
					WAIT_LOW	=	9'h040,
					CHECK		=	9'h080,
					DONE		=	9'h100;

localparam [19:0]	START_TIME	=	20'd448000,			//448000,
					SYNC_TIME	=	20'd210000,			//210000,
					CENTER		=	20'd42000;			//42000;

//Pulse Edge detection circuit
reg [1:0]e_bit;	
wire f_edge, r_edge;
always@(posedge clk, negedge rst)
	if(!rst)
		e_bit	<=	2'b00;
	else
		e_bit <= {e_bit[0],ir_in};

assign f_edge = e_bit[1] & (~e_bit[0]);
assign r_edge = (~e_bit[1]) & e_bit[0];

//Registers	
always@(posedge clk, negedge rst)
begin
	if(!rst)
	begin
		state_reg 	<= 		IDLE;
		led_reg		<= 		32'h80000000;
		count_reg	<=		20'h00000;
		c_bit_reg	<=		1'b0;
		led			<=		8'h00;
	end
	else
	begin
		state_reg 	<=		state_next;
		led_reg		<= 		led_next;
		count_reg	<=		count_next;
		c_bit_reg	<=		c_bit_next;
		led			<=		led_tmp;
	end
end

assign count_next = (c_load)?count_reg+1'b1:20'h00000;

always@*
begin
	state_next		=	state_reg;
	led_next		=	led_reg;
	done_tick 		=	1'b0;
	c_load 			=	1'b0;
	c_bit_next		=	c_bit_reg;
	case(state_reg)
		IDLE:
		begin
			if(f_edge)
				state_next = START;
		end
		START:
		begin
			c_load = 1'b1;
			if(r_edge)
			begin
				if(count_reg > START_TIME)
				begin
					state_next	=	SYNC;
					c_load = 1'b0;
				end
				else
				begin
					state_next	=	IDLE;
					c_load = 1'b0;
				end	
			end
		end
		SYNC:
		begin
			c_load = 1'b1;
			if(f_edge)
			begin
				if(count_reg > SYNC_TIME)
				begin
					state_next	=	WAIT_HIGH;
					c_load = 1'b0;
				end	
				else
				begin
					state_next	=	IDLE;
					c_load = 1'b0;
				end	
			end
		end
		WAIT_HIGH:
		begin
			if(r_edge)
				state_next	=	FETCH;
		end
		WAIT_LOW:
		begin
			if(f_edge)
				state_next	=	WAIT_HIGH;
		end
		FETCH:
		begin
			c_load = 1'b1;
			if(count_reg > CENTER)
			begin
				c_bit_next	=	led_reg[0];
				led_next 	= 	{ir_in,led_reg[31:1]};
				c_load = 1'b0;
				state_next 	=	BCOUNT;
			end
		end
		BCOUNT:
		begin
			if(c_bit_reg)
				state_next = DONE;
			else
			begin
				if(led_reg[31])
					state_next	=	WAIT_LOW;
				else
					state_next	=	WAIT_HIGH;
			end		
		end
		DONE:
		begin
			if(((led_reg[7:0]^led_reg[15:8]) == 8'hff)&&((led_reg[23:16]^led_reg[31:24]) == 8'hff))
			begin
				done_tick = 1'b1;
				led_next	=	32'h80000000;
				state_next	=	IDLE;
			end	
		end
	endcase
end
assign led_tmp = (done_tick)?led_reg[23:16]:led;
endmodule
	
