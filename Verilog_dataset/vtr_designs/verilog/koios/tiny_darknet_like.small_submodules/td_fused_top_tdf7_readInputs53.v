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

module td_fused_top_tdf7_readInputs53 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        in_data_address0,
        in_data_ce0,
        in_data_q0,
        indices_01_dout,
        indices_01_empty_n,
        indices_01_read,
        indices_12_dout,
        indices_12_empty_n,
        indices_12_read,
        ifmap_vec_address0,
        ifmap_vec_ce0,
        ifmap_vec_we0,
        ifmap_vec_d0,
        ifmap_vec_address1,
        ifmap_vec_ce1,
        ifmap_vec_we1,
        ifmap_vec_d1,
        indices_01_out_din,
        indices_01_out_full_n,
        indices_01_out_write,
        indices_12_out_din,
        indices_12_out_full_n,
        indices_12_out_write
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_pp0_stage0 = 5'd4;
parameter    ap_ST_fsm_pp0_stage1 = 5'd8;
parameter    ap_ST_fsm_state9 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [12:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [15:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
output  [8:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
output   ifmap_vec_we0;
output  [15:0] ifmap_vec_d0;
output  [8:0] ifmap_vec_address1;
output   ifmap_vec_ce1;
output   ifmap_vec_we1;
output  [15:0] ifmap_vec_d1;
output  [4:0] indices_01_out_din;
input   indices_01_out_full_n;
output   indices_01_out_write;
output  [9:0] indices_12_out_din;
input   indices_12_out_full_n;
output   indices_12_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg indices_01_read;
reg indices_12_read;
reg[8:0] ifmap_vec_address0;
reg ifmap_vec_ce0;
reg ifmap_vec_we0;
reg[15:0] ifmap_vec_d0;
reg[8:0] ifmap_vec_address1;
reg ifmap_vec_ce1;
reg ifmap_vec_we1;
reg[15:0] ifmap_vec_d1;
reg indices_01_out_write;
reg indices_12_out_write;

reg    ap_done_reg;
  reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    indices_01_out_blk_n;
reg    indices_12_out_blk_n;
reg   [6:0] indvar_flatten47_reg_222;
reg   [1:0] ii_reg_234;
reg   [5:0] indvar_flatten_reg_246;
reg   [1:0] jj_reg_257;
reg   [5:0] kk_0_i_i_reg_269;
reg   [15:0] indices_01_read_reg_957;
wire   [4:0] trunc_ln250_fu_280_p1;
reg   [4:0] trunc_ln250_reg_962;
reg   [15:0] indices_12_read_reg_967;
wire   [9:0] empty_fu_285_p1;
reg   [9:0] empty_reg_972;
wire   [17:0] p_cast_i_i_fu_302_p1;
reg   [17:0] p_cast_i_i_reg_979;
wire    ap_CS_fsm_state2;
wire   [17:0] sext_ln22_fu_312_p1;
reg   [17:0] sext_ln22_reg_985;
wire   [4:0] p_cast_fu_316_p2;
reg   [4:0] p_cast_reg_991;
wire   [0:0] or_ln23_6_fu_335_p2;
reg   [0:0] or_ln23_6_reg_997;
wire   [9:0] p_mid137_fu_341_p2;
reg   [9:0] p_mid137_reg_1002;
wire   [4:0] p_cast5_i_i_fu_359_p2;
reg   [4:0] p_cast5_i_i_reg_1007;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_state7_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] is_padding_fu_399_p2;
reg   [0:0] is_padding_reg_1013;
wire   [0:0] icmp_ln19_fu_405_p2;
reg   [0:0] icmp_ln19_reg_1020;
reg   [0:0] icmp_ln19_reg_1020_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_1020_pp0_iter2_reg;
wire   [1:0] add_ln19_fu_411_p2;
reg   [1:0] add_ln19_reg_1024;
wire   [0:0] icmp_ln20_fu_417_p2;
reg   [0:0] icmp_ln20_reg_1029;
wire   [1:0] select_ln19_fu_423_p3;
reg   [1:0] select_ln19_reg_1041;
wire   [4:0] p_cast5_i_i_mid1_fu_444_p2;
reg   [4:0] p_cast5_i_i_mid1_reg_1046;
wire   [0:0] or_ln23_8_fu_463_p2;
reg   [0:0] or_ln23_8_reg_1052;
wire   [1:0] add_ln20_fu_468_p2;
reg   [1:0] add_ln20_reg_1059;
wire   [0:0] or_ln23_10_fu_503_p2;
reg   [0:0] or_ln23_10_reg_1065;
wire   [5:0] add_ln20_2_fu_509_p2;
reg   [5:0] add_ln20_2_reg_1072;
wire   [6:0] add_ln19_2_fu_515_p2;
reg   [6:0] add_ln19_2_reg_1077;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state4_pp0_stage1_iter0;
wire    ap_block_state6_pp0_stage1_iter1;
wire    ap_block_state8_pp0_stage1_iter2;
wire    ap_block_pp0_stage1_11001;
wire   [1:0] select_ln19_7_fu_553_p3;
reg   [1:0] select_ln19_7_reg_1082;
wire   [5:0] select_ln20_fu_617_p3;
reg   [5:0] select_ln20_reg_1089;
wire   [1:0] select_ln20_6_fu_625_p3;
reg   [1:0] select_ln20_6_reg_1095;
wire   [0:0] select_ln20_7_fu_634_p3;
reg   [0:0] select_ln20_7_reg_1101;
reg   [0:0] select_ln20_7_reg_1101_pp0_iter1_reg;
wire   [4:0] empty_73_fu_730_p1;
reg   [4:0] empty_73_reg_1109;
reg   [4:0] empty_73_reg_1109_pp0_iter1_reg;
wire   [5:0] select_ln20_10_fu_757_p3;
reg   [5:0] select_ln20_10_reg_1121;
wire   [5:0] add_ln25_fu_763_p2;
reg   [5:0] add_ln25_reg_1126;
reg    ap_enable_reg_pp0_iter1;
wire   [5:0] add_ln33_fu_795_p2;
reg   [5:0] add_ln33_reg_1131;
wire   [8:0] add_ln33_2_fu_816_p2;
reg   [8:0] add_ln33_2_reg_1138;
wire   [15:0] select_ln33_8_fu_895_p3;
reg   [15:0] select_ln33_8_reg_1143;
wire   [15:0] select_ln33_9_fu_916_p3;
reg   [15:0] select_ln33_9_reg_1148;
wire    ap_block_pp0_stage1_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
reg    ap_enable_reg_pp0_iter2;
reg   [6:0] ap_phi_mux_indvar_flatten47_phi_fu_226_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_238_p4;
reg   [5:0] ap_phi_mux_indvar_flatten_phi_fu_250_p4;
reg   [1:0] ap_phi_mux_jj_phi_fu_261_p4;
reg   [5:0] ap_phi_mux_kk_0_i_i_phi_fu_273_p4;
wire    ap_block_pp0_stage1;
wire   [63:0] sext_ln32_fu_752_p1;
wire   [63:0] zext_ln33_9_fu_822_p1;
wire   [63:0] sext_ln33_fu_854_p1;
wire   [63:0] sext_ln33_3_fu_935_p1;
wire   [63:0] sext_ln33_4_fu_952_p1;
reg    ap_block_state1;
wire   [15:0] select_ln33_fu_834_p3;
wire   [15:0] select_ln33_7_fu_873_p3;
wire   [16:0] zext_ln19_fu_293_p1;
wire   [16:0] empty_68_fu_296_p2;
wire   [16:0] j_cast_i_i_fu_290_p1;
wire   [16:0] add_ln22_fu_306_p2;
wire   [0:0] tmp_9_fu_321_p3;
wire   [0:0] icmp_ln24_fu_329_p2;
wire   [17:0] ii_cast_i_i_fu_346_p1;
wire   [4:0] ii_cast_fu_350_p1;
wire   [17:0] empty_69_fu_354_p2;
wire   [17:0] zext_ln20_fu_370_p1;
wire   [17:0] add_ln22_2_fu_374_p2;
wire   [0:0] tmp_10_fu_379_p3;
wire   [0:0] icmp_ln24_2_fu_387_p2;
wire   [0:0] or_ln23_fu_393_p2;
wire   [0:0] empty_70_fu_364_p2;
wire   [17:0] ii_cast_i_i_mid1_fu_431_p1;
wire   [4:0] ii_cast_mid1_fu_435_p1;
wire   [17:0] p_mid111_fu_439_p2;
wire   [0:0] p_mid113_fu_449_p2;
wire   [17:0] zext_ln20_2_fu_474_p1;
wire   [17:0] add_ln22_3_fu_478_p2;
wire   [0:0] tmp_11_fu_483_p3;
wire   [0:0] icmp_ln24_3_fu_491_p2;
wire   [0:0] or_ln23_9_fu_497_p2;
wire   [0:0] select_ln19_9_fu_455_p3;
wire   [2:0] zext_ln22_fu_521_p1;
wire   [2:0] tmp1_fu_531_p2;
wire   [9:0] tmp1_cast_fu_537_p1;
wire   [9:0] empty_71_fu_541_p2;
wire   [4:0] row_coord_int_mid131_fu_569_p3;
wire   [4:0] row_coord_int_fu_525_p3;
wire   [9:0] col_coord_int_mid139_fu_575_p3;
wire   [9:0] col_coord_int_fu_546_p3;
wire   [0:0] icmp_ln25_fu_600_p2;
wire   [0:0] xor_ln19_fu_595_p2;
wire   [0:0] and_ln19_fu_606_p2;
wire   [0:0] or_ln20_fu_612_p2;
wire   [0:0] select_ln19_10_fu_564_p3;
wire   [4:0] select_ln19_8_fu_559_p3;
wire   [2:0] zext_ln22_2_fu_631_p1;
wire   [2:0] tmp1_mid1_fu_648_p2;
wire   [9:0] tmp1_cast_mid1_fu_654_p1;
wire   [9:0] p_mid1_fu_658_p2;
wire   [4:0] row_coord_int_mid1_fu_641_p3;
wire   [4:0] select_ln19_11_fu_581_p3;
wire   [4:0] select_ln20_8_fu_670_p3;
wire   [9:0] tmp_s_fu_678_p3;
wire   [6:0] tmp_3_fu_690_p3;
wire   [10:0] zext_ln32_fu_686_p1;
wire   [10:0] zext_ln32_9_fu_698_p1;
wire   [10:0] sub_ln32_fu_702_p2;
wire   [9:0] col_coord_int_mid1_fu_663_p3;
wire   [9:0] select_ln19_12_fu_588_p3;
wire   [9:0] select_ln20_9_fu_712_p3;
wire   [11:0] sext_ln20_fu_708_p1;
wire   [11:0] zext_ln32_10_fu_720_p1;
wire   [11:0] add_ln32_fu_724_p2;
wire   [2:0] lshr_ln_fu_734_p4;
wire   [14:0] tmp_12_fu_744_p3;
wire   [3:0] tmp_fu_771_p3;
wire   [4:0] zext_ln33_6_fu_778_p1;
wire   [4:0] zext_ln33_fu_768_p1;
wire   [4:0] sub_ln33_fu_782_p2;
wire   [5:0] sub_ln33_cast_fu_788_p1;
wire   [5:0] zext_ln33_7_fu_792_p1;
wire   [3:0] trunc_ln33_fu_801_p1;
wire   [8:0] tmp_30_cast_fu_805_p3;
wire   [8:0] zext_ln33_8_fu_813_p1;
wire   [15:0] trunc_ln32_fu_826_p1;
wire   [15:0] bitcast_ln32_fu_830_p1;
wire   [4:0] or_ln25_fu_842_p2;
wire   [10:0] tmp_13_fu_847_p3;
wire   [15:0] tmp_17_i_i_fu_859_p4;
wire   [15:0] bitcast_ln32_7_fu_869_p1;
wire   [15:0] tmp_18_i_i_fu_881_p4;
wire   [15:0] bitcast_ln32_8_fu_891_p1;
wire   [15:0] tmp_19_i_i_fu_902_p4;
wire   [15:0] bitcast_ln32_9_fu_912_p1;
wire   [4:0] or_ln25_5_fu_923_p2;
wire   [10:0] tmp_14_fu_928_p3;
wire   [4:0] or_ln25_6_fu_940_p2;
wire   [10:0] tmp_15_fu_945_p3;
wire    ap_CS_fsm_state9;
reg   [4:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
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
        end else if ((1'b1 == ap_CS_fsm_state9)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state4) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state4)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state4);
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
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_234 <= select_ln19_7_reg_1082;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        ii_reg_234 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten47_reg_222 <= add_ln19_2_reg_1077;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten47_reg_222 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten_reg_246 <= select_ln20_10_reg_1121;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten_reg_246 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_257 <= select_ln20_6_reg_1095;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        jj_reg_257 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        kk_0_i_i_reg_269 <= add_ln25_reg_1126;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        kk_0_i_i_reg_269 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        add_ln19_2_reg_1077 <= add_ln19_2_fu_515_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_405_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln19_reg_1024 <= add_ln19_fu_411_p2;
        add_ln20_2_reg_1072 <= add_ln20_2_fu_509_p2;
        add_ln20_reg_1059 <= add_ln20_fu_468_p2;
        icmp_ln20_reg_1029 <= icmp_ln20_fu_417_p2;
        or_ln23_10_reg_1065 <= or_ln23_10_fu_503_p2;
        or_ln23_8_reg_1052 <= or_ln23_8_fu_463_p2;
        p_cast5_i_i_mid1_reg_1046 <= p_cast5_i_i_mid1_fu_444_p2;
        select_ln19_reg_1041 <= select_ln19_fu_423_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln25_reg_1126 <= add_ln25_fu_763_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1020_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        add_ln33_2_reg_1138 <= add_ln33_2_fu_816_p2;
        add_ln33_reg_1131 <= add_ln33_fu_795_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        empty_73_reg_1109 <= empty_73_fu_730_p1;
        select_ln20_7_reg_1101 <= select_ln20_7_fu_634_p3;
        select_ln20_reg_1089 <= select_ln20_fu_617_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        empty_73_reg_1109_pp0_iter1_reg <= empty_73_reg_1109;
        select_ln20_7_reg_1101_pp0_iter1_reg <= select_ln20_7_reg_1101;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        empty_reg_972 <= empty_fu_285_p1;
        indices_01_read_reg_957 <= indices_01_dout;
        indices_12_read_reg_967 <= indices_12_dout;
        trunc_ln250_reg_962 <= trunc_ln250_fu_280_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln19_reg_1020 <= icmp_ln19_fu_405_p2;
        icmp_ln19_reg_1020_pp0_iter1_reg <= icmp_ln19_reg_1020;
        icmp_ln19_reg_1020_pp0_iter2_reg <= icmp_ln19_reg_1020_pp0_iter1_reg;
        is_padding_reg_1013 <= is_padding_fu_399_p2;
        p_cast5_i_i_reg_1007 <= p_cast5_i_i_fu_359_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        or_ln23_6_reg_997 <= or_ln23_6_fu_335_p2;
        p_cast_i_i_reg_979 <= p_cast_i_i_fu_302_p1;
        p_cast_reg_991 <= p_cast_fu_316_p2;
        p_mid137_reg_1002 <= p_mid137_fu_341_p2;
        sext_ln22_reg_985 <= sext_ln22_fu_312_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001))) begin
        select_ln19_7_reg_1082 <= select_ln19_7_fu_553_p3;
        select_ln20_10_reg_1121 <= select_ln20_10_fu_757_p3;
        select_ln20_6_reg_1095 <= select_ln20_6_fu_625_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_1020_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln33_8_reg_1143 <= select_ln33_8_fu_895_p3;
        select_ln33_9_reg_1148 <= select_ln33_9_fu_916_p3;
    end
end

always @ (*) begin
    if ((icmp_ln19_reg_1020 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_238_p4 = select_ln19_7_reg_1082;
    end else begin
        ap_phi_mux_ii_phi_fu_238_p4 = ii_reg_234;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten47_phi_fu_226_p4 = add_ln19_2_reg_1077;
    end else begin
        ap_phi_mux_indvar_flatten47_phi_fu_226_p4 = indvar_flatten47_reg_222;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten_phi_fu_250_p4 = select_ln20_10_reg_1121;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_250_p4 = indvar_flatten_reg_246;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_261_p4 = select_ln20_6_reg_1095;
    end else begin
        ap_phi_mux_jj_phi_fu_261_p4 = jj_reg_257;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln19_reg_1020_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1))) begin
        ap_phi_mux_kk_0_i_i_phi_fu_273_p4 = add_ln25_reg_1126;
    end else begin
        ap_phi_mux_kk_0_i_i_phi_fu_273_p4 = kk_0_i_i_reg_269;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            ifmap_vec_address0 = sext_ln33_4_fu_952_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_address0 = sext_ln33_fu_854_p1;
        end else begin
            ifmap_vec_address0 = 'bx;
        end
    end else begin
        ifmap_vec_address0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            ifmap_vec_address1 = sext_ln33_3_fu_935_p1;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_address1 = zext_ln33_9_fu_822_p1;
        end else begin
            ifmap_vec_address1 = 'bx;
        end
    end else begin
        ifmap_vec_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ifmap_vec_ce0 = 1'b1;
    end else begin
        ifmap_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ifmap_vec_ce1 = 1'b1;
    end else begin
        ifmap_vec_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            ifmap_vec_d0 = select_ln33_9_reg_1148;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_d0 = select_ln33_7_fu_873_p3;
        end else begin
            ifmap_vec_d0 = 'bx;
        end
    end else begin
        ifmap_vec_d0 = 'bx;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage1) & (1'b0 == ap_block_pp0_stage1))) begin
            ifmap_vec_d1 = select_ln33_8_reg_1143;
        end else if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
            ifmap_vec_d1 = select_ln33_fu_834_p3;
        end else begin
            ifmap_vec_d1 = 'bx;
        end
    end else begin
        ifmap_vec_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1020_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_1020_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ifmap_vec_we0 = 1'b1;
    end else begin
        ifmap_vec_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln19_reg_1020_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_1020_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ifmap_vec_we1 = 1'b1;
    end else begin
        ifmap_vec_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        in_data_ce0 = 1'b1;
    end else begin
        in_data_ce0 = 1'b0;
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
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_out_blk_n = indices_01_out_full_n;
    end else begin
        indices_01_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_out_write = 1'b1;
    end else begin
        indices_01_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_out_blk_n = indices_12_out_full_n;
    end else begin
        indices_12_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_out_write = 1'b1;
    end else begin
        indices_12_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_read = 1'b1;
    end else begin
        indices_12_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln19_reg_1020 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage1_subdone)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage1_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln19_reg_1020 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln19_2_fu_515_p2 = (indvar_flatten47_reg_222 + 7'd1);

assign add_ln19_fu_411_p2 = (ap_phi_mux_ii_phi_fu_238_p4 + 2'd1);

assign add_ln20_2_fu_509_p2 = (ap_phi_mux_indvar_flatten_phi_fu_250_p4 + 6'd1);

assign add_ln20_fu_468_p2 = (select_ln19_fu_423_p3 + 2'd1);

assign add_ln22_2_fu_374_p2 = ((sext_ln22_reg_985) + (zext_ln20_fu_370_p1));

assign add_ln22_3_fu_478_p2 = ((sext_ln22_reg_985) + (zext_ln20_2_fu_474_p1));

assign add_ln22_fu_306_p2 = ((j_cast_i_i_fu_290_p1) + (17'd131071));

assign add_ln25_fu_763_p2 = (select_ln20_reg_1089 + 6'd4);

assign add_ln32_fu_724_p2 = ((sext_ln20_fu_708_p1) + (zext_ln32_10_fu_720_p1));

assign add_ln33_2_fu_816_p2 = (tmp_30_cast_fu_805_p3 + zext_ln33_8_fu_813_p1);

assign add_ln33_fu_795_p2 = ((sub_ln33_cast_fu_788_p1) + (zext_ln33_7_fu_792_p1));

assign and_ln19_fu_606_p2 = (xor_ln19_fu_595_p2 & icmp_ln25_fu_600_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage1_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln32_7_fu_869_p1 = tmp_17_i_i_fu_859_p4;

assign bitcast_ln32_8_fu_891_p1 = tmp_18_i_i_fu_881_p4;

assign bitcast_ln32_9_fu_912_p1 = tmp_19_i_i_fu_902_p4;

assign bitcast_ln32_fu_830_p1 = trunc_ln32_fu_826_p1;

assign col_coord_int_fu_546_p3 = ((is_padding_reg_1013[0:0] == 1'b1) ? 10'd0 : empty_71_fu_541_p2);

assign col_coord_int_mid139_fu_575_p3 = ((or_ln23_8_reg_1052[0:0] == 1'b1) ? 10'd0 : p_mid137_reg_1002);

assign col_coord_int_mid1_fu_663_p3 = ((or_ln23_10_reg_1065[0:0] == 1'b1) ? 10'd0 : p_mid1_fu_658_p2);

assign empty_68_fu_296_p2 = ((zext_ln19_fu_293_p1) + (17'd131071));

assign empty_69_fu_354_p2 = ((p_cast_i_i_reg_979) + (ii_cast_i_i_fu_346_p1));

assign empty_70_fu_364_p2 = ((empty_69_fu_354_p2 > 18'd27) ? 1'b1 : 1'b0);

assign empty_71_fu_541_p2 = ((tmp1_cast_fu_537_p1) + (empty_reg_972));

assign empty_73_fu_730_p1 = select_ln20_fu_617_p3[4:0];

assign empty_fu_285_p1 = indices_12_dout[9:0];

assign icmp_ln19_fu_405_p2 = ((ap_phi_mux_indvar_flatten47_phi_fu_226_p4 == 7'd72) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_417_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_250_p4 == 6'd24) ? 1'b1 : 1'b0);

assign icmp_ln24_2_fu_387_p2 = (((add_ln22_2_fu_374_p2) > (18'd27)) ? 1'b1 : 1'b0);

assign icmp_ln24_3_fu_491_p2 = (((add_ln22_3_fu_478_p2) > (18'd27)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_329_p2 = (((add_ln22_fu_306_p2) > (17'd27)) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_600_p2 = ((ap_phi_mux_kk_0_i_i_phi_fu_273_p4 == 6'd32) ? 1'b1 : 1'b0);

assign ii_cast_fu_350_p1 = ap_phi_mux_ii_phi_fu_238_p4;

assign ii_cast_i_i_fu_346_p1 = ap_phi_mux_ii_phi_fu_238_p4;

assign ii_cast_i_i_mid1_fu_431_p1 = add_ln19_fu_411_p2;

assign ii_cast_mid1_fu_435_p1 = add_ln19_fu_411_p2;

assign in_data_address0 = sext_ln32_fu_752_p1;

assign indices_01_out_din = indices_01_dout[4:0];

assign indices_12_out_din = indices_12_dout[9:0];

assign is_padding_fu_399_p2 = (or_ln23_fu_393_p2 | empty_70_fu_364_p2);

assign j_cast_i_i_fu_290_p1 = indices_12_read_reg_967;

assign lshr_ln_fu_734_p4 = {{select_ln20_fu_617_p3[4:2]}};

assign or_ln20_fu_612_p2 = (icmp_ln20_reg_1029 | and_ln19_fu_606_p2);

assign or_ln23_10_fu_503_p2 = (select_ln19_9_fu_455_p3 | or_ln23_9_fu_497_p2);

assign or_ln23_6_fu_335_p2 = (tmp_9_fu_321_p3 | icmp_ln24_fu_329_p2);

assign or_ln23_8_fu_463_p2 = (p_mid113_fu_449_p2 | or_ln23_6_reg_997);

assign or_ln23_9_fu_497_p2 = (tmp_11_fu_483_p3 | icmp_ln24_3_fu_491_p2);

assign or_ln23_fu_393_p2 = (tmp_10_fu_379_p3 | icmp_ln24_2_fu_387_p2);

assign or_ln25_5_fu_923_p2 = (empty_73_reg_1109_pp0_iter1_reg | 5'd2);

assign or_ln25_6_fu_940_p2 = (empty_73_reg_1109_pp0_iter1_reg | 5'd3);

assign or_ln25_fu_842_p2 = (empty_73_reg_1109_pp0_iter1_reg | 5'd1);

assign p_cast5_i_i_fu_359_p2 = (p_cast_reg_991 + ii_cast_fu_350_p1);

assign p_cast5_i_i_mid1_fu_444_p2 = (p_cast_reg_991 + ii_cast_mid1_fu_435_p1);

assign p_cast_fu_316_p2 = ((trunc_ln250_reg_962) + (5'd31));

assign p_cast_i_i_fu_302_p1 = (empty_68_fu_296_p2);

assign p_mid111_fu_439_p2 = ((p_cast_i_i_reg_979) + (ii_cast_i_i_mid1_fu_431_p1));

assign p_mid113_fu_449_p2 = ((p_mid111_fu_439_p2 > 18'd27) ? 1'b1 : 1'b0);

assign p_mid137_fu_341_p2 = ((empty_reg_972) + (10'd1023));

assign p_mid1_fu_658_p2 = ((tmp1_cast_mid1_fu_654_p1) + (empty_reg_972));

assign row_coord_int_fu_525_p3 = ((is_padding_reg_1013[0:0] == 1'b1) ? 5'd0 : p_cast5_i_i_reg_1007);

assign row_coord_int_mid131_fu_569_p3 = ((or_ln23_8_reg_1052[0:0] == 1'b1) ? 5'd0 : p_cast5_i_i_mid1_reg_1046);

assign row_coord_int_mid1_fu_641_p3 = ((or_ln23_10_reg_1065[0:0] == 1'b1) ? 5'd0 : select_ln19_8_fu_559_p3);

assign select_ln19_10_fu_564_p3 = ((icmp_ln20_reg_1029[0:0] == 1'b1) ? or_ln23_8_reg_1052 : is_padding_reg_1013);

assign select_ln19_11_fu_581_p3 = ((icmp_ln20_reg_1029[0:0] == 1'b1) ? row_coord_int_mid131_fu_569_p3 : row_coord_int_fu_525_p3);

assign select_ln19_12_fu_588_p3 = ((icmp_ln20_reg_1029[0:0] == 1'b1) ? col_coord_int_mid139_fu_575_p3 : col_coord_int_fu_546_p3);

assign select_ln19_7_fu_553_p3 = ((icmp_ln20_reg_1029[0:0] == 1'b1) ? add_ln19_reg_1024 : ii_reg_234);

assign select_ln19_8_fu_559_p3 = ((icmp_ln20_reg_1029[0:0] == 1'b1) ? p_cast5_i_i_mid1_reg_1046 : p_cast5_i_i_reg_1007);

assign select_ln19_9_fu_455_p3 = ((icmp_ln20_fu_417_p2[0:0] == 1'b1) ? p_mid113_fu_449_p2 : empty_70_fu_364_p2);

assign select_ln19_fu_423_p3 = ((icmp_ln20_fu_417_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_261_p4);

assign select_ln20_10_fu_757_p3 = ((icmp_ln20_reg_1029[0:0] == 1'b1) ? 6'd1 : add_ln20_2_reg_1072);

assign select_ln20_6_fu_625_p3 = ((and_ln19_fu_606_p2[0:0] == 1'b1) ? add_ln20_reg_1059 : select_ln19_reg_1041);

assign select_ln20_7_fu_634_p3 = ((and_ln19_fu_606_p2[0:0] == 1'b1) ? or_ln23_10_reg_1065 : select_ln19_10_fu_564_p3);

assign select_ln20_8_fu_670_p3 = ((and_ln19_fu_606_p2[0:0] == 1'b1) ? row_coord_int_mid1_fu_641_p3 : select_ln19_11_fu_581_p3);

assign select_ln20_9_fu_712_p3 = ((and_ln19_fu_606_p2[0:0] == 1'b1) ? col_coord_int_mid1_fu_663_p3 : select_ln19_12_fu_588_p3);

assign select_ln20_fu_617_p3 = ((or_ln20_fu_612_p2[0:0] == 1'b1) ? 6'd0 : ap_phi_mux_kk_0_i_i_phi_fu_273_p4);

assign select_ln33_7_fu_873_p3 = ((select_ln20_7_reg_1101_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_7_fu_869_p1);

assign select_ln33_8_fu_895_p3 = ((select_ln20_7_reg_1101_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_8_fu_891_p1);

assign select_ln33_9_fu_916_p3 = ((select_ln20_7_reg_1101_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_9_fu_912_p1);

assign select_ln33_fu_834_p3 = ((select_ln20_7_reg_1101_pp0_iter1_reg[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_fu_830_p1);

assign sext_ln20_fu_708_p1 = (sub_ln32_fu_702_p2);

assign sext_ln22_fu_312_p1 = add_ln22_fu_306_p2;

assign sext_ln32_fu_752_p1 = (tmp_12_fu_744_p3);

assign sext_ln33_3_fu_935_p1 = (tmp_14_fu_928_p3);

assign sext_ln33_4_fu_952_p1 = (tmp_15_fu_945_p3);

assign sext_ln33_fu_854_p1 = (tmp_13_fu_847_p3);

assign sub_ln32_fu_702_p2 = (zext_ln32_fu_686_p1 - zext_ln32_9_fu_698_p1);

assign sub_ln33_cast_fu_788_p1 = (sub_ln33_fu_782_p2);

assign sub_ln33_fu_782_p2 = (zext_ln33_6_fu_778_p1 - zext_ln33_fu_768_p1);

assign tmp1_cast_fu_537_p1 = (tmp1_fu_531_p2);

assign tmp1_cast_mid1_fu_654_p1 = (tmp1_mid1_fu_648_p2);

assign tmp1_fu_531_p2 = ((zext_ln22_fu_521_p1) + (3'd7));

assign tmp1_mid1_fu_648_p2 = ((zext_ln22_2_fu_631_p1) + (3'd7));

assign tmp_10_fu_379_p3 = add_ln22_2_fu_374_p2[32'd17];

assign tmp_11_fu_483_p3 = add_ln22_3_fu_478_p2[32'd17];

assign tmp_12_fu_744_p3 = {{add_ln32_fu_724_p2}, {lshr_ln_fu_734_p4}};

assign tmp_13_fu_847_p3 = {{add_ln33_reg_1131}, {or_ln25_fu_842_p2}};

assign tmp_14_fu_928_p3 = {{add_ln33_reg_1131}, {or_ln25_5_fu_923_p2}};

assign tmp_15_fu_945_p3 = {{add_ln33_reg_1131}, {or_ln25_6_fu_940_p2}};

assign tmp_17_i_i_fu_859_p4 = {{in_data_q0[31:16]}};

assign tmp_18_i_i_fu_881_p4 = {{in_data_q0[47:32]}};

assign tmp_19_i_i_fu_902_p4 = {{in_data_q0[63:48]}};

assign tmp_30_cast_fu_805_p3 = {{trunc_ln33_fu_801_p1}, {5'd0}};

assign tmp_3_fu_690_p3 = {{select_ln20_8_fu_670_p3}, {2'd0}};

assign tmp_9_fu_321_p3 = add_ln22_fu_306_p2[32'd16];

assign tmp_fu_771_p3 = {{select_ln19_7_reg_1082}, {2'd0}};

assign tmp_s_fu_678_p3 = {{select_ln20_8_fu_670_p3}, {5'd0}};

assign trunc_ln250_fu_280_p1 = indices_01_dout[4:0];

assign trunc_ln32_fu_826_p1 = in_data_q0[15:0];

assign trunc_ln33_fu_801_p1 = add_ln33_fu_795_p2[3:0];

assign xor_ln19_fu_595_p2 = (icmp_ln20_reg_1029 ^ 1'd1);

assign zext_ln19_fu_293_p1 = indices_01_read_reg_957;

assign zext_ln20_2_fu_474_p1 = add_ln20_fu_468_p2;

assign zext_ln20_fu_370_p1 = ap_phi_mux_jj_phi_fu_261_p4;

assign zext_ln22_2_fu_631_p1 = add_ln20_reg_1059;

assign zext_ln22_fu_521_p1 = jj_reg_257;

assign zext_ln32_10_fu_720_p1 = select_ln20_9_fu_712_p3;

assign zext_ln32_9_fu_698_p1 = tmp_3_fu_690_p3;

assign zext_ln32_fu_686_p1 = tmp_s_fu_678_p3;

assign zext_ln33_6_fu_778_p1 = tmp_fu_771_p3;

assign zext_ln33_7_fu_792_p1 = select_ln20_6_reg_1095;

assign zext_ln33_8_fu_813_p1 = select_ln20_reg_1089;

assign zext_ln33_9_fu_822_p1 = add_ln33_2_reg_1138;

assign zext_ln33_fu_768_p1 = select_ln19_7_reg_1082;

endmodule //td_fused_top_tdf7_readInputs53
