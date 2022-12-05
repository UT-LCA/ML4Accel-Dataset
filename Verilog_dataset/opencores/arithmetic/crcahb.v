//////////////////////////////////////////////////////////////////
////
////
//// 	CRCAHB CORE BLOCK
////
////
////
//// This file is part of the APB to I2C project
////
//// http://www.opencores.org/cores/apbi2c/
////
////
////
//// Description
////
//// Implementation of APB IP core according to
////
//// crcahb IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): -  Julio Cesar 
////
///////////////////////////////////////////////////////////////// 
////
////
//// Copyright (C) 2009 Authors and OPENCORES.ORG
////
////
////
//// This source file may be used and distributed without
////
//// restriction provided that this copyright statement is not
////
//// removed from the file and that any derivative work contains
//// the original copyright notice and the associated disclaimer.
////
////
//// This source file is free software; you can redistribute it
////
//// and/or modify it under the terms of the GNU Lesser General
////
//// Public License as published by the Free Software Foundation;
//// either version 2.1 of the License, or (at your option) any
////
//// later version.
////
////
////
//// This source is distributed in the hope that it will be
////
//// useful, but WITHOUT ANY WARRANTY; without even the implied
////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
////
//// PURPOSE. See the GNU Lesser General Public License for more
//// details.
////
////
////
//// You should have received a copy of the GNU Lesser General
////
//// Public License along with this source; if not, download it
////
//// from http://www.opencores.org/lgpl.shtml
////
////
///////////////////////////////////////////////////////////////////

`define size ((DATA_SIZE/4) * (2 ** (type - 1)))

module bit_reversal
#(
	parameter DATA_SIZE = 32
)
(
	//OUTPUTS
	output [DATA_SIZE - 1 : 0] data_out,
	//INPUTS
	input  [DATA_SIZE - 1 : 0] data_in,
	input  [1 : 0] rev_type
);


//Bit reversing types
localparam NO_REVERSE = 2'b00; 
localparam BYTE       = 2'b01;
localparam HALF_WORD  = 2'b10;
localparam WORD       = 2'b11;

localparam TYPES = 4;

wire [DATA_SIZE - 1 : 0] data_reversed[0 : 3];


assign data_reversed[NO_REVERSE] = data_in; //bit order not affected

generate
	genvar i, type;
	for(type = 1 ; type < TYPES; type = type + 1)
		for(i = 0; i < DATA_SIZE; i = i + 1)
			begin
				if(i < `size)
					assign data_reversed[type][i] = data_in[`size*((i/`size) + 1) - 1 - i];
				else
					assign data_reversed[type][i] = data_in[`size*((i/`size) + 1) - 1 - (i%(`size*(i/`size)))];
			end
endgenerate

//Output Mux
assign data_out = data_reversed[rev_type];

endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	CRCAHB CORE BLOCK
////
////
////
//// This file is part of the APB to I2C project
////
//// http://www.opencores.org/cores/apbi2c/
////
////
////
//// Description
////
//// Implementation of APB IP core according to
////
//// crcahb IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): -  Julio Cesar 
////
///////////////////////////////////////////////////////////////// 
////
////
//// Copyright (C) 2009 Authors and OPENCORES.ORG
////
////
////
//// This source file may be used and distributed without
////
//// restriction provided that this copyright statement is not
////
//// removed from the file and that any derivative work contains
//// the original copyright notice and the associated disclaimer.
////
////
//// This source file is free software; you can redistribute it
////
//// and/or modify it under the terms of the GNU Lesser General
////
//// Public License as published by the Free Software Foundation;
//// either version 2.1 of the License, or (at your option) any
////
//// later version.
////
////
////
//// This source is distributed in the hope that it will be
////
//// useful, but WITHOUT ANY WARRANTY; without even the implied
////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
////
//// PURPOSE. See the GNU Lesser General Public License for more
//// details.
////
////
////
//// You should have received a copy of the GNU Lesser General
////
//// Public License along with this source; if not, download it
////
//// from http://www.opencores.org/lgpl.shtml
////
////
///////////////////////////////////////////////////////////////////



//This module implements the combinational logic for one iteration of CRC Calculation
//If conected to shift register and after n clock cycles, this module realize CRC calculation
//for n bits of data.
//If instantiated in serial form, this module realize the parallel CRC calculation
//for n bits of data.
module crc_comb
#(
	parameter CRC_SIZE      = 8,         // Define the size of CRC Code
 	parameter MASK          = 8'hff      // This mask define the level of configurability of the module
)(
	//OUTPUTS
	output [CRC_SIZE - 1 : 0] crc_out,   // CRC code after one round of calculation
	//INPUTS
	input                    data_in,    // One bit of data block
	input [CRC_SIZE - 1 : 0] crc_in,     // In cascated mode, this input is the previous calculated CRC code
	input [CRC_SIZE - 1 : 0] crc_poly,   // Generator Polynomial
  input [CRC_SIZE - 2 : 0] crc_poly_size
);

wire [CRC_SIZE - 2 : 0] MASK_REVERSED;
wire [CRC_SIZE - 1 : 0] feedback;
wire [CRC_SIZE - 2 : 0] crc_in_masked;
wire [CRC_SIZE - 2 : 0] crc_poly_size_reversed;

generate
  genvar i;
  for(i = 0; i < CRC_SIZE - 1; i = i + 1)
    begin
			assign crc_poly_size_reversed[i] = crc_poly_size[CRC_SIZE - 2 - i];
   		assign MASK_REVERSED[i] = MASK[CRC_SIZE - 2 - i]; 
		end
endgenerate

