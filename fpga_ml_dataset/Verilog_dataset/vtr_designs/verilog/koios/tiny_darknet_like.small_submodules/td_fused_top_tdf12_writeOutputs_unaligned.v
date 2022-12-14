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
input  [3:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [7:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
input  [15:0] p_read;
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
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] outputCount_2;
reg   [15:0] outputChanIdx_2;
reg   [15:0] outputRow_7_0;
reg   [15:0] outputRow_7_1;
reg   [15:0] outputRow_7_2;
reg   [15:0] outputRow_7_3;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
wire   [9:0] add_ln94_fu_157_p2;
reg   [9:0] add_ln94_reg_315;
wire   [15:0] mul_ln89_fu_166_p2;
reg   [15:0] mul_ln89_reg_320;
wire    ap_CS_fsm_state2;
wire   [15:0] add_ln87_fu_204_p2;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln88_fu_210_p2;
reg   [0:0] icmp_ln88_reg_333;
reg   [15:0] ap_phi_mux_empty_phi_fu_112_p4;
reg   [15:0] empty_reg_109;
wire    ap_CS_fsm_state4;
wire   [63:0] zext_ln94_22_fu_237_p1;
wire   [15:0] select_ln97_fu_295_p3;
wire   [1:0] trunc_ln86_fu_176_p1;
reg   [15:0] ap_sig_allocacmp_outputRow_7_0_load;
reg   [15:0] ap_sig_allocacmp_outputRow_7_1_load;
reg   [15:0] ap_sig_allocacmp_outputRow_7_2_load;
reg   [15:0] ap_sig_allocacmp_outputRow_7_3_load;
reg    ap_block_state1;
wire   [7:0] tmp_fu_119_p3;
wire   [4:0] tmp_s_fu_131_p3;
wire   [8:0] zext_ln94_fu_127_p1;
wire   [8:0] zext_ln94_19_fu_139_p1;
wire   [8:0] sub_ln94_fu_143_p2;
wire   [9:0] sub_ln94_cast_fu_149_p1;
wire   [9:0] zext_ln94_20_fu_153_p1;
wire   [8:0] mul_ln89_fu_166_p1;
wire   [8:0] trunc_ln94_fu_224_p1;
wire   [15:0] zext_ln94_21_fu_228_p1;
wire   [15:0] add_ln94_8_fu_232_p2;
wire   [15:0] bitcast_ln94_24_fu_266_p1;
wire   [15:0] bitcast_ln94_23_fu_258_p1;
wire   [15:0] bitcast_ln94_22_fu_250_p1;
wire   [15:0] bitcast_ln94_fu_242_p1;
wire   [15:0] add_ln96_fu_283_p2;
wire   [0:0] icmp_ln97_fu_289_p2;
reg   [3:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 outputCount_2 = 16'd0;
#0 outputChanIdx_2 = 16'd0;
#0 outputRow_7_0 = 16'd0;
#0 outputRow_7_1 = 16'd0;
#0 outputRow_7_2 = 16'd0;
#0 outputRow_7_3 = 16'd0;
end

td_fused_top_mul_10s_9ns_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 16 ))
mul_10s_9ns_16_1_1_U789(
    .din0(add_ln94_reg_315),
    .din1(mul_ln89_fu_166_p1),
    .dout(mul_ln89_fu_166_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln88_reg_333 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        empty_reg_109 <= 16'd0;
    end else if (((icmp_ln88_fu_210_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        empty_reg_109 <= add_ln87_fu_204_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        add_ln94_reg_315 <= add_ln94_fu_157_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        icmp_ln88_reg_333 <= icmp_ln88_fu_210_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        mul_ln89_reg_320 <= mul_ln89_fu_166_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln88_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        outputChanIdx_2 <= select_ln97_fu_295_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        outputCount_2 <= ap_phi_mux_empty_phi_fu_112_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln86_fu_176_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        outputRow_7_0 <= p_read;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln86_fu_176_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        outputRow_7_1 <= p_read;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln86_fu_176_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state3))) begin
        outputRow_7_2 <= p_read;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln86_fu_176_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state3))) begin
        outputRow_7_3 <= p_read;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
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
    if (((icmp_ln88_reg_333 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_phi_mux_empty_phi_fu_112_p4 = 16'd0;
    end else begin
        ap_phi_mux_empty_phi_fu_112_p4 = empty_reg_109;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_176_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_sig_allocacmp_outputRow_7_0_load = p_read;
    end else begin
        ap_sig_allocacmp_outputRow_7_0_load = outputRow_7_0;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_176_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_sig_allocacmp_outputRow_7_1_load = p_read;
    end else begin
        ap_sig_allocacmp_outputRow_7_1_load = outputRow_7_1;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_176_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_sig_allocacmp_outputRow_7_2_load = p_read;
    end else begin
        ap_sig_allocacmp_outputRow_7_2_load = outputRow_7_2;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_176_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_sig_allocacmp_outputRow_7_3_load = p_read;
    end else begin
        ap_sig_allocacmp_outputRow_7_3_load = outputRow_7_3;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_blk_n = indices_01_empty_n;
    end else begin
        indices_01_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_read = 1'b1;
    end else begin
        indices_01_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_blk_n = indices_12_empty_n;
    end else begin
        indices_12_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_read = 1'b1;
    end else begin
        indices_12_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln88_fu_210_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        out_data_we1 = 1'b1;
    end else begin
        out_data_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln87_fu_204_p2 = (outputCount_2 + 16'd1);

assign add_ln94_8_fu_232_p2 = (mul_ln89_reg_320 + zext_ln94_21_fu_228_p1);

assign add_ln94_fu_157_p2 = ((sub_ln94_cast_fu_149_p1) + (zext_ln94_20_fu_153_p1));

assign add_ln96_fu_283_p2 = (outputChanIdx_2 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign bitcast_ln94_22_fu_250_p1 = ap_sig_allocacmp_outputRow_7_1_load;

assign bitcast_ln94_23_fu_258_p1 = ap_sig_allocacmp_outputRow_7_2_load;

assign bitcast_ln94_24_fu_266_p1 = ap_sig_allocacmp_outputRow_7_3_load;

assign bitcast_ln94_fu_242_p1 = ap_sig_allocacmp_outputRow_7_0_load;

assign icmp_ln88_fu_210_p2 = ((add_ln87_fu_204_p2 == 16'd4) ? 1'b1 : 1'b0);

assign icmp_ln97_fu_289_p2 = ((add_ln96_fu_283_p2 == 16'd250) ? 1'b1 : 1'b0);

assign mul_ln89_fu_166_p1 = 16'd250;

assign out_data_address1 = zext_ln94_22_fu_237_p1;

assign out_data_d1 = {{{{bitcast_ln94_24_fu_266_p1}, {bitcast_ln94_23_fu_258_p1}}, {bitcast_ln94_22_fu_250_p1}}, {bitcast_ln94_fu_242_p1}};

assign select_ln97_fu_295_p3 = ((icmp_ln97_fu_289_p2[0:0] == 1'b1) ? 16'd0 : add_ln96_fu_283_p2);

assign sub_ln94_cast_fu_149_p1 = (sub_ln94_fu_143_p2);

assign sub_ln94_fu_143_p2 = (zext_ln94_fu_127_p1 - zext_ln94_19_fu_139_p1);

assign tmp_fu_119_p3 = {{indices_01_dout}, {4'd0}};

assign tmp_s_fu_131_p3 = {{indices_01_dout}, {1'd0}};

assign trunc_ln86_fu_176_p1 = outputCount_2[1:0];

assign trunc_ln94_fu_224_p1 = outputChanIdx_2[8:0];

assign zext_ln94_19_fu_139_p1 = tmp_s_fu_131_p3;

assign zext_ln94_20_fu_153_p1 = indices_12_dout;

assign zext_ln94_21_fu_228_p1 = trunc_ln94_fu_224_p1;

assign zext_ln94_22_fu_237_p1 = add_ln94_8_fu_232_p2;

assign zext_ln94_fu_127_p1 = tmp_fu_119_p3;

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
