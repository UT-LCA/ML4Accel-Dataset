
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2019 Himar Alonso
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this hardware, software, and associated documentation files
// (the "Product"), to deal in the Product without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Product, and to permit
// persons to whom the Product is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Product.
//
// THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE PRODUCT OR THE USE OR OTHER DEALINGS IN THE
// PRODUCT. 
//
////////////////////////////////////////////////////////////////////////////////
// A429 Receiving Interface
// 
// Designed by Himar Alonso (himar@opencores.org)
// Date: 15/08/2019
////////////////////////////////////////////////////////////////////////////////

module a429_rx_iface
(
	input             clk2M,
	input             reset,
	input             enable,
	input       [1:0] speed,
	input             a429_in_a,
	input             a429_in_b,
	input             parcheck,
	output reg [32:1] data,
	output reg        wr_en
);

	////////////////////////////////////////
	// Constants for the sampling counter //
	////////////////////////////////////////
	// Counter values for first/other sampling intervals
	// 2.5us/10us for 100Kbps mode,
	// 20us/80us for 12,5Kbps mode.
	wire [8:0] first_sc_value = (speed[0]) ? 9'd4  : 9'd39;
	wire [8:0] other_sc_value = (speed[0]) ? 9'd19 : 9'd159;
	
	// Counter values for gap search
	// 40us for 100Kbps mode, setting it to 30us
	// 320us for 12,5Kbps mode, setting it to 240us.
	wire [8:0] gap_sc_value = (speed[0]) ? 9'd59 : 9'd479;
	
	///////////////////////////////////////////////////////
	// Register 'aorb' previous value for edge detection //
	///////////////////////////////////////////////////////
	wire aandb = a429_in_a & a429_in_b;
	wire aorb = a429_in_a | a429_in_b;
	reg  aorb_prev;

	always @(posedge clk2M or posedge reset)
		if (reset)
			aorb_prev <= 1'b0;
		else
			aorb_prev <= aorb;
					
	///////////////////////////////////////////////
	// RX state machine parameters and registers //
	///////////////////////////////////////////////
	localparam IDLE       = 2'b00;
	localparam RECEIVING  = 2'b01;
	localparam WAITFORGAP =	2'b10;

	reg   [1:0] state;
	reg         parity;
	reg  [32:1] shift_reg;
	reg   [4:0] shift_counter;
	reg   [8:0] sampling_counter;

	/////////////////////////////////////
	// RX state machine implementation //
	/////////////////////////////////////
	always @(posedge clk2M or posedge reset)
		if (reset) begin
			state <= WAITFORGAP;
			sampling_counter <= gap_sc_value;
			shift_counter <= 5'b0;
			data <= 32'b0;
			shift_reg <= 32'b0;
			wr_en <= 1'b0;
		end else begin
			case (state)
				IDLE:
					//
					// Wait for 'aorb' rising edge
					//
					begin
						parity <= 1'b0;
						sampling_counter <= first_sc_value;
						shift_counter <= 5'd31;
						if (aorb & !aorb_prev)
							state <= RECEIVING;
					end
				RECEIVING:
					//
					// Logical shift right until shift_counter = 0
					//
					if (~|sampling_counter)
						if ((aandb == 1'b1) || (aorb == 1'b0)) begin // Bus error
							sampling_counter <= gap_sc_value;
							state <= WAITFORGAP;
						end else if (~|shift_counter) begin // Complete word received
							data <= {a429_in_a, shift_reg[32:10],
								shift_reg[2], shift_reg[3], shift_reg[4], shift_reg[5],
								shift_reg[6], shift_reg[7], shift_reg[8], shift_reg[9]};
							if ((parity == a429_in_b) || !parcheck) // Odd parity ok, or no parity check
								wr_en <= 1'b1;
							sampling_counter <= gap_sc_value;
							state <= WAITFORGAP;
						end else begin // bit received
							shift_reg <= {a429_in_a, shift_reg[32:2]};
							parity <= parity ^ a429_in_a;
							shift_counter <= shift_counter - 5'b1;
							sampling_counter <= other_sc_value;
						end
					else
						sampling_counter <= sampling_counter - 9'b1;
				WAITFORGAP:
					//
					// Wait until a new gap is found
					//
					begin
						wr_en <= 1'b0;
						if (~|sampling_counter)
							state <= IDLE;
						else if (aorb == 1'b1)
							sampling_counter <= gap_sc_value;
						else
							sampling_counter <= sampling_counter - 9'b1;
					end
				default: // This should never happen
					begin
						wr_en <= 1'b0;
						sampling_counter <= gap_sc_value;
						state <= WAITFORGAP;
					end
			endcase
		end
		
endmodule

////////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2019 Himar Alonso
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this hardware, software, and associated documentation files
// (the "Product"), to deal in the Product without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Product, and to permit
// persons to whom the Product is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Product.
//
// THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE PRODUCT OR THE USE OR OTHER DEALINGS IN THE
// PRODUCT. 
//
////////////////////////////////////////////////////////////////////////////////
// A429 Transmitting Interface
// 
// Designed by Himar Alonso (himar@opencores.org)
// Date: 15/08/2019
////////////////////////////////////////////////////////////////////////////////

module a429_tx_iface
(
	input         clk2M,
	input         reset,
	input         enable,
	input   [1:0] speed,
	input         par_gen, // NOT implemented yet (data must include valid parity bit)
	input   [6:0] gap_bits,	// Values between 4 and 64
	input  [32:1] data,
	input         tx_req,
	output        a429_out_a,
	output        a429_out_b,
	output        ready
);

	//////////////////////////////////////////////////////
	// Generate clk429 according to the 'speed' setting //
	//////////////////////////////////////////////////////
	reg        clk429 = 1'b0;
	reg  [7:0] clk429_counter = 1'b0;
	wire [7:0] clk429_max_count  = (speed[0]) ? 8'd19 : 8'd159;
	wire [7:0] clk429_half_count = (speed[0]) ? 8'd10 : 8'd80;

	always @(posedge clk2M or posedge reset)
		if (reset)
			clk429 <= 1'b0;
		else
			clk429 <= (clk429_counter < clk429_half_count) ? 1'b1 : 1'b0;

	always @(posedge clk2M or posedge reset)
		if (reset)
			clk429_counter <= 8'b0;
		else if (clk429_counter >= clk429_max_count)
			clk429_counter <= 8'b0;
		else
			clk429_counter <= clk429_counter + 8'b1;

	
	/////////////////////////////////////////////////////////////////////////
	// Format the output word by reversing the bits from the 'label' field //
	/////////////////////////////////////////////////////////////////////////
	wire [32:1]  a429_formatted_data = {data[32:9], data[1], data[2], data[3],
		data[4], data[5], data[6], data[7], data[8]};

	////////////////////////
	// Output assignments //
	////////////////////////
	// Generate a429_out_a and a429_out_b using RZ (return to zero) encoding
	// NOTE: Output is only active when transmitting data
	assign a429_out_a = (clk429 & (state == TRANSMITTING)) ? a429_out_a_bit : 1'b0;
	assign a429_out_b = (clk429 & (state == TRANSMITTING)) ? a429_out_b_bit : 1'b0;
	// Get output serial data from shif_reg's LSB
	wire a429_out_a_bit = shift_reg[1];
	wire a429_out_b_bit = ~shift_reg[1];
	// Ready to receive new data when state == IDLE
	assign ready = (state == IDLE);
	
	///////////////////////////////////////////////
	// TX state machine parameters and registers //
	///////////////////////////////////////////////
	localparam	IDLE         = 2'b00;
	localparam	TRANSMITTING = 2'b01;
	localparam	WAITING      = 2'b10;

	reg  [1:0] state;
	reg [32:1] shift_reg;
	reg  [4:0] shift_counter;
	reg  [6:0] gap_counter;

	/////////////////////////////////////
	// TX state machine implementation //
	/////////////////////////////////////
	always @(posedge clk429 or posedge reset)
		if (reset) begin
			state <= IDLE;
			shift_reg <= 32'b0;
			shift_counter <= 5'b0;
			gap_counter <= 6'b0;
		end else if (enable) begin
			case (state)
				IDLE:
					//
					// Wait for transmission request
					//
					if (tx_req == 1'b1) begin
						shift_reg <= a429_formatted_data;
						shift_counter <= 5'b11111;
						state <= TRANSMITTING;
					end
				TRANSMITTING:
					//
					// Logical shift right until shift_counter = 0
					//
					begin
						shift_reg <= {shift_reg[1], shift_reg[32:2]};
						if (~|shift_counter) begin
							// Substract state transition time (2 clock cycles)
							// from total waiting time. The specification sets
							// a minimum gap of 4 clock cycles and a maximum
							// gap of 64 clock cycles between data words
							if (gap_bits < 7'd4) // Minimum: 4
								gap_counter <= 7'd2;
							else if (gap_bits > 7'd64) // Maximum: 64
								gap_counter <= 7'd62;
							else
								gap_counter <= gap_bits - 7'd2;
							state <= WAITING;
						end else begin
							shift_counter <= shift_counter - 5'b1;
						end
					end
				WAITING:
					//
					// Wait specified time before fetching next ARINC 429 data word
					//
					if (~|gap_counter) // gap_counter == 0
						state <= IDLE;
					else
						gap_counter <= gap_counter - 7'b1;
				default: // This should never happen
					state <= IDLE;
			endcase
		end else begin // enable == 0
			state <= IDLE;
			shift_reg <= 32'b0;
			shift_counter <= 5'b0;
			gap_counter <= 6'b0;
		end
	
endmodule
