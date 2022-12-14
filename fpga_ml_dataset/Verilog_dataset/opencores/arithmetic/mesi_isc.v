//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  MESI_ISC Project                                            ////
////                                                              ////
////  Author(s):                                                  ////
////      - Yair Amitay       yair.amitay@yahoo.com               ////
////                          www.linkedin.com/in/yairamitay      ////
////                                                              ////
////  Description                                                 ////
////  mesi_isc_basic_fifo                                         ////
////  -------------------                                         ////
////  The basic fifo is a fifo for instantiation in the different ////
////  parts of the block                                          ////
////                                                              ////
////  To Do:                                                      ////
////   -                                                          ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

// Main Bus commands
`define MESI_ISC_MBUS_CMD_NOP      3'd0
`define MESI_ISC_MBUS_CMD_WR       3'd1
`define MESI_ISC_MBUS_CMD_RD       3'd2
`define MESI_ISC_MBUS_CMD_WR_BROAD 3'd3
`define MESI_ISC_MBUS_CMD_RD_BROAD 3'd4

// Coherence Bus commands
`define MESI_ISC_CBUS_CMD_NOP      3'd0
`define MESI_ISC_CBUS_CMD_WR_SNOOP 3'd1
`define MESI_ISC_CBUS_CMD_RD_SNOOP 3'd2
`define MESI_ISC_CBUS_CMD_EN_WR    3'd3
`define MESI_ISC_CBUS_CMD_EN_RD    3'd4
  
// BREQ_TYPE  
`define MESI_ISC_BREQ_TYPE_NOP 2'd0
`define MESI_ISC_BREQ_TYPE_WR  2'd1
`define MESI_ISC_BREQ_TYPE_RD  2'd2

module mesi_isc_basic_fifo
    (
     // Inputs
     clk,
     rst,
     wr_i,
     rd_i,
     data_i,
     // Outputs
     data_o,
     status_empty_o,
     status_full_o
     );
parameter
  DATA_WIDTH        = 32,
  FIFO_SIZE         = 4,
  FIFO_SIZE_LOG2    = 2;
  

// Inputs
//================================
// System
input                   clk;          // System clock
input                   rst;          // Active high system reset

input                   wr_i;         // Write data to the fifo (store the data)
input                   rd_i;         // Read data from the fifo. Data is erased
                                      // afterward.
input [DATA_WIDTH-1:0]  data_i;       // Data data in to be stored
 
// Outputs
//================================
output [DATA_WIDTH-1:0] data_o;       // Data out to be rad 
// Status outputs
output                  status_empty_o; // There are no valid entries in the
                                       // fifo
output                  status_full_o; // There are no free entries in the fifo
                                       //  all the entries are valid

// Regs
//================================
reg  [DATA_WIDTH-1:0]   data_o;       // Data out to be rad 
reg  [DATA_WIDTH-1:0]   entry [FIFO_SIZE-1:0];  // The fifo entries
reg  [FIFO_SIZE_LOG2-1:0] ptr_wr;      // Fifo write pointer
reg  [FIFO_SIZE_LOG2-1:0] ptr_rd;      // Fifo read pointer
wire [FIFO_SIZE_LOG2-1:0] ptr_rd_plus_1;
reg                     status_empty;
reg                     status_full;
wire [FIFO_SIZE_LOG2-1:0] fifo_depth;  // Number of used entries
wire                    fifo_depth_increase;
wire                    fifo_depth_decrease;
   
integer 		i;             // For loop
								  
								  
`ifdef mesi_isc_debug
reg dbg_fifo_overflow;		       // Sticky bit for fifo overflow
reg dbg_fifo_underflow;		       // Sticky bit for fifo underflow
`endif

// Write to the fifo
//================================
// ptr_wr
// entry array
always @(posedge clk or posedge rst)
  if (rst)
  begin
     for(i=0; i < FIFO_SIZE; i = i + 1 )
       entry[i]    <= 0;
     ptr_wr        <= 0;
  end	
  else if (wr_i)
  begin
     entry[ptr_wr] <= data_i;        // Store the data_i to entry ptr_wr
     ptr_wr[FIFO_SIZE_LOG2-1:0] <= ptr_wr[FIFO_SIZE_LOG2-1:0] + 1; // Increase
                                     // the write pointer
  end


// Read from the fifo
//================================
// data_o
// The fifo output data_o is sampled. It always contains the data of 
// the entry[ptr_rd]; 
always @(posedge clk or posedge rst)
  if (rst)
    data_o[DATA_WIDTH-1:0] <= 0;
  else if (status_empty)
    data_o[DATA_WIDTH-1:0] <= data_i[DATA_WIDTH-1:0]; // When the fifo is empty
                                       // the write data
                                       // (if exists) is sampled to the fifo and
                                       // to the fifo output. In a case that in
                                       // the current cycle there is a write and
                                       // in the next cycle there is a read, the
                                       // data is ready in the output
  else if (rd_i)
    data_o[DATA_WIDTH-1:0] <= entry[ptr_rd_plus_1]; // Output the next data if this
                                       //  is a read cycle.
  else 
    data_o[DATA_WIDTH-1:0] <= entry[ptr_rd]; // The first data is sampled and
                                       //  ready for a read
// ptr_rd
always @(posedge clk or posedge rst)
  if (rst)
    ptr_rd[FIFO_SIZE_LOG2-1:0] <= 0;
  else if (rd_i)
    ptr_rd[FIFO_SIZE_LOG2-1:0] <= ptr_rd[FIFO_SIZE_LOG2-1:0] + 1; // Increase the
                                       //  read pointer
		
assign ptr_rd_plus_1 = ptr_rd + 1;

// Status
//================================
assign  status_empty_o        = status_empty;
assign  status_full_o         = status_full;

// status_empty
// status_empty is set when there are no any valid entries
always @(posedge clk or posedge rst)
  // On reset the fifo is empty
  if (rst)
                                                    status_empty <= 1;
  // There is one valid entry which is read (without write another entry)
  else if (fifo_depth == 1 & fifo_depth_decrease)
                                                    status_empty <= 1;
  // The fifo is empty and it is in a write cycle (without read)
  // The fifo_depth == 0 when the fifo is empty and when it is full
  else if (fifo_depth == 0   &
           status_empty      &    
           fifo_depth_increase)
                                                    status_empty <= 0;
	
always @(posedge clk or posedge rst)
  // On reset the fifo not full
  if (rst)
                                                    status_full  <= 0;
  // There is free entry which is written (without read other entry)
  else if (fifo_depth == FIFO_SIZE-1 & fifo_depth_increase)
                                                    status_full  <= 1;
  // The fifo is full and it is in a read cycle (without write)
  // The fifo_depth == 0 when the fifo is empty and when it is full
  else if (fifo_depth == 0 &
           status_full     &
           fifo_depth_decrease)
                                                    status_full  <= 0;
	

// The depth of the used fifo's entries is increased when there is a write
// and there is no a read
assign fifo_depth_increase     = wr_i & !rd_i;

// The depth of the used fifo's entries is decreased when there is a write
// and there is no a read
assign fifo_depth_decrease     = !wr_i & rd_i;
// In other cases (ptr_wr & ptr_rd) or (!ptr_wr & !ptr_rd) the number of the
// valid entries remains the same

// Because the buffer is cyclic the depth is always correct
assign fifo_depth[FIFO_SIZE_LOG2-1:0] = ptr_wr[FIFO_SIZE_LOG2-1:0] -
                                        ptr_rd[FIFO_SIZE_LOG2-1:0];
   
`ifdef mesi_isc_debug
// Debug
//================================
// dbg_fifo_overflow is a sticky bit which is set when writing (without reading)
// to a full fifo
// dbg_fifo_underflow is a sticky bit which is set when reading from an empty
// fifo
always @(posedge clk or posedge rst)
  if (rst)
    begin
     dbg_fifo_overflow   <= 0;
     dbg_fifo_underflow  <= 0;
    end
  else
  begin
     dbg_fifo_overflow   <= dbg_fifo_overflow | 
                            (status_full & fifo_depth_increase);
     dbg_fifo_underflow  <= dbg_fifo_underflow  | 
                            (status_empty & fifo_depth_decrease);
  end
