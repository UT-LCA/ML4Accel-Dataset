
module ldpc_vncluster #(
  parameter NUMVNS         = 3,
  parameter ENABLE_DISABLE = 1,
  parameter FOLDFACTOR     = 1,
  parameter LASTSHIFTWIDTH = 4,
  parameter LLRWIDTH       = 6
)(
  input clk,
  input rst,

  // LLR I/O
  input                       llr_access,
  input[7+FOLDFACTOR-1:0]     llr_addr,
  input                       llr_din_we,
  input[NUMVNS*LLRWIDTH-1:0]  llr_din,
  output[NUMVNS*LLRWIDTH-1:0] llr_dout,

  // message control
  input                   iteration,
  input                   first_half,
  input                   first_iteration,  // ignore upmsgs
  input                   we_vnmsg,
  input                   disable_vn,
  input[7+FOLDFACTOR-1:0] addr_vn,

  // message I/O
  input  wire[NUMVNS*LLRWIDTH-1:0] sh_cluster_msg,
  output wire[NUMVNS*LLRWIDTH-1:0] vn_cluster_msg
);

wire   zero;
assign zero = 0;

////////////////////////
// 2-d/1-d conversion //
////////////////////////
wire[LLRWIDTH-1:0] vn_msg[0:NUMVNS-1];
wire[LLRWIDTH-1:0] sh_msg[0:NUMVNS-1];
wire[LLRWIDTH-1:0] llr_din_2d[0:NUMVNS-1];
wire[LLRWIDTH-1:0] llr_dout_2d[0:NUMVNS-1];

generate
  genvar j;

  for( j=0; j<NUMVNS; j=j+1 )
  begin: convert1d2d
    assign vn_cluster_msg[LLRWIDTH*j+LLRWIDTH-1 -: LLRWIDTH] = vn_msg[j];
    assign sh_msg[j] = sh_cluster_msg[LLRWIDTH*j+LLRWIDTH-1 -: LLRWIDTH];
    
    assign llr_din_2d[j] = llr_din[LLRWIDTH*j+LLRWIDTH-1 -: LLRWIDTH];
    assign llr_dout[LLRWIDTH*j+LLRWIDTH-1 -: LLRWIDTH] = llr_dout_2d[j];
  end
endgenerate

//////////
// VN's //
//////////
wire                   llrram_we;
wire[7+FOLDFACTOR-1:0] vnram_wraddr;
wire[7+FOLDFACTOR-1:0] vnram_rdaddr;
wire[LLRWIDTH-1:0]     llrram_din[0:NUMVNS-1];
wire[LLRWIDTH-1:0]     llrram_dout[0:NUMVNS-1];

wire                 upmsg_we;
wire[2*LLRWIDTH+4:0] upmsg_din[0:NUMVNS-1];
wire[2*LLRWIDTH+4:0] upmsg_dout[0:NUMVNS-1];

wire upmsg_we_last;

