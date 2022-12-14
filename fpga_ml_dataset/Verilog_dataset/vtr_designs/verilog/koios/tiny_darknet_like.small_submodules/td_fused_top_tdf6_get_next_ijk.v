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

module td_fused_top_tdf6_get_next_ijk (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        indices_0_din,
        indices_0_full_n,
        indices_0_write,
        indices_1_din,
        indices_1_full_n,
        indices_1_write,
        indices_2_out_din,
        indices_2_out_full_n,
        indices_2_out_write,
        indices_2_out1_din,
        indices_2_out1_full_n,
        indices_2_out1_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
output  [15:0] indices_0_din;
input   indices_0_full_n;
output   indices_0_write;
output  [15:0] indices_1_din;
input   indices_1_full_n;
output   indices_1_write;
output  [4:0] indices_2_out_din;
input   indices_2_out_full_n;
output   indices_2_out_write;
output  [4:0] indices_2_out1_din;
input   indices_2_out1_full_n;
output   indices_2_out1_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg indices_0_write;
reg indices_1_write;
reg indices_2_out_write;
reg indices_2_out1_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
  reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg   [15:0] i_1;
reg   [15:0] j_1;
reg   [15:0] k_1;
reg    indices_0_blk_n;
reg    indices_1_blk_n;
reg    indices_2_out_blk_n;
reg    indices_2_out1_blk_n;
reg   [0:0] ap_phi_mux_j_17_flag_0_i_phi_fu_77_p6;
reg    ap_block_state1;
wire   [0:0] icmp_ln78_fu_141_p2;
wire   [0:0] icmp_ln81_fu_154_p2;
reg   [15:0] ap_phi_mux_j_17_new_0_i_phi_fu_91_p6;
wire   [15:0] add_ln80_fu_147_p2;
reg   [15:0] ap_phi_mux_k_17_new_0_i_phi_fu_104_p6;
wire   [15:0] add_ln77_fu_134_p2;
wire   [15:0] select_ln84_fu_172_p3;
wire   [4:0] trunc_ln76_fu_128_p1;
wire   [15:0] add_ln83_fu_160_p2;
wire   [0:0] icmp_ln84_fu_166_p2;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 i_1 = 16'd0;
#0 j_1 = 16'd0;
#0 k_1 = 16'd0;
end

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
        end else if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (icmp_ln81_fu_154_p2 == 1'd1) & (icmp_ln78_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_1 <= select_ln84_fu_172_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (ap_phi_mux_j_17_flag_0_i_phi_fu_77_p6 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        j_1 <= ap_phi_mux_j_17_new_0_i_phi_fu_91_p6;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        k_1 <= ap_phi_mux_k_17_new_0_i_phi_fu_104_p6;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln78_fu_141_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_j_17_flag_0_i_phi_fu_77_p6 = 1'd0;
    end else if ((((icmp_ln81_fu_154_p2 == 1'd0) & (icmp_ln78_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((icmp_ln81_fu_154_p2 == 1'd1) & (icmp_ln78_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_j_17_flag_0_i_phi_fu_77_p6 = 1'd1;
    end else begin
        ap_phi_mux_j_17_flag_0_i_phi_fu_77_p6 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln78_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln81_fu_154_p2 == 1'd0)) begin
            ap_phi_mux_j_17_new_0_i_phi_fu_91_p6 = add_ln80_fu_147_p2;
        end else if ((icmp_ln81_fu_154_p2 == 1'd1)) begin
            ap_phi_mux_j_17_new_0_i_phi_fu_91_p6 = 16'd0;
        end else begin
            ap_phi_mux_j_17_new_0_i_phi_fu_91_p6 = 'bx;
        end
    end else begin
        ap_phi_mux_j_17_new_0_i_phi_fu_91_p6 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln78_fu_141_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_k_17_new_0_i_phi_fu_104_p6 = add_ln77_fu_134_p2;
    end else if ((((icmp_ln81_fu_154_p2 == 1'd0) & (icmp_ln78_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((icmp_ln81_fu_154_p2 == 1'd1) & (icmp_ln78_fu_141_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_k_17_new_0_i_phi_fu_104_p6 = 16'd0;
    end else begin
        ap_phi_mux_k_17_new_0_i_phi_fu_104_p6 = 'bx;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_0_blk_n = indices_0_full_n;
    end else begin
        indices_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_0_write = 1'b1;
    end else begin
        indices_0_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_1_blk_n = indices_1_full_n;
    end else begin
        indices_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_1_write = 1'b1;
    end else begin
        indices_1_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_2_out1_blk_n = indices_2_out1_full_n;
    end else begin
        indices_2_out1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_2_out1_write = 1'b1;
    end else begin
        indices_2_out1_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_2_out_blk_n = indices_2_out_full_n;
    end else begin
        indices_2_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_2_out_write = 1'b1;
    end else begin
        indices_2_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_full_n == 1'b0) & (start_once_reg == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((real_start == 1'b1) & (start_once_reg == 1'b0))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln77_fu_134_p2 = (k_1 + 16'd1);

assign add_ln80_fu_147_p2 = (j_1 + 16'd1);

assign add_ln83_fu_160_p2 = (i_1 + 16'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (indices_2_out1_full_n == 1'b0) | (indices_2_out_full_n == 1'b0) | (indices_1_full_n == 1'b0) | (indices_0_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign icmp_ln78_fu_141_p2 = ((add_ln77_fu_134_p2 == 16'd32) ? 1'b1 : 1'b0);

assign icmp_ln81_fu_154_p2 = ((add_ln80_fu_147_p2 == 16'd28) ? 1'b1 : 1'b0);

assign icmp_ln84_fu_166_p2 = ((add_ln83_fu_160_p2 == 16'd28) ? 1'b1 : 1'b0);

assign indices_0_din = i_1;

assign indices_1_din = j_1;

assign indices_2_out1_din = trunc_ln76_fu_128_p1;

assign indices_2_out_din = trunc_ln76_fu_128_p1;

assign select_ln84_fu_172_p3 = ((icmp_ln84_fu_166_p2[0:0] == 1'b1) ? 16'd0 : add_ln83_fu_160_p2);

assign start_out = real_start;

assign trunc_ln76_fu_128_p1 = k_1[4:0];

endmodule //td_fused_top_tdf6_get_next_ijk