`endif
   
endmodule
    //////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  MESI_ISC Project                                            ////
////                                                              ////
////  Author(s):                                                  ////
////      - Yair Amitay       yair.amitay@yahoo.com               ////
////                          www.linkedin.com/in/yairamitay      ////
////                                                              ////
////  Description                                                 ////
////  mesi_isc_breq_fifos_cntl                                    ////
////  -------------------                                         ////
////  Controls and muxes of the mesi_isc_breq_fifos. This module  ////
////  contains all the controls and logic of the                  ////
////  mesi_isc_breq_fifos_cntl                                    ////
////                                                              ////
////  To Do:                                                      ////
////   -                                                          ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


module mesi_isc_breq_fifos_cntl
    (
     // Inputs
     clk,
     rst,
     mbus_cmd_array_i,
     fifo_status_empty_array_i,
     fifo_status_full_array_i,
     broad_fifo_status_full_i,
     broad_addr_array_i,
     broad_type_array_i,
     broad_id_array_i,
     // Outputs
     mbus_ack_array_o,
     fifo_wr_array_o,
     fifo_rd_array_o,
     broad_fifo_wr_o,
     broad_addr_o,
     broad_type_o,
     broad_cpu_id_o,
     broad_id_o,
     breq_type_array_o,
     breq_cpu_id_array_o,
     breq_id_array_o
   );
   
parameter
  MBUS_CMD_WIDTH           = 3,
  ADDR_WIDTH               = 32,
  BROAD_TYPE_WIDTH         = 2,  
  BROAD_ID_WIDTH           = 7;
  
// Inputs
//================================
// System
input                   clk;          // System clock
input                   rst;          // Active high system reset

// Main buses
// The mbus commands, according to the commend the breq are written to
// the fifos
input [4*MBUS_CMD_WIDTH-1:0] mbus_cmd_array_i;
// cntl
// breq fifo status
input [3:0]             fifo_status_empty_array_i;       
input [3:0]             fifo_status_full_array_i;
// broad_fifo
// breqs can be written to the broad fifo when it is not full
input                   broad_fifo_status_full_i;
// mux
// The mux sends to the broad fifo one of the broad from the 4 breq fifos.
// It sends: address. type, cpu_id, broad_id
input [4*ADDR_WIDTH-1      :0] broad_addr_array_i;
input [4*BROAD_TYPE_WIDTH-1:0] broad_type_array_i;
input [4*BROAD_ID_WIDTH-1  :0] broad_id_array_i;
     
// Outputs
// Main busses
// When a breq is stored to a fifo an acknowledge is send to the initiator
output [3:0]            mbus_ack_array_o;
// cntl
// Write the breq to one of the fifos
output [3:0]            fifo_wr_array_o;
// Read a breq toward the broad fifo
output [3:0]            fifo_rd_array_o; 
// broad_fifo
// Command to fifo for a broad in the broad fifo
output                  broad_fifo_wr_o;
// The broad information that is send to the broad fifo: address. type, cpu_id
// and broad_id
output [ADDR_WIDTH-1      :0] broad_addr_o;
output [BROAD_TYPE_WIDTH-1:0] broad_type_o;
output [1:0]                  broad_cpu_id_o;
output [BROAD_ID_WIDTH-1:  0] broad_id_o;
// fifo inputs
// Some of the breq fifo input are manipulate before storing
// The type in manipulation of the mbus command
output [4*BROAD_TYPE_WIDTH-1:0] breq_type_array_o;
// Each CPU has a fixed ID
output [4*2-1:0]              breq_cpu_id_array_o;
// Each breq has a unique ID.
output [4*BROAD_ID_WIDTH-1:0] breq_id_array_o;

// Regs & wires
//================================
reg [3:0]               mbus_ack_array;
reg [3:0]               fifos_priority; // A one hot priority between the 
                                      // breq fifos toward the broad fifo
wire [3:0]              fifos_priority_barrel_shiftl_1,
                        fifos_priority_barrel_shiftl_2,
                        fifos_priority_barrel_shiftl_3;
wire [3:0]              fifo_select_oh; // A one hot control of the mux between
                                        // breq fifos toward the broad fifo
reg  [BROAD_ID_WIDTH-3:0] breq_id_base; // breq_id_base is the base value of
                                        // the IDs. breq_id_base = breq_id/4
   
wire [MBUS_CMD_WIDTH-1:0] mbus_cmd_array_i_3,
			  mbus_cmd_array_i_2,
			  mbus_cmd_array_i_1,
			  mbus_cmd_array_i_0;
reg [4*BROAD_TYPE_WIDTH-1:0] breq_type_array_o;
  
// Assigns for outputs
//================================
assign mbus_ack_array_o   = mbus_ack_array;


// fifo_rd_array_o, broad_fifo_wr_o
// Read the breq from one of the breq fifos and write it to the broad fifo.   
assign fifo_rd_array_o = {4{~broad_fifo_status_full_i}} & // There is space in
			              // the broad fifo
		         fifo_select_oh[3:0]; // The highest priority
			              // fifo that has a valid breq.
assign broad_fifo_wr_o = |fifo_rd_array_o[3:0]; // Write to the broad fifo is 
                                      // done in parallel to Read from one of
                                      // the breq fifo The values set
   
// fifos_priority, fifos_priority_barrel_shift_1/2/3 (one hot)
// The priority between the CPU is done in round robin order.
// The breq which is sent to the broad fifo is selected according to 
// the value of the fifos_priority register, from the low value to the high 
// value.
// For example when fifos_priority == 2 then the priority order is:
//  2 -> 3 -> 0 -> 1. The breq is sent from the first breq fifo, in that order,
// that has a valid breq.
// The priority is change whenever a breq is sent to the broad fifo  
always @(posedge clk or posedge rst)
 if (rst)
   fifos_priority <= 1;
 else if (broad_fifo_wr_o)
   fifos_priority[3:0] <= fifos_priority_barrel_shiftl_1[3:0];

assign fifos_priority_barrel_shiftl_3[3:0] =
                                    {fifos_priority[0]  , fifos_priority[3:1]};
assign fifos_priority_barrel_shiftl_2[3:0] =
                                    {fifos_priority[1:0], fifos_priority[3:2]};
assign fifos_priority_barrel_shiftl_1[3:0] =
                                    {fifos_priority[2:0], fifos_priority[3]};
   
// fifo_select_oh (one hot)
// Points to the highest priority fifo (see fifos_priority) that
// has a valid breq.
// The control of the mux from the breq fifos to the broad fifo.
assign fifo_select_oh[3:0] =
          // If the 1st highest priority fifo is not empty then select it
	  // Or the bit-wise results of the following formula to one result   
	  // Bit-wise set for fifos that are not empty 
          |(~fifo_status_empty_array_i[3:0] &
	     // Bit-wise one hot priority for the 1st highest priority
             fifos_priority[3:0]                 ) ?
                                          fifos_priority[3:0]                 :
          |(~fifo_status_empty_array_i[3:0] &
             fifos_priority_barrel_shiftl_1[3:0] ) ?
                                          fifos_priority_barrel_shiftl_1[3:0] :
          |(~fifo_status_empty_array_i[3:0] &
             fifos_priority_barrel_shiftl_2[3:0] ) ?
                                          fifos_priority_barrel_shiftl_2[3:0] :
          |(~fifo_status_empty_array_i[3:0] &
             fifos_priority_barrel_shiftl_3[3:0] ) ?
                                          fifos_priority_barrel_shiftl_3[3:0] :
                                          4'd0;
   
// broad_addr_o, broad_type_o, broad_cpu_id_o, broad_id_o
// One hot mux
assign broad_addr_o[ADDR_WIDTH-1:0] = 
            broad_addr_array_i[(3+1)*ADDR_WIDTH-1 : 3*ADDR_WIDTH] &
                                              {ADDR_WIDTH{fifo_select_oh[3]}} |
            broad_addr_array_i[(2+1)*ADDR_WIDTH-1 : 2*ADDR_WIDTH] &
                                              {ADDR_WIDTH{fifo_select_oh[2]}} |
            broad_addr_array_i[(1+1)*ADDR_WIDTH-1 : 1*ADDR_WIDTH] &
                                              {ADDR_WIDTH{fifo_select_oh[1]}} |
            broad_addr_array_i[(0+1)*ADDR_WIDTH-1 : 0*ADDR_WIDTH] &
                                              {ADDR_WIDTH{fifo_select_oh[0]}};
assign broad_type_o[BROAD_TYPE_WIDTH-1:0] = 
            broad_type_array_i[(3+1)*BROAD_TYPE_WIDTH-1 : 3*BROAD_TYPE_WIDTH] &
                                        {BROAD_TYPE_WIDTH{fifo_select_oh[3]}} |
            broad_type_array_i[(2+1)*BROAD_TYPE_WIDTH-1 : 2*BROAD_TYPE_WIDTH] &
                                        {BROAD_TYPE_WIDTH{fifo_select_oh[2]}} |
            broad_type_array_i[(1+1)*BROAD_TYPE_WIDTH-1 : 1*BROAD_TYPE_WIDTH] &
                                        {BROAD_TYPE_WIDTH{fifo_select_oh[1]}} |
            broad_type_array_i[(0+1)*BROAD_TYPE_WIDTH-1 : 0*BROAD_TYPE_WIDTH] &
                                        {BROAD_TYPE_WIDTH{fifo_select_oh[0]}};
// Each CPU has a fixed ID
assign broad_cpu_id_o[1:0] = 2'd3 & {2{fifo_select_oh[3]}} |
	                     2'd2 & {2{fifo_select_oh[2]}} |  
		             2'd1 & {2{fifo_select_oh[1]}} |  
			     2'd0 & {2{fifo_select_oh[0]}};
   
assign broad_id_o[BROAD_ID_WIDTH-1:0] =
            broad_id_array_i[(3+1)*BROAD_ID_WIDTH-1 : 3*BROAD_ID_WIDTH] &
                                          {BROAD_ID_WIDTH{fifo_select_oh[3]}} |
            broad_id_array_i[(2+1)*BROAD_ID_WIDTH-1 : 2*BROAD_ID_WIDTH] &
                                          {BROAD_ID_WIDTH{fifo_select_oh[2]}} |
            broad_id_array_i[(1+1)*BROAD_ID_WIDTH-1 : 1*BROAD_ID_WIDTH] &
                                          {BROAD_ID_WIDTH{fifo_select_oh[1]}} |
            broad_id_array_i[(0+1)*BROAD_ID_WIDTH-1 : 0*BROAD_ID_WIDTH] &
                                          {BROAD_ID_WIDTH{fifo_select_oh[0]}};
		    
//fifo_wr_array
// Write the breq into the fifo.
// When an acknowledge is sent to the mbus the breq is written to the fifo.
assign fifo_wr_array_o[3:0] = mbus_ack_array[3:0];
   
// mbus_ack_array
// The mbus ack is an indication for the mbus that the (broadcast) transaction
// was received and it can proceed to the next transaction (or to nop).
// The acknowledge is sent to the mbus when the breq can be stored in the fifo.
// The acknowledge can't be asserted for more then one cycle for simplification
// of the protocol and timing paths. 
always @(posedge clk or posedge rst)
  if (rst)
     mbus_ack_array[3:0] <= 0;
  else
  begin
     mbus_ack_array[3] <= ~mbus_ack_array[3] &
                          (mbus_cmd_array_i_3 == `MESI_ISC_MBUS_CMD_WR_BROAD |
                           mbus_cmd_array_i_3 == `MESI_ISC_MBUS_CMD_RD_BROAD )&
                          fifo_status_full_array_i[3] == 0;
     mbus_ack_array[2] <= ~mbus_ack_array[2] &
                          (mbus_cmd_array_i_2 == `MESI_ISC_MBUS_CMD_WR_BROAD |
                           mbus_cmd_array_i_2 == `MESI_ISC_MBUS_CMD_RD_BROAD )&
                          fifo_status_full_array_i[2] == 0;
     mbus_ack_array[1] <= ~mbus_ack_array[1] &
                          (mbus_cmd_array_i_1 == `MESI_ISC_MBUS_CMD_WR_BROAD |
                           mbus_cmd_array_i_1 == `MESI_ISC_MBUS_CMD_RD_BROAD )&
                          fifo_status_full_array_i[1] == 0;
     mbus_ack_array[0] <= ~mbus_ack_array[0] &
                          (mbus_cmd_array_i_0 == `MESI_ISC_MBUS_CMD_WR_BROAD |
                           mbus_cmd_array_i_0 == `MESI_ISC_MBUS_CMD_RD_BROAD )&
                          fifo_status_full_array_i[0] == 0;
     
  end

assign mbus_cmd_array_i_3[MBUS_CMD_WIDTH-1:0] =
                   mbus_cmd_array_i[(3+1)*MBUS_CMD_WIDTH-1 : 3*MBUS_CMD_WIDTH];
assign mbus_cmd_array_i_2[MBUS_CMD_WIDTH-1:0] =
                   mbus_cmd_array_i[(2+1)*MBUS_CMD_WIDTH-1 : 2*MBUS_CMD_WIDTH];
assign mbus_cmd_array_i_1[MBUS_CMD_WIDTH-1:0] =
                   mbus_cmd_array_i[(1+1)*MBUS_CMD_WIDTH-1 : 1*MBUS_CMD_WIDTH];
assign mbus_cmd_array_i_0[MBUS_CMD_WIDTH-1:0] =
                   mbus_cmd_array_i[(0+1)*MBUS_CMD_WIDTH-1 : 0*MBUS_CMD_WIDTH];
   
// The breq type depends on the mbus command.
// Mbus: Write broadcast - breq type: wr
// Mbus: Read broadcast  - breq type: rd
// Mbus: else            - breq type: nop
always @(posedge clk or posedge rst)
 if (rst)
   breq_type_array_o[4*BROAD_TYPE_WIDTH-1:0] <= 0;
 else begin 
       //                \ /                      \ /
       breq_type_array_o[(3+1)*BROAD_TYPE_WIDTH-1: 3*BROAD_TYPE_WIDTH] =
        //              \ /
        mbus_cmd_array_i_3[MBUS_CMD_WIDTH-1:0] == `MESI_ISC_MBUS_CMD_WR_BROAD ?
                                                     `MESI_ISC_BREQ_TYPE_WR:
	//              \ /
        mbus_cmd_array_i_3[MBUS_CMD_WIDTH-1:0] == `MESI_ISC_MBUS_CMD_RD_BROAD ?
                                                     `MESI_ISC_BREQ_TYPE_RD:
                                                     `MESI_ISC_BREQ_TYPE_NOP;
       //                \ /                      \ /
       breq_type_array_o[(2+1)*BROAD_TYPE_WIDTH-1: 2*BROAD_TYPE_WIDTH] =
        //              \ /
        mbus_cmd_array_i_2[MBUS_CMD_WIDTH-1:0] == `MESI_ISC_MBUS_CMD_WR_BROAD ?
                                                     `MESI_ISC_BREQ_TYPE_WR:
        //              \ /
        mbus_cmd_array_i_2[MBUS_CMD_WIDTH-1:0] == `MESI_ISC_MBUS_CMD_RD_BROAD ?
                                                     `MESI_ISC_BREQ_TYPE_RD:
                                                     `MESI_ISC_BREQ_TYPE_NOP;
       //                \ /                      \ /
       breq_type_array_o[(1+1)*BROAD_TYPE_WIDTH-1: 1*BROAD_TYPE_WIDTH] =
        //              \ /
        mbus_cmd_array_i_1[MBUS_CMD_WIDTH-1:0] == `MESI_ISC_MBUS_CMD_WR_BROAD ?
                                                     `MESI_ISC_BREQ_TYPE_WR:
	//              \ /
        mbus_cmd_array_i_1[MBUS_CMD_WIDTH-1:0] == `MESI_ISC_MBUS_CMD_RD_BROAD ?
                                                     `MESI_ISC_BREQ_TYPE_RD:
                                                     `MESI_ISC_BREQ_TYPE_NOP;
       //                \ /                      \ /
       breq_type_array_o[(0+1)*BROAD_TYPE_WIDTH-1: 0*BROAD_TYPE_WIDTH] =
        //              \ /
        mbus_cmd_array_i_0[MBUS_CMD_WIDTH-1:0] == `MESI_ISC_MBUS_CMD_WR_BROAD ?
                                                     `MESI_ISC_BREQ_TYPE_WR:
	//              \ /
        mbus_cmd_array_i_0[MBUS_CMD_WIDTH-1:0] == `MESI_ISC_MBUS_CMD_RD_BROAD ?
                                                     `MESI_ISC_BREQ_TYPE_RD:
                                                     `MESI_ISC_BREQ_TYPE_NOP;

end
// The CPU IDs have fixed values
assign breq_cpu_id_array_o[(3+1)*2-1 : 3*2] = 3;
assign breq_cpu_id_array_o[(2+1)*2-1 : 2*2] = 2;
assign breq_cpu_id_array_o[(1+1)*2-1 : 1*2] = 1;
assign breq_cpu_id_array_o[(0+1)*2-1 : 0*2] = 0;

// breq_id_array_o
// In a cycle that at least on breq is received there are 4 unique numbers -
// one for each fifo. These numbers are the breq ID. In a cycle that a certain
// fifo does not receive a breq (but there is at least one more fifos that  
// receives) then its unique number in that cycle is not used.
// The values of breq_id are cyclic and every specific amount of breqs its  
// value go back to 0. The possible different values of breq_id are much bigger
// then 4*(the latency of mesi_isc). In that way it is not possible that the
// same ID is used for more then one request in the same time.
// 
// fifo 0 ID (for each cycle) is breq_id_base*4
// fifo 1 ID is breq_id_base*4 + 1
// fifo 1 ID is breq_id_base*4 + 2
// fifo 1 ID is breq_id_base*4 + 3
assign breq_id_array_o[(3+1)*BROAD_ID_WIDTH-1 : 3*BROAD_ID_WIDTH] =
                                   {breq_id_base[BROAD_ID_WIDTH-3 : 0], 2'b00};
assign breq_id_array_o[(2+1)*BROAD_ID_WIDTH-1 : 2*BROAD_ID_WIDTH] =
                                   {breq_id_base[BROAD_ID_WIDTH-3 : 0], 2'b01};
assign breq_id_array_o[(1+1)*BROAD_ID_WIDTH-1 : 1*BROAD_ID_WIDTH] =
                                   {breq_id_base[BROAD_ID_WIDTH-3 : 0], 2'b10};
assign breq_id_array_o[(0+1)*BROAD_ID_WIDTH-1 : 0*BROAD_ID_WIDTH] =
                                   {breq_id_base[BROAD_ID_WIDTH-3 : 0], 2'b11};
							       
// The least significant bits of breq_id_base are always 0
always @(posedge clk or posedge rst)
 if (rst)
   breq_id_base[BROAD_ID_WIDTH-3 : 0] <= 0;
 else if (|fifo_wr_array_o)
  //  breq_id_base+1 is analogous to  breq_id+4
  breq_id_base[BROAD_ID_WIDTH-3 : 0] <= breq_id_base[BROAD_ID_WIDTH-3 : 0] + 1;
   
endmodule
    //////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  MESI_ISC Project                                            ////
////                                                              ////
////  Author(s):                                                  ////
////      - Yair Amitay       yair.amitay@yahoo.com               ////
////                          www.linkedin.com/in/yairamitay      ////
////                                                              ////
////  Description                                                 ////
////  mesi_isc_breq_fifos                                         ////
////  -------------------                                         ////
////  Stores all the snoop transactions. Keeps the transactions   ////
////  until the cpu receives the transactions                     ////
////                                                              ////
////  The functional ports of the block are arranged in arrays.   ////
////  Each functional port is an array which contains one signal  ////
////  for each snoop fifo.                                        ////
////  The order of the signals, of width X (each signal has       //// 
////  X-1:0 bits), in the port is described below.                ////
////  All the bits of the first signal are located in the port    ////
////  least significant bits. Then, the second signal is located  ////
////  in the next X bits, etc.                                    ////
////                                                              ////
////  For a port that contains M (M>1) signals of width X (X>0)   ////
////  signal_N[X-1:0] = port[(N+1)*X-1:N*X].                      ////
////                                                              ////
////  For example for a port with 4 signals of 8 bits             ////
////  signal_0[7:0] = port[(N+1)*X-1:N*X] = port[(N+1)*8-1:N*8] = ////
////                = port[(0+1)*8-1:0*8] = port[7:0]             ////
////  signal_1[7:0] = port[(1+1)*8-1:1*8] = port[15:8]            ////
////  signal_2[7:0] = port[(2+1)*8-1:2*8] = port[23:16]           ////
////  signal_3[7:0] = port[(3+1)*8-1:3*8] = port[31:24]           ////
////                                                              ////
////  To Do:                                                      ////
////   -                                                          ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


module mesi_isc_breq_fifos
    (
     // Inputs
     clk,
     rst,
     mbus_cmd_array_i,
     mbus_addr_array_i,
     broad_fifo_status_full_i,
     // Outputs
     mbus_ack_array_o,
     broad_fifo_wr_o,
     broad_addr_o,
     broad_type_o,
     broad_cpu_id_o,
     broad_id_o
   );
   
parameter
  MBUS_CMD_WIDTH           = 3,
  ADDR_WIDTH               = 32,
  BROAD_TYPE_WIDTH         = 2,  
  BROAD_ID_WIDTH           = 7,  
  BREQ_FIFO_SIZE           = 2,
  BREQ_FIFO_SIZE_LOG2      = 1;
   
// Inputs
//================================
// System
input                   clk;          // System clock
input                   rst;          // Active high system reset

// Main buses
input [4*MBUS_CMD_WIDTH-1:0] mbus_cmd_array_i; // Main bus command (array)
input [4*ADDR_WIDTH-1:0] mbus_addr_array_i; // Main bus address (array)

// From mesi_isc_broad_fifo
input                    broad_fifo_status_full_i; // The broad fifo is full
                                      // and can't receive another broadcast
                                      // request
 
// Outputs
//================================
// Main buses
output [3:0]             mbus_ack_array_o; // Bus acknowledge for receiving the
                                      // broadcast request
// To mesi_isc_broad_fifo
output                   broad_fifo_wr_o; // Write the broadcast request
output [ADDR_WIDTH-1:0]  broad_addr_o; // Address of the broadcast request
output [BROAD_TYPE_WIDTH-1:0] broad_type_o; // Type of the broadcast request
output [1:0]             broad_cpu_id_o; // ID of the initiator CPU
                                      // broad in the broad fifo
output [BROAD_ID_WIDTH-1:0] broad_id_o; // The ID of the broadcast request


// Regs & wires
//================================
wire [3:0] 		fifo_status_empty_array;
wire [3:0]              fifo_status_full_array;
wire [4*ADDR_WIDTH-1:0] broad_addr_array;
wire [4*BROAD_TYPE_WIDTH-1:0] broad_type_array;
wire [4*BROAD_ID_WIDTH-1:0] broad_id_array;
wire [3:0] 		fifo_wr_array;
wire [3:0] 		fifo_rd_array;
wire [4*BROAD_TYPE_WIDTH-1:0] breq_type_array;
wire [4*2-1:0]          breq_cpu_id_array;
wire [4*BROAD_ID_WIDTH-1:0] breq_id_array;
wire [4*2-1:0] 		    broad_cpu_id_array;
		   
// Breq fifo control
//================================
mesi_isc_breq_fifos_cntl #(MBUS_CMD_WIDTH,
                           ADDR_WIDTH,
                           BROAD_TYPE_WIDTH,
                           BROAD_ID_WIDTH)
   mesi_isc_breq_fifos_cntl 
    (
     // Inputs
     .clk                   (clk),
     .rst                   (rst),
     .mbus_cmd_array_i      (mbus_cmd_array_i [4*MBUS_CMD_WIDTH-1     :0]),
     .fifo_status_empty_array_i (fifo_status_empty_array            [3:0]),
     .fifo_status_full_array_i  (fifo_status_full_array             [3:0]),
     .broad_fifo_status_full_i (broad_fifo_status_full_i),
     .broad_addr_array_i    (broad_addr_array  [4*ADDR_WIDTH-1        :0]),
     .broad_type_array_i    (broad_type_array  [4*BROAD_TYPE_WIDTH-1  :0]),
     .broad_id_array_i      (broad_id_array    [4*BROAD_ID_WIDTH-1    :0]),
     // Outputs
     .mbus_ack_array_o      (mbus_ack_array_o                        [3:0]),
     .fifo_wr_array_o       (fifo_wr_array                          [3:0]),
     .fifo_rd_array_o       (fifo_rd_array                          [3:0]), 
     .broad_fifo_wr_o       (broad_fifo_wr_o),
     .broad_addr_o          (broad_addr_o      [ADDR_WIDTH-1          :0]),
     .broad_type_o          (broad_type_o      [BROAD_TYPE_WIDTH-1    :0]),
     .broad_cpu_id_o        (broad_cpu_id_o                         [1:0]),
     .broad_id_o            (broad_id_o        [BROAD_ID_WIDTH-1      :0]),
     .breq_type_array_o     (breq_type_array   [4*BROAD_TYPE_WIDTH-1  :0]),
     .breq_cpu_id_array_o   (breq_cpu_id_array [4*2-1                 :0]),
     .breq_id_array_o       (breq_id_array     [4*BROAD_ID_WIDTH-1    :0])
     );

// Breq fifo 3
//================================
mesi_isc_basic_fifo #(ADDR_WIDTH         +  // DATA_WIDTH
                      BROAD_TYPE_WIDTH   +
                      2                  +  // BROAD_CPU_ID_WIDTH
                      BROAD_ID_WIDTH,
                      BREQ_FIFO_SIZE,       // FIFO_SIZE
                      BREQ_FIFO_SIZE_LOG2)  // FIFO_SIZE_LOG2
   //  \ /  (\ / marks the fifo ID) 
   fifo_3 
    (
     // Inputs
     .clk                   (clk),
     .rst                   (rst),
                            //            \ /
     .wr_i                  (fifo_wr_array[3]),
                            //            \ /
     .rd_i                  (fifo_rd_array[3]),
                            //                 \ /
     .data_i                ({mbus_addr_array_i[(3+1)*ADDR_WIDTH-1:
                            //                          \ /
                                                         3*ADDR_WIDTH],
                            //                 \ /
                              breq_type_array [(3+1)*BROAD_TYPE_WIDTH-1:
                            //                          \ /
                                                         3*BROAD_TYPE_WIDTH],
                            //                  \ /
                              breq_cpu_id_array[(3+1)*2-1:
                            //                          \ /
                                                         3*2],
                            //                 \ /
                              breq_id_array   [(3+1)*BROAD_ID_WIDTH-1:
                            //                          \ /
                                                         3*BROAD_ID_WIDTH]}),
     // Outputs
     //                     //                 \ /
     .data_o                ({broad_addr_array [(3+1)*ADDR_WIDTH-1:
                            //                          \ /
                                                         3*ADDR_WIDTH],
                            //                 \ /
                             broad_type_array  [(3+1)*BROAD_TYPE_WIDTH-1:
                            //                          \ /
                                                         3*BROAD_TYPE_WIDTH],
                            //                  \ /
                             broad_cpu_id_array[(3+1)*2-1:
                            //                          \ /
                                                         3*2],
                            //                 \ /
                             broad_id_array    [(3+1)*BROAD_ID_WIDTH-1:
                            //                          \ /
                                                         3*BROAD_ID_WIDTH]}),
                            //                             \ /
     .status_empty_o        (fifo_status_empty_array       [3]),
                            //                             \ /
     .status_full_o         (fifo_status_full_array        [3])
     );

// Breq fifo 2
//================================
mesi_isc_basic_fifo #(ADDR_WIDTH         +  // DATA_WIDTH
                      BROAD_TYPE_WIDTH   +
                      2                  +  // BROAD_CPU_ID_WIDTH
                      BROAD_ID_WIDTH,
                      BREQ_FIFO_SIZE,       // FIFO_SIZE
                      BREQ_FIFO_SIZE_LOG2)  // FIFO_SIZE_LOG2
   //  \ /  (\ / marks the fifo ID) 
   fifo_2 
    (
     // Inputs
     .clk                   (clk),
     .rst                   (rst),
                            //            \ /
     .wr_i                  (fifo_wr_array[2]),
                            //            \ /
     .rd_i                  (fifo_rd_array[2]),
                            //                 \ /
     .data_i                ({mbus_addr_array_i[(2+1)*ADDR_WIDTH-1:
                            //                          \ /
                                                         2*ADDR_WIDTH],
                            //                 \ /
                              breq_type_array [(2+1)*BROAD_TYPE_WIDTH-1:
                            //                          \ /
                                                         2*BROAD_TYPE_WIDTH],
                            //                  \ /
                              breq_cpu_id_array[(2+1)*2-1:
                            //                          \ /
                                                         2*2],
                            //                 \ /
                              breq_id_array   [(2+1)*BROAD_ID_WIDTH-1:
                            //                          \ /
                                                         2*BROAD_ID_WIDTH]}),
     // Outputs
     //                     //                 \ /
     .data_o                ({broad_addr_array [(2+1)*ADDR_WIDTH-1:
                            //                          \ /
                                                         2*ADDR_WIDTH],
                            //                 \ /
                             broad_type_array  [(2+1)*BROAD_TYPE_WIDTH-1:
                            //                          \ /
                                                         2*BROAD_TYPE_WIDTH],
                            //                  \ /
                             broad_cpu_id_array[(2+1)*2-1:
                            //                          \ /
                                                         2*2],
                            //                 \ /
                             broad_id_array    [(2+1)*BROAD_ID_WIDTH-1:
                            //                          \ /
                                                         2*BROAD_ID_WIDTH]}),
                            //                             \ /
     .status_empty_o        (fifo_status_empty_array       [2]),
                            //                             \ /
     .status_full_o         (fifo_status_full_array        [2])
     );

// Breq fifo 1
//================================
mesi_isc_basic_fifo #(ADDR_WIDTH         +  // DATA_WIDTH
                      BROAD_TYPE_WIDTH   +
                      2                  +  // BROAD_CPU_ID_WIDTH
                      BROAD_ID_WIDTH,
                      BREQ_FIFO_SIZE,       // FIFO_SIZE
                      BREQ_FIFO_SIZE_LOG2)  // FIFO_SIZE_LOG2
   //  \ /  (\ / marks the fifo ID) 
   fifo_1 
    (
     // Inputs
     .clk                   (clk),
     .rst                   (rst),
                            //            \ /
     .wr_i                  (fifo_wr_array[1]),
                            //            \ /
     .rd_i                  (fifo_rd_array[1]),
                            //                 \ /
     .data_i                ({mbus_addr_array_i[(1+1)*ADDR_WIDTH-1:
                            //                          \ /
                                                         1*ADDR_WIDTH],
                            //                 \ /
                              breq_type_array [(1+1)*BROAD_TYPE_WIDTH-1:
                            //                          \ /
                                                         1*BROAD_TYPE_WIDTH],
                            //                  \ /
                              breq_cpu_id_array[(1+1)*2-1:
                            //                          \ /
                                                         1*2],
                            //                 \ /
                              breq_id_array   [(1+1)*BROAD_ID_WIDTH-1:
                            //                          \ /
                                                         1*BROAD_ID_WIDTH]}),
     // Outputs
     //                     //                 \ /
     .data_o                ({broad_addr_array [(1+1)*ADDR_WIDTH-1:
                            //                          \ /
                                                         1*ADDR_WIDTH],
                            //                 \ /
                             broad_type_array  [(1+1)*BROAD_TYPE_WIDTH-1:
                            //                          \ /
                                                         1*BROAD_TYPE_WIDTH],
                            //                  \ /
                             broad_cpu_id_array[(1+1)*2-1:
                            //                          \ /
                                                         1*2],
                            //                 \ /
                             broad_id_array    [(1+1)*BROAD_ID_WIDTH-1:
                            //                          \ /
                                                         1*BROAD_ID_WIDTH]}),
                            //                             \ /
     .status_empty_o        (fifo_status_empty_array       [1]),
                            //                             \ /
     .status_full_o         (fifo_status_full_array        [1])
     );

// Breq fifo 0
//================================
mesi_isc_basic_fifo #(ADDR_WIDTH         +  // DATA_WIDTH
                      BROAD_TYPE_WIDTH   +
                      2                  +  // BROAD_CPU_ID_WIDTH
                      BROAD_ID_WIDTH,
                      BREQ_FIFO_SIZE,       // FIFO_SIZE
                      BREQ_FIFO_SIZE_LOG2)  // FIFO_SIZE_LOG2
   //  \ /  (\ / marks the fifo ID) 
   fifo_0 
    (
     // Inputs
     .clk                   (clk),
     .rst                   (rst),
                            //            \ /
     .wr_i                  (fifo_wr_array[0]),
                            //            \ /
     .rd_i                  (fifo_rd_array[0]),
                            //                 \ /
     .data_i                ({mbus_addr_array_i[(0+1)*ADDR_WIDTH-1:
                            //                          \ /
                                                         0*ADDR_WIDTH],
                            //                 \ /
                              breq_type_array [(0+1)*BROAD_TYPE_WIDTH-1:
                            //                          \ /
                                                         0*BROAD_TYPE_WIDTH],
                            //                  \ /
                              breq_cpu_id_array[(0+1)*2-1:
                            //                          \ /
                                                         0*2],
                            //                 \ /
                              breq_id_array   [(0+1)*BROAD_ID_WIDTH-1:
                            //                          \ /
                                                         0*BROAD_ID_WIDTH]}),
     // Outputs
     //                     //                 \ /
     .data_o                ({broad_addr_array [(0+1)*ADDR_WIDTH-1:
                            //                          \ /
                                                         0*ADDR_WIDTH],
                            //                 \ /
                             broad_type_array  [(0+1)*BROAD_TYPE_WIDTH-1:
                            //                          \ /
                                                         0*BROAD_TYPE_WIDTH],
                            //                  \ /
                             broad_cpu_id_array[(0+1)*2-1:
                            //                          \ /
                                                         0*2],
                            //                 \ /
                             broad_id_array    [(0+1)*BROAD_ID_WIDTH-1:
                            //                          \ /
                                                         0*BROAD_ID_WIDTH]}),
                            //                             \ /
     .status_empty_o        (fifo_status_empty_array       [0]),
                            //                             \ /
     .status_full_o         (fifo_status_full_array        [0])
     );

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  MESI_ISC Project                                            ////
////                                                              ////
////  Author(s):                                                  ////
////      - Yair Amitay       yair.amitay@yahoo.com               ////
////                          www.linkedin.com/in/yairamitay      ////
////                                                              ////
////  Description                                                 ////
////  mesi_isc_broad_cntl                                          ////
////  -------------------                                         ////
////                                                              ////
////                                                              ////
////  To Do:                                                      ////
////   -                                                          ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


module mesi_isc_broad_cntl
    (
     // Inputs
     clk,
     rst,
     cbus_ack_array_i,
     fifo_status_empty_i,
     fifo_status_full_i,
     broad_snoop_type_i,
     broad_snoop_cpu_id_i,
     broad_snoop_id_i,
     // Outputs
     cbus_cmd_array_o,
     broad_fifo_rd_o
     );
parameter
  CBUS_CMD_WIDTH           = 3,
  BROAD_TYPE_WIDTH         = 2,
  BROAD_ID_WIDTH           = 5;
   
// Inputs
//================================
// System
input                   clk;          // System clock
input                   rst;          // Active high system reset
// Coherence buses
input [3:0]             cbus_ack_array_i;
// broad_fifo
input                   fifo_status_empty_i;
input                   fifo_status_full_i;
// broad_fifo
input [BROAD_TYPE_WIDTH-1:0] broad_snoop_type_i; // The type of the broad
input [1:0]             broad_snoop_cpu_id_i; // The ID of the initiator CPU
input [BROAD_ID_WIDTH-1:0] broad_snoop_id_i; // The ID of the broad
 
// Outputs
//================================
output [4*CBUS_CMD_WIDTH-1:0] cbus_cmd_array_o; // Command for coherence bus.
                                      // write broadcast, read broadcast, write
                                      // enable or read enable 
// fifo
output                  broad_fifo_rd_o;

// Regs & wires
//================================
wire [CBUS_CMD_WIDTH-1:0] cbus_cmd3;  // Command for coherence bus.
wire [CBUS_CMD_WIDTH-1:0] cbus_cmd2;  // Command for coherence bus.
wire [CBUS_CMD_WIDTH-1:0] cbus_cmd1;  // Command for coherence bus.
wire [CBUS_CMD_WIDTH-1:0] cbus_cmd0;  // Command for coherence bus.
reg 	                  broadcast_in_progress; // A broadcast process
                                      // contains 2 stages. The first stage is 
                                      // to send read or write broadcast to
                                      // all CPUs and to receive an
                                      // acknowledge for each one. The second
                                      // stage is to send an
                                      // enable-access to the initiator CPU. 
reg  [3:0]                cbus_active_broad_array; // For each bit, when high a
                                      // broad access is sent to the CPU
reg  [3:0]                cbus_active_en_access_array; // For each bit, when
                                      // hing a enable-access is sent to the
                                      // CPU
reg                       broad_fifo_rd_o; // output
wire [3:0]                cbus_active_en_access_and_not_cbus_ack_array;
   
   
//cbus_cmd
assign cbus_cmd_array_o[(3+1)*CBUS_CMD_WIDTH-1 : 3*CBUS_CMD_WIDTH] = cbus_cmd3;
assign cbus_cmd_array_o[(2+1)*CBUS_CMD_WIDTH-1 : 2*CBUS_CMD_WIDTH] = cbus_cmd2;
assign cbus_cmd_array_o[(1+1)*CBUS_CMD_WIDTH-1 : 1*CBUS_CMD_WIDTH] = cbus_cmd1;
assign cbus_cmd_array_o[(0+1)*CBUS_CMD_WIDTH-1 : 0*CBUS_CMD_WIDTH] = cbus_cmd0;

// The command of the coherence bus is define according to the state of 
// cbus_active_broad_array and cbus_active_en_access_array
       //     \ /
assign cbus_cmd3 =
         // The broadcast proccess is active. Send the broadcast request 
         //                     \ /
         cbus_active_broad_array[3] ?
           broad_snoop_type_i == `MESI_ISC_BREQ_TYPE_WR ?
                                           `MESI_ISC_CBUS_CMD_WR_SNOOP:
                                           `MESI_ISC_CBUS_CMD_RD_SNOOP     :
         // All the broadcast proccesses were done. This CPU is the initiator
	 // of the request. Enable it to continue by send en_wr/en_rd
	 !(|cbus_active_broad_array)    &
         //                         \ /
         cbus_active_en_access_array[3] &
         ~broad_fifo_rd_o ?
           broad_snoop_type_i == `MESI_ISC_BREQ_TYPE_WR ?
                                           `MESI_ISC_CBUS_CMD_EN_WR:
                                           `MESI_ISC_CBUS_CMD_EN_RD        :
	                                   `MESI_ISC_CBUS_CMD_NOP;
       //     \ /