generate
  genvar i;

  for( i=0; i<NUMVNS; i=i+1 )
  begin: varnodes
    // first
    if( i==0 )
    begin
      ldpc_vn #( .FOLDFACTOR(FOLDFACTOR),
                 .LLRWIDTH  (LLRWIDTH)
      ) ldpc_vn0i (
        .clk              (clk),
        .rst              (rst),
        .llr_access       (llr_access),
        .llr_addr         (llr_addr),
        .llr_din_we       (llr_din_we),
        .llr_din          (llr_din_2d[i]),
        .llr_dout         (llr_dout_2d[i]),
        .iteration        (iteration),
        .first_half       (first_half),
        .first_iteration  (first_iteration),
        .we_vnmsg         (we_vnmsg),
        .disable_vn(zero),
        .addr_vn          (addr_vn),
        .sh_msg           (sh_msg[i]),
        .vn_msg           (vn_msg[i]),
        .vnram_wraddr     (vnram_wraddr),
        .vnram_rdaddr     (vnram_rdaddr),
        .upmsg_we         (upmsg_we),
        .upmsg_din        (upmsg_din[i]),
        .upmsg_dout       (upmsg_dout[i])
      );
    end

    // last
    if( i==NUMVNS-1 )
    begin
      ldpc_vn #( .FOLDFACTOR(FOLDFACTOR),
                 .LLRWIDTH  (LLRWIDTH)
      ) ldpc_vnlasti (
        .clk              (clk),
        .rst              (rst),
        .llr_access       (llr_access),
        .llr_addr         (llr_addr),
        .llr_din_we       (llr_din_we),
        .llr_din          (llr_din_2d[i]),
        .llr_dout         (llr_dout_2d[i]),
        .iteration        (iteration),
        .first_half       (first_half),
        .first_iteration  (first_iteration),
        .we_vnmsg         (we_vnmsg),
        .disable_vn(disable_vn),
        .addr_vn          (addr_vn),
        .sh_msg           (sh_msg[i]),
        .vn_msg           (vn_msg[i]),
        .vnram_wraddr     (),
        .vnram_rdaddr     (),
        .upmsg_we         (upmsg_we_last),
        .upmsg_din        (upmsg_din[i]),
        .upmsg_dout       (upmsg_dout[i])
      );
    end

    if( (i!=0) && (i!=NUMVNS-1) )
    begin
      ldpc_vn #( .FOLDFACTOR(FOLDFACTOR),
                 .LLRWIDTH  (LLRWIDTH)
      ) ldpc_vni (
        .clk              (clk),
        .rst              (rst),
        .llr_access       (llr_access),
        .llr_addr         (llr_addr),
        .llr_din_we       (llr_din_we),
        .llr_din          (llr_din_2d[i]),
        .llr_dout         (llr_dout_2d[i]),
        .iteration        (iteration),
        .first_half       (first_half),
        .first_iteration  (first_iteration),
        .we_vnmsg         (we_vnmsg),
        .disable_vn(zero),
        .addr_vn          (addr_vn),
        .sh_msg           (sh_msg[i]),
        .vn_msg           (vn_msg[i]),
        .vnram_wraddr     (),
        .vnram_rdaddr     (),
        .upmsg_we         (),
        .upmsg_din        (upmsg_din[i]),
        .upmsg_dout       (upmsg_dout[i])
      );
    end
  end
endgenerate

// Combine RAM I/O's
wire[NUMVNS*(2*LLRWIDTH+5)-1:0] combined_din;
wire[NUMVNS*(2*LLRWIDTH+5)-1:0] combined_dout;

generate
  genvar k;

  for( k=0; k<NUMVNS; k=k+1 )
  begin: combine_all
    assign combined_din[k*(2*LLRWIDTH+5)+2*LLRWIDTH+4 -: 2*LLRWIDTH+5] = upmsg_din[k];
    assign upmsg_dout[k] = combined_dout[k*(2*LLRWIDTH+5)+2*LLRWIDTH+4 -: 2*LLRWIDTH+5];
  end
endgenerate

generate
  if( ENABLE_DISABLE )
  begin: split_rams
    ldpc_ram_behav #(
      .WIDTH    ((NUMVNS-1)*(2*LLRWIDTH+5)),
      .LOG2DEPTH(7+FOLDFACTOR)
    ) ldpc_vn_ram0i (
      .clk(clk),
      .we(upmsg_we),
      .din(combined_din[(NUMVNS-1)*(2*LLRWIDTH+5)-1 : 0]),
      .wraddr(vnram_wraddr),
      .rdaddr(vnram_rdaddr),
      .dout(combined_dout[(NUMVNS-1)*(2*LLRWIDTH+5)-1 : 0])
    );

    ldpc_ram_behav #(
      .WIDTH    (2*LLRWIDTH+5),
      .LOG2DEPTH(7+FOLDFACTOR)
    ) ldpc_vn_ramlasti (
      .clk(clk),
      .we(upmsg_we_last),
      .din(combined_din[NUMVNS*(2*LLRWIDTH+5)-1 -: 2*LLRWIDTH+5]),
      .wraddr(vnram_wraddr),
      .rdaddr(vnram_rdaddr),
      .dout(combined_dout[NUMVNS*(2*LLRWIDTH+5)-1 -: 2*LLRWIDTH+5])
    );
  end
  else
  begin: united_ram
    ldpc_ram_behav #(
      .WIDTH    (NUMVNS*(2*LLRWIDTH+5)),
      .LOG2DEPTH(7+FOLDFACTOR)
    ) ldpc_vn_rami (
      .clk   (clk),
      .we    (upmsg_we),
      .din   (combined_din),
      .wraddr(vnram_wraddr),
      .rdaddr(vnram_rdaddr),
      .dout  (combined_dout)
    );
  end
endgenerate

