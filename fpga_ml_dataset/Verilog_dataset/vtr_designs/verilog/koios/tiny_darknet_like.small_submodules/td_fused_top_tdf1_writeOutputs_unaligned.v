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

module td_fused_top_tdf1_writeOutputs_unaligned (
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
        max_vals_3_0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_state2 = 3'd2;
parameter    ap_ST_fsm_state3 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [6:0] i;
input  [13:0] j;
output  [15:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;
input  [15:0] max_vals_3_0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_data_ce1;
reg out_data_we1;

  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] outputCount_1;
reg   [15:0] outputChanIdx_1;
reg   [15:0] outputRow_8_0;
reg   [15:0] outputRow_8_1;
reg   [15:0] outputRow_8_2;
reg   [15:0] outputRow_8_3;
wire   [14:0] sub_ln94_fu_121_p2;
reg   [14:0] sub_ln94_reg_294;
wire   [15:0] add_ln87_fu_182_p2;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln88_fu_188_p2;
reg   [0:0] icmp_ln88_reg_307;
reg   [15:0] ap_phi_mux_empty_phi_fu_90_p4;
reg   [15:0] empty_reg_87;
wire    ap_CS_fsm_state3;
wire   [63:0] zext_ln94_18_fu_216_p1;
wire   [15:0] select_ln97_fu_274_p3;
wire   [1:0] trunc_ln86_fu_154_p1;
reg   [15:0] ap_sig_allocacmp_outputRow_8_0_load;
reg   [15:0] ap_sig_allocacmp_outputRow_8_1_load;
reg   [15:0] ap_sig_allocacmp_outputRow_8_2_load;
reg   [15:0] ap_sig_allocacmp_outputRow_8_3_load;
wire   [13:0] tmp_fu_97_p3;
wire   [10:0] tmp_s_fu_109_p3;
wire   [14:0] zext_ln94_fu_105_p1;
wire   [14:0] zext_ln94_15_fu_117_p1;
wire   [15:0] sub_ln94_cast14_fu_127_p1;
wire   [15:0] zext_ln94_16_fu_130_p1;
wire   [15:0] add_ln94_fu_134_p2;
wire   [3:0] trunc_ln94_fu_202_p1;
wire   [15:0] shl_ln89_fu_140_p2;
wire   [15:0] zext_ln94_17_fu_206_p1;
wire   [15:0] add_ln94_7_fu_210_p2;
wire   [15:0] bitcast_ln94_21_fu_245_p1;
wire   [15:0] bitcast_ln94_20_fu_237_p1;
wire   [15:0] bitcast_ln94_19_fu_229_p1;
wire   [15:0] bitcast_ln94_fu_221_p1;
wire   [15:0] add_ln96_fu_262_p2;
wire   [0:0] icmp_ln97_fu_268_p2;
reg   [2:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 outputCount_1 = 16'd0;
#0 outputChanIdx_1 = 16'd0;
#0 outputRow_8_0 = 16'd0;
#0 outputRow_8_1 = 16'd0;
#0 outputRow_8_2 = 16'd0;
#0 outputRow_8_3 = 16'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln88_reg_307 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        empty_reg_87 <= 16'd0;
    end else if (((icmp_ln88_fu_188_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_reg_87 <= add_ln87_fu_182_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        icmp_ln88_reg_307 <= icmp_ln88_fu_188_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln88_fu_188_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        outputChanIdx_1 <= select_ln97_fu_274_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        outputCount_1 <= ap_phi_mux_empty_phi_fu_90_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln86_fu_154_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        outputRow_8_0 <= max_vals_3_0;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln86_fu_154_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        outputRow_8_1 <= max_vals_3_0;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln86_fu_154_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state2))) begin
        outputRow_8_2 <= max_vals_3_0;
    end
end

always @ (posedge ap_clk) begin
    if (((trunc_ln86_fu_154_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state2))) begin
        outputRow_8_3 <= max_vals_3_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sub_ln94_reg_294[14 : 4] <= sub_ln94_fu_121_p2[14 : 4];
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if (((icmp_ln88_reg_307 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_phi_mux_empty_phi_fu_90_p4 = 16'd0;
    end else begin
        ap_phi_mux_empty_phi_fu_90_p4 = empty_reg_87;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_154_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_sig_allocacmp_outputRow_8_0_load = max_vals_3_0;
    end else begin
        ap_sig_allocacmp_outputRow_8_0_load = outputRow_8_0;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_154_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_sig_allocacmp_outputRow_8_1_load = max_vals_3_0;
    end else begin
        ap_sig_allocacmp_outputRow_8_1_load = outputRow_8_1;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_154_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_sig_allocacmp_outputRow_8_2_load = max_vals_3_0;
    end else begin
        ap_sig_allocacmp_outputRow_8_2_load = outputRow_8_2;
    end
end

always @ (*) begin
    if (((trunc_ln86_fu_154_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_sig_allocacmp_outputRow_8_3_load = max_vals_3_0;
    end else begin
        ap_sig_allocacmp_outputRow_8_3_load = outputRow_8_3;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2))) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln88_fu_188_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
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
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln87_fu_182_p2 = (outputCount_1 + 16'd1);

assign add_ln94_7_fu_210_p2 = (shl_ln89_fu_140_p2 + zext_ln94_17_fu_206_p1);

assign add_ln94_fu_134_p2 = (sub_ln94_cast14_fu_127_p1 + zext_ln94_16_fu_130_p1);

assign add_ln96_fu_262_p2 = (outputChanIdx_1 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign bitcast_ln94_19_fu_229_p1 = ap_sig_allocacmp_outputRow_8_1_load;

assign bitcast_ln94_20_fu_237_p1 = ap_sig_allocacmp_outputRow_8_2_load;

assign bitcast_ln94_21_fu_245_p1 = ap_sig_allocacmp_outputRow_8_3_load;

assign bitcast_ln94_fu_221_p1 = ap_sig_allocacmp_outputRow_8_0_load;

assign icmp_ln88_fu_188_p2 = ((add_ln87_fu_182_p2 == 16'd4) ? 1'b1 : 1'b0);

assign icmp_ln97_fu_268_p2 = ((add_ln96_fu_262_p2 == 16'd4) ? 1'b1 : 1'b0);

assign out_data_address1 = zext_ln94_18_fu_216_p1;

assign out_data_d1 = {{{{bitcast_ln94_21_fu_245_p1}, {bitcast_ln94_20_fu_237_p1}}, {bitcast_ln94_19_fu_229_p1}}, {bitcast_ln94_fu_221_p1}};

assign select_ln97_fu_274_p3 = ((icmp_ln97_fu_268_p2[0:0] == 1'b1) ? 16'd0 : add_ln96_fu_262_p2);

assign shl_ln89_fu_140_p2 = add_ln94_fu_134_p2 << 16'd2;

assign sub_ln94_cast14_fu_127_p1 = sub_ln94_reg_294;

assign sub_ln94_fu_121_p2 = (zext_ln94_fu_105_p1 - zext_ln94_15_fu_117_p1);

assign tmp_fu_97_p3 = {{i}, {7'd0}};

assign tmp_s_fu_109_p3 = {{i}, {4'd0}};

assign trunc_ln86_fu_154_p1 = outputCount_1[1:0];

assign trunc_ln94_fu_202_p1 = outputChanIdx_1[3:0];

assign zext_ln94_15_fu_117_p1 = tmp_s_fu_109_p3;

assign zext_ln94_16_fu_130_p1 = j;

assign zext_ln94_17_fu_206_p1 = trunc_ln94_fu_202_p1;

assign zext_ln94_18_fu_216_p1 = add_ln94_7_fu_210_p2;

assign zext_ln94_fu_105_p1 = tmp_fu_97_p3;

always @ (posedge ap_clk) begin
    sub_ln94_reg_294[3:0] <= 4'b0000;
end

endmodule //td_fused_top_tdf1_writeOutputs_unaligned