assign cbus_cmd2 =
         //                     \ /
         cbus_active_broad_array[2] ?
           broad_snoop_type_i == `MESI_ISC_BREQ_TYPE_WR ?
                                           `MESI_ISC_CBUS_CMD_WR_SNOOP:
                                           `MESI_ISC_CBUS_CMD_RD_SNOOP     :
	 !(|cbus_active_broad_array)    &
         //                         \ /
         cbus_active_en_access_array[2] &
         ~broad_fifo_rd_o ?
           broad_snoop_type_i == `MESI_ISC_BREQ_TYPE_WR ?
                                           `MESI_ISC_CBUS_CMD_EN_WR:
                                           `MESI_ISC_CBUS_CMD_EN_RD        :
	                                   `MESI_ISC_CBUS_CMD_NOP;
       //     \ /
assign cbus_cmd1 =
         //                     \ /
         cbus_active_broad_array[1] ?
           broad_snoop_type_i == `MESI_ISC_BREQ_TYPE_WR ?
                                           `MESI_ISC_CBUS_CMD_WR_SNOOP:
                                           `MESI_ISC_CBUS_CMD_RD_SNOOP     :
	 !(|cbus_active_broad_array)    &
         //                         \ /
         cbus_active_en_access_array[1] &
         ~broad_fifo_rd_o ?
           broad_snoop_type_i == `MESI_ISC_BREQ_TYPE_WR ?
                                           `MESI_ISC_CBUS_CMD_EN_WR:
                                           `MESI_ISC_CBUS_CMD_EN_RD        :
	                                   `MESI_ISC_CBUS_CMD_NOP;
       //     \ /
