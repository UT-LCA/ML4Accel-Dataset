//////////////////////////////////////////////////////////////////
////
////
//// 	APB module to I2C Core
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
//// apbi2c_spec IP core specification document.
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
////		  Ronal Dario Celaya
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

`timescale 1ns/1ps //timescale 

module apb(
			//standard ARM
	    		input PCLK,
			input PRESETn,
			input PSELx,
			input PWRITE,
			input PENABLE,
			input [31:0] PADDR,
			input [31:0] PWDATA,

			//internal pin
			input [31:0] READ_DATA_ON_RX,
			input ERROR,
			input TX_EMPTY,
			input RX_EMPTY,
			
			//external pin
			output [31:0] PRDATA,

			//internal pin 
			output reg [13:0] INTERNAL_I2C_REGISTER_CONFIG,
			output reg [13:0] INTERNAL_I2C_REGISTER_TIMEOUT,
			output [31:0] WRITE_DATA_ON_TX,
			output  WR_ENA,
			output  RD_ENA,
			
			//outside port 
			output PREADY,
			output PSLVERR,

			//interruption
			output INT_RX,
			output INT_TX
	   

	  );

//ENABLE WRITE ON TX FIFO
assign WR_ENA = (PWRITE == 1'b1 & PENABLE == 1'b1 & PADDR == 32'd0 & PSELx == 1'b1)?  1'b1:1'b0;

//ENABLE READ ON RX FIFO
assign RD_ENA = (PWRITE == 1'b0 & PENABLE == 1'b1  & PADDR == 32'd4 & PSELx == 1'b1)?  1'b1:1'b0;

//WRITE ON I2C MODULE
assign PREADY = ((WR_ENA == 1'b1 | RD_ENA == 1'b1 | PADDR == 32'd8 | PADDR == 32'd12) &  (PENABLE == 1'b1 & PSELx == 1'b1))? 1'b1:1'b0;

//INPUT TO WRITE ON TX FIFO
assign WRITE_DATA_ON_TX = (PADDR == 32'd0)? PWDATA:PWDATA;

//OUTPUT DATA FROM RX TO PRDATA
assign PRDATA = (PADDR == 32'd4)? READ_DATA_ON_RX:READ_DATA_ON_RX;

//ERROR FROM I2C CORE
assign PSLVERR = ERROR; 

//INTERRUPTION FROM I2C
assign INT_TX = TX_EMPTY;

//INTERRUPTION FROM I2C
assign INT_RX = RX_EMPTY;

//This is sequential logic used only to register configuration
always@(posedge PCLK)
begin

	if(!PRESETn)
	begin
		INTERNAL_I2C_REGISTER_CONFIG <= 14'd0;
		INTERNAL_I2C_REGISTER_TIMEOUT <= 14'd0;
	end
	else
	begin

		// Set configuration to i2c
		if(PADDR == 32'd8 && PSELx == 1'b1 && PWRITE == 1'b1 && PREADY == 1'b1)
		begin
			INTERNAL_I2C_REGISTER_CONFIG <= PWDATA[13:0];
		end
		else if(PADDR == 32'd12 && PSELx == 1'b1 && PWRITE == 1'b1 && PREADY == 1'b1)
		begin
			INTERNAL_I2C_REGISTER_TIMEOUT <= PWDATA[13:0];
		end
		else
		begin
			INTERNAL_I2C_REGISTER_CONFIG <= INTERNAL_I2C_REGISTER_CONFIG;
		end
		
	end

end 


endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	FIFO BLOCK to I2C Core
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
//// apbi2c_spec IP core specification document.
////
////
////
//// To Do: This block inst functional yet when you try only write half registers and it didnt go correctly FULL and EMPTY
////
////
////
////
////
//// Author(s): - Felipe Fernandes Da Costa, fefe2560@gmail.com
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
`timescale 1ns/1ps
module fifo
#(
	parameter integer DWIDTH = 32,
	parameter integer AWIDTH = 4
)

(
	input clock, reset, wr_en, rd_en,
	input [DWIDTH-1:0] data_in,
	output f_full, f_empty,
	output [DWIDTH-1:0] data_out
);


	reg [DWIDTH-1:0] mem [0:2**AWIDTH-1];
	//parameter integer DEPTH = 1 << AWIDTH;
	//wire [DWIDTH-1:0] data_ram_out;
	//wire wr_en_ram; 
	//wire rd_en_ram;	

	reg [AWIDTH-1:0] wr_ptr;
	reg [AWIDTH-1:0] rd_ptr;
	reg [AWIDTH-1:0] counter;

	wire [AWIDTH-1:0] wr;
	wire [AWIDTH-1:0] rd;
	wire [AWIDTH-1:0] w_counter;
