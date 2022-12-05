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

module td_fused_top_tdf8_poolOutputs (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        output_indices_04_dout,
        output_indices_04_empty_n,
        output_indices_04_read,
        output_indices_15_dout,
        output_indices_15_empty_n,
        output_indices_15_read,
        resetMaximum6_dout,
        resetMaximum6_empty_n,
        resetMaximum6_read,
        storeOutput7_dout,
        storeOutput7_empty_n,
        storeOutput7_read,
        p_read,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [3:0] output_indices_04_dout;
input   output_indices_04_empty_n;
output   output_indices_04_read;
input  [7:0] output_indices_15_dout;
input   output_indices_15_empty_n;
output   output_indices_15_read;
input  [0:0] resetMaximum6_dout;
input   resetMaximum6_empty_n;
output   resetMaximum6_read;
input  [0:0] storeOutput7_dout;
input   storeOutput7_empty_n;
output   storeOutput7_read;
input  [15:0] p_read;
output  [13:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg output_indices_04_read;
reg output_indices_15_read;
reg resetMaximum6_read;
reg storeOutput7_read;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] max_vals_0;
reg    output_indices_04_blk_n;
wire    ap_CS_fsm_state2;
reg    output_indices_15_blk_n;
reg    resetMaximum6_blk_n;
reg    storeOutput7_blk_n;
reg   [3:0] output_indices_04_read_reg_147;
reg   [7:0] output_indices_15_read_reg_152;
wire   [0:0] storeOutput7_read_read_fu_82_p2;
reg   [0:0] storeOutput7_read_reg_157;
wire    grp_tdf8_writeOutputs_unaligned_fu_88_ap_start;
wire    grp_tdf8_writeOutputs_unaligned_fu_88_ap_done;
wire    grp_tdf8_writeOutputs_unaligned_fu_88_ap_idle;
wire    grp_tdf8_writeOutputs_unaligned_fu_88_ap_ready;
wire   [13:0] grp_tdf8_writeOutputs_unaligned_fu_88_out_data_address1;
wire    grp_tdf8_writeOutputs_unaligned_fu_88_out_data_ce1;
wire    grp_tdf8_writeOutputs_unaligned_fu_88_out_data_we1;
wire   [63:0] grp_tdf8_writeOutputs_unaligned_fu_88_out_data_d1;
reg    grp_tdf8_writeOutputs_unaligned_fu_88_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    ap_block_state4_on_subcall_done;
wire   [15:0] select_ln24_fu_126_p3;
reg    ap_block_state2;
reg    ap_block_state1;
wire   [0:0] grp_fu_110_p2;
wire   [0:0] or_ln24_fu_120_p2;
reg    grp_fu_110_ce;
reg   [3:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 max_vals_0 = 16'd0;
#0 grp_tdf8_writeOutputs_unaligned_fu_88_ap_start_reg = 1'b0;
end

td_fused_top_tdf8_writeOutputs_unaligned grp_tdf8_writeOutputs_unaligned_fu_88(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_tdf8_writeOutputs_unaligned_fu_88_ap_start),
    .ap_done(grp_tdf8_writeOutputs_unaligned_fu_88_ap_done),
    .ap_idle(grp_tdf8_writeOutputs_unaligned_fu_88_ap_idle),
    .ap_ready(grp_tdf8_writeOutputs_unaligned_fu_88_ap_ready),
    .i(output_indices_04_read_reg_147),
    .j(output_indices_15_read_reg_152),
    .out_data_address1(grp_tdf8_writeOutputs_unaligned_fu_88_out_data_address1),
    .out_data_ce1(grp_tdf8_writeOutputs_unaligned_fu_88_out_data_ce1),
    .out_data_we1(grp_tdf8_writeOutputs_unaligned_fu_88_out_data_we1),
    .out_data_d1(grp_tdf8_writeOutputs_unaligned_fu_88_out_data_d1),
    .max_vals_0(max_vals_0)
);

td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 1 ))
hcmp_16ns_16ns_1_2_no_dsp_1_U516(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_110_ce),
    .din0(max_vals_0),
    .din1(p_read),
    .opcode(5'd4),
    .dout(grp_fu_110_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_tdf8_writeOutputs_unaligned_fu_88_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_tdf8_writeOutputs_unaligned_fu_88_ap_start_reg <= 1'b1;
        end else if ((grp_tdf8_writeOutputs_unaligned_fu_88_ap_ready == 1'b1)) begin
            grp_tdf8_writeOutputs_unaligned_fu_88_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        max_vals_0 <= select_ln24_fu_126_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        output_indices_04_read_reg_147 <= output_indices_04_dout;
        output_indices_15_read_reg_152 <= output_indices_15_dout;
        storeOutput7_read_reg_157 <= storeOutput7_dout;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)) | (~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2)))) begin
        grp_fu_110_ce = 1'b1;
    end else begin
        grp_fu_110_ce = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        output_indices_04_blk_n = output_indices_04_empty_n;
    end else begin
        output_indices_04_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        output_indices_04_read = 1'b1;
    end else begin
        output_indices_04_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        output_indices_15_blk_n = output_indices_15_empty_n;
    end else begin
        output_indices_15_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        output_indices_15_read = 1'b1;
    end else begin
        output_indices_15_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        resetMaximum6_blk_n = resetMaximum6_empty_n;
    end else begin
        resetMaximum6_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        resetMaximum6_read = 1'b1;
    end else begin
        resetMaximum6_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        storeOutput7_blk_n = storeOutput7_empty_n;
    end else begin
        storeOutput7_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        storeOutput7_read = 1'b1;
    end else begin
        storeOutput7_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (storeOutput7_read_read_fu_82_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else if ((~((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0)) & (storeOutput7_read_read_fu_82_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (1'b0 == ap_block_state4_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_block_state2 = ((storeOutput7_empty_n == 1'b0) | (resetMaximum6_empty_n == 1'b0) | (output_indices_15_empty_n == 1'b0) | (output_indices_04_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state4_on_subcall_done = ((grp_tdf8_writeOutputs_unaligned_fu_88_ap_done == 1'b0) & (storeOutput7_read_reg_157 == 1'd1));
end

assign grp_tdf8_writeOutputs_unaligned_fu_88_ap_start = grp_tdf8_writeOutputs_unaligned_fu_88_ap_start_reg;

assign or_ln24_fu_120_p2 = (resetMaximum6_dout | grp_fu_110_p2);

assign out_data_address1 = grp_tdf8_writeOutputs_unaligned_fu_88_out_data_address1;

assign out_data_ce1 = grp_tdf8_writeOutputs_unaligned_fu_88_out_data_ce1;

assign out_data_d1 = grp_tdf8_writeOutputs_unaligned_fu_88_out_data_d1;

assign out_data_we1 = grp_tdf8_writeOutputs_unaligned_fu_88_out_data_we1;

assign select_ln24_fu_126_p3 = ((or_ln24_fu_120_p2[0:0] == 1'b1) ? p_read : max_vals_0);

assign storeOutput7_read_read_fu_82_p2 = storeOutput7_dout;

endmodule //td_fused_top_tdf8_poolOutputs
module td_fused_top_hcmp_16ns_16ns_1_2_no_dsp_1
#(parameter
    ID         = 47,
    NUM_STAGE  = 2,
    din0_WIDTH = 16,
    din1_WIDTH = 16,
    dout_WIDTH = 1
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din1_WIDTH-1:0] din1,
    input  wire [4:0]            opcode,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Parameter----------------------
// AutoESL opcode
localparam [4:0]
    AP_OEQ = 5'b00001,
    AP_OGT = 5'b00010,
    AP_OGE = 5'b00011,
    AP_OLT = 5'b00100,
    AP_OLE = 5'b00101,
    AP_ONE = 5'b00110,
    AP_UNO = 5'b01000;
// FPV6 opcode
localparam [7:0]
    OP_EQ = 8'b00010100,
    OP_GT = 8'b00100100,
    OP_GE = 8'b00110100,
    OP_LT = 8'b00001100,
    OP_LE = 8'b00011100,
    OP_NE = 8'b00101100,
    OP_UO = 8'b00000100;
//------------------------Local signal-------------------
wire                  a_tvalid;
wire [15:0]           a_tdata;
wire                  b_tvalid;
wire [15:0]           b_tdata;
wire                  op_tvalid;
reg  [7:0]            op_tdata;
wire                  r_tvalid;
wire [7:0]            r_tdata;
reg  [din0_WIDTH-1:0] din0_buf1;
reg  [din1_WIDTH-1:0] din1_buf1;
reg  [4:0]            opcode_buf1;
reg                   ce_r;
wire [dout_WIDTH-1:0] dout_i;
reg  [dout_WIDTH-1:0] dout_r;
//------------------------Instantiation------------------
td_fused_top_ap_hcmp_0_no_dsp_16 td_fused_top_ap_hcmp_0_no_dsp_16_u (
    .s_axis_a_tvalid         ( a_tvalid ),
    .s_axis_a_tdata          ( a_tdata ),
    .s_axis_b_tvalid         ( b_tvalid ),
    .s_axis_b_tdata          ( b_tdata ),
    .s_axis_operation_tvalid ( op_tvalid ),
    .s_axis_operation_tdata  ( op_tdata ),
    .m_axis_result_tvalid    ( r_tvalid ),
    .m_axis_result_tdata     ( r_tdata )
);
//------------------------Body---------------------------
assign a_tvalid  = 1'b1;
assign a_tdata   = din0_buf1;
assign b_tvalid  = 1'b1;
assign b_tdata   = din1_buf1;
assign op_tvalid = 1'b1;
assign dout_i    = r_tdata[0];

always @(*) begin
    case (opcode_buf1)
        AP_OEQ  : op_tdata = OP_EQ;
        AP_OGT  : op_tdata = OP_GT;
        AP_OGE  : op_tdata = OP_GE;
        AP_OLT  : op_tdata = OP_LT;
        AP_OLE  : op_tdata = OP_LE;
        AP_ONE  : op_tdata = OP_NE;
        AP_UNO  : op_tdata = OP_UO;
        default : op_tdata = OP_EQ;
    endcase
end

always @(posedge clk) begin
    if (ce) begin
        din0_buf1   <= din0;
        din1_buf1   <= din1;
        opcode_buf1 <= opcode;
    end
end

always @ (posedge clk) begin
    ce_r <= ce;
end

always @ (posedge clk) begin
    if (ce_r) begin
        dout_r <= dout_i;
    end
end

assign dout = ce_r?dout_i:dout_r;
endmodule
module td_fused_top_ap_hcmp_0_no_dsp_16 (
   input  wire        s_axis_a_tvalid,
   input  wire [15:0] s_axis_a_tdata,
   input  wire        s_axis_b_tvalid,
   input  wire [15:0] s_axis_b_tdata,
   input  wire        s_axis_operation_tvalid,
   input  wire [7:0]  s_axis_operation_tdata,
   output wire        m_axis_result_tvalid,
   output wire [7:0]  m_axis_result_tdata
);
   // TEMP - compare module not yet ready
   // In the meantime, negate operand B, add them
   // together, and return the sign bit of the result.
   wire [15:0] b_negative;
   wire [15:0] result;
   assign b_negative = {~s_axis_b_tdata[15], s_axis_b_tdata[14:0]};
   
`ifdef complex_dsp
adder_fp u_add_fp (
      .a(s_axis_a_tdata), 
      .b(b_negative), 
      .out(result)
   );
`else
FPAddSub u_FPAddSub_2 (.clk(), .rst(1'b0), .a(s_axis_a_tdata), .b(b_negative), .operation(1'b0), .result(result), .flags());
`endif
   
   assign m_axis_result_tdata = {7'b0, result[15]};
endmodule
module td_fused_top_tdf8_writeOutputs_unaligned (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        i,
        j,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1,
        max_vals_0
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [3:0] i;
input  [7:0] j;
output  [13:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;
input  [15:0] max_vals_0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_data_ce1;
reg out_data_we1;

  reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] outputCount_3;
reg   [15:0] outputChanIdx_3;
reg   [15:0] outputRow_13_0;
reg   [15:0] outputRow_13_1;
reg   [15:0] outputRow_13_2;
reg   [15:0] outputRow_13_3;
wire   [15:0] add_ln87_fu_177_p2;
wire   [0:0] icmp_ln88_fu_183_p2;
reg   [0:0] icmp_ln88_reg_297;
reg   [15:0] ap_phi_mux_empty_phi_fu_94_p4;
reg   [15:0] empty_reg_91;
wire    ap_CS_fsm_state2;
wire   [63:0] zext_ln94_4_fu_211_p1;
wire   [15:0] select_ln97_fu_269_p3;
wire   [1:0] trunc_ln86_fu_149_p1;
reg   [15:0] ap_sig_allocacmp_outputRow_13_0_load;
reg   [15:0] ap_sig_allocacmp_outputRow_13_1_load;
reg   [15:0] ap_sig_allocacmp_outputRow_13_2_load;
reg   [15:0] ap_sig_allocacmp_outputRow_13_3_load;
wire   [4:0] tmp_8_fu_109_p3;
wire   [7:0] tmp_fu_101_p3;
wire   [7:0] zext_ln94_fu_117_p1;
wire   [7:0] sub_ln94_fu_121_p2;
wire   [7:0] add_ln94_fu_127_p2;
wire   [7:0] trunc_ln94_fu_197_p1;
wire   [13:0] tmp_10_cast_fu_133_p3;
wire   [13:0] zext_ln94_3_fu_201_p1;
wire   [13:0] add_ln94_2_fu_205_p2;
wire   [15:0] bitcast_ln94_6_fu_240_p1;
wire   [15:0] bitcast_ln94_5_fu_232_p1;
wire   [15:0] bitcast_ln94_4_fu_224_p1;
wire   [15:0] bitcast_ln94_fu_216_p1;
wire   [15:0] add_ln96_fu_257_p2;
wire   [0:0] icmp_ln97_fu_263_p2;
reg   [1:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 outputCount_3 = 16'd0;
#0 outputChanIdx_3 = 16'd0;
#0 outputRow_13_0 = 16'd0;
#0 outputRow_13_1 = 16'd0;
#0 outputRow_13_2 = 16'd0;
#0 outputRow_13_3 = 16'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln88_reg_297 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_reg_91 <= 16'd0;
    end else if (((ap_start == 1'b1) & (icmp_ln88_fu_183_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        empty_reg_91 <= add_ln87_fu_177_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln88_reg_297 <= icmp_ln88_fu_183_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (icmp_ln88_fu_183_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        outputChanIdx_3 <= select_ln97_fu_269_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        outputCount_3 <= ap_phi_mux_empty_phi_fu_94_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_149_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_13_0 <= max_vals_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_149_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_13_1 <= max_vals_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_149_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_13_2 <= max_vals_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_149_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_13_3 <= max_vals_0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln88_reg_297 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_phi_mux_empty_phi_fu_94_p4 = 16'd0;
    end else begin
        ap_phi_mux_empty_phi_fu_94_p4 = empty_reg_91;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_149_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_13_0_load = max_vals_0;
    end else begin
        ap_sig_allocacmp_outputRow_13_0_load = outputRow_13_0;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_149_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_13_1_load = max_vals_0;
    end else begin
        ap_sig_allocacmp_outputRow_13_1_load = outputRow_13_1;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_149_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_13_2_load = max_vals_0;
    end else begin
        ap_sig_allocacmp_outputRow_13_2_load = outputRow_13_2;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_149_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_13_3_load = max_vals_0;
    end else begin
        ap_sig_allocacmp_outputRow_13_3_load = outputRow_13_3;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (icmp_ln88_fu_183_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        out_data_we1 = 1'b1;
    end else begin
        out_data_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln87_fu_177_p2 = (outputCount_3 + 16'd1);

assign add_ln94_2_fu_205_p2 = (tmp_10_cast_fu_133_p3 + zext_ln94_3_fu_201_p1);

assign add_ln94_fu_127_p2 = (sub_ln94_fu_121_p2 + j);

assign add_ln96_fu_257_p2 = (outputChanIdx_3 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign bitcast_ln94_4_fu_224_p1 = ap_sig_allocacmp_outputRow_13_1_load;

assign bitcast_ln94_5_fu_232_p1 = ap_sig_allocacmp_outputRow_13_2_load;

assign bitcast_ln94_6_fu_240_p1 = ap_sig_allocacmp_outputRow_13_3_load;

assign bitcast_ln94_fu_216_p1 = ap_sig_allocacmp_outputRow_13_0_load;

assign icmp_ln88_fu_183_p2 = ((add_ln87_fu_177_p2 == 16'd4) ? 1'b1 : 1'b0);

assign icmp_ln97_fu_263_p2 = ((add_ln96_fu_257_p2 == 16'd64) ? 1'b1 : 1'b0);

assign out_data_address1 = zext_ln94_4_fu_211_p1;

assign out_data_d1 = {{{{bitcast_ln94_6_fu_240_p1}, {bitcast_ln94_5_fu_232_p1}}, {bitcast_ln94_4_fu_224_p1}}, {bitcast_ln94_fu_216_p1}};

assign select_ln97_fu_269_p3 = ((icmp_ln97_fu_263_p2[0:0] == 1'b1) ? 16'd0 : add_ln96_fu_257_p2);

assign sub_ln94_fu_121_p2 = (tmp_fu_101_p3 - zext_ln94_fu_117_p1);

assign tmp_10_cast_fu_133_p3 = {{add_ln94_fu_127_p2}, {6'd0}};

assign tmp_8_fu_109_p3 = {{i}, {1'd0}};

assign tmp_fu_101_p3 = {{i}, {4'd0}};

assign trunc_ln86_fu_149_p1 = outputCount_3[1:0];

assign trunc_ln94_fu_197_p1 = outputChanIdx_3[7:0];

assign zext_ln94_3_fu_201_p1 = trunc_ln94_fu_197_p1;

assign zext_ln94_4_fu_211_p1 = add_ln94_2_fu_205_p2;

assign zext_ln94_fu_117_p1 = tmp_8_fu_109_p3;

endmodule //td_fused_top_tdf8_writeOutputs_unaligned

module FPAddSub(
		clk,
		rst,
		a,
		b,
		operation,			// 0 add, 1 sub
		result,
		flags
	);
	
	// Clock and reset
	input clk ;										// Clock signal
	input rst ;										// Reset (active high, resets pipeline registers)
	
	// Input ports
	input [`DWIDTH-1:0] a ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b ;								// Input B, a 32-bit floating point number
	input operation ;								// Operation select signal
	
	// Output ports
	output [`DWIDTH-1:0] result ;						// Result of the operation
	output [4:0] flags ;							// Flags indicating exceptions according to IEEE754
	
	// Pipeline Registers
	//reg [79:0] pipe_1;							// Pipeline register PreAlign->Align1
	reg [`DWIDTH*2+15:0] pipe_1;							// Pipeline register PreAlign->Align1

	//reg [67:0] pipe_2;							// Pipeline register Align1->Align3
	reg [`MANTISSA*2+`EXPONENT+13:0] pipe_2;							// Pipeline register Align1->Align3

	//reg [76:0] pipe_3;	68						// Pipeline register Align1->Align3
	reg [`MANTISSA*2+`EXPONENT+14:0] pipe_3;							// Pipeline register Align1->Align3

	//reg [69:0] pipe_4;							// Pipeline register Align3->Execute
	reg [`MANTISSA*2+`EXPONENT+15:0] pipe_4;							// Pipeline register Align3->Execute

	//reg [51:0] pipe_5;							// Pipeline register Execute->Normalize
	reg [`DWIDTH+`EXPONENT+11:0] pipe_5;							// Pipeline register Execute->Normalize

	//reg [56:0] pipe_6;							// Pipeline register Nomalize->NormalizeShift1
	reg [`DWIDTH+`EXPONENT+16:0] pipe_6;							// Pipeline register Nomalize->NormalizeShift1

	//reg [56:0] pipe_7;							// Pipeline register NormalizeShift2->NormalizeShift3
	reg [`DWIDTH+`EXPONENT+16:0] pipe_7;							// Pipeline register NormalizeShift2->NormalizeShift3

	//reg [54:0] pipe_8;							// Pipeline register NormalizeShift3->Round
	reg [`EXPONENT*2+`MANTISSA+15:0] pipe_8;							// Pipeline register NormalizeShift3->Round

	//reg [40:0] pipe_9;							// Pipeline register NormalizeShift3->Round
	reg [`DWIDTH+8:0] pipe_9;							// Pipeline register NormalizeShift3->Round
	
	// Internal wires between modules
	wire [`DWIDTH-2:0] Aout_0 ;							// A - sign
	wire [`DWIDTH-2:0] Bout_0 ;							// B - sign
	wire Opout_0 ;									// A's sign
	wire Sa_0 ;										// A's sign
	wire Sb_0 ;										// B's sign
	wire MaxAB_1 ;									// Indicates the larger of A and B(0/A, 1/B)
	wire [`EXPONENT-1:0] CExp_1 ;							// Common Exponent
	wire [4:0] Shift_1 ;							// Number of steps to smaller mantissa shift right (align)
	wire [`MANTISSA-1:0] Mmax_1 ;							// Larger mantissa
	wire [4:0] InputExc_0 ;						// Input numbers are exceptions
	wire [9:0] ShiftDet_0 ;
	wire [`MANTISSA-1:0] MminS_1 ;						// Smaller mantissa after 0/16 shift
	wire [`MANTISSA:0] MminS_2 ;						// Smaller mantissa after 0/4/8/12 shift
	wire [`MANTISSA:0] Mmin_3 ;							// Smaller mantissa after 0/1/2/3 shift
	wire [`DWIDTH:0] Sum_4 ;
	wire PSgn_4 ;
	wire Opr_4 ;
	wire [4:0] Shift_5 ;							// Number of steps to shift sum left (normalize)
	wire [`DWIDTH:0] SumS_5 ;							// Sum after 0/16 shift
	wire [`DWIDTH:0] SumS_6 ;							// Sum after 0/16 shift
	wire [`DWIDTH:0] SumS_7 ;							// Sum after 0/16 shift
	wire [`MANTISSA-1:0] NormM_8 ;						// Normalized mantissa
	wire [`EXPONENT:0] NormE_8;							// Adjusted exponent
	wire ZeroSum_8 ;								// Zero flag
	wire NegE_8 ;									// Flag indicating negative exponent
	wire R_8 ;										// Round bit
	wire S_8 ;										// Final sticky bit
	wire FG_8 ;										// Final sticky bit
	wire [`DWIDTH-1:0] P_int ;
	wire EOF ;
	
	// Prepare the operands for alignment and check for exceptions
	FPAddSub_PrealignModule PrealignModule
	(	// Inputs
		a, b, operation,
		// Outputs
		Sa_0, Sb_0, ShiftDet_0[9:0], InputExc_0[4:0], Aout_0[`DWIDTH-2:0], Bout_0[`DWIDTH-2:0], Opout_0) ;
		
	// Prepare the operands for alignment and check for exceptions
	FPAddSub_AlignModule AlignModule
	(	// Inputs
		pipe_1[14+2*`DWIDTH:16+`DWIDTH], pipe_1[15+`DWIDTH:17], pipe_1[14:5],
		// Outputs
		CExp_1[`EXPONENT-1:0], MaxAB_1, Shift_1[4:0], MminS_1[`MANTISSA-1:0], Mmax_1[`MANTISSA-1:0]) ;	

	// Alignment Shift Stage 1
	FPAddSub_AlignShift1 AlignShift1
	(  // Inputs
		pipe_2[`MANTISSA-1:0], pipe_2[2*`MANTISSA+9:2*`MANTISSA+7],
		// Outputs
		MminS_2[`MANTISSA:0]) ;

	// Alignment Shift Stage 3 and compution of guard and sticky bits
	FPAddSub_AlignShift2 AlignShift2  
	(  // Inputs
		pipe_3[`MANTISSA:0], pipe_3[2*`MANTISSA+7:2*`MANTISSA+6],
		// Outputs
		Mmin_3[`MANTISSA:0]) ;
						
	// Perform mantissa addition
	FPAddSub_ExecutionModule ExecutionModule
	(  // Inputs
		pipe_4[`MANTISSA*2+5:`MANTISSA+6], pipe_4[`MANTISSA:0], pipe_4[`MANTISSA*2+`EXPONENT+13], pipe_4[`MANTISSA*2+`EXPONENT+12], pipe_4[`MANTISSA*2+`EXPONENT+11], pipe_4[`MANTISSA*2+`EXPONENT+14],
		// Outputs
		Sum_4[`DWIDTH:0], PSgn_4, Opr_4) ;
	
	// Prepare normalization of result
	FPAddSub_NormalizeModule NormalizeModule
	(  // Inputs
		pipe_5[`DWIDTH:0], 
		// Outputs
		SumS_5[`DWIDTH:0], Shift_5[4:0]) ;
					
	// Normalization Shift Stage 1
	FPAddSub_NormalizeShift1 NormalizeShift1
	(  // Inputs
		pipe_6[`DWIDTH:0], pipe_6[`DWIDTH+`EXPONENT+14:`DWIDTH+`EXPONENT+11],
		// Outputs
		SumS_7[`DWIDTH:0]) ;
		
	// Normalization Shift Stage 3 and final guard, sticky and round bits
	FPAddSub_NormalizeShift2 NormalizeShift2
	(  // Inputs
		pipe_7[`DWIDTH:0], pipe_7[`DWIDTH+`EXPONENT+5:`DWIDTH+6], pipe_7[`DWIDTH+`EXPONENT+15:`DWIDTH+`EXPONENT+11],
		// Outputs
		NormM_8[`MANTISSA-1:0], NormE_8[`EXPONENT:0], ZeroSum_8, NegE_8, R_8, S_8, FG_8) ;

	// Round and put result together
	FPAddSub_RoundModule RoundModule
	(  // Inputs
		 pipe_8[3], pipe_8[4+`EXPONENT:4], pipe_8[`EXPONENT+`MANTISSA+4:5+`EXPONENT], pipe_8[1], pipe_8[0], pipe_8[`EXPONENT*2+`MANTISSA+15], pipe_8[`EXPONENT*2+`MANTISSA+12], pipe_8[`EXPONENT*2+`MANTISSA+11], pipe_8[`EXPONENT*2+`MANTISSA+14], pipe_8[`EXPONENT*2+`MANTISSA+10], 
		// Outputs
		P_int[`DWIDTH-1:0], EOF) ;
	
	// Check for exceptions
	FPAddSub_ExceptionModule Exceptionmodule
	(  // Inputs
		pipe_9[8+`DWIDTH:9], pipe_9[8], pipe_9[7], pipe_9[6], pipe_9[5:1], pipe_9[0], 
		// Outputs
		result[`DWIDTH-1:0], flags[4:0]) ;			
	
	always @ (*) begin	
		if(rst) begin
			pipe_1 = 0;
			pipe_2 = 0;
			pipe_3 = 0;
			pipe_4 = 0;
			pipe_5 = 0;
			pipe_6 = 0;
			pipe_7 = 0;
			pipe_8 = 0;
			pipe_9 = 0;
		end 
		else begin
		
			pipe_1 = {Opout_0, Aout_0[`DWIDTH-2:0], Bout_0[`DWIDTH-2:0], Sa_0, Sb_0, ShiftDet_0[9:0], InputExc_0[4:0]} ;	
			// PIPE_2 :
			//[67] operation
			//[66] Sa_0
			//[65] Sb_0
			//[64] MaxAB_0
			//[63:56] CExp_0
			//[55:51] Shift_0
			//[50:28] Mmax_0
			//[27:23] InputExc_0
			//[22:0] MminS_1
			//
			pipe_2 = {pipe_1[`DWIDTH*2+15], pipe_1[16:15], MaxAB_1, CExp_1[`EXPONENT-1:0], Shift_1[4:0], Mmax_1[`MANTISSA-1:0], pipe_1[4:0], MminS_1[`MANTISSA-1:0]} ;	
			// PIPE_3 :
			//[68] operation
			//[67] Sa_0
			//[66] Sb_0
			//[65] MaxAB_0
			//[64:57] CExp_0
			//[56:52] Shift_0
			//[51:29] Mmax_0
			//[28:24] InputExc_0
			//[23:0] MminS_1
			//
			pipe_3 = {pipe_2[`MANTISSA*2+`EXPONENT+13:`MANTISSA], MminS_2[`MANTISSA:0]} ;	
			// PIPE_4 :
			//[68] operation
			//[67] Sa_0
			//[66] Sb_0
			//[65] MaxAB_0
			//[64:57] CExp_0
			//[56:52] Shift_0
			//[51:29] Mmax_0
			//[28:24] InputExc_0
			//[23:0] Mmin_3
			//					
			pipe_4 = {pipe_3[`MANTISSA*2+`EXPONENT+14:`MANTISSA+1], Mmin_3[`MANTISSA:0]} ;	
			// PIPE_5 :
			//[51] operation
			//[50] PSgn_4
			//[49] Opr_4
			//[48] Sa_0
			//[47] Sb_0
			//[46] MaxAB_0
			//[45:38] CExp_0
			//[37:33] InputExc_0
			//[32:0] Sum_4
			//					
			pipe_5 = {pipe_4[2*`MANTISSA+`EXPONENT+14], PSgn_4, Opr_4, pipe_4[2*`MANTISSA+`EXPONENT+13:2*`MANTISSA+11], pipe_4[`MANTISSA+5:`MANTISSA+1], Sum_4[`DWIDTH:0]} ;
			// PIPE_6 :
			//[56] operation
			//[55:51] Shift_5
			//[50] PSgn_4
			//[49] Opr_4
			//[48] Sa_0
			//[47] Sb_0
			//[46] MaxAB_0
			//[45:38] CExp_0
			//[37:33] InputExc_0
			//[32:0] Sum_4
			//					
			pipe_6 = {pipe_5[`EXPONENT+`EXPONENT+11], Shift_5[4:0], pipe_5[`DWIDTH+`EXPONENT+10:`DWIDTH+1], SumS_5[`DWIDTH:0]} ;	
			// pipe_7 :
			//[56] operation
			//[55:51] Shift_5
			//[50] PSgn_4
			//[49] Opr_4
			//[48] Sa_0
			//[47] Sb_0
			//[46] MaxAB_0
			//[45:38] CExp_0
			//[37:33] InputExc_0
			//[32:0] Sum_4
			//						
			pipe_7 = {pipe_6[`DWIDTH+`EXPONENT+16:`DWIDTH+1], SumS_7[`DWIDTH:0]} ;	
			// pipe_8:
			//[54] FG_8 
			//[53] operation
			//[52] PSgn_4
			//[51] Sa_0
			//[50] Sb_0
			//[49] MaxAB_0
			//[48:41] CExp_0
			//[40:36] InputExc_8
			//[35:13] NormM_8 
			//[12:4] NormE_8
			//[3] ZeroSum_8
			//[2] NegE_8
			//[1] R_8
			//[0] S_8
			//				
			pipe_8 = {FG_8, pipe_7[`DWIDTH+`EXPONENT+16], pipe_7[`DWIDTH+`EXPONENT+10], pipe_7[`DWIDTH+`EXPONENT+8:`DWIDTH+1], NormM_8[`MANTISSA-1:0], NormE_8[`EXPONENT:0], ZeroSum_8, NegE_8, R_8, S_8} ;	
			// pipe_9:
			//[40:9] P_int
			//[8] NegE_8
			//[7] R_8
			//[6] S_8
			//[5:1] InputExc_8
			//[0] EOF
			//				
			pipe_9 = {P_int[`DWIDTH-1:0], pipe_8[2], pipe_8[1], pipe_8[0], pipe_8[`EXPONENT+`MANTISSA+9:`EXPONENT+`MANTISSA+5], EOF} ;	
		end
	end		
	
endmodule
module FPAddSub_ExceptionModule(
		Z,
		NegE,
		R,
		S,
		InputExc,
		EOF,
		P,
		Flags
    );
	 
	// Input ports
	input [`DWIDTH-1:0] Z	;					// Final product
	input NegE ;						// Negative exponent?
	input R ;							// Round bit
	input S ;							// Sticky bit
	input [4:0] InputExc ;			// Exceptions in inputs A and B
	input EOF ;
	
	// Output ports
	output [`DWIDTH-1:0] P ;					// Final result
	output [4:0] Flags ;				// Exception flags
	
	// Internal signals
	wire Overflow ;					// Overflow flag
	wire Underflow ;					// Underflow flag
	wire DivideByZero ;				// Divide-by-Zero flag (always 0 in Add/Sub)
	wire Invalid ;						// Invalid inputs or result
	wire Inexact ;						// Result is inexact because of rounding
	
	// Exception flags
	
	// Result is too big to be represented
	assign Overflow = EOF | InputExc[1] | InputExc[0] ;
	
	// Result is too small to be represented
	assign Underflow = NegE & (R | S);
	
	// Infinite result computed exactly from finite operands
	assign DivideByZero = &(Z[`MANTISSA+`EXPONENT-1:`MANTISSA]) & ~|(Z[`MANTISSA+`EXPONENT-1:`MANTISSA]) & ~InputExc[1] & ~InputExc[0];
	
	// Invalid inputs or operation
	assign Invalid = |(InputExc[4:2]) ;
	
	// Inexact answer due to rounding, overflow or underflow
	assign Inexact = (R | S) | Overflow | Underflow;
	
	// Put pieces together to form final result
	assign P = Z ;
	
	// Collect exception flags	
	assign Flags = {Overflow, Underflow, DivideByZero, Invalid, Inexact} ; 	
	
endmodule
module FPAddSub_RoundModule(
		ZeroSum,
		NormE,
		NormM,
		R,
		S,
		G,
		Sa,
		Sb,
		Ctrl,
		MaxAB,
		Z,
		EOF
    );

	// Input ports
	input ZeroSum ;					// Sum is zero
	input [`EXPONENT:0] NormE ;				// Normalized exponent
	input [`MANTISSA-1:0] NormM ;				// Normalized mantissa
	input R ;							// Round bit
	input S ;							// Sticky bit
	input G ;
	input Sa ;							// A's sign bit
	input Sb ;							// B's sign bit
	input Ctrl ;						// Control bit (operation)
	input MaxAB ;
	
	// Output ports
	output [`DWIDTH-1:0] Z ;					// Final result
	output EOF ;
	
	// Internal signals
	wire [`MANTISSA:0] RoundUpM ;			// Rounded up sum with room for overflow
	wire [`MANTISSA-1:0] RoundM ;				// The final rounded sum
	wire [`EXPONENT:0] RoundE ;				// Rounded exponent (note extra bit due to poential overflow	)
	wire RoundUp ;						// Flag indicating that the sum should be rounded up
        wire FSgn;
	wire ExpAdd ;						// May have to add 1 to compensate for overflow 
	wire RoundOF ;						// Rounding overflow
	
	// The cases where we need to round upwards (= adding one) in Round to nearest, tie to even
	assign RoundUp = (G & ((R | S) | NormM[0])) ;
	
	// Note that in the other cases (rounding down), the sum is already 'rounded'
	assign RoundUpM = (NormM + 1) ;								// The sum, rounded up by 1
	assign RoundM = (RoundUp ? RoundUpM[`MANTISSA-1:0] : NormM) ; 	// Compute final mantissa	
	assign RoundOF = RoundUp & RoundUpM[`MANTISSA] ; 				// Check for overflow when rounding up

	// Calculate post-rounding exponent
	assign ExpAdd = (RoundOF ? 1'b1 : 1'b0) ; 				// Add 1 to exponent to compensate for overflow
	assign RoundE = ZeroSum ? 5'b00000 : (NormE + ExpAdd) ; 							// Final exponent

	// If zero, need to determine sign according to rounding
	assign FSgn = (ZeroSum & (Sa ^ Sb)) | (ZeroSum ? (Sa & Sb & ~Ctrl) : ((~MaxAB & Sa) | ((Ctrl ^ Sb) & (MaxAB | Sa)))) ;

	// Assign final result
	assign Z = {FSgn, RoundE[`EXPONENT-1:0], RoundM[`MANTISSA-1:0]} ;
	
	// Indicate exponent overflow
	assign EOF = RoundE[`EXPONENT];
	
endmodule
module FPAddSub_NormalizeShift2(
		PSSum,
		CExp,
		Shift,
		NormM,
		NormE,
		ZeroSum,
		NegE,
		R,
		S,
		FG
	);
	
	// Input ports
	input [`DWIDTH:0] PSSum ;					// The Pre-Shift-Sum
	input [`EXPONENT-1:0] CExp ;
	input [4:0] Shift ;					// Amount to be shifted

	// Output ports
	output [`MANTISSA-1:0] NormM ;				// Normalized mantissa
	output [`EXPONENT:0] NormE ;					// Adjusted exponent
	output ZeroSum ;						// Zero flag
	output NegE ;							// Flag indicating negative exponent
	output R ;								// Round bit
	output S ;								// Final sticky bit
	output FG ;

	// Internal signals
	wire MSBShift ;						// Flag indicating that a second shift is needed
	wire [`EXPONENT:0] ExpOF ;					// MSB set in sum indicates overflow
	wire [`EXPONENT:0] ExpOK ;					// MSB not set, no adjustment
	
	// Calculate normalized exponent and mantissa, check for all-zero sum
	assign MSBShift = PSSum[`DWIDTH] ;		// Check MSB in unnormalized sum
	assign ZeroSum = ~|PSSum ;			// Check for all zero sum
	assign ExpOK = CExp - Shift ;		// Adjust exponent for new normalized mantissa
	assign NegE = ExpOK[`EXPONENT] ;			// Check for exponent overflow
	assign ExpOF = CExp - Shift + 1'b1 ;		// If MSB set, add one to exponent(x2)
	assign NormE = MSBShift ? ExpOF : ExpOK ;			// Check for exponent overflow
	assign NormM = PSSum[`DWIDTH-1:`EXPONENT+1] ;		// The new, normalized mantissa
	
	// Also need to compute sticky and round bits for the rounding stage
	assign FG = PSSum[`EXPONENT] ; 
	assign R = PSSum[`EXPONENT-1] ;
	assign S = |PSSum[`EXPONENT-2:0] ;
	
endmodule
module FPAddSub_NormalizeShift1(
		MminP,
		Shift,
		Mmin
	);
	
	// Input ports
	input [`DWIDTH:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [3:0] Shift ;						// Shift amount
	
	// Output ports
	output [`DWIDTH:0] Mmin ;						// The smaller mantissa
	
	reg	  [`DWIDTH:0]		Lvl2;
	wire    [2*`DWIDTH+1:0]    Stage1;	
	reg	  [`DWIDTH:0]		Lvl3;
	wire    [2*`DWIDTH+1:0]    Stage2;	
	integer           i;               	// Loop variable
	
	assign Stage1 = {MminP, MminP};

	always @(*) begin    					// Rotate {0 | 4 | 8 | 12} bits
	  case (Shift[3:2])
			// Rotate by 0
			2'b00: //Lvl2 <= Stage1[`DWIDTH:0];       		
      begin Lvl2 = Stage1[`DWIDTH:0];  end
			// Rotate by 4
			2'b01: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl2[i-33] <= Stage1[i-4]; end Lvl2[3:0] <= 0; end
      begin Lvl2[`DWIDTH: (`DWIDTH-4)] = Stage1[3:0]; Lvl2[`DWIDTH-4-1:0] = Stage1[`DWIDTH-4]; end
			// Rotate by 8
			2'b10: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl2[i-33] <= Stage1[i-8]; end Lvl2[7:0] <= 0; end
      begin Lvl2[`DWIDTH: (`DWIDTH-8)] = Stage1[3:0]; Lvl2[`DWIDTH-8-1:0] = Stage1[`DWIDTH-8]; end
			// Rotate by 12
			2'b11: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl2[i-33] <= Stage1[i-12]; end Lvl2[11:0] <= 0; end
      begin Lvl2[`DWIDTH: (`DWIDTH-12)] = Stage1[3:0]; Lvl2[`DWIDTH-12-1:0] = Stage1[`DWIDTH-12]; end
	  endcase
	end
	
	assign Stage2 = {Lvl2, Lvl2};

	always @(*) begin   				 		// Rotate {0 | 1 | 2 | 3} bits
	  case (Shift[1:0])
			// Rotate by 0
			2'b00:  //Lvl3 <= Stage2[`DWIDTH:0];
      begin Lvl3 = Stage2[`DWIDTH:0]; end
			// Rotate by 1
			2'b01: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl3[i-`DWIDTH-1] <= Stage2[i-1]; end Lvl3[0] <= 0; end 
      begin Lvl3[`DWIDTH: (`DWIDTH-1)] = Stage2[3:0]; Lvl3[`DWIDTH-1-1:0] = Stage2[`DWIDTH-1]; end
			// Rotate by 2
			2'b10: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl3[i-`DWIDTH-1] <= Stage2[i-2]; end Lvl3[1:0] <= 0; end
      begin Lvl3[`DWIDTH: (`DWIDTH-2)] = Stage2[3:0]; Lvl3[`DWIDTH-2-1:0] = Stage2[`DWIDTH-2]; end
			// Rotate by 3
			2'b11: //begin for (i=2*`DWIDTH+1; i>=`DWIDTH+1; i=i-1) begin Lvl3[i-`DWIDTH-1] <= Stage2[i-3]; end Lvl3[2:0] <= 0; end
      begin Lvl3[`DWIDTH: (`DWIDTH-3)] = Stage2[3:0]; Lvl3[`DWIDTH-3-1:0] = Stage2[`DWIDTH-3]; end
	  endcase
	end
	
	// Assign outputs
	assign Mmin = Lvl3;						// Take out smaller mantissa			
	
endmodule
module FPAddSub_NormalizeModule(
		Sum,
		Mmin,
		Shift
    );

	// Input ports
	input [`DWIDTH:0] Sum ;					// Mantissa sum including hidden 1 and GRS
	
	// Output ports
	output [`DWIDTH:0] Mmin ;					// Mantissa after 16|0 shift
	output [4:0] Shift ;					// Shift amount
	
	// Determine normalization shift amount by finding leading nought
	assign Shift =  ( 
		Sum[16] ? 5'b00000 :	 
		Sum[15] ? 5'b00001 : 
		Sum[14] ? 5'b00010 : 
		Sum[13] ? 5'b00011 : 
		Sum[12] ? 5'b00100 : 
		Sum[11] ? 5'b00101 : 
		Sum[10] ? 5'b00110 : 
		Sum[9] ? 5'b00111 :
		Sum[8] ? 5'b01000 :
		Sum[7] ? 5'b01001 :
		Sum[6] ? 5'b01010 :
		Sum[5] ? 5'b01011 :
		Sum[4] ? 5'b01100 : 5'b01101
	//	Sum[19] ? 5'b01101 :
	//	Sum[18] ? 5'b01110 :
	//	Sum[17] ? 5'b01111 :
	//	Sum[16] ? 5'b10000 :
	//	Sum[15] ? 5'b10001 :
	//	Sum[14] ? 5'b10010 :
	//	Sum[13] ? 5'b10011 :
	//	Sum[12] ? 5'b10100 :
	//	Sum[11] ? 5'b10101 :
	//	Sum[10] ? 5'b10110 :
	//	Sum[9] ? 5'b10111 :
	//	Sum[8] ? 5'b11000 :
	//	Sum[7] ? 5'b11001 : 5'b11010
	);
	
	reg	  [`DWIDTH:0]		Lvl1;
	
	always @(*) begin
		// Rotate by 16?
		Lvl1 <= Shift[4] ? {Sum[8:0], 8'b00000000} : Sum; 
	end
	
	// Assign outputs
	assign Mmin = Lvl1;						// Take out smaller mantissa

endmodule
module FPAddSub_ExecutionModule(
		Mmax,
		Mmin,
		Sa,
		Sb,
		MaxAB,
		OpMode,
		Sum,
		PSgn,
		Opr
    );

	// Input ports
	input [`MANTISSA-1:0] Mmax ;					// The larger mantissa
	input [`MANTISSA:0] Mmin ;					// The smaller mantissa
	input Sa ;								// Sign bit of larger number
	input Sb ;								// Sign bit of smaller number
	input MaxAB ;							// Indicates the larger number (0/A, 1/B)
	input OpMode ;							// Operation to be performed (0/Add, 1/Sub)
	
	// Output ports
	output [`DWIDTH:0] Sum ;					// The result of the operation
	output PSgn ;							// The sign for the result
	output Opr ;							// The effective (performed) operation

	assign Opr = (OpMode^Sa^Sb); 		// Resolve sign to determine operation

	// Perform effective operation
	assign Sum = (OpMode^Sa^Sb) ? ({1'b1, Mmax, 5'b00000} - {Mmin, 5'b00000}) : ({1'b1, Mmax, 5'b00000} + {Mmin, 5'b00000}) ;
	
	// Assign result sign
	assign PSgn = (MaxAB ? Sb : Sa) ;

endmodule
module FPAddSub_AlignShift2(
		MminP,
		Shift,
		Mmin
	);
	
	// Input ports
	input [`MANTISSA:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [1:0] Shift ;						// Shift amount
	
	// Output ports
	output [`MANTISSA:0] Mmin ;						// The smaller mantissa
	
	// Internal Signal
	reg	  [`MANTISSA:0]		Lvl3;
	wire    [2*`MANTISSA+1:0]    Stage2;	
	integer           j;               // Loop variable
	
	assign Stage2 = {11'b0, MminP};

	always @(*) begin    // Rotate {0 | 1 | 2 | 3} bits
	  case (Shift[1:0])
			// Rotate by 0
			2'b00:  Lvl3 <= Stage2[`MANTISSA:0];   
			// Rotate by 1
			2'b01:  begin for (j=0; j<=`MANTISSA; j=j+1)  begin Lvl3[j] <= Stage2[j+1]; end /*Lvl3[`MANTISSA] <= 0; */end 
			// Rotate by 2
			2'b10:  begin for (j=0; j<=`MANTISSA; j=j+1)  begin Lvl3[j] <= Stage2[j+2]; end /*Lvl3[`MANTISSA:`MANTISSA-1] <= 0;*/ end 
			// Rotate by 3
			2'b11:  begin for (j=0; j<=`MANTISSA; j=j+1)  begin Lvl3[j] <= Stage2[j+3]; end /*Lvl3[`MANTISSA:`MANTISSA-2] <= 0;*/ end 	  
	  endcase
	end
	
	// Assign output
	assign Mmin = Lvl3;						// Take out smaller mantissa				

endmodule
module FPAddSub_AlignShift1(
		MminP,
		Shift,
		Mmin
	);
	
	// Input ports
	input [`MANTISSA-1:0] MminP ;						// Smaller mantissa after 16|12|8|4 shift
	input [2:0] Shift ;						// Shift amount
	
	// Output ports
	output [`MANTISSA:0] Mmin ;						// The smaller mantissa
	
	// Internal signals
	reg	  [`MANTISSA:0]		Lvl1;
	reg	  [`MANTISSA:0]		Lvl2;
	wire    [2*`MANTISSA+1:0]    Stage1;	
	integer           i;                // Loop variable
	
	always @(*) begin						
		// Rotate by 16?
		//Lvl1 <= Shift[2] ? {17'b00000000000000001, MminP[22:16]} : {1'b1, MminP}; 
		Lvl1 <= Shift[2] ? {11'b0000000000} : {1'b1, MminP}; 
		
	end
	
	assign Stage1 = { 11'b0, Lvl1};
	
	always @(*) begin    					// Rotate {0 | 4 | 8 | 12} bits
	  case (Shift[1:0])
			// Rotate by 0	
			2'b00:  Lvl2 <= Stage1[`MANTISSA:0];       			
			// Rotate by 4	
			2'b01:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+4]; end /*Lvl2[`MANTISSA:`MANTISSA-3] <= 0;*/ end
			// Rotate by 8
			2'b10:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+8]; end /*Lvl2[`MANTISSA:`MANTISSA-7] <= 0;*/ end
			// Rotate by 12	
			2'b11: Lvl2[`MANTISSA: 0] <= 0; 
			//2'b11:  begin for (i=0; i<=`MANTISSA; i=i+1) begin Lvl2[i] <= Stage1[i+12]; end Lvl2[`MANTISSA:`MANTISSA-12] <= 0; end
	  endcase
	end
	
	// Assign output to next shift stage
	assign Mmin = Lvl2;
	
endmodule
module FPAddSub_AlignModule (
		A,
		B,
		ShiftDet,
		CExp,
		MaxAB,
		Shift,
		Mmin,
		Mmax
	);
	
	// Input ports
	input [`DWIDTH-2:0] A ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-2:0] B ;								// Input B, a 32-bit floating point number
	input [9:0] ShiftDet ;
	
	// Output ports
	output [`EXPONENT-1:0] CExp ;							// Common Exponent
	output MaxAB ;									// Incidates larger of A and B (0/A, 1/B)
	output [4:0] Shift ;							// Number of steps to smaller mantissa shift right
	output [`MANTISSA-1:0] Mmin ;							// Smaller mantissa 
	output [`MANTISSA-1:0] Mmax ;							// Larger mantissa
	
	// Internal signals
	//wire BOF ;										// Check for shifting overflow if B is larger
	//wire AOF ;										// Check for shifting overflow if A is larger
	
	assign MaxAB = (A[`DWIDTH-2:0] < B[`DWIDTH-2:0]) ;	
	//assign BOF = ShiftDet[9:5] < 25 ;		// Cannot shift more than 25 bits
	//assign AOF = ShiftDet[4:0] < 25 ;		// Cannot shift more than 25 bits
	
	// Determine final shift value
	//assign Shift = MaxAB ? (BOF ? ShiftDet[9:5] : 5'b11001) : (AOF ? ShiftDet[4:0] : 5'b11001) ;
	
	assign Shift = MaxAB ? ShiftDet[9:5] : ShiftDet[4:0] ;
	
	// Take out smaller mantissa and append shift space
	assign Mmin = MaxAB ? A[`MANTISSA-1:0] : B[`MANTISSA-1:0] ; 
	
	// Take out larger mantissa	
	assign Mmax = MaxAB ? B[`MANTISSA-1:0]: A[`MANTISSA-1:0] ;	
	
	// Common exponent
	assign CExp = (MaxAB ? B[`MANTISSA+`EXPONENT-1:`MANTISSA] : A[`MANTISSA+`EXPONENT-1:`MANTISSA]) ;		
	
endmodule
module FPAddSub_PrealignModule(
		A,
		B,
		operation,
		Sa,
		Sb,
		ShiftDet,
		InputExc,
		Aout,
		Bout,
		Opout
	);
	
	// Input ports
	input [`DWIDTH-1:0] A ;										// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] B ;										// Input B, a 32-bit floating point number
	input operation ;
	
	// Output ports
	output Sa ;												// A's sign
	output Sb ;												// B's sign
	output [9:0] ShiftDet ;
	output [4:0] InputExc ;								// Input numbers are exceptions
	output [`DWIDTH-2:0] Aout ;
	output [`DWIDTH-2:0] Bout ;
	output Opout ;
	
	// Internal signals									// If signal is high...
	wire ANaN ;												// A is a NaN (Not-a-Number)
	wire BNaN ;												// B is a NaN
	wire AInf ;												// A is infinity
	wire BInf ;												// B is infinity
	wire [`EXPONENT-1:0] DAB ;										// ExpA - ExpB					
	wire [`EXPONENT-1:0] DBA ;										// ExpB - ExpA	
	
	assign ANaN = &(A[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & |(A[`MANTISSA-1:0]) ;		// All one exponent and not all zero mantissa - NaN
	assign BNaN = &(B[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & |(B[`MANTISSA-1:0]);		// All one exponent and not all zero mantissa - NaN
	assign AInf = &(A[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & ~|(A[`MANTISSA-1:0]) ;	// All one exponent and all zero mantissa - Infinity
	assign BInf = &(B[`DWIDTH-2:`DWIDTH-1-`EXPONENT]) & ~|(B[`MANTISSA-1:0]) ;	// All one exponent and all zero mantissa - Infinity
	
	// Put all flags into exception vector
	assign InputExc = {(ANaN | BNaN | AInf | BInf), ANaN, BNaN, AInf, BInf} ;
	
	//assign DAB = (A[30:23] - B[30:23]) ;
	//assign DBA = (B[30:23] - A[30:23]) ;
	assign DAB = (A[`DWIDTH-2:`MANTISSA] + ~(B[`DWIDTH-2:`MANTISSA]) + 1) ;
	assign DBA = (B[`DWIDTH-2:`MANTISSA] + ~(A[`DWIDTH-2:`MANTISSA]) + 1) ;
	
	assign Sa = A[`DWIDTH-1] ;									// A's sign bit
	assign Sb = B[`DWIDTH-1] ;									// B's sign	bit
	assign ShiftDet = {DBA[4:0], DAB[4:0]} ;		// Shift data
	assign Opout = operation ;
	assign Aout = A[`DWIDTH-2:0] ;
	assign Bout = B[`DWIDTH-2:0] ;
	
endmodule



