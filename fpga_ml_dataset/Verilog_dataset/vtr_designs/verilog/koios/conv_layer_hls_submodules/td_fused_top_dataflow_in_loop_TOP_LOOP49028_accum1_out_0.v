`define SIMULATION_MEMORY
`define EXPONENT 5
`define MANTISSA 10
`define ACTUAL_MANTISSA 11
`define EXPONENT_LSB 10
`define EXPONENT_MSB 14
`define MANTISSA_LSB 0
`define MANTISSA_MSB 9
`define MANTISSA_MUL_SPLIT_LSB 3
`define MANTISSA_MUL_SPLIT_MSB 9
`define SIGN 1
`define SIGN_LOC 15
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1

module td_fused_top_dataflow_in_loop_TOP_LOOP49028_accum1_out_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 3,
    BufferCount  = 2,
    MemLatency   = 1,
    IndexWidth   = 1
) (
    // system signals
    input  wire                    clk,
    input  wire                    reset,
    // initiator
    input  wire                    i_ce,
    input  wire                    i_write,
    output wire                    i_full_n,
    input  wire                    i_ce0,
    input  wire                    i_we0,
    input  wire [AddressWidth-1:0] i_address0,
    input  wire [DataWidth-1:0]    i_d0,
    output wire [DataWidth-1:0]    i_q0,
    input  wire                    i_ce1,
    input  wire                    i_we1,
    input  wire [AddressWidth-1:0] i_address1,
    input  wire [DataWidth-1:0]    i_d1,
    // target
    input  wire                    t_ce,
    input  wire                    t_read,
    output wire                    t_empty_n,
    input  wire                    t_ce0,
    input  wire                    t_we0,
    input  wire [AddressWidth-1:0] t_address0,
    input  wire [DataWidth-1:0]    t_d0,
    output wire [DataWidth-1:0]    t_q0,
    input  wire                    t_ce1,
    input  wire                    t_we1,
    input  wire [AddressWidth-1:0] t_address1,
    input  wire [DataWidth-1:0]    t_d1
);
//------------------------Local signal-------------------
// control/status
reg  [IndexWidth-1:0]   iptr    = 1'b0; // initiator index
reg  [IndexWidth-1:0]   tptr    = 1'b0; // target index
reg  [IndexWidth-1:0]   prev_iptr    = 1'b0; // previous initiator index
reg  [IndexWidth-1:0]   prev_tptr    = 1'b0; // previous target index
reg  [DataWidth-1:0]    reg_q0      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid0    = 1'b0; // buffer has valid data
reg  [DataWidth-1:0]    reg_q1      = 1'b0; // buffer used if reader is stalled
reg                     reg_valid1    = 1'b0; // buffer has valid data
reg  [IndexWidth:0]     count   = 1'b0; // count of written buffers
reg                     full_n  = 1'b1; // whether all buffers are written
reg                     empty_n = 1'b0; // whether none of the buffers is written
wire                    push_buf;       // finish writing a buffer
wire                    write_buf;      // write a buffer
wire                    pop_buf;        // finish reading a buffer
// buffer signals
wire [BufferCount-1:0] buf_ce0;
wire [BufferCount-1:0] buf_we0;
wire [AddressWidth-1:0] buf_a0_0, buf_a0_1;
wire [DataWidth-1:0] buf_d0_0, buf_d0_1;
wire [DataWidth-1:0] buf_q0_0, buf_q0_1;
wire [BufferCount-1:0] buf_ce1;
wire [BufferCount-1:0] buf_we1;
wire [AddressWidth-1:0] buf_a1_0, buf_a1_1;
wire [DataWidth-1:0] buf_d1_0, buf_d1_1;
//------------------------Instantiation------------------
//genvar i;
        td_fused_top_dataflow_in_loop_TOP_LOOP49028_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP49028_accum1_out_0_memcore_U_0 (
            .clk      ( clk ),
            .reset    ( reset ),
            .ce0      ( buf_ce0[ 0 ] ),
            .we0      ( buf_we0[ 0 ] ),
            .address0 ( buf_a0_0 ),
            .d0       ( buf_d0_0 ),
            .q0       ( buf_q0_0 ),
            .ce1      ( buf_ce1[ 0 ] ),
            .we1      ( buf_we1[ 0 ] ),
            .address1 ( buf_a1_0 ),
            .d1       ( buf_d1_0 )
        );
        td_fused_top_dataflow_in_loop_TOP_LOOP49028_accum1_out_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP49028_accum1_out_0_memcore_U_1 (
            .clk      ( clk ),
            .reset    ( reset ),
            .ce0      ( buf_ce0[ 1 ] ),
            .we0      ( buf_we0[ 1 ] ),
            .address0 ( buf_a0_1 ),
            .d0       ( buf_d0_1 ),
            .q0       ( buf_q0_1 ),
            .ce1      ( buf_ce1[ 1 ] ),
            .we1      ( buf_we1[ 1 ] ),
            .address1 ( buf_a1_1 ),
            .d1       ( buf_d1_1 )
        );

