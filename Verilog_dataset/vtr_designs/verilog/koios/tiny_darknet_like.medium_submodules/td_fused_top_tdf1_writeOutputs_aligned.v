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

module td_fused_top_tdf1_writeOutputs_aligned (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        i,
        j,
        k,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1,
        max_vals_3_0,
        max_vals_3_1,
        max_vals_3_2,
        max_vals_3_3
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [6:0] i;
input  [13:0] j;
input  [3:0] k;
output  [15:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [63:0] out_data_d1;
input  [15:0] max_vals_3_0;
input  [15:0] max_vals_3_1;
input  [15:0] max_vals_3_2;
input  [15:0] max_vals_3_3;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out_data_ce1;
reg out_data_we1;

  reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [15:0] add_ln123_fu_117_p2;
reg   [15:0] add_ln123_reg_188;
wire   [63:0] zext_ln123_10_fu_142_p1;
wire    ap_CS_fsm_state2;
wire   [13:0] tmp_fu_79_p3;
wire   [10:0] tmp_s_fu_91_p3;
wire   [14:0] zext_ln123_fu_87_p1;
wire   [14:0] zext_ln123_7_fu_99_p1;
wire   [14:0] sub_ln123_fu_103_p2;
wire   [15:0] sub_ln123_cast15_fu_109_p1;
wire   [15:0] zext_ln123_8_fu_113_p1;
wire   [15:0] shl_ln123_fu_123_p2;
wire   [15:0] zext_ln123_9_fu_132_p1;
wire   [15:0] add_ln123_4_fu_136_p2;
wire   [15:0] bitcast_ln123_12_fu_171_p1;
wire   [15:0] bitcast_ln123_11_fu_163_p1;
wire   [15:0] bitcast_ln123_10_fu_155_p1;
wire   [15:0] bitcast_ln123_fu_147_p1;
reg   [1:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        add_ln123_reg_188 <= add_ln123_fu_117_p2;
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
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
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

assign add_ln123_4_fu_136_p2 = (shl_ln123_fu_123_p2 + zext_ln123_9_fu_132_p1);

assign add_ln123_fu_117_p2 = (sub_ln123_cast15_fu_109_p1 + zext_ln123_8_fu_113_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign bitcast_ln123_10_fu_155_p1 = max_vals_3_1;

assign bitcast_ln123_11_fu_163_p1 = max_vals_3_2;

assign bitcast_ln123_12_fu_171_p1 = max_vals_3_3;

assign bitcast_ln123_fu_147_p1 = max_vals_3_0;

assign out_data_address1 = zext_ln123_10_fu_142_p1;

assign out_data_d1 = {{{{bitcast_ln123_12_fu_171_p1}, {bitcast_ln123_11_fu_163_p1}}, {bitcast_ln123_10_fu_155_p1}}, {bitcast_ln123_fu_147_p1}};

assign shl_ln123_fu_123_p2 = add_ln123_reg_188 << 16'd2;

assign sub_ln123_cast15_fu_109_p1 = sub_ln123_fu_103_p2;

assign sub_ln123_fu_103_p2 = (zext_ln123_fu_87_p1 - zext_ln123_7_fu_99_p1);

assign tmp_fu_79_p3 = {{i}, {7'd0}};

assign tmp_s_fu_91_p3 = {{i}, {4'd0}};

assign zext_ln123_10_fu_142_p1 = add_ln123_4_fu_136_p2;

assign zext_ln123_7_fu_99_p1 = tmp_s_fu_91_p3;

assign zext_ln123_8_fu_113_p1 = j;

assign zext_ln123_9_fu_132_p1 = k;

assign zext_ln123_fu_87_p1 = tmp_fu_79_p3;

endmodule //td_fused_top_tdf1_writeOutputs_aligned
