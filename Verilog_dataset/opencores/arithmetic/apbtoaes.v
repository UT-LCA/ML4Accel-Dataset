//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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
module aes_ip
(
	//OUTPUTS
	output int_ccf,
	output int_err,
	output dma_req_wr,
	output dma_req_rd,
	output PREADY,
	output PSLVERR,
	output [31:0] PRDATA,
	//INPUTS
	input  [ 3:0] PADDR,
	input  [31:0] PWDATA,
	input PWRITE,
	input PENABLE,
	input PSEL,
	input PCLK,
	input PRESETn
);

wire [31:0] col_out;
wire [31:0] key_out;
wire [31:0] iv_out;
wire end_aes;
wire [ 3:0] iv_en;
wire [ 3:0] iv_sel_rd;
wire [ 3:0] key_en;
wire [ 1:0] key_sel_rd;
wire [ 1:0] data_type;
wire [ 1:0] addr;
wire [ 1:0] op_mode;
wire [ 1:0] aes_mode;
wire start;
wire disable_core;
wire write_en;
wire read_en;
wire first_block;
//wire pwdata_host_interface;

assign PREADY = 1'b1;
assign PSLVERR = 1'b0;
//assign pwdata_host_interface = PWDATA[12:0];

host_interface HOST_INTERFACE
(
	.key_en       ( key_en       ),
	.col_addr     ( addr         ),
	.col_wr_en    ( write_en     ),
	.col_rd_en    ( read_en      ),
	.key_sel      ( key_sel_rd   ),
	.iv_en        ( iv_en        ),
	.iv_sel       ( iv_sel_rd    ),
	.int_ccf      ( int_ccf      ),
	.int_err      ( int_err      ),
	.chmod        ( aes_mode     ),
	.mode         ( op_mode      ),
	.data_type    ( data_type    ),
	.disable_core ( disable_core ),
	.first_block  ( first_block  ),
	.dma_req_wr   ( dma_req_wr   ),
	.dma_req_rd   ( dma_req_rd   ),
	.start_core   ( start        ),
	.PRDATA       ( PRDATA       ),
	.PADDR        ( PADDR        ),
	.PWDATA       ( PWDATA[12:0] ),
	.PWRITE       ( PWRITE       ),
	.PENABLE      ( PENABLE      ),
	.PSEL         ( PSEL         ),
	.PCLK         ( PCLK         ),
	.PRESETn      ( PRESETn      ),
	.key_bus      ( key_out      ),
	.col_bus      ( col_out      ),
	.iv_bus       ( iv_out       ),
	.ccf_set      ( end_aes      )
); 

aes_core AES_CORE
(
	.col_out      ( col_out      ),
	.key_out      ( key_out      ),
	.iv_out       ( iv_out       ),
	.end_aes      ( end_aes      ),
	.bus_in       ( PWDATA       ),
	.iv_en        ( iv_en        ),
	.iv_sel_rd    ( iv_sel_rd    ),
	.key_en       ( key_en       ),
	.key_sel_rd   ( key_sel_rd   ),
	.data_type    ( data_type    ),
	.addr         ( addr         ),
	.op_mode      ( op_mode      ),
	.aes_mode     ( aes_mode     ),
	.start        ( start        ),
	.disable_core ( disable_core ),
	.write_en     ( write_en     ),
	.read_en      ( read_en      ),
	.first_block  ( first_block  ),
	.rst_n        ( PRESETn      ),
	.clk          ( PCLK         )
);
endmodule

//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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

module aes_core
(
	//OUTPUTS
	output [31:0] col_out,
	output [31:0] key_out,
	output [31:0] iv_out,
	output end_aes,
	//INPUTS
	input  [31:0] bus_in,
	input  [ 3:0] iv_en,
	input  [ 3:0] iv_sel_rd,
	input  [ 3:0] key_en,
	input  [ 1:0] key_sel_rd,
	input  [ 1:0] data_type,
	input  [ 1:0] addr,
	input  [ 1:0] op_mode,
	input  [ 1:0] aes_mode,
	input start,
	input disable_core,
	input write_en,
	input read_en,
	input first_block,
	input rst_n,
	input clk
);

wire [ 1:0] rk_sel;
wire [ 1:0] key_out_sel;
wire [ 3:0] round;
wire [ 2:0] sbox_sel;
wire [ 3:0] col_en_host;
wire [ 3:0] iv_en_host;
wire [ 3:0] col_en_cnt_unit;
wire [ 3:0] key_en_host;
wire [ 3:0] key_en_cnt_unit;
wire [ 1:0] col_sel;
wire        key_sel;
wire bypass_rk;
wire bypass_key_en;
wire last_round;
wire iv_cnt_en;
wire iv_cnt_sel;
wire mode_ctr;
wire mode_cbc;
wire key_init;
wire key_gen;
wire [1:0] col_addr_host;