assign feedback = crc_poly & {CRC_SIZE{crc_in[CRC_SIZE - 1] ^ data_in}};
assign crc_in_masked = crc_in[CRC_SIZE - 2 : 0] & (~(crc_poly_size_reversed[CRC_SIZE - 2 : 0] & MASK_REVERSED)); 
assign crc_out = {crc_in_masked ^ feedback[CRC_SIZE - 1 : 1], feedback[0]}; 

endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	CRCAHB CORE BLOCK
////
////
////
//// This file is part of the APB to I2C project
////
//// http://www.opencores.org/cores/apbi2c/
////
////
////
//// Description
////
//// Implementation of APB IP core according to
////
//// crcahb IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): -  Julio Cesar 
////
///////////////////////////////////////////////////////////////// 
////
////
//// Copyright (C) 2009 Authors and OPENCORES.ORG
////
////
////
//// This source file may be used and distributed without
////
//// restriction provided that this copyright statement is not
////
//// removed from the file and that any derivative work contains
//// the original copyright notice and the associated disclaimer.
////
////
//// This source file is free software; you can redistribute it
////
//// and/or modify it under the terms of the GNU Lesser General
////
//// Public License as published by the Free Software Foundation;
//// either version 2.1 of the License, or (at your option) any
////
//// later version.
////
////
////
//// This source is distributed in the hope that it will be
////
//// useful, but WITHOUT ANY WARRANTY; without even the implied
////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
////
//// PURPOSE. See the GNU Lesser General Public License for more
//// details.
////
////
////
//// You should have received a copy of the GNU Lesser General
////
//// Public License along with this source; if not, download it
////
//// from http://www.opencores.org/lgpl.shtml
////
////
///////////////////////////////////////////////////////////////////

module crc_control_unit
(
 //OUTPUTS
 output reg [1:0] byte_sel,
 output bypass_byte0,
 output buffer_full,
 output read_wait,
 output bypass_size,
 output set_crc_init_sel,
 output clear_crc_init_sel,
 output crc_out_en,
 output byte_en,
 output reset_pending,
 //INPUTS
 input [1:0] size_in,
 input write,
 input reset_chain,
 input clk,
 input rst_n
);

//States definition for state_full
localparam EMPTY   = 2'b00;
localparam WRITE_1 = 2'b01;
localparam WRITE_2 = 2'b10;
localparam BYPASS  = 2'b11;

//States definition for state_byte
localparam IDLE   = 3'b100;
localparam BYTE_0 = 3'b000;
localparam BYTE_1 = 3'b001;
localparam BYTE_2 = 3'b010;
localparam BYTE_3 = 3'b011;

//States definition for state_reset
localparam NO_RESET = 3'b000;
localparam RESET    = 3'b001;
localparam WAIT     = 3'b010;
localparam WRITE    = 3'b011;
localparam RESET_2  = 3'b100;

//Coding for size signal
localparam BYTE      = 2'b00;
localparam HALF_WORD = 2'b01;
localparam WORD      = 2'b10;

//Flops Definition
reg [1:0] state_full;
reg [2:0] state_byte;
reg [2:0] state_reset;

//Internal signals
reg [1:0] next_state_full;
reg [2:0] next_state_byte;
reg [2:0] next_state_reset;

wire last_byte;
wire has_data;


//FSM for management of writes in the input buffers 
//Definition of state register
always @(posedge clk)
 begin
  if(!rst_n)
   state_full <= EMPTY;
  else
   state_full <= next_state_full;
 end

//This signal indicates that the last byte is in processing
assign last_byte = (size_in == BYTE      && state_byte == BYTE_0) ||
                   (size_in == HALF_WORD && state_byte == BYTE_1) ||
                   (size_in == WORD      && state_byte == BYTE_3) ;

//Next state Logic
always @(*)
 begin
  next_state_full = state_full;
  case(state_full)
   EMPTY  : next_state_full = (write) ? WRITE_1 : EMPTY;
   WRITE_1: 
    begin
     if(last_byte)
      begin
       if(!write)
        next_state_full = EMPTY;
      end
     else
      begin
       if(write)
        next_state_full = WRITE_2;
      end
    end
   WRITE_2:
    begin
     if(last_byte)
      next_state_full = (write) ? BYPASS : WRITE_1;
    end
   BYPASS :
    begin
     if(last_byte && !write)
      next_state_full = WRITE_1;
    end
  endcase
 end

//The flag full indicates that buffer is full and any attempt of writing must wait
assign buffer_full = (state_full == WRITE_2 && !last_byte) ||
                     (state_full == BYPASS  && !last_byte);

assign read_wait = (state_byte != IDLE);

//This signal controls the selection of the byte0 
//When bypass_byte0 = 1 the input of byte_ff is taken
//Otherwise, its output is taken
assign bypass_byte0 = (state_full != BYPASS); 

//This signal indicates that there are data in the second position of the buffer
assign has_data = (state_full == WRITE_2) ||
                  (state_full == BYPASS ) ;


//FSM for management of readings in the buffer
//Definition of state register
always @(posedge clk)
 begin
  if(!rst_n)
   state_byte <= IDLE;
  else
   state_byte <= next_state_byte;
 end

always @(*)
 begin
  next_state_byte = state_byte;
  case(state_byte)
   IDLE: next_state_byte = (write) ? BYTE_0 : IDLE;
   BYTE_0:
    begin
     if(size_in == BYTE)
      begin
       if(!write && !has_data)
        next_state_byte = IDLE;
      end
     else
      begin
       next_state_byte = BYTE_1;
      end
    end
   BYTE_1:
    begin
     if(size_in == HALF_WORD)
      begin
       if(has_data || (write && !buffer_full))
        next_state_byte = BYTE_0;
       else
        next_state_byte = IDLE;
      end
     else
      begin
       next_state_byte = BYTE_2;
      end
    end
   BYTE_2:
    begin
     next_state_byte = BYTE_3;
    end
   BYTE_3:
    begin
     if(has_data || (write && !buffer_full))
      next_state_byte = BYTE_0;
     else
      next_state_byte = IDLE;
    end
  endcase
 end

