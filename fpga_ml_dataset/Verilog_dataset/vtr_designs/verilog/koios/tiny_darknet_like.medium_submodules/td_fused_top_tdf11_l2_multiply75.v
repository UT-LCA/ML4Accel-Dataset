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

module td_fused_top_tdf11_l2_multiply75 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        intermediate_fmaps_0_read,
        intermediate_fmaps_1_read,
        intermediate_fmaps_2_read,
        intermediate_fmaps_3_read,
        l2_filter_data_0_address0,
        l2_filter_data_0_ce0,
        l2_filter_data_0_q0,
        l2_filter_data_0_address1,
        l2_filter_data_0_ce1,
        l2_filter_data_0_q1,
        l2_filter_data_1_address0,
        l2_filter_data_1_ce0,
        l2_filter_data_1_q0,
        l2_filter_data_1_address1,
        l2_filter_data_1_ce1,
        l2_filter_data_1_q1,
        l2_filter_data_2_address0,
        l2_filter_data_2_ce0,
        l2_filter_data_2_q0,
        l2_filter_data_2_address1,
        l2_filter_data_2_ce1,
        l2_filter_data_2_q1,
        l2_filter_data_3_address0,
        l2_filter_data_3_ce0,
        l2_filter_data_3_q0,
        l2_filter_data_3_address1,
        l2_filter_data_3_ce1,
        l2_filter_data_3_q1,
        l2_products_0_address0,
        l2_products_0_ce0,
        l2_products_0_we0,
        l2_products_0_d0,
        l2_products_1_address0,
        l2_products_1_ce0,
        l2_products_1_we0,
        l2_products_1_d0,
        l2_products_2_address0,
        l2_products_2_ce0,
        l2_products_2_we0,
        l2_products_2_d0,
        l2_products_3_address0,
        l2_products_3_ce0,
        l2_products_3_we0,
        l2_products_3_d0,
        l2_products_4_address0,
        l2_products_4_ce0,
        l2_products_4_we0,
        l2_products_4_d0,
        l2_products_5_address0,
        l2_products_5_ce0,
        l2_products_5_we0,
        l2_products_5_d0,
        l2_products_6_address0,
        l2_products_6_ce0,
        l2_products_6_we0,
        l2_products_6_d0,
        l2_products_7_address0,
        l2_products_7_ce0,
        l2_products_7_we0,
        l2_products_7_d0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state10 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] intermediate_fmaps_0_read;