assign cbus_cmd0 =
         // Send read or write broad according to the type of the broad.
         //                     \ /
         cbus_active_broad_array[0] ?
           broad_snoop_type_i == `MESI_ISC_BREQ_TYPE_WR ?
                                           `MESI_ISC_CBUS_CMD_WR_SNOOP:
                                           `MESI_ISC_CBUS_CMD_RD_SNOOP     :
	 !(|cbus_active_broad_array)    &
         //                         \ /
         cbus_active_en_access_array[0] &
         ~broad_fifo_rd_o ?
           broad_snoop_type_i == `MESI_ISC_BREQ_TYPE_WR ?
                                           `MESI_ISC_CBUS_CMD_EN_WR:
                                           `MESI_ISC_CBUS_CMD_EN_RD        :

	                                   `MESI_ISC_CBUS_CMD_NOP;


// A broadcast process contains 5 sub-processes: Each one of the 4 CPU receives
// a snoop request and answers with an acknowledge. Then the initiator CPU
// receives an access enable and answer  answers with an acknowledge.
//
// The broadcast process *stages* are:
// 1. Curently there is no an active process. If there is a valid broadcast to
//  send then:
// 1.1 broadcast_in_progress   <= 1 : It represents an active process of
//     broadcast. It contains 4 snoop sub-processes and 1 enable sub-process. 
// 1.2 cbus_active_broad_array <= 4'b1111 : Each bit represents an active
//     sub-process, for each CPU - sending a snoop request and get an answer
//     with an acknowledge.
// 1.3 cbus_active_en_access_array[ID of initiator CPU] <= 1
//     The corresponding bit of the initiator CPU in the
//     cbus_active_en_access_array is set to enable in stage 4 to send an
//     enable-access to the initiator CPU.
// 2. cbus_active_broad_array[ID of CPU] <= 0
//    A snoop request is send for all the CPUs. For each CPU that answers with
//    acknowledge the corresponding bit is clear:
//    cbus_active_broad_array == 0
//    After all CPUs answer with acknowledge all the bits of 
//    cbus_active_broad_array are clear.
// 3. cbus_active_en_access_array[ID of initiator CPU] <= 0
//    broadcast_in_progress                            <= 0
//    The enable access is sent to the initiator CPU. When it answers with an
//    acknowledge then the broadcast process is finished:  the corresponding
//    bit in the cbus_active_en_access_array is clear and
//    the broadcast_in_progress is clear
//
//
// broadcast_in_progress
// There is an active action of the broadcast. Either not all CPU received the
// broadcast and return acknowledge. or the initiator CPU received the access
// enable and return acknowledge. 
//
// cbus_active_broad_array
// For each bit, when set - there is an active process of sending a snoop
// request and answering with an acknowledge.
// 
// cbus_active_en_access_array
// For each bit, when set -  there is an active process of sending 
// enable-access request to the initiator CPU and receive an acknowledge answer.
// The enable-access request is send only after all CPUs receive and approve
// the snoop requests.
//
// broad_fifo_rd_o
// When broadcast process in finish clear the corresponding entry from the fifo
always @(posedge clk or posedge rst)
  if (rst)
  begin
        broadcast_in_progress       <= 0;
        cbus_active_broad_array     <= 4'b0000; 
        cbus_active_en_access_array <= 4'b0000;
        broad_fifo_rd_o             <= 0;
  end
  else if (~broadcast_in_progress & ~broad_fifo_rd_o)
    if (~fifo_status_empty_i)
    // Stage 1
      begin
        broadcast_in_progress       <= 1;
        case (broad_snoop_cpu_id_i) // The initiator does not received a
	                            // broadcast for the same line it asks the
	                            // broadcast
          0:
          begin
            cbus_active_broad_array     <= 4'b1110;
	    cbus_active_en_access_array <= 4'b0001;
          end
          1:
          begin
            cbus_active_broad_array     <= 4'b1101;
	    cbus_active_en_access_array <= 4'b0010;
          end
          2:
          begin
            cbus_active_broad_array     <= 4'b1011;
	    cbus_active_en_access_array <= 4'b0100;
          end
          3:
          begin
            cbus_active_broad_array     <= 4'b0111;
	    cbus_active_en_access_array <= 4'b1000;
          end
          default
          begin
            cbus_active_broad_array     <= 4'b0000;
	    cbus_active_en_access_array <= 4'b0000;
          end
        endcase
        broad_fifo_rd_o             <= 0;
      end
    else // if (~fifo_status_empty_i)
    begin
        broadcast_in_progress       <= 0;
        cbus_active_broad_array     <= 4'b0000;
        cbus_active_en_access_array <= 4'b0000;
        broad_fifo_rd_o             <= 0;
    end
  else // if (~broadcast_in_progress)
    // Stage 2
    if (|cbus_active_broad_array)     // There is at least on active snoop
                                      //  sub-process
      begin
        broadcast_in_progress       <= 1;
	// Clear related sub-process of a CPU then returns ack for the snoop
        // request.
        cbus_active_broad_array     <= cbus_active_broad_array &
                                       ~cbus_ack_array_i;
        cbus_active_en_access_array <= cbus_active_en_access_array;
        broad_fifo_rd_o             <= 0;
      end
    // Stage 3
    else if (broad_fifo_rd_o)         // All snoop sub-process were done
      begin
        broadcast_in_progress       <= 0;
        cbus_active_broad_array     <= 0;
        cbus_active_en_access_array <= 0;
        broad_fifo_rd_o             <= 0;
      end
    else
      broad_fifo_rd_o <= !(|(cbus_active_en_access_and_not_cbus_ack_array));

assign cbus_active_en_access_and_not_cbus_ack_array =
        cbus_active_en_access_array  & ~cbus_ack_array_i;
   

endmodule
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  MESI_ISC Project                                            ////
////                                                              ////
////  Author(s):                                                  ////
////      - Yair Amitay       yair.amitay@yahoo.com               ////
////                          www.linkedin.com/in/yairamitay      ////
////                                                              ////
////  Description                                                 ////
////  mesi_isc_broad                                              ////
////  -------------------                                         ////
////                                                              ////
////                                                              ////
////  To Do:                                                      ////
////   -                                                          ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


module mesi_isc_broad
    (
     // Inputs
     clk,
     rst,
     cbus_ack_array_i,
     broad_fifo_wr_i,
     broad_addr_i,
     broad_type_i,
     broad_cpu_id_i,
     broad_id_i,
     // Outputs
     cbus_addr_o,
     cbus_cmd_array_o,
     fifo_status_full_o
     );
parameter
  CBUS_CMD_WIDTH           = 3,
  ADDR_WIDTH               = 32,
  BROAD_TYPE_WIDTH         = 2,  
  BROAD_ID_WIDTH           = 5,  
  BROAD_REQ_FIFO_SIZE      = 4,
  BROAD_REQ_FIFO_SIZE_LOG2 = 2;
   
// Inputs
//================================
// System
input                   clk;          // System clock
input                   rst;          // Active high system reset
// Coherence bus
input [3:0]             cbus_ack_array_i;
input 		        broad_fifo_wr_i; // Write the broadcast request
input [ADDR_WIDTH-1:0]  broad_addr_i; // Broad addresses
input [BROAD_TYPE_WIDTH-1:0] broad_type_i; // Broad type
input [1:0]             broad_cpu_id_i; // Initiators
                                      // CPU id array
input [BROAD_ID_WIDTH-1:0] broad_id_i; // Broadcast request ID array

// Outputs
//================================

output [ADDR_WIDTH-1:0] cbus_addr_o;  // Coherence bus address. All busses have
                                     // the same address
output [4*CBUS_CMD_WIDTH-1:0] cbus_cmd_array_o; // See broad_addr_i

output                  fifo_status_full_o; // The broad fifo is full
  
// Regs & wires
//================================
wire                    broad_fifo_rd; // Read broadcast
wire                    fifo_status_empty; // Status empty
wire                    fifo_status_full; // The broad fifo is full
wire [ADDR_WIDTH-1:0]   broad_snoop_addr; // Address of broadcast snooping
wire [BROAD_TYPE_WIDTH-1:0] broad_snoop_type;  // Type of broadcast snooping
wire [1:0]              broad_snoop_cpu_id; // ID of initiator of broadcast
                                          // snooping
wire [BROAD_ID_WIDTH-1:0] broad_snoop_id; // Broadcast snooping ID

// assign
//================================
assign cbus_addr_o[ADDR_WIDTH-1:0] = broad_snoop_addr[ADDR_WIDTH-1:0];
assign fifo_status_full_o = fifo_status_full;
   
// Breq fifo control
//================================
mesi_isc_broad_cntl #(CBUS_CMD_WIDTH,
                      BROAD_TYPE_WIDTH,
                      BROAD_ID_WIDTH)
   mesi_isc_broad_cntl 
    (
     // Inputs
     .clk                   (clk),
     .rst                   (rst),
     // Coherence buses
     .cbus_ack_array_i      (cbus_ack_array_i[3:0]),
     // broad_fifo
     .fifo_status_empty_i   (fifo_status_empty),
     .fifo_status_full_i    (fifo_status_full),
     // broad_fifo
     .broad_snoop_type_i    (broad_snoop_type[BROAD_TYPE_WIDTH-1:0]),
     .broad_snoop_cpu_id_i  (broad_snoop_cpu_id[1:0]),
     .broad_snoop_id_i      (broad_snoop_id[BROAD_ID_WIDTH-1:0]),
    
     // Outputs
     // Coherence buses
     .cbus_cmd_array_o      (cbus_cmd_array_o[4*CBUS_CMD_WIDTH-1:0]),
     // fifo
     .broad_fifo_rd_o       (broad_fifo_rd)			     
     );

// broad fifo
//================================
mesi_isc_basic_fifo #(ADDR_WIDTH         +       // DATA_WIDTH
                      BROAD_TYPE_WIDTH   +
                      2                  +       // BROAD_CPU_ID_WIDTH
                      BROAD_ID_WIDTH,
                      BROAD_REQ_FIFO_SIZE,       // FIFO_SIZE
                      BROAD_REQ_FIFO_SIZE_LOG2)  // FIFO_SIZE_LOG2
   //  \ /  (\ / marks the fifo ID) 
   broad_fifo 
    (
     // Inputs
     .clk                   (clk),
     .rst                   (rst),
     .wr_i                  (broad_fifo_wr_i),
     .rd_i                  (broad_fifo_rd),
     .data_i                ({broad_addr_i[ADDR_WIDTH-1:0],
                              broad_type_i[BROAD_TYPE_WIDTH-1:0],
                              broad_cpu_id_i[1:0],
                              broad_id_i[BROAD_ID_WIDTH-1:0]
                             }),
     // Outputs
     .data_o                ({broad_snoop_addr[ADDR_WIDTH-1:0],
                              broad_snoop_type[BROAD_TYPE_WIDTH-1:0],
                              broad_snoop_cpu_id[1:0],
                              broad_snoop_id[BROAD_ID_WIDTH-1:0]
                             }),
     .status_empty_o        (fifo_status_empty),
     .status_full_o         (fifo_status_full)
     );

endmodule
    //////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  MESI_ISC Project                                            ////
////                                                              ////
////  Author(s):                                                  ////
////      - Yair Amitay       yair.amitay@yahoo.com               ////
////                          www.linkedin.com/in/yairamitay      ////
////                                                              ////
////  Description                                                 ////
////  mesi_isc_define                                             ////
////  -------------------                                         ////
////  Contains the timescale and the define declaration of the    ////
////  block                                                       ////
//////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009 Authors and OPENCORES.ORG                 ////
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

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  MESI_ISC Project                                            ////
////                                                              ////
////  Author(s):                                                  ////
////      - Yair Amitay       yair.amitay@yahoo.com               ////
////                          www.linkedin.com/in/yairamitay      ////
////                                                              ////
////  Description                                                 ////
////  mesi_isc                                                    ////
////  -------------------                                         ////
////                                                              ////
////                                                              ////
////  To Do:                                                      ////
////   -                                                          ////
////                                                              ////
//////////////////////////////////////////////////////////////////////


module mesi_isc
    (
     // Inputs
     clk,
     rst,
     mbus_cmd3_i,
     mbus_cmd2_i,
     mbus_cmd1_i,
     mbus_cmd0_i,
     mbus_addr3_i,
     mbus_addr2_i,
     mbus_addr1_i,
     mbus_addr0_i,
     cbus_ack3_i,
     cbus_ack2_i,
     cbus_ack1_i,
     cbus_ack0_i,
     // Outputs
     cbus_addr_o,
     cbus_cmd3_o,
     cbus_cmd2_o,
     cbus_cmd1_o,
     cbus_cmd0_o,
     mbus_ack3_o,
     mbus_ack2_o,
     mbus_ack1_o,
     mbus_ack0_o
   );
   
parameter
  CBUS_CMD_WIDTH           = 3,
  ADDR_WIDTH               = 32,
  BROAD_TYPE_WIDTH         = 2,
  BROAD_ID_WIDTH           = 5,  
  BROAD_REQ_FIFO_SIZE      = 4,
  BROAD_REQ_FIFO_SIZE_LOG2 = 2,
  MBUS_CMD_WIDTH           = 3,
  BREQ_FIFO_SIZE           = 2,
  BREQ_FIFO_SIZE_LOG2      = 1;
   
// Inputs
//================================
// System
input                   clk;          // System clock
input                   rst;          // Active high system reset
// Main buses
input [MBUS_CMD_WIDTH-1:0] mbus_cmd3_i; // Main bus3 command
input [MBUS_CMD_WIDTH-1:0] mbus_cmd2_i; // Main bus2 command
input [MBUS_CMD_WIDTH-1:0] mbus_cmd1_i; // Main bus1 command
input [MBUS_CMD_WIDTH-1:0] mbus_cmd0_i; // Main bus0 command
// Coherence buses
input [ADDR_WIDTH-1:0]  mbus_addr3_i;  // Coherence bus3 address
input [ADDR_WIDTH-1:0]  mbus_addr2_i;  // Coherence bus2 address
input [ADDR_WIDTH-1:0]  mbus_addr1_i;  // Coherence bus1 address
input [ADDR_WIDTH-1:0]  mbus_addr0_i;  // Coherence bus0 address
input                   cbus_ack3_i;  // Coherence bus3 acknowledge
input                   cbus_ack2_i;  // Coherence bus2 acknowledge
input                   cbus_ack1_i;  // Coherence bus1 acknowledge
input                   cbus_ack0_i;  // Coherence bus0 acknowledge
   
// Outputs
//================================

output [ADDR_WIDTH-1:0] cbus_addr_o;  // Coherence bus address. All busses have
                                      // the same address
output [CBUS_CMD_WIDTH-1:0] cbus_cmd3_o; // Coherence bus3 command
output [CBUS_CMD_WIDTH-1:0] cbus_cmd2_o; // Coherence bus2 command
output [CBUS_CMD_WIDTH-1:0] cbus_cmd1_o; // Coherence bus1 command
output [CBUS_CMD_WIDTH-1:0] cbus_cmd0_o; // Coherence bus0 command


output                  mbus_ack3_o;  // Main bus3 acknowledge
output                  mbus_ack2_o;  // Main bus2 acknowledge
output                  mbus_ack1_o;  // Main bus1 acknowledge
output                  mbus_ack0_o;  // Main bus0 acknowledge
   
// Regs & wires
//================================
wire                    broad_fifo_wr;
wire [ADDR_WIDTH-1:0]   broad_addr;
wire [BROAD_ID_WIDTH-1:0] broad_id;
wire [BROAD_TYPE_WIDTH-1:0] broad_type;
wire [1:0]              broad_cpu_id;
wire                    broad_fifo_status_full;
   
// mesi_isc_broad
//================================
mesi_isc_broad #(CBUS_CMD_WIDTH,
                 ADDR_WIDTH,
                 BROAD_TYPE_WIDTH,  
                 BROAD_ID_WIDTH,  
                 BROAD_REQ_FIFO_SIZE,
                 BROAD_REQ_FIFO_SIZE_LOG2)
  mesi_isc_broad
    (
     // Inputs
     .clk                      (clk),
     .rst                      (rst),
     .cbus_ack_array_i         ({cbus_ack3_i,
                                 cbus_ack2_i,
                                 cbus_ack1_i,
                                 cbus_ack0_i}
                               ),
     .broad_fifo_wr_i          (broad_fifo_wr  ),
     .broad_addr_i             (broad_addr[ADDR_WIDTH-1:0]),
     .broad_type_i             (broad_type[BROAD_TYPE_WIDTH-1:0]),
     .broad_cpu_id_i           (broad_cpu_id[1:0]),
     .broad_id_i               (broad_id[BROAD_ID_WIDTH-1:0]),
     // Outputs
     .cbus_addr_o              (cbus_addr_o[ADDR_WIDTH-1:0]),
     .cbus_cmd_array_o         ({cbus_cmd3_o[CBUS_CMD_WIDTH-1:0],
                                 cbus_cmd2_o[CBUS_CMD_WIDTH-1:0],
                                 cbus_cmd1_o[CBUS_CMD_WIDTH-1:0],
                                 cbus_cmd0_o[CBUS_CMD_WIDTH-1:0]}
                               ),
     .fifo_status_full_o       (broad_fifo_status_full)
     );

// mesi_isc_breq_fifos
//================================
mesi_isc_breq_fifos #(MBUS_CMD_WIDTH,
                      ADDR_WIDTH,
                      BROAD_TYPE_WIDTH,  
                      BROAD_ID_WIDTH,  
                      BREQ_FIFO_SIZE,
                      BREQ_FIFO_SIZE_LOG2)
  mesi_isc_breq_fifos
    (
     // Inputs
     .clk                      (clk),
     .rst                      (rst),
     .mbus_cmd_array_i         ({mbus_cmd3_i[MBUS_CMD_WIDTH-1:0],
                                 mbus_cmd2_i[MBUS_CMD_WIDTH-1:0],
                                 mbus_cmd1_i[MBUS_CMD_WIDTH-1:0],
                                 mbus_cmd0_i[MBUS_CMD_WIDTH-1:0]}
                               ),
     .mbus_addr_array_i        ({mbus_addr3_i[ADDR_WIDTH-1:0],
                                 mbus_addr2_i[ADDR_WIDTH-1:0],
                                 mbus_addr1_i[ADDR_WIDTH-1:0],
                                 mbus_addr0_i[ADDR_WIDTH-1:0]}
                               ),
     .broad_fifo_status_full_i (broad_fifo_status_full),
     // Outputs
     .mbus_ack_array_o         ({mbus_ack3_o,
                                 mbus_ack2_o,
                                 mbus_ack1_o,
                                 mbus_ack0_o}
                                ),
     .broad_fifo_wr_o          (broad_fifo_wr  ),
     .broad_addr_o             (broad_addr[ADDR_WIDTH-1:0]),
     .broad_type_o             (broad_type[BROAD_TYPE_WIDTH-1:0]),
     .broad_cpu_id_o           (broad_cpu_id[1:0]),
     .broad_id_o               (broad_id[BROAD_ID_WIDTH-1:0])
     );

endmodule