//The signal byte_sel controls the number of byte that will be processed by CRC Unit
always @(*)
 begin
  byte_sel = 2'b00;
  case(state_byte)
   BYTE_0: byte_sel = BYTE_0;
   BYTE_1: byte_sel = BYTE_1;
   BYTE_2: byte_sel = BYTE_2;
   BYTE_3: byte_sel = BYTE_3;
  endcase
 end
//This signal controls the selection of the metadata size 
//When bypass_size = 1 the input of size_ff is taken
//Otherwise, its output is taken
assign bypass_size = !( (state_full != BYPASS && state_byte != BYTE_0) ||
                        (state_full == BYPASS)
                      );

//This signal enables the write in the crc_out register
assign crc_out_en = (state_byte != IDLE);

//
assign byte_en = (state_byte == BYTE_0 && (size_in == HALF_WORD || size_in == WORD) && state_full != BYPASS) ||
                 (last_byte && has_data);

//FSM for control of reset of chained operation
//Definition of state register
always @(posedge clk)
 begin
  if(!rst_n)
   state_reset <= NO_RESET;
  else
   state_reset <= next_state_reset;
 end

always @(*)
 begin
  next_state_reset = state_reset;
  case(state_reset)
   NO_RESET:
    begin
     if((reset_chain && !has_data && state_byte != IDLE && !last_byte) || (reset_chain && has_data && last_byte))
      next_state_reset = RESET;
     if(reset_chain  && has_data && !last_byte)
      next_state_reset = WAIT;
    end
   RESET:
    begin
     if(last_byte)
      next_state_reset = NO_RESET;
     else
      next_state_reset = (write) ? WRITE : RESET;
    end
   WAIT:
    begin
     if(last_byte)
      next_state_reset = (write) ? WRITE : RESET;
     else
      next_state_reset = WAIT;
    end
   WRITE:
    begin
     if(reset_chain)
      next_state_reset = (last_byte) ? RESET : RESET_2;
     else
      next_state_reset = (last_byte) ? NO_RESET : WRITE;
    end
   RESET_2:
    begin
     if(last_byte)
      next_state_reset = (write) ? WRITE : RESET;
     else
      next_state_reset = RESET_2;
    end
  endcase
 end

//This signal set the crc_init_sel flop
//When seted this flop turn on the chained operation of crc 
assign set_crc_init_sel = (state_byte == BYTE_0);

//This signal clear the crc_init_sel
//The clear get priority over set
assign clear_crc_init_sel = (state_reset == NO_RESET && last_byte && reset_chain) ||
                            (state_byte  == IDLE     && reset_chain             ) ||
                            (state_reset == RESET    && last_byte               ) ||
                            (state_reset == WRITE    && last_byte               ) ||
                            (state_reset == RESET_2  && last_byte               ) ;

assign reset_pending = (state_reset != NO_RESET);

endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	CRCAHB CORE BLOCK
////
////
////
//// This file is part of the APB to I2C project
////
//// http://www.opencores.org/cores/apbi2c/
////
////
////
//// Description
////
//// Implementation of APB IP core according to
////
//// crcahb IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): -  Julio Cesar 
////
///////////////////////////////////////////////////////////////// 
////
////
//// Copyright (C) 2009 Authors and OPENCORES.ORG
////
////
////
//// This source file may be used and distributed without
////
//// restriction provided that this copyright statement is not
////
//// removed from the file and that any derivative work contains
//// the original copyright notice and the associated disclaimer.
////
////
//// This source file is free software; you can redistribute it
////
//// and/or modify it under the terms of the GNU Lesser General
////
//// Public License as published by the Free Software Foundation;
//// either version 2.1 of the License, or (at your option) any
////
//// later version.
////
////
////
//// This source is distributed in the hope that it will be
////
//// useful, but WITHOUT ANY WARRANTY; without even the implied
////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
////
//// PURPOSE. See the GNU Lesser General Public License for more
//// details.
////
////
////
//// You should have received a copy of the GNU Lesser General
////
//// Public License along with this source; if not, download it
////
//// from http://www.opencores.org/lgpl.shtml
////
////
///////////////////////////////////////////////////////////////////
module crc_datapath
(
 //OUTPUTS
 output [31:0] crc_out,
 output [ 1:0] size_out,
 output [ 7:0] crc_idr_out,
 output [31:0] crc_poly_out,
 output [31:0] crc_init_out,
 //INPUTS
 input [31:0] bus_wr, //Write data Bus
 input [ 1:0] rev_in_type, //select type of reversion of bus
 input rev_out_type,
 input buffer_en,
 input byte_en,
 input crc_init_en,
 input crc_out_en,
 input crc_idr_en,
 input crc_poly_en,
 input buffer_rst,
 input bypass_byte0,
 input bypass_size,
 input [1:0] byte_sel,
 input [1:0] size_in,
 input clear_crc_init_sel,
 input set_crc_init_sel,
 input [1:0] crc_poly_size,
 input clk,
 input rst_n
);

