//////////////////////////////////////////////////////////////////////
////                                                              ////
////  xSPI Interface Module                                       ////
////                                                              ////
////  This file is part of the xspi project                       ////
////  https://opencores.org/projects/xspi                         ////
////                                                              ////
////  Description                                                 ////
////  xspi definitions.                                           ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Dinesh Annayya, dinesha@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////



module xspi_cfg (

            mclk,
            reset_n,

        // Reg Bus Interface Signal
            reg_cs,
            reg_wr,
            reg_addr,
            reg_wdata,
            reg_be,

            // Outputs
            reg_rdata,
            reg_ack,


           // configuration signal
           cfg_tgt_sel        ,
           cfg_op_req         , // SPI operation request
           cfg_op_type        , // SPI operation type
           cfg_transfer_size  , // SPI transfer size
           cfg_sck_period     , // sck clock period
           cfg_sck_cs_period  , // cs setup/hold period
           cfg_cs_byte        , // cs bit information
           cfg_datain         , // data for transfer
           cfg_dataout        , // data for received
           hware_op_done      // operation done

        );



input         mclk;
input         reset_n;

output [1:0]  cfg_tgt_sel        ;

output        cfg_op_req         ; // SPI operation request
output [1:0]  cfg_op_type        ; // SPI operation type
output [1:0]  cfg_transfer_size  ; // SPI transfer size
output [5:0]  cfg_sck_period     ; // sck clock period
output [4:0]  cfg_sck_cs_period  ; // cs setup/hold period
output [7:0]  cfg_cs_byte        ; // cs bit information
output [31:0] cfg_datain         ; // data for transfer
input  [31:0] cfg_dataout        ; // data for received
input         hware_op_done      ; // operation done

//---------------------------------
// Reg Bus Interface Signal
//---------------------------------
input             reg_cs         ;
input             reg_wr         ;
input [3:0]       reg_addr       ;
input [31:0]      reg_wdata      ;
input [3:0]       reg_be         ;

// Outputs
output [31:0]     reg_rdata      ;
output            reg_ack        ;



//-----------------------------------------------------------------------
// Internal Wire Declarations
//-----------------------------------------------------------------------

wire           sw_rd_en;
wire           sw_wr_en;
wire  [3:0]    sw_addr ; // addressing 16 registers
wire  [3:0]    wr_be   ;

reg   [31:0]  reg_rdata      ;
reg           reg_ack     ;

wire [31:0]    reg_0;  // Software_Reg_0
wire [31:0]    reg_1;  // Software-Reg_1
wire [31:0]    reg_2;  // Software-Reg_2
wire [31:0]    reg_3 = 0;  // Software-Reg_3
wire [31:0]    reg_4 = 0;  // Software-Reg_4
wire [31:0]    reg_5 = 0;  // Software-Reg_5
wire [31:0]    reg_6 = 0;  // Software-Reg_6
wire [31:0]    reg_7 = 0;  // Software-Reg_7
wire [31:0]    reg_8 = 0;  // Software-Reg_8
wire [31:0]    reg_9 = 0;  // Software-Reg_9
wire [31:0]    reg_10 = 0; // Software-Reg_10
wire [31:0]    reg_11 = 0; // Software-Reg_11
wire [31:0]    reg_12 = 0; // Software-Reg_12
wire [31:0]    reg_13 = 0; // Software-Reg_13
wire [31:0]    reg_14 = 0; // Software-Reg_14
wire [31:0]    reg_15 = 0; // Software-Reg_15
reg  [31:0]    reg_out;

//-----------------------------------------------------------------------
// Main code starts here
//-----------------------------------------------------------------------

//-----------------------------------------------------------------------
// Internal Logic Starts here
//-----------------------------------------------------------------------
    assign sw_addr       = reg_addr [3:0];
    assign sw_rd_en      = reg_cs & !reg_wr;
    assign sw_wr_en      = reg_cs & reg_wr;
    assign wr_be         = reg_be;


//-----------------------------------------------------------------------
// Read path mux
//-----------------------------------------------------------------------

