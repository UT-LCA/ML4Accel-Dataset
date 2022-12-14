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

module td_fused_top_tdf10_readFilters68 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        filter_data_address0,
        filter_data_ce0,
        filter_data_q0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read,
        weight_vecs_0_address0,
        weight_vecs_0_ce0,
        weight_vecs_0_we0,
        weight_vecs_0_d0,
        weight_vecs_0_address1,
        weight_vecs_0_ce1,
        weight_vecs_0_we1,
        weight_vecs_0_d1
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_pp0_stage0 = 4'd2;
parameter    ap_ST_fsm_pp0_stage1 = 4'd4;
parameter    ap_ST_fsm_state7 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [16:0] filter_data_address0;
output   filter_data_ce0;
input  [63:0] filter_data_q0;
input  [8:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [9:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
output   weight_vecs_0_we0;
output  [15:0] weight_vecs_0_d0;
output  [9:0] weight_vecs_0_address1;
output   weight_vecs_0_ce1;
output   weight_vecs_0_we1;
output  [15:0] weight_vecs_0_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_ce0;
reg indices_23_read;
reg[9:0] weight_vecs_0_address0;
reg weight_vecs_0_ce0;
reg weight_vecs_0_we0;
reg[15:0] weight_vecs_0_d0;
reg[9:0] weight_vecs_0_address1;
reg weight_vecs_0_ce1;
reg weight_vecs_0_we1;
reg[15:0] weight_vecs_0_d1;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [7:0] indvar_flatten13_reg_174;
reg   [1:0] ii_reg_185;
reg   [6:0] indvar_flatten_reg_196;
reg   [1:0] jj_reg_207;
reg   [6:0] kk_0_i_i_reg_218;
wire   [12:0] sext_ln47_fu_251_p1;
reg   [12:0] sext_ln47_reg_583;
wire   [7:0] add_ln47_8_fu_255_p2;
reg   [7:0] add_ln47_8_reg_588;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state6_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln47_fu_261_p2;
reg   [0:0] icmp_ln47_reg_593;
reg   [0:0] icmp_ln47_reg_593_pp0_iter1_reg;
wire   [0:0] icmp_ln48_fu_273_p2;
reg   [0:0] icmp_ln48_reg_597;
wire   [1:0] select_ln47_8_fu_287_p3;
reg   [1:0] select_ln47_8_reg_602;
wire   [6:0] select_ln48_fu_356_p3;
reg   [6:0] select_ln48_reg_609;
wire   [1:0] select_ln48_15_fu_364_p3;
reg   [1:0] select_ln48_15_reg_615;
wire   [5:0] empty_149_fu_382_p1;
reg   [5:0] empty_149_reg_621;
reg   [5:0] empty_149_reg_621_pp0_iter1_reg;
wire   [6:0] add_ln48_8_fu_405_p2;
reg   [6:0] add_ln48_8_reg_633;
wire   [6:0] add_ln49_fu_411_p2;
reg   [6:0] add_ln49_reg_638;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state5_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_11001;
wire   [6:0] select_ln48_16_fu_416_p3;
reg   [6:0] select_ln48_16_reg_643;
wire   [5:0] add_ln55_29_fu_449_p2;
reg   [5:0] add_ln55_29_reg_648;
wire   [9:0] add_ln55_30_fu_470_p2;
reg   [9:0] add_ln55_30_reg_655;
reg   [15:0] tmp_102_i_i_reg_660;
reg   [15:0] tmp_103_i_i_reg_665;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage1_subdone;
reg    ap_enable_reg_pp0_iter2;
reg   [7:0] ap_phi_mux_indvar_flatten13_phi_fu_178_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_189_p4;
reg   [6:0] ap_phi_mux_indvar_flatten_phi_fu_200_p4;
reg   [1:0] ap_phi_mux_jj_phi_fu_211_p4;
reg   [6:0] ap_phi_mux_kk_0_i_i_phi_fu_222_p4;
wire   [63:0] tmp_19_fu_396_p3;
wire   [63:0] zext_ln55_75_fu_476_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] sext_ln55_7_fu_501_p1;
wire   [63:0] sext_ln55_8_fu_553_p1;
wire   [63:0] sext_ln55_9_fu_574_p1;
wire   [15:0] bitcast_ln55_fu_484_p1;
wire   [15:0] bitcast_ln55_4_fu_516_p1;
wire   [15:0] bitcast_ln55_5_fu_558_p1;
wire   [15:0] bitcast_ln55_6_fu_579_p1;
wire   [10:0] tmp_fu_233_p3;
wire   [11:0] zext_ln55_68_fu_241_p1;
wire   [11:0] zext_ln55_fu_229_p1;
wire   [11:0] sub_ln55_fu_245_p2;
wire   [1:0] add_ln47_fu_267_p2;
wire   [12:0] zext_ln55_70_fu_295_p1;
wire   [12:0] add_ln55_fu_299_p2;
wire   [14:0] tmp_69_fu_308_p3;
wire   [59:0] sext_ln55_6_fu_316_p1;
wire   [59:0] sext_ln55_fu_304_p1;
wire   [0:0] icmp_ln49_fu_332_p2;
wire   [0:0] xor_ln47_fu_326_p2;
wire   [1:0] select_ln47_fu_279_p3;
wire   [0:0] and_ln47_fu_338_p2;
wire   [0:0] or_ln48_fu_350_p2;
wire   [1:0] add_ln48_fu_344_p2;
wire   [59:0] sub_ln55_17_fu_320_p2;
wire   [59:0] zext_ln55_73_fu_372_p1;
wire   [59:0] add_ln55_28_fu_376_p2;
wire   [3:0] lshr_ln_fu_386_p4;
wire   [3:0] tmp_s_fu_425_p3;
wire   [4:0] zext_ln55_71_fu_432_p1;
wire   [4:0] zext_ln55_69_fu_422_p1;
wire   [4:0] sub_ln55_18_fu_436_p2;
wire   [5:0] sext_ln48_fu_442_p1;
wire   [5:0] zext_ln55_72_fu_446_p1;
wire   [3:0] trunc_ln55_fu_455_p1;
wire   [9:0] tmp_191_cast_fu_459_p3;
wire   [9:0] zext_ln55_74_fu_467_p1;
wire   [15:0] trunc_ln55_5_fu_480_p1;
wire   [5:0] or_ln49_fu_489_p2;
wire   [11:0] tmp_70_fu_494_p3;
wire   [15:0] tmp_101_i_i_fu_506_p4;
wire   [5:0] or_ln49_3_fu_541_p2;
wire   [11:0] tmp_71_fu_546_p3;
wire   [5:0] or_ln49_4_fu_562_p2;
wire   [11:0] tmp_72_fu_567_p3;
wire    ap_CS_fsm_state7;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
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
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ii_reg_185 <= select_ln47_8_reg_602;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_185 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        indvar_flatten13_reg_174 <= add_ln47_8_reg_588;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_174 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        indvar_flatten_reg_196 <= select_ln48_16_reg_643;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_196 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_207 <= select_ln48_15_reg_615;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_207 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        kk_0_i_i_reg_218 <= add_ln49_reg_638;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_0_i_i_reg_218 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln47_8_reg_588 <= add_ln47_8_fu_255_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_261_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln48_8_reg_633 <= add_ln48_8_fu_405_p2;
        empty_149_reg_621 <= empty_149_fu_382_p1;
        icmp_ln48_reg_597 <= icmp_ln48_fu_273_p2;
        select_ln48_reg_609 <= select_ln48_fu_356_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add_ln49_reg_638 <= add_ln49_fu_411_p2;
        select_ln48_16_reg_643 <= select_ln48_16_fu_416_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln55_29_reg_648 <= add_ln55_29_fu_449_p2;
        add_ln55_30_reg_655 <= add_ln55_30_fu_470_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_149_reg_621_pp0_iter1_reg <= empty_149_reg_621;
        icmp_ln47_reg_593 <= icmp_ln47_fu_261_p2;
        icmp_ln47_reg_593_pp0_iter1_reg <= icmp_ln47_reg_593;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_261_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln47_8_reg_602 <= select_ln47_8_fu_287_p3;
        select_ln48_15_reg_615 <= select_ln48_15_fu_364_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln47_reg_583 <= sext_ln47_fu_251_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_593_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        tmp_102_i_i_reg_660 <= {{filter_data_q0[47:32]}};
        tmp_103_i_i_reg_665 <= {{filter_data_q0[63:48]}};
    end
end

always @ (*) begin
    if ((icmp_ln47_fu_261_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_ii_phi_fu_189_p4 = select_ln47_8_reg_602;
    end else begin
        ap_phi_mux_ii_phi_fu_189_p4 = ii_reg_185;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_indvar_flatten13_phi_fu_178_p4 = add_ln47_8_reg_588;
    end else begin
        ap_phi_mux_indvar_flatten13_phi_fu_178_p4 = indvar_flatten13_reg_174;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_indvar_flatten_phi_fu_200_p4 = select_ln48_16_reg_643;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_200_p4 = indvar_flatten_reg_196;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_211_p4 = select_ln48_15_reg_615;
    end else begin
        ap_phi_mux_jj_phi_fu_211_p4 = jj_reg_207;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_593 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_kk_0_i_i_phi_fu_222_p4 = add_ln49_reg_638;
    end else begin
        ap_phi_mux_kk_0_i_i_phi_fu_222_p4 = kk_0_i_i_reg_218;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        filter_data_ce0 = 1'b1;
    end else begin
        filter_data_ce0 = 1'b0;
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
    if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_23_read = 1'b1;
    end else begin
        indices_23_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        weight_vecs_0_address0 = sext_ln55_9_fu_574_p1;
    end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_address0 = sext_ln55_7_fu_501_p1;
    end else begin
        weight_vecs_0_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        weight_vecs_0_address1 = sext_ln55_8_fu_553_p1;
    end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_address1 = zext_ln55_75_fu_476_p1;
    end else begin
        weight_vecs_0_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        weight_vecs_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        weight_vecs_0_ce1 = 1'b1;
    end else begin
        weight_vecs_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        weight_vecs_0_d0 = bitcast_ln55_6_fu_579_p1;
    end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_d0 = bitcast_ln55_4_fu_516_p1;
    end else begin
        weight_vecs_0_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        weight_vecs_0_d1 = bitcast_ln55_5_fu_558_p1;
    end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_d1 = bitcast_ln55_fu_484_p1;
    end else begin
        weight_vecs_0_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln47_reg_593_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln47_reg_593_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        weight_vecs_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln47_reg_593_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln47_reg_593_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        weight_vecs_0_we1 = 1'b1;
    end else begin
        weight_vecs_0_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((icmp_ln47_fu_261_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if ((((icmp_ln47_fu_261_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln47_8_fu_255_p2 = (ap_phi_mux_indvar_flatten13_phi_fu_178_p4 + 8'd1);

assign add_ln47_fu_267_p2 = (ap_phi_mux_ii_phi_fu_189_p4 + 2'd1);

assign add_ln48_8_fu_405_p2 = (ap_phi_mux_indvar_flatten_phi_fu_200_p4 + 7'd1);

assign add_ln48_fu_344_p2 = (select_ln47_fu_279_p3 + 2'd1);

assign add_ln49_fu_411_p2 = (select_ln48_reg_609 + 7'd4);

assign add_ln55_28_fu_376_p2 = (sub_ln55_17_fu_320_p2 + zext_ln55_73_fu_372_p1);

assign add_ln55_29_fu_449_p2 = ((sext_ln48_fu_442_p1) + (zext_ln55_72_fu_446_p1));

assign add_ln55_30_fu_470_p2 = (tmp_191_cast_fu_459_p3 + zext_ln55_74_fu_467_p1);

assign add_ln55_fu_299_p2 = ((sext_ln47_reg_583) + (zext_ln55_70_fu_295_p1));

assign and_ln47_fu_338_p2 = (xor_ln47_fu_326_p2 & icmp_ln49_fu_332_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln55_4_fu_516_p1 = tmp_101_i_i_fu_506_p4;

assign bitcast_ln55_5_fu_558_p1 = tmp_102_i_i_reg_660;

assign bitcast_ln55_6_fu_579_p1 = tmp_103_i_i_reg_665;

assign bitcast_ln55_fu_484_p1 = trunc_ln55_5_fu_480_p1;

assign empty_149_fu_382_p1 = select_ln48_fu_356_p3[5:0];

assign filter_data_address0 = tmp_19_fu_396_p3;

assign icmp_ln47_fu_261_p2 = ((ap_phi_mux_indvar_flatten13_phi_fu_178_p4 == 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_273_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_200_p4 == 7'd48) ? 1'b1 : 1'b0);

assign icmp_ln49_fu_332_p2 = ((ap_phi_mux_kk_0_i_i_phi_fu_222_p4 == 7'd64) ? 1'b1 : 1'b0);

assign lshr_ln_fu_386_p4 = {{select_ln48_fu_356_p3[5:2]}};

assign or_ln48_fu_350_p2 = (icmp_ln48_fu_273_p2 | and_ln47_fu_338_p2);

assign or_ln49_3_fu_541_p2 = (empty_149_reg_621_pp0_iter1_reg | 6'd2);

assign or_ln49_4_fu_562_p2 = (empty_149_reg_621_pp0_iter1_reg | 6'd3);

assign or_ln49_fu_489_p2 = (empty_149_reg_621_pp0_iter1_reg | 6'd1);

assign select_ln47_8_fu_287_p3 = ((icmp_ln48_fu_273_p2[0:0] == 1'b1) ? add_ln47_fu_267_p2 : ap_phi_mux_ii_phi_fu_189_p4);

assign select_ln47_fu_279_p3 = ((icmp_ln48_fu_273_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_211_p4);

assign select_ln48_15_fu_364_p3 = ((and_ln47_fu_338_p2[0:0] == 1'b1) ? add_ln48_fu_344_p2 : select_ln47_fu_279_p3);

assign select_ln48_16_fu_416_p3 = ((icmp_ln48_reg_597[0:0] == 1'b1) ? 7'd1 : add_ln48_8_reg_633);

assign select_ln48_fu_356_p3 = ((or_ln48_fu_350_p2[0:0] == 1'b1) ? 7'd0 : ap_phi_mux_kk_0_i_i_phi_fu_222_p4);

assign sext_ln47_fu_251_p1 = (sub_ln55_fu_245_p2);

assign sext_ln48_fu_442_p1 = (sub_ln55_18_fu_436_p2);

assign sext_ln55_6_fu_316_p1 = (tmp_69_fu_308_p3);

assign sext_ln55_7_fu_501_p1 = (tmp_70_fu_494_p3);

assign sext_ln55_8_fu_553_p1 = (tmp_71_fu_546_p3);

assign sext_ln55_9_fu_574_p1 = (tmp_72_fu_567_p3);

assign sext_ln55_fu_304_p1 = add_ln55_fu_299_p2;

assign sub_ln55_17_fu_320_p2 = ((sext_ln55_6_fu_316_p1) - (sext_ln55_fu_304_p1));

assign sub_ln55_18_fu_436_p2 = (zext_ln55_71_fu_432_p1 - zext_ln55_69_fu_422_p1);

assign sub_ln55_fu_245_p2 = (zext_ln55_68_fu_241_p1 - zext_ln55_fu_229_p1);

assign tmp_101_i_i_fu_506_p4 = {{filter_data_q0[31:16]}};

assign tmp_191_cast_fu_459_p3 = {{trunc_ln55_fu_455_p1}, {6'd0}};

assign tmp_19_fu_396_p3 = {{add_ln55_28_fu_376_p2}, {lshr_ln_fu_386_p4}};

assign tmp_69_fu_308_p3 = {{add_ln55_fu_299_p2}, {2'd0}};

assign tmp_70_fu_494_p3 = {{add_ln55_29_reg_648}, {or_ln49_fu_489_p2}};

assign tmp_71_fu_546_p3 = {{add_ln55_29_reg_648}, {or_ln49_3_fu_541_p2}};

assign tmp_72_fu_567_p3 = {{add_ln55_29_reg_648}, {or_ln49_4_fu_562_p2}};

assign tmp_fu_233_p3 = {{indices_23_dout}, {2'd0}};

assign tmp_s_fu_425_p3 = {{select_ln47_8_reg_602}, {2'd0}};

assign trunc_ln55_5_fu_480_p1 = filter_data_q0[15:0];

assign trunc_ln55_fu_455_p1 = add_ln55_29_fu_449_p2[3:0];

assign xor_ln47_fu_326_p2 = (icmp_ln48_fu_273_p2 ^ 1'd1);

assign zext_ln55_68_fu_241_p1 = tmp_fu_233_p3;

assign zext_ln55_69_fu_422_p1 = select_ln47_8_reg_602;

assign zext_ln55_70_fu_295_p1 = select_ln47_8_fu_287_p3;

assign zext_ln55_71_fu_432_p1 = tmp_s_fu_425_p3;

assign zext_ln55_72_fu_446_p1 = select_ln48_15_reg_615;

assign zext_ln55_73_fu_372_p1 = select_ln48_15_fu_364_p3;

assign zext_ln55_74_fu_467_p1 = select_ln48_reg_609;

assign zext_ln55_75_fu_476_p1 = add_ln55_30_reg_655;

assign zext_ln55_fu_229_p1 = indices_23_dout;

endmodule //td_fused_top_tdf10_readFilters68