//Reset definitions
localparam RESET_BUFFER       = 32'hffffffff;
localparam RESET_BYTE         = 32'hffffffff;
localparam RESET_BF_SIZE      = 2'b10;
localparam RESET_SIZE         = 2'b10;
localparam RESET_CRC_INIT_SEL = 1'b0;
localparam RESET_CRC_INIT     = 32'hffffffff;
localparam RESET_CRC_OUT      = 32'h0;
localparam RESET_CRC_IDR      = 8'h0;
localparam RESET_CRC_POLY     = 32'h04c11db7;

//Parameters definitions
localparam BYTE_0 = 2'b00; 
localparam BYTE_1 = 2'b01; 
localparam BYTE_2 = 2'b10; 
localparam BYTE_3 = 2'b11; 

localparam POLY_SIZE_32 = 2'b00;
localparam POLY_SIZE_16 = 2'b01;
localparam POLY_SIZE_8  = 2'b10;
localparam POLY_SIZE_7  = 2'b11;

//Flops Definition
reg [31:0] buffer_ff;
reg [31:0] byte_ff;
reg [31:0] crc_init_ff;
reg [31:0] crc_out_ff;
reg [31:0] crc_poly_ff;
reg [ 7:0] crc_idr_ff;
reg [ 1:0] bf_size_ff;
reg [ 1:0] size_ff;
reg crc_init_sel_ff;

//internal signals definition
reg [7:0] crc_data_in;
reg crc_poly_size_7; 
reg crc_poly_size_8; 
reg crc_poly_size_16;
reg crc_poly_size_32;
wire [31:0] bus_reversed;
wire [31:0] crc_init_mux;
wire [31:0] crc_unit_out;
wire [31:0] crc_poly_size_in;
wire [31:0] crc_out_rev;
wire [ 7:0] byte0_in;
wire [ 7:0] byte1_in;
wire [ 7:0] byte2_in;
wire [ 7:0] byte3_in;
wire [ 7:0] byte0_mux_out;

//Instantiatin of bit_reversed module 
//to perform reversion fuctionality according with rev_type bits
bit_reversal 
#(
 .DATA_SIZE ( 32 )
)REV_IN
(
 .data_out ( bus_reversed    ),
 .data_in  ( bus_wr          ),
 .rev_type ( rev_in_type     )
);

//Definition of Registers buffer_ff and byte_ff
always @(posedge clk)
 begin
  if(!rst_n)
   begin
    buffer_ff  <= RESET_BUFFER; 
    byte_ff    <= RESET_BYTE; 
   end 
  else
   begin
    if(buffer_en)
     buffer_ff <= bus_reversed;
    //else
    // if(buffer_rst)
    //  buffer_ff <= RESET_BUFFER;

    if(byte_en)
     byte_ff <= buffer_ff;
   end
 end

//Definition of Registers bf_size_ff and size_ff
always @(posedge clk)
 begin
  if(!rst_n)
   begin
    bf_size_ff <= RESET_BF_SIZE;
    size_ff    <= RESET_SIZE;
   end 
  else
   begin
    if(buffer_en)
     bf_size_ff <= size_in;
    else
     if(buffer_rst)
      bf_size_ff <= RESET_BF_SIZE;

    if(byte_en)
     size_ff <= bf_size_ff;
   end
 end

//Mux to bypass size_ff
//This informatin is used by FSM to decide the size of the current operatin  
assign size_out = (bypass_size) ? bf_size_ff : size_ff;

assign byte0_in = byte_ff[ 7: 0];
assign byte1_in = byte_ff[15: 8];
assign byte2_in = byte_ff[23:16];
assign byte3_in = byte_ff[31:24];

//Mux to bypass byte0_ff
assign byte0_mux_out = (bypass_byte0) ? buffer_ff[7:0] : byte0_in;

//Mux to select input of CRC Unit
//TODO:AVALIAR A INFLUENCIA DA CODIFICACAO DA FSM NO SINAL BYTE_SEL 
always @(*)
 begin
  crc_data_in = 32'h0;
  case(byte_sel)
   BYTE_0: crc_data_in = byte0_mux_out;
   BYTE_1: crc_data_in = byte1_in;
   BYTE_2: crc_data_in = byte2_in;
   BYTE_3: crc_data_in = byte3_in;
   default:crc_data_in = 32'h0;
  endcase
 end

//Definition of Register crc_init_sel_ff
//This is a set/clear flop where the clear wins set
//This flop controls when the CRC operation is chained (crc_init_sel_ff = 1) or not
//In the chained operatin the current crc calculation depends of the previous crc calculated
//in the unchained operatin the current crc calculation depends of value of crc_init register
always @(posedge clk)
 begin
  if(!rst_n)
   crc_init_sel_ff <= RESET_CRC_INIT_SEL;
  else
   begin
    if(clear_crc_init_sel)
     crc_init_sel_ff <= 1'b0;
    else
     if(set_crc_init_sel)
      crc_init_sel_ff <= 1'b1;
   end
 end

//This register contains the init value used in non chained operatin of crc
assign crc_init_out = crc_init_ff;
always @(posedge clk)
 begin
  if(!rst_n)
   crc_init_ff <= RESET_CRC_INIT;
  else
   if(crc_init_en) 
    crc_init_ff <= bus_wr;
	 else
	   if(buffer_rst)
			 crc_init_ff <= RESET_CRC_INIT;
 end

//This register contains the final value of crc
always @(posedge clk)
 begin
  if(!rst_n)
   crc_out_ff <= RESET_CRC_OUT;
  else
   if(crc_out_en) 
    crc_out_ff <= crc_unit_out;
 end

//this is a general purpouse register
//see the spec for more details
assign crc_idr_out = crc_idr_ff;
always @(posedge clk)
 begin
  if(!rst_n)
   crc_idr_ff <= RESET_CRC_IDR;
  else
   if(crc_idr_en) 
    crc_idr_ff <= bus_wr[7:0];
 end

