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

module td_fused_top_tdf12_writeOutputs_unaligned (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        indices_01_dout,
        indices_01_empty_n,
        indices_01_read,
        indices_12_dout,
        indices_12_empty_n,
        indices_12_read,
        p_read,
        p_read1,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [3:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [7:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
input  [15:0] p_read;
input  [15:0] p_read1;
output  [15:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg indices_01_read;
reg indices_12_read;
reg out_data_ce1;
reg out_data_we1;

reg    ap_done_reg;
  reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] outputCount_3;
reg   [15:0] outputChanIdx_3;
reg   [15:0] outputRow_3_0;
reg   [15:0] outputRow_3_1;
reg   [15:0] outputRow_3_2;
reg   [15:0] outputRow_3_3;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg   [3:0] indices_01_read_reg_387;
reg   [7:0] indices_12_read_reg_393;
wire   [9:0] add_ln94_fu_189_p2;
reg   [9:0] add_ln94_reg_398;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire   [15:0] mul_ln89_fu_198_p2;
reg   [15:0] mul_ln89_reg_413;
wire   [1:0] add_ln85_fu_204_p2;
reg   [1:0] add_ln85_reg_418;
wire    ap_CS_fsm_state4;
wire   [0:0] icmp_ln88_fu_263_p2;
reg   [0:0] icmp_ln88_reg_429;
wire   [0:0] icmp_ln85_fu_210_p2;
reg   [1:0] o_reg_131;
wire    ap_CS_fsm_state5;
wire   [63:0] zext_ln94_12_fu_301_p1;
wire   [15:0] select_ln97_fu_359_p3;
wire   [15:0] select_ln86_fu_220_p3;
wire   [1:0] trunc_ln86_1_fu_226_p1;
reg   [15:0] empty_fu_86;
wire   [15:0] add_ln87_fu_257_p2;
reg    ap_block_state1;
wire   [7:0] tmp_fu_154_p3;
wire   [4:0] tmp_s_fu_165_p3;
wire   [8:0] zext_ln94_fu_161_p1;
wire   [8:0] zext_ln94_9_fu_172_p1;
wire   [8:0] sub_ln94_fu_176_p2;
wire   [9:0] sub_ln94_cast_fu_182_p1;
wire   [9:0] zext_ln94_10_fu_186_p1;
wire   [8:0] mul_ln89_fu_198_p1;
wire   [0:0] trunc_ln86_fu_216_p1;
wire   [8:0] trunc_ln94_fu_288_p1;
wire   [15:0] zext_ln94_11_fu_292_p1;
wire   [15:0] add_ln94_4_fu_296_p2;
wire   [15:0] bitcast_ln94_12_fu_330_p1;
wire   [15:0] bitcast_ln94_11_fu_322_p1;
wire   [15:0] bitcast_ln94_10_fu_314_p1;
wire   [15:0] bitcast_ln94_fu_306_p1;
wire   [15:0] add_ln96_fu_347_p2;
wire   [0:0] icmp_ln97_fu_353_p2;
reg   [4:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 outputCount_3 = 16'd0;
#0 outputChanIdx_3 = 16'd0;
#0 outputRow_3_0 = 16'd0;
#0 outputRow_3_1 = 16'd0;
#0 outputRow_3_2 = 16'd0;
#0 outputRow_3_3 = 16'd0;
end

td_fused_top_mul_10s_9ns_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 16 ))
mul_10s_9ns_16_1_1_U1925(
    .din0(add_ln94_reg_398),
    .din1(mul_ln89_fu_198_p1),
    .dout(mul_ln89_fu_198_p2)
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
        end else if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        empty_fu_86 <= outputCount_3;
    end else if (((icmp_ln85_fu_210_p2 == 1'd0) & (icmp_ln88_fu_263_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        empty_fu_86 <= add_ln87_fu_257_p2;
    end else if (((icmp_ln88_reg_429 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        empty_fu_86 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        o_reg_131 <= add_ln85_reg_418;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        o_reg_131 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        add_ln85_reg_418 <= add_ln85_fu_204_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln94_reg_398 <= add_ln94_fu_189_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4))) begin
        icmp_ln88_reg_429 <= icmp_ln88_fu_263_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        indices_01_read_reg_387 <= indices_01_dout;
        indices_12_read_reg_393 <= indices_12_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        mul_ln89_reg_413 <= mul_ln89_fu_198_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln88_reg_429 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        outputChanIdx_3 <= select_ln97_fu_359_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        outputCount_3 <= empty_fu_86;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (trunc_ln86_1_fu_226_p1 == 2'd0))) begin
        outputRow_3_0 <= select_ln86_fu_220_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (trunc_ln86_1_fu_226_p1 == 2'd1))) begin
        outputRow_3_1 <= select_ln86_fu_220_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (trunc_ln86_1_fu_226_p1 == 2'd2))) begin
        outputRow_3_2 <= select_ln86_fu_220_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln85_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4) & (trunc_ln86_1_fu_226_p1 == 2'd3))) begin
        outputRow_3_3 <= select_ln86_fu_220_p3;
    end
end

always @ (*) begin
    if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_blk_n = indices_01_empty_n;
    end else begin
        indices_01_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_read = 1'b1;
    end else begin
        indices_01_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_blk_n = indices_12_empty_n;
    end else begin
        indices_12_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_read = 1'b1;
    end else begin
        indices_12_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln88_reg_429 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        out_data_we1 = 1'b1;
    end else begin
        out_data_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((icmp_ln85_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln85_fu_204_p2 = (o_reg_131 + 2'd1);

assign add_ln87_fu_257_p2 = (empty_fu_86 + 16'd1);

assign add_ln94_4_fu_296_p2 = (mul_ln89_reg_413 + zext_ln94_11_fu_292_p1);

assign add_ln94_fu_189_p2 = ((sub_ln94_cast_fu_182_p1) + (zext_ln94_10_fu_186_p1));

assign add_ln96_fu_347_p2 = (outputChanIdx_3 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign bitcast_ln94_10_fu_314_p1 = outputRow_3_1;

assign bitcast_ln94_11_fu_322_p1 = outputRow_3_2;

assign bitcast_ln94_12_fu_330_p1 = outputRow_3_3;

assign bitcast_ln94_fu_306_p1 = outputRow_3_0;

assign icmp_ln85_fu_210_p2 = ((o_reg_131 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln88_fu_263_p2 = ((add_ln87_fu_257_p2 == 16'd4) ? 1'b1 : 1'b0);

assign icmp_ln97_fu_353_p2 = ((add_ln96_fu_347_p2 == 16'd250) ? 1'b1 : 1'b0);

assign mul_ln89_fu_198_p1 = 16'd250;

assign out_data_address1 = zext_ln94_12_fu_301_p1;

assign out_data_d1 = {{{{bitcast_ln94_12_fu_330_p1}, {bitcast_ln94_11_fu_322_p1}}, {bitcast_ln94_10_fu_314_p1}}, {bitcast_ln94_fu_306_p1}};

assign select_ln86_fu_220_p3 = ((trunc_ln86_fu_216_p1[0:0] == 1'b1) ? p_read1 : p_read);

assign select_ln97_fu_359_p3 = ((icmp_ln97_fu_353_p2[0:0] == 1'b1) ? 16'd0 : add_ln96_fu_347_p2);

assign sub_ln94_cast_fu_182_p1 = (sub_ln94_fu_176_p2);

assign sub_ln94_fu_176_p2 = (zext_ln94_fu_161_p1 - zext_ln94_9_fu_172_p1);

assign tmp_fu_154_p3 = {{indices_01_read_reg_387}, {4'd0}};

assign tmp_s_fu_165_p3 = {{indices_01_read_reg_387}, {1'd0}};

assign trunc_ln86_1_fu_226_p1 = empty_fu_86[1:0];

assign trunc_ln86_fu_216_p1 = o_reg_131[0:0];

assign trunc_ln94_fu_288_p1 = outputChanIdx_3[8:0];

assign zext_ln94_10_fu_186_p1 = indices_12_read_reg_393;

assign zext_ln94_11_fu_292_p1 = trunc_ln94_fu_288_p1;

assign zext_ln94_12_fu_301_p1 = add_ln94_4_fu_296_p2;

assign zext_ln94_9_fu_172_p1 = tmp_s_fu_165_p3;

assign zext_ln94_fu_161_p1 = tmp_fu_154_p3;

endmodule //td_fused_top_tdf12_writeOutputs_unaligned
module td_fused_top_mul_10s_9ns_16_1_1(
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0 td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout )
);

endmodule
module td_fused_top_mul_10s_9ns_16_1_1_Multiplier_0(a, b, p);
input[10 - 1 : 0] a; 
input[9 - 1 : 0] b; 
output[16 - 1 : 0] p;

assign p = (a) * ({1'b0, b});
endmodule