always @ (posedge mclk or negedge reset_n)
begin : preg_out_Seq
   if (reset_n == 1'b0)
   begin
      reg_rdata [31:0]  <= 32'h0000_0000;
      reg_ack           <= 1'b0;
   end
   else if (sw_rd_en && !reg_ack) 
   begin
      reg_rdata [31:0]  <= reg_out [31:0];
      reg_ack           <= 1'b1;
   end
   else if (sw_wr_en && !reg_ack) 
      reg_ack           <= 1'b1;
   else
   begin
      reg_ack        <= 1'b0;
   end
end


//-----------------------------------------------------------------------
// register read enable and write enable decoding logic
//-----------------------------------------------------------------------
wire   sw_wr_en_0 = sw_wr_en & (sw_addr == 4'h0);
wire   sw_rd_en_0 = sw_rd_en & (sw_addr == 4'h0);
wire   sw_wr_en_1 = sw_wr_en & (sw_addr == 4'h1);
wire   sw_rd_en_1 = sw_rd_en & (sw_addr == 4'h1);
wire   sw_wr_en_2 = sw_wr_en & (sw_addr == 4'h2);
wire   sw_rd_en_2 = sw_rd_en & (sw_addr == 4'h2);
wire   sw_wr_en_3 = sw_wr_en & (sw_addr == 4'h3);
wire   sw_rd_en_3 = sw_rd_en & (sw_addr == 4'h3);
wire   sw_wr_en_4 = sw_wr_en & (sw_addr == 4'h4);
wire   sw_rd_en_4 = sw_rd_en & (sw_addr == 4'h4);
wire   sw_wr_en_5 = sw_wr_en & (sw_addr == 4'h5);
wire   sw_rd_en_5 = sw_rd_en & (sw_addr == 4'h5);
wire   sw_wr_en_6 = sw_wr_en & (sw_addr == 4'h6);
wire   sw_rd_en_6 = sw_rd_en & (sw_addr == 4'h6);
wire   sw_wr_en_7 = sw_wr_en & (sw_addr == 4'h7);
wire   sw_rd_en_7 = sw_rd_en & (sw_addr == 4'h7);
wire   sw_wr_en_8 = sw_wr_en & (sw_addr == 4'h8);
wire   sw_rd_en_8 = sw_rd_en & (sw_addr == 4'h8);
wire   sw_wr_en_9 = sw_wr_en & (sw_addr == 4'h9);
wire   sw_rd_en_9 = sw_rd_en & (sw_addr == 4'h9);
wire   sw_wr_en_10 = sw_wr_en & (sw_addr == 4'hA);
wire   sw_rd_en_10 = sw_rd_en & (sw_addr == 4'hA);
wire   sw_wr_en_11 = sw_wr_en & (sw_addr == 4'hB);
wire   sw_rd_en_11 = sw_rd_en & (sw_addr == 4'hB);
wire   sw_wr_en_12 = sw_wr_en & (sw_addr == 4'hC);
wire   sw_rd_en_12 = sw_rd_en & (sw_addr == 4'hC);
wire   sw_wr_en_13 = sw_wr_en & (sw_addr == 4'hD);
wire   sw_rd_en_13 = sw_rd_en & (sw_addr == 4'hD);
wire   sw_wr_en_14 = sw_wr_en & (sw_addr == 4'hE);
wire   sw_rd_en_14 = sw_rd_en & (sw_addr == 4'hE);
wire   sw_wr_en_15 = sw_wr_en & (sw_addr == 4'hF);
wire   sw_rd_en_15 = sw_rd_en & (sw_addr == 4'hF);


always @( *)
begin : preg_sel_Com

  reg_out [31:0] = 32'd0;

  case (sw_addr [3:0])
    4'b0000 : reg_out [31:0] = reg_0 [31:0];     
    4'b0001 : reg_out [31:0] = reg_1 [31:0];    
    4'b0010 : reg_out [31:0] = reg_2 [31:0];     
    4'b0011 : reg_out [31:0] = reg_3 [31:0];    
    4'b0100 : reg_out [31:0] = reg_4 [31:0];    
    4'b0101 : reg_out [31:0] = reg_5 [31:0];    
    4'b0110 : reg_out [31:0] = reg_6 [31:0];    
    4'b0111 : reg_out [31:0] = reg_7 [31:0];    
    4'b1000 : reg_out [31:0] = reg_8 [31:0];    
    4'b1001 : reg_out [31:0] = reg_9 [31:0];    
    4'b1010 : reg_out [31:0] = reg_10 [31:0];   
    4'b1011 : reg_out [31:0] = reg_11 [31:0];   
    4'b1100 : reg_out [31:0] = reg_12 [31:0];   
    4'b1101 : reg_out [31:0] = reg_13 [31:0];
    4'b1110 : reg_out [31:0] = reg_14 [31:0];
    4'b1111 : reg_out [31:0] = reg_15 [31:0]; 
  endcase
end



//-----------------------------------------------------------------------
// Individual register assignments
//-----------------------------------------------------------------------
// Logic for Register 0 : SPI Control Register
//-----------------------------------------------------------------------
wire         cfg_op_req         = reg_0[31];    // cpu request
wire [1:0]   cfg_tgt_sel        = reg_0[24:23]; // target chip select
wire [1:0]   cfg_op_type        = reg_0[22:21]; // SPI operation type
wire [1:0]   cfg_transfer_size  = reg_0[20:19]; // SPI transfer size
wire [5:0]   cfg_sck_period     = reg_0[18:13]; // sck clock period
wire [4:0]   cfg_sck_cs_period  = reg_0[12:8];  // cs setup/hold period
wire [7:0]   cfg_cs_byte        = reg_0[7:0];   // cs bit information

generic_register #(8,0  ) u_spi_ctrl_be0 (
	      .we            ({8{sw_wr_en_0 & 
                                 wr_be[0]   }}  ),		 
	      .data_in       (reg_wdata[7:0]    ),
	      .reset_n       (reset_n           ),
	      .clk           (mclk              ),
	      
	      //List of Outs
	      .data_out      (reg_0[7:0]        )
          );

generic_register #(8,0  ) u_spi_ctrl_be1 (
	      .we            ({8{sw_wr_en_0 & 
                                wr_be[1]   }}  ),		 
	      .data_in       (reg_wdata[15:8]  ),
	      .reset_n       (reset_n           ),
	      .clk           (mclk              ),
	      
	      //List of Outs
	      .data_out      (reg_0[15:8]       )
          );

generic_register #(8,0  ) u_spi_ctrl_be2 (
	      .we            ({8{sw_wr_en_0 & 
                                wr_be[2]   }}  ),		 
	      .data_in       (reg_wdata[23:16] ),
	      .reset_n       (reset_n           ),
	      .clk           (mclk              ),
	      
	      //List of Outs
	      .data_out      (reg_0[23:16]       )
          );

assign reg_0[30:24] = 7'h0;

req_register #(0  ) u_spi_ctrl_req (
	      .cpu_we       ({sw_wr_en_0 & 
                             wr_be[3]   }       ),		 
	      .cpu_req      (reg_wdata[31]      ),
	      .hware_ack    (hware_op_done      ),
	      .reset_n       (reset_n           ),
	      .clk           (mclk              ),
	      
	      //List of Outs
	      .data_out      (reg_0[31]         )
          );




//-----------------------------------------------------------------------
// Logic for Register 1 : SPI Data In Register
//-----------------------------------------------------------------------
wire [31:0]   cfg_datain        = reg_1[31:0]; 

generic_register #(8,0  ) u_spi_din_be0 (
	      .we            ({8{sw_wr_en_1 & 
                                wr_be[0]   }}  ),		 
	      .data_in       (reg_wdata[7:0]    ),
	      .reset_n       (reset_n           ),
	      .clk           (mclk              ),
	      
	      //List of Outs
	      .data_out      (reg_1[7:0]        )
          );

generic_register #(8,0  ) u_spi_din_be1 (
	      .we            ({8{sw_wr_en_1 & 
                                wr_be[1]   }}  ),		 
	      .data_in       (reg_wdata[15:8]   ),
	      .reset_n       (reset_n           ),
	      .clk           (mclk              ),
	      
	      //List of Outs
	      .data_out      (reg_1[15:8]       )
          );

generic_register #(8,0  ) u_spi_din_be2 (
	      .we            ({8{sw_wr_en_1 & 
                                wr_be[2]   }}  ),		 
	      .data_in       (reg_wdata[23:16]  ),
	      .reset_n       (reset_n           ),
	      .clk           (mclk              ),
	      
	      //List of Outs
	      .data_out      (reg_1[23:16]      )
          );


generic_register #(8,0  ) u_spi_din_be3 (
	      .we            ({8{sw_wr_en_1 & 
                                wr_be[3]   }}  ),		 
	      .data_in       (reg_wdata[31:24]  ),
	      .reset_n       (reset_n           ),
	      .clk           (mclk              ),
	      
	      //List of Outs
	      .data_out      (reg_1[31:24]      )
          );


//-----------------------------------------------------------------------
// Logic for Register 2 : SPI Data output Register
//-----------------------------------------------------------------------
assign  reg_2 = cfg_dataout; 



endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////   xSPI Interface Module                                      ////
////                                                              ////
////  This file is part of the xspi project                       ////
////  https://opencores.org/projects/xspi                         ////
////                                                              ////
////  Description                                                 ////
////  xspi definitions.                                           ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Version:                                                    ////
////    1.0 - 26th Oct 2019, Initial version                      ////
////  Author(s):                                                  ////
////      - Dinesh Annayya, dinesha@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
module xspi_core (

             clk,
             reset_n,
               
        // Reg Bus Interface Signal
             reg_cs,
             reg_wr,
             reg_addr,
             reg_wdata,
             reg_be,

            // Outputs
            reg_rdata,
            reg_ack,

          // line interface
            sck                ,
            so                 ,
            si                 ,
            cs_n  

           );
 
input               clk                           ;
input               reset_n                       ;          


//---------------------------------
// Reg Bus Interface Signal
//---------------------------------
input               reg_cs                        ;
input               reg_wr                        ;
input [3:0]         reg_addr                      ;
input [31:0]        reg_wdata                     ;
input [3:0]         reg_be                        ;

// Outputs
output [31:0]       reg_rdata                     ;
output              reg_ack                       ;

//-------------------------------------------
// Line Interface
//-------------------------------------------

output              sck                           ; // clock out
output              so                            ; // serial data out
input               si                            ; // serial data in
output [3:0]        cs_n                          ; // cs_n

//------------------------------------
// Wires
//------------------------------------

wire [7:0]          byte_in                       ;
wire [7:0]          byte_out                      ;


wire  [1:0]         cfg_tgt_sel                   ;

wire                cfg_op_req                    ; // SPI operation request
wire  [1:0]         cfg_op_type                   ; // SPI operation type
wire  [1:0]         cfg_transfer_size             ; // SPI transfer size
wire  [5:0]         cfg_sck_period                ; // sck clock period
wire  [4:0]         cfg_sck_cs_period             ; // cs setup/hold period
wire  [7:0]         cfg_cs_byte                   ; // cs bit information
wire  [31:0]        cfg_datain                    ; // data for transfer
wire  [31:0]        cfg_dataout                   ; // data for received
wire                hware_op_done                 ; // operation done

spi_if  u_spi_if
          (
          . clk                         (clk                          ), 
          . reset_n                     (reset_n                      ),

           // towards ctrl i/f
          . sck_pe                      (sck_pe                       ),
          . sck_int                     (sck_int                      ),
          . cs_int_n                    (cs_int_n                     ),
          . byte_in                     (byte_in                      ),
          . load_byte                   (load_byte                    ),
          . byte_out                    (byte_out                     ),
          . shift_out                   (shift_out                    ),
          . shift_in                    (shift_in                     ),

          . cfg_tgt_sel                 (cfg_tgt_sel                  ),

          . sck                         (sck                          ),
          . so                          (so                           ),
          . si                          (si                           ),
          . cs_n                        (cs_n                         )
           );


spi_ctl  u_spi_ctrl
       ( 
          . clk                         (clk                          ),
          . reset_n                     (reset_n                      ),

          . cfg_op_req                  (cfg_op_req                   ),
          . cfg_op_type                 (cfg_op_type                  ),
          . cfg_transfer_size           (cfg_transfer_size            ),
          . cfg_sck_period              (cfg_sck_period               ),
          . cfg_sck_cs_period           (cfg_sck_cs_period            ),
          . cfg_cs_byte                 (cfg_cs_byte                  ),
          . cfg_datain                  (cfg_datain                   ),
          . cfg_dataout                 (cfg_dataout                  ),
          . op_done                     (hware_op_done                ),

          . sck_int                     (sck_int                      ),
          . cs_int_n                    (cs_int_n                     ),
          . sck_pe                      (sck_pe                       ),
          . sck_ne                      (sck_ne                       ),
          . shift_out                   (shift_out                    ),
          . shift_in                    (shift_in                     ),
          . load_byte                   (load_byte                    ),
          . byte_out                    (byte_out                     ),
          . byte_in                     (byte_in                      )
         
         );




spi_cfg u_cfg (

          . mclk                        (clk                          ),
          . reset_n                     (reset_n                      ),

        // Reg Bus Interface Signal
          . reg_cs                      (reg_cs                       ),
          . reg_wr                      (reg_wr                       ),
          . reg_addr                    (reg_addr                     ),
          . reg_wdata                   (reg_wdata                    ),
          . reg_be                      (reg_be                       ),

            // Outputs
          . reg_rdata                   (reg_rdata                    ),
          . reg_ack                     (reg_ack                      ),


           // configuration signal
          . cfg_tgt_sel                 (cfg_tgt_sel                  ),
          . cfg_op_req                  (cfg_op_req                   ), // SPI operation request
          . cfg_op_type                 (cfg_op_type                  ), // SPI operation type
          . cfg_transfer_size           (cfg_transfer_size            ), // SPI transfer size
          . cfg_sck_period              (cfg_sck_period               ), // sck clock period
          . cfg_sck_cs_period           (cfg_sck_cs_period            ), // cs setup/hold period
          . cfg_cs_byte                 (cfg_cs_byte                  ), // cs bit information
          . cfg_datain                  (cfg_datain                   ), // data for transfer
          . cfg_dataout                 (cfg_dataout                  ), // data for received
          . hware_op_done               (hware_op_done                )  // operation done

        );

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  xSPI Interface Module                                       ////
////                                                              ////
////  This file is part of the xspi project                       ////
////  https://opencores.org/projects/xspi                         ////
////                                                              ////
////  Description                                                 ////
////  xspi definitions.                                           ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Dinesh Annayya, dinesha@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////



module spi_ctl
       ( clk,
         reset_n,
         sck_int,


         cfg_op_req,
         cfg_op_type,
         cfg_transfer_size,
         cfg_sck_period,
         cfg_sck_cs_period,
         cfg_cs_byte,
         cfg_datain,
         cfg_dataout,
         op_done,

         cs_int_n,
         sck_pe,
         sck_ne,
         shift_out,
         shift_in,
         byte_out,
         byte_in,
         load_byte
         
         );

 //*************************************************************************

  input          clk, reset_n;
  input          cfg_op_req;
  input [1:0]    cfg_op_type;
  input [1:0]    cfg_transfer_size;
    
  input [5:0]    cfg_sck_period;
  input [4:0]    cfg_sck_cs_period; // cs setup & hold period
  input [7:0]    cfg_cs_byte;
  input [31:0]   cfg_datain;
  output [31:0]  cfg_dataout;

  output [7:0]    byte_out; // Byte out for Serial Shifting out
  input  [7:0]    byte_in;  // Serial Received Byte
  output          sck_int;
  output          cs_int_n;
  output          sck_pe;
  output          sck_ne;
  output          shift_out;
  output          shift_in;
  output          load_byte;
  output          op_done;

  reg    [31:0]   cfg_dataout;
  reg             sck_ne;
  reg             sck_pe;
  reg             sck_int;
  reg [5:0]       clk_cnt;
  reg [5:0]       sck_cnt;

  reg [3:0]       spiif_cs;
  reg             shift_enb;
  reg             cs_int_n;
  reg             clr_sck_cnt ;
  reg             sck_out_en;

  wire [5:0]      sck_half_period;
  reg             load_byte;
  reg             shift_in;
  reg             op_done;
  reg [2:0]       byte_cnt;


  `define SPI_IDLE   4'b0000
  `define SPI_CS_SU  4'b0001
  `define SPI_WRITE  4'b0010
  `define SPI_READ   4'b0011
  `define SPI_CS_HLD 4'b0100
  `define SPI_WAIT   4'b0101


  assign sck_half_period = {1'b0, cfg_sck_period[5:1]};
  // The first transition on the sck_toggle happens one SCK period
  // after op_en or boot_en is asserted
  always @(posedge clk or negedge reset_n) begin
     if(!reset_n) begin
        sck_ne   <= 1'b0;
        clk_cnt  <= 6'h1;
        sck_pe   <= 1'b0;
        sck_int  <= 1'b0;
     end // if (!reset_n)
     else 
     begin
        if(cfg_op_req) 
        begin
           if(clk_cnt == sck_half_period) 
           begin
              sck_ne <= 1'b1;
              sck_pe <= 1'b0;
              if(sck_out_en) sck_int <= 0;
              clk_cnt <= clk_cnt + 1'b1;
           end // if (clk_cnt == sck_half_period)
           else 
           begin
              if(clk_cnt == cfg_sck_period) 
              begin
                 sck_ne <= 1'b0;
                 sck_pe <= 1'b1;
                 if(sck_out_en) sck_int <= 1;
                 clk_cnt <= 6'h1;
              end // if (clk_cnt == cfg_sck_period)
              else 
              begin
                 clk_cnt <= clk_cnt + 1'b1;
                 sck_pe <= 1'b0;
                 sck_ne <= 1'b0;
              end // else: !if(clk_cnt == cfg_sck_period)
           end // else: !if(clk_cnt == sck_half_period)
        end // if (op_en)
        else 
        begin
           clk_cnt    <= 6'h1;
           sck_pe     <= 1'b0;
           sck_ne     <= 1'b0;
        end // else: !if(op_en)
     end // else: !if(!reset_n)
  end // always @ (posedge clk or negedge reset_n)
  

wire [1:0] cs_data =  (byte_cnt == 2'b00) ? cfg_cs_byte[7:6]  :
                      (byte_cnt == 2'b01) ? cfg_cs_byte[5:4]  :
                      (byte_cnt == 2'b10) ? cfg_cs_byte[3:2]  : cfg_cs_byte[1:0] ;

wire [7:0] byte_out = (byte_cnt == 2'b00) ? cfg_datain[31:24] :
                      (byte_cnt == 2'b01) ? cfg_datain[23:16] :
                      (byte_cnt == 2'b10) ? cfg_datain[15:8]  : cfg_datain[7:0] ;
         
assign shift_out =  shift_enb && sck_ne;

always @(posedge clk or negedge reset_n) begin
   if(!reset_n) begin
      spiif_cs    <= `SPI_IDLE;
      sck_cnt     <= 6'h0;
      shift_in    <= 1'b0;
      clr_sck_cnt <= 1'b1;
      byte_cnt    <= 2'b00;
      cs_int_n    <= 1'b1;
      sck_out_en  <= 1'b0;
      shift_enb   <= 1'b0;
      cfg_dataout <= 32'h0;
      load_byte   <= 1'b0;
   end
   else begin
      if(sck_ne)
         sck_cnt <=  clr_sck_cnt  ? 6'h0 : sck_cnt + 1 ;

      case(spiif_cs)
      `SPI_IDLE   : 
      begin
          op_done     <= 0;
          clr_sck_cnt <= 1'b1;
          sck_out_en  <= 1'b0;
          shift_enb   <= 1'b0;
          if(cfg_op_req) 
          begin
              cfg_dataout <= 32'h0;
              spiif_cs    <= `SPI_CS_SU;
           end 
           else begin
              spiif_cs <= `SPI_IDLE;
           end 
      end 

      `SPI_CS_SU  : 
       begin
          if(sck_ne) begin
            cs_int_n <= cs_data[1];
            if(sck_cnt == cfg_sck_cs_period) begin
               clr_sck_cnt <= 1'b1;
               if(cfg_op_type == 0) begin // Write Mode
                  load_byte   <= 1'b1;
                  spiif_cs    <= `SPI_WRITE;
                  shift_enb   <= 1'b0;
               end else begin
                  shift_in    <= 1;
                  spiif_cs    <= `SPI_READ;
                end
             end
             else begin 
                clr_sck_cnt <= 1'b0;
             end
         end
      end 

      `SPI_WRITE : 
       begin 
         load_byte   <= 1'b0;
         if(sck_ne) begin
           if(sck_cnt == 3'h7 )begin
              clr_sck_cnt <= 1'b1;
              spiif_cs    <= `SPI_CS_HLD;
              shift_enb   <= 1'b0;
              sck_out_en  <= 1'b0; // Disable clock output
           end
           else begin
              shift_enb   <= 1'b1;
              sck_out_en  <= 1'b1;
              clr_sck_cnt <= 1'b0;
           end
         end else begin
            shift_enb   <= 1'b1;
         end
      end 

      `SPI_READ : 
       begin 
         if(sck_ne) begin
             if( sck_cnt == 3'h7 ) begin
                clr_sck_cnt <= 1'b1;
                shift_in    <= 0;
                spiif_cs    <= `SPI_CS_HLD;
                sck_out_en  <= 1'b0; // Disable clock output
             end
             else begin
                sck_out_en  <= 1'b1; // Disable clock output
                clr_sck_cnt <= 1'b0;
             end
         end
      end 

      `SPI_CS_HLD : begin
         if(sck_ne) begin
             cs_int_n <= cs_data[0];
            if(sck_cnt == cfg_sck_cs_period) begin
               if(cfg_op_type == 1) begin // Read Mode
                  cfg_dataout <= (byte_cnt[1:0] == 2'b00) ? { byte_in, cfg_dataout[23:0] } :
                                 (byte_cnt[1:0] == 2'b01) ? { cfg_dataout[31:24] ,
                                                              byte_in, cfg_dataout[15:0] } :
                                 (byte_cnt[1:0] == 2'b10) ? { cfg_dataout[31:16] ,
                                                              byte_in, cfg_dataout[7:0]  } :
                                                            { cfg_dataout[31:8]  ,
                                                              byte_in  } ;
               end
               clr_sck_cnt <= 1'b1;
               if(byte_cnt == cfg_transfer_size) begin
                  spiif_cs <= `SPI_WAIT;
                  byte_cnt <= 0;
                  op_done  <= 1;
               end else begin
                  byte_cnt <= byte_cnt +1;
                  spiif_cs <= `SPI_CS_SU;
               end
            end
            else begin
                clr_sck_cnt <= 1'b0;
            end
         end 
      end // case: `SPI_CS_HLD    
      `SPI_WAIT : begin
          if(!cfg_op_req) // Wait for Request de-assertion
             spiif_cs <= `SPI_IDLE;
       end
    endcase // casex(spiif_cs)
   end
end // always @(sck_ne

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  xSPI Interface Module                                       ////
////                                                              ////
////  This file is part of the xspi project                       ////
////  https://opencores.org/projects/xspi                         ////
////                                                              ////
////  Description                                                 ////
////  xspi definitions.                                           ////
////                                                              ////
////  To Do:                                                      ////
////    nothing                                                   ////
////                                                              ////
////  Author(s):                                                  ////
////      - Dinesh Annayya, dinesha@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

module xspi_if
          (
           clk, 
           reset_n,

           // towards ctrl i/f
           sck_pe,
           sck_int,
           cs_int_n,
           byte_in,
           load_byte,
           byte_out,
           shift_out,
           shift_in,

           cfg_tgt_sel,

           sck,
           so,
           si,
           cs_n
           );

  input clk,reset_n;
  input sck_pe;
  input sck_int,cs_int_n;
  
  input       load_byte;
  input [1:0] cfg_tgt_sel;

  input [7:0] byte_out;
  input       shift_out,shift_in;

  output [7:0] byte_in;
  output       sck,so;
  output [3:0] cs_n;
  input        si;


  reg [7:0]    so_reg;
  reg [7:0]    si_reg;
  wire [7:0]   byte_out;
  wire         sck;
  reg          so;
  wire [3:0]   cs_n;


  //Output Shift Register

  always @(posedge clk or negedge reset_n) begin
     if(!reset_n) begin
        so_reg <= 8'h00;
        so <= 1'b0;
     end
     else begin
        if(load_byte) begin
           so_reg <= byte_out;
           if(shift_out) begin 
              // Handling backto back case : 
              // Last Transfer bit + New Trasfer Load
              so <= so_reg[7];
           end
        end // if (load_byte)
        else begin
           if(shift_out) begin
              so <= so_reg[7];
              so_reg <= {so_reg[6:0],1'b0};
           end // if (shift_out)
        end // else: !if(load_byte)
     end // else: !if(!reset_n)
  end // always @ (posedge clk or negedge reset_n)


// Input shift register
  always @(posedge clk or negedge reset_n) begin
     if(!reset_n) begin
        si_reg <= 8'h0;
     end
     else begin
        if(sck_pe & shift_in) begin
           si_reg[7:0] <= {si_reg[6:0],si};
        end // if (sck_pe & shift_in)
     end // else: !if(!reset_n)
  end // always @ (posedge clk or negedge reset_n)


  assign byte_in[7:0] = si_reg[7:0];
  assign cs_n[0] = (cfg_tgt_sel[1:0] == 2'b00) ? cs_int_n : 1'b1;
  assign cs_n[1] = (cfg_tgt_sel[1:0] == 2'b01) ? cs_int_n : 1'b1;
  assign cs_n[2] = (cfg_tgt_sel[1:0] == 2'b10) ? cs_int_n : 1'b1;
  assign cs_n[3] = (cfg_tgt_sel[1:0] == 2'b11) ? cs_int_n : 1'b1;
  assign sck = sck_int;

endmodule