//This register contains the polynomial coefficients to crc calculation
assign crc_poly_out = crc_poly_ff;
always @(posedge clk)
 begin
  if(!rst_n)
   crc_poly_ff <= RESET_CRC_POLY;
  else
   if(crc_poly_en) 
    crc_poly_ff <= bus_wr;
 end

//Mux that define the type of operation (chained or not)    
assign crc_init_mux = (crc_init_sel_ff) ? crc_out_ff : crc_init_ff;

//Decoding of crc_poly_sizesignal
always @(*)
 begin
  crc_poly_size_7  = 1'b0;
  crc_poly_size_8  = 1'b0;
  crc_poly_size_16 = 1'b0;
  crc_poly_size_32 = 1'b0;
  case(crc_poly_size)
   POLY_SIZE_7 : crc_poly_size_7  = 1'b1;
   POLY_SIZE_8 : crc_poly_size_8  = 1'b1;
   POLY_SIZE_16: crc_poly_size_16 = 1'b1;
   POLY_SIZE_32: crc_poly_size_32 = 1'b1;
  endcase
 end

//This signal define the configurability of the CRC Unit
//In this case, the size of the polynomial can be: 7, 8, 16 or 32
assign crc_poly_size_in = {crc_poly_size_32, 15'h0, crc_poly_size_16, 7'h0, crc_poly_size_8, crc_poly_size_7, 6'h0};

//Instanciation of CRC Unit
//The module is configured to calculate CRC of 32 bits for 8 bits of data in parallel
crc_parallel
#(
 .CRC_SIZE   ( 32 ),
 .FRAME_SIZE ( 8  )
)CRC_UNIT
(
 .crc_out       ( crc_unit_out     ),
 .data_in       ( crc_data_in      ),
 .crc_init      ( crc_init_mux     ),
 .crc_poly      ( crc_poly_ff      ),
 .crc_poly_size ( crc_poly_size_in )
);

//crc_out_rev[31:0] = crc_out_ff[0:31]
generate
 genvar i;
 for(i = 0; i < 32; i = i + 1)
  assign crc_out_rev[i] = crc_out_ff[31 - i];
endgenerate

assign crc_out = (rev_out_type) ? crc_out_rev : crc_out_ff;

endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	CRCAHB CORE BLOCK
////
////
////
//// This file is part of the APB to I2C project
////
//// http://www.opencores.org/cores/apbi2c/
////
////
////
//// Description
////
//// Implementation of APB IP core according to
////
//// crcahb IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): -  Julio Cesar 
////
///////////////////////////////////////////////////////////////// 
////
////
//// Copyright (C) 2009 Authors and OPENCORES.ORG
////
////
////
//// This source file may be used and distributed without
////
//// restriction provided that this copyright statement is not
////
//// removed from the file and that any derivative work contains
//// the original copyright notice and the associated disclaimer.
////
////
//// This source file is free software; you can redistribute it
////
//// and/or modify it under the terms of the GNU Lesser General
////
//// Public License as published by the Free Software Foundation;
//// either version 2.1 of the License, or (at your option) any
////
//// later version.
////
////
////
//// This source is distributed in the hope that it will be
////
//// useful, but WITHOUT ANY WARRANTY; without even the implied
////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
////
//// PURPOSE. See the GNU Lesser General Public License for more
//// details.
////
////
////
//// You should have received a copy of the GNU Lesser General
////
//// Public License along with this source; if not, download it
////
//// from http://www.opencores.org/lgpl.shtml
////
////
///////////////////////////////////////////////////////////////////
module crc_ip
(
	//OUTPUTS
	output [31:0] HRDATA,
	output HREADYOUT,
	output HRESP,
	//INPUTS
	input [31:0] HWDATA,
	input [31:0] HADDR,
	input [ 2:0] HSIZE,
	input [ 1:0] HTRANS,
	input HWRITE,
	input HSElx,
	input HREADY,
	input HRESETn,
	input HCLK
);

//Internal Signals
wire [31:0] crc_poly_out;
wire [31:0] crc_out;
wire [31:0] crc_init_out;
wire [ 7:0] crc_idr_out;
wire buffer_full;
wire read_wait;
wire [31:0] bus_wr;
wire [ 1:0] crc_poly_size;
wire [ 1:0] bus_size;
wire [ 1:0] rev_in_type;
wire rev_out_type;
wire crc_init_en;
wire crc_idr_en;
wire crc_poly_en;
wire buffer_write_en;
wire reset_chain;

//Instanciation of Host Interface
host_interface HOST_INTERFACE
(
	.HRDATA          ( HRDATA          ),
	.HREADYOUT       ( HREADYOUT       ),
	.HRESP           ( HRESP           ),
	.bus_wr          ( bus_wr          ),
	.crc_poly_size   ( crc_poly_size   ),
	.bus_size        ( bus_size        ),
	.rev_in_type     ( rev_in_type     ),
	.rev_out_type    ( rev_out_type    ),
	.crc_init_en     ( crc_init_en     ),
	.crc_idr_en      ( crc_idr_en      ),
	.crc_poly_en     ( crc_poly_en     ),
	.buffer_write_en ( buffer_write_en ),
	.reset_chain     ( reset_chain     ),
	.reset_pending   ( reset_pending   ),
	.HWDATA          ( HWDATA          ),
	.HADDR           ( HADDR           ),
	.HSIZE           ( HSIZE           ),
	.HTRANS          ( HTRANS          ),
	.HWRITE          ( HWRITE          ),
	.HSElx           ( HSElx           ),
	.HREADY          ( HREADY          ),
	.HRESETn         ( HRESETn         ),
	.HCLK            ( HCLK            ),
	.crc_poly_out    ( crc_poly_out    ),
	.crc_out         ( crc_out         ),
	.crc_init_out    ( crc_init_out    ),
	.crc_idr_out     ( crc_idr_out     ),
	.buffer_full     ( buffer_full     ),
	.read_wait       ( read_wait       )
);