//Write pointer
	always@(posedge clock)
	begin
		if (reset)
		begin
			wr_ptr <= {(AWIDTH){1'b0}};
		end
		else if (wr_en && !f_full)
		begin
			mem[wr_ptr]<=data_in;
			wr_ptr <= wr;
		end
	end

//Read pointer
	always@(posedge clock)
	begin
		if (reset)
		begin
			rd_ptr <= {(AWIDTH){1'b0}};
		end
		else if (rd_en && !f_empty)
		begin
			rd_ptr <= rd;
		end
	end

//Counter
	always@(posedge clock)
	begin
		if (reset)
		begin
			counter <= {(AWIDTH){1'b0}};
		end
		else
		begin
			if (rd_en && !f_empty && !wr_en)
			begin
				counter <= w_counter;	
			end
			else if (wr_en && !f_full && !rd_en) 
			begin
				counter <= w_counter;
			end
		end
	end

	assign f_full = (counter == 4'd15)?1'b1:1'b0;//DEPTH- 1) ; 
	assign f_empty = (counter == 4'd0)?1'b1:1'b0;//{AWIDTH{1'b0}});
	assign wr = (wr_en && !f_full)?wr_ptr + 4'd1:wr_ptr + 4'd0;
	assign rd = (rd_en && !f_empty)?rd_ptr+ 4'd1:rd_ptr+ 4'd0;
	assign w_counter = (rd_en && !f_empty && !wr_en)? counter - 4'd1:
			   (wr_en && !f_full && !rd_en)? counter + 4'd1:
			    w_counter + 4'd0;
	//assign wr_en_ram = wr_en;
	//assign rd_en_ram = rd_en;
	assign data_out = mem[rd_ptr];//data_ram_out;
/*
dp_ram #(DWIDTH, AWIDTH)
RAM_1 	(
		.clock(clock),
		.reset(reset),
		.wr_en(wr_en_ram),
		.rd_en(rd_en_ram),
		.data_in(data_in),
		.wr_addr(wr_ptr),
		.data_out(data_ram_out),
		.rd_addr(rd_ptr)
	);
*/
endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	TOP I2C BLOCK to I2C Core
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
//// apbi2c_spec IP core specification document.
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
////		  Ronal Dario Celaya
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

`timescale 1ns/1ps //timescale 

module i2c(
	//APB PORTS
	input PCLK,
	input PRESETn,
	input [31:0] PADDR,
	input [31:0] PWDATA,
	input PWRITE,
	input PSELx,
	input PENABLE,
	output PREADY,
	output PSLVERR,
	output INT_RX,
	output INT_TX,
	output [31:0] PRDATA,
	//I2C OUTPUT
	output SDA_ENABLE,
	output SCL_ENABLE,
	inout SDA,
	inout SCL

	  );

	wire RESET_N;

	//THIS IS USED TO RESET FIFO
	assign RESET_N = (PRESETn == 0)?1'b1:1'b0;	

	//WIRES USED TO CONECT BLOCK WITH EACH OTHER
	wire TX_RD_EN;
	wire TX_F_EMPTY;
	wire TX_F_FULL;
	wire [31:0] TX_DATA_IN;
	wire [31:0] TX_DATA_OUT;
	wire TX_WRITE_ENA;

	wire RX_RD_EN;
	wire RX_F_EMPTY;
	wire RX_F_FULL;
	wire [31:0] RX_DATA_IN;
	wire [31:0] RX_DATA_OUT;
	wire RX_WRITE_ENA;


	wire [13:0] REGISTER_CONFIG;
	wire [13:0] TIMEOUT_CONFIG;


	wire error;


	wire tx_empty;
	wire rx_empty;

	//wire w_pwrite;
	wire w_full;
	//wire w_full_tx;

	//assign w_pwrite = (PWRITE == 1'b0)?1'b1:1'b0;
		
	

	//CONECTIONS WITH FIFO TX
	fifo DUT_FIFO_TX (
				.clock(PCLK),
				.reset(RESET_N),
				.wr_en(TX_WRITE_ENA), 
				.rd_en(TX_RD_EN),
				.data_in(TX_DATA_IN),
				.f_full(w_full), 
				.f_empty(TX_F_EMPTY),
				.data_out(TX_DATA_OUT)
		         );


	//and(w_full_tx,w_pwrite,w_full);

	assign TX_F_FULL = w_full;

	//CONECTIONS WITH FIFO RX
	fifo DUT_FIFO_RX (
				.clock(PCLK),
				.reset(RESET_N),
				.wr_en(RX_WRITE_ENA), 
				.rd_en(RX_RD_EN),
				.data_in(RX_DATA_IN),
				.f_full(RX_F_FULL), 
				.f_empty(RX_F_EMPTY),
				.data_out(RX_DATA_OUT)
		         );

	//CONECTIONS WITH APB AND ALL BLOCKS WHERE IS TWO FIFOS AND I2C CORE
	apb DUT_APB (

			.PCLK(PCLK),
			.PRESETn(PRESETn),
                        .PADDR(PADDR),
			.PRDATA(PRDATA),
			.PWDATA(PWDATA),
			.PWRITE(PWRITE),
			.PSELx(PSELx),
			.PENABLE(PENABLE),
			.PREADY(PREADY),
			.PSLVERR(PSLVERR),
			.READ_DATA_ON_RX(RX_DATA_OUT),
			.INTERNAL_I2C_REGISTER_CONFIG(REGISTER_CONFIG),
			.INTERNAL_I2C_REGISTER_TIMEOUT(TIMEOUT_CONFIG),
			.INT_RX(INT_RX),
			.WR_ENA(TX_WRITE_ENA),
			.WRITE_DATA_ON_TX(TX_DATA_IN),
			.RD_ENA(RX_RD_EN),
			.INT_TX(INT_TX),
			.TX_EMPTY(tx_empty),
			.RX_EMPTY(rx_empty),
			.ERROR(error)

		     );

	//I2C CORE BLOCK WITH ALL ANOTHER BLOCKS
	module_i2c DUT_I2C_INTERNAL_RX_TX (
				  	.PCLK(PCLK),
					.PRESETn(PRESETn),
					.fifo_rx_wr_en(RX_WRITE_ENA),
					.fifo_rx_f_empty(RX_F_EMPTY),
					.fifo_rx_data_in(RX_DATA_IN),
					.fifo_rx_f_full(RX_F_FULL),
					.fifo_tx_f_full(TX_F_FULL),
					.fifo_tx_f_empty(TX_F_EMPTY),
					.fifo_tx_rd_en(TX_RD_EN),
					.fifo_tx_data_out(TX_DATA_OUT),
					.DATA_CONFIG_REG(REGISTER_CONFIG),
					.TIMEOUT_TX(TIMEOUT_CONFIG),
					.RX_EMPTY(rx_empty),
					.TX_EMPTY(tx_empty),					
					.ERROR(error),
					.ENABLE_SDA(SDA_ENABLE),
					.ENABLE_SCL(SCL_ENABLE),
					.SDA(SDA),
					.SCL(SCL)
				    );

endmodule
//////////////////////////////////////////////////////////////////
////
////
//// 	TOP I2C BLOCK to I2C Core
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
//// apbi2c_spec IP core specification document.
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
////		  Ronal Dario Celaya ,rcelaya.dario@gmail.com
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


`timescale 1ns/1ps //timescale 

module module_i2c#(
			//THIS IS USED ONLY LIKE PARAMETER TO BEM CONFIGURABLE
			parameter integer DWIDTH = 32,
			parameter integer AWIDTH = 14
		)
		(
		//I2C INTERFACE WITH ANOTHER BLOCKS
		 input PCLK,
		 input PRESETn,
		 
		//INTERFACE WITH FIFO TRANSMISSION
		 input fifo_tx_f_full,
		 input fifo_tx_f_empty,
		 input [DWIDTH-1:0] fifo_tx_data_out,

		//INTERFACE WITH FIFO RECEIVER
		 input fifo_rx_f_full,
		 input fifo_rx_f_empty,
		 output reg fifo_rx_wr_en,
		 output reg [DWIDTH-1:0] fifo_rx_data_in, 

		//INTERFACE WITH REGISTER CONFIGURATION
		 input [AWIDTH-1:0] DATA_CONFIG_REG,
 		 input [AWIDTH-1:0] TIMEOUT_TX,
		
		//INTERFACE TO APB AND READ FOR FIFO   
		 output reg fifo_tx_rd_en,
		 output   TX_EMPTY,
		 output   RX_EMPTY,
		 output ERROR,
		 output ENABLE_SDA,
		 output ENABLE_SCL,

		//I2C BI DIRETIONAL PORTS
		inout SDA,
		inout SCL
		 

		 );

//THIS IS USED TO GENERATE INTERRUPTIONS
assign TX_EMPTY = (fifo_tx_f_empty == 1'b1)? 1'b1:1'b0;
assign RX_EMPTY = (fifo_rx_f_empty == 1'b1)? 1'b1:1'b0;

	//THIS COUNT IS USED TO CONTROL DATA ACCROSS FSM	
	reg [1:0] count_tx;
	reg [1:0] count_rx;
	//CONTROL CLOCK AND COUNTER
	reg [11:0] count_send_data;
	reg [11:0] count_receive_data;
	reg [11:0] count_timeout;
	reg BR_CLK_O;
	reg SDA_OUT;

	reg BR_CLK_O_RX;
	reg SDA_OUT_RX;

	//RESPONSE USED TO HOLD SIGNAL TO ACK OR NACK
	reg RESPONSE;

//    PARAMETERS USED TO STATE MACHINE

localparam [5:0] IDLE = 6'd0, //IDLE

	   START = 6'd1,//START BIT

	     CONTROLIN_1 = 6'd2, //START BYTE
	     CONTROLIN_2 = 6'd3,
	     CONTROLIN_3 = 6'd4,
             CONTROLIN_4 = 6'd5,
	     CONTROLIN_5 = 6'd6,
	     CONTROLIN_6 = 6'd7,
             CONTROLIN_7 = 6'd8,
             CONTROLIN_8 = 6'd9, //END FIRST BYTE

	     RESPONSE_CIN =6'd10, //RESPONSE

	     ADDRESS_1 = 6'd11,//START BYTE
	     ADDRESS_2 = 6'd12,
	     ADDRESS_3 = 6'd13,
             ADDRESS_4 = 6'd14,
	     ADDRESS_5 = 6'd15,
	     ADDRESS_6 = 6'd16,
             ADDRESS_7 = 6'd17,
             ADDRESS_8 = 6'd18,//END FIRST BYTE

	     RESPONSE_ADDRESS =6'd19, //RESPONSE

	     DATA0_1 = 6'd20,//START BYTE
	     DATA0_2 = 6'd21,
	     DATA0_3 = 6'd22,
             DATA0_4 = 6'd23,
	     DATA0_5 = 6'd24,
	     DATA0_6 = 6'd25,
             DATA0_7 = 6'd26,
             DATA0_8 = 6'd27,//END FIRST BYTE

	     RESPONSE_DATA0_1 = 6'd28,  //RESPONSE
	   
	     DATA1_1 = 6'd29,//START BYTE
	     DATA1_2 = 6'd30,
	     DATA1_3 = 6'd31,
             DATA1_4 = 6'd32,
	     DATA1_5 = 6'd33,
	     DATA1_6 = 6'd34,
             DATA1_7 = 6'd35,
             DATA1_8 = 6'd36,//END FIRST BYTE

	     RESPONSE_DATA1_1 = 6'd37,//RESPONSE

	     DELAY_BYTES = 6'd38,//USED ONLY IN ACK TO DELAY BETWEEN
	     NACK = 6'd39,//USED ONLY IN ACK TO DELAY BETWEEN BYTES
	     STOP = 6'd40;//USED TO SEND STOP BIT

	//STATE CONTROL 
	reg [5:0] state_tx;
	reg [5:0] next_state_tx;

//ASSIGN REGISTERS TO BIDIRETIONAL PORTS
assign SDA =(DATA_CONFIG_REG[0] == 1'b1 & DATA_CONFIG_REG[1] == 1'b0 & state_tx != RESPONSE_CIN & state_tx != RESPONSE_ADDRESS & state_tx != RESPONSE_DATA0_1 & state_tx != RESPONSE_DATA1_1)?SDA_OUT:SDA_OUT_RX;


assign SCL = (DATA_CONFIG_REG[0] == 1'b1 & DATA_CONFIG_REG[1] == 1'b0)?BR_CLK_O:BR_CLK_O_RX;

//STANDARD ERROR
assign ERROR = (DATA_CONFIG_REG[0] == 1'b1 & DATA_CONFIG_REG[1] == 1'b1)?1'b1:1'b0;


//COMBINATIONAL BLOCK TO   
always@(*)
begin

	//THE FUN START HERE :-)
	//COMBINATIONAL UPDATE STATE BE CAREFUL WITH WHAT YOU MAKE HERE
	next_state_tx=state_tx;

	case(state_tx)//state_   IS MORE SECURE CHANGE ONLY IF YOU KNOW WHAT ARE YOU DOING 
	IDLE:
	begin
		//OBEYING SPEC
		if(DATA_CONFIG_REG[0] == 1'b0 && (fifo_tx_f_full == 1'b1 || fifo_tx_f_empty == 1'b0) && DATA_CONFIG_REG[1] == 1'b0)
		begin
			next_state_tx   = IDLE;
		end
		else if(DATA_CONFIG_REG[0] == 1'b1 && (fifo_tx_f_full == 1'b1 || fifo_tx_f_empty == 1'b0) && DATA_CONFIG_REG[1] == 1'b1)
		begin
			next_state_tx   = IDLE;
		end
		else if(DATA_CONFIG_REG[0] == 1'b1 && ((fifo_tx_f_full == 1'b0 && fifo_tx_f_empty == 1'b0) || fifo_tx_f_full == 1'b1) && DATA_CONFIG_REG[1] == 1'b0 && count_timeout < TIMEOUT_TX)
		begin
			next_state_tx   = START;
		end


	end
	START://THIS IS USED TOO ALL STATE MACHINES THE COUNTER_SEND_DATA
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx   = START;
		end
		else
		begin
			next_state_tx   = CONTROLIN_1;
		end
		
	end
	CONTROLIN_1:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  = CONTROLIN_1;
		end
		else
		begin
			next_state_tx  =  CONTROLIN_2;
		end

	end
	CONTROLIN_2:
	begin

		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx   = CONTROLIN_2;
		end
		else
		begin
			next_state_tx   = CONTROLIN_3;
		end

	end
	CONTROLIN_3:
	begin

		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  =  CONTROLIN_3;
		end
		else
		begin
			next_state_tx   = CONTROLIN_4;
		end		
	end
	CONTROLIN_4:
	begin

		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx   = CONTROLIN_4;
		end
		else
		begin
			next_state_tx   = CONTROLIN_5;
		end		
	end
	CONTROLIN_5:
	begin

		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = CONTROLIN_5;
		end
		else
		begin
			next_state_tx = CONTROLIN_6;
		end		
	end
	CONTROLIN_6:
	begin

		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = CONTROLIN_6;
		end
		else
		begin
			next_state_tx = CONTROLIN_7;
		end		
	end
	CONTROLIN_7:
	begin

		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = CONTROLIN_7;
		end
		else
		begin
			next_state_tx = CONTROLIN_8;
		end		
	end
	CONTROLIN_8:
	begin

		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  = CONTROLIN_8;
		end
		else 
		begin
			next_state_tx  = RESPONSE_CIN;
		end		
	end
	RESPONSE_CIN:
	begin

		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = RESPONSE_CIN;
		end
		else if(RESPONSE == 1'b0)//ACK
		begin 
			next_state_tx = DELAY_BYTES;
		end
		else if(RESPONSE == 1'b1)//NACK
		begin
			next_state_tx = NACK;
		end	
		
	end

	//NOW SENDING ADDRESS
	ADDRESS_1:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  = ADDRESS_1;
		end
		else
		begin
			next_state_tx  =  ADDRESS_2;
		end	
	end
	ADDRESS_2:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = ADDRESS_2;
		end
		else
		begin
			next_state_tx = ADDRESS_3;
		end	
	end
	ADDRESS_3:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = ADDRESS_3;
		end
		else
		begin
			next_state_tx = ADDRESS_4;
		end	
	end
	ADDRESS_4:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = ADDRESS_4;
		end
		else
		begin
			next_state_tx = ADDRESS_5;
		end	
	end
	ADDRESS_5:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = ADDRESS_5;
		end
		else
		begin
			next_state_tx = ADDRESS_6;
		end	
	end
	ADDRESS_6:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = ADDRESS_6;
		end
		else
		begin
			next_state_tx = ADDRESS_7;
		end	
	end
	ADDRESS_7:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = ADDRESS_7;
		end
		else
		begin
			next_state_tx = ADDRESS_8;
		end	
	end
	ADDRESS_8:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = ADDRESS_8;
		end
		else
		begin
			next_state_tx = RESPONSE_ADDRESS;
		end	
	end
	RESPONSE_ADDRESS:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = RESPONSE_ADDRESS;
		end
		else if(RESPONSE == 1'b0)//ACK
		begin 
			next_state_tx = DELAY_BYTES;
		end
		else if(RESPONSE == 1'b1)//NACK --> RESTART CONDITION AND BACK TO START BYTE AGAIN
		begin
			next_state_tx = NACK;
		end	
	end
	
	//data in
	DATA0_1:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = DATA0_1;
		end
		else
		begin
			next_state_tx = DATA0_2;
		end
	end
	DATA0_2:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = DATA0_2;
		end
		else
		begin
			next_state_tx = DATA0_3;
		end
	end
	DATA0_3:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = DATA0_3;
		end
		else
		begin
			next_state_tx = DATA0_4;
		end
	end
	DATA0_4:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = DATA0_4;
		end
		else
		begin
			next_state_tx = DATA0_5;
		end
	end
	DATA0_5:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = DATA0_5;
		end
		else
		begin
			next_state_tx   = DATA0_6;
		end
	end
	DATA0_6:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  = DATA0_6;
		end
		else
		begin
			next_state_tx  = DATA0_7;
		end
	end
	DATA0_7:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  = DATA0_7;
		end
		else
		begin
			next_state_tx  = DATA0_8;
		end
	end
	DATA0_8:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  = DATA0_8;
		end
		else
		begin
			next_state_tx  =  RESPONSE_DATA0_1;
		end
	end
	RESPONSE_DATA0_1:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  =  RESPONSE_DATA0_1;
		end
		else if(RESPONSE == 1'b0)//ACK
		begin 
			next_state_tx  =   DELAY_BYTES;
		end
		else if(RESPONSE == 1'b1)//NACK
		begin
			next_state_tx  =   NACK;
		end	
	end

	//second byte
	DATA1_1:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  = DATA1_1;
		end
		else
		begin
			next_state_tx  = DATA1_2;
		end
	end
	DATA1_2:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = DATA1_2;
		end
		else
		begin
			next_state_tx = DATA1_3;
		end
	end
	DATA1_3:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  = DATA1_3;
		end
		else
		begin
			next_state_tx  =  DATA1_4;
		end
	end
	DATA1_4:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  = DATA1_4;
		end
		else
		begin
			next_state_tx  = DATA1_5;
		end
	end
	DATA1_5:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = DATA1_5;
		end
		else
		begin
			next_state_tx = DATA1_6;
		end
	end
	DATA1_6:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx  =  DATA1_6;
		end
		else
		begin
			next_state_tx  =  DATA1_7;
		end
	end
	DATA1_7:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx =  DATA1_7;
		end
		else
		begin
			next_state_tx =  DATA1_8;
		end
	end
	DATA1_8:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = DATA1_8;
		end
		else
		begin
			next_state_tx = RESPONSE_DATA1_1;
		end
	end
	RESPONSE_DATA1_1:
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx   =  RESPONSE_DATA1_1;
		end
		else if(RESPONSE == 1'b0)//ACK
		begin 
			next_state_tx   =  DELAY_BYTES;
		end
		else if(RESPONSE == 1'b1)//NACK
		begin
			next_state_tx   =  NACK;
		end	
	end
	DELAY_BYTES://THIS FORM WORKS 
	begin

		
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx =  DELAY_BYTES;
		end
		else
		begin

			if(count_tx == 2'd0)
			begin
				next_state_tx = ADDRESS_1;
			end
			else if(count_tx   == 2'd1)
			begin
				next_state_tx = DATA0_1;
			end
			else if(count_tx   == 2'd2)
			begin
				next_state_tx = DATA1_1;
			end
			else if(count_tx   == 2'd3)
			begin
				next_state_tx = STOP;
			end
			
		end

	end
	NACK://NOT TESTED YET !!!!
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2]*2'd2)
		begin
			next_state_tx  = NACK;
		end
		else
		begin
			if(count_tx == 2'd0)
			begin
				next_state_tx = CONTROLIN_1;
			end
			else if(count_tx == 2'd1)
			begin
				next_state_tx = ADDRESS_1;
			end
			else if(count_tx  == 2'd2)
			begin
				next_state_tx   = DATA0_1;
			end
			else if(count_tx == 2'd3)
			begin
				next_state_tx = DATA1_1;
			end
		end
	end
	STOP://THIS WORK
	begin
		if(count_send_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_tx = STOP;
		end
		else
		begin
			next_state_tx = IDLE;
		end
	end
	default:
	begin
		next_state_tx =  IDLE;
	end
	endcase


end



//SEQUENTIAL   
always@(posedge PCLK)
begin

	//RESET SYNC
	if(!PRESETn)
	begin
		//SIGNALS MUST BE RESETED
		count_send_data <= 12'd0;
		state_tx   <= IDLE;	
		SDA_OUT<= 1'b1;
		fifo_tx_rd_en <= 1'b0;
		count_tx   <= 2'd0;
		BR_CLK_O <= 1'b1;
		RESPONSE<= 1'b0;	
	end
	else
	begin
		
		// SEQUENTIAL FUN START
		state_tx  <= next_state_tx;

		case(state_tx)
		IDLE:
		begin

			fifo_tx_rd_en <= 1'b0;
			
 
			if(DATA_CONFIG_REG[0] == 1'b0 && (fifo_tx_f_full == 1'b1 ||fifo_tx_f_empty == 1'b0) && DATA_CONFIG_REG[1] == 1'b0)
			begin
				count_send_data <= 12'd0;
				SDA_OUT<= 1'b1;
				BR_CLK_O <= 1'b1;
			end
			else if(DATA_CONFIG_REG[0] == 1'b1 && ((fifo_tx_f_empty == 1'b0 && fifo_tx_f_full == 1'b0 )|| fifo_tx_f_full == 1'b1 ) && DATA_CONFIG_REG[1] == 1'b0)
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=1'b0;			
			end
			else if(DATA_CONFIG_REG[0] == 1'b1 && (fifo_tx_f_full == 1'b1 ||fifo_tx_f_empty == 1'b0) && DATA_CONFIG_REG[1] == 1'b1)
			begin
				count_send_data <= 12'd0;
				SDA_OUT<= 1'b1;
				BR_CLK_O <= 1'b1;
			end			

		end
		START:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				BR_CLK_O <= 1'b0;
			end
			else
			begin
				count_send_data <= 12'd0;					
			end	

			if(count_send_data == DATA_CONFIG_REG[13:2]- 12'd1)
			begin
				SDA_OUT<=fifo_tx_data_out[0:0];
				count_tx   <= 2'd0;
			end

		end
		CONTROLIN_1:
		begin

			

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[0:0];	

								
				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end			
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[1:1];
			end

				
		end
		
		CONTROLIN_2:
		begin

			

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[1:1];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[2:2];
			end
				
		end

		CONTROLIN_3:
		begin

			

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[2:2];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[3:3];
			end	


				
		end
		CONTROLIN_4:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[3:3];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end				
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[4:4];
			end
				
		end

		CONTROLIN_5:
		begin

			

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[4:4];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end			
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[5:5];
			end	

		end
		CONTROLIN_6:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[5:5];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end	
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[6:6];
			end	

				
		end

		CONTROLIN_7:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[6:6];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end	
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[7:7];
			end	

				
		end
		CONTROLIN_8:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[7:7];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<= 1'b0;
			end

				
		end
		RESPONSE_CIN:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;

				//LETS TRY USE THIS BUT I DONT THINK IF WORKS  
				RESPONSE<= SDA;

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
			end	


		end
		ADDRESS_1:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[8:8];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[9:9];
			end	
				
		end		
		ADDRESS_2:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[9:9];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[10:10];
			end	

		end
		ADDRESS_3:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[10:10];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end			
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[11:11];
			end	

		end
		ADDRESS_4:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[11:11];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end			
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[12:12];
			end	
		end
		ADDRESS_5:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[12:12];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end				
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[13:13];
			end	

				
		end
		ADDRESS_6:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[13:13];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;		
				SDA_OUT<=fifo_tx_data_out[14:14];
			end	
				
		end
		ADDRESS_7:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[14:14];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[15:15];
			end	

				
		end
		ADDRESS_8:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[15:15];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=1'b0;
			end	
				
		end
		RESPONSE_ADDRESS:
		begin
			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;

				//LETS TRY USE THIS BUT I DONT THINK IF WORKS  
				RESPONSE<= SDA;

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
			end

		end
		DATA0_1:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[16:16];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;				
				SDA_OUT<=fifo_tx_data_out[17:17];
			end	

				
		end
		DATA0_2:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[17:17];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[18:18];
			end	

				
		end		
		DATA0_3:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[18:18];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[19:19];
			end	
				
		end
		DATA0_4:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[19:19];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[20:20];
			end	
				
		end
		DATA0_5:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[20:20];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end			
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[21:21];
			end

		end
		DATA0_6:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[21:21];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end			
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[22:22];
			end
				
		end
		DATA0_7:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[22:22];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[23:23];
			end	
				
		end
		DATA0_8:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[23:23];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		

			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=1'b0;
			end	
				
		end
		RESPONSE_DATA0_1:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;

				//LETS TRY USE THIS BUT I DONT THINK IF WORKS  
				RESPONSE<= SDA;

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end				
			end
			else
			begin
				count_send_data <= 12'd0;
			end

		end
		DATA1_1:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[24:24];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end				
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[25:25];

			end

				
		end
		DATA1_2:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[25:25];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end	
			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[26:26];
			end	

		end
		DATA1_3:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[26:26];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end			

			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[27:27];
			end	
				
		end
		DATA1_4:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[27:27];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end			

			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[28:28];
			end	
				
		end
		DATA1_5:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[28:28];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		

			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[29:29];
			end	
				
		end
		DATA1_6:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[29:29];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		

			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[30:30];
			end	
				
		end
		DATA1_7:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[30:30];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		

			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=fifo_tx_data_out[31:31];
			end	

				
		end
		DATA1_8:
		begin

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;
				SDA_OUT<=fifo_tx_data_out[31:31];

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		

			end
			else
			begin
				count_send_data <= 12'd0;
				SDA_OUT<=1'b0;
			end	
				
		end
		RESPONSE_DATA1_1:
		begin
			//fifo_  _rd_en <= 1'b1;

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;

				//LETS TRY USE THIS BUT I DONT THINK IF WORKS  
				RESPONSE<= SDA;

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd4)
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data >= DATA_CONFIG_REG[13:2]/12'd4 && count_send_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					BR_CLK_O <= 1'b1;
				end
				else
				begin
					BR_CLK_O <= 1'b0;
				end		
			end
			else
			begin
				count_send_data <= 12'd0;
				fifo_tx_rd_en <= 1'b1;
			end	

		end
		DELAY_BYTES:
		begin
			
			fifo_tx_rd_en <= 1'b0;
		
			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				
				count_send_data <= count_send_data + 12'd1;	
				BR_CLK_O <= 1'b0;
				SDA_OUT<=1'b0;		
			end
			else
			begin


				if(count_tx == 2'd0)
				begin
					count_tx <= count_tx + 2'd1;
					SDA_OUT<=fifo_tx_data_out[8:8];
				end
				else if(count_tx   == 2'd1)
				begin
					count_tx <= count_tx + 2'd1;
					SDA_OUT<=fifo_tx_data_out[16:16];
				end
				else if(count_tx == 2'd2)
				begin
					count_tx <= count_tx + 2'd1;
					SDA_OUT<=fifo_tx_data_out[24:24];
				end
				else if(count_tx == 2'd3)
				begin
					count_tx <= 2'd0;
				end

				count_send_data <= 12'd0;
			
			end

		end
		//THIS BLOCK MUST BE CHECKED WITH CARE
		NACK:// MORE A RESTART 
		begin
			fifo_tx_rd_en <= 1'b0;
		
			if(count_send_data < DATA_CONFIG_REG[13:2]*2'd3)
			begin		
				count_send_data <= count_send_data + 12'd1;
	
				if(count_receive_data < DATA_CONFIG_REG[13:2]/12'd2)
				begin
					SDA_OUT<=1'b0;
				end
				else if(count_send_data > DATA_CONFIG_REG[13:2]/12'd2-12'd1 && count_send_data < DATA_CONFIG_REG[13:2])
				begin
					SDA_OUT<=1'b1;
				end
				else if(count_send_data  == DATA_CONFIG_REG[13:2]*2'd2)
				begin
					SDA_OUT<=1'b0;
				end

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd2)
				begin
					BR_CLK_O <= 1'b1;
				end
				else if(count_send_data > DATA_CONFIG_REG[13:2]/12'd2-12'd1 && count_send_data < DATA_CONFIG_REG[13:2])
				begin
					BR_CLK_O <= 1'b0;
				end
				else if(count_send_data < DATA_CONFIG_REG[13:2]*2'd2)
				begin
					BR_CLK_O <= 1'b1;
				end
		
			end
			else
			begin
				count_send_data <= 12'd0;

				if(count_tx == 2'd0)
				begin
					count_tx <= 2'd0;
					SDA_OUT<=fifo_tx_data_out[0:0];
				end
				else if(count_tx == 2'd1)
				begin
					count_tx <= 2'd1;
					SDA_OUT<=fifo_tx_data_out[8:8];
				end
				else if(count_tx == 2'd2)
				begin
					count_tx <= 2'd2;
					SDA_OUT<=fifo_tx_data_out[16:16];
				end
				else if(count_tx == 2'd3)
				begin
					count_tx <= 2'd3;
					SDA_OUT<=fifo_tx_data_out[24:24];
				end

			
			end
		end
		STOP:
		begin

			BR_CLK_O <= 1'b1;

			if(count_send_data < DATA_CONFIG_REG[13:2])
			begin
				count_send_data <= count_send_data + 12'd1;

				if(count_send_data < DATA_CONFIG_REG[13:2]/12'd2-12'd2)
				begin
					SDA_OUT<=1'b0;
				end
				else if(count_send_data > DATA_CONFIG_REG[13:2]/12'd2-12'd1 && count_send_data < DATA_CONFIG_REG[13:2])
				begin
					SDA_OUT<=1'b1;
				end	
			end
			else
			begin
				count_send_data <= 12'd0;
			end
		end
		default:
		begin
			fifo_tx_rd_en <= 1'b0;
			count_send_data <= 12'd4095;
		end
		endcase
		
	end


end 


	//STATE CONTROL 
	reg [5:0] state_rx;
	reg [5:0] next_state_rx;

assign ENABLE_SDA = (state_rx ==  RESPONSE_CIN|| 
		     state_rx ==  RESPONSE_ADDRESS|| 
		     state_rx == RESPONSE_DATA0_1|| 
		     state_rx == RESPONSE_DATA1_1)?1'b1:
		    (state_tx ==  RESPONSE_CIN|| 
		     state_tx ==  RESPONSE_ADDRESS|| 
		     state_tx == RESPONSE_DATA0_1|| 
		     state_tx == RESPONSE_DATA1_1)?1'b0:1'b1;


assign ENABLE_SCL = (state_rx ==  RESPONSE_CIN|| 
		     state_rx ==  RESPONSE_ADDRESS|| 
		     state_rx == RESPONSE_DATA0_1|| 
		     state_rx == RESPONSE_DATA1_1)?1'b1:
		    (state_tx ==  RESPONSE_CIN|| 
		     state_tx ==  RESPONSE_ADDRESS|| 
		     state_tx == RESPONSE_DATA0_1|| 
		     state_tx == RESPONSE_DATA1_1)?1'b1:1'b0;


//COMBINATIONAL BLOCK TO RX
always@(*)
begin

	//THE FUN START HERE :-)
	//COMBINATIONAL UPDATE STATE BE CAREFUL WITH WHAT YOU MAKE HERE
	next_state_rx = state_rx;

	case(state_rx)//state_rx IS MORE SECURE CHANGE ONLY IF YOU KNOW WHAT ARE YOU DOING 
	IDLE:
	begin
		//OBEYING SPEC
		if(DATA_CONFIG_REG[0] == 1'b0 && DATA_CONFIG_REG[1] == 1'b0)
		begin
			next_state_rx =   IDLE;
		end
		else if(DATA_CONFIG_REG[0] == 1'b1 && DATA_CONFIG_REG[1] == 1'b1)
		begin
			next_state_rx =   IDLE;
		end
		else if(DATA_CONFIG_REG[0] == 1'b0 && DATA_CONFIG_REG[1] == 1'b1 && SDA_OUT_RX == 1'b0 && BR_CLK_O_RX == 1'b0)
		begin
			next_state_rx =   START;
		end


	end
	START://THIS IS USED TOO ALL STATE MACHINES THE COUNTER_SEND_DATA
	begin

		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   START;
		end
		else if(fifo_rx_data_in[0] == 1'b0 && fifo_rx_data_in[1] == 1'b0)
		begin
			next_state_rx =   CONTROLIN_1;
		end
		else 
		begin
			next_state_rx =   IDLE;
		end
		
	end
	  CONTROLIN_1:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   CONTROLIN_1;
		end
		else
		begin
			next_state_rx =   CONTROLIN_2;
		end

	end
	  CONTROLIN_2:
	begin

		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   CONTROLIN_2;
		end
		else
		begin
			next_state_rx =   CONTROLIN_3;
		end

	end
	  CONTROLIN_3:
	begin

		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   CONTROLIN_3;
		end
		else
		begin
			next_state_rx =   CONTROLIN_4;
		end		
	end
	  CONTROLIN_4:
	begin

		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   CONTROLIN_4;
		end
		else
		begin
			next_state_rx =   CONTROLIN_5;
		end		
	end
	  CONTROLIN_5:
	begin

		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   CONTROLIN_5;
		end
		else
		begin
			next_state_rx =   CONTROLIN_6;
		end		
	end
	  CONTROLIN_6:
	begin

		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   CONTROLIN_6;
		end
		else
		begin
			next_state_rx =   CONTROLIN_7;
		end		
	end
	  CONTROLIN_7:
	begin

		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   CONTROLIN_7;
		end
		else
		begin
			next_state_rx =   CONTROLIN_8;
		end		
	end
	  CONTROLIN_8:
	begin

		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   CONTROLIN_8;
		end
		else 
		begin
			next_state_rx =   RESPONSE_CIN;
		end		
	end
	RESPONSE_CIN:
	begin

		if(count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   RESPONSE_CIN;
		end
		else if(RESPONSE == 1'b0)//ACK
		begin 
			next_state_rx  =   DELAY_BYTES;
		end
		else if(RESPONSE == 1'b1)//NACK
		begin
			next_state_rx  =   NACK;
		end
		
	end
	//NOW SENDING ADDRESS
	ADDRESS_1:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   ADDRESS_1;
		end
		else
		begin
			next_state_rx =   ADDRESS_2;
		end	
	end
	ADDRESS_2:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   ADDRESS_2;
		end
		else
		begin
			next_state_rx =   ADDRESS_3;
		end	
	end
	ADDRESS_3:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   ADDRESS_3;
		end
		else
		begin
			next_state_rx =   ADDRESS_4;
		end	
	end
	ADDRESS_4:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   ADDRESS_4;
		end
		else
		begin
			next_state_rx =   ADDRESS_5;
		end	
	end
	ADDRESS_5:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   ADDRESS_5;
		end
		else
		begin
			next_state_rx =   ADDRESS_6;
		end	
	end
	ADDRESS_6:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   ADDRESS_6;
		end
		else
		begin
			next_state_rx =   ADDRESS_7;
		end	
	end
	ADDRESS_7:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   ADDRESS_7;
		end
		else
		begin
			next_state_rx =   ADDRESS_8;
		end	
	end
	ADDRESS_8:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   ADDRESS_8;
		end
		else
		begin
			next_state_rx =   RESPONSE_ADDRESS;
		end	
	end
	RESPONSE_ADDRESS:
	begin
		if(count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   RESPONSE_ADDRESS;
		end
		else if(RESPONSE == 1'b0)//ACK
		begin 
			next_state_rx  =   DELAY_BYTES;
		end
		else if(RESPONSE == 1'b1)//NACK
		begin
			next_state_rx  =   NACK;
		end
	end
	//data in
	DATA0_1:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA0_1;
		end
		else
		begin
			next_state_rx =   DATA0_2;
		end
	end
	  DATA0_2:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA0_2;
		end
		else
		begin
			next_state_rx =   DATA0_3;
		end
	end
	  DATA0_3:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA0_3;
		end
		else
		begin
			next_state_rx =   DATA0_4;
		end
	end
	  DATA0_4:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA0_4;
		end
		else
		begin
			next_state_rx =   DATA0_5;
		end
	end
	  DATA0_5:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA0_5;
		end
		else
		begin
			next_state_rx =   DATA0_6;
		end
	end
	  DATA0_6:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA0_6;
		end
		else
		begin
			next_state_rx =   DATA0_7;
		end
	end
	  DATA0_7:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA0_7;
		end
		else
		begin
			next_state_rx =   DATA0_8;
		end
	end
	  DATA0_8:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA0_8;
		end
		else
		begin
			next_state_rx =   RESPONSE_DATA0_1;
		end
	end
	RESPONSE_DATA0_1:
	begin

		if(count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   RESPONSE_DATA0_1;
		end
		else if(RESPONSE == 1'b0)//ACK
		begin 
			next_state_rx  =   DELAY_BYTES;
		end
		else if(RESPONSE == 1'b1)//NACK
		begin
			next_state_rx  =   NACK;
		end	
	end
	//second byte
	DATA1_1:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA1_1;
		end
		else
		begin
			next_state_rx =   DATA1_2;
		end
	end
	DATA1_2:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA1_2;
		end
		else
		begin
			next_state_rx =   DATA1_3;
		end
	end
	DATA1_3:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA1_3;
		end
		else
		begin
			next_state_rx =   DATA1_4;
		end
	end
	  DATA1_4:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA1_4;
		end
		else
		begin
			next_state_rx =   DATA1_5;
		end
	end
	  DATA1_5:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA1_5;
		end
		else
		begin
			next_state_rx =   DATA1_6;
		end
	end
	  DATA1_6:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA1_6;
		end
		else
		begin
			next_state_rx =   DATA1_7;
		end
	end
	  DATA1_7:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA1_7;
		end
		else
		begin
			next_state_rx =   DATA1_8;
		end
	end
	  DATA1_8:
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DATA1_8;
		end
		else
		begin
			next_state_rx =   RESPONSE_DATA1_1;
		end
	end
	RESPONSE_DATA1_1:
	begin
		if(count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   RESPONSE_DATA0_1;
		end
		else if(RESPONSE == 1'b0)//ACK
		begin 
			next_state_rx  =   DELAY_BYTES;
		end
		else if(RESPONSE == 1'b1)//NACK
		begin
			next_state_rx  =   NACK;
		end	
	
	end
	DELAY_BYTES://THIS FORM WORKS 
	begin

		
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   DELAY_BYTES;
		end
		else
		begin

			if(count_rx == 2'd0)
			begin
				next_state_rx =   ADDRESS_1;
			end
			else if(count_rx == 2'd1)
			begin
				next_state_rx =   DATA0_1;
			end
			else if(count_rx == 2'd2)
			begin
				next_state_rx =   DATA1_1;
			end
			else if(count_rx == 2'd3)
			begin
				next_state_rx =   STOP;
			end
			
		end

	end
	  STOP://THIS WORK
	begin
		if(  count_receive_data != DATA_CONFIG_REG[13:2])
		begin
			next_state_rx =   STOP;
		end
		else
		begin
			next_state_rx =   IDLE;
		end
	end
	default:
	begin
			next_state_rx =   IDLE;
	end
	endcase


end



//SEQUENTIAL   
always@(posedge PCLK)
begin

	//RESET SYNC
	if(!PRESETn)
	begin
		//SIGNALS MUST BE RESETED
		  count_receive_data <= 12'd0;
		state_rx <=   IDLE;	
		SDA_OUT_RX<= 1'b0;
		fifo_rx_wr_en <= 1'b0;
		count_rx <= 2'd0;
		BR_CLK_O_RX <= 1'b0;	
	end
	else 
	begin
		
		// SEQUENTIAL FUN START
		state_rx <= next_state_rx;

		case(state_rx)
		  IDLE:
		begin



			if(((fifo_rx_f_full == 1'b0 && fifo_rx_f_empty == 1'b0) || (fifo_rx_f_full == 1'b0 && fifo_rx_f_empty == 1'b1)) && DATA_CONFIG_REG[1] == 1'b1)
			begin

				  SDA_OUT_RX<= SDA;
				  BR_CLK_O_RX<=SCL;
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  SDA_OUT_RX<= SDA_OUT_RX;
				  BR_CLK_O_RX<=BR_CLK_O_RX;
				  count_receive_data <=   count_receive_data;		
			end
	
		end
		  START:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(  count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[0]<= SDA;
				fifo_rx_data_in[1]<= SCL;			
			end

		end
		  CONTROLIN_1:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[0]<= SDA;			
			end

		end		
		  CONTROLIN_2:
		begin
	
			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[1]<= SDA;			
			end
				
		end
		  CONTROLIN_3:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end


			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[2]<= SDA;			
			end

		
		end
		  CONTROLIN_4:
		begin
	
			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[3]<= SDA;			
			end
				
		end
		  CONTROLIN_5:
		begin

			
			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
					fifo_rx_data_in[4]<= SDA;			
			end
		

		end
		  CONTROLIN_6:
		begin
				if(  count_receive_data < DATA_CONFIG_REG[13:2])
				begin
					  count_receive_data <=   count_receive_data + 12'd1;
				end
				else
				begin
					  count_receive_data <= 12'd0;
				end

				if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
				begin
					fifo_rx_data_in[5]<= SDA;			
				end		
		end

		  CONTROLIN_7:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[6]<= SDA;			
			end
		end
		  CONTROLIN_8:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[7]<= SDA;			
			end
	

				
		end
		  RESPONSE_CIN:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

		end
		  ADDRESS_1:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[8]<= SDA;			
			end
	
				
		end		
		  ADDRESS_2:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[9]<= SDA;			
			end
	

		end
		  ADDRESS_3:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[10]<= SDA;			
			end
	
	

		end
		  ADDRESS_4:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[11]<= SDA;			
			end
	
		end
		  ADDRESS_5:
		begin


				
			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[12]<= SDA;			
			end

					
		end
		  ADDRESS_6:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[13]<= SDA;			
			end
	
		end
		  ADDRESS_7:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[14]<= SDA;			
			end
				
		end
		  ADDRESS_8:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[15]<= SDA;			
			end

				
		end
		  RESPONSE_ADDRESS:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end


		end
		  DATA0_1:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[16]<= SDA;			
			end
	

				
		end
		  DATA0_2:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[17]<= SDA;			
			end
	
				
		end		
		  DATA0_3:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[18]<= SDA;			
			end
				
		end
		  DATA0_4:
		begin



			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[19]<= SDA;			
			end
	
		end
		  DATA0_5:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[20]<= SDA;			
			end


		end
		  DATA0_6:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[21]<= SDA;			
			end
	
		end
		  DATA0_7:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[22]<= SDA;			
			end
				
		end
		  DATA0_8:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[23]<= SDA;			
			end
		
		end
		  RESPONSE_DATA0_1:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

		end
		  DATA1_1:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[24]<= SDA;			
			end
				
		end
		  DATA1_2:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[25]<= SDA;			
			end


		end
		  DATA1_3:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[26]<= SDA;			
			end

				
		end
		  DATA1_4:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[27]<= SDA;			
			end
	
				
		end
		  DATA1_5:
		begin



			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[28]<= SDA;			
			end
	
				
		end
		  DATA1_6:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[29]<= SDA;			
			end


				
		end
		  DATA1_7:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[30]<= SDA;			
			end


				
		end
		  DATA1_8:
		begin


			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end

			if(SCL == 1'b1 &&   count_receive_data >= DATA_CONFIG_REG[13:2]/12'd4 &&   count_receive_data < (DATA_CONFIG_REG[13:2]-(DATA_CONFIG_REG[13:2]/12'd4))-12'd1)
			begin
				fifo_rx_data_in[31]<= SDA;			
			end
				
		end
		RESPONSE_DATA1_1:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end
			//fifo_  _rd_en <= 1'b1;

		end
		DELAY_BYTES:
		begin

			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin


				if(count_rx == 2'd0)
				begin
					count_rx <= count_rx + 2'd1;
					//SDA_OUT<=fifo_tx_data_out[8:8];
				end
				else if(count_rx   == 2'd1)
				begin
					count_rx <= count_tx + 2'd1;
					//SDA_OUT<=fifo_tx_data_out[16:16];
				end
				else if(count_rx == 2'd2)
				begin
					count_rx <= count_rx + 2'd1;
					//SDA_OUT<=fifo_tx_data_out[24:24];
				end
				else if(count_rx == 2'd3)
				begin
					count_rx <= 2'd0;
				end

				count_receive_data <= 12'd0;
			
			end


		end
		STOP:
		begin
			if(  count_receive_data < DATA_CONFIG_REG[13:2])
			begin
				  count_receive_data <=   count_receive_data + 12'd1;
			end
			else
			begin
				  count_receive_data <= 12'd0;
			end
			fifo_rx_wr_en <= 1'b0;
		end
		default:
		begin
			fifo_rx_wr_en <= 1'b0;
			  count_receive_data <= 12'd4095;
		end
		endcase
		
	end


end 

//USED ONLY TO COUNTER TIME
always@(posedge PCLK)
begin

	//RESET SYNC
	if(!PRESETn)
	begin
		count_timeout <= 12'd0;
	end
	else
	begin
		if(count_timeout <= TIMEOUT_TX && state_tx == IDLE)
		begin
			if(SDA == 1'b0 && SCL == 1'b0)
			count_timeout <= count_timeout + 12'd1;
		end
		else
		begin
			count_timeout <= 12'd0;
		end

	end

end


endmodule

