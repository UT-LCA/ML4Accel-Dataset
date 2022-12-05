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