//Instantiation of crc_unit
crc_unit CRC_UNIT
(
	.crc_poly_out    ( crc_poly_out    ),
	.crc_out         ( crc_out         ),
	.crc_init_out    ( crc_init_out    ),
	.crc_idr_out     ( crc_idr_out     ),
	.buffer_full     ( buffer_full     ),
	.read_wait       ( read_wait       ),
	.bus_wr          ( bus_wr          ),
	.crc_poly_size   ( crc_poly_size   ),
	.bus_size        ( bus_size        ),
	.rev_in_type     ( rev_in_type     ),
	.rev_out_type    ( rev_out_type    ),
	.crc_init_en     ( crc_init_en     ),
	.crc_idr_en      ( crc_idr_en      ),
	.crc_poly_en     ( crc_poly_en     ),
	.buffer_write_en ( buffer_write_en ),
	.reset_chain     ( reset_chain     ),
	.reset_pending   ( reset_pending   ),
	.clk             ( HCLK            ),
	.rst_n           ( HRESETn         )
);
endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	CRCAHB CORE BLOCK
////
////
////
//// This file is part of the APB to I2C project
////
//// http://www.opencores.org/cores/apbi2c/
////
////
////
//// Description
////
//// Implementation of APB IP core according to
////
//// crcahb IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): -  Julio Cesar 
////
///////////////////////////////////////////////////////////////// 
////
////
//// Copyright (C) 2009 Authors and OPENCORES.ORG
////
////
////
//// This source file may be used and distributed without
////
//// restriction provided that this copyright statement is not
////
//// removed from the file and that any derivative work contains
//// the original copyright notice and the associated disclaimer.
////
////
//// This source file is free software; you can redistribute it
////
//// and/or modify it under the terms of the GNU Lesser General
////
//// Public License as published by the Free Software Foundation;
//// either version 2.1 of the License, or (at your option) any
////
//// later version.
////
////
////
//// This source is distributed in the hope that it will be
////
//// useful, but WITHOUT ANY WARRANTY; without even the implied
////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
////
//// PURPOSE. See the GNU Lesser General Public License for more
//// details.
////
////
////
//// You should have received a copy of the GNU Lesser General
////
//// Public License along with this source; if not, download it
////
//// from http://www.opencores.org/lgpl.shtml
////
////
///////////////////////////////////////////////////////////////////
module crc_parallel
#(
	parameter CRC_SIZE      = 8,         // Define the size of CRC Code
	parameter FRAME_SIZE    = 8          // Number of bits in the data block
)(
	//OUTPUTS
	output [CRC_SIZE   - 1 : 0] crc_out,
	//INPUTS
	input  [FRAME_SIZE - 1 : 0] data_in,
	input  [CRC_SIZE   - 1 : 0] crc_init,
	input  [CRC_SIZE   - 1 : 0] crc_poly,
	input  [CRC_SIZE   - 1 : 0] crc_poly_size
);
localparam ENABLE  = {CRC_SIZE{1'b1}};
localparam DISABLE = {CRC_SIZE{1'b0}};

wire [CRC_SIZE - 1 : 0] crc_comb_out[0 : FRAME_SIZE];
wire [CRC_SIZE - 1 : 0] poly_sel    [1 : CRC_SIZE - 1];
wire [CRC_SIZE - 1 : 0] sel_out     [0 : CRC_SIZE - 1];
wire [CRC_SIZE - 1 : 0] crc_init_sel[0 : CRC_SIZE - 1];
wire [CRC_SIZE - 1 : 0] poly_mux;
wire [CRC_SIZE - 1 : 0] crc_poly_size_reversed;
wire [CRC_SIZE - 1 : 0] crc_init_justified;

assign poly_mux[0] = crc_poly[0];
generate
  genvar k;
	for(k = 1; k < CRC_SIZE; k = k + 1)
		begin
			assign poly_sel[CRC_SIZE - k] = crc_poly_size >> (k - 1);
			assign poly_mux[k] = |(crc_poly & poly_sel[k]);
		end
endgenerate

generate
	genvar l;
	for(l = 0; l < CRC_SIZE; l = l + 1)
		begin
			assign crc_poly_size_reversed[l] = crc_poly_size[CRC_SIZE - 1 - l];
			assign sel_out[l] = crc_poly_size_reversed << l;
			assign crc_out[l] = |(sel_out[l] & crc_comb_out[FRAME_SIZE]);
		end
endgenerate

generate
	genvar m;
	for(m = CRC_SIZE - 1; m >= 0; m = m - 1)
		begin
			assign crc_init_sel[m] = crc_poly_size >> (CRC_SIZE - 1 - m);
			assign crc_init_justified[m] = |(crc_init & crc_init_sel[m]);
		end
endgenerate

assign crc_comb_out[0] = crc_init_justified;

generate
	genvar i;
	for(i = 0; i < FRAME_SIZE; i = i + 1)
		begin
			crc_comb 
			#(
				.CRC_SIZE      ( CRC_SIZE      ),
				.MASK          ( ENABLE        )
			) CRC_COMB
			(
				.crc_out       ( crc_comb_out[i + 1]           ),
				.data_in       ( data_in[FRAME_SIZE - 1 - i]   ),
				.crc_in        ( crc_comb_out[i]               ),
				.crc_poly      ( poly_mux                      ),
				.crc_poly_size ( crc_poly_size[CRC_SIZE - 2:0] )
			);
		end
endgenerate

endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	CRCAHB CORE BLOCK
////
////
////
//// This file is part of the APB to I2C project
////
//// http://www.opencores.org/cores/apbi2c/
////
////
////
//// Description
////
//// Implementation of APB IP core according to
////
//// crcahb IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): -  Julio Cesar 
////
///////////////////////////////////////////////////////////////// 
////
////
//// Copyright (C) 2009 Authors and OPENCORES.ORG
////
////
////
//// This source file may be used and distributed without
////
//// restriction provided that this copyright statement is not
////
//// removed from the file and that any derivative work contains
//// the original copyright notice and the associated disclaimer.
////
////
//// This source file is free software; you can redistribute it
////
//// and/or modify it under the terms of the GNU Lesser General
////
//// Public License as published by the Free Software Foundation;
//// either version 2.1 of the License, or (at your option) any
////
//// later version.
////
////
////
//// This source is distributed in the hope that it will be
////
//// useful, but WITHOUT ANY WARRANTY; without even the implied
////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
////
//// PURPOSE. See the GNU Lesser General Public License for more
//// details.
////
////
////
//// You should have received a copy of the GNU Lesser General
////
//// Public License along with this source; if not, download it
////
//// from http://www.opencores.org/lgpl.shtml
////
////
///////////////////////////////////////////////////////////////////
module crc_unit
(
 //OUTPUTS
 output [31:0] crc_poly_out,
 output [31:0] crc_out,
 output [31:0] crc_init_out,
 output [7:0] crc_idr_out,
 output buffer_full,
 output read_wait,
 output reset_pending,
 //INPUTS
 input [31:0] bus_wr,
 input [ 1:0] crc_poly_size,
 input [ 1:0] bus_size,
 input [ 1:0] rev_in_type,
 input rev_out_type,
 input crc_init_en,
 input crc_idr_en,
 input crc_poly_en,
 input buffer_write_en,
 input reset_chain,
 input clk,
 input rst_n
);

//Interconection signals
wire [ 1:0] size_in;
wire [ 1:0] byte_sel;
wire clear_crc_init;
wire set_crc_init;
wire bypass_byte0;
wire bypass_size;
wire crc_out_en;
wire byte_en;
wire buffer_en;

//The write in the buffer only occur if there is free space
assign buffer_en = buffer_write_en && !buffer_full;

//Instance of the Datapath
crc_datapath DATAPATH
(
 .crc_out            ( crc_out        ),
 .size_out           ( size_in        ),
 .crc_idr_out        ( crc_idr_out    ),
 .crc_poly_out       ( crc_poly_out   ),
 .crc_init_out       ( crc_init_out   ),
 .bus_wr             ( bus_wr         ), 
 .rev_in_type        ( rev_in_type    ),
 .rev_out_type       ( rev_out_type   ),
 .buffer_en          ( buffer_en      ),
 .byte_en            ( byte_en        ),
 .crc_init_en        ( crc_init_en    ),
 .crc_out_en         ( crc_out_en     ),
 .crc_idr_en         ( crc_idr_en     ),
 .crc_poly_en        ( crc_poly_en    ),
 .buffer_rst         ( clear_crc_init ),
 .bypass_byte0       ( bypass_byte0   ),
 .bypass_size        ( bypass_size    ),
 .byte_sel           ( byte_sel       ),
 .size_in            ( bus_size       ),
 .clear_crc_init_sel ( clear_crc_init ),
 .set_crc_init_sel   ( set_crc_init   ),
 .crc_poly_size      ( crc_poly_size  ),
 .clk                ( clk            ),
 .rst_n              ( rst_n          )
);

//Instance of the Control unit
crc_control_unit CONTROL_UNIT
(
 .byte_en            ( byte_en          ),
 .crc_out_en         ( crc_out_en       ),
 .byte_sel           ( byte_sel         ),
 .bypass_byte0       ( bypass_byte0     ),
 .buffer_full        ( buffer_full      ),
 .read_wait          ( read_wait        ),
 .bypass_size        ( bypass_size      ),
 .set_crc_init_sel   ( set_crc_init     ),
 .clear_crc_init_sel ( clear_crc_init   ),
 .size_in            ( size_in          ),
 .write              ( buffer_write_en  ),
 .reset_chain        ( reset_chain      ),
 .reset_pending      ( reset_pending    ),
 .clk                ( clk              ),
 .rst_n              ( rst_n            )
);
endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	CRCAHB CORE BLOCK
////
////
////
//// This file is part of the APB to I2C project
////
//// http://www.opencores.org/cores/apbi2c/
////
////
////
//// Description
////
//// Implementation of APB IP core according to
////
//// crcahb IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): -  Julio Cesar 
////
///////////////////////////////////////////////////////////////// 
////
////
//// Copyright (C) 2009 Authors and OPENCORES.ORG
////
////
////
//// This source file may be used and distributed without
////
//// restriction provided that this copyright statement is not
////
//// removed from the file and that any derivative work contains
//// the original copyright notice and the associated disclaimer.
////
////
//// This source file is free software; you can redistribute it
////
//// and/or modify it under the terms of the GNU Lesser General
////
//// Public License as published by the Free Software Foundation;
//// either version 2.1 of the License, or (at your option) any
////
//// later version.
////
////
////
//// This source is distributed in the hope that it will be
////
//// useful, but WITHOUT ANY WARRANTY; without even the implied
////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
////
//// PURPOSE. See the GNU Lesser General Public License for more
//// details.
////
////
////
//// You should have received a copy of the GNU Lesser General
////
//// Public License along with this source; if not, download it
////
//// from http://www.opencores.org/lgpl.shtml
////
////
///////////////////////////////////////////////////////////////////
module host_interface
(
	//OUTPUTS
	output [31:0] HRDATA,
	output HREADYOUT,
	output HRESP,
	output [31:0] bus_wr,
	output [ 1:0] crc_poly_size,
	output [ 1:0] bus_size,
	output [ 1:0] rev_in_type,
	output rev_out_type,
	output crc_init_en,
	output crc_idr_en,
	output crc_poly_en,
	output buffer_write_en,
	output reset_chain,
	//INPUTS
	input [31:0] HWDATA,
	input [31:0] HADDR,
	input [ 2:0] HSIZE,
	input [ 1:0] HTRANS,
	input HWRITE,
	input HSElx,
	input HREADY,
	input HRESETn,
	input HCLK,
	input [31:0] crc_poly_out,
	input [31:0] crc_out,
	input [31:0] crc_init_out,
	input [ 7:0] crc_idr_out,
	input buffer_full,
	input reset_pending,
	input read_wait
);

//Reset Values
localparam RESET_CRC_CR = 6'h00;

//CRC Register Map
localparam CRC_DR   = 3'h0;
localparam CRC_IDR  = 3'h1;
localparam CRC_CR   = 3'h2;
localparam CRC_INIT = 3'h4;
localparam CRC_POL  = 3'h5;

//Transfer Type Encoding
localparam IDLE    = 2'b00;
localparam BUSY    = 2'b01;
localparam NON_SEQ = 2'b10;
localparam SEQ     = 2'b11;

//HRESP Encoding
localparam OK    = 1'b0;
localparam ERROR = 1'b1;

//Pipeline flops
reg [2:0] haddr_pp;
reg [2:0] hsize_pp;
reg [1:0] htrans_pp;
reg hwrite_pp;
reg hselx_pp;

//Flops
reg [4:0] crc_cr_ff;

//Internal Signals
wire [31:0] crc_cr_rd;
wire crc_dr_sel;
wire crc_init_sel;
wire crc_idr_sel;
wire crc_poly_sel;
wire crc_cr_sel;
wire ahb_enable;
wire write_en;
wire read_en;
wire crc_cr_en;
wire sample_bus;
wire buffer_read_en;

//Pipeline Registers for Address Phase of AHB Protocol
always @(posedge HCLK)
	begin
		if(!HRESETn)
			begin
				hselx_pp <= 1'b0;
			end
		else
			if(sample_bus)
				begin
					haddr_pp  <= HADDR[4:2];
					hsize_pp  <= HSIZE;
					htrans_pp <= HTRANS;
					hwrite_pp <= HWRITE;
					hselx_pp  <= HSElx;
				end
	end

//Enable Signals
assign ahb_enable = (htrans_pp == NON_SEQ);
assign write_en = hselx_pp &&  hwrite_pp && ahb_enable;
assign read_en  = hselx_pp && !hwrite_pp && ahb_enable;

//Registers decoding
assign crc_dr_sel   = (haddr_pp == CRC_DR  );
assign crc_init_sel = (haddr_pp == CRC_INIT);
assign crc_idr_sel  = (haddr_pp == CRC_IDR );
assign crc_poly_sel = (haddr_pp == CRC_POL );
assign crc_cr_sel   = (haddr_pp == CRC_CR  );

//Write Esnables Signals for Registers
assign buffer_write_en = crc_dr_sel   && write_en;
assign crc_init_en     = crc_init_sel && write_en;
assign crc_idr_en      = crc_idr_sel  && write_en;
assign crc_poly_en     = crc_poly_sel && write_en;
assign crc_cr_en       = crc_cr_sel   && write_en;

//Indicates reading operation request to crc_dr register
assign buffer_read_en = crc_dr_sel && read_en;

//Bus Size is the output of HSIZE pipeline register
assign bus_size = hsize_pp;

//The Write Bus is not pipelined
assign bus_wr = HWDATA;

//HREADY Signal outputed to Master
assign HREADYOUT = !((buffer_write_en && buffer_full   ) ||
                     (buffer_read_en  && read_wait     ) ||
                     (crc_init_en     && reset_pending ) );

//Signal to control sampling of bus
assign sample_bus = HREADYOUT && HREADY;

//HRESP Signal outputed to Master
//This implementation never signalize bus error to master
assign HRESP = OK;

//CRC_CR Data Read
assign crc_cr_rd = {24'h0, crc_cr_ff[4:0], 3'h0};

//Mux to HRDATA
assign HRDATA = ({32{crc_dr_sel  }} & crc_out             ) |
                ({32{crc_init_sel}} & crc_init_out        ) |
                ({32{crc_idr_sel }} & {24'h0, crc_idr_out}) |
                ({32{crc_poly_sel}} & crc_poly_out        ) |
                ({32{crc_cr_sel  }} & crc_cr_rd           ) ;

//Control Register
always @(posedge HCLK)
	begin
		if(!HRESETn)
			crc_cr_ff <= RESET_CRC_CR;
		else
			if(crc_cr_en)
				crc_cr_ff <= {HWDATA[7], HWDATA[6:5], HWDATA[4:3]};
	end

//Configuration Signals
assign reset_chain   = (crc_cr_en && HWDATA[0]);
assign crc_poly_size = crc_cr_ff[1:0];
assign rev_in_type   = crc_cr_ff[3:2];
assign rev_out_type  = crc_cr_ff[4];

endmodule