//++++++++++++++++++++++++buffer signals+++++++++++++++++
        assign buf_ce0[ 0 ] = (tptr ==  0  && empty_n) ? t_ce0
                             : (iptr ==  0 ) ? i_ce0 : 1'b0;
        assign buf_a0_0  = (tptr ==  0  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 0 ] = (tptr ==  0  && empty_n)  ? t_we0
                             : (iptr ==  0 ) ? i_we0 : 1'b0;
        assign buf_d0_0  = (tptr ==  0  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 0 ] = (tptr ==  0  && empty_n) ? t_ce1
                             : (iptr ==  0 ) ? i_ce1 : 1'b0;
        assign buf_a1_0  = (tptr ==  0  && empty_n) ?  t_address1 : i_address1;
        assign buf_we1[ 0 ] = (tptr ==  0  && empty_n)  ? t_we1
                             : (iptr ==  0 ) ? i_we1 : 1'b0;
        assign buf_d1_0  = (tptr ==  0  && empty_n) ? t_d1       : i_d1;
        assign buf_ce0[ 1 ] = (tptr ==  1  && empty_n) ? t_ce0
                             : (iptr ==  1 ) ? i_ce0 : 1'b0;
        assign buf_a0_1  = (tptr ==  1  && empty_n) ?  t_address0 : i_address0;
        assign buf_we0[ 1 ] = (tptr ==  1  && empty_n)  ? t_we0
                             : (iptr ==  1 ) ? i_we0 : 1'b0;
        assign buf_d0_1  = (tptr ==  1  && empty_n) ? t_d0       : i_d0;
        assign buf_ce1[ 1 ] = (tptr ==  1  && empty_n) ? t_ce1
                             : (iptr ==  1 ) ? i_ce1 : 1'b0;
        assign buf_a1_1  = (tptr ==  1  && empty_n) ?  t_address1 : i_address1;
        assign buf_we1[ 1 ] = (tptr ==  1  && empty_n)  ? t_we1
                             : (iptr ==  1 ) ? i_we1 : 1'b0;
        assign buf_d1_1  = (tptr ==  1  && empty_n) ? t_d1       : i_d1;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------Body---------------------------
