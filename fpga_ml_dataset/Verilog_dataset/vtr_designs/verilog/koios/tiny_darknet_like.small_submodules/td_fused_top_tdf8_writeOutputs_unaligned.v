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