assign col_en_host = (4'b0001 << addr) & {4{write_en}};
assign col_addr_host = addr & {2{read_en}};
assign iv_en_host  = iv_en;
assign key_en_host = key_en;

datapath AES_CORE_DATAPATH
(
	.col_bus           ( col_out           ),
	.key_bus           ( key_out           ),
	.iv_bus            ( iv_out            ),   
	.bus_in 	   ( bus_in            ),
	.end_aes           ( end_aes           ),
	.data_type         ( data_type 	       ),
	.rk_sel 	   ( rk_sel            ),
	.key_out_sel       ( key_out_sel       ),
	.round		   ( round             ),
	.sbox_sel	   ( sbox_sel          ),
	.iv_en		   ( iv_en_host        ),
	.iv_sel_rd         ( iv_sel_rd         ),
	.col_en_host       ( col_en_host       ),
	.col_en_cnt_unit   ( col_en_cnt_unit   ),
	.key_host_en	   ( key_en_host       ),
	.key_en		   ( key_en_cnt_unit   ),
	.key_sel_rd        ( key_sel_rd        ),
	.col_sel_host	   ( col_addr_host     ),
	.col_sel           ( col_sel           ),
	.key_sel	   ( key_sel           ),
	.bypass_rk	   ( bypass_rk         ),
	.bypass_key_en     ( bypass_key_en     ),
	.first_block       ( first_block       ),
	.last_round        ( last_round        ),
	.iv_cnt_en         ( iv_cnt_en         ),
	.iv_cnt_sel	   ( iv_cnt_sel        ),
	.enc_dec	   ( enc_dec           ),
	.mode_ctr	   ( mode_ctr          ),
	.mode_cbc	   ( mode_cbc          ),
	.key_init          ( key_init          ),
	.key_gen           ( key_gen           ),
	.key_derivation_en ( key_derivation_en ),
	.end_comp          ( end_comp          ),
	.rst_n		   ( rst_n             ),
	.clk		   ( clk	       )
);

control_unit AES_CORE_CONTROL_UNIT
(  
	.end_comp          ( end_comp          ),
	.sbox_sel          ( sbox_sel          ),
	.rk_sel            ( rk_sel            ),
	.key_out_sel       ( key_out_sel       ),
	.col_sel           ( col_sel           ),
	.key_en            ( key_en_cnt_unit   ),
	.col_en            ( col_en_cnt_unit   ),
	.round      	   ( round             ),
	.bypass_rk         ( bypass_rk         ),
	.bypass_key_en     ( bypass_key_en     ),
	.key_sel           ( key_sel           ),
	.last_round        ( last_round        ),
	.iv_cnt_en         ( iv_cnt_en         ),
	.iv_cnt_sel        ( iv_cnt_sel        ),
	.mode_ctr          ( mode_ctr          ),
	.mode_cbc          ( mode_cbc          ),
	.key_init          ( key_init          ),
	.encrypt_decrypt   ( enc_dec	       ),
	.key_gen           ( key_gen           ),
	.operation_mode    ( op_mode 	       ),
	.aes_mode	   ( aes_mode          ),
	.start		   ( start 	       ),
	.key_derivation_en ( key_derivation_en ),
	.disable_core      ( disable_core      ),
	.clk		   ( clk               ),
	.rst_n		   ( rst_n             )
);

endmodule

//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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
module control_unit
(
	output reg [ 2:0] sbox_sel,
	output reg [ 1:0] rk_sel,
	output reg [ 1:0] key_out_sel,
	output reg [ 1:0] col_sel,
	output reg [ 3:0] key_en,
	output reg [ 3:0] col_en,
	output     [ 3:0] round,
	output reg bypass_rk,
	output reg bypass_key_en,
	output reg key_sel,
	output reg iv_cnt_en,
	output reg iv_cnt_sel,
	output reg key_derivation_en,
	output end_comp,
	output key_init,
	output key_gen,
	output mode_ctr,
	output mode_cbc,
	output last_round,
  output encrypt_decrypt,	
	input [1:0] operation_mode,
	input [1:0] aes_mode,
	input start,
	input disable_core,
	input clk,
	input rst_n
);
//`include "include/host_interface.vh"
//`include "include/control_unit_params.vh"

//=====================================================================================
// Memory Mapped Registers Address
//=====================================================================================
localparam AES_CR    = 4'd00;
localparam AES_SR    = 4'd01;
localparam AES_DINR  = 4'd02;
localparam AES_DOUTR = 4'd03;
localparam AES_KEYR0 = 4'd04;
localparam AES_KEYR1 = 4'd05;
localparam AES_KEYR2 = 4'd06;
localparam AES_KEYR3 = 4'd07;
localparam AES_IVR0  = 4'd08;
localparam AES_IVR1  = 4'd09;
localparam AES_IVR2  = 4'd10;
localparam AES_IVR3  = 4'd11;

//=============================================================================
// Operation Modes
//=============================================================================
localparam ENCRYPTION     = 2'b00;
localparam KEY_DERIVATION = 2'b01;
localparam DECRYPTION     = 2'b10;
localparam DECRYP_W_DERIV = 2'b11;

//=============================================================================
// AES Modes
//=============================================================================
localparam ECB = 2'b00;
localparam CBC = 2'b01;
localparam CTR = 2'b10;

//=============================================================================
// SBOX SEL
//=============================================================================
localparam COL_0 = 3'b000;
localparam COL_1 = 3'b001;
localparam COL_2 = 3'b010;
localparam COL_3 = 3'b011;
localparam G_FUNCTION = 3'b100;

//=============================================================================
// RK_SEL
//=============================================================================
localparam COL        = 2'b00;
localparam MIXCOL_IN  = 2'b01;
localparam MIXCOL_OUT = 2'b10;

//=============================================================================
// KEY_OUT_SEL
//=============================================================================
localparam KEY_0 = 2'b00;
localparam KEY_1 = 2'b01;
localparam KEY_2 = 2'b10;
localparam KEY_3 = 2'b11;

//=============================================================================
// COL_SEL
//=============================================================================
localparam SHIFT_ROWS = 2'b00;
localparam ADD_RK_OUT = 2'b01;
localparam INPUT      = 2'b10;

//=============================================================================
// KEY_SEL
//=============================================================================
localparam KEY_HOST = 1'b0;
localparam KEY_OUT  = 1'b1;

//=============================================================================
// KEY_EN
//=============================================================================
localparam KEY_DIS  = 4'b0000;
localparam EN_KEY_0 = 4'b0001;
localparam EN_KEY_1 = 4'b0010;
localparam EN_KEY_2 = 4'b0100;
localparam EN_KEY_3 = 4'b1000;
localparam KEY_ALL  = 4'b1111;

//=============================================================================
// COL_EN
//=============================================================================
localparam COL_DIS  = 4'b0000;
localparam EN_COL_0 = 4'b0001;
localparam EN_COL_1 = 4'b0010;
localparam EN_COL_2 = 4'b0100;
localparam EN_COL_3 = 4'b1000;
localparam COL_ALL  = 4'b1111;

//=============================================================================
// IV_CNT_SEL
//=============================================================================
localparam IV_CNT = 1'b1;
localparam IV_BUS = 1'b0;

//=============================================================================
// ENABLES
//=============================================================================
localparam ENABLE = 1'b1;
localparam DISABLE = 1'b0;

localparam NUMBER_ROUND      = 4'd10;
localparam NUMBER_ROUND_INC  = 4'd11;
localparam INITIAL_ROUND     = 4'd00;

//=============================================================================
// FSM STATES
//=============================================================================
localparam IDLE        = 4'd00;
localparam ROUND0_COL0 = 4'd01;
localparam ROUND0_COL1 = 4'd02;
localparam ROUND0_COL2 = 4'd03;
localparam ROUND0_COL3 = 4'd04;
localparam ROUND_KEY0  = 4'd05;
localparam ROUND_COL0  = 4'd06;
localparam ROUND_COL1  = 4'd07;
localparam ROUND_COL2  = 4'd08;
localparam ROUND_COL3  = 4'd09;
localparam READY       = 4'd10;
localparam GEN_KEY0    = 4'd11;
localparam GEN_KEY1    = 4'd12;
localparam GEN_KEY2    = 4'd13;
localparam GEN_KEY3    = 4'd14;
localparam NOP         = 4'd15;

reg [3:0] state, next_state;
reg [3:0] rd_count;

reg rd_count_en;
//reg end_aes_pp1, end_aes_pp2;
wire op_key_derivation;
wire first_round;
wire [1:0] op_mode;
wire enc_dec;

// State Flops Definition
always @(posedge clk, negedge rst_n)
	begin
		if(!rst_n)
			state <= IDLE;
		else
			if(disable_core)
				state <= IDLE;
			else
				state <= next_state;
	end

assign encrypt_decrypt = (op_mode == ENCRYPTION || op_mode == KEY_DERIVATION || state == GEN_KEY0   
			  ||   state == GEN_KEY1       ||state == GEN_KEY2   ||   state == GEN_KEY3       );

assign enc_dec = encrypt_decrypt | mode_ctr;
assign key_gen = (state == ROUND_KEY0);

assign op_key_derivation = (op_mode == KEY_DERIVATION);

assign mode_ctr = (aes_mode == CTR);
assign mode_cbc = (aes_mode == CBC);

assign key_init = start;

assign op_mode = (mode_ctr) ? ENCRYPTION : operation_mode;

// Next State Logic
always @(*)
	begin
		next_state = state;
		case(state)
			IDLE:
				begin
					if(!start)
						next_state = IDLE;
					else
						case(op_mode)
							ENCRYPTION    : next_state = ROUND0_COL0;
							DECRYPTION    : next_state = ROUND0_COL3;
							KEY_DERIVATION: next_state = GEN_KEY0;
							DECRYP_W_DERIV: next_state = GEN_KEY0;
							default       : next_state = IDLE;
						endcase
				end
			ROUND0_COL0:
				begin
					next_state = (enc_dec) ? ROUND0_COL1 : ROUND_KEY0; 
				end
			ROUND0_COL1:
				begin
					next_state = (enc_dec) ? ROUND0_COL2 : ROUND0_COL0;
				end
			ROUND0_COL2:
				begin
					next_state = (enc_dec) ? ROUND0_COL3 : ROUND0_COL1;
				end
			ROUND0_COL3:
				begin
					next_state = (enc_dec) ? ROUND_KEY0 : ROUND0_COL2;
				end
			ROUND_KEY0 :
				begin
					if(!first_round)
						begin
							next_state = (last_round) ? READY : NOP;
						end
					else
						begin
							next_state = (enc_dec) ? ROUND_COL0 : ROUND_COL3;
						end
				end
			NOP        :
				begin
					next_state = (enc_dec) ? ROUND_COL0 : ROUND_COL3;
				end
			ROUND_COL0 :
				begin
					next_state = (enc_dec) ? ROUND_COL1 : ROUND_KEY0;
				end
			ROUND_COL1 :
				begin
					next_state = (enc_dec) ? ROUND_COL2 : ROUND_COL0;
				end
			ROUND_COL2 :
				begin
					next_state = (enc_dec) ? ROUND_COL3 : ROUND_COL1;
				end
			ROUND_COL3 :
				begin
					if(last_round && enc_dec)
						next_state = READY;
					else
					next_state = (enc_dec) ? ROUND_KEY0 : ROUND_COL2;
				end
			GEN_KEY0   :
				begin
					next_state = GEN_KEY1;
				end
			GEN_KEY1   :
				begin
					next_state = GEN_KEY2;
				end
			GEN_KEY2   :
				begin
					next_state = GEN_KEY3;
				end
			GEN_KEY3   :
				begin
					if(last_round)
						next_state = (op_key_derivation) ? READY : ROUND0_COL3;
					else
						next_state = GEN_KEY0;
				end
			READY      :
				begin
					next_state = IDLE;
				end
		endcase
	end
 
       
// Output Logic
assign end_comp = (state == READY)?ENABLE:DISABLE;

/*
always @(posedge clk, negedge rst_n)
begin
		if(!rst_n)
		begin
			end_aes_pp1 <= 1'b0;
			end_aes_pp2 <= 1'b0; 
			end_comp <= 1'b0;
		end
		else
			if(state == READY)
			begin
				end_aes_pp1 <= ENABLE;
				//end_aes_pp2 <= end_aes_pp1;
				end_comp <= end_aes_pp1 ;
			end
			else
			begin
				end_aes_pp1 <= DISABLE;
				//end_aes_pp2 <= end_aes_pp1;
				end_comp <= end_aes_pp1 ;
			end

end
*/
always @(*)
	begin
		sbox_sel = COL_0;
		rk_sel = COL;
		bypass_rk = DISABLE;
		key_out_sel = KEY_0;
		col_sel = INPUT;
		key_sel = KEY_HOST;
		key_en = KEY_DIS;
		col_en = COL_DIS;
		rd_count_en = DISABLE;
		iv_cnt_en = DISABLE;
		iv_cnt_sel = IV_BUS;
		bypass_key_en = DISABLE;
		key_derivation_en = DISABLE;
		//end_comp = DISABLE;
		case(state)
			ROUND0_COL0:
				begin
					sbox_sel = COL_0;
					rk_sel   = COL;
					bypass_rk = ENABLE;
					bypass_key_en = ENABLE;
					key_out_sel = KEY_0;
					col_sel = (enc_dec) ? ADD_RK_OUT : SHIFT_ROWS;
					col_en =  (enc_dec) ? EN_COL_0 : COL_ALL;
				end
			ROUND0_COL1:
				begin
					sbox_sel = COL_1;
					rk_sel   = COL;
					bypass_rk = ENABLE;
					bypass_key_en = ENABLE;
					key_out_sel = KEY_1;
					col_sel = ADD_RK_OUT;
					col_en = EN_COL_1;
					if(!enc_dec)
						begin
							key_sel = KEY_OUT;
							key_en =  EN_KEY_1;
						end
				end
			ROUND0_COL2:
				begin
					sbox_sel = COL_2;
					rk_sel   = COL;
					bypass_rk = ENABLE;
					bypass_key_en = ENABLE;
					key_out_sel = KEY_2;
					col_sel = ADD_RK_OUT;
					col_en = EN_COL_2;
					if(!enc_dec)
						begin
							key_sel = KEY_OUT;
							key_en =  EN_KEY_2;
						end
				end
			ROUND0_COL3:
				begin
					sbox_sel = COL_3;
					rk_sel   = COL;
					bypass_key_en = ENABLE;
					key_out_sel = KEY_3;
					col_sel = (enc_dec) ? SHIFT_ROWS : ADD_RK_OUT;
					col_en =  (enc_dec) ? COL_ALL : EN_COL_3;
					bypass_rk = ENABLE;
					if(!enc_dec)
					begin
							key_sel = KEY_OUT;
							key_en =  EN_KEY_3;
					end
				end
			ROUND_KEY0:
				begin
					sbox_sel = G_FUNCTION;
					key_sel = KEY_OUT;
					key_en = EN_KEY_0;
					rd_count_en = ENABLE;
				end
			ROUND_COL0:
				begin
					sbox_sel = COL_0;
					rk_sel = (last_round) ? MIXCOL_IN : MIXCOL_OUT;
					key_out_sel = KEY_0;
					key_sel = KEY_OUT;

					if(enc_dec)
						key_en = EN_KEY_1;
					if((mode_cbc && last_round && !enc_dec) || (mode_ctr && last_round))
						col_sel = INPUT;
					else
						begin
							if(!enc_dec)
								col_sel = (last_round) ? ADD_RK_OUT : SHIFT_ROWS;
							else
								col_sel = ADD_RK_OUT;
						end
					if(enc_dec)
						col_en = EN_COL_0;
					else
						col_en = (last_round) ? EN_COL_0 : COL_ALL;
				end
			ROUND_COL1:
				begin
					sbox_sel = COL_1;
					rk_sel   = (last_round) ? MIXCOL_IN : MIXCOL_OUT;
					key_out_sel = KEY_1;
					key_sel = KEY_OUT;
					if(enc_dec)
						key_en = EN_KEY_2;
					else
						key_en = EN_KEY_1;
					if((mode_cbc && last_round && !enc_dec) || (mode_ctr && last_round))
						col_sel = INPUT;
					else
						col_sel = ADD_RK_OUT;
					col_en = EN_COL_1;
				end
			ROUND_COL2:
				begin
					sbox_sel = COL_2;
					rk_sel   = (last_round) ? MIXCOL_IN : MIXCOL_OUT;
					key_out_sel = KEY_2;
					key_sel = KEY_OUT;
					if(enc_dec)
						key_en = EN_KEY_3;
					else
						key_en = EN_KEY_2;
					if((mode_cbc && last_round && !enc_dec) || (mode_ctr && last_round))
						col_sel = INPUT;
					else
						col_sel = ADD_RK_OUT;
					col_en = EN_COL_2;
				end
			ROUND_COL3:
				begin
					sbox_sel = COL_3;
					rk_sel   = (last_round) ? MIXCOL_IN : MIXCOL_OUT;
					key_out_sel = KEY_3;
					key_sel = KEY_OUT;
					if(!enc_dec)
						key_en = EN_KEY_3;
					if((mode_cbc && last_round && !enc_dec) || (mode_ctr && last_round))
						col_sel = INPUT;
					else
						begin
							if(enc_dec)
								col_sel = (last_round) ? ADD_RK_OUT : SHIFT_ROWS;
							else
								col_sel = ADD_RK_OUT;
						end
					if(enc_dec)
						col_en = (last_round) ? EN_COL_3 : COL_ALL;
					else
						col_en = EN_COL_3;
					if(mode_ctr && last_round)
						begin
							iv_cnt_en = ENABLE;
							iv_cnt_sel = IV_CNT;
						end
				end
			GEN_KEY0:
				begin
					sbox_sel = G_FUNCTION;
					rd_count_en = ENABLE;
				end
			GEN_KEY1:
				begin
					key_en = EN_KEY_1 | EN_KEY_0; //Enable key 0 AND key 1
					key_sel = KEY_OUT;
					bypass_key_en = ENABLE;
				end
			GEN_KEY2:
				begin
					key_en = EN_KEY_2;
					key_sel = KEY_OUT;
					bypass_key_en = ENABLE;
				end
			GEN_KEY3:
				begin
					key_en = EN_KEY_3;
					key_sel = KEY_OUT;
					bypass_key_en = ENABLE;
				end
			READY:
				begin
					//end_comp = ENABLE;
					if(op_mode == KEY_DERIVATION)
						key_derivation_en = ENABLE;
				end
		endcase
	end

// Round Counter
always @(posedge clk, negedge rst_n)
	begin
		if(!rst_n)
			rd_count <= INITIAL_ROUND;
		else
			if(state == IDLE || (state == GEN_KEY3 && last_round))
				rd_count <= INITIAL_ROUND;
			else 
				if(rd_count_en)
					rd_count <= rd_count + 1'b1;
	end

assign round = rd_count;
assign first_round = (rd_count == INITIAL_ROUND);
assign last_round  = (rd_count == NUMBER_ROUND || rd_count == NUMBER_ROUND_INC);

endmodule

//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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
module datapath
(
	// OUTPUTS
	output [31:0] col_bus,
	output [31:0] key_bus,
	output [31:0] iv_bus,
	output end_aes,
	// INPUTS
	input [31:0] bus_in,
	input [ 1:0] data_type,
	input [ 1:0] rk_sel,
	input [ 1:0] key_out_sel,
	input [ 3:0] round,
	input [ 2:0] sbox_sel,
	input [ 3:0] iv_en,
	input [ 3:0] iv_sel_rd,
	input [ 3:0] col_en_host,
	input [ 3:0] col_en_cnt_unit,
	input [ 3:0] key_host_en,
	input [ 3:0] key_en,
	input [ 1:0] key_sel_rd,
	input [ 1:0] col_sel,
	input [ 1:0] col_sel_host,
	input end_comp,
	input key_sel,
	input key_init,
	input bypass_rk,
	input bypass_key_en,
	input first_block,
	input last_round,
	input iv_cnt_en,
	input iv_cnt_sel,
	input enc_dec,
	input mode_ctr,
	input mode_cbc,
	input key_gen,
	input key_derivation_en,
	input rst_n,
	input clk
);

//`include "include/control_unit_params.vh"
//=============================================================================
// SBOX SEL
//=============================================================================
localparam COL_0 = 3'b000;
localparam COL_1 = 3'b001;
localparam COL_2 = 3'b010;
localparam COL_3 = 3'b011;
localparam G_FUNCTION = 3'b100;

//=============================================================================
// RK_SEL
//=============================================================================
localparam COL        = 2'b00;
localparam MIXCOL_IN  = 2'b01;
localparam MIXCOL_OUT = 2'b10;

//=============================================================================
// KEY_OUT_SEL
//=============================================================================
localparam KEY_0 = 2'b00;
localparam KEY_1 = 2'b01;
localparam KEY_2 = 2'b10;
localparam KEY_3 = 2'b11;

//=============================================================================
// COL_SEL
//=============================================================================
localparam SHIFT_ROWS = 2'b00;
localparam ADD_RK_OUT = 2'b01;
localparam INPUT      = 2'b10;

//=============================================================================
// KEY_SEL
//=============================================================================
localparam KEY_HOST = 1'b0;
localparam KEY_OUT  = 1'b1;

//=============================================================================
// KEY_EN
//=============================================================================
localparam KEY_DIS  = 4'b0000;
localparam EN_KEY_0 = 4'b0001;
localparam EN_KEY_1 = 4'b0010;
localparam EN_KEY_2 = 4'b0100;
localparam EN_KEY_3 = 4'b1000;
localparam KEY_ALL  = 4'b1111;

//=============================================================================
// COL_EN
//=============================================================================
localparam COL_DIS  = 4'b0000;
localparam EN_COL_0 = 4'b0001;
localparam EN_COL_1 = 4'b0010;
localparam EN_COL_2 = 4'b0100;
localparam EN_COL_3 = 4'b1000;
localparam COL_ALL  = 4'b1111;

//=============================================================================
// IV_CNT_SEL
//=============================================================================
localparam IV_CNT = 1'b1;
localparam IV_BUS = 1'b0;

//=============================================================================
// ENABLES
//=============================================================================
localparam ENABLE = 1'b1;
localparam DISABLE = 1'b0;

reg [31 : 0] col     [0:3];
reg [31 : 0] key     [0:3];
reg [31 : 0] key_host[0:3];
reg [31 : 0] bkp     [0:3];
reg [31 : 0] bkp_1   [0:3];
reg [31 : 0] iv      [0:3];

reg  [127 : 0] col_in;
reg  [ 31 : 0] data_in;
reg  [ 31 : 0] add_rd_key_in;
reg  [ 31 : 0] sbox_input;
reg  [ 31 : 0] key_mux_out;
reg  [ 31 : 0] iv_mux_out;
reg  [ 31 : 0] bkp_mux_out;

wire [127 : 0] key_in, key_out;
wire [127 : 0] sr_input;
wire [127 : 0] sr_enc, sr_dec;
wire [ 31 : 0] add_rk_out;
wire [ 31 : 0] sbox_out_enc;
wire [ 31 : 0] sbox_out_dec;
wire [ 31 : 0] g_in;
wire [ 31 : 0] mix_out_enc;
wire [ 31 : 0] mix_out_dec;
wire [ 31 : 0] add_rd;
wire [ 31 : 0] bus_swap;
wire [ 31 : 0] iv_bkp_mux;
wire [ 31 : 0] xor_input_bkp_iv;
wire [ 31 : 0] sr_input_0;
wire [ 31 : 0] sr_input_3;
wire [  3 : 0] key_en_sel;
wire [  3 : 0] bkp_en;
wire [  3 : 0] col_en;
wire [  1 : 0] key_mux_sel;
wire [  1 : 0] rk_sel_mux;
wire [  1 : 0] col_sel_w_bypass;
wire [  3 : 0] col_en_w_bypass;
wire rk_out_sel;
wire add_rk_sel;
wire key_sel_mux;
wire key1_mux_cnt;
wire enc_dec_sbox;

reg [31 : 0] sbox_pp2;
reg [ 3 : 0] col_en_cnt_unit_pp1;
reg [ 3 : 0] col_en_cnt_unit_pp2;
reg [ 3 : 0] key_en_pp1;
reg [ 3 : 0] round_pp1;
reg [ 1 : 0] col_sel_pp1;
reg [ 1 : 0] col_sel_pp2;
reg [ 1 : 0] key_out_sel_pp1;
reg [ 1 : 0] key_out_sel_pp2;
reg [ 1 : 0] rk_sel_pp1;
reg [ 1 : 0] rk_sel_pp2;
reg key_sel_pp1;
reg rk_out_sel_pp1, rk_out_sel_pp2;
reg last_round_pp1, last_round_pp2;
//reg end_aes_pp2,end_aes_pp1;//end_aes_pp2;

assign key_bus = key_mux_out;
assign iv_bus = iv_mux_out;

// Input Swap Unit
data_swap SWAP_IN
(
	.data_swap( bus_swap  ),
	.data_in  ( bus_in    ),
	.swap_type( data_type )
);

// Output Swap Unit
data_swap SWAP_OUT
(
	.data_swap( col_bus    ),
	.data_in  ( sbox_input ),
	.swap_type( data_type  )
);

// IV and BKP Muxs
always@(iv_mux_out or bkp_mux_out or col_en or iv_sel_rd or iv[0] or iv[1] or iv[2] or iv[3] or bkp[0] or bkp[1] or bkp[2] or bkp[3])
	begin: IV_BKP_MUX
		integer i;
		iv_mux_out  = {32{1'b0}};
		bkp_mux_out = {32{1'b0}};
		for(i = 0; i < 4; i = i + 1)
			begin:IVBKP
				if(col_en[i] | iv_sel_rd[i])
					begin
						iv_mux_out  = iv[i];
						bkp_mux_out = bkp[i];
					end
			end
	end

assign iv_bkp_mux = (first_block && !mode_ctr) ? iv_mux_out : bkp_mux_out;

assign xor_input_bkp_iv = ((enc_dec && !mode_ctr) ? bus_swap : add_rk_out) ^ iv_bkp_mux;

always @(*)
	begin
		data_in = {32{1'b0}};
		case(1'b1)
			mode_cbc:
				data_in = (enc_dec || last_round) ? xor_input_bkp_iv : bus_swap;
			mode_ctr:
				data_in = (last_round) ? xor_input_bkp_iv : iv_mux_out;
			default:
				data_in = bus_swap;
		endcase
	end

assign bkp_en = ( {4{ mode_cbc && last_round && enc_dec}} & col_en_cnt_unit_pp2) | 
                ( {4{(mode_cbc && !enc_dec) || mode_ctr}} & col_en_host     );


// IV and BKP Registers
generate
	genvar l;

	for(l = 0; l < 4;l=l+1)
	begin:IV_BKP_REGISTERS
		always @(posedge clk, negedge rst_n)
		begin
				if(!rst_n)
				begin
						iv[l]    <= {32{1'b0}};
						bkp[l]   <= {32{1'b0}};
						bkp_1[l] <= {32{1'b0}};
				end
				else
				begin
						if(l == 3)
						begin 
								if(iv_en[l] || iv_cnt_en) 
								begin
									
									if(mode_ctr)
										iv[l] <= (iv_cnt_sel) ? iv[l] + 1'b1 : bus_in;

									else
										iv[l] <= (iv_cnt_sel) ? iv[l] : bus_in;
									
									
									//iv[l] <= (iv_cnt_sel) ? iv[l] : bus_in;
								end
						end
						else
						begin
								if(iv_en[l]) 
									iv[l] <= bus_in;
						end

					if(bkp_en[l])
						//bkp[l] <= (mode_ctr) ? bus_swap : ((mode_cbc && enc_dec) ? col_in : bkp_1[l]);
					bkp[l] <= (mode_ctr) ? bus_swap : ((mode_cbc && enc_dec)? col_in[32*(l + 1) - 1 : 32*l] : bkp_1[l]);

					if(bkp_en[l])
						bkp_1[l] <= col_in[32*(l + 1) - 1 : 32*l];
				end 
			end
		
		end
endgenerate

assign col_sel_w_bypass = (bypass_rk) ? col_sel : col_sel_pp2; 

// Columns Input Multiplexors
always @(*)
	begin
		col_in = {128{1'b0}};
		case(col_sel_w_bypass)
			SHIFT_ROWS:
				col_in = (enc_dec) ? sr_enc : sr_dec;
			ADD_RK_OUT:
				col_in = {4{add_rk_out}};
			INPUT:
				col_in = {4{data_in}};	 
		endcase
	end

assign col_en_w_bypass = (bypass_rk) ? col_en_cnt_unit : col_en_cnt_unit_pp2; 
assign col_en = col_en_host | col_en_w_bypass;

// Columns Definition
generate
	genvar i;
	for(i = 0; i < 4; i = i + 1)
	begin:CD
		always @(posedge clk, negedge rst_n)
			begin
				if(!rst_n)
					col[3 - i] <= {32{1'b0}};
				else 
				if(col_en[3 - i])
					col[3 - i] <= col_in[32*(i + 1) - 1 : 32*i]; 
			end
	end
endgenerate

// Shift Rows Operation
assign sr_input_3 = (enc_dec) ? add_rk_out : col[3];
assign sr_input_0 = (enc_dec) ? col[0] : add_rk_out;
assign sr_input = {sr_input_0, col[1], col[2], sr_input_3};

shift_rows SHIFT_ROW
(
	.data_out_enc  ( sr_enc   ),
	.data_out_dec  ( sr_dec   ),
  .data_in       ( sr_input ) 
);

//SBOX Input Multiplexor
always @(sbox_input or sbox_sel or col_sel_host or col[0] or col[1] or col[2] or col[3] or g_in)
	begin
		sbox_input = {32{1'b0}};
		case(sbox_sel | col_sel_host)
			COL_0:
				sbox_input = col[0];
			COL_1:
				sbox_input = col[1];
			COL_2:
				sbox_input = col[2];
			COL_3:
				sbox_input = col[3];
			G_FUNCTION:
				sbox_input = g_in;
		endcase
	end

// 32 bits SBOX
assign enc_dec_sbox = enc_dec | key_gen;
 sBox SBOX
  (
    .sbox_out_enc ( sbox_out_enc ),
		.sbox_out_dec ( sbox_out_dec ),
    .sbox_in      ( sbox_input   ),
    .enc_dec      ( enc_dec_sbox ),
		.clk          ( clk          )
  );

// Second stage of pipeline
always @(posedge clk)
	begin
		sbox_pp2 <= (enc_dec || mode_ctr) ? sbox_out_enc : sbox_out_dec ^ key_mux_out;
	end

assign key_en_sel  = (bypass_key_en) ? key_en : key_en_pp1;
assign key_sel_mux = (bypass_key_en) ? key_sel : key_sel_pp1;
 
// Key registers
generate
	genvar j;
	for(j = 0; j < 4; j = j + 1)
	begin:KR
		always @(posedge clk, negedge rst_n)
			begin
				if(!rst_n)
					begin
						key_host[3 - j] <= {32{1'b0}};
						key[3 - j] <= {32{1'b0}};
					end
				else
					begin
						if(key_host_en[3 - j] || key_derivation_en)
							key_host[3 - j] <= (key_derivation_en) ? key[3 - j] : bus_in;
					
						if(key_en_sel[3 - j] || key_init || key_host_en[3 - j])
							key[3 - j] <= (key_sel_mux) ? key_out[32*(j + 1) - 1 : 32*j] : ( (key_host_en[3 - j]) ? bus_in : key_host[3 - j] );
					end  
			end
	end
endgenerate

assign key_in = {key[0], key[1], key[2], key[3]};

assign key1_mux_cnt = bypass_key_en & enc_dec;

key_expander KEY_EXPANDER
(
	.key_out   ( key_out       ),
	.g_in		   ( g_in          ),
	.g_out     ( sbox_out_enc  ),
	.key_in    ( key_in        ),
	.round     ( round_pp1     ),
	.add_w_out ( key1_mux_cnt  ),
	.enc_dec   ( enc_dec | key_gen)
);

assign key_mux_sel = (bypass_key_en) ? key_out_sel : ( (enc_dec | mode_ctr) ? key_out_sel_pp2 : key_out_sel_pp1 );

// Key Expander Mux
always @(key_mux_out or key_mux_sel or key_sel_rd or key[0] or key[1] or key[2] or key[3])
	begin
		key_mux_out = {32{1'b0}};
		case(key_mux_sel | key_sel_rd)
			KEY_0:
				key_mux_out = key[0];
			KEY_1:
				key_mux_out = key[1];
			KEY_2:
				key_mux_out = key[2];
			KEY_3:
				key_mux_out = key[3];	
		endcase
	end

  mix_columns MIX_COL
  (
    .mix_out_enc ( mix_out_enc  ),
		.mix_out_dec ( mix_out_dec  ),
    .mix_in      ( sbox_pp2     )
  );

assign rk_sel_mux = (bypass_rk) ? rk_sel : rk_sel_pp2;

always @(*)
	begin
		add_rd_key_in = {32{1'b0}};
		case(rk_sel_mux)
			COL:
				add_rd_key_in = sbox_input;
			MIXCOL_IN:
				add_rd_key_in = sbox_pp2;
			MIXCOL_OUT:
				add_rd_key_in = mix_out_enc;
		endcase
	end

// Add Round Key
assign add_rd = add_rd_key_in ^ key_mux_out;

assign rk_out_sel = (enc_dec | mode_ctr | bypass_rk);

assign add_rk_sel = (bypass_rk) ? rk_out_sel : rk_out_sel_pp2;

assign add_rk_out = (add_rk_sel) ? add_rd : (last_round_pp2 ? sbox_pp2 : mix_out_dec);

assign end_aes = end_comp;

// Pipeline Registers for Control Signals
always @(posedge clk, negedge rst_n)
	begin
		if(!rst_n)
			begin
				//end_aes_pp1 <= DISABLE;
				//end_aes_pp2 <= DISABLE;

				col_sel_pp1 <= INPUT; 
				col_sel_pp2 <= INPUT;

				col_en_cnt_unit_pp1 <= COL_DIS;
				col_en_cnt_unit_pp2 <= COL_DIS;

				key_sel_pp1 <= KEY_HOST;
				key_en_pp1  <= KEY_DIS;

				round_pp1 <= 4'b0000;

				key_out_sel_pp1 <= KEY_0;
				key_out_sel_pp2 <= KEY_0;

				rk_sel_pp1 <= COL;
				rk_sel_pp2 <= COL;

				rk_out_sel_pp1 <= 1'b1;
				rk_out_sel_pp2 <= 1'b1;

				last_round_pp1 <= 1'b1;
				last_round_pp2 <= 1'b0;
			end
		else
			begin
				col_sel_pp1 <= col_sel;
				col_sel_pp2 <= col_sel_pp1;

				if(!bypass_rk)
					begin	
						col_en_cnt_unit_pp1 <= col_en_cnt_unit;
						col_en_cnt_unit_pp2 <= col_en_cnt_unit_pp1;
					end

				key_sel_pp1 <= key_sel;

				if(!bypass_key_en)
					key_en_pp1 <= key_en;

				round_pp1 <= round;

				key_out_sel_pp1 <= key_out_sel;
				key_out_sel_pp2 <= key_out_sel_pp1;

				rk_sel_pp1 <= rk_sel;
				rk_sel_pp2 <= rk_sel_pp1;

				rk_out_sel_pp1 <= rk_out_sel;
				rk_out_sel_pp2 <= rk_out_sel_pp1;

				last_round_pp1 <= last_round;
				last_round_pp2 <= last_round_pp1;

				//end_aes_pp1 <= end_comp;
				//end_aes_pp2 <= end_aes_pp1;
			end
	end
endmodule

//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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
module data_swap
#(
	parameter WIDTH = 32
)(
	//OUTPUTS
	output [WIDTH - 1:0] data_swap,
	//INPUTS
	input  [WIDTH - 1:0] data_in,
	input  [ 1:0] swap_type
);

//=====================================================================================
// Swap Types
//=====================================================================================
localparam NO_SWAP        = 2'b00;
localparam HALF_WORD_SWAP = 2'b01;
localparam BYTE_SWAP      = 2'b10;
localparam BIT_SWAP       = 2'b11;

localparam TYPES = 4;

wire [WIDTH - 1 : 0] words[0 : TYPES - 1];

generate
	genvar i, j;
	for(i = 0; i < TYPES; i = i + 1)
	begin:BLOCK
		for(j = 0; j < WIDTH; j = j + 1)
			begin: SUB_BLOCK
				if(i != 3)
					assign words[i][j] = data_in[(WIDTH - (WIDTH/2**i)) - 2*(WIDTH/2**i)*(j/(WIDTH/2**i)) + j];
				else
					assign words[i][j] = data_in[WIDTH - 1 - j];
			end
	end
endgenerate

assign data_swap = words[swap_type];

endmodule

//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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
	// OUTPUTS
	output [3:0] key_en,
	output [1:0] col_addr,
	output [1:0] chmod,
	output [1:0] mode,
	output [1:0] data_type,
	output col_wr_en,
	output col_rd_en,
	output [1:0] key_sel,
	output [3:0] iv_en,
	output [3:0] iv_sel,
	output int_ccf,
	output int_err,
	output disable_core,
	output reg first_block,
	output dma_req_wr,
	output dma_req_rd,
	output reg start_core,
	output [31:0] PRDATA,
	//INPUTS
	input [3:0] PADDR,
	input [12:0] PWDATA,
	input PWRITE,
	input PENABLE,
	input PSEL,
	input PCLK,
	input PRESETn,
	input [31:0] key_bus,
	input [31:0] col_bus,
	input [31:0] iv_bus,
	input ccf_set
);

//`include "include/host_interface.vh"

//=====================================================================================
// Memory Mapped Registers Address
//=====================================================================================
localparam AES_CR    = 4'd00;
localparam AES_SR    = 4'd01;
localparam AES_DINR  = 4'd02;
localparam AES_DOUTR = 4'd03;
localparam AES_KEYR0 = 4'd04;
localparam AES_KEYR1 = 4'd05;
localparam AES_KEYR2 = 4'd06;
localparam AES_KEYR3 = 4'd07;
localparam AES_IVR0  = 4'd08;
localparam AES_IVR1  = 4'd09;
localparam AES_IVR2  = 4'd10;
localparam AES_IVR3  = 4'd11;

//=============================================================================
// Operation Modes
//=============================================================================
localparam ENCRYPTION     = 2'b00;
localparam KEY_DERIVATION = 2'b01;
localparam DECRYPTION     = 2'b10;
localparam DECRYP_W_DERIV = 2'b11;

//=============================================================================
// AES Modes
//=============================================================================
localparam ECB = 2'b00;
localparam CBC = 2'b01;
localparam CTR = 2'b10;

//=============================================================================
// Resets Values
//=============================================================================
localparam AES_CR_RESET = 13'd0;
localparam AES_SR_RESET =  3'd0;

//=============================================================================
// Enable Value (Active High)
//=============================================================================
localparam ENABLE  = 1'b1;
localparam DISABLE = 1'b0;

//=============================================================================
// FSM STATES
//=============================================================================
localparam IDLE   = 3'd0;
localparam INPUT  = 3'd1;
localparam START  = 3'd2;
localparam WAIT   = 3'd3;
localparam OUTPUT = 3'd4;

wire [31:0] bus_out;
reg [31:0] bus_out_mux;
reg cnt_en;
reg enable_clear;
reg access_permission;
reg first_block_set;
reg first_block_clear;
wire [1:0] mode_in;
wire [1:0] chmod_in;
wire write_en;
wire read_en;
wire dma_out_en;
wire dma_in_en;
wire err_ie;
wire ccf_ie;
wire errc;
wire ccfc;
wire aes_cr_wr_en;
//wire aes_sr_wr_en;
wire wr_err_en;
wire rd_err_en;
wire write_completed;
wire read_completed;
wire key_deriv;


reg [10:0] aes_cr;
reg wr_err;
reg rd_err;
reg ccf;
reg [2:0] state, next_state;
reg [1:0] cnt;
reg dma_req;
wire enable;

// Write and read enable signals
assign write_en = PSEL & PENABLE & PWRITE;
assign read_en  = (PSEL & ~PWRITE)?1'b1:1'b0;

// Configuration Register Logic
assign dma_out_en = aes_cr[10];
assign dma_in_en  = aes_cr[9];
assign err_ie     = aes_cr[8];
assign ccf_ie     = aes_cr[7];
assign errc       = PWDATA[8];
assign ccfc       = PWDATA[7];
assign chmod      = aes_cr[6:5];
assign mode       = aes_cr[4:3];
assign data_type  = aes_cr[2:1];
assign enable     = aes_cr[0];

assign aes_cr_wr_en = (PADDR == AES_CR) & write_en;
assign mode_in  = PWDATA[4:3];
assign chmod_in = PWDATA[6:5];

always @(posedge PCLK, negedge PRESETn)
	begin
		if(!PRESETn)
			aes_cr <= AES_CR_RESET[10:0];
		else
			begin
				if(enable_clear)
					aes_cr[0] <= 1'b0;
				else
					if(aes_cr_wr_en)
						aes_cr[0] <= PWDATA[0];

				if(aes_cr_wr_en && access_permission)
					begin
						aes_cr[2:1] <= PWDATA[2:1];
						if(mode_in == DECRYP_W_DERIV && chmod_in == CTR)
							aes_cr[4:3] <= DECRYPTION;
						else
							aes_cr[4:3] <= mode_in;
						aes_cr[ 6:5] <= PWDATA[6:5];
						aes_cr[10:7] <= PWDATA[12:9];
					end
			end
	end
 
// Status Register Logic
//assign aes_sr_wr_en = (PADDR == AES_SR) & write_en & access_permission;

always @(posedge PCLK, negedge PRESETn)
	begin
		if(!PRESETn)
		begin
			{wr_err, rd_err, ccf} <= AES_SR_RESET;

		end
		else
			begin
				// Write Error Flag
				if(wr_err_en)
					wr_err <= 1'b1;
				else
					if(errc && aes_cr_wr_en && access_permission)
						wr_err <= 1'b0;

				//Read Error Flag
				if(rd_err_en)
					rd_err <= 1'b1;
				else
					if(errc && aes_cr_wr_en && access_permission)
						rd_err <= 1'b0;

				// Computation Complete Flag
				if(ccf_set)
				   	ccf <= 1'b1;
				else
					if(ccfc && aes_cr_wr_en )//&& access_permission)
						ccf <= 1'b0;
			end
	end
// Interruption on erros Signals
assign int_ccf = ccf_ie & ccf_set;
assign int_err = (wr_err_en | rd_err_en) & err_ie;

// Key Signals Decoding
assign key_en = (4'b1000 >> PADDR[1:0]) & {4{(~PADDR[3] & PADDR[2] & access_permission & write_en)}};
assign key_sel = ~PADDR[1:0] & {2{(PADDR[2] & access_permission)}};

// IV Signals Decoding
assign iv_sel = (4'b1000 >> PADDR[1:0]) & {4{(PADDR[3] & ~PADDR[2] & access_permission)}};
assign iv_en = iv_sel & {4{write_en}};

// State Register
always @(posedge PCLK, negedge PRESETn)
	begin
		if(!PRESETn)
			state <= IDLE;
		else
			if(!enable)
				state <= IDLE;
			else
				state <= next_state;
	end

assign write_completed = (cnt == 2'b11);
assign read_completed  = (cnt == 2'b11);
assign key_deriv = (mode == KEY_DERIVATION);

// Next State Logic
always @(*)
	begin
		next_state = state;
		case(state)
		IDLE  :
			begin
				if(enable)
					next_state = (key_deriv) ? START : INPUT;
			end
		INPUT :
			next_state = (write_completed && cnt_en) ? START : INPUT;
		START :
			next_state = WAIT;
		WAIT  :
			begin
				if(ccf_set)
					next_state = (key_deriv) ? IDLE : OUTPUT;
			end
		OUTPUT:
			next_state = (read_completed && cnt_en) ? INPUT : OUTPUT;
		endcase
	end

// Output Logic
assign disable_core = ~enable;

always @(*)
	begin
		access_permission = DISABLE;
		start_core = DISABLE;
		cnt_en = DISABLE;
		enable_clear = DISABLE;
		first_block_set = DISABLE;
		first_block_clear = DISABLE;
		case(state)
			IDLE:
				begin
					access_permission = ENABLE;
					first_block_set = ENABLE;
					if(enable && !key_deriv)
						cnt_en = ENABLE;
				end
			INPUT:
				begin
					if(PADDR == AES_DINR && write_en)
						cnt_en = ENABLE;
				end
			START:
				begin
					start_core = ENABLE;
				end
			WAIT:
				begin
					if(ccf_set)
						cnt_en = ENABLE;
					if(ccf_set && key_deriv)
						enable_clear = ENABLE;
				end
			OUTPUT:
				begin
					first_block_clear = ENABLE;
					if(PADDR == AES_DOUTR && read_en && PENABLE )//|| write_completed)
						cnt_en = ENABLE;
				end
		endcase
	end

// First Block Signal indicates when IV register is used
always @(posedge PCLK, negedge PRESETn)
	begin
		if(!PRESETn)
			first_block <= 1'b1;
		else
			if(first_block_set)
				first_block <= 1'b1;
			else
				if(first_block_clear)
					first_block <= 1'b0;
	end

always @(posedge PCLK, negedge PRESETn)
	begin
		if(!PRESETn)
			cnt <= 2'b11;
		else
			begin
				if(!enable || state == START)
					cnt <= 2'b11;
				else
					if(cnt_en)
						cnt <= cnt + 1'b1;
			end
	end

assign col_addr = cnt;
assign col_wr_en = (PADDR == AES_DINR  && write_en && state == INPUT);
assign col_rd_en = (PADDR == AES_DOUTR && read_en  && state == OUTPUT);
assign wr_err_en = (PADDR == AES_DINR  && write_en && (state != INPUT  && state != IDLE));
assign rd_err_en = (PADDR == AES_DOUTR && read_en  && (state != OUTPUT && state != IDLE));

// DMA Requests Logic
always @(posedge PCLK, negedge PRESETn)
	begin
		if(!PRESETn)
			dma_req <= 1'b0;
		else
			dma_req <= cnt[0];
	end

assign dma_req_wr = (dma_req ^ cnt[0]) & dma_in_en  & enable & (state == INPUT  || state == IDLE);
assign dma_req_rd = (dma_req ^ cnt[0]) & dma_out_en & enable & (state == OUTPUT);

// APB Read Signal
assign PRDATA = bus_out;

// Output Mux
always @(*)
	begin
		bus_out_mux = 32'd0;
		case(PADDR)
			AES_CR:
				bus_out_mux = {{19{1'b0}}, aes_cr[10:7], 2'b00, aes_cr[6:0]};
			AES_SR:
				bus_out_mux = {{29{1'b0}}, wr_err, rd_err, (ccf_set && ~PENABLE)? 1'b1:(ccfc && aes_cr_wr_en)?1'b0:ccf};
			AES_DINR, AES_DOUTR:
			begin
				if(~PWRITE && PADDR == AES_DOUTR && (ccf_set || ccf ))
					bus_out_mux = col_bus;
			end
			AES_KEYR0, AES_KEYR1, AES_KEYR2, AES_KEYR3:
				if(!enable)
					bus_out_mux = key_bus;
			AES_IVR0, AES_IVR1, AES_IVR2, AES_IVR3:
				if(!enable)
					bus_out_mux = iv_bus;
			
		endcase
	end

// The output Bus is registered

assign bus_out =(read_en)? bus_out_mux:32'd0;

/*
always @(posedge PCLK, negedge PRESETn)
	begin
		if(!PRESETn)
			bus_out <= 32'd0;
		else
			if(read_en)
				bus_out <= bus_out_mux;
	end
*/

endmodule

//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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
module key_expander
(
	// OUTPUTS
	output  [127:0] key_out,
	output  [ 31:0] g_in,
	// INPUTS
	input  [ 31:0] g_out,
	input  [127:0] key_in,
	input  [  3:0] round,
	input add_w_out,
	input enc_dec
);

localparam integer KEY_WIDTH = 32;
localparam integer KEY_NUM   = 4;
localparam integer WORD      = 8;
localparam integer ROUNDS    = 10;

wire  [KEY_WIDTH - 1 : 0] key   [0 : KEY_NUM - 1];
wire  [     WORD - 1 : 0] rot_in[0 : KEY_NUM - 1];
wire  [KEY_WIDTH - 1 : 0] g_func;
reg   [     WORD - 1 : 0] rc_dir, rc_inv;
wire  [     WORD - 1 : 0] rc;

//=====================================================================================
// Key Generation
//=====================================================================================
generate
	genvar i;
	for(i = 0; i < KEY_NUM; i = i + 1)
	begin:KG
			assign key[KEY_NUM - 1 - i] = key_in[KEY_WIDTH*(i + 1) - 1 : KEY_WIDTH*i];
	end
endgenerate

//=====================================================================================
// Key Out Generation
//=====================================================================================
generate
	genvar j;
	for(j = 0; j < KEY_NUM; j = j + 1)
	begin:KGO
			if(j == 0)
				assign key_out[KEY_WIDTH*(KEY_NUM - j) - 1 : KEY_WIDTH*(KEY_NUM - j - 1)] = key[j] ^ g_func;
			else
				if(j == 1)
					assign key_out[KEY_WIDTH*(KEY_NUM - j) - 1 : KEY_WIDTH*(KEY_NUM - j - 1)] = (add_w_out) ? key[j] ^ key[j - 1] ^ g_func : key[j] ^ key[j - 1];
				else
					assign key_out[KEY_WIDTH*(KEY_NUM - j) - 1 : KEY_WIDTH*(KEY_NUM - j - 1)] = key[j] ^ key[j - 1];
	end
endgenerate

//=====================================================================================
// G Function Input Generation
//=====================================================================================
generate
	genvar k;
	for(k = 0; k < KEY_NUM; k = k + 1)
	begin:GFIG
		assign rot_in[k] = (enc_dec) ? key[KEY_NUM - 1][WORD*(k + 1) - 1 : WORD*k] : key[KEY_NUM - 1][WORD*(k + 1) - 1 : WORD*k] ^ key[KEY_NUM - 2][WORD*(k + 1) - 1 : WORD*k];
	end
endgenerate

generate
	genvar l;
	for(l = 0; l < KEY_NUM; l = l + 1)
	begin:GFIG1
		assign g_in[WORD*(l + 1) - 1 : WORD*l] = rot_in[(KEY_NUM + l - 1)%KEY_NUM];
	end
endgenerate

//=====================================================================================
// G Functin Output Processsing
//=====================================================================================
assign g_func = {g_out[KEY_WIDTH - 1 : KEY_WIDTH - WORD] ^ rc, g_out[KEY_WIDTH - WORD - 1 : 0]};

assign rc = (enc_dec) ? rc_dir : rc_inv;

always @(*)
	begin: RC_DIR
		integer i;
		for(i = 0; i < ROUNDS; i = i + 1)
			if(round == 8)
				rc_dir = 8'h1b;
			else 
			if(round == 9)
				rc_dir = 8'h36;
			else
				rc_dir = 8'h01 << round;
	end

always @(*)
	begin: RC_INV
		integer i;
		for(i = 0; i < ROUNDS; i = i + 1)
			if(round == 1)
				rc_inv = 8'h1b;
			else 
			if(round == 0)
				rc_inv = 8'h36;
			else
				rc_inv = 8'h80 >> (round - 2);
	end
endmodule

//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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
module mix_columns
(
	// OUTPUTS
	output [31:0] mix_out_enc,
	output [31:0] mix_out_dec,
	// INPUTS
	input  [31:0] mix_in
);

localparam integer SIZE      = 32;
localparam integer WORD_SIZE = 8;
localparam integer NUM_WORDS = 4;

wire [WORD_SIZE - 1 : 0] col  [0 : NUM_WORDS - 1];
wire [WORD_SIZE - 1 : 0] sum_p[0 : NUM_WORDS - 1];
wire [WORD_SIZE - 1 : 0] y    [0 : NUM_WORDS - 2];

//=====================================================================================
// Multiplication by 02 in GF(2^8) 
//=====================================================================================
function [7:0] aes_mult_02;
  input [7:0] data_in;
  begin
    aes_mult_02 = (data_in << 1) ^ {8{data_in[7]}} & 8'h1b;
  end
endfunction

//=====================================================================================
// Multiplication by 04 in GF(2^8)
//=====================================================================================
function [7:0] aes_mult_04;
  input [7:0] data_in;
  begin
    aes_mult_04 = ((data_in << 2) ^ {8{data_in[6]}} & 8'h1b) ^ {8{data_in[7]}} & 8'h36;
  end
endfunction

//=====================================================================================
// Word to Byte transformation
//=====================================================================================
generate
	genvar i;
	for(i = 0 ; i < NUM_WORDS; i = i + 1)
	begin:WBT
		assign col[i] = mix_in[WORD_SIZE*(i + 1) - 1: WORD_SIZE*i];
	end
endgenerate

//=====================================================================================
// Direct Mix Column Operation
//=====================================================================================
generate
	genvar j;
	for(j = 0; j < NUM_WORDS; j = j + 1)
		begin:DMCO
			assign sum_p[j] = col[(j + 1)%NUM_WORDS] ^ col[(j + 2)%NUM_WORDS] ^ col[(j + 3)%NUM_WORDS];
			assign mix_out_enc[ WORD_SIZE*(j + 1) - 1 : WORD_SIZE*j] = aes_mult_02(col[j] ^ col[(j + NUM_WORDS - 1)%NUM_WORDS]) ^ sum_p[j];
		end
endgenerate

//=====================================================================================
// Inverse Mix Column Operation
//=====================================================================================
assign y[0] = aes_mult_04(col[2] ^ col[0]); 
assign y[1] = aes_mult_04(col[3] ^ col[1]);
assign y[2] = aes_mult_02(  y[1] ^   y[0]);  
assign mix_out_dec = mix_out_enc ^ {2{y[2] ^ y[1], y[2] ^ y[0]}};

endmodule


module sBox
#(
  parameter SBOX_NUM = 4
)(
  //OUTPUTS
  output [8*SBOX_NUM - 1:0] sbox_out_enc,
  output [8*SBOX_NUM - 1:0] sbox_out_dec,
	//INPUTS
  input  [8*SBOX_NUM - 1:0] sbox_in,
	input enc_dec,
	input clk
);
  sBox_8 SBOX[SBOX_NUM - 1:0]
  (
    .sbox_out_enc ( sbox_out_enc ),
		.sbox_out_dec ( sbox_out_dec ),
    .sbox_in      ( sbox_in      ),
		.enc_dec      ( enc_dec      ),
		.clk          ( clk          )
  );
  
endmodule

//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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

//Reference: A Very Compact Rijndael S-box, D. Canright

module sBox_8
(
  //OUTPUTS
  output [7:0] sbox_out_enc, // Direct SBOX
	output [7:0] sbox_out_dec, // Inverse SBOX
  //INPUTS
  input  [7:0] sbox_in,
	input enc_dec,
	input clk
);
//`include "include/sbox_functions.vf"

// Functions used by SBOX Logic
// For more detail, see "A Very Compact Rijndael  S-Box" by D. Canright
localparam ENC = 1;
localparam DEC = 0;

function [1:0] gf_sq_2;
	input [1:0] in;
	begin
  	gf_sq_2 = {in[0], in[1]};
	end
endfunction

function [1:0] gf_sclw_2;
	input [1:0] in;
	begin
  	gf_sclw_2 = {^in, in[1]};
  end
endfunction

function [1:0] gf_sclw2_2;
	input [1:0] in;
	begin
  	gf_sclw2_2 = {in[0], ^in};
  end
endfunction

function [1:0] gf_muls_2;
	input [1:0] in1, in2;
  input in3, in4;
	begin
  	gf_muls_2 = ( ~(in1 & in2) ) ^ ( {2{~(in3 & in4)}} );
  end
endfunction

function [1:0] gf_muls_scl_2;
  input [1:0] in1, in2;
  input in3, in4;
	reg [1:0] nand_in1_in2;
  reg nand_in3_in4;
	begin
  	nand_in1_in2 = ~(in1 & in2);
  	nand_in3_in4 = ~(in3 & in4);
  	gf_muls_scl_2 = {nand_in3_in4 ^ nand_in1_in2[0], ^nand_in1_in2};
  end
endfunction

function [3:0] gf_inv_4;
  input [3:0] in;
	reg [1:0] in_hg;
	reg [1:0] in_lw;
	reg [1:0] out_gf_mul_2;
	reg [1:0] out_gf_mul_3;
	reg [1:0] out_gf_sq2_3;
	reg [1:0] in_sq2_3;
	reg xor_in_hg, xor_in_lw;
	begin
		in_hg = in[3:2];
		in_lw = in[1:0];
		xor_in_hg = ^in_hg;
		xor_in_lw = ^in_lw;
		in_sq2_3 = {~(in_hg[1] | in_lw[1]) ^ (~(xor_in_hg & xor_in_lw)), ~(xor_in_hg | xor_in_lw) ^ (~(in_hg[0] & in_lw[0]))};
 
  	out_gf_sq2_3 = gf_sq_2(in_sq2_3);
 		out_gf_mul_2 = gf_muls_2(out_gf_sq2_3, in_lw, ^out_gf_sq2_3, xor_in_lw);
		out_gf_mul_3 = gf_muls_2(out_gf_sq2_3, in_hg, ^out_gf_sq2_3, xor_in_hg);
 		
		gf_inv_4 = {out_gf_mul_2, out_gf_mul_3};
 end
endfunction


function [3:0] gf_sq_scl_4;
  input [3:0] in;
	reg [1:0] in_hg;
	reg [1:0] in_lw;
	reg [1:0] out_gf_sq2_1;
	reg [1:0] out_gf_sq2_2;
	reg [1:0] out_gf_sclw2_1;
	begin
		in_hg = in[3:2];
		in_lw = in[1:0];
		
		out_gf_sq2_1 = gf_sq_2(in_hg ^ in_lw );
 		out_gf_sq2_2 = gf_sq_2(in_lw);
 		out_gf_sclw2_1 = gf_sclw_2(out_gf_sq2_2);
 
 		gf_sq_scl_4 = {out_gf_sq2_1, out_gf_sclw2_1};
	end
endfunction


function [3:0] gf_muls_4;
  input [3:0] in1;
  input [3:0] in2;	
	reg [1:0] in1_hg;
	reg [1:0] in1_lw;
	reg [1:0] in2_hg;
	reg [1:0] in2_lw;
	reg [1:0] xor_in1_hl;
	reg [1:0] xor_in2_hl;
	reg [1:0] out_gf_mul_1;
	reg [1:0] out_gf_mul_2;
	reg [1:0] out_gf_mul_scl_1;
	begin
 		in1_hg = in1[3:2];
		in1_lw = in1[1:0];
 		in2_hg = in2[3:2];
 		in2_lw = in2[1:0];
 		xor_in1_hl = in1_hg ^ in1_lw;
 		xor_in2_hl = in2_hg ^ in2_lw;

		out_gf_mul_1 = gf_muls_2(in1_hg, in2_hg, in1[3] ^ in1[2], in2[3] ^ in2[2]);
 		out_gf_mul_2 = gf_muls_2(in1_lw, in2_lw, in1[1] ^ in1[0], in2[1] ^ in2[0]);
		out_gf_mul_scl_1 = gf_muls_scl_2(xor_in1_hl, xor_in2_hl, ^xor_in1_hl, ^xor_in2_hl);
 
  	gf_muls_4 = {out_gf_mul_1 ^ out_gf_mul_scl_1,  out_gf_mul_2 ^ out_gf_mul_scl_1};
	end
endfunction

function [3:0] gf_inv_8_stage1;
  input [7:0] in;
	reg [3:0] in_hg;
	reg [3:0] in_lw;
	reg [3:0] out_gf_mul4_2;
	reg [3:0] out_gf_mul4_3;
	reg [3:0] out_gf_inv4_2;
	reg c1, c2, c3;
	begin
		in_hg = in[7:4];
		in_lw = in[3:0];
          
 		c1 = ~((in_hg[3] ^ in_hg[2]) & (in_lw[3] ^ in_lw[2]));
 		c2 = ~((in_hg[2] ^ in_hg[0]) & (in_lw[2] ^ in_lw[0]));
 		c3 = ~((^in_hg) & (^in_lw));

 		gf_inv_8_stage1 = 
				 {(~((in_hg[2] ^ in_hg[0]) | (in_lw[2] ^ in_lw[0])) ^ (~(in_hg[3] & in_lw[3]))) ^ c1 ^ c3, 
          (~((in_hg[3] ^ in_hg[1]) | (in_lw[3] ^ in_lw[1])) ^ (~(in_hg[2] & in_lw[2]))) ^ c1 ^ c2, 
          (~((in_hg[1] ^ in_hg[0]) | (in_lw[1] ^ in_lw[0])) ^ (~(in_hg[1] & in_lw[1]))) ^ c2 ^ c3, 
          ((~(in_hg[0] | in_lw[0])) ^ (~((in_hg[1] ^ in_hg[0]) & (in_lw[1] ^ in_lw[0])))) ^ (~((in_hg[3] ^ in_hg[1]) & (in_lw[3] ^ in_lw[1]))) ^ c2}; 
	end
endfunction

function [7:0] gf_inv_8_stage2;
  input [7:0] in;
	input [3:0] c;
	reg [3:0] in_hg;
	reg [3:0] in_lw;
	reg [3:0] out_gf_mul4_2;
	reg [3:0] out_gf_mul4_3;
	reg [3:0] out_gf_inv4_2;
	reg c1, c2, c3;
	begin
		in_hg = in[7:4];
		in_lw = in[3:0];
          
		out_gf_inv4_2 = gf_inv_4(c);
		out_gf_mul4_2 = gf_muls_4(out_gf_inv4_2, in_lw);
		out_gf_mul4_3 = gf_muls_4(out_gf_inv4_2, in_hg);

 		gf_inv_8_stage2 = {out_gf_mul4_2, out_gf_mul4_3};
	end
endfunction

function [15:0] isomorphism;
  input [7:0] in;
  reg r1, r2, r3, r4, r5, r6, r7, r8, r9;
  reg [7:0] enc, dec;
  begin
    r1 = in[7]  ^ in[5];
    r2 = in[7] ~^ in[4];
    r3 = in[6]  ^ in[0];
    r4 = in[5] ~^ r3;
    r5 = in[4]  ^ r4;
    r6 = in[3]  ^ in[0];
    r7 = in[2]  ^ r1;
    r8 = in[1]  ^ r3;
    r9 = in[3]  ^ r8;
    
    enc = {r7 ~^ r8, r5, in[1] ^ r4, r1 ~^ r3, in[1] ^ r2 ^ r6, ~in[0], r4, in[2] ~^ r9};
    dec = {r2, in[4] ^ r8, in[6] ^ in[4], r9, in[6] ~^ r2, r7, in[4] ^ r6, in[1] ^ r5};
    
    isomorphism = {enc, dec};
  end
endfunction

function [7:0] isomorphism_inv;
  input [7:0] in;
	input op_type;
  reg r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;
  begin
    r1  = in[7]  ^ in[3];
    r2  = in[6]  ^ in[4];
    r3  = in[6]  ^ in[0];
    r4  = in[5] ~^ in[3];
    r5  = in[5] ~^ r1;
    r6  = in[5] ~^ in[1];
    r7  = in[4] ~^ r6;
    r8  = in[2]  ^ r4;
    r9  = in[1]  ^ r2;
    r10 = r3     ^ r5;
    
		if(op_type == ENC)
    	isomorphism_inv = {r4, r1, r3, r5, r2 ^ r5, r3 ^ r8, r7, r9};
		else
    	isomorphism_inv = {in[4] ~^ in[1], in[1] ^ r10, in[2] ^ r10, in[6] ~^ in[1], r8 ^ r9, in[7] ~^ r7, r6, ~in[2]};
    
  end
endfunction




wire [7:0] base_new_enc, base_new_dec, base_new;
//wire [7:0] base_enc, base_dec;
wire [3:0] out_gf_inv8_stage1;
wire [7:0] out_gf_inv8_1;
//wire [7:0] out_gf_inv8_2;

reg [3:0] out_gf_pp;
reg [7:0] base_new_pp;

assign {base_new_enc, base_new_dec} = isomorphism(sbox_in);

assign base_new = ~(enc_dec ? base_new_enc : base_new_dec);
assign out_gf_inv8_stage1 = gf_inv_8_stage1(base_new);

always @(posedge clk)
	begin
		out_gf_pp <= out_gf_inv8_stage1;
		base_new_pp <= base_new;
	end

assign out_gf_inv8_1 = gf_inv_8_stage2(base_new_pp, out_gf_pp);				
	
assign sbox_out_enc = ~isomorphism_inv(out_gf_inv8_1, ENC);
assign sbox_out_dec = ~isomorphism_inv(out_gf_inv8_1, DEC);

endmodule

//////////////////////////////////////////////////////////////////
////
////
//// 	AES CORE BLOCK
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
//// aes128_spec IP core specification document.
////
////
////
//// To Do: Things are right here but always all block can suffer changes
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
////		  Julio Cesar 
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
module shift_rows
(
	//OUTPUTS
	output [127 : 0] data_out_enc,  // Result after Shift Rows operation - enc
	output [127 : 0] data_out_dec,  // Result after Shift Rows operation - dec
	//INPUTS
	input  [127 : 0] data_in        // Input Bus
);

localparam integer BUS_WIDTH = 128;  // Bus Width
localparam integer ST_WORD   =   8;  // Data Size of word in State MAtrix
localparam integer ST_LINE   =   4;  // Number of Lines of State Matrix
localparam integer ST_COL    =   4;  // Number of Columns of State Matrix

wire [ST_WORD - 1 : 0] state[0 : ST_LINE - 1][0 : ST_COL - 1];
wire [ST_WORD - 1 : 0] state_sft_l[0 : ST_LINE - 1][0 : ST_COL - 1];
wire [ST_WORD - 1 : 0] state_sft_r[0 : ST_LINE - 1][0 : ST_COL - 1];

//=====================================================================================
// State Matrix generation
//=====================================================================================
generate
	genvar l,c;
	for(l = 0; l < ST_LINE; l = l + 1)
	begin:SMG
		for(c = 0; c < ST_COL; c = c + 1)
		begin:BLOCK
			assign state[l][c] = data_in[ST_WORD*((ST_COL - c)*ST_LINE - l) - 1 : ST_WORD*((ST_COL - c)*ST_LINE - l - 1)];
		end
	end
endgenerate

//=====================================================================================
// Shift Row operation
//=====================================================================================
generate
	genvar l1,c1;
	for(l1 = 0; l1 < ST_LINE; l1 = l1 + 1)
	begin:SRO
		for(c1 = 0; c1 < ST_COL; c1 = c1 + 1)
			begin:BLOCK
				assign state_sft_l[l1][c1] = state[l1][(c1 + l1)%ST_COL];
				assign state_sft_r[l1][c1] = state[l1][(c1 + (ST_COL - l1))%ST_COL];
			end
	end
endgenerate

//=====================================================================================
// State Matrix to Bus Output Transformation
//=====================================================================================
generate
	genvar l2,c2;
	for(l2 = 0; l2 < ST_LINE; l2 = l2 + 1)
	begin:SMBOT
		for(c2 = 0; c2 < ST_COL; c2 = c2 + 1)
			begin:BLOCK
				assign data_out_enc[ST_WORD*((ST_COL - c2)*ST_LINE - l2) - 1 : ST_WORD*((ST_COL - c2)*ST_LINE - l2 - 1)] = state_sft_l[l2][c2];
				assign data_out_dec[ST_WORD*((ST_COL - c2)*ST_LINE - l2) - 1 : ST_WORD*((ST_COL - c2)*ST_LINE - l2 - 1)] = state_sft_r[l2][c2];
			end
	end
endgenerate
endmodule


