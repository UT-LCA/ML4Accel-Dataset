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

module td_fused_top_tdf4_readInputs37 (
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
        ifmap_vec_0_address0,
        ifmap_vec_0_ce0,
        ifmap_vec_0_we0,
        ifmap_vec_0_d0,
        ifmap_vec_1_address0,
        ifmap_vec_1_ce0,
        ifmap_vec_1_we0,
        ifmap_vec_1_d0,
        ifmap_vec_2_address0,
        ifmap_vec_2_ce0,
        ifmap_vec_2_we0,
        ifmap_vec_2_d0,
        ifmap_vec_3_address0,
        ifmap_vec_3_ce0,
        ifmap_vec_3_we0,
        ifmap_vec_3_d0,
        indices_01_out_din,
        indices_01_out_full_n,
        indices_01_out_write,
        indices_12_out_din,
        indices_12_out_full_n,
        indices_12_out_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state7 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [13:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [15:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
output  [5:0] ifmap_vec_0_address0;
output   ifmap_vec_0_ce0;
output   ifmap_vec_0_we0;
output  [15:0] ifmap_vec_0_d0;
output  [5:0] ifmap_vec_1_address0;
output   ifmap_vec_1_ce0;
output   ifmap_vec_1_we0;
output  [15:0] ifmap_vec_1_d0;
output  [5:0] ifmap_vec_2_address0;
output   ifmap_vec_2_ce0;
output   ifmap_vec_2_we0;
output  [15:0] ifmap_vec_2_d0;
output  [5:0] ifmap_vec_3_address0;
output   ifmap_vec_3_ce0;
output   ifmap_vec_3_we0;
output  [15:0] ifmap_vec_3_d0;
output  [5:0] indices_01_out_din;
input   indices_01_out_full_n;
output   indices_01_out_write;
output  [11:0] indices_12_out_din;
input   indices_12_out_full_n;
output   indices_12_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg indices_01_read;
reg indices_12_read;
reg ifmap_vec_0_ce0;
reg ifmap_vec_0_we0;
reg ifmap_vec_1_ce0;
reg ifmap_vec_1_we0;
reg ifmap_vec_2_ce0;
reg ifmap_vec_2_we0;
reg ifmap_vec_3_ce0;
reg ifmap_vec_3_we0;
reg indices_01_out_write;
reg indices_12_out_write;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    indices_01_out_blk_n;
reg    indices_12_out_blk_n;
reg   [5:0] indvar_flatten47_reg_231;
reg   [1:0] ii_reg_242;
reg   [4:0] indvar_flatten_reg_254;
reg   [1:0] jj_reg_265;
reg   [4:0] kk_reg_277;
reg   [15:0] indices_01_read_reg_909;
wire   [5:0] trunc_ln319_fu_288_p1;
reg   [5:0] trunc_ln319_reg_914;
reg   [15:0] indices_12_read_reg_919;
wire   [11:0] empty_fu_293_p1;
reg   [11:0] empty_reg_924;
wire   [17:0] p_cast_i_i_fu_310_p1;
reg   [17:0] p_cast_i_i_reg_931;
wire    ap_CS_fsm_state2;
wire   [17:0] sext_ln22_fu_320_p1;
reg   [17:0] sext_ln22_reg_937;
wire   [5:0] p_cast_fu_324_p2;
reg   [5:0] p_cast_reg_943;
wire   [0:0] or_ln23_16_fu_343_p2;
reg   [0:0] or_ln23_16_reg_949;
wire   [11:0] p_mid137_fu_349_p2;
reg   [11:0] p_mid137_reg_954;
wire   [5:0] add_ln19_4_fu_354_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
wire    ap_block_state6_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] empty_107_fu_369_p2;
reg   [0:0] empty_107_reg_964;
wire   [0:0] is_padding_fu_404_p2;
reg   [0:0] is_padding_reg_969;
wire   [0:0] icmp_ln19_fu_410_p2;
reg   [0:0] icmp_ln19_reg_976;
reg   [0:0] icmp_ln19_reg_976_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_976_pp0_iter2_reg;
wire   [1:0] add_ln19_fu_416_p2;
reg   [1:0] add_ln19_reg_980;
wire   [0:0] icmp_ln20_fu_422_p2;
reg   [0:0] icmp_ln20_reg_985;
wire   [1:0] select_ln19_23_fu_444_p3;
reg   [1:0] select_ln19_23_reg_994;
wire   [0:0] p_mid113_fu_461_p2;
reg   [0:0] p_mid113_reg_1001;
wire   [0:0] or_ln19_fu_481_p2;
reg   [0:0] or_ln19_reg_1007;
reg   [0:0] or_ln19_reg_1007_pp0_iter1_reg;
wire   [1:0] add_ln20_fu_487_p2;
reg   [1:0] add_ln20_reg_1014;
wire   [1:0] select_ln20_16_fu_501_p3;
reg   [1:0] select_ln20_16_reg_1019;
wire   [17:0] add_ln22_5_fu_513_p2;
reg   [17:0] add_ln22_5_reg_1025;
reg   [1:0] lshr_ln_reg_1031;
reg   [1:0] lshr_ln_reg_1031_pp0_iter1_reg;
reg   [1:0] lshr_ln_reg_1031_pp0_iter2_reg;
wire   [4:0] add_ln25_fu_528_p2;
wire   [4:0] select_ln20_20_fu_540_p3;
wire   [11:0] select_ln19_28_fu_666_p3;
reg   [11:0] select_ln19_28_reg_1047;
wire   [5:0] add_ln33_fu_676_p2;
reg   [5:0] add_ln33_reg_1052;
reg   [5:0] add_ln33_reg_1052_pp0_iter2_reg;
wire   [0:0] or_ln23_20_fu_703_p2;
reg   [0:0] or_ln23_20_reg_1057;
wire   [0:0] select_ln20_17_fu_709_p3;
reg   [0:0] select_ln20_17_reg_1062;
reg   [0:0] select_ln20_17_reg_1062_pp0_iter2_reg;
wire   [11:0] p_mid1_fu_734_p2;
reg   [11:0] p_mid1_reg_1070;
wire   [12:0] sub_ln32_fu_770_p2;
reg   [12:0] sub_ln32_reg_1075;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state4;
reg    ap_enable_reg_pp0_iter3;
reg   [1:0] ap_phi_mux_ii_phi_fu_246_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_269_p4;
wire   [63:0] sext_ln32_fu_808_p1;
wire   [63:0] sext_ln33_fu_819_p1;
reg    ap_block_state1;
wire   [16:0] zext_ln19_fu_301_p1;
wire   [16:0] empty_105_fu_304_p2;
wire   [16:0] j_cast_i_i_fu_298_p1;
wire   [16:0] add_ln22_fu_314_p2;
wire   [0:0] tmp_45_fu_329_p3;
wire   [0:0] icmp_ln24_fu_337_p2;
wire   [17:0] ii_cast_i_i_fu_360_p1;
wire   [17:0] empty_106_fu_364_p2;
wire   [17:0] zext_ln20_fu_375_p1;
wire   [17:0] add_ln22_4_fu_379_p2;
wire   [0:0] tmp_46_fu_384_p3;
wire   [0:0] icmp_ln24_4_fu_392_p2;
wire   [0:0] or_ln23_fu_398_p2;
wire   [17:0] ii_cast_i_i_mid1_fu_452_p1;
wire   [17:0] p_mid111_fu_456_p2;
wire   [0:0] tmp_47_fu_467_p3;
wire   [0:0] xor_ln25_fu_475_p2;
wire   [1:0] select_ln19_fu_428_p3;
wire   [4:0] select_ln19_22_fu_436_p3;
wire   [17:0] zext_ln20_4_fu_509_p1;
wire   [4:0] select_ln20_fu_493_p3;
wire   [4:0] add_ln20_4_fu_534_p2;
wire   [5:0] ii_cast_fu_548_p1;
wire   [5:0] p_cast28_i_i_fu_552_p2;
wire   [2:0] zext_ln22_fu_557_p1;
wire   [2:0] tmp1_fu_568_p2;
wire   [11:0] tmp1_cast_fu_574_p1;
wire   [11:0] empty_108_fu_578_p2;
wire   [3:0] tmp_fu_593_p3;
wire   [4:0] zext_ln33_8_fu_600_p1;
wire   [4:0] zext_ln33_fu_590_p1;
wire   [4:0] sub_ln33_fu_604_p2;
wire   [5:0] ii_cast_mid1_fu_614_p1;
wire   [5:0] p_cast28_i_i_mid1_fu_617_p2;
wire   [0:0] or_ln23_18_fu_634_p2;
wire   [5:0] row_coord_int_mid131_fu_644_p3;
wire   [5:0] row_coord_int_fu_561_p3;
wire   [11:0] col_coord_int_mid139_fu_652_p3;
wire   [11:0] col_coord_int_fu_583_p3;
wire   [5:0] sub_ln33_cast_fu_610_p1;
wire   [5:0] zext_ln33_9_fu_673_p1;
wire   [0:0] tmp_48_fu_685_p3;
wire   [0:0] icmp_ln24_5_fu_692_p2;
wire   [0:0] or_ln23_19_fu_697_p2;
wire   [0:0] select_ln19_25_fu_629_p3;
wire   [0:0] select_ln19_26_fu_638_p3;
wire   [5:0] select_ln19_24_fu_622_p3;
wire   [2:0] zext_ln22_4_fu_682_p1;
wire   [2:0] tmp1_mid1_fu_724_p2;
wire   [11:0] tmp1_cast_mid1_fu_730_p1;
wire   [5:0] select_ln19_27_fu_659_p3;
wire   [5:0] row_coord_int_mid1_fu_716_p3;
wire   [5:0] select_ln20_18_fu_739_p3;
wire   [11:0] tmp_s_fu_746_p3;
wire   [8:0] tmp_28_fu_758_p3;
wire   [12:0] zext_ln32_fu_754_p1;
wire   [12:0] zext_ln32_32_fu_766_p1;
wire   [11:0] col_coord_int_mid1_fu_776_p3;
wire   [11:0] select_ln20_19_fu_785_p3;
wire   [13:0] sext_ln20_fu_782_p1;
wire   [13:0] zext_ln32_33_fu_791_p1;
wire   [13:0] add_ln32_fu_795_p2;
wire   [15:0] tmp_49_fu_801_p3;
wire   [7:0] tmp_50_fu_813_p3;
wire   [15:0] trunc_ln32_fu_827_p1;
wire   [15:0] in_data_elem_fu_831_p1;
wire   [15:0] tmp_144_i_i_fu_843_p4;
wire   [15:0] in_data_elem_6_fu_853_p1;
wire   [15:0] tmp_145_i_i_fu_865_p4;
wire   [15:0] in_data_elem_7_fu_875_p1;
wire   [15:0] tmp_146_i_i_fu_887_p4;
wire   [15:0] in_data_elem_8_fu_897_p1;
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
#0 ap_enable_reg_pp0_iter3 = 1'b0;
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
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
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
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter1_state4)) begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter0;
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_242 <= select_ln19_23_reg_994;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        ii_reg_242 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten47_reg_231 <= add_ln19_4_fu_354_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten47_reg_231 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_254 <= select_ln20_20_fu_540_p3;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten_reg_254 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_265 <= select_ln20_16_reg_1019;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        jj_reg_265 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        kk_reg_277 <= add_ln25_fu_528_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        kk_reg_277 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln19_reg_980 <= add_ln19_fu_416_p2;
        add_ln20_reg_1014 <= add_ln20_fu_487_p2;
        add_ln22_5_reg_1025 <= add_ln22_5_fu_513_p2;
        icmp_ln20_reg_985 <= icmp_ln20_fu_422_p2;
        lshr_ln_reg_1031 <= {{select_ln20_fu_493_p3[3:2]}};
        or_ln19_reg_1007 <= or_ln19_fu_481_p2;
        p_mid113_reg_1001 <= p_mid113_fu_461_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln33_reg_1052 <= add_ln33_fu_676_p2;
        or_ln23_20_reg_1057 <= or_ln23_20_fu_703_p2;
        select_ln20_17_reg_1062 <= select_ln20_17_fu_709_p3;
        sub_ln32_reg_1075[12 : 3] <= sub_ln32_fu_770_p2[12 : 3];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln33_reg_1052_pp0_iter2_reg <= add_ln33_reg_1052;
        icmp_ln19_reg_976_pp0_iter2_reg <= icmp_ln19_reg_976_pp0_iter1_reg;
        lshr_ln_reg_1031_pp0_iter2_reg <= lshr_ln_reg_1031_pp0_iter1_reg;
        select_ln20_17_reg_1062_pp0_iter2_reg <= select_ln20_17_reg_1062;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_107_reg_964 <= empty_107_fu_369_p2;
        icmp_ln19_reg_976 <= icmp_ln19_fu_410_p2;
        icmp_ln19_reg_976_pp0_iter1_reg <= icmp_ln19_reg_976;
        is_padding_reg_969 <= is_padding_fu_404_p2;
        lshr_ln_reg_1031_pp0_iter1_reg <= lshr_ln_reg_1031;
        or_ln19_reg_1007_pp0_iter1_reg <= or_ln19_reg_1007;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        empty_reg_924 <= empty_fu_293_p1;
        indices_01_read_reg_909 <= indices_01_dout;
        indices_12_read_reg_919 <= indices_12_dout;
        trunc_ln319_reg_914 <= trunc_ln319_fu_288_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        or_ln23_16_reg_949 <= or_ln23_16_fu_343_p2;
        p_cast_i_i_reg_931 <= p_cast_i_i_fu_310_p1;
        p_cast_reg_943 <= p_cast_fu_324_p2;
        p_mid137_reg_954 <= p_mid137_fu_349_p2;
        sext_ln22_reg_937 <= sext_ln22_fu_320_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln19_reg_1007 == 1'd0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_mid1_reg_1070 <= p_mid1_fu_734_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln19_23_reg_994 <= select_ln19_23_fu_444_p3;
        select_ln20_16_reg_1019 <= select_ln20_16_fu_501_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln19_reg_1007 == 1'd1) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln19_28_reg_1047 <= select_ln19_28_fu_666_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_condition_pp0_exit_iter1_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter1_state4 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_fu_410_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
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
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_246_p4 = select_ln19_23_reg_994;
    end else begin
        ap_phi_mux_ii_phi_fu_246_p4 = ii_reg_242;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln19_reg_976 == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_269_p4 = select_ln20_16_reg_1019;
    end else begin
        ap_phi_mux_jj_phi_fu_269_p4 = jj_reg_265;
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
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_0_we0 = 1'b1;
    end else begin
        ifmap_vec_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_1_ce0 = 1'b1;
    end else begin
        ifmap_vec_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_1_we0 = 1'b1;
    end else begin
        ifmap_vec_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_2_ce0 = 1'b1;
    end else begin
        ifmap_vec_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_2_we0 = 1'b1;
    end else begin
        ifmap_vec_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_3_ce0 = 1'b1;
    end else begin
        ifmap_vec_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln19_reg_976_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_3_we0 = 1'b1;
    end else begin
        ifmap_vec_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        in_data_ce0 = 1'b1;
    end else begin
        in_data_ce0 = 1'b0;
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_out_blk_n = indices_01_out_full_n;
    end else begin
        indices_01_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_01_out_write = 1'b1;
    end else begin
        indices_01_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_out_blk_n = indices_12_out_full_n;
    end else begin
        indices_12_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_out_write = 1'b1;
    end else begin
        indices_12_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_read = 1'b1;
    end else begin
        indices_12_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)) & ~((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
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

assign add_ln19_4_fu_354_p2 = (indvar_flatten47_reg_231 + 6'd1);

assign add_ln19_fu_416_p2 = (ap_phi_mux_ii_phi_fu_246_p4 + 2'd1);

assign add_ln20_4_fu_534_p2 = (indvar_flatten_reg_254 + 5'd1);

assign add_ln20_fu_487_p2 = (select_ln19_fu_428_p3 + 2'd1);

assign add_ln22_4_fu_379_p2 = ((sext_ln22_reg_937) + (zext_ln20_fu_375_p1));

assign add_ln22_5_fu_513_p2 = ((sext_ln22_reg_937) + (zext_ln20_4_fu_509_p1));

assign add_ln22_fu_314_p2 = ((j_cast_i_i_fu_298_p1) + (17'd131071));

assign add_ln25_fu_528_p2 = (select_ln20_fu_493_p3 + 5'd4);

assign add_ln32_fu_795_p2 = ((sext_ln20_fu_782_p1) + (zext_ln32_33_fu_791_p1));

assign add_ln33_fu_676_p2 = ((sub_ln33_cast_fu_610_p1) + (zext_ln33_9_fu_673_p1));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign col_coord_int_fu_583_p3 = ((is_padding_reg_969[0:0] == 1'b1) ? 12'd0 : empty_108_fu_578_p2);

assign col_coord_int_mid139_fu_652_p3 = ((or_ln23_18_fu_634_p2[0:0] == 1'b1) ? 12'd0 : p_mid137_reg_954);

assign col_coord_int_mid1_fu_776_p3 = ((or_ln23_20_reg_1057[0:0] == 1'b1) ? 12'd0 : p_mid1_reg_1070);

assign empty_105_fu_304_p2 = ((zext_ln19_fu_301_p1) + (17'd131071));

assign empty_106_fu_364_p2 = ((p_cast_i_i_reg_931) + (ii_cast_i_i_fu_360_p1));

assign empty_107_fu_369_p2 = ((empty_106_fu_364_p2 > 18'd55) ? 1'b1 : 1'b0);

assign empty_108_fu_578_p2 = ((tmp1_cast_fu_574_p1) + (empty_reg_924));

assign empty_fu_293_p1 = indices_12_dout[11:0];

assign icmp_ln19_fu_410_p2 = ((indvar_flatten47_reg_231 == 6'd36) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_422_p2 = ((indvar_flatten_reg_254 == 5'd12) ? 1'b1 : 1'b0);

assign icmp_ln24_4_fu_392_p2 = (((add_ln22_4_fu_379_p2) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_5_fu_692_p2 = (((add_ln22_5_reg_1025) > (18'd55)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_337_p2 = (((add_ln22_fu_314_p2) > (17'd55)) ? 1'b1 : 1'b0);

assign ifmap_vec_0_address0 = sext_ln33_fu_819_p1;

assign ifmap_vec_0_d0 = ((select_ln20_17_reg_1062_pp0_iter2_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_fu_831_p1);

assign ifmap_vec_1_address0 = sext_ln33_fu_819_p1;

assign ifmap_vec_1_d0 = ((select_ln20_17_reg_1062_pp0_iter2_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_6_fu_853_p1);

assign ifmap_vec_2_address0 = sext_ln33_fu_819_p1;

assign ifmap_vec_2_d0 = ((select_ln20_17_reg_1062_pp0_iter2_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_7_fu_875_p1);

assign ifmap_vec_3_address0 = sext_ln33_fu_819_p1;

assign ifmap_vec_3_d0 = ((select_ln20_17_reg_1062_pp0_iter2_reg[0:0] == 1'b1) ? 16'd0 : in_data_elem_8_fu_897_p1);

assign ii_cast_fu_548_p1 = ii_reg_242;

assign ii_cast_i_i_fu_360_p1 = ap_phi_mux_ii_phi_fu_246_p4;

assign ii_cast_i_i_mid1_fu_452_p1 = add_ln19_fu_416_p2;

assign ii_cast_mid1_fu_614_p1 = add_ln19_reg_980;

assign in_data_address0 = sext_ln32_fu_808_p1;

assign in_data_elem_6_fu_853_p1 = tmp_144_i_i_fu_843_p4;

assign in_data_elem_7_fu_875_p1 = tmp_145_i_i_fu_865_p4;

assign in_data_elem_8_fu_897_p1 = tmp_146_i_i_fu_887_p4;

assign in_data_elem_fu_831_p1 = trunc_ln32_fu_827_p1;

assign indices_01_out_din = indices_01_dout[5:0];

assign indices_12_out_din = indices_12_dout[11:0];

assign is_padding_fu_404_p2 = (or_ln23_fu_398_p2 | empty_107_fu_369_p2);

assign j_cast_i_i_fu_298_p1 = indices_12_read_reg_919;

assign or_ln19_fu_481_p2 = (xor_ln25_fu_475_p2 | icmp_ln20_fu_422_p2);

assign or_ln23_16_fu_343_p2 = (tmp_45_fu_329_p3 | icmp_ln24_fu_337_p2);

assign or_ln23_18_fu_634_p2 = (p_mid113_reg_1001 | or_ln23_16_reg_949);

assign or_ln23_19_fu_697_p2 = (tmp_48_fu_685_p3 | icmp_ln24_5_fu_692_p2);

assign or_ln23_20_fu_703_p2 = (select_ln19_25_fu_629_p3 | or_ln23_19_fu_697_p2);

assign or_ln23_fu_398_p2 = (tmp_46_fu_384_p3 | icmp_ln24_4_fu_392_p2);

assign p_cast28_i_i_fu_552_p2 = (p_cast_reg_943 + ii_cast_fu_548_p1);

assign p_cast28_i_i_mid1_fu_617_p2 = (p_cast_reg_943 + ii_cast_mid1_fu_614_p1);

assign p_cast_fu_324_p2 = ((trunc_ln319_reg_914) + (6'd63));

assign p_cast_i_i_fu_310_p1 = (empty_105_fu_304_p2);

assign p_mid111_fu_456_p2 = ((p_cast_i_i_reg_931) + (ii_cast_i_i_mid1_fu_452_p1));

assign p_mid113_fu_461_p2 = ((p_mid111_fu_456_p2 > 18'd55) ? 1'b1 : 1'b0);

assign p_mid137_fu_349_p2 = ((empty_reg_924) + (12'd4095));

assign p_mid1_fu_734_p2 = ((tmp1_cast_mid1_fu_730_p1) + (empty_reg_924));

assign row_coord_int_fu_561_p3 = ((is_padding_reg_969[0:0] == 1'b1) ? 6'd0 : p_cast28_i_i_fu_552_p2);

assign row_coord_int_mid131_fu_644_p3 = ((or_ln23_18_fu_634_p2[0:0] == 1'b1) ? 6'd0 : p_cast28_i_i_mid1_fu_617_p2);

assign row_coord_int_mid1_fu_716_p3 = ((or_ln23_20_fu_703_p2[0:0] == 1'b1) ? 6'd0 : select_ln19_24_fu_622_p3);

assign select_ln19_22_fu_436_p3 = ((icmp_ln20_fu_422_p2[0:0] == 1'b1) ? 5'd0 : kk_reg_277);

assign select_ln19_23_fu_444_p3 = ((icmp_ln20_fu_422_p2[0:0] == 1'b1) ? add_ln19_fu_416_p2 : ap_phi_mux_ii_phi_fu_246_p4);

assign select_ln19_24_fu_622_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? p_cast28_i_i_mid1_fu_617_p2 : p_cast28_i_i_fu_552_p2);

assign select_ln19_25_fu_629_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? p_mid113_reg_1001 : empty_107_reg_964);

assign select_ln19_26_fu_638_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? or_ln23_18_fu_634_p2 : is_padding_reg_969);

assign select_ln19_27_fu_659_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? row_coord_int_mid131_fu_644_p3 : row_coord_int_fu_561_p3);

assign select_ln19_28_fu_666_p3 = ((icmp_ln20_reg_985[0:0] == 1'b1) ? col_coord_int_mid139_fu_652_p3 : col_coord_int_fu_583_p3);

assign select_ln19_fu_428_p3 = ((icmp_ln20_fu_422_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_269_p4);

assign select_ln20_16_fu_501_p3 = ((or_ln19_fu_481_p2[0:0] == 1'b1) ? select_ln19_fu_428_p3 : add_ln20_fu_487_p2);

assign select_ln20_17_fu_709_p3 = ((or_ln19_reg_1007[0:0] == 1'b1) ? select_ln19_26_fu_638_p3 : or_ln23_20_fu_703_p2);

assign select_ln20_18_fu_739_p3 = ((or_ln19_reg_1007[0:0] == 1'b1) ? select_ln19_27_fu_659_p3 : row_coord_int_mid1_fu_716_p3);

assign select_ln20_19_fu_785_p3 = ((or_ln19_reg_1007_pp0_iter1_reg[0:0] == 1'b1) ? select_ln19_28_reg_1047 : col_coord_int_mid1_fu_776_p3);

assign select_ln20_20_fu_540_p3 = ((icmp_ln20_fu_422_p2[0:0] == 1'b1) ? 5'd1 : add_ln20_4_fu_534_p2);

assign select_ln20_fu_493_p3 = ((or_ln19_fu_481_p2[0:0] == 1'b1) ? select_ln19_22_fu_436_p3 : 5'd0);

assign sext_ln20_fu_782_p1 = (sub_ln32_reg_1075);

assign sext_ln22_fu_320_p1 = add_ln22_fu_314_p2;

assign sext_ln32_fu_808_p1 = (tmp_49_fu_801_p3);

assign sext_ln33_fu_819_p1 = (tmp_50_fu_813_p3);

assign sub_ln32_fu_770_p2 = (zext_ln32_fu_754_p1 - zext_ln32_32_fu_766_p1);

assign sub_ln33_cast_fu_610_p1 = (sub_ln33_fu_604_p2);

assign sub_ln33_fu_604_p2 = (zext_ln33_8_fu_600_p1 - zext_ln33_fu_590_p1);

assign tmp1_cast_fu_574_p1 = (tmp1_fu_568_p2);

assign tmp1_cast_mid1_fu_730_p1 = (tmp1_mid1_fu_724_p2);

assign tmp1_fu_568_p2 = ((zext_ln22_fu_557_p1) + (3'd7));

assign tmp1_mid1_fu_724_p2 = ((zext_ln22_4_fu_682_p1) + (3'd7));

assign tmp_144_i_i_fu_843_p4 = {{in_data_q0[31:16]}};

assign tmp_145_i_i_fu_865_p4 = {{in_data_q0[47:32]}};

assign tmp_146_i_i_fu_887_p4 = {{in_data_q0[63:48]}};

assign tmp_28_fu_758_p3 = {{select_ln20_18_fu_739_p3}, {3'd0}};

assign tmp_45_fu_329_p3 = add_ln22_fu_314_p2[32'd16];

assign tmp_46_fu_384_p3 = add_ln22_4_fu_379_p2[32'd17];

assign tmp_47_fu_467_p3 = kk_reg_277[32'd4];

assign tmp_48_fu_685_p3 = add_ln22_5_reg_1025[32'd17];

assign tmp_49_fu_801_p3 = {{add_ln32_fu_795_p2}, {lshr_ln_reg_1031_pp0_iter1_reg}};

assign tmp_50_fu_813_p3 = {{add_ln33_reg_1052_pp0_iter2_reg}, {lshr_ln_reg_1031_pp0_iter2_reg}};

assign tmp_fu_593_p3 = {{select_ln19_23_reg_994}, {2'd0}};

assign tmp_s_fu_746_p3 = {{select_ln20_18_fu_739_p3}, {6'd0}};

assign trunc_ln319_fu_288_p1 = indices_01_dout[5:0];

assign trunc_ln32_fu_827_p1 = in_data_q0[15:0];

assign xor_ln25_fu_475_p2 = (tmp_47_fu_467_p3 ^ 1'd1);

assign zext_ln19_fu_301_p1 = indices_01_read_reg_909;

assign zext_ln20_4_fu_509_p1 = add_ln20_fu_487_p2;

assign zext_ln20_fu_375_p1 = ap_phi_mux_jj_phi_fu_269_p4;

assign zext_ln22_4_fu_682_p1 = add_ln20_reg_1014;

assign zext_ln22_fu_557_p1 = jj_reg_265;

assign zext_ln32_32_fu_766_p1 = tmp_28_fu_758_p3;

assign zext_ln32_33_fu_791_p1 = select_ln20_19_fu_785_p3;

assign zext_ln32_fu_754_p1 = tmp_s_fu_746_p3;

assign zext_ln33_8_fu_600_p1 = tmp_fu_593_p3;

assign zext_ln33_9_fu_673_p1 = select_ln20_16_reg_1019;

assign zext_ln33_fu_590_p1 = select_ln19_23_reg_994;

always @ (posedge ap_clk) begin
    sub_ln32_reg_1075[2:0] <= 3'b000;
end

endmodule //td_fused_top_tdf4_readInputs37
