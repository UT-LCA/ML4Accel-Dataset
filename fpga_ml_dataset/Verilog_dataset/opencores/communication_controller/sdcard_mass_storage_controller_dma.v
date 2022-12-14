
`include "sd_defines.v"



module sd_bd (
input clk,
input rst,
//input stb_m,
input we_m,

input [`RAM_MEM_WIDTH-1:0] dat_in_m, 

output reg [`BD_WIDTH-1 :0] free_bd,

input  re_s,
output reg ack_o_s,
input a_cmp,
output reg[`RAM_MEM_WIDTH-1:0] dat_out_s
);
 
 reg new_bw;
reg last_a_cmp;
 
`ifdef RAM_MEM_WIDTH_32   
`ifdef ACTEL
reg [`RAM_MEM_WIDTH -1:0] bd_mem [ `BD_SIZE -1 :0]; /* synthesis syn_ramstyle = "no_rw_check"*/
`else
reg [`RAM_MEM_WIDTH -1:0] bd_mem [ `BD_SIZE -1 :0];
`endif 

reg write_cnt; 
reg read_cnt;
reg [`BD_WIDTH -1 :0] m_wr_pnt;

reg [`BD_WIDTH -1 :0] s_rd_pnt ;
 
 //Main side read/write  
always @(posedge clk or posedge rst )
begin
   new_bw <=0;  
  
  if (rst) begin
    m_wr_pnt<=0;
    
    write_cnt<=0;
    new_bw <=0; 

   
  end
  else if (we_m) begin    
    if (free_bd >0) begin
      write_cnt <=~ write_cnt;
      m_wr_pnt<=m_wr_pnt+1;
      if (!write_cnt) begin  //First write indicate source buffer addr
        bd_mem[m_wr_pnt]<=dat_in_m;            
      end
      else begin        //Second write indicate SD card block addr
        bd_mem[m_wr_pnt]<=dat_in_m;
        new_bw <=1;     
      end
     end
  end   
  
        
          
        
end  



always @ (posedge clk or posedge rst)
begin
  if (rst) begin  
    free_bd <=(`BD_SIZE  /2);
  end
  else if (new_bw ) begin
    free_bd <= free_bd-1;
  end  
  else if  (a_cmp) begin
     free_bd <= free_bd+1;
    
  end
  
end


//Second side read
always @(posedge clk or posedge rst)
begin
   
  if (rst) begin
    s_rd_pnt<=0;
	
  end
  else if (re_s) begin    
    s_rd_pnt<=s_rd_pnt+1;
    dat_out_s<= bd_mem[s_rd_pnt];            
  
   
  end  
end

`else `ifdef RAM_MEM_WIDTH_16   
`ifdef ACTEL
reg [ `RAM_MEM_WIDTH -1:0] bd_mem [ `BD_SIZE -1 :0];  //synthesis syn_ramstyle = "no_rw_check"
`else
reg [ `RAM_MEM_WIDTH -1:0] bd_mem [ `BD_SIZE -1 :0];
`endif 

reg [1:0]write_cnt; 
reg [1:0]read_s_cnt;
reg read_cnt;

reg [`BD_WIDTH -1 :0] m_wr_pnt;

reg [`BD_WIDTH -1 :0] s_rd_pnt ;
 
 //Main side read/write  
always @(posedge clk or posedge rst )
begin
   new_bw <=0;  
  
  if (rst) begin
    m_wr_pnt<=0;
    
    write_cnt<=0;
    new_bw <=0; 
    read_cnt<=0;
   
  end
  else if (we_m) begin    
    if (free_bd >0) begin
      write_cnt <=write_cnt+1;
      m_wr_pnt<=m_wr_pnt+1;
      if (!write_cnt[1]) begin      //First write indicate source buffer addr (2x16)
        bd_mem[m_wr_pnt]<=dat_in_m;             
      end
      else begin        //Second write indicate SD card block addr (2x16)
        bd_mem[m_wr_pnt]<=dat_in_m;
        new_bw <=write_cnt[0];      //Second 16 bytes writen, complete BD
      end
     end
  end   
   
    

end

always @(posedge clk or posedge rst)
begin
  if (rst) begin  
    free_bd <=(`BD_SIZE  /4);
    last_a_cmp<=0;
  end
  else if (new_bw ) begin
    free_bd <= free_bd-1;
  end  
  else if  (a_cmp) begin
    last_a_cmp <=a_cmp;
    if (!last_a_cmp)
     free_bd <= free_bd+1;
     
  end
 else
  last_a_cmp <=a_cmp;
end


//Second side read
always @(posedge clk or posedge rst)
begin
   
  if (rst) begin
    s_rd_pnt<=0;
	  read_s_cnt<=0;
	  ack_o_s<=0;
  end
  else if (re_s) begin
    read_s_cnt <=read_s_cnt+1;
    s_rd_pnt<=s_rd_pnt+1;
    ack_o_s<=1;
     if (!read_s_cnt[1])       //First read indicate source buffer addr (2x16)
        dat_out_s<= bd_mem[s_rd_pnt];           
      
      else         //Second read indicate SD card block addr (2x16)
        dat_out_s<= bd_mem[s_rd_pnt];
      
  end  
  else
    ack_o_s<=0;
end

 `endif

`endif


endmodule

`include "sd_defines.v"
//////////////////////////////////////////////////////////////////////
////                                                                    ////
////  sd_controller.v                                                   ////
////                                                                          ////
////  This file is part of the SD Card IP core project                        ////
////  http://www.opencores.org/?do=project&who=sdcard_mass_storage_controller  ////
////                                                                           ////
////  Author(s):                                                            ////
////      - Adam Edvardsson (adam.edvardsson@orsoc.se)                       ////
////                                                                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors                                   ////
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




module sdc_controller(
  
  // WISHBONE common
  wb_clk_i, wb_rst_i, wb_dat_i, wb_dat_o, 

  // WISHBONE slave
  wb_adr_i, wb_sel_i, wb_we_i, wb_cyc_i, wb_stb_i, wb_ack_o, 

  // WISHBONE master
  m_wb_adr_o, m_wb_sel_o, m_wb_we_o, 
  m_wb_dat_o, m_wb_dat_i, m_wb_cyc_o, 
  m_wb_stb_o, m_wb_ack_i, 
  m_wb_cti_o, m_wb_bte_o,
  //SD BUS
  
  sd_cmd_dat_i,sd_cmd_out_o,  sd_cmd_oe_o, card_detect,
  sd_dat_dat_i, sd_dat_out_o , sd_dat_oe_o, sd_clk_o_pad
  `ifdef SDC_CLK_SEP
   ,sd_clk_i_pad
  `endif
  `ifdef SDC_IRQ_ENABLE
   ,int_a, int_b, int_c  
  `endif
);



// WISHBONE common
input           wb_clk_i;     // WISHBONE clock
input           wb_rst_i;     // WISHBONE reset
input   [31:0]  wb_dat_i;     // WISHBONE data input
output  [31:0]  wb_dat_o;     // WISHBONE data output
     // WISHBONE error output
input 			card_detect;
// WISHBONE slave
input   [7:0]  wb_adr_i;     // WISHBONE address input
input   [3:0]  wb_sel_i;     // WISHBONE byte select input
input          wb_we_i;      // WISHBONE write enable input
input          wb_cyc_i;     // WISHBONE cycle input
input          wb_stb_i;     // WISHBONE strobe input

output          wb_ack_o;     // WISHBONE acknowledge output

// WISHBONE master
output  [31:0]  m_wb_adr_o;
output  [3:0]   m_wb_sel_o;
output          m_wb_we_o;

input   [31:0]  m_wb_dat_i;
output  [31:0]  m_wb_dat_o;
output          m_wb_cyc_o;
output          m_wb_stb_o;
input           m_wb_ack_i;
output  [2:0]   m_wb_cti_o;
output	[1:0]	m_wb_bte_o;
//SD port

input  wire [3:0] sd_dat_dat_i;   //Data in from SDcard
output wire [3:0] sd_dat_out_o; //Data out to SDcard
output wire sd_dat_oe_o; //SD Card tristate Data Output enable (Connects on the SoC TopLevel)

input  wire sd_cmd_dat_i; //Command in from SDcard
output wire sd_cmd_out_o; //Command out to SDcard
output wire sd_cmd_oe_o; //SD Card tristate CMD Output enable (Connects on the SoC TopLevel)
output sd_clk_o_pad;
  `ifdef SDC_CLK_SEP
   input wire sd_clk_i_pad;
  `endif
//IRQ
`ifdef SDC_IRQ_ENABLE
   output int_a, int_b, int_c ; 
  `endif
  
wire int_busy;



//Wires from SD_CMD_MASTER Module 
wire [15:0] status_reg_w;
wire [31:0] cmd_resp_1_w;
wire [15:0]normal_int_status_reg_w;
wire [4:0]error_int_status_reg_w; 
 

wire[31:0]  argument_reg;
wire[15:0]  cmd_setting_reg;
reg[15:0]   status_reg;
reg[31:0]   cmd_resp_1;
wire[7:0]   software_reset_reg; 
wire[15:0]  time_out_reg;   
reg[15:0]   normal_int_status_reg; 
reg[15:0]   error_int_status_reg;
wire[15:0]  normal_int_signal_enable_reg;
wire[15:0]  error_int_signal_enable_reg;
wire[7:0]   clock_divider;
reg[15:0]   Bd_Status_reg;   
reg[7:0]    Bd_isr_reg;
wire[7:0]   Bd_isr_enable_reg;

 
//Rx Buffer  Descriptor internal signals



wire [`BD_WIDTH-1 :0] free_bd_rx_bd; //NO free Rx_bd
wire new_rx_bd;  // New Bd writen
wire [`RAM_MEM_WIDTH-1:0] dat_out_s_rx_bd; //Data out from Rx_bd to Slave

//Tx Buffer Descriptor internal signals
wire [`RAM_MEM_WIDTH-1:0] dat_in_m_rx_bd; //Data in to Rx_bd from Master
wire [`RAM_MEM_WIDTH-1:0] dat_in_m_tx_bd;
wire [`BD_WIDTH-1 :0] free_bd_tx_bd;
wire new_tx_bd;
wire [`RAM_MEM_WIDTH-1:0] dat_out_s_tx_bd;
wire [7:0] bd_int_st_w; //Wire to BD status register

//Wires for connecting Bd registers with the SD_Data_master module
wire re_s_tx_bd_w;
wire a_cmp_tx_bd_w;
wire re_s_rx_bd_w;
wire a_cmp_rx_bd_w;
wire write_req_s; //SD_Data_master want acces to the CMD line.
wire cmd_busy; //CMD line busy no access granted

wire [31:0] cmd_arg_s; //SD_Data_master CMD Argument
wire [15:0] cmd_set_s; //SD_Data_master Settings Argument
wire [31:0] sys_adr; //System addres the DMA whil Read/Write to/from
wire [1:0]start_dat_t; //Start data transfer

//Signals to Syncronize busy signaling betwen Wishbone access and SD_Data_master access to the CMD line (Also manage the status reg uppdate)

assign cmd_busy = int_busy | status_reg[0];
wire status_reg_busy;


//Wires from SD_DATA_SERIAL_HOST_1 to the FIFO
wire [`SD_BUS_W -1 : 0 ]data_in_rx_fifo;
wire [31: 0 ] data_fout_tx_fifo;
wire [31:0] m_wb_dat_o_rx;
wire [3:0] m_wb_sel_o_tx;
wire [31:0] m_wb_adr_o_tx;
wire [31:0] m_wb_adr_o_rx;

//SD clock 
wire sd_clk_i; //Sd_clk provided to the system
wire sd_clk_o; //Sd_clk used in the system 


//sd_clk_o to be used i set here
`ifdef SDC_CLK_BUS_CLK
  assign sd_clk_i = wb_clk_i;
`endif 
`ifdef SDC_CLK_SEP
   assign sd_clk_i = sd_clk_i_pad;
  `endif

`ifdef SDC_CLK_STATIC
   assign sd_clk_o = sd_clk_i;
`endif
   
`ifdef SDC_CLK_DYNAMIC
  sd_clock_divider clock_divider_1 (
 .CLK (sd_clk_i),
 .DIVIDER (clock_divider),
 .RST  (wb_rst_i | software_reset_reg[0]),
 .SD_CLK  (sd_clk_o)  
);
`endif
assign sd_clk_o_pad  = sd_clk_o ;

wire [15:0] settings;
wire [7:0] serial_status;
wire [39:0] cmd_out_master;
wire [39:0] cmd_in_host;

sd_cmd_master cmd_master_1
(
    .CLK_PAD_IO     (wb_clk_i),
    .RST_PAD_I      (wb_rst_i | software_reset_reg[0]),
    .New_CMD        (new_cmd),
    .data_write     (d_write),
    .data_read      (d_read),
    .ARG_REG        (argument_reg),
    .CMD_SET_REG    (cmd_setting_reg[13:0]),
    .STATUS_REG     (status_reg_w),
    .TIMEOUT_REG    (time_out_reg),
    .RESP_1_REG     (cmd_resp_1_w),
    .ERR_INT_REG    (error_int_status_reg_w),
    .NORMAL_INT_REG (normal_int_status_reg_w),
    .ERR_INT_RST    (error_isr_reset),
    .NORMAL_INT_RST (normal_isr_reset),
    .settings       (settings),
    .go_idle_o      (go_idle),
    .cmd_out        (cmd_out_master ),
    .req_out        (req_out_master ),
    .ack_out        (ack_out_master ),
    .req_in         (req_in_host),
    .ack_in         (ack_in_host),
    .cmd_in         (cmd_in_host),
    .serial_status (serial_status),
    .card_detect (card_detect)

);


sd_cmd_serial_host cmd_serial_host_1(
    .SD_CLK_IN  (sd_clk_o), 
    .RST_IN     (wb_rst_i | software_reset_reg[0] | go_idle),
    .SETTING_IN (settings),
    .CMD_IN     (cmd_out_master),
    .REQ_IN     (req_out_master),
    .ACK_IN     (ack_out_master),
    .REQ_OUT    (req_in_host), 
    .ACK_OUT    (ack_in_host),
    .CMD_OUT    (cmd_in_host),
    .STATUS     (serial_status),
    .cmd_dat_i  (sd_cmd_dat_i),
    .cmd_out_o  (sd_cmd_out_o),
    .cmd_oe_o   ( sd_cmd_oe_o),
    .st_dat_t   (start_dat_t)
);


sd_data_master data_master_1 
(
    .clk            (wb_clk_i),
    .rst            (wb_rst_i | software_reset_reg[0]),
    .dat_in_tx      (dat_out_s_tx_bd),
    .free_tx_bd     (free_bd_tx_bd),
    .ack_i_s_tx     (ack_o_s_tx ),
    .re_s_tx        (re_s_tx_bd_w), 
    .a_cmp_tx       (a_cmp_tx_bd_w),
    .dat_in_rx      (dat_out_s_rx_bd),
    .free_rx_bd     (free_bd_rx_bd),
    .ack_i_s_rx     (ack_o_s_rx),
    .re_s_rx        (re_s_rx_bd_w), 
    .a_cmp_rx       (a_cmp_rx_bd_w),
    .cmd_busy       (cmd_busy),
    .we_req         (write_req_s),
    .we_ack         (we_ack),
    .d_write        (d_write),
    .d_read         (d_read),
    .cmd_arg        (cmd_arg_s),
    .cmd_set        (cmd_set_s),
    .cmd_tsf_err    (normal_int_status_reg[15]) ,
    .card_status    (cmd_resp_1[12:8])   ,
    .start_tx_fifo  (start_tx_fifo),
    .start_rx_fifo  (start_rx_fifo),
    .sys_adr        (sys_adr),
    .tx_empt        (tx_e ),
    .tx_full        (tx_f ),
    .rx_full        (full_rx ),
    .busy_n         (busy_n),
    .transm_complete(trans_complete ),
    .crc_ok         (crc_ok),
    .ack_transfer   (ack_transfer),
    .Dat_Int_Status (bd_int_st_w),
    .Dat_Int_Status_rst (Bd_isr_reset),
    .CIDAT           (cidat_w),
	.transfer_type  (cmd_setting_reg[15:14])
);
 
wire [31:0] data_out_tx_fifo;
sd_data_serial_host sd_data_serial_host_1(
    .sd_clk         (sd_clk_o),
    .rst            (wb_rst_i | software_reset_reg[0]),
    .data_in        (data_out_tx_fifo),
    .rd             (rd), 
    .data_out       (data_in_rx_fifo),
    .we             (we_rx),
    .DAT_oe_o       (sd_dat_oe_o),
    .DAT_dat_o      (sd_dat_out_o),
    .DAT_dat_i      (sd_dat_dat_i),
    .start_dat      (start_dat_t),
    .ack_transfer   (ack_transfer),
    .busy_n         (busy_n),
    .transm_complete(trans_complete ),
    .crc_ok         (crc_ok)
);


sd_bd rx_bd
(
    .clk        (wb_clk_i),
    .rst       (wb_rst_i | software_reset_reg[0]),
    .we_m      (we_m_rx_bd),
    .dat_in_m  (dat_in_m_rx_bd),
    .free_bd   (free_bd_rx_bd),
    .re_s      (re_s_rx_bd_w),
    .ack_o_s   (ack_o_s_rx),
    .a_cmp     (a_cmp_rx_bd_w),
    .dat_out_s (dat_out_s_rx_bd)

);

sd_bd tx_bd
(
    .clk       (wb_clk_i),
    .rst       (wb_rst_i | software_reset_reg[0]),
    .we_m      (we_m_tx_bd),
    .dat_in_m  (dat_in_m_tx_bd),
    .free_bd   (free_bd_tx_bd),
    .ack_o_s   (ack_o_s_tx),
    .re_s      (re_s_tx_bd_w),
    .a_cmp     (a_cmp_tx_bd_w),
    .dat_out_s (dat_out_s_tx_bd)
);


sd_fifo_tx_filler fifo_filer_tx (
    .clk        (wb_clk_i),
    .rst        (wb_rst_i | software_reset_reg[0]),
    .m_wb_adr_o (m_wb_adr_o_tx),
    .m_wb_we_o  (m_wb_we_o_tx),
    .m_wb_dat_i (m_wb_dat_i),
    .m_wb_cyc_o (m_wb_cyc_o_tx),
    .m_wb_stb_o (m_wb_stb_o_tx),
    .m_wb_ack_i (m_wb_ack_i),
    .m_wb_cti_o (m_wb_cti_o_tx),
	.m_wb_bte_o (m_wb_bte_o_tx),
    .en         (start_tx_fifo),
    .adr        (sys_adr),
    .sd_clk     (sd_clk_o),
    .dat_o      (data_out_tx_fifo   ),
    .rd         (rd),
    .empty      (tx_e),
    .fe         (tx_f)
);

sd_fifo_rx_filler fifo_filer_rx (
    .clk        (wb_clk_i),
    .rst        (wb_rst_i | software_reset_reg[0]),
    .m_wb_adr_o (m_wb_adr_o_rx),
    .m_wb_we_o  (m_wb_we_o_rx),
    .m_wb_dat_o (m_wb_dat_o),
    .m_wb_cyc_o (m_wb_cyc_o_rx),
    .m_wb_stb_o (m_wb_stb_o_rx),
    .m_wb_ack_i (m_wb_ack_i),
    .m_wb_cti_o (m_wb_cti_o_rx),
	.m_wb_bte_o (m_wb_bte_o_rx),
    .en         (start_rx_fifo),
    .adr        (sys_adr),
    .sd_clk     (sd_clk_o),
    .dat_i      (data_in_rx_fifo   ),
    .wr         (we_rx),
    .full       (full_rx)
);

sd_controller_wb sd_controller_wb0
	(
	 .wb_clk_i          (wb_clk_i),
	 .wb_rst_i          (wb_rst_i),
	 .wb_dat_i          (wb_dat_i),
	 .wb_dat_o          (wb_dat_o),
	 .wb_adr_i          (wb_adr_i[7:0]),
	 .wb_sel_i          (wb_sel_i),
	 .wb_we_i           (wb_we_i),
	 .wb_stb_i          (wb_stb_i),
	 .wb_cyc_i          (wb_cyc_i),
	 .wb_ack_o          (wb_ack_o),
   	 .we_m_tx_bd        (we_m_tx_bd),
     .new_cmd           (new_cmd), 
     .we_m_rx_bd        (we_m_rx_bd),   
    .we_ack             (we_ack),
    .int_ack            (int_ack),
    .cmd_int_busy       (cmd_int_busy),
    .Bd_isr_reset       (Bd_isr_reset),     
    .normal_isr_reset   (normal_isr_reset),
    .error_isr_reset    (error_isr_reset),
    .int_busy           (int_busy),
    .dat_in_m_tx_bd     (dat_in_m_tx_bd),
    .dat_in_m_rx_bd     (dat_in_m_rx_bd),
    .write_req_s        (write_req_s),
    .cmd_set_s          (cmd_set_s),
    .cmd_arg_s          (cmd_arg_s),
    .argument_reg       (argument_reg),
    .cmd_setting_reg    (cmd_setting_reg),
    .status_reg         (status_reg),
    .cmd_resp_1         (cmd_resp_1),
    .software_reset_reg (software_reset_reg ),
    .time_out_reg       (time_out_reg ),
    .normal_int_status_reg  (normal_int_status_reg),
    .error_int_status_reg   (error_int_status_reg ),
    .normal_int_signal_enable_reg   (normal_int_signal_enable_reg),
    .error_int_signal_enable_reg    (error_int_signal_enable_reg),
    .clock_divider                  (clock_divider ),
    .Bd_Status_reg                  (Bd_Status_reg),
    .Bd_isr_reg                     (Bd_isr_reg ),
    .Bd_isr_enable_reg              (Bd_isr_enable_reg)
	 );





//MUX For WB master acces granted to RX or TX FIFO filler
assign m_wb_cyc_o = start_tx_fifo ? m_wb_cyc_o_tx :start_rx_fifo ?m_wb_cyc_o_rx: 0;
assign m_wb_stb_o = start_tx_fifo ? m_wb_stb_o_tx :start_rx_fifo ?m_wb_stb_o_rx: 0;

assign m_wb_cti_o = start_tx_fifo ? m_wb_cti_o_tx :start_rx_fifo ?m_wb_cti_o_rx: 0;
assign m_wb_bte = start_tx_fifo ? m_wb_bte_o_tx :start_rx_fifo ?m_wb_bte_o_rx: 0;
//assign m_wb_dat_o = m_wb_dat_o_rx;
assign m_wb_we_o = start_tx_fifo ? m_wb_we_o_tx :start_rx_fifo ?m_wb_we_o_rx: 0;
assign m_wb_adr_o = start_tx_fifo ? m_wb_adr_o_tx :start_rx_fifo ?m_wb_adr_o_rx: 0;

`ifdef SDC_IRQ_ENABLE
assign int_a =  |(normal_int_status_reg &  normal_int_signal_enable_reg) ;
assign int_b =  |(error_int_status_reg & error_int_signal_enable_reg);
assign int_c =  |(Bd_isr_reg & Bd_isr_enable_reg);
`endif

assign m_wb_sel_o = 4'b1111;

//Set Bd_Status_reg
always @ (posedge wb_clk_i ) begin
  Bd_Status_reg[15:8]=free_bd_rx_bd;
  Bd_Status_reg[7:0]=free_bd_tx_bd;
  cmd_resp_1<= cmd_resp_1_w;
  normal_int_status_reg<= normal_int_status_reg_w  ;
  error_int_status_reg<= error_int_status_reg_w  ;
  status_reg[0]<= status_reg_busy;
  status_reg[15:1]<=  status_reg_w[15:1]; 
  status_reg[1] <= cidat_w; 
  Bd_isr_reg<=bd_int_st_w;

end


 
//cmd_int_busy is set when an internal access to the CMD buss is granted then immidetly uppdate the status busy bit to prevent buss access to cmd
assign status_reg_busy = cmd_int_busy ? 1'b1: status_reg_w[0];





endmodule
`include "sd_defines.v"//nononw
module sd_clock_divider (
  input wire CLK,
  input  [7:0] DIVIDER,
  input wire RST,
  output  SD_CLK 
  );
  
  reg [7:0] ClockDiv;
  reg SD_CLK_O;
`ifdef SYN
  `ifdef ACTEL
  CLKINT CLKA
  (.A (SD_CLK_O),
   .Y (SD_CLK) 
   );
   `endif
 `endif
 
 `ifdef SIM
   assign SD_CLK = SD_CLK_O;
`endif 
 
always @ (posedge CLK or posedge RST)
begin
 if (RST) begin
    ClockDiv <=8'b0000_0000;
    SD_CLK_O  <= 0;
 end 
 else if (ClockDiv == DIVIDER )begin
    ClockDiv  <= 0;
    SD_CLK_O <=  ~SD_CLK_O;
 end else begin
    ClockDiv  <= ClockDiv + 1;
    SD_CLK_O <=  SD_CLK_O;
end
 
end
 endmodule
 
 
`include "sd_defines.v"
module sd_cmd_master(
input CLK_PAD_IO,

input RST_PAD_I,
input New_CMD,
input data_write,
input data_read,



input [31:0]ARG_REG,
input [13:0]CMD_SET_REG,
input [15:0] TIMEOUT_REG,
output reg [15:0] STATUS_REG,
output reg [31:0] RESP_1_REG,

output reg [4:0] ERR_INT_REG, 
output reg [15:0] NORMAL_INT_REG, 
input ERR_INT_RST,
input NORMAL_INT_RST,

output reg [15:0] settings,
output reg go_idle_o,
output reg  [39:0] cmd_out,
output reg req_out,
output reg ack_out,
input req_in,
input ack_in,
input [39:0] cmd_in,
input [7:0] serial_status,
input card_detect
);
 
  







`define dat_ava status[6]
`define crc_valid status[5] 
`define small_rsp 7'b0101000
`define big_rsp 7'b1111111

`define CMDI CMD_SET_REG[13:8]
`define WORD_SELECT CMD_SET_REG[7:6]
`define CICE CMD_SET_REG[4]
`define CRCE CMD_SET_REG[3]
`define RTS CMD_SET_REG[1:0]
`define CTE ERR_INT_REG[0]
`define CCRCE ERR_INT_REG[1]
`define CIE  ERR_INT_REG[3]
`define EI NORMAL_INT_REG[15]
`define CC  NORMAL_INT_REG[0]
`define CICMD STATUS_REG[0]
             

//-----------Types--------------------------------------------------------

reg CRC_check_enable;
reg index_check_enable;
reg [6:0]response_size;


reg card_present;


reg [3:0]debounce;

reg [15:0]status;
reg [15:0]  Watchdog_Cnt;
reg complete;



parameter SIZE = 3;
reg [SIZE-1:0] state;
reg [SIZE-1:0] next_state;

parameter IDLE   =  3'b001;
parameter SETUP   =  3'b010;
parameter EXECUTE  =  3'b100;
reg ack_in_int;
reg ack_q;
reg req_q;
reg req_in_int;

always @ (posedge CLK_PAD_IO or posedge RST_PAD_I   )
begin
  if (RST_PAD_I) begin
    req_q<=0;
    req_in_int<=0;
 end 
else begin
  req_q<=req_in;  
  req_in_int<=req_q;
end
end  

//---------------Input ports---------------


always @ (posedge CLK_PAD_IO or posedge RST_PAD_I   )
begin
  if (RST_PAD_I) begin
    debounce<=0;
    card_present<=0;
 end 
else begin
	if (!card_detect) begin//Card present
		if (debounce!=4'b1111)
			debounce<=debounce+1'b1;
	end
	else	
		 debounce<=0;

	if (debounce==4'b1111)
       card_present<=1'b1;
	else 
	   card_present<=1'b0;
end
end  



always @ (posedge CLK_PAD_IO or posedge RST_PAD_I   )
begin
  if (RST_PAD_I) begin
    ack_q<=0;
    ack_in_int<=0;
 end 
else begin
  ack_q<=ack_in;
  ack_in_int<=ack_q;
end
  
  
end



always @ ( state or New_CMD or complete or ack_in_int )
begin : FSM_COMBO
    next_state = 0;

 case(state)
 IDLE:   begin
      if (New_CMD) begin
          next_state = SETUP;
      end     
      else begin
         next_state = IDLE;
      end   
 end       
 SETUP:begin
    if (ack_in_int)             
       next_state = EXECUTE;  
     else   
       next_state = SETUP;
   end  
 EXECUTE:    begin
       if (complete) begin
          next_state = IDLE;
      end     
      else begin
         next_state = EXECUTE;
      end
 end       
   
  
 default : next_state  = IDLE;
 
 endcase 
    
end

 
 

always @ (posedge CLK_PAD_IO or posedge RST_PAD_I   )
begin : FSM_SEQ
  if (RST_PAD_I ) begin
    state <= #1 IDLE;
 end 
 else begin
    state <= #1 next_state;
 end
end



always @ (posedge CLK_PAD_IO or posedge RST_PAD_I   )
begin  
 if (RST_PAD_I ) begin 
    CRC_check_enable=0;
    complete =0;
    RESP_1_REG = 0;
 
    ERR_INT_REG =0;
    NORMAL_INT_REG=0;
    STATUS_REG=0;
    status=0; 
    cmd_out =0 ;
    settings=0;
    response_size=0;
    req_out=0;
    index_check_enable=0; 
    ack_out=0; 
    Watchdog_Cnt=0;
    
    `CCRCE=0;
    `EI = 0;
    `CC = 0; 
     go_idle_o=0;  
 end 
 else begin
 NORMAL_INT_REG[1] = card_present;
 NORMAL_INT_REG[2] = ~card_present;
 complete=0;
 case(state)
 IDLE: begin
    go_idle_o=0;  
    req_out=0;
		ack_out =0;
		`CICMD =0; 
    if ( req_in_int == 1) begin     //Status change
        status=serial_status;
        ack_out = 1;
      
        
    end
 end
 SETUP:  begin
     
     NORMAL_INT_REG=0; 
     ERR_INT_REG =0;
  
     index_check_enable = `CICE; 
     CRC_check_enable = `CRCE;
    
    if ( (`RTS  == 2'b10 ) || ( `RTS == 2'b11)) begin
      response_size =  7'b0101000; 
    end
    else if (`RTS == 2'b01) begin
      response_size = 7'b1111111; 
    end    
    else begin
       response_size=0;
    end    
    
    cmd_out[39:38]=2'b01;         
    cmd_out[37:32]=`CMDI;  //CMD_INDEX
    cmd_out[31:0]= ARG_REG;           //CMD_Argument      
    settings[14:13]=`WORD_SELECT;             //Reserved
    settings[12] = data_read; //Type of command
    settings[11] = data_write;
    settings[10:8]=3'b111;            //Delay
    settings[7]=`CRCE;         //CRC-check
    settings[6:0]=response_size;   //response size    
    Watchdog_Cnt = 0;
    
    `CICMD =1;    
 end   
 
 EXECUTE: begin   
    Watchdog_Cnt = Watchdog_Cnt +1;
    if (Watchdog_Cnt>TIMEOUT_REG) begin
      `CTE=1;
      `EI = 1;
      if (ack_in == 1) begin
         complete=1;
      end   
      go_idle_o=1; 
    end
    
    //Default
    req_out=0;
		ack_out =0;
    
    //Start sending when serial module is ready
   	if (ack_in_int == 1) begin	    	     
	    		req_out =1;	   			   		
	  end	
	   //Incoming New Status 
	  else if ( req_in_int == 1) begin   
        status=serial_status;
      
        ack_out = 1; 
        if ( `dat_ava ) begin //Data avaible
           complete=1;
            `EI = 0;
             
           if (CRC_check_enable & ~`crc_valid) begin 
            `CCRCE=1;
            `EI = 1;
             
           end 
           if (index_check_enable &  (cmd_out[37:32] != cmd_in [37:32]) ) begin
            `CIE=1;
            `EI = 1;
            
           end
          
             
             `CC = 1;  
            
             if (response_size !=0)
              RESP_1_REG=cmd_in[31:0];
            
          // end 
         end ////Data avaible
       end //Status change
     end //EXECUTE state
   endcase
   if (ERR_INT_RST)
     ERR_INT_REG=0;
   if (NORMAL_INT_RST)
     NORMAL_INT_REG=0;
  end
end

endmodule
`include "sd_defines.v"
//-------------------------
//-------------------------
module sd_cmd_serial_host ( SD_CLK_IN, RST_IN, SETTING_IN ,CMD_IN, REQ_IN, ACK_OUT, REQ_OUT,ACK_IN, CMD_OUT, STATUS, cmd_dat_i, cmd_out_o, cmd_oe_o, st_dat_t);
//---------------Input ports---------------
input SD_CLK_IN;
input  RST_IN;
input [15:0] SETTING_IN;   
                      
input [39:0] CMD_IN;
input   REQ_IN;
input ACK_IN;
input cmd_dat_i;

//---------------Output ports---------------
output [39:0] CMD_OUT;
output ACK_OUT;
output REQ_OUT;
output [7:0] STATUS;
output reg cmd_oe_o; 
output reg cmd_out_o;
output reg [1:0] st_dat_t;
//---------------Input ports Data Type------  
wire SD_CLK_IN;
wire RST_IN;
wire [15:0] SETTING_IN;
wire [39:0] CMD_IN;
wire REQ_IN;
wire ACK_IN;

//---------------Output ports Data Type------  
reg  [39:0] CMD_OUT;
wire ACK_OUT  ;
reg  [7:0] STATUS;
reg  REQ_OUT;

//-------------Internal Constant-------------

  `define INIT_DELAY 64
  
`define NCR 2 
parameter SEND_SIZE = 48;
parameter SIZE = 10;
parameter CONTENT_SIZE = 40;
parameter 
    INIT   =  10'b0000_0000_01,
    IDLE   =  10'b0000_0000_10,
    WRITE_WR	    =  10'b0000_0001_00,
    DLY_WR       =  10'b0000_0010_00,
    READ_WR      =  10'b0000_0100_00,
	  DLY_READ    	=  10'b0000_1000_00, 
 	  ACK_WR		     =  10'b0001_0000_00, 
	  WRITE_WO	    =  10'b0010_0000_00, 
	  DLY_WO	      =  10'b0100_0000_00, 
	  ACK_WO	      =  10'b1000_0000_00;
parameter Read_Delay = 7;	
parameter EIGHT_PAD = 8;
//---------------Internal variable----------- 
//-Internal settings/buffers
reg [6:0] Response_Size;
reg [2:0] Delay_Cycler;
reg [CONTENT_SIZE-1:0] In_Buff; 
reg [39:0] Out_Buff;
//-Internal State input
reg Write_Read;
reg Write_Only; 

//-CRC
reg [4:0] word_select_counter;
reg CRC_RST;
reg [6:0]CRC_IN;
wire [6:0] CRC_VAL; 
reg CRC_Enable;
reg CRC_OUT;
reg CRC_Check_On;
reg Crc_Buffering;
reg CRC_Valid;
//-Internal Counterns
  //6 bit sent counter
reg [7:0]Cmd_Cnt; //8 bit recive counter
reg [2:0]Delay_Cnt; //3 bit Delay counter
//-State Variable
reg [SIZE-1:0] state;
reg [SIZE-1:0] next_state;
//Misc
`define Vector_Index  (CONTENT_SIZE-1-Cmd_Cnt) 
`define Bit_Nr (SEND_SIZE-Cmd_Cnt)
	
//TRI-STATE
reg block_write;
reg block_read;


//
reg [1:0]word_select;
reg FSM_ACK;
reg DECODER_ACK;

reg q;
reg Req_internal_in;
reg q1;
reg Ack_internal_in;
//------------------------------------------   
sd_crc_7 CRC_7( 
CRC_OUT,
CRC_Enable,
SD_CLK_IN,
CRC_RST,
CRC_VAL);
//------------------------------------------  
always @ (state or Delay_Cnt or Write_Read or Cmd_Cnt or Write_Only or Ack_internal_in or  cmd_dat_i or Response_Size or Delay_Cycler)
begin : FSM_COMBO
 next_state  = 0;   
case(state)  
INIT: begin
  if (Cmd_Cnt >= `INIT_DELAY )begin
     next_state = IDLE;
  end
 
  else begin
     
      next_state = INIT;
  end
  
end

                                                
IDLE: begin        
	 if (Write_Read ) begin 
        next_state = WRITE_WR;
      end   
      else if (Write_Only  ) begin
        next_state = WRITE_WO;
      end
      else begin
         next_state = IDLE;
      end
end
WRITE_WR: 
      if (Cmd_Cnt >=SEND_SIZE-1) begin
        next_state = DLY_WR;
      end      
      else begin
        next_state = WRITE_WR; 
      end 
WRITE_WO: 
      if (Cmd_Cnt >= SEND_SIZE-1) begin
        next_state = DLY_WO;
      end      
      else begin
        next_state = WRITE_WO; 
      end 	  
DLY_WR : 
      if ( (Delay_Cnt >= `NCR) && ( !cmd_dat_i)) begin
        next_state = READ_WR;
      end      
      else begin
        next_state = DLY_WR; 
      end 	  
DLY_WO :
       if (Delay_Cnt >= Delay_Cycler) begin
        next_state = ACK_WO;
      end      
      else begin
        next_state = DLY_WO; 
      end 
READ_WR : 
      if (Cmd_Cnt >= (Response_Size+EIGHT_PAD)) begin
        next_state = DLY_READ;
      end      
      else begin
        next_state = READ_WR; 
      end 
		
ACK_WO : 
      next_state = IDLE; 
             
DLY_READ :
     if (Ack_internal_in ) begin
        next_state = ACK_WR;
      end      
      else begin
        next_state = DLY_READ; 
      end 	  
      
ACK_WR  :
        next_state = IDLE; 


default : next_state  = INIT;
 
 endcase     
end 
  //----
    	 
always @ (posedge SD_CLK_IN or posedge RST_IN)
begin : REQ_SYNC
	if  (RST_IN ) begin
		Req_internal_in <=1'b0;
		q <=1'b0;
	end
	else begin  
		q<=REQ_IN;
		Req_internal_in<=q;
	end


end

always @ (posedge SD_CLK_IN or posedge RST_IN)
begin :ACK_SYNC
	if  (RST_IN ) begin
		Ack_internal_in <=1'b0;
		q1 <=1'b0;
	end
	else begin  
		q1<=ACK_IN;
		Ack_internal_in<=q1;
	end


end





		 
		 
always @ (posedge SD_CLK_IN or posedge RST_IN )
  begin:COMMAND_DECODER
  if (RST_IN ) begin
		  Delay_Cycler <=3'b0;
		  Response_Size <=7'b0; 
		  DECODER_ACK <= 1;
		  Write_Read<=1'b0;
	    Write_Only<=1'b0;
	    CRC_Check_On <=0;
	    In_Buff <=0;
	    block_write<=0;
	    block_read <=0;
	    word_select<=0;
   end
   else begin
			if (Req_internal_in == 1) begin
				Response_Size[6:0] <=  SETTING_IN [6:0];
				CRC_Check_On <= SETTING_IN [7];
				Delay_Cycler[2:0] <= SETTING_IN [10:8];
				block_write <= SETTING_IN [11];
				block_read <= SETTING_IN [12];
				word_select <=SETTING_IN [14:13];
				In_Buff <= CMD_IN;
				DECODER_ACK<=0;	
				if (SETTING_IN [6:0]>0) begin
				   Write_Read<=1'b1;
				   Write_Only<=1'b0;
				end
				else begin
					Write_Read<=1'b0;
				  Write_Only<=1'b1;
				end
			end
			else begin
				Write_Read<=1'b0;
				Write_Only<=1'b0;
				DECODER_ACK <= 1;			
			end	
    end
 end
//End block COMMAND_DECODER  

//-------Function for Combo logic-----------------



assign ACK_OUT = FSM_ACK & DECODER_ACK;

//----------------Seq logic------------
always @ (posedge SD_CLK_IN or posedge RST_IN   )
begin : FSM_SEQ
  if (RST_IN ) begin
    state <= #1 INIT;
 end 

 else begin
    state <= #1 next_state;
 end
end

//-------------OUTPUT_LOGIC-------
always @ (posedge SD_CLK_IN or posedge RST_IN   )
begin : FSM_OUT
 if (RST_IN ) begin    
	    CRC_Enable=0;
	    word_select_counter<=0;
	    Delay_Cnt =0;
	   	cmd_oe_o=1; 		
	    cmd_out_o = 1;  
	  	 Out_Buff =0;
	   	FSM_ACK=1;
		REQ_OUT =0;
		  CRC_RST =1;
		  CRC_OUT =0;
		  CRC_IN =0;
		  CMD_OUT =0;	
	   	Crc_Buffering =0; 
	   	STATUS = 0;
	   	CRC_Valid=0;
	   	Cmd_Cnt=0;
	   	st_dat_t<=0;
	   
   	
 end 
 else begin
  case(state)
	INIT : begin
		Cmd_Cnt=Cmd_Cnt+1;
		cmd_oe_o=1; 		
		cmd_out_o = 1;  
	end
    
	IDLE : begin
		cmd_oe_o=0;      //Put CMD to Z  
		Delay_Cnt =0;
		Cmd_Cnt =0;
		CRC_RST =1;
		CRC_Enable=0; 
		CMD_OUT=0;
		st_dat_t<=0;
		word_select_counter<=0;		   
	end  
	
	WRITE_WR:   begin 
	   FSM_ACK=0;
       CRC_RST =0;
	   CRC_Enable=1;  
     
   
    
     if (Cmd_Cnt==0) begin
       STATUS = 16'b0000_0000_0000_0001;
       REQ_OUT=1;
     end 
     else if (Ack_internal_in) begin
       REQ_OUT=0;
     end 
         
        //Wait one cycle before sending, for setting up the CRC unit.
     if (Crc_Buffering==1)  begin
        cmd_oe_o =1;
        if (`Bit_Nr > 8 ) begin  // 1->40 CMD, (41 >= CNT && CNT <=47) CRC, 48 stop_bit
				   cmd_out_o = In_Buff[`Vector_Index]; 
				   if (`Bit_Nr > 9 ) begin //1 step ahead
			       CRC_OUT = In_Buff[`Vector_Index-1];
			     end else begin
			       CRC_Enable=0;  
				   end    
			  end
			  else if ( (`Bit_Nr <=8) && (`Bit_Nr >=2) ) begin			 	
				  CRC_Enable=0; 
				  cmd_out_o = CRC_VAL[(`Bit_Nr)-2];	
				  
		    	  if (block_read & block_write)
		    	    st_dat_t<=2'b11;
		    	  else  if  (block_read)
		    	    st_dat_t<=2'b10;    				
			  end
			  else begin        
				  cmd_out_o =1'b1;
			  end		
			  Cmd_Cnt = Cmd_Cnt+1 ;
		end		
	  else begin //Pre load CRC
		    Crc_Buffering=1;
	   	  CRC_OUT = In_Buff[`Vector_Index];
	  end	  
 	end 	

	WRITE_WO:  begin 
	   FSM_ACK=0;
     CRC_RST =0;
	   CRC_Enable=1;  
         
    
     if (Cmd_Cnt==0) begin
       STATUS[3:0] = 16'b0000_0000_0000_0010;
       REQ_OUT=1;
     end 
     else if (Ack_internal_in) begin
       REQ_OUT=0;
     end 
       
    
        
        //Wait one cycle before sending, for setting up the CRC unit.
     if (Crc_Buffering==1)  begin
        cmd_oe_o =1;  
        if (`Bit_Nr > 8 ) begin  // 1->40 CMD, (41 >= CNT && CNT <=47) CRC, 48 stop_bit
			     cmd_out_o = In_Buff[`Vector_Index]; 
			     if (`Bit_Nr > 9 ) begin //1 step ahead
			        CRC_OUT = In_Buff[`Vector_Index-1];
			     end 
           else begin
			        CRC_Enable=0;  
			     end    
		    end
		    else if( (`Bit_Nr <=8) && (`Bit_Nr >=2) ) begin			 	
			     CRC_Enable=0; 
		       cmd_out_o = CRC_VAL[(`Bit_Nr)-2];	
		       if  (block_read)
		    	    st_dat_t<=2'b10;			
		    end		 
	  	   else begin        
		  	    cmd_out_o =1'b1;
		    end		
			  Cmd_Cnt = Cmd_Cnt+1;	
		end		
		else begin //Pre load CRC
		   Crc_Buffering=1;
	   	 CRC_OUT = In_Buff[`Vector_Index];
	  end	  
 	end 	
	
	DLY_WR :  begin 
	   if (Delay_Cnt==0) begin
         STATUS[3:0] = 4'b0011;
         REQ_OUT=1;
      end  
      else if (Ack_internal_in) begin
       REQ_OUT=0;
     end      
		  CRC_Enable=0;
		  CRC_RST =1;
		  Cmd_Cnt = 1; 
		  cmd_oe_o=0; 	
		  if (Delay_Cnt<3'b111)
		    Delay_Cnt =Delay_Cnt+1;  
		  Crc_Buffering=0;
    end
	
    DLY_WO :  begin  
      if (Delay_Cnt==0) begin
         STATUS[3:0] = 4'b0100;
         STATUS[5] = 0;
         STATUS[6] = 1;
         REQ_OUT=1;
      end  
      else if (Ack_internal_in) begin
       REQ_OUT=0;
     end   
		  CRC_Enable=0;
		  CRC_RST =1;
		  Cmd_Cnt = 0; 
		  cmd_oe_o=0;
	    Delay_Cnt =Delay_Cnt+1;  
	    Crc_Buffering=0;     
    end	
    
    READ_WR :  begin
      Delay_Cnt =0;
      CRC_RST =0;
	    CRC_Enable=1;        
      cmd_oe_o =0;
      
	   if (Cmd_Cnt==1) begin
       STATUS[3:0] = 16'b0000_0000_0000_0101;
       REQ_OUT=1;
       Out_Buff[39]=0; //startbit (0)
     end 
     else if (Ack_internal_in) begin
       REQ_OUT=0;
     end  
	     
	     
	     
      if (Cmd_Cnt < (Response_Size))begin
        
        if (Cmd_Cnt<8 ) //1+1+6 (S,T,Index)          
          Out_Buff[39-Cmd_Cnt] = cmd_dat_i; 
        else begin
          
          if (word_select == 2'b00) begin
            if(Cmd_Cnt<40) begin
		          word_select_counter<= word_select_counter+1;
		          Out_Buff[31-word_select_counter] = cmd_dat_i;
		         end 
		      end    
          else if (word_select == 2'b01) begin
            if ( (Cmd_Cnt>=40) && (Cmd_Cnt<72) )begin
		          word_select_counter<= word_select_counter+1;
		          Out_Buff[31-word_select_counter] = cmd_dat_i;
		         end 
		      
		      end 
          else if  (word_select == 2'b10) begin
           if ( (Cmd_Cnt>=72) && (Cmd_Cnt<104) )begin
		          word_select_counter<= word_select_counter+1;
		          Out_Buff[31-word_select_counter] = cmd_dat_i;
		         end 
		      end	     
          else if  (word_select == 2'b11) begin
           if ( (Cmd_Cnt>=104) && (Cmd_Cnt<128) )begin
		          word_select_counter<= word_select_counter+1;
		          Out_Buff[31-word_select_counter] = cmd_dat_i;
		         end 
		      end	  
          
          
		    end
		    CRC_OUT = cmd_dat_i;  
		        
      end       
      else if ( Cmd_Cnt - Response_Size <=6 ) begin
			  CRC_IN [(Response_Size+6)-(Cmd_Cnt)] = cmd_dat_i;
			  CRC_Enable=0;  
      end
      else begin
			   if ((CRC_IN != CRC_VAL) && ( CRC_Check_On == 1)) begin
				   CRC_Valid=0;	
				   CRC_Enable=0;			  			
		    	end  
		    	else begin
		    	CRC_Valid=1;
		    	CRC_Enable=0;
		    	end 
		    	if (block_read & block_write)
		    	    st_dat_t<=2'b11;
		    	else if (block_write)
		    	  st_dat_t<=2'b01;
		    	 
      end        
       Cmd_Cnt = Cmd_Cnt+1;
   end
    
   DLY_READ:  begin
     
     if (Delay_Cnt==0) begin
       STATUS[3:0] = 4'b0110;
       STATUS[5] = CRC_Valid;
       STATUS[6] = 1;
       REQ_OUT=1;
     end 
     else if (Ack_internal_in) begin
       REQ_OUT=0;
     end  
        
		  CRC_Enable=0;
		  CRC_RST =1;
		  Cmd_Cnt = 0; 		 
		  cmd_oe_o=0; 
      
      CMD_OUT[39:0]=Out_Buff;
		  Delay_Cnt =Delay_Cnt+1;       
    end	
    
	ACK_WO:  begin    
		  FSM_ACK=1;
    end	
	
	ACK_WR:  begin    
		  FSM_ACK=1;
		  REQ_OUT =0;	
		
    end	
	
   endcase
  end
end
  
  
endmodule


`include "sd_defines.v"
module sd_controller_wb(
  wb_clk_i, wb_rst_i, wb_dat_i, wb_dat_o, 

  // WISHBONE slave
  wb_adr_i, wb_sel_i, wb_we_i, wb_cyc_i, wb_stb_i, wb_ack_o, 

  // WISHBONE master

 
  we_m_tx_bd, new_cmd,
  we_m_rx_bd, 
  we_ack, int_ack, cmd_int_busy,
  Bd_isr_reset,
  normal_isr_reset,
  error_isr_reset,
  int_busy,
  dat_in_m_tx_bd,
  dat_in_m_rx_bd,
  write_req_s,
  cmd_set_s,
  cmd_arg_s,
  argument_reg,
  cmd_setting_reg,
  status_reg,
  cmd_resp_1,
  software_reset_reg,
  time_out_reg,
  normal_int_status_reg,
  error_int_status_reg,
  normal_int_signal_enable_reg,
  error_int_signal_enable_reg,
  clock_divider,
  Bd_Status_reg,
  Bd_isr_reg,
  Bd_isr_enable_reg
  );
  
  // WISHBONE common
input           wb_clk_i;     // WISHBONE clock
input           wb_rst_i;     // WISHBONE reset
input   [31:0]  wb_dat_i;     // WISHBONE data input
output reg [31:0]  wb_dat_o;     // WISHBONE data output
     // WISHBONE error output

// WISHBONE slave
input   [7:0]  wb_adr_i;     // WISHBONE address input
input    [3:0]  wb_sel_i;     // WISHBONE byte select input
input           wb_we_i;      // WISHBONE write enable input
input           wb_cyc_i;     // WISHBONE cycle input
input           wb_stb_i;     // WISHBONE strobe input

output reg         wb_ack_o;     // WISHBONE acknowledge output


  
output reg we_m_tx_bd;

output reg new_cmd;
output reg we_ack; //CMD acces granted 
output reg int_ack; //Internal Delayed Ack;
output reg cmd_int_busy;

output reg we_m_rx_bd; //Write enable Master side Rx_bd
  //Read enable Master side Rx_bd
output reg int_busy;
input write_req_s;
input wire [15:0] cmd_set_s;
input wire [31:0] cmd_arg_s;


//
`define SUPPLY_VOLTAGE_3_3
`define SD_CARD_2_0

//Register Addreses 
`define argument 8'h00
`define command 8'h04
`define status 8'h08
`define resp1 8'h0c
`define controller 8'h1c
`define block 8'h20
`define power 8'h24
`define software 8'h28
`define timeout 8'h2c  
`define normal_isr 8'h30   
`define error_isr 8'h34  
`define normal_iser 8'h38
`define error_iser 8'h3c
`define capa 8'h48
`define clock_d 8'h4c
`define bd_status 8'h50
`define bd_isr 8'h54 
`define bd_iser 8'h58 
`define bd_rx 8'h60  
`define bd_tx 8'h80  



`ifdef SUPPLY_VOLTAGE_3_3
   parameter power_controll_reg  = 8'b0000_111_1;
`elsif SUPPLY_VOLTAGE_3_0
   parameter power_controll_reg  = 8'b0000_110_1;
`elsif SUPPLY_VOLTAGE_1_8
   parameter power_controll_reg  = 8'b0000_101_1;
`endif 

parameter block_size_reg = `BLOCK_SIZE ; //512-Bytes

`ifdef SD_BUS_WIDTH_4
     parameter controll_setting_reg =16'b0000_0000_0000_0010;
`else  
     parameter controll_setting_reg =16'b0000_0000_0000_0000;
`endif
     parameter capabilies_reg =16'b0000_0000_0000_0000;
   
//Buss accessible registers    
output reg [31:0] argument_reg;
output reg [15:0] cmd_setting_reg;
input  wire [15:0] status_reg;
input wire [31:0] cmd_resp_1;
output reg [7:0] software_reset_reg; 
output reg [15:0] time_out_reg;   
input wire [15:0]normal_int_status_reg; 
input wire [15:0]error_int_status_reg;
output reg [15:0]normal_int_signal_enable_reg;
output reg [15:0]error_int_signal_enable_reg;
output reg [7:0] clock_divider;
input  wire [15:0] Bd_Status_reg;   
input  wire [7:0] Bd_isr_reg;
output reg [7:0] Bd_isr_enable_reg;

//Register Controll
output reg Bd_isr_reset;
output reg normal_isr_reset;
output reg error_isr_reset;
output reg [`RAM_MEM_WIDTH-1:0] dat_in_m_rx_bd; //Data in to Rx_bd from Master
output reg [`RAM_MEM_WIDTH-1:0] dat_in_m_tx_bd;


//internal reg
reg [1:0] we;


always @(posedge wb_clk_i or posedge wb_rst_i)
	begin
	  we_m_rx_bd <= 0;
   	we_m_tx_bd <= 0;
	  new_cmd<= 1'b0 ;
	  we_ack <= 0;
	  int_ack =  1;
	  cmd_int_busy<=0;
     if ( wb_rst_i )begin
	    argument_reg <=0;
      cmd_setting_reg <= 0;
	    software_reset_reg <= 0;
	    time_out_reg <= 0;
	    normal_int_signal_enable_reg <= 0;
	    error_int_signal_enable_reg <= 0;	  
	    clock_divider <=`RESET_CLK_DIV;
	    int_ack=1 ;
	    we<=0;
	    int_busy <=0;
	    we_ack <=0;
	    wb_ack_o=0;
	    cmd_int_busy<=0;
	    Bd_isr_reset<=0;
	    dat_in_m_tx_bd<=0;
	    dat_in_m_rx_bd<=0;
	    Bd_isr_enable_reg<=0;
	    normal_isr_reset<=0;
	    error_isr_reset<=0;
	  end
	  else if ((wb_stb_i  & wb_cyc_i) || wb_ack_o )begin 
	    Bd_isr_reset<=0; 
	     normal_isr_reset<=  0;
	    error_isr_reset<=  0;
	    if (wb_we_i) begin
	      case (wb_adr_i) 
	        `argument: begin  
	            argument_reg  <=  wb_dat_i;
	            new_cmd <=  1'b1 ;	            
	         end
	        `command : begin 
	            cmd_setting_reg  <=  wb_dat_i;
	            int_busy <= 1;
	        end
          `software : software_reset_reg <=  wb_dat_i;
          `timeout : time_out_reg  <=  wb_dat_i;
          `normal_iser : normal_int_signal_enable_reg <=  wb_dat_i;
          `error_iser : error_int_signal_enable_reg  <=  wb_dat_i;
          `normal_isr : normal_isr_reset<=  1;
          `error_isr:  error_isr_reset<=  1;
	        `clock_d: clock_divider  <=  wb_dat_i;
	        `bd_isr: Bd_isr_reset<=  1;	    
	        `bd_iser : Bd_isr_enable_reg <= wb_dat_i ;     
	        `ifdef RAM_MEM_WIDTH_32
	          `bd_rx: begin
	             we <= we+1;	           
	             we_m_rx_bd <= 1;
	             int_ack =  0;	
	           if  (we[1:0]==2'b00)
	             we_m_rx_bd <= 0;
	           else if  (we[1:0]==2'b01) 
	            dat_in_m_rx_bd <=  wb_dat_i;	                   
	           else begin
	              int_ack =  1; 
	              we<= 0;
	              we_m_rx_bd <= 0;
	            end
	           
	        end
	        `bd_tx: begin
	           we <= we+1;	           
	           we_m_tx_bd <= 1;
	           int_ack =  0;	
	           if  (we[1:0]==2'b00)
	             we_m_tx_bd <= 0;
	           else if  (we[1:0]==2'b01) 
	            dat_in_m_tx_bd <=  wb_dat_i;                   
	           else begin
	             int_ack =  1; 
	              we<= 0;
	              we_m_tx_bd <= 0;
	            end
	        end
	        
	        `endif
	        `ifdef RAM_MEM_WIDTH_16
	        `bd_rx: begin
	             we <= we+1;	           
	             we_m_rx_bd <= 1;
	             int_ack =  0;	
	           if  (we[1:0]==2'b00)
	             we_m_rx_bd <= 0;
	           else if  (we[1:0]==2'b01) 
	            dat_in_m_rx_bd <=  wb_dat_i[15:0];	                    
	           else if ( we[1:0]==2'b10) 
	             dat_in_m_rx_bd <=  wb_dat_i[31:16];	            
	           else begin
	             int_ack =  1; 
	              we<= 0;
	              we_m_rx_bd <= 0;
	            end
	           
	        end
	        `bd_tx: begin
	           we <= we+1;	           
	           we_m_tx_bd <= 1;
	           int_ack =  0;	
	           if  (we[1:0]==2'b00)
	             we_m_tx_bd <= 0;
	           else if  (we[1:0]==2'b01) 
	            dat_in_m_tx_bd <=  wb_dat_i[15:0];	                    
	           else if ( we[1:0]==2'b10) 
	             dat_in_m_tx_bd <=  wb_dat_i[31:16];	            
	           else begin
	             int_ack =  1; 
	              we<= 0;
	              we_m_tx_bd <= 0;
	            end
	        end
	        `endif
	        
	      endcase
	    end     	     
	wb_ack_o =   wb_cyc_i & wb_stb_i & ~wb_ack_o & int_ack; 
	 end
	    else if (write_req_s) begin
	       new_cmd <=  1'b1 ; 
	       cmd_setting_reg <=   cmd_set_s; 
	       argument_reg  <=  cmd_arg_s ; 
	       cmd_int_busy<=  1; 
	       we_ack <= 1;
	    end  
	 
	 if (status_reg[0])
	    int_busy <=  0; 
	  
	//wb_ack_o =   wb_cyc_i & wb_stb_i & ~wb_ack_o & int_ack; 
end

always @(posedge wb_clk_i )begin
   if (wb_stb_i  & wb_cyc_i) begin //CS
      case (wb_adr_i)
	         `argument:  wb_dat_o  <=   argument_reg ;
	         `command : wb_dat_o <=  cmd_setting_reg ;
	         `status : wb_dat_o <=  status_reg ;
           `resp1 : wb_dat_o <=  cmd_resp_1 ;   
           
           `controller : wb_dat_o <=  controll_setting_reg ;
           `block :  wb_dat_o <=  block_size_reg ;
           `power : wb_dat_o <=  power_controll_reg ;
           `software : wb_dat_o  <=  software_reset_reg ;
           `timeout : wb_dat_o  <=  time_out_reg ;
           `normal_isr : wb_dat_o <=  normal_int_status_reg ;
           `error_isr : wb_dat_o  <=  error_int_status_reg ;
           `normal_iser : wb_dat_o <=  normal_int_signal_enable_reg ;
           `error_iser : wb_dat_o  <=  error_int_signal_enable_reg ;
            `clock_d : wb_dat_o  <= clock_divider;
	         `capa  : wb_dat_o  <=  capabilies_reg ; 
	         `bd_status : wb_dat_o  <=  Bd_Status_reg; 
	         `bd_isr : wb_dat_o  <=  Bd_isr_reg ; 
	         `bd_iser : wb_dat_o  <=  Bd_isr_enable_reg ; 
	    endcase
	  end 
end

  
  
endmodule
// ==========================================================================
// CRC Generation Unit - Linear Feedback Shift Register implementation
// (c) Kay Gorontzi, GHSi.de, distributed under the terms of LGPL
// https://www.ghsi.de/CRC/index.php?

// https://www.ghsi.de/CRC/index.php?
// =========================================================================
module sd_crc_16(BITVAL, Enable, CLK, RST, CRC);
 input        BITVAL;// Next input bit
   input Enable;
   input        CLK;                           // Current bit valid (Clock)
   input        RST;                             // Init CRC value
   output reg [15:0] CRC;                               // Current output CRC value

   
                     // We need output registers
   wire         inv;
   
   assign inv = BITVAL ^ CRC[15];                   // XOR required?
   
  always @(posedge CLK or posedge RST) begin
		if (RST) begin
			CRC = 0;   
		
        end
      else begin
        if (Enable==1) begin
         CRC[15] = CRC[14];
         CRC[14] = CRC[13];
         CRC[13] = CRC[12];
         CRC[12] = CRC[11] ^ inv;
         CRC[11] = CRC[10];
         CRC[10] = CRC[9];
         CRC[9] = CRC[8];
         CRC[8] = CRC[7];
         CRC[7] = CRC[6];
         CRC[6] = CRC[5];
         CRC[5] = CRC[4] ^ inv;
         CRC[4] = CRC[3];
         CRC[3] = CRC[2];
         CRC[2] = CRC[1];
         CRC[1] = CRC[0];
         CRC[0] = inv;
        end
         end
      end
   
endmodule
module sd_crc_7(BITVAL, Enable, CLK, RST, CRC);
   input        BITVAL;// Next input bit
   input Enable;
   input        CLK;                           // Current bit valid (Clock)
   input        RST;                             // Init CRC value
   output [6:0] CRC;                               // Current output CRC value

   reg    [6:0] CRC;   
                     // We need output registers
   wire         inv;
   
   assign inv = BITVAL ^ CRC[6];                   // XOR required?
   
   
    always @(posedge CLK or posedge RST) begin
		if (RST) begin
			CRC = 0;   
		
        end
		else begin
			if (Enable==1) begin
				CRC[6] = CRC[5];
				CRC[5] = CRC[4];
				CRC[4] = CRC[3];
				CRC[3] = CRC[2] ^ inv;
				CRC[2] = CRC[1];
				CRC[1] = CRC[0];
				CRC[0] = inv;
			end
		end
     end
   
endmodule

`include "sd_defines.v"

module sd_data_master (
  input clk,
  input rst,
  //Tx Bd
 
  input [`RAM_MEM_WIDTH-1:0] dat_in_tx,
  input [`BD_WIDTH-1:0] free_tx_bd,
  input ack_i_s_tx,
  output reg re_s_tx,
  output reg a_cmp_tx,
  //Rx Bd

  input [`RAM_MEM_WIDTH-1:0] dat_in_rx,
  input [`BD_WIDTH-1:0] free_rx_bd,
  input ack_i_s_rx,
  output reg re_s_rx,
  output reg a_cmp_rx,
  //Input from SD-Host Reg
  input  cmd_busy, //STATUS_REG[0] and mux  
  //Output to SD-Host Reg
  output reg we_req,
  input we_ack,
  output reg d_write,
  output reg d_read,
  output reg [31:0] cmd_arg,
  output reg [15:0] cmd_set,
  input cmd_tsf_err,
  input [4:0] card_status,
  //To fifo filler
  output reg start_tx_fifo,
  output reg start_rx_fifo,
  output reg [31:0] sys_adr,
  input tx_empt,
  input tx_full,
  input rx_full,

  //SD-DATA_Host
  input busy_n     ,
  input transm_complete ,
  input crc_ok,
  output reg ack_transfer, 
  //status output
  output reg  [7:0] Dat_Int_Status ,
  input Dat_Int_Status_rst,
  output reg  CIDAT,
  input [1:0] transfer_type
  
    
  );
`define RESEND_MAX_CNT 3
      `define READ_CYCLE 4
       reg [2:0] bd_cnt;
       `define BD_EMPTY (`BD_SIZE  /4) 

reg send_done;
reg rec_done;
reg rec_failed;
reg tx_cycle;
reg rx_cycle;
reg [2:0] resend_try_cnt;

parameter CMD24 = 16'h181A ; // 011000 0001 1010
parameter CMD17 = 16'h111A; //  010001 0001 1010
parameter CMD12 = 16'hC1A ; //  001100 0001 1010
parameter ACMD13 = 16'hD1A ; // 001101 0001 1010  //SD STATUS
parameter ACMD51 = 16'h331A ; //110011 0001 1010 //SCR Register

parameter SIZE = 9;
reg [SIZE-1:0] state;
reg [SIZE-1:0] next_state;  
parameter IDLE             =  9'b000000001;
parameter GET_TX_BD        =  9'b000000010;
parameter GET_RX_BD        =  9'b000000100;
parameter SEND_CMD         =  9'b000001000;
parameter RECIVE_CMD       =  9'b000010000;
parameter DATA_TRANSFER    =  9'b000100000;
parameter STOP             =  9'b001000000;
parameter STOP_SEND        =  9'b010000000;
parameter STOP_RECIVE_CMD  =  9'b100000000;

reg trans_done;
reg trans_failed;
reg internal_transm_complete;
reg transm_complete_q;

always @ (posedge clk or posedge rst )
begin
	if  (rst) begin
		internal_transm_complete <=1'b0;
		transm_complete_q<=0;
	end
	else begin  
		transm_complete_q<=transm_complete;
		internal_transm_complete<=transm_complete_q;
	end


end




always @ (state or resend_try_cnt or tx_full or free_tx_bd or free_rx_bd or bd_cnt or send_done or rec_done or rec_failed or trans_done or trans_failed)
begin : FSM_COMBO
 next_state  = 0;   
case(state)  
  
  IDLE: begin
   if (free_tx_bd !=`BD_EMPTY)begin
      next_state = GET_TX_BD;
   end
   else if (free_rx_bd !=`BD_EMPTY) begin
      next_state = GET_RX_BD;
   end  
   else begin
      next_state = IDLE;
   end
  end
  GET_TX_BD: begin
    if ( ( bd_cnt> `READ_CYCLE-1) && (tx_full==1) )begin
     next_state = SEND_CMD;
    end   
    else begin
     next_state = GET_TX_BD;
    end
  end   
  
  GET_RX_BD: begin  
    if (bd_cnt >= (`READ_CYCLE-1))begin
     next_state = SEND_CMD;
    end   
    else begin
     next_state = GET_RX_BD;
    end
  end
  
  SEND_CMD: begin 
   if (send_done)begin
     next_state = RECIVE_CMD;
    end   
    else begin
     next_state = SEND_CMD;
    end 
  end
    
  
 RECIVE_CMD: begin 
    if (rec_done)
      next_state = DATA_TRANSFER;       
    else if (rec_failed)
      next_state =  SEND_CMD;
    else 
      next_state = RECIVE_CMD;    
   end 

  DATA_TRANSFER: begin
    if (trans_done)
      next_state = IDLE;
   else if (trans_failed)
      next_state = STOP;
   else
      next_state = DATA_TRANSFER;
   end
  
  STOP: begin 
     next_state = STOP_SEND;     
   end
   
   STOP_SEND: begin
    if (send_done)begin
     next_state =IDLE;
    end   
    else begin
     next_state = STOP_SEND;
    end  
   end
   
   STOP_RECIVE_CMD : begin
    if (rec_done)
      next_state = SEND_CMD;       
    else if (rec_failed)
      next_state =  STOP;
    else if (resend_try_cnt>=`RESEND_MAX_CNT)
      next_state = IDLE;
    else 
      next_state = STOP_RECIVE_CMD;    
   end 
 
   
 
 default : next_state  = IDLE; 
 endcase

end

//----------------Seq logic------------
always @ (posedge clk or posedge rst   )
begin : FSM_SEQ
  if (rst ) begin
    state <= #1 IDLE;
 end 
 else begin
    state <= #1 next_state;
 end
end



//Output logic-----------------


always @ (posedge clk or posedge rst   )
begin  
 if (rst) begin
      send_done<=0;
      bd_cnt<=0;
      sys_adr<=0;
      cmd_arg<=0;
      rec_done<=0;
      start_tx_fifo<=0;
      start_rx_fifo<=0;
      send_done<=0;
      rec_failed<=0;
      d_write <=0;  
      d_read <=0;  
      trans_failed<=0;
      trans_done<=0;
      tx_cycle <=0;
      rx_cycle <=0;
      ack_transfer<=0;
      a_cmp_tx<=0;           
      a_cmp_rx<=0;
      CIDAT<=0;
      Dat_Int_Status<=0;
      we_req<=0;
      re_s_tx<=0;
      re_s_rx<=0;
      cmd_set<=0;
      resend_try_cnt=0;
 end
 else begin
  case(state)
     IDLE: begin
      send_done<=0;
      bd_cnt<=0;
      sys_adr<=0;
      cmd_arg<=0;
      rec_done<=0;
      rec_failed<=0;
      start_tx_fifo<=0;
      start_rx_fifo<=0;
      send_done<=0;     
      d_write <=0;  
      d_read <=0; 
      trans_failed<=0;
      trans_done<=0;
      tx_cycle <=0;
      rx_cycle <=0;
      ack_transfer<=0;
      a_cmp_tx<=0;           
      a_cmp_rx<=0;
      resend_try_cnt=0;
     end
     
     GET_RX_BD: begin                 
        //0,1,2,3...
      re_s_rx <= 1;
     `ifdef  RAM_MEM_WIDTH_32
     	if (ack_i_s_rx) begin        
	        if( bd_cnt == 2'b0) begin
	           sys_adr  <= dat_in_rx;
	           bd_cnt <= bd_cnt+1;   
	     	end           
	        else if ( bd_cnt == 2'b1) begin  
	           cmd_arg  <= dat_in_rx;
	           re_s_rx <= 0; 
	        end
	   end
      `endif
      
      
      `ifdef  RAM_MEM_WIDTH_16
      	if (ack_i_s_rx) begin        
	        if( bd_cnt == 2'b00) begin
	           sys_adr [15:0] <= dat_in_rx; 
	        end
	        else if ( bd_cnt == 2'b01)  begin
	           sys_adr [31:16] <= dat_in_rx; 
	        end
	        else if ( bd_cnt == 2) begin
	          cmd_arg [15:0] <= dat_in_rx;
	          re_s_rx <= 0; 
	        end
	        else if ( bd_cnt == 3) begin
	           cmd_arg [31:16] <= dat_in_rx;
	           re_s_rx <= 0;
	         end
	         bd_cnt <= bd_cnt+1;       
	   	end
       `endif
     //Add Later Save last block addres for comparison with current (For multiple block cmd)
     //Add support for Pre-erased
      if (transfer_type==2'b00)
		   cmd_set <= CMD17;
		else if (transfer_type==2'b01)
		   cmd_set <= ACMD13;	 
		else 
      	   cmd_set <= ACMD51;

      rx_cycle<=1;  
     end
          
     GET_TX_BD:  begin             
        //0,1,2,3...
      re_s_tx <= 1;
      if ( bd_cnt == `READ_CYCLE)
        re_s_tx <= 0;
        
       `ifdef  RAM_MEM_WIDTH_32
     	 if (ack_i_s_tx) begin
        
	        if( bd_cnt == 2'b0) begin
	           sys_adr  <= dat_in_tx;
	           bd_cnt <= bd_cnt+1;   
	     	end           
	        else if ( bd_cnt == 2'b1) begin  
	           cmd_arg  <= dat_in_tx;
	           re_s_tx <= 0; 
			   start_tx_fifo<=1;  
        end
	   end
       `endif
      
      `ifdef  RAM_MEM_WIDTH_16
      if (ack_i_s_tx) begin
        
        if( bd_cnt == 0) begin
           sys_adr [15:0] <= dat_in_tx; 
           bd_cnt <= bd_cnt+1;   end
        else if ( bd_cnt == 1)  begin
           sys_adr [31:16] <= dat_in_tx;
           bd_cnt <= bd_cnt+1;    end
        else if ( bd_cnt == 2) begin
          cmd_arg [15:0] <= dat_in_tx;
          re_s_tx <= 0;
          bd_cnt <= bd_cnt+1;    end
        else if ( bd_cnt == 3) begin
           cmd_arg [31:16] <= dat_in_tx;
           re_s_tx <= 0;
           bd_cnt <= bd_cnt+1;
		   start_tx_fifo<=1;  
         end
       end
       `endif
     //Add Later Save last block addres for comparison with current (For multiple block cmd)
     //Add support for Pre-erased
      cmd_set <= CMD24;  
      tx_cycle <=1;   
        
   end  
   
     SEND_CMD : begin  
       rec_done<=0;     
       if (rx_cycle)    begin     
         re_s_rx <=0; 
         d_read<=1;
       end
       else begin
         re_s_tx <=0; 
         d_write<=1;
        end
       start_rx_fifo<=0; //Reset FIFO  
      // start_tx_fifo<=0;  //Reset FIFO 
       if (!cmd_busy) begin
         we_req <= 1;  
         
       end  //When send complete change state and wait for reply
       if (we_ack) begin     
           send_done<=1;
           we_req <= 1;  
          
       end       
    end   
   
   
    RECIVE_CMD : begin
         //When waiting for reply fill TX fifo
        if (rx_cycle)
         start_rx_fifo<=1; //start_fifo prebuffering
       //else
         //start_rx_fifo <=1;
        
         we_req <= 0;  
          
         send_done<=0;
       if (!cmd_busy) begin //Means the sending is completed,
         d_read<=0; 
         d_write<=0;  
         if (!cmd_tsf_err) begin
           if (card_status[0]) begin
               
                if ( (card_status[4:1] == 4'b0100) || (card_status[4:1] == 4'b0110) || (card_status[4:1] == 4'b0101) )
                    rec_done<=1;
                else begin
                    rec_failed<=1;
                    Dat_Int_Status[4] <=1; 
                       start_tx_fifo<=0;  
                end 
                
                 
                                     
               //Check card_status[5:1] for state 4 or 6... 
               //If wrong state change interupt status reg,so software can put card in
               // transfer state and restart/cancel Data transfer
          end
          
         end
         else begin
             rec_failed<=1;  //CRC-Error, CIC-Error or timeout 
                start_tx_fifo<=0;  
                end
       end  
    end
    
    DATA_TRANSFER: begin
       CIDAT<=1;
     if (tx_cycle) begin 
      if (tx_empt) begin
         Dat_Int_Status[2] <=1;
         trans_failed<=1;  
       end
     end
     else begin 
       if (rx_full) begin
         Dat_Int_Status[2] <=1; 
         trans_failed<=1; 
      end
    end            
      //Check for fifo underflow, 
      //2 DO: if deteced stop transfer, reset data host
      if (internal_transm_complete) begin //Transfer complete
         ack_transfer<=1;
        
         if ((!crc_ok) && (busy_n))  begin //Wrong CRC and Data line free.
            Dat_Int_Status[5] <=1; 
            trans_failed<=1;
         end 
         else if ((crc_ok) && (busy_n)) begin //Data Line free
           trans_done <=1;       

			if (tx_cycle) begin
				a_cmp_tx<=1;
				if (free_tx_bd ==`BD_EMPTY-1 )
					Dat_Int_Status[0]<=1;
			end 
			else begin
				a_cmp_rx<=1;                        
				if (free_rx_bd ==`BD_EMPTY-1)
					Dat_Int_Status[0]<=1;
			end
    
 
       end
   
  end
  end
  STOP: begin
    cmd_set <= CMD12;
    rec_done<=0;
    rec_failed<=0;     
    send_done<=0;  
    trans_failed<=0;
    trans_done<=0;    
    d_read<=1; 
    d_write<=1; 
    start_rx_fifo <=0;
    start_tx_fifo <=0;         
     
  end
   STOP_SEND: begin
      resend_try_cnt=resend_try_cnt+1;
      if (resend_try_cnt==`RESEND_MAX_CNT)
          Dat_Int_Status[1]<=1;
      if (!cmd_busy) 
         we_req <= 1;      
      if (we_ack)      
           send_done<=1;    
   end  
  
   STOP_RECIVE_CMD: begin
     we_req <= 0; 
    end
  
  endcase  
  if (Dat_Int_Status_rst)
    Dat_Int_Status<=0;
 end 
  
end  
  
endmodule 


`include "sd_defines.v"


module sd_data_serial_host(
input sd_clk,
input rst,
//Tx Fifo
input [31:0] data_in ,

output reg rd,
//Rx Fifo
output  reg  [`SD_BUS_W-1:0] data_out ,
output reg we,
//tristate data
output reg DAT_oe_o,
output reg[`SD_BUS_W-1:0] DAT_dat_o,
input  [`SD_BUS_W-1:0] DAT_dat_i,
//Controll signals
input [1:0] start_dat,
input ack_transfer,

output reg busy_n,
output reg transm_complete,
output reg crc_ok
);

//CRC16 
reg [`SD_BUS_W-1:0] crc_in;
reg crc_en;
reg crc_rst;
wire [15:0] crc_out [`SD_BUS_W-1:0];
reg  [`SD_BUS_W-1:0] temp_in;
  
reg [10:0] transf_cnt;
parameter SIZE = 6;
reg [SIZE-1:0] state;
reg [SIZE-1:0] next_state;
parameter IDLE        = 6'b000001;
parameter WRITE_DAT   = 6'b000010;
parameter WRITE_CRC   = 6'b000100;
parameter WRITE_BUSY  = 6'b001000;
parameter READ_WAIT   = 6'b010000;      
parameter READ_DAT    = 6'b100000;
reg [2:0] crc_status; 
reg busy_int;   

genvar i;
generate
for(i=0; i<`SD_BUS_W; i=i+1) begin:CRC_16_gen
  sd_crc_16 CRC_16_i (crc_in[i],crc_en, sd_clk, crc_rst, crc_out[i]);
end
endgenerate

reg ack_transfer_int;
reg ack_q;
always @ (posedge sd_clk or posedge rst   )
begin: ACK_SYNC
if (rst) begin
  ack_transfer_int <=0;
  ack_q<=0;end
else begin
  ack_q<=ack_transfer;
  ack_transfer_int<=ack_q;
  end
end

reg q_start_bit;
always @ (state or start_dat or q_start_bit or  transf_cnt or crc_status or busy_int or DAT_dat_i or ack_transfer_int)
begin : FSM_COMBO
 next_state  = 0;   
case(state)
  IDLE: begin
   if (start_dat == 2'b01) 
      next_state=WRITE_DAT;
    else if  (start_dat == 2'b10) 
      next_state=READ_WAIT;
    else 
      next_state=IDLE;
    end
  WRITE_DAT: begin
    if (transf_cnt >= `BIT_BLOCK) 
       next_state= WRITE_CRC;
   else if (start_dat == 2'b11)
        next_state=IDLE;
    else 
       next_state=WRITE_DAT;
  end

  WRITE_CRC: begin
    if (crc_status ==0) 
       next_state= WRITE_BUSY;
    else 
       next_state=WRITE_CRC;
    
  end
  WRITE_BUSY: begin
      if ( (busy_int ==1)  & ack_transfer_int)
       next_state= IDLE;
    else 
       next_state  = WRITE_BUSY;
  end
  
  READ_WAIT: begin
    if (q_start_bit== 0 ) 
       next_state= READ_DAT;
    else 
       next_state=READ_WAIT;
  end
  
  READ_DAT: begin
    if ( ack_transfer_int)  //Startbit consumed...
       next_state= IDLE;
    else if (start_dat == 2'b11)
        next_state=IDLE;   
    else 
       next_state=READ_DAT;
    end
    
    
    
 
  
 endcase
end 

always @ (posedge sd_clk or posedge rst   )
 begin :START_SYNC
  if (rst ) begin
    q_start_bit<=1;
 end 
 else begin
    if (!DAT_dat_i[0] & state == READ_WAIT)
    q_start_bit <= 0;
    else
    q_start_bit <= 1;
    
 end
end


//----------------Seq logic------------
always @ (posedge sd_clk or posedge rst   )
begin : FSM_SEQ
  if (rst ) begin
    state <= #1 IDLE;
 end 
 else begin
    state <= #1 next_state;
 end
end

reg [4:0] crc_c;
reg [3:0] last_din;
reg [2:0] crc_s ;
reg [31:0] write_buf_0,write_buf_1, sd_data_out;
reg out_buff_ptr,in_buff_ptr;
reg [2:0] data_send_index;
         
always @ (negedge sd_clk or posedge rst   )
begin  : FSM_OUT
 if (rst) begin
write_buf_0<=0;
write_buf_1<=0;
   DAT_oe_o<=0;
   crc_en<=0;
   crc_rst<=1;
   transf_cnt<=0;
   crc_c<=15;
   rd<=0;
   last_din<=0;
   crc_c<=0;
   crc_in<=0;
   DAT_dat_o<=0;
   crc_status<=7;
   crc_s<=0;
   transm_complete<=0;
   busy_n<=1;
   we<=0;
   data_out<=0;
   crc_ok<=0;
   busy_int<=0;
     data_send_index<=0;
        out_buff_ptr<=0;
        in_buff_ptr<=0;
 end
 else begin
 case(state)
   IDLE: begin
      DAT_oe_o<=0;
      DAT_dat_o<=4'b1111;
      crc_en<=0;
      crc_rst<=1;
      transf_cnt<=0;
      crc_c<=16;
      crc_status<=7;
      crc_s<=0;
      we<=0;
      rd<=0;
      busy_n<=1;
        data_send_index<=0;
        out_buff_ptr<=0;
        in_buff_ptr<=0;
     
   end
   WRITE_DAT: begin    
      transm_complete <=0;  
      busy_n<=0;
      crc_ok<=0;
      transf_cnt<=transf_cnt+1; 
       rd<=0; 
       
      
        
      if ( (in_buff_ptr != out_buff_ptr) ||  (!transf_cnt) ) begin
        rd <=1;           
       if (!in_buff_ptr)
         write_buf_0<=data_in;         
       else
        write_buf_1 <=data_in;    
        
       in_buff_ptr<=in_buff_ptr+1;
     end
     
      if (!out_buff_ptr)
        sd_data_out<=write_buf_0;
      else
       sd_data_out<=write_buf_1;
        
        if (transf_cnt==1) begin
          
          crc_rst<=0;
          crc_en<=1;
          `ifdef LITLE_ENDIAN 
          	last_din <=write_buf_0[3:0]; 
          	crc_in<= write_buf_0[3:0]; 
          `endif
          `ifdef BIG_ENDIAN 
          	last_din <=write_buf_0[31:28]; 
          	crc_in<= write_buf_0[31:28]; 
          `endif
          
          DAT_oe_o<=1;  
          DAT_dat_o<=0;
          
          data_send_index<=1;    
        end
        else if ( (transf_cnt>=2) && (transf_cnt<=`BIT_BLOCK-`CRC_OFF )) begin                 
          DAT_oe_o<=1;    
        case (data_send_index) 
          `ifdef LITLE_ENDIAN 
           0:begin 
              last_din <=sd_data_out[3:0];
              crc_in <=sd_data_out[3:0];
           end
           1:begin 
              last_din <=sd_data_out[7:4];
              crc_in <=sd_data_out[7:4];
           end
           2:begin 
              last_din <=sd_data_out[11:8];
              crc_in <=sd_data_out[11:8];
           end
           3:begin 
              last_din <=sd_data_out[15:12];
              crc_in <=sd_data_out[15:12];
           end
           4:begin 
              last_din <=sd_data_out[19:16];
              crc_in <=sd_data_out[19:16];
           end
           5:begin 
              last_din <=sd_data_out[23:20];
              crc_in <=sd_data_out[23:20];
           end
           6:begin 
              last_din <=sd_data_out[27:24];
              crc_in <=sd_data_out[27:24];
              out_buff_ptr<=out_buff_ptr+1;
           end
           7:begin 
              last_din <=sd_data_out[31:28];
              crc_in <=sd_data_out[31:28];              
           end
          `endif  
          `ifdef BIG_ENDIAN 
           0:begin 
              last_din <=sd_data_out[31:28];
              crc_in <=sd_data_out[31:28];
           end
           1:begin 
              last_din <=sd_data_out[27:24];
              crc_in <=sd_data_out[27:24];
           end
           2:begin 
              last_din <=sd_data_out[23:20];
              crc_in <=sd_data_out[23:20];
           end
           3:begin 
              last_din <=sd_data_out[19:16];
              crc_in <=sd_data_out[19:16];
           end
           4:begin 
              last_din <=sd_data_out[15:12];
              crc_in <=sd_data_out[15:12];
           end
           5:begin 
              last_din <=sd_data_out[11:8];
              crc_in <=sd_data_out[11:8];
           end
           6:begin 
              last_din <=sd_data_out[7:4];
              crc_in <=sd_data_out[7:4];
              out_buff_ptr<=out_buff_ptr+1;
           end
           7:begin 
              last_din <=sd_data_out[3:0];
              crc_in <=sd_data_out[3:0];              
           end
          `endif  
          
           
         endcase 
          data_send_index<=data_send_index+1;
                   
          DAT_dat_o<= last_din; 
          
            
                    
          if ( transf_cnt >=`BIT_BLOCK-`CRC_OFF ) begin
             crc_en<=0;             
         end
       end
       else if (transf_cnt>`BIT_BLOCK-`CRC_OFF & crc_c!=0) begin
        rd<=0;
         crc_en<=0;
         crc_c<=crc_c-1;      
         DAT_oe_o<=1; 
         DAT_dat_o[0]<=crc_out[0][crc_c-1];
         DAT_dat_o[1]<=crc_out[1][crc_c-1];
         DAT_dat_o[2]<=crc_out[2][crc_c-1];
         DAT_dat_o[3]<=crc_out[3][crc_c-1];         
       end
       else if (transf_cnt==`BIT_BLOCK-2) begin
          DAT_oe_o<=1; 
          DAT_dat_o<=4'b1111;
           rd<=0;
      end   
       else if (transf_cnt !=0) begin
         DAT_oe_o<=0; 
         rd<=0;
         end
   end
   WRITE_CRC : begin
      rd<=0;
      DAT_oe_o<=0; 
      crc_status<=crc_status-1;
      if  (( crc_status<=4) && ( crc_status>=2) )
      crc_s[crc_status-2] <=DAT_dat_i[0];    
   end
   WRITE_BUSY : begin
       transm_complete <=1;
     if (crc_s == 3'b010) 
       crc_ok<=1;     
     else 
       crc_ok<=0;  
            
       busy_int<=DAT_dat_i[0];
    
      
   end
   READ_WAIT:begin
      DAT_oe_o<=0;
      crc_rst<=0;
      crc_en<=1;
      crc_in<=0; 
      crc_c<=15;// end 
      busy_n<=0;
      transm_complete<=0; 
   end
   
   READ_DAT: begin
     
       
     if (transf_cnt<`BIT_BLOCK_REC) begin
       we<=1;
     
       data_out<=DAT_dat_i;
       crc_in<=DAT_dat_i;
       crc_ok<=1;
       transf_cnt<=transf_cnt+1; 
              
     end  
     else if  ( transf_cnt <= (`BIT_BLOCK_REC +`BIT_CRC_CYCLE)) begin
       transf_cnt<=transf_cnt+1; 
       crc_en<=0;  
       last_din <=DAT_dat_i; 
       
       if (transf_cnt> `BIT_BLOCK_REC) begin       
        crc_c<=crc_c-1;
          we<=0;
        `ifdef SD_BUS_WIDTH_1
         if  (crc_out[0][crc_status] == last_din[0])
           crc_ok<=0;
        `endif
        
       `ifdef SD_BUS_WIDTH_4
          if  (crc_out[0][crc_c] != last_din[0])
           crc_ok<=0;
          if  (crc_out[1][crc_c] != last_din[1])
           crc_ok<=0;
          if  (crc_out[2][crc_c] != last_din[2])
           crc_ok<=0;
          if  (crc_out[3][crc_c] != last_din[3])
           crc_ok<=0;  
         
        `endif   
         `ifdef SIM
          crc_ok<=1;
       `endif
         if (crc_c==0) begin
          transm_complete <=1;
          busy_n<=0;
           we<=0;
         end
      end
    end  
    
      
        
  end
   
   
  
 endcase 
 
 end

end 
   








//Sync





  
  
endmodule





//Read the documentation before changing values

`define BIG_ENDIAN
//`define LITLE_ENDIAN

`define SIM
//`define SYN

`define SDC_IRQ_ENABLE

`define ACTEL

//`define CUSTOM
//`define ALTERA
//`define XLINX
//`define SIMULATOR

`define RESEND_MAX_CNT 3

//MAX 255 BD
//BD size/4 

`ifdef ACTEL
	`define BD_WIDTH 5
	`define BD_SIZE 32      
	`define RAM_MEM_WIDTH_16
	`define RAM_MEM_WIDTH 16
  
`endif

//`ifdef CUSTOM
 //  `define NR_O_BD_4 
//   `define BD_WIDTH 5
//   `define BD_SIZE 32      
//   `define RAM_MEM_WIDTH_32
//   `define RAM_MEM_WIDTH 32
//`endif



`ifdef SYN
  `define RESET_CLK_DIV 0
  `define MEM_OFFSET 4
`endif

`ifdef SIM
  `define RESET_CLK_DIV 0
  `define MEM_OFFSET 4
`endif

//SD-Clock Defines ---------
//Use bus clock or a seperate clock
`define SDC_CLK_BUS_CLK
//`define SDC_CLK_SEP

// Use of internal clock divider
//`define SDC_CLK_STATIC
`define SDC_CLK_DYNAMIC


//SD DATA-transfer defines---
`define BLOCK_SIZE 512
`define SD_BUS_WIDTH_4
`define SD_BUS_W 4

//at 512 bytes per block, equal 1024 4 bytes writings with a bus width of 4, add 2 for startbit and Z bit.
//Add 18 for crc, endbit and z.
`define BIT_BLOCK 1044
`define CRC_OFF 19
`define BIT_BLOCK_REC 1024
`define BIT_CRC_CYCLE 16


//FIFO defines---------------
`define FIFO_RX_MEM_DEPTH 8
`define FIFO_RX_MEM_ADR_SIZE 4

`define FIFO_TX_MEM_DEPTH 8
`define FIFO_TX_MEM_ADR_SIZE 4
//---------------------------









`include "sd_defines.v"

module sd_fifo_rx_filler
( 
input clk,
input rst,
//WB Signals
output  [31:0]  m_wb_adr_o,

output  reg        m_wb_we_o,

output reg [31:0]  m_wb_dat_o,
output    reg      m_wb_cyc_o,
output   reg       m_wb_stb_o,
input           m_wb_ack_i,
output  reg	[2:0] m_wb_cti_o,
output	reg [1:0]	 m_wb_bte_o,

//Data Master Control signals
input en,
input [31:0] adr,

//Data Serial signals 
input sd_clk,
input [`SD_BUS_W-1:0] dat_i, 
input wr,
output full
//

);
 wire [31:0] dat_o;
reg rd;
reg reset_rx_fifo;
sd_rx_fifo Rx_Fifo (
.d ( dat_i ),
.wr  (  wr ),
.wclk  (sd_clk),
.q ( dat_o),
.rd (rd),
.full (full),
.empty (empty),
.mem_empt (),
.rclk (clk),
.rst  (rst | reset_rx_fifo)
);

//reg [31:0] tmp_dat;
reg [8:0] offset;
assign  m_wb_adr_o = adr+offset;
//assign  m_wb_dat_o = dat_o;

reg wb_free;
always @(posedge clk or posedge rst )begin

 if (rst) begin
  offset<=0;
  m_wb_we_o <=0;
	m_wb_cyc_o <= 0;
	m_wb_stb_o <= 0;
	wb_free<=1;
	m_wb_dat_o<=0;
	rd<=0;
	reset_rx_fifo<=1;
	m_wb_bte_o <= 2'b00;
		m_wb_cti_o <= 3'b000;

 end
 else if (en)  begin//Start filling the RX buffer
    rd<=0;
    reset_rx_fifo<=0;
  if (!empty & wb_free) begin
    rd<=1;
    
    m_wb_dat_o<=#1 dat_o;
    m_wb_we_o <=#1 1;
		m_wb_cyc_o <=#1 1;
		m_wb_stb_o <=#1 1; 
    wb_free<=0;   
  end
  
  if(  !wb_free & m_wb_ack_i) begin
    m_wb_we_o <=0;
		m_wb_cyc_o <= 0;
		m_wb_stb_o <= 0;
		offset<=offset+`MEM_OFFSET;
		wb_free<=1;
	end	 
end
else begin
   reset_rx_fifo<=1;
    rd<=0;
   offset<=0;
    	m_wb_cyc_o <= 0;
			m_wb_stb_o <= 0; 
			m_wb_we_o <=0; 
			wb_free<=1;
  end

end  
endmodule


`include "sd_defines.v"

module sd_fifo_tx_filler
( 
input clk,
input rst,
//WB Signals
output  [31:0]  m_wb_adr_o,

output  reg        m_wb_we_o,
input   [31:0]  m_wb_dat_i,

output    reg      m_wb_cyc_o,
output   reg       m_wb_stb_o,
input           m_wb_ack_i,
output  reg	[2:0] m_wb_cti_o,
output	reg [1:0]	 m_wb_bte_o,

//Data Master Control signals
input en,
input [31:0] adr,


//Data Serial signals 
input sd_clk,
output [31:0] dat_o, 
input rd,
output empty,
output fe
//

);
reg reset_tx_fifo;

reg [31:0] din;
reg wr_tx;
reg [8:0] we;
reg [8:0] offset;
wire [5:0]mem_empt;
sd_tx_fifo Tx_Fifo (
.d ( din ),
.wr  (  wr_tx ),
.wclk  (clk),
.q ( dat_o),
.rd (rd),
.full (fe),
.empty (empty),
.mem_empt (mem_empt),
.rclk (sd_clk),
.rst  (rst | reset_tx_fifo)
);


assign  m_wb_adr_o = adr+offset;


reg first;

reg ackd;
reg delay;

always @(posedge clk or posedge rst )begin
 if (rst) begin
	offset <=0;
	we <= 8'h1;
	m_wb_we_o <=0;
	m_wb_cyc_o <= 0;
	m_wb_stb_o <= 0;
	wr_tx<=0;
	ackd <=1;
	delay<=0;
	reset_tx_fifo<=1;

	first<=1;
	din<=0;
		m_wb_bte_o <= 2'b00;
		m_wb_cti_o <= 3'b000;

			
 end
 else if (en) begin //Start filling the TX buffer
    reset_tx_fifo<=0;
    
	  if (m_wb_ack_i) begin 		  
		  wr_tx <=1;
		  din <=m_wb_dat_i;	
		  					
		  m_wb_cyc_o <= 0;
		  m_wb_stb_o <= 0; 
		  delay<=~ delay;   
		end 
		else begin
			wr_tx <=0;
			
		end
	 
	  if (delay)begin
	     offset<=offset+`MEM_OFFSET;	
	     ackd<=~ackd;
	     delay<=~ delay;
	     wr_tx <=0; 
	  end
	  
		if ( !m_wb_ack_i & !fe & ackd  ) begin //If not full And no Ack  
		  m_wb_we_o <=0;
			m_wb_cyc_o <= 1;
			m_wb_stb_o <= 1; 
			ackd<=0;   
		end 
		
 
 end 
 else begin
   offset <=0;
   reset_tx_fifo<=1;
   m_wb_cyc_o <= 0;
   m_wb_stb_o <= 0; 
   m_wb_we_o <=0; 
		
		
 end 
end 
  
endmodule


// module name
`define MODULE_NAME sd_rx_fifo


module sd_rx_fifo_tb ( );
 
 
   reg [4-1:0] d;
   reg wr;
   reg wclk;
   wire [32-1:0] q;
   reg rd;
   wire fe;
   reg rclk;
   reg rst;
   wire  empty;
   reg [31:0] slask;
   wire [1:0] mem_empt;
  sd_rx_fifo sd_rx_fifo_1(
   .d (d),
   .wr (wr),
   .wclk (wclk),
   .q (q),
   .rd (rd),
   .full (fe),
   .empty (empty),
   .mem_empt (mem_empt),
   .rclk (rclk),
   .rst (rst)
   );


event reset_trigger; 
event  reset_done_trigger; 
event start_trigger;
event start_done_trigger; 

reg [3:0] send [16:0];
reg [3:0] send_c;
reg start;
reg sw;
initial 
   begin 
     wclk=0;
     rst=0;
     rclk=0;
     d =0;
     rst=0;
     wr=0;
     #5 ->reset_trigger;
     send [0] = 4'ha;
     send [1] = 4'hb;
     send [2] = 4'hc;
     send [3] = 4'hd;
     send [4] = 4'he;
     send [5] = 4'hf;
     send [6] = 4'hd;
     send [7] = 4'hc;
     send [8] = 4'hf;
     send [9] = 4'he;
     send [10] = 4'hd;
     send [11] = 4'hc;
     send [12] = 4'hb;
     send [13] = 4'ha;
     send [14] = 4'ha;
     send [15] = 4'hb;
     send_c =0;
     sw=0;
     start=0;
end


always begin
  #5 rclk = !rclk;
 end

always begin
  #10 wclk = !wclk;
 end



 initial begin 
    forever begin 
      @ (reset_trigger); 
      @ (posedge wclk); 
      rst =1 ; 
      @ (posedge wclk); 
      rst = 0; 
      #20
      start=1;
      -> reset_done_trigger; 
    end 
  end

always @ (posedge rclk)
if (!empty) begin
  
     rd=1;
    slask =q; 
    
end
else 
  rd=0;
    
always @ (posedge wclk)
begin
if(start)
   sw=~sw;
   if (sw) begin
   d=send[send_c];
   wr=1;
   send_c=send_c+1;  end
   else begin
     wr=0;
   end 
   
   
 //  if (!rd) begin
  //    @ (posedge rclk);
//       slask =q; 
//   rd=1;
//  @ (posedge rclk);
//   rd=0;
//  end
end    
endmodule  

`include "sd_defines.v"
`include "timescale.v"
module sd_rx_fifo
  (
   input [4-1:0] d,
   input wr,
   input wclk,
   output [32-1:0] q,
   input rd,
   output full,
   output empty,
   output [1:0] mem_empt,
   input rclk,
   input rst
   );
   reg [32-1:0] ram [0:`FIFO_RX_MEM_DEPTH-1]; //synthesis syn_ramstyle = "no_rw_check
   reg [`FIFO_RX_MEM_ADR_SIZE-1:0] adr_i, adr_o;
   wire ram_we;
   wire [32-1:0] ram_din;
   reg [8-1:0] we;
   reg [4*(8)-1:0] tmp;
   reg ft;
   always @ (posedge wclk or posedge rst)
     if (rst)
       we <= 8'h1;
     else
       if (wr)
	 we <= {we[8-2:0],we[8-1]};
	 
   always @ (posedge wclk or posedge rst)
     if (rst) begin
       tmp <= {4*(8-1){1'b0}};
         ft<=0; 
   end    
     else
       begin
	 `ifdef BIG_ENDIAN
	   
	  if (wr & we[7]) begin
	    tmp[4*1-1:4*0] <= d;	 
	    ft<=1; end 
	  if (wr & we[6])
	    tmp[4*2-1:4*1] <= d; 
	  if (wr & we[5])
	    tmp[4*3-1:4*2] <= d;	  
	  if (wr & we[4])
	    tmp[4*4-1:4*3] <= d;	  
	  if (wr & we[3])
	    tmp[4*5-1:4*4] <= d;	  
	  if (wr & we[2])
	    tmp[4*6-1:4*5] <= d;	  
	  if (wr & we[1]) 
	    tmp[4*7-1:4*6] <= d;	 
 	  if (wr & we[0]) 
	    tmp[4*8-1:4*7] <= d;	 
	 `endif 
	 `ifdef LITTLE_ENDIAN 
	  if (wr & we[0])
	   tmp[4*1-1:4*0] <= d;	 
	  if (wr & we[1])
	    tmp[4*2-1:4*1] <= d;   
	  if (wr & we[2])
	    tmp[4*3-1:4*2] <= d;   
	  if (wr & we[3])
	   tmp[4*4-1:4*3] <= d;	     
	  if (wr & we[4])
	   tmp[4*5-1:4*4] <= d; 
	  if (wr & we[5])
	   tmp[4*6-1:4*5] <= d;	 
	  if (wr & we[6]) 
	   tmp[4*7-1:4*6] <= d;	  	  
	  if (wr & we[7]) begin
	   tmp[4*8-1:4*7] <= d;
	       ft<=1; 
     end
      `endif 
  end
       
   assign ram_we = wr & we[0] &ft;
   assign ram_din = tmp;
   always @ (posedge wclk)
     if (ram_we)
       ram[adr_i[`FIFO_RX_MEM_ADR_SIZE-2:0]] <= ram_din;
   always @ (posedge wclk or posedge rst)
     if (rst)
       adr_i <= `FIFO_RX_MEM_ADR_SIZE'h0;
     else
       if (ram_we)
	 if (adr_i == `FIFO_RX_MEM_DEPTH-1) begin
	   adr_i[`FIFO_RX_MEM_ADR_SIZE-2:0] <=0;	   
	   adr_i[`FIFO_RX_MEM_ADR_SIZE-1]<=~adr_i[`FIFO_RX_MEM_ADR_SIZE-1];
	 end  
	 else
	   adr_i <= adr_i + `FIFO_RX_MEM_ADR_SIZE'h1;
	   
   always @ (posedge rclk or posedge rst)
     if (rst)
       adr_o <= `FIFO_RX_MEM_ADR_SIZE'h0;
     else
       if (!empty & rd)
	
	 if (adr_o == `FIFO_RX_MEM_DEPTH-1) begin
	    adr_o[`FIFO_RX_MEM_ADR_SIZE-2:0] <=0;
	    adr_o[`FIFO_RX_MEM_ADR_SIZE-1] <=~adr_o[`FIFO_RX_MEM_ADR_SIZE-1];
	 end  
	 else
	   adr_o <= adr_o + `FIFO_RX_MEM_ADR_SIZE'h1;
	 
//------------------------------------------------------------------
// Simplified version of the three necessary full-tests:
// assign wfull_val=((wgnext[ADDRSIZE] !=wq2_rptr[ADDRSIZE] ) &&
// (wgnext[ADDRSIZE-1] !=wq2_rptr[ADDRSIZE-1]) &&
// (wgnext[ADDRSIZE-2:0]==wq2_rptr[ADDRSIZE-2:0]));
//------------------------------------------------------------------
	   
   assign full =  (adr_i[`FIFO_RX_MEM_ADR_SIZE-2:0] == adr_o[`FIFO_RX_MEM_ADR_SIZE-2:0] ) & (adr_i[`FIFO_RX_MEM_ADR_SIZE-1] ^ adr_o[`FIFO_RX_MEM_ADR_SIZE-1]) ;
   assign empty = (adr_i == adr_o) ;
   
   assign mem_empt = ( adr_i-adr_o);
   assign q = ram[adr_o[`FIFO_RX_MEM_ADR_SIZE-2:0]];
endmodule

`include "timescale.v"
`include "sd_defines.v"
module sd_tx_fifo
  (
   input [32-1:0] d,
   input wr,
   input wclk,
   output [32-1:0] q,
   input rd,
   output full,
   output empty,
   output [5:0] mem_empt,
   input rclk,
   input rst
   );
   
   reg [32-1:0] ram [0:`FIFO_TX_MEM_DEPTH-1]; //synthesis syn_ramstyle = "no_rw_check"
   reg [`FIFO_TX_MEM_ADR_SIZE-1:0] adr_i, adr_o;
   wire ram_we;
   wire [32-1:0] ram_din;
    

       
   assign ram_we = wr & ~full;
   assign ram_din = d;
   
   always @ (posedge wclk)
     if (ram_we)
       ram[adr_i[`FIFO_TX_MEM_ADR_SIZE-2:0]] <= ram_din;
   
   always @ (posedge wclk or posedge rst)
     if (rst)
       adr_i <= `FIFO_TX_MEM_ADR_SIZE'h0;
     else
       if (ram_we)
      	 if (adr_i == `FIFO_TX_MEM_DEPTH-1) begin
	        adr_i[`FIFO_TX_MEM_ADR_SIZE-2:0] <=0;	   
	        adr_i[`FIFO_TX_MEM_ADR_SIZE-1]<=~adr_i[`FIFO_TX_MEM_ADR_SIZE-1];
	    end  
	     else
	      adr_i <= adr_i + `FIFO_TX_MEM_ADR_SIZE'h1;
	   
	   
   always @ (posedge rclk or posedge rst)
     if (rst)
       adr_o <= `FIFO_TX_MEM_ADR_SIZE'h0;
     else
       if (!empty & rd) begin
	
	 if (adr_o == `FIFO_TX_MEM_DEPTH-1) begin
	    adr_o[`FIFO_TX_MEM_ADR_SIZE-2:0] <=0;
	    adr_o[`FIFO_TX_MEM_ADR_SIZE-1] <=~adr_o[`FIFO_TX_MEM_ADR_SIZE-1];
	 end  
	 else
	   adr_o <= adr_o + `FIFO_TX_MEM_ADR_SIZE'h1;
	 end
//------------------------------------------------------------------
// Simplified version of the three necessary full-tests:
// assign wfull_val=((wgnext[ADDRSIZE] !=wq2_rptr[ADDRSIZE] ) &&
// (wgnext[ADDRSIZE-1] !=wq2_rptr[ADDRSIZE-1]) &&
// (wgnext[ADDRSIZE-2:0]==wq2_rptr[ADDRSIZE-2:0]));
//------------------------------------------------------------------
	   
	   
   assign full=  ( adr_i[`FIFO_TX_MEM_ADR_SIZE-2:0] == adr_o[`FIFO_TX_MEM_ADR_SIZE-2:0] ) &  (adr_i[`FIFO_TX_MEM_ADR_SIZE-1] ^ adr_o[`FIFO_TX_MEM_ADR_SIZE-1]) ;
   assign empty = (adr_i == adr_o) ;
   
   assign mem_empt = ( adr_i-adr_o);
   assign q = ram[adr_o[`FIFO_TX_MEM_ADR_SIZE-2:0]];
endmodule