input  [15:0] intermediate_fmaps_1_read;
input  [15:0] intermediate_fmaps_2_read;
input  [15:0] intermediate_fmaps_3_read;
output  [13:0] l2_filter_data_0_address0;
output   l2_filter_data_0_ce0;
input  [15:0] l2_filter_data_0_q0;
output  [13:0] l2_filter_data_0_address1;
output   l2_filter_data_0_ce1;
input  [15:0] l2_filter_data_0_q1;
output  [13:0] l2_filter_data_1_address0;
output   l2_filter_data_1_ce0;
input  [15:0] l2_filter_data_1_q0;
output  [13:0] l2_filter_data_1_address1;
output   l2_filter_data_1_ce1;
input  [15:0] l2_filter_data_1_q1;
output  [13:0] l2_filter_data_2_address0;
output   l2_filter_data_2_ce0;
input  [15:0] l2_filter_data_2_q0;
output  [13:0] l2_filter_data_2_address1;
output   l2_filter_data_2_ce1;
input  [15:0] l2_filter_data_2_q1;
output  [13:0] l2_filter_data_3_address0;
output   l2_filter_data_3_ce0;
input  [15:0] l2_filter_data_3_q0;
output  [13:0] l2_filter_data_3_address1;
output   l2_filter_data_3_ce1;
input  [15:0] l2_filter_data_3_q1;
output  [5:0] l2_products_0_address0;
output   l2_products_0_ce0;
output   l2_products_0_we0;
output  [15:0] l2_products_0_d0;
output  [5:0] l2_products_1_address0;
output   l2_products_1_ce0;
output   l2_products_1_we0;
output  [15:0] l2_products_1_d0;
output  [5:0] l2_products_2_address0;
output   l2_products_2_ce0;
output   l2_products_2_we0;
output  [15:0] l2_products_2_d0;
output  [5:0] l2_products_3_address0;
output   l2_products_3_ce0;
output   l2_products_3_we0;
output  [15:0] l2_products_3_d0;
output  [5:0] l2_products_4_address0;
output   l2_products_4_ce0;
output   l2_products_4_we0;
output  [15:0] l2_products_4_d0;
output  [5:0] l2_products_5_address0;
output   l2_products_5_ce0;
output   l2_products_5_we0;
output  [15:0] l2_products_5_d0;
output  [5:0] l2_products_6_address0;
output   l2_products_6_ce0;
output   l2_products_6_we0;
output  [15:0] l2_products_6_d0;
output  [5:0] l2_products_7_address0;
output   l2_products_7_ce0;
output   l2_products_7_we0;
output  [15:0] l2_products_7_d0;
input  [6:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg l2_filter_data_0_ce0;
reg l2_filter_data_0_ce1;
reg l2_filter_data_1_ce0;
reg l2_filter_data_1_ce1;
reg l2_filter_data_2_ce0;
reg l2_filter_data_2_ce1;
reg l2_filter_data_3_ce0;
reg l2_filter_data_3_ce1;
reg l2_products_0_ce0;
reg l2_products_0_we0;
reg l2_products_1_ce0;
reg l2_products_1_we0;
reg l2_products_2_ce0;
reg l2_products_2_we0;
reg l2_products_3_ce0;
reg l2_products_3_we0;
reg l2_products_4_ce0;
reg l2_products_4_we0;
reg l2_products_5_ce0;
reg l2_products_5_we0;
reg l2_products_6_ce0;
reg l2_products_6_we0;
reg l2_products_7_ce0;
reg l2_products_7_we0;
reg indices_23_read;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [9:0] i_03_0_i_i_reg_354;
wire   [8:0] shl_ln_fu_397_p3;
reg   [8:0] shl_ln_reg_552;
wire   [0:0] icmp_ln20_fu_405_p2;
reg   [0:0] icmp_ln20_reg_557;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln20_reg_557_pp0_iter1_reg;
reg   [0:0] icmp_ln20_reg_557_pp0_iter2_reg;
reg   [0:0] icmp_ln20_reg_557_pp0_iter3_reg;
reg   [0:0] icmp_ln20_reg_557_pp0_iter4_reg;
reg   [0:0] icmp_ln20_reg_557_pp0_iter5_reg;
reg   [0:0] icmp_ln20_reg_557_pp0_iter6_reg;
wire   [9:0] add_ln20_fu_411_p2;
reg    ap_enable_reg_pp0_iter0;
reg   [1:0] trunc_ln_reg_566;
reg   [6:0] tmp_59_reg_591;
reg   [6:0] tmp_59_reg_591_pp0_iter1_reg;
reg   [6:0] tmp_59_reg_591_pp0_iter2_reg;
reg   [6:0] tmp_59_reg_591_pp0_iter3_reg;
reg   [6:0] tmp_59_reg_591_pp0_iter4_reg;
reg   [6:0] tmp_59_reg_591_pp0_iter5_reg;
reg   [6:0] tmp_59_reg_591_pp0_iter6_reg;
wire   [15:0] tmp_fu_504_p6;
reg   [15:0] tmp_reg_616;
reg   [15:0] l2_filter_data_0_load_reg_628;
reg    ap_enable_reg_pp0_iter1;
reg   [15:0] l2_filter_data_1_load_reg_633;
reg   [15:0] l2_filter_data_2_load_reg_638;
reg   [15:0] l2_filter_data_3_load_reg_643;
reg   [15:0] l2_filter_data_0_load_3_reg_648;
reg   [15:0] l2_filter_data_1_load_3_reg_653;
reg   [15:0] l2_filter_data_2_load_1_reg_658;
reg   [15:0] l2_filter_data_3_load_1_reg_663;
wire   [15:0] grp_fu_365_p2;
reg   [15:0] mul_i_i_reg_668;
wire   [15:0] grp_fu_369_p2;
reg   [15:0] mul_1_i_i_reg_673;
wire   [15:0] grp_fu_373_p2;
reg   [15:0] mul_2_i_i_reg_678;
wire   [15:0] grp_fu_377_p2;
reg   [15:0] mul_3_i_i_reg_683;
wire   [15:0] grp_fu_381_p2;
reg   [15:0] mul_4_i_i_reg_688;
wire   [15:0] grp_fu_385_p2;
reg   [15:0] mul_5_i_i_reg_693;
wire   [15:0] grp_fu_389_p2;
reg   [15:0] mul_6_i_i_reg_698;
wire   [15:0] grp_fu_393_p2;
reg   [15:0] mul_7_i_i_reg_703;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
wire   [63:0] zext_ln29_fu_464_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln29_30_fu_496_p1;
wire   [63:0] zext_ln29_29_fu_520_p1;
wire   [2:0] trunc_ln1_fu_417_p4;
wire   [8:0] zext_ln24_fu_427_p1;
wire   [4:0] lshr_ln_fu_446_p4;
wire   [8:0] add_ln25_fu_431_p2;
wire   [13:0] tmp_s_fu_456_p3;
wire   [4:0] or_ln29_fu_482_p2;
wire   [13:0] tmp_61_fu_488_p3;
wire   [13:0] tmp_60_fu_513_p3;
wire    ap_CS_fsm_state10;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
end

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1742(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_616),
    .din1(l2_filter_data_0_load_reg_628),
    .dout(grp_fu_365_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1743(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_616),
    .din1(l2_filter_data_1_load_reg_633),
    .dout(grp_fu_369_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1744(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_616),
    .din1(l2_filter_data_2_load_reg_638),
    .dout(grp_fu_373_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1745(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_616),
    .din1(l2_filter_data_3_load_reg_643),
    .dout(grp_fu_377_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1746(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_616),
    .din1(l2_filter_data_0_load_3_reg_648),
    .dout(grp_fu_381_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1747(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_616),
    .din1(l2_filter_data_1_load_3_reg_653),
    .dout(grp_fu_385_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1748(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_616),
    .din1(l2_filter_data_2_load_1_reg_658),
    .dout(grp_fu_389_p2)
);

td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_5_max_dsp_1_U1749(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(tmp_reg_616),
    .din1(l2_filter_data_3_load_1_reg_663),
    .dout(grp_fu_393_p2)
);

td_fused_top_mux_42_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 16 ))
mux_42_16_1_1_U1750(
    .din0(intermediate_fmaps_0_read),
    .din1(intermediate_fmaps_1_read),
    .din2(intermediate_fmaps_2_read),
    .din3(intermediate_fmaps_3_read),
    .din4(trunc_ln_reg_566),
    .dout(tmp_fu_504_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state10)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1) | (indices_23_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1) | (indices_23_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter7 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln20_fu_405_p2 == 1'd0))) begin
        i_03_0_i_i_reg_354 <= add_ln20_fu_411_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1) | (indices_23_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_03_0_i_i_reg_354 <= 10'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln20_reg_557 <= icmp_ln20_fu_405_p2;
        icmp_ln20_reg_557_pp0_iter1_reg <= icmp_ln20_reg_557;
        tmp_59_reg_591_pp0_iter1_reg <= tmp_59_reg_591;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln20_reg_557_pp0_iter2_reg <= icmp_ln20_reg_557_pp0_iter1_reg;
        icmp_ln20_reg_557_pp0_iter3_reg <= icmp_ln20_reg_557_pp0_iter2_reg;
        icmp_ln20_reg_557_pp0_iter4_reg <= icmp_ln20_reg_557_pp0_iter3_reg;
        icmp_ln20_reg_557_pp0_iter5_reg <= icmp_ln20_reg_557_pp0_iter4_reg;
        icmp_ln20_reg_557_pp0_iter6_reg <= icmp_ln20_reg_557_pp0_iter5_reg;
        tmp_59_reg_591_pp0_iter2_reg <= tmp_59_reg_591_pp0_iter1_reg;
        tmp_59_reg_591_pp0_iter3_reg <= tmp_59_reg_591_pp0_iter2_reg;
        tmp_59_reg_591_pp0_iter4_reg <= tmp_59_reg_591_pp0_iter3_reg;
        tmp_59_reg_591_pp0_iter5_reg <= tmp_59_reg_591_pp0_iter4_reg;
        tmp_59_reg_591_pp0_iter6_reg <= tmp_59_reg_591_pp0_iter5_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln20_reg_557 == 1'd0))) begin
        l2_filter_data_0_load_3_reg_648 <= l2_filter_data_0_q0;
        l2_filter_data_0_load_reg_628 <= l2_filter_data_0_q1;
        l2_filter_data_1_load_3_reg_653 <= l2_filter_data_1_q0;
        l2_filter_data_1_load_reg_633 <= l2_filter_data_1_q1;
        l2_filter_data_2_load_1_reg_658 <= l2_filter_data_2_q0;
        l2_filter_data_2_load_reg_638 <= l2_filter_data_2_q1;
        l2_filter_data_3_load_1_reg_663 <= l2_filter_data_3_q0;
        l2_filter_data_3_load_reg_643 <= l2_filter_data_3_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln20_reg_557_pp0_iter5_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul_1_i_i_reg_673 <= grp_fu_369_p2;
        mul_2_i_i_reg_678 <= grp_fu_373_p2;
        mul_3_i_i_reg_683 <= grp_fu_377_p2;
        mul_4_i_i_reg_688 <= grp_fu_381_p2;
        mul_5_i_i_reg_693 <= grp_fu_385_p2;
        mul_6_i_i_reg_698 <= grp_fu_389_p2;
        mul_7_i_i_reg_703 <= grp_fu_393_p2;
        mul_i_i_reg_668 <= grp_fu_365_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        shl_ln_reg_552[8 : 2] <= shl_ln_fu_397_p3[8 : 2];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln20_fu_405_p2 == 1'd0))) begin
        tmp_59_reg_591 <= {{i_03_0_i_i_reg_354[9:3]}};
        trunc_ln_reg_566 <= {{i_03_0_i_i_reg_354[8:7]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln20_reg_557 == 1'd0))) begin
        tmp_reg_616 <= tmp_fu_504_p6;
    end
end

always @ (*) begin
    if ((icmp_ln20_fu_405_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
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
    if (((ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_blk_n = indices_23_empty_n;
    end else begin
        indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1) | (indices_23_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_read = 1'b1;
    end else begin
        indices_23_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_0_ce0 = 1'b1;
    end else begin
        l2_filter_data_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_0_ce1 = 1'b1;
    end else begin
        l2_filter_data_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_1_ce0 = 1'b1;
    end else begin
        l2_filter_data_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_1_ce1 = 1'b1;
    end else begin
        l2_filter_data_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_2_ce0 = 1'b1;
    end else begin
        l2_filter_data_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_2_ce1 = 1'b1;
    end else begin
        l2_filter_data_2_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_3_ce0 = 1'b1;
    end else begin
        l2_filter_data_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_filter_data_3_ce1 = 1'b1;
    end else begin
        l2_filter_data_3_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_0_ce0 = 1'b1;
    end else begin
        l2_products_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln20_reg_557_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_0_we0 = 1'b1;
    end else begin
        l2_products_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_1_ce0 = 1'b1;
    end else begin
        l2_products_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln20_reg_557_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_1_we0 = 1'b1;
    end else begin
        l2_products_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_2_ce0 = 1'b1;
    end else begin
        l2_products_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln20_reg_557_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_2_we0 = 1'b1;
    end else begin
        l2_products_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_3_ce0 = 1'b1;
    end else begin
        l2_products_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln20_reg_557_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_3_we0 = 1'b1;
    end else begin
        l2_products_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_4_ce0 = 1'b1;
    end else begin
        l2_products_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln20_reg_557_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_4_we0 = 1'b1;
    end else begin
        l2_products_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_5_ce0 = 1'b1;
    end else begin
        l2_products_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln20_reg_557_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_5_we0 = 1'b1;
    end else begin
        l2_products_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_6_ce0 = 1'b1;
    end else begin
        l2_products_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln20_reg_557_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_6_we0 = 1'b1;
    end else begin
        l2_products_6_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_7_ce0 = 1'b1;
    end else begin
        l2_products_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln20_reg_557_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        l2_products_7_we0 = 1'b1;
    end else begin
        l2_products_7_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1) | (indices_23_empty_n == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln20_fu_405_p2 == 1'd1)) & ~((ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln20_fu_405_p2 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln20_fu_411_p2 = (i_03_0_i_i_reg_354 + 10'd8);

assign add_ln25_fu_431_p2 = (shl_ln_reg_552 + zext_ln24_fu_427_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1) | (indices_23_empty_n == 1'b0));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign icmp_ln20_fu_405_p2 = ((i_03_0_i_i_reg_354 == 10'd512) ? 1'b1 : 1'b0);

assign l2_filter_data_0_address0 = zext_ln29_30_fu_496_p1;

assign l2_filter_data_0_address1 = zext_ln29_fu_464_p1;

assign l2_filter_data_1_address0 = zext_ln29_30_fu_496_p1;

assign l2_filter_data_1_address1 = zext_ln29_fu_464_p1;

assign l2_filter_data_2_address0 = zext_ln29_30_fu_496_p1;

assign l2_filter_data_2_address1 = zext_ln29_fu_464_p1;

assign l2_filter_data_3_address0 = zext_ln29_30_fu_496_p1;

assign l2_filter_data_3_address1 = zext_ln29_fu_464_p1;

assign l2_products_0_address0 = zext_ln29_29_fu_520_p1;

assign l2_products_0_d0 = mul_i_i_reg_668;

assign l2_products_1_address0 = zext_ln29_29_fu_520_p1;

assign l2_products_1_d0 = mul_1_i_i_reg_673;

assign l2_products_2_address0 = zext_ln29_29_fu_520_p1;

assign l2_products_2_d0 = mul_2_i_i_reg_678;

assign l2_products_3_address0 = zext_ln29_29_fu_520_p1;

assign l2_products_3_d0 = mul_3_i_i_reg_683;

assign l2_products_4_address0 = zext_ln29_29_fu_520_p1;

assign l2_products_4_d0 = mul_4_i_i_reg_688;

assign l2_products_5_address0 = zext_ln29_29_fu_520_p1;

assign l2_products_5_d0 = mul_5_i_i_reg_693;

assign l2_products_6_address0 = zext_ln29_29_fu_520_p1;

assign l2_products_6_d0 = mul_6_i_i_reg_698;

assign l2_products_7_address0 = zext_ln29_29_fu_520_p1;

assign l2_products_7_d0 = mul_7_i_i_reg_703;

assign lshr_ln_fu_446_p4 = {{i_03_0_i_i_reg_354[6:2]}};

assign or_ln29_fu_482_p2 = (lshr_ln_fu_446_p4 | 5'd1);

assign shl_ln_fu_397_p3 = {{indices_23_dout}, {2'd0}};

assign tmp_60_fu_513_p3 = {{7'd0}, {tmp_59_reg_591_pp0_iter6_reg}};

assign tmp_61_fu_488_p3 = {{or_ln29_fu_482_p2}, {add_ln25_fu_431_p2}};

assign tmp_s_fu_456_p3 = {{lshr_ln_fu_446_p4}, {add_ln25_fu_431_p2}};

assign trunc_ln1_fu_417_p4 = {{i_03_0_i_i_reg_354[9:7]}};

assign zext_ln24_fu_427_p1 = trunc_ln1_fu_417_p4;

assign zext_ln29_29_fu_520_p1 = tmp_60_fu_513_p3;

assign zext_ln29_30_fu_496_p1 = tmp_61_fu_488_p3;

assign zext_ln29_fu_464_p1 = tmp_s_fu_456_p3;

always @ (posedge ap_clk) begin
    shl_ln_reg_552[1:0] <= 2'b00;
end

endmodule //td_fused_top_tdf11_l2_multiply75
module td_fused_top_mux_42_16_1_1 #(
parameter
    ID                = 0,
    NUM_STAGE         = 1,
    din0_WIDTH       = 32,
    din1_WIDTH       = 32,
    din2_WIDTH       = 32,
    din3_WIDTH       = 32,
    din4_WIDTH         = 32,
    dout_WIDTH            = 32
)(
    input  [15 : 0]     din0,
    input  [15 : 0]     din1,
    input  [15 : 0]     din2,
    input  [15 : 0]     din3,
    input  [1 : 0]    din4,
    output [15 : 0]   dout);

// puts internal signals
wire [1 : 0]     sel;
// level 1 signals
wire [15 : 0]         mux_1_0;
wire [15 : 0]         mux_1_1;
// level 2 signals
wire [15 : 0]         mux_2_0;

assign sel = din4;

// Generate level 1 logic
assign mux_1_0 = (sel[0] == 0)? din0 : din1;
assign mux_1_1 = (sel[0] == 0)? din2 : din3;

// Generate level 2 logic
assign mux_2_0 = (sel[1] == 0)? mux_1_0 : mux_1_1;

// output logic
assign dout = mux_2_0;

endmodule

module td_fused_top_hmul_16ns_16ns_16_5_max_dsp_1
#(parameter
    ID         = 31,
    NUM_STAGE  = 5,
    din0_WIDTH = 16,
    din1_WIDTH = 16,
    dout_WIDTH = 16
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din1_WIDTH-1:0] din1,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Local signal-------------------
wire                  aclk;
wire                  aclken;
wire                  a_tvalid;
wire [15:0]           a_tdata;
wire                  b_tvalid;
wire [15:0]           b_tdata;
wire                  r_tvalid;
wire [15:0]           r_tdata;
reg  [din0_WIDTH-1:0] din0_buf1;
reg  [din1_WIDTH-1:0] din1_buf1;
reg                   ce_r;
wire [dout_WIDTH-1:0] dout_i;
reg  [dout_WIDTH-1:0] dout_r;
//------------------------Instantiation------------------
td_fused_top_ap_hmul_3_max_dsp_16 td_fused_top_ap_hmul_3_max_dsp_16_u (
    .aclk                 ( aclk ),
    .aclken               ( aclken ),
    .s_axis_a_tvalid      ( a_tvalid ),
    .s_axis_a_tdata       ( a_tdata ),
    .s_axis_b_tvalid      ( b_tvalid ),
    .s_axis_b_tdata       ( b_tdata ),
    .m_axis_result_tvalid ( r_tvalid ),
    .m_axis_result_tdata  ( r_tdata )
);
//------------------------Body---------------------------
assign aclk     = clk;
assign aclken   = ce_r;
assign a_tvalid = 1'b1;
assign a_tdata  = din0_buf1;
assign b_tvalid = 1'b1;
assign b_tdata  = din1_buf1;
assign dout_i   = r_tdata;

always @(posedge clk) begin
    if (ce) begin
        din0_buf1 <= din0;
        din1_buf1 <= din1;
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
module td_fused_top_ap_hmul_3_max_dsp_16 (
   input  wire        aclk,
   input  wire        aclken,
   input  wire        s_axis_a_tvalid,
   input  wire [15:0] s_axis_a_tdata,
   input  wire        s_axis_b_tvalid,
   input  wire [15:0] s_axis_b_tdata,
   output wire        m_axis_result_tvalid,
   output wire [15:0] m_axis_result_tdata
);

   reg [15:0] a_reg, b_reg, res, res_reg;

   always @(posedge aclk) begin
      if (aclken) begin
         a_reg <= s_axis_a_tdata;     
         b_reg <= s_axis_b_tdata;     
         res_reg <= res;
      end
   end

`ifdef complex_dsp
   multiply_fp u_mult_fp (
      .a(a_reg), 
      .b(b_reg), 
      .out(res)
   );
`else
FPMult_16 u_FPMult (.clk(), .rst(1'b0), .a(a_reg), .b(b_reg), .result(res), .flags());
`endif

   assign m_axis_result_tdata = res_reg;

endmodule
module FPMult_16(
		clk,
		rst,
		a,
		b,
		result,
		flags
    );
	
	// Input Ports
	input clk ;							// Clock
	input rst ;							// Reset signal
	input [`DWIDTH-1:0] a;					// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b;					// Input B, a 32-bit floating point number
	
	// Output ports
	output [`DWIDTH-1:0] result ;					// Product, result of the operation, 32-bit FP number
	output [4:0] flags ;				// Flags indicating exceptions according to IEEE754
	
	// Internal signals
	wire [31:0] Z_int ;				// Product, result of the operation, 32-bit FP number
	wire [4:0] Flags_int ;			// Flags indicating exceptions according to IEEE754
	
	wire Sa ;							// A's sign
	wire Sb ;							// B's sign
	wire Sp ;							// Product sign
	wire [`EXPONENT-1:0] Ea ;					// A's exponent
	wire [`EXPONENT-1:0] Eb ;					// B's exponent
	wire [2*`MANTISSA+1:0] Mp ;					// Product mantissa
	wire [4:0] InputExc ;			// Exceptions in inputs
	wire [`MANTISSA-1:0] NormM ;				// Normalized mantissa
	wire [`EXPONENT:0] NormE ;				// Normalized exponent
	wire [`MANTISSA:0] RoundM ;				// Normalized mantissa
	wire [`EXPONENT:0] RoundE ;				// Normalized exponent
	wire [`MANTISSA:0] RoundMP ;				// Normalized mantissa
	wire [`EXPONENT:0] RoundEP ;				// Normalized exponent
	wire GRS ;

	//reg [63:0] pipe_0;			// Pipeline register Input->Prep
	reg [2*`DWIDTH-1:0] pipe_0;			// Pipeline register Input->Prep

	//reg [92:0] pipe_1;			// Pipeline register Prep->Execute
	reg [3*`MANTISSA+2*`EXPONENT+7:0] pipe_1;			// Pipeline register Prep->Execute

	//reg [38:0] pipe_2;			// Pipeline register Execute->Normalize
	reg [`MANTISSA+`EXPONENT+7:0] pipe_2;			// Pipeline register Execute->Normalize
	
	//reg [72:0] pipe_3;			// Pipeline register Normalize->Round
	reg [2*`MANTISSA+2*`EXPONENT+10:0] pipe_3;			// Pipeline register Normalize->Round

	//reg [36:0] pipe_4;			// Pipeline register Round->Output
	reg [`DWIDTH+4:0] pipe_4;			// Pipeline register Round->Output
	
	assign result = pipe_4[`DWIDTH+4:5] ;
	assign flags = pipe_4[4:0] ;
	
	// Prepare the operands for alignment and check for exceptions
	FPMult_PrepModule PrepModule(clk, rst, pipe_0[2*`DWIDTH-1:`DWIDTH], pipe_0[`DWIDTH-1:0], Sa, Sb, Ea[`EXPONENT-1:0], Eb[`EXPONENT-1:0], Mp[2*`MANTISSA+1:0], InputExc[4:0]) ;

	// Perform (unsigned) mantissa multiplication
	FPMult_ExecuteModule ExecuteModule(pipe_1[3*`MANTISSA+`EXPONENT*2+7:2*`MANTISSA+2*`EXPONENT+8], pipe_1[2*`MANTISSA+2*`EXPONENT+7:2*`MANTISSA+7], pipe_1[2*`MANTISSA+6:5], pipe_1[2*`MANTISSA+2*`EXPONENT+6:2*`MANTISSA+`EXPONENT+7], pipe_1[2*`MANTISSA+`EXPONENT+6:2*`MANTISSA+7], pipe_1[2*`MANTISSA+2*`EXPONENT+8], pipe_1[2*`MANTISSA+2*`EXPONENT+7], Sp, NormE[`EXPONENT:0], NormM[`MANTISSA-1:0], GRS) ;

	// Round result and if necessary, perform a second (post-rounding) normalization step
	FPMult_NormalizeModule NormalizeModule(pipe_2[`MANTISSA-1:0], pipe_2[`MANTISSA+`EXPONENT:`MANTISSA], RoundE[`EXPONENT:0], RoundEP[`EXPONENT:0], RoundM[`MANTISSA:0], RoundMP[`MANTISSA:0]) ;		

	// Round result and if necessary, perform a second (post-rounding) normalization step
	//FPMult_RoundModule RoundModule(pipe_3[47:24], pipe_3[23:0], pipe_3[65:57], pipe_3[56:48], pipe_3[66], pipe_3[67], pipe_3[72:68], Z_int[31:0], Flags_int[4:0]) ;		
	FPMult_RoundModule RoundModule(pipe_3[2*`MANTISSA+1:`MANTISSA+1], pipe_3[`MANTISSA:0], pipe_3[2*`MANTISSA+2*`EXPONENT+3:2*`MANTISSA+`EXPONENT+3], pipe_3[2*`MANTISSA+`EXPONENT+2:2*`MANTISSA+2], pipe_3[2*`MANTISSA+2*`EXPONENT+4], pipe_3[2*`MANTISSA+2*`EXPONENT+5], pipe_3[2*`MANTISSA+2*`EXPONENT+10:2*`MANTISSA+2*`EXPONENT+6], Z_int[`DWIDTH-1:0], Flags_int[4:0]) ;		

	always @ (*) begin	
		if(rst) begin
			pipe_0 = 0;
			pipe_1 = 0;
			pipe_2 = 0; 
			pipe_3 = 0;
			pipe_4 = 0;
		end 
		else begin		
			/* PIPE 0
				[63:32] A
				[31:0] B
			*/
      pipe_0 = {a, b} ;

			/* PIPE 1
				[70] Sa
				[69] Sb
				[68:61] Ea
				[60:53] Eb
				[52:5] Mp
				[4:0] InputExc
			*/
			//pipe_1 <= {pipe_0[`DWIDTH+`MANTISSA-1:`DWIDTH], pipe_0[`MANTISSA_MUL_SPLIT_LSB-1:0], Sa, Sb, Ea[`EXPONENT-1:0], Eb[`EXPONENT-1:0], Mp[2*`MANTISSA-1:0], InputExc[4:0]} ;
			pipe_1 = {pipe_0[`DWIDTH+`MANTISSA-1:`DWIDTH], pipe_0[8:0], Sa, Sb, Ea[`EXPONENT-1:0], Eb[`EXPONENT-1:0], Mp[2*`MANTISSA+1:0], InputExc[4:0]} ;
			/* PIPE 2
				[38:34] InputExc
				[33] GRS
				[32] Sp
				[31:23] NormE
				[22:0] NormM
			*/
			pipe_2 = {pipe_1[4:0], GRS, Sp, NormE[`EXPONENT:0], NormM[`MANTISSA-1:0]} ;
			/* PIPE 3
				[72:68] InputExc
				[67] GRS
				[66] Sp	
				[65:57] RoundE
				[56:48] RoundEP
				[47:24] RoundM
				[23:0] RoundMP
			*/
			pipe_3 = {pipe_2[`EXPONENT+`MANTISSA+7:`EXPONENT+`MANTISSA+1], RoundE[`EXPONENT:0], RoundEP[`EXPONENT:0], RoundM[`MANTISSA:0], RoundMP[`MANTISSA:0]} ;
			/* PIPE 4
				[36:5] Z
				[4:0] Flags
			*/				
			pipe_4 = {Z_int[`DWIDTH-1:0], Flags_int[4:0]} ;
		end
	end
		
endmodule
module FPMult_RoundModule(
		RoundM,
		RoundMP,
		RoundE,
		RoundEP,
		Sp,
		GRS,
		InputExc,
		Z,
		Flags
    );

	// Input Ports
	input [`MANTISSA:0] RoundM ;									// Normalized mantissa
	input [`MANTISSA:0] RoundMP ;									// Normalized exponent
	input [`EXPONENT:0] RoundE ;									// Normalized mantissa + 1
	input [`EXPONENT:0] RoundEP ;									// Normalized exponent + 1
	input Sp ;												// Product sign
	input GRS ;
	input [4:0] InputExc ;
	
	// Output Ports
	output [`DWIDTH-1:0] Z ;										// Final product
	output [4:0] Flags ;
	
	// Internal Signals
	wire [`EXPONENT:0] FinalE ;									// Rounded exponent
	wire [`MANTISSA:0] FinalM;
	wire [`MANTISSA:0] PreShiftM;
	
	assign PreShiftM = GRS ? RoundMP : RoundM ;	// Round up if R and (G or S)
	
	// Post rounding normalization (potential one bit shift> use shifted mantissa if there is overflow)
	assign FinalM = (PreShiftM[`MANTISSA] ? {1'b0, PreShiftM[`MANTISSA:1]} : PreShiftM[`MANTISSA:0]) ;
	
	assign FinalE = (PreShiftM[`MANTISSA] ? RoundEP : RoundE) ; // Increment exponent if a shift was done
	
	assign Z = {Sp, FinalE[`EXPONENT-1:0], FinalM[`MANTISSA-1:0]} ;   // Putting the pieces together
	assign Flags = InputExc[4:0];

endmodule
module FPMult_NormalizeModule(
		NormM,
		NormE,
		RoundE,
		RoundEP,
		RoundM,
		RoundMP
    );

	// Input Ports
	input [`MANTISSA-1:0] NormM ;									// Normalized mantissa
	input [`EXPONENT:0] NormE ;									// Normalized exponent

	// Output Ports
	output [`EXPONENT:0] RoundE ;
	output [`EXPONENT:0] RoundEP ;
	output [`MANTISSA:0] RoundM ;
	output [`MANTISSA:0] RoundMP ; 
	
	assign RoundE = NormE - 15 ;
	assign RoundEP = NormE - 14 ;
	assign RoundM = NormM ;
	assign RoundMP = NormM ;

endmodule
module FPMult_ExecuteModule(
		a,
		b,
		MpC,
		Ea,
		Eb,
		Sa,
		Sb,
		Sp,
		NormE,
		NormM,
		GRS
    );

	// Input ports
	input [`MANTISSA-1:0] a ;
	input [2*`EXPONENT:0] b ;
	input [2*`MANTISSA+1:0] MpC ;
	input [`EXPONENT-1:0] Ea ;						// A's exponent
	input [`EXPONENT-1:0] Eb ;						// B's exponent
	input Sa ;								// A's sign
	input Sb ;								// B's sign
	
	// Output ports
	output Sp ;								// Product sign
	output [`EXPONENT:0] NormE ;													// Normalized exponent
	output [`MANTISSA-1:0] NormM ;												// Normalized mantissa
	output GRS ;
	
	wire [2*`MANTISSA+1:0] Mp ;
	
	assign Sp = (Sa ^ Sb) ;												// Equal signs give a positive product
	
   // wire [`ACTUAL_MANTISSA-1:0] inp_a;
   // wire [`ACTUAL_MANTISSA-1:0] inp_b;
   // assign inp_a = {1'b1, a};
   // assign inp_b = {{(`MANTISSA-`MANTISSA_MUL_SPLIT_LSB){1'b0}}, 1'b0, b};
   // DW02_mult #(`ACTUAL_MANTISSA,`ACTUAL_MANTISSA) u_mult(.A(inp_a), .B(inp_b), .TC(1'b0), .PRODUCT(Mp_temp));
   // DW01_add #(2*`ACTUAL_MANTISSA) u_add(.A(Mp_temp), .B(MpC<<`MANTISSA_MUL_SPLIT_LSB), .CI(1'b0), .SUM(Mp), .CO());

	//assign Mp = (MpC<<(2*`EXPONENT+1)) + ({4'b0001, a[`MANTISSA-1:0]}*{1'b0, b[2*`EXPONENT:0]}) ;
	assign Mp = MpC;


	assign NormM = (Mp[2*`MANTISSA+1] ? Mp[2*`MANTISSA:`MANTISSA+1] : Mp[2*`MANTISSA-1:`MANTISSA]); 	// Check for overflow
	assign NormE = (Ea + Eb + Mp[2*`MANTISSA+1]);								// If so, increment exponent
	
	assign GRS = ((Mp[`MANTISSA]&(Mp[`MANTISSA+1]))|(|Mp[`MANTISSA-1:0])) ;
	
endmodule
module FPMult_PrepModule (
		clk,
		rst,
		a,
		b,
		Sa,
		Sb,
		Ea,
		Eb,
		Mp,
		InputExc
	);
	
	// Input ports
	input clk ;
	input rst ;
	input [`DWIDTH-1:0] a ;								// Input A, a 32-bit floating point number
	input [`DWIDTH-1:0] b ;								// Input B, a 32-bit floating point number
	
	// Output ports
	output Sa ;										// A's sign
	output Sb ;										// B's sign
	output [`EXPONENT-1:0] Ea ;								// A's exponent
	output [`EXPONENT-1:0] Eb ;								// B's exponent
	output [2*`MANTISSA+1:0] Mp ;							// Mantissa product
	output [4:0] InputExc ;						// Input numbers are exceptions
	
	// Internal signals							// If signal is high...
	wire ANaN ;										// A is a signalling NaN
	wire BNaN ;										// B is a signalling NaN
	wire AInf ;										// A is infinity
	wire BInf ;										// B is infinity
    wire [`MANTISSA-1:0] Ma;
    wire [`MANTISSA-1:0] Mb;
	
	assign ANaN = &(a[`DWIDTH-2:`MANTISSA]) &  |(a[`DWIDTH-2:`MANTISSA]) ;			// All one exponent and not all zero mantissa - NaN
	assign BNaN = &(b[`DWIDTH-2:`MANTISSA]) &  |(b[`MANTISSA-1:0]);			// All one exponent and not all zero mantissa - NaN
	assign AInf = &(a[`DWIDTH-2:`MANTISSA]) & ~|(a[`DWIDTH-2:`MANTISSA]) ;		// All one exponent and all zero mantissa - Infinity
	assign BInf = &(b[`DWIDTH-2:`MANTISSA]) & ~|(b[`DWIDTH-2:`MANTISSA]) ;		// All one exponent and all zero mantissa - Infinity
	
	// Check for any exceptions and put all flags into exception vector
	assign InputExc = {(ANaN | BNaN | AInf | BInf), ANaN, BNaN, AInf, BInf} ;
	//assign InputExc = {(ANaN | ANaN | BNaN |BNaN), ANaN, ANaN, BNaN,BNaN} ;
	
	// Take input numbers apart
	assign Sa = a[`DWIDTH-1] ;							// A's sign
	assign Sb = b[`DWIDTH-1] ;							// B's sign
	assign Ea = a[`DWIDTH-2:`MANTISSA];						// Store A's exponent in Ea, unless A is an exception
	assign Eb = b[`DWIDTH-2:`MANTISSA];						// Store B's exponent in Eb, unless B is an exception	
//    assign Ma = a[`MANTISSA_MSB:`MANTISSA_LSB];
  //  assign Mb = b[`MANTISSA_MSB:`MANTISSA_LSB];
	


	//assign Mp = ({4'b0001, a[`MANTISSA-1:0]}*{4'b0001, b[`MANTISSA-1:9]}) ;
	assign Mp = ({1'b1,a[`MANTISSA-1:0]}*{1'b1, b[`MANTISSA-1:0]}) ;

	
    //We multiply part of the mantissa here
    //Full mantissa of A
    //Bits MANTISSA_MUL_SPLIT_MSB:MANTISSA_MUL_SPLIT_LSB of B
   // wire [`ACTUAL_MANTISSA-1:0] inp_A;
   // wire [`ACTUAL_MANTISSA-1:0] inp_B;
   // assign inp_A = {1'b1, Ma};
   // assign inp_B = {{(`MANTISSA-(`MANTISSA_MUL_SPLIT_MSB-`MANTISSA_MUL_SPLIT_LSB+1)){1'b0}}, 1'b1, Mb[`MANTISSA_MUL_SPLIT_MSB:`MANTISSA_MUL_SPLIT_LSB]};
   // DW02_mult #(`ACTUAL_MANTISSA,`ACTUAL_MANTISSA) u_mult(.A(inp_A), .B(inp_B), .TC(1'b0), .PRODUCT(Mp));
endmodule