endmodule
module ldpc_vn #(
  parameter FOLDFACTOR     = 1,
  parameter LLRWIDTH       = 6
)(
  input clk,
  input rst,

  // LLR I/O
  input                   llr_access,
  input[7+FOLDFACTOR-1:0] llr_addr,
  input                   llr_din_we,
  input[LLRWIDTH-1:0]     llr_din,
  output[LLRWIDTH-1:0]    llr_dout,

  // message control
  input                   iteration,
  input                   first_half,
  input                   first_iteration,  // ignore upmsgs
  input                   we_vnmsg,
  input                   disable_vn,
  input[7+FOLDFACTOR-1:0] addr_vn,

  // message I/O
  input[LLRWIDTH-1:0]  sh_msg,
  output[LLRWIDTH-1:0] vn_msg,

  // Attached RAM, holds iteration number, original LLR and message sum
  output[7+FOLDFACTOR-1:0] vnram_wraddr,
  output[7+FOLDFACTOR-1:0] vnram_rdaddr,
  output                   upmsg_we,
  output[2*LLRWIDTH+4:0]   upmsg_din,
  input[2*LLRWIDTH+4:0]    upmsg_dout
);

// Split RAM outputs
wire[LLRWIDTH-1:0] llr_orig;
wire[LLRWIDTH+3:0] stored_msg_sum;
wire               stored_iteration;

assign llr_orig         = upmsg_dout[LLRWIDTH-1:0];
assign stored_msg_sum   = upmsg_dout[2*LLRWIDTH+3:LLRWIDTH];
assign stored_iteration = upmsg_dout[2*LLRWIDTH+4];

/************************************************************
 * Add 1's complement numbers, assume overflow not possible *
 ************************************************************/
function[LLRWIDTH+3:0] AddNewMsg( input[LLRWIDTH+3:0] a,
                                  input[LLRWIDTH-1:0] b );
  reg               signa;
  reg               signb;
  reg[LLRWIDTH+2:0] maga;
  reg[LLRWIDTH+2:0] magb;
  
  reg[LLRWIDTH+2:0] sum;
  reg[LLRWIDTH+2:0] diffa;
  reg[LLRWIDTH+2:0] diffb;
  
  reg               add;
  reg               b_big;
  reg               sign;
  reg[LLRWIDTH+3:0] result;
  
