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

module td_fused_top_tdf2_writeOutputs_unaligned (
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
        max_vals_4_0
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [5:0] i;
input  [11:0] j;
output  [14:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;
input  [15:0] max_vals_4_0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_data_ce1;
reg out_data_we1;

  reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] outputCount_7;
reg   [15:0] outputChanIdx_7;
reg   [15:0] outputRow_9_0;
reg   [15:0] outputRow_9_1;
reg   [15:0] outputRow_9_2;
reg   [15:0] outputRow_9_3;
wire   [15:0] add_ln87_fu_175_p2;
wire   [0:0] icmp_ln88_fu_181_p2;
reg   [0:0] icmp_ln88_reg_295;
reg   [15:0] ap_phi_mux_empty_phi_fu_92_p4;
reg   [15:0] empty_reg_89;
wire    ap_CS_fsm_state2;
wire   [63:0] zext_ln94_14_fu_209_p1;
wire   [15:0] select_ln97_fu_267_p3;
wire   [1:0] trunc_ln86_fu_147_p1;
reg   [15:0] ap_sig_allocacmp_outputRow_9_0_load;
reg   [15:0] ap_sig_allocacmp_outputRow_9_1_load;
reg   [15:0] ap_sig_allocacmp_outputRow_9_2_load;
reg   [15:0] ap_sig_allocacmp_outputRow_9_3_load;
wire   [8:0] tmp_s_fu_107_p3;
wire   [11:0] tmp_fu_99_p3;
wire   [11:0] zext_ln94_fu_115_p1;
wire   [11:0] sub_ln94_fu_119_p2;
wire   [11:0] add_ln94_fu_125_p2;
wire   [4:0] trunc_ln94_fu_195_p1;
wire   [14:0] tmp_110_cast_fu_131_p3;
wire   [14:0] zext_ln94_13_fu_199_p1;
wire   [14:0] add_ln94_6_fu_203_p2;
wire   [15:0] bitcast_ln94_18_fu_238_p1;
wire   [15:0] bitcast_ln94_17_fu_230_p1;
wire   [15:0] bitcast_ln94_16_fu_222_p1;
wire   [15:0] bitcast_ln94_fu_214_p1;
wire   [15:0] add_ln96_fu_255_p2;
wire   [0:0] icmp_ln97_fu_261_p2;
reg   [1:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 outputCount_7 = 16'd0;
#0 outputChanIdx_7 = 16'd0;
#0 outputRow_9_0 = 16'd0;
#0 outputRow_9_1 = 16'd0;
#0 outputRow_9_2 = 16'd0;
#0 outputRow_9_3 = 16'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln88_reg_295 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_reg_89 <= 16'd0;
    end else if (((ap_start == 1'b1) & (icmp_ln88_fu_181_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        empty_reg_89 <= add_ln87_fu_175_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln88_reg_295 <= icmp_ln88_fu_181_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (icmp_ln88_fu_181_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        outputChanIdx_7 <= select_ln97_fu_267_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        outputCount_7 <= ap_phi_mux_empty_phi_fu_92_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_147_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_9_0 <= max_vals_4_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_147_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_9_1 <= max_vals_4_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_147_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_9_2 <= max_vals_4_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (trunc_ln86_fu_147_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_9_3 <= max_vals_4_0;
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
    if (((icmp_ln88_reg_295 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_phi_mux_empty_phi_fu_92_p4 = 16'd0;
    end else begin
        ap_phi_mux_empty_phi_fu_92_p4 = empty_reg_89;
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
    if (((trunc_ln86_fu_147_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_9_0_load = max_vals_4_0;
    end else begin
        ap_sig_allocacmp_outputRow_9_0_load = outputRow_9_0;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_147_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_9_1_load = max_vals_4_0;
    end else begin
        ap_sig_allocacmp_outputRow_9_1_load = outputRow_9_1;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_147_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_9_2_load = max_vals_4_0;
    end else begin
        ap_sig_allocacmp_outputRow_9_2_load = outputRow_9_2;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_147_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_outputRow_9_3_load = max_vals_4_0;
    end else begin
        ap_sig_allocacmp_outputRow_9_3_load = outputRow_9_3;
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
    if (((ap_start == 1'b1) & (icmp_ln88_fu_181_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
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

assign add_ln87_fu_175_p2 = (outputCount_7 + 16'd1);

assign add_ln94_6_fu_203_p2 = (tmp_110_cast_fu_131_p3 + zext_ln94_13_fu_199_p1);

assign add_ln94_fu_125_p2 = (sub_ln94_fu_119_p2 + j);

assign add_ln96_fu_255_p2 = (outputChanIdx_7 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign bitcast_ln94_16_fu_222_p1 = ap_sig_allocacmp_outputRow_9_1_load;

assign bitcast_ln94_17_fu_230_p1 = ap_sig_allocacmp_outputRow_9_2_load;

assign bitcast_ln94_18_fu_238_p1 = ap_sig_allocacmp_outputRow_9_3_load;

assign bitcast_ln94_fu_214_p1 = ap_sig_allocacmp_outputRow_9_0_load;

assign icmp_ln88_fu_181_p2 = ((add_ln87_fu_175_p2 == 16'd4) ? 1'b1 : 1'b0);

assign icmp_ln97_fu_261_p2 = ((add_ln96_fu_255_p2 == 16'd8) ? 1'b1 : 1'b0);

assign out_data_address1 = zext_ln94_14_fu_209_p1;

assign out_data_d1 = {{{{bitcast_ln94_18_fu_238_p1}, {bitcast_ln94_17_fu_230_p1}}, {bitcast_ln94_16_fu_222_p1}}, {bitcast_ln94_fu_214_p1}};

assign select_ln97_fu_267_p3 = ((icmp_ln97_fu_261_p2[0:0] == 1'b1) ? 16'd0 : add_ln96_fu_255_p2);

assign sub_ln94_fu_119_p2 = (tmp_fu_99_p3 - zext_ln94_fu_115_p1);

assign tmp_110_cast_fu_131_p3 = {{add_ln94_fu_125_p2}, {3'd0}};

assign tmp_fu_99_p3 = {{i}, {6'd0}};

assign tmp_s_fu_107_p3 = {{i}, {3'd0}};

assign trunc_ln86_fu_147_p1 = outputCount_7[1:0];

assign trunc_ln94_fu_195_p1 = outputChanIdx_7[4:0];

assign zext_ln94_13_fu_199_p1 = trunc_ln94_fu_195_p1;

assign zext_ln94_14_fu_209_p1 = add_ln94_6_fu_203_p2;

assign zext_ln94_fu_115_p1 = tmp_s_fu_107_p3;

endmodule //td_fused_top_tdf2_writeOutputs_unaligned
