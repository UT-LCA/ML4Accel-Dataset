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

module td_fused_top_dataflow_in_loop_TOP_LOOP49028_weight_vecs_0_0_0
#(parameter
    DataWidth    = 16,
    AddressRange = 32,
    AddressWidth = 5,
    BufferCount  = 2,
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
    // target
    input  wire                    t_ce,
    input  wire                    t_read,
    output wire                    t_empty_n,
    input  wire                    t_ce0,
    input  wire                    t_we0,
    input  wire [AddressWidth-1:0] t_address0,
    input  wire [DataWidth-1:0]    t_d0,
    output wire [DataWidth-1:0]    t_q0
);
//------------------------Local signal-------------------
// control/status
reg  [IndexWidth-1:0]   iptr    = 1'b0; // initiator index
reg  [IndexWidth-1:0]   tptr    = 1'b0; // target index
reg  [IndexWidth:0]     count   = 1'b0; // count of written buffers
reg                     full_n  = 1'b1; // whether all buffers are written
reg                     empty_n = 1'b0; // whether none of the buffers is written
wire                    push_buf;       // finish writing a buffer
wire                    write_buf;      // write a buffer
wire                    pop_buf;        // finish reading a buffer
wire [AddressWidth+IndexWidth-1:0]   memcore_iaddr;
wire [AddressWidth+IndexWidth-1:0]   memcore_taddr;

//------------------------Instantiation------------------
assign memcore_iaddr = {i_address0, iptr};
assign memcore_taddr = {t_address0, tptr};
td_fused_top_dataflow_in_loop_TOP_LOOP49028_weight_vecs_0_0_0_memcore td_fused_top_dataflow_in_loop_TOP_LOOP49028_weight_vecs_0_0_0_memcore_U (
    .clk      ( clk ),
    .reset    ( reset ),
    .ce0      ( i_ce0 ),
    .we0      ( i_we0),
    .address0 ( memcore_iaddr ),
    .d0       ( i_d0 ),
    .q0       ( i_q0 ),

    .ce1      ( t_ce0 ),
    .we1      ( t_we0),
    .address1 ( memcore_taddr ),
    .d1       ( t_d0 ),
    .q1       ( t_q0 )
);

//------------------------Body---------------------------

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
module td_fused_top_dataflow_in_loop_TOP_LOOP49028_weight_vecs_0_0_0_memcore(
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
    d1,
    q1);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd64;
parameter AddressWidth = 32'd6;
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
output[DataWidth - 1:0] q1;



/*td_fused_top_dataflow_in_loop_TOP_LOOP49028_weight_vecs_0_0_0_memcore_ram td_fused_top_dataflow_in_loop_TOP_LOOP49028_weight_vecs_0_0_0_memcore_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .we1( we1 ),
    .d1( d1 ),
    .q1( q1 ));*/

wire wren0, wren1;
assign wren0 = we0 & ce0;
assign wren1 = we1 & ce1;
dpram
#(.AWIDTH(AddressWidth),
  .NUM_WORDS(AddressRange),
  .DWIDTH(DataWidth))
td_fused_top_dataflow_in_loop_TOP_LOOP49028_weight_vecs_0_0_0_memcore_ram_U (
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