begin
  // strip out magnitude and sign bits
  signa = a[LLRWIDTH+3];
  signb = b[LLRWIDTH-1];
  maga  = a[LLRWIDTH+2:0];
  magb  = { 4'b0000, b[LLRWIDTH-2:0] };

  // basic calculations
  sum   = maga + magb;
  diffa = maga - magb;
  diffb = magb - maga;
  
  // control bits
  add   = signa==signb;
  b_big = maga<magb;
  sign  = b_big ? signb : signa;

  if( add )
    result = { sign, sum };
  else if( b_big )
    result = { sign, diffb };
  else
    result = { sign, diffa };

  AddNewMsg = result;
end
endfunction

/*************************************************
 * Saturate message to fewer bits before passing *
 *************************************************/
function[LLRWIDTH-1:0] SaturateMsg( input[LLRWIDTH+3:0] a );
begin
  if( a[LLRWIDTH+2:LLRWIDTH-1] != 4'b0000 )
    SaturateMsg[LLRWIDTH-2:0] = { (LLRWIDTH-1){1'b1} };
  else
    SaturateMsg[LLRWIDTH-2:0] = a[LLRWIDTH-2:0];
  
  SaturateMsg[LLRWIDTH-1] = a[LLRWIDTH+3];
end
endfunction

/********************************************
 * Delays to align controls with RAM output *
 ********************************************/
localparam RAM_LATENCY = 2;

integer loopvar1;

reg[7+FOLDFACTOR-1:0] vnram_rdaddr_int;

reg[LLRWIDTH-1:0]     sh_msg_del[0:RAM_LATENCY-1];
reg                   we_vnmsg_del[0:RAM_LATENCY-1];
reg[7+FOLDFACTOR-1:0] vnram_rdaddr_del[0:RAM_LATENCY-1];
reg                   disable_del[0:RAM_LATENCY-1];    

wire[LLRWIDTH-1:0]     sh_msg_aligned_ram;
wire                   we_vnmsg_aligned_ram;
wire[7+FOLDFACTOR-1:0] vnram_rdaddr_aligned_ram;
wire                   disable_aligned_ram;

reg recycle_result;

// mux in alternative address for final read-out
assign vnram_rdaddr = vnram_rdaddr_int;
always @( * ) vnram_rdaddr_int <= #1 llr_access ? llr_addr : addr_vn;

assign sh_msg_aligned_ram       = sh_msg_del[RAM_LATENCY-1];
assign we_vnmsg_aligned_ram     = we_vnmsg_del[RAM_LATENCY-1];
assign vnram_rdaddr_aligned_ram = vnram_rdaddr_del[RAM_LATENCY-1];
assign disable_aligned_ram      = disable_del[RAM_LATENCY-1];    

always @( posedge rst, posedge clk )
  if( rst )
  begin
    for( loopvar1=0; loopvar1<RAM_LATENCY; loopvar1=loopvar1+1 )
    begin
      sh_msg_del[loopvar1]       <= 0;
      we_vnmsg_del[loopvar1]     <= 0;
      vnram_rdaddr_del[loopvar1] <= 0;
      disable_del[loopvar1]      <= 0;
    end
    recycle_result <= 0;
  end
  else
  begin
    sh_msg_del[0]        <= sh_msg;
    we_vnmsg_del[0]      <= we_vnmsg;
    vnram_rdaddr_del[0]  <= vnram_rdaddr_int; 
    disable_del[0]       <= disable_vn;

    for( loopvar1=1; loopvar1<RAM_LATENCY; loopvar1=loopvar1+1 )
    begin
      sh_msg_del[loopvar1]       <= sh_msg_del[loopvar1 -1];
      we_vnmsg_del[loopvar1]     <= we_vnmsg_del[loopvar1 -1];
      vnram_rdaddr_del[loopvar1] <= vnram_rdaddr_del[loopvar1 -1];
      disable_del[loopvar1]      <= disable_del[loopvar1 -1];
    end
    
    // Use previous result rather than the RAM contents for two adjacent
    // writes to the same address
    recycle_result <= (vnram_rdaddr_aligned_ram==vnram_rdaddr_del[RAM_LATENCY-2]) &
                      we_vnmsg_aligned_ram & we_vnmsg_del[RAM_LATENCY-2];
  end

/************************
 * Message calculations *
 ************************/
// Add initial LLR to message offset (except for first iteration)
reg[LLRWIDTH+3:0]  msg0_norst;
wire[LLRWIDTH+3:0] msg0;
reg[LLRWIDTH-1:0]  msg1;

wire start_new_upmsg;
reg  rst_msg0;

wire[LLRWIDTH+3:0] msg_sum;

reg[LLRWIDTH+3:0] msg_sum_reg;

// Add upmsg to the result, except:
// - during first iteration, since no upmsg exists
// - first message of each new iteration, where upmsg needs to be reset
assign start_new_upmsg = (stored_iteration!=iteration) & we_vnmsg_aligned_ram;

assign msg0 = rst_msg0 ? 0 : msg0_norst;

always @( posedge clk, posedge rst )
  if( rst )
  begin
    msg0_norst  <= 0;
    rst_msg0    <= 0;
    msg1        <= 0;
    msg_sum_reg <= 0;
  end
  else
  begin
    // msg0 = sum of received upstream messages
    // clear msg0 when beginning a new set of upstream messages
    msg0_norst <= recycle_result ? msg_sum : stored_msg_sum;
    rst_msg0   <= start_new_upmsg & ~recycle_result;
    
    msg1 <= (llr_access || first_half) ? llr_orig : sh_msg_aligned_ram;
    
    msg_sum_reg <= msg_sum;
  end

// When creating downstream messages, or preparing final result:
//      msg_sum = llr + sum of messages
// When receiving upstream messages:
//      msg_sum = new message + sum of messages
assign msg_sum = AddNewMsg( msg0, msg1 );

/****************************************
 * Delay controls to align with msg_sum *
 ****************************************/
localparam CALC_LATENCY = 2;

integer loopvar2;

reg                   we_vnmsg_del2[0:RAM_LATENCY-1];
reg[7+FOLDFACTOR-1:0] vnram_rdaddr_del2[0:RAM_LATENCY-1];
reg[LLRWIDTH-1:0]     llrram_dout_del2[0:RAM_LATENCY-1];
reg                   disable_del2[0:RAM_LATENCY-1];    

wire                   we_vnmsg_aligned_msg;
wire[7+FOLDFACTOR-1:0] vnram_rdaddr_aligned_msg;
wire[LLRWIDTH-1:0]     llrram_dout_aligned_msg;
wire                   disable_aligned_msg;

assign we_vnmsg_aligned_msg     = we_vnmsg_del2[RAM_LATENCY-1];
assign vnram_rdaddr_aligned_msg = vnram_rdaddr_del2[RAM_LATENCY-1];
assign llrram_dout_aligned_msg  = llrram_dout_del2[RAM_LATENCY-1];
assign disable_aligned_msg      = disable_del2[RAM_LATENCY-1];    

always @( posedge rst, posedge clk )
  if( rst )
  begin
    for( loopvar2=0; loopvar2<RAM_LATENCY; loopvar2=loopvar2+1 )
    begin
      we_vnmsg_del2[loopvar2]     <= 0;
      vnram_rdaddr_del2[loopvar2] <= 0;
      llrram_dout_del2[loopvar2]  <= 0;
      disable_del2[loopvar2]      <= 0;
    end
  end
  else
  begin
    we_vnmsg_del2[0]      <= we_vnmsg_aligned_ram;
    vnram_rdaddr_del2[0]  <= vnram_rdaddr_aligned_ram; 
    llrram_dout_del2[0]   <= llr_orig;
    disable_del2[0]       <= disable_aligned_ram;

    for( loopvar2=1; loopvar2<RAM_LATENCY; loopvar2=loopvar2+1 )
    begin
      we_vnmsg_del2[loopvar2]     <= we_vnmsg_del2[loopvar2 -1];
      vnram_rdaddr_del2[loopvar2] <= vnram_rdaddr_del2[loopvar2 -1];
      llrram_dout_del2[loopvar2]  <= llrram_dout_del2[loopvar2 -1];
      disable_del2[loopvar2]      <= disable_del2[loopvar2 -1];
    end
  end

/*******************************
 * Write message totals to RAM *
 *******************************/
reg[7+FOLDFACTOR-1:0] vnram_wraddr_int;
reg[LLRWIDTH-1:0]     new_llr;
reg                   new_iteration;
reg[LLRWIDTH+3:0]     new_msg_sum;
reg                   upmsg_we_int;

assign vnram_wraddr = vnram_wraddr_int;
assign upmsg_din    = { new_iteration, new_msg_sum, new_llr };
assign upmsg_we     = upmsg_we_int;

always @( posedge rst, posedge clk )
  if( rst )
  begin
    vnram_wraddr_int <= 0;
    new_llr          <= 0;
    new_msg_sum      <= 0;
    new_iteration    <= 0;
    upmsg_we_int     <= 1;
  end
  else
  begin
    // mux and register outputs
    vnram_wraddr_int <= #1 llr_access ? llr_addr : vnram_rdaddr_aligned_msg;
    new_llr          <= #1 llr_access ? llr_din  : llrram_dout_aligned_msg;
    new_msg_sum      <= #1 llr_access ? 0        : msg_sum_reg;
    
    new_iteration    <= #1 llr_access | iteration;
    
    upmsg_we_int     <= #1 ~(llr_din_we | (we_vnmsg_aligned_msg & ~disable_aligned_msg));
  end

/*****************************************************************
 * Saturate message to fewer bits for message passing and output *
 *****************************************************************/
reg[LLRWIDTH-1:0] vn_msg_int;

assign llr_dout = vn_msg_int;
assign vn_msg   = vn_msg_int;

always @( posedge rst, posedge clk )
  if( rst )
    vn_msg_int <= 0;
  else
    vn_msg_int <= SaturateMsg(msg_sum_reg);

endmodule

module ldpc_ram_behav #(
  parameter WIDTH     = 4,
  parameter LOG2DEPTH = 4
)(
  input                clk,
  input                we,
  input[WIDTH-1:0]     din,
  input[LOG2DEPTH-1:0] wraddr,
  input[LOG2DEPTH-1:0] rdaddr,
  output[WIDTH-1:0]    dout
);

reg[WIDTH-1:0]     storage[0:2**LOG2DEPTH -1];
reg[LOG2DEPTH-1:0] addr_del;
reg[WIDTH-1:0]     dout_int;

assign dout = dout_int;

always @( posedge clk )
begin
  if( !we )
    storage[wraddr] <= din;
  
  addr_del <= rdaddr;
  
  dout_int <= storage[addr_del];
end

endmodule


