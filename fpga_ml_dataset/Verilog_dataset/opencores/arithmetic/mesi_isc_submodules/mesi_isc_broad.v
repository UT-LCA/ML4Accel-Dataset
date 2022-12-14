`define MESI_ISC_MBUS_CMD_NOP      3'd0
`define MESI_ISC_MBUS_CMD_WR       3'd1
`define MESI_ISC_MBUS_CMD_RD       3'd2
`define MESI_ISC_MBUS_CMD_WR_BROAD 3'd3
`define MESI_ISC_MBUS_CMD_RD_BROAD 3'd4
`define MESI_ISC_CBUS_CMD_NOP      3'd0
`define MESI_ISC_CBUS_CMD_WR_SNOOP 3'd1
`define MESI_ISC_CBUS_CMD_RD_SNOOP 3'd2
`define MESI_ISC_CBUS_CMD_EN_WR    3'd3
`define MESI_ISC_CBUS_CMD_EN_RD    3'd4
`define MESI_ISC_BREQ_TYPE_NOP 2'd0
`define MESI_ISC_BREQ_TYPE_WR  2'd1
`define MESI_ISC_BREQ_TYPE_RD  2'd2

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
\
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