assign i_q0      = (prev_iptr == 1'b1 ? buf_q0_1 : buf_q0_0);
assign t_q0      = reg_valid0 ? reg_q0 : (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);

//++++++++++++++++++++++++output+++++++++++++++++++++++++
assign i_full_n  = full_n;
assign t_empty_n = empty_n;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++control/status+++++++++++++++++
assign push_buf = i_ce & i_write & full_n;
assign write_buf = i_ce & i_write;
assign pop_buf  = t_ce & t_read & empty_n;

// iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        iptr <= 1'b0;
    else if (push_buf) begin
        if (iptr == BufferCount - 1'b1)
            iptr <= 1'b0;
        else
            iptr <= iptr + 1'b1;
    end
end

// tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        tptr <= 1'b0;
    else if (pop_buf) begin
        if (tptr == BufferCount - 1'b1)
            tptr <= 1'b0;
        else
            tptr <= tptr + 1'b1;
    end
end

// prev_iptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_iptr <= 1'b0;
    else begin
        prev_iptr <= iptr;
    end
end

// prev_tptr
always @(posedge clk) begin
    if (reset == 1'b1)
        prev_tptr <= 1'b0;
    else begin
        prev_tptr <= tptr;
    end
end

// reg_q0 and reg_valid0
always @(posedge clk) begin
    if (reset == 1'b1) begin
        reg_q0     <= 1'b0;
        reg_valid0 <= 1'b0;
    end else if (!t_ce0 && !reg_valid0) begin
        reg_q0     <= (prev_tptr == 1'b1 ? buf_q0_1 : buf_q0_0);
        reg_valid0 <= 1'b1;
    end else if (t_ce0) begin
        reg_valid0 <= 1'b0;
    end
end

// count
always @(posedge clk) begin
    if (reset == 1'b1)
        count <= 1'b0;
    else if (push_buf && !pop_buf)
        count <= count + 1'b1;
    else if (!push_buf && pop_buf)
        count <= count - 1'b1;
end

// full_n
always @(posedge clk) begin
    if (reset == 1'b1)
        full_n <= 1'b1;
    else if (push_buf && !pop_buf && count == BufferCount - 2'd2)
        full_n <= 1'b0;
    else if (!push_buf && pop_buf)
        full_n <= 1'b1;
end

// empty_n
always @(posedge clk) begin
    if (reset == 1'b1)
        empty_n <= 1'b0;
    else if ((!write_buf && pop_buf && count == 1'b1)
             || (pop_buf && count == 1'b0))
        empty_n <= 1'b0;
    else if (write_buf && !pop_buf)
        empty_n <= 1'b1;
end
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule
module td_fused_top_dataflow_in_loop_TOP_LOOP49028_accum1_out_0_memcore(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    q0,
    address1,
    ce1,
    we1,
    d1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd8;
parameter AddressWidth = 32'd3;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
input we1;
input[DataWidth - 1:0] d1;



/*td_fused_top_dataflow_in_loop_TOP_LOOP49028_accum1_out_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP49028_accum1_out_0_memcore_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .we1( we1 ),
    .d1( d1 ));*/

wire wren0, wren1;
assign wren0 = we0 & ce0;
assign wren1 = we1 & ce1;
wire [DataWidth-1:0] q1;
dpram
#(.AWIDTH(AddressWidth),
  .NUM_WORDS(AddressRange),
  .DWIDTH(DataWidth))
td_fused_top_dataflow_in_loop_TOP_LOOP49028_accum1_out_0_memcore_ram_U (
   .clk(clk),
   .address_a(address0),
   .address_b(address1),
   .wren_a(wren0),
   .wren_b(wren1),
   .data_a(d0),
   .data_b(d1),
   .out_a(q0),
   .out_b(q1)
);

endmodule
module dpram (

    clk,

    address_a,

    address_b,

    wren_a,

    wren_b,

    data_a,

    data_b,

    out_a,

    out_b

);

parameter AWIDTH=10;

parameter NUM_WORDS=1024;

parameter DWIDTH=32;

input clk;

input [(AWIDTH-1):0] address_a;

input [(AWIDTH-1):0] address_b;

input  wren_a;

input  wren_b;

input [(DWIDTH-1):0] data_a;

input [(DWIDTH-1):0] data_b;

output reg [(DWIDTH-1):0] out_a;

output reg [(DWIDTH-1):0] out_b;



`ifdef SIMULATION_MEMORY



reg [DWIDTH-1:0] ram[NUM_WORDS-1:0];

always @ (posedge clk) begin 

  if (wren_a) begin

      ram[address_a] <= data_a;

  end

  else begin

      out_a <= ram[address_a];

  end

end

  

always @ (posedge clk) begin 

  if (wren_b) begin

      ram[address_b] <= data_b;

  end 

  else begin

      out_b <= ram[address_b];

  end

end



`else



dual_port_ram u_dual_port_ram(

.addr1(address_a),

.we1(wren_a),

.data1(data_a),

.out1(out_a),

.addr2(address_b),

.we2(wren_b),

.data2(data_b),

.out2(out_b),

.clk(clk)

);

`endif

endmodule