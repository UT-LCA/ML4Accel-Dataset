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

module td_fused_top_tdf1_readInputs19 (
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
        i_19,
        j_19,
        ifmap_vec_address0,
        ifmap_vec_ce0,
        ifmap_vec_we0,
        ifmap_vec_d0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state7 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] i_19;
input  [15:0] j_19;
output  [4:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
output   ifmap_vec_we0;
output  [15:0] ifmap_vec_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg ifmap_vec_ce0;
reg ifmap_vec_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [4:0] indvar_flatten52_reg_144;
reg   [1:0] ii_reg_155;
reg   [3:0] indvar_flatten_reg_167;
reg   [1:0] jj_reg_178;
reg   [1:0] kk_reg_190;
wire   [17:0] p_cast_i_fu_219_p1;
reg   [17:0] p_cast_i_reg_910;
wire   [17:0] sext_ln22_fu_229_p1;
reg   [17:0] sext_ln22_reg_916;
wire   [7:0] p_cast_fu_233_p2;
reg   [7:0] p_cast_reg_922;
wire   [0:0] or_ln23_26_fu_253_p2;
reg   [0:0] or_ln23_26_reg_928;
wire   [15:0] p_mid140_fu_259_p2;
reg   [15:0] p_mid140_reg_933;
wire   [4:0] add_ln19_6_fu_265_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] is_padding_fu_315_p2;
reg   [0:0] is_padding_reg_943;
reg   [0:0] is_padding_reg_943_pp0_iter1_reg;
reg   [0:0] is_padding_reg_943_pp0_iter2_reg;
reg   [0:0] is_padding_reg_943_pp0_iter3_reg;
wire   [0:0] icmp_ln19_fu_321_p2;
reg   [0:0] icmp_ln19_reg_950;
reg   [0:0] icmp_ln19_reg_950_pp0_iter1_reg;
reg   [0:0] icmp_ln19_reg_950_pp0_iter2_reg;
reg   [0:0] icmp_ln19_reg_950_pp0_iter3_reg;
wire   [1:0] add_ln19_fu_327_p2;
reg   [1:0] add_ln19_reg_954;
wire   [0:0] icmp_ln20_fu_333_p2;
reg   [0:0] icmp_ln20_reg_959;
reg   [0:0] icmp_ln20_reg_959_pp0_iter1_reg;
reg   [0:0] icmp_ln20_reg_959_pp0_iter2_reg;
reg   [0:0] icmp_ln20_reg_959_pp0_iter3_reg;
wire   [1:0] select_ln19_31_fu_347_p3;
reg   [1:0] select_ln19_31_reg_966;
reg   [1:0] select_ln19_31_reg_966_pp0_iter1_reg;
reg   [1:0] select_ln19_31_reg_966_pp0_iter2_reg;
reg   [1:0] select_ln19_31_reg_966_pp0_iter3_reg;
wire   [0:0] or_ln23_28_fu_378_p2;
reg   [0:0] or_ln23_28_reg_973;
reg   [0:0] or_ln23_28_reg_973_pp0_iter1_reg;
reg   [0:0] or_ln23_28_reg_973_pp0_iter2_reg;
reg   [0:0] or_ln23_28_reg_973_pp0_iter3_reg;
wire   [0:0] and_ln19_fu_395_p2;
reg   [0:0] and_ln19_reg_980;
reg   [0:0] and_ln19_reg_980_pp0_iter1_reg;
reg   [0:0] and_ln19_reg_980_pp0_iter2_reg;
reg   [0:0] and_ln19_reg_980_pp0_iter3_reg;
wire   [1:0] add_ln20_fu_401_p2;
reg   [1:0] add_ln20_reg_986;
wire   [1:0] select_ln20_fu_413_p3;
reg   [1:0] select_ln20_reg_991;
reg   [1:0] select_ln20_reg_991_pp0_iter1_reg;
reg   [1:0] select_ln20_reg_991_pp0_iter2_reg;
reg   [1:0] select_ln20_reg_991_pp0_iter3_reg;
wire   [1:0] select_ln20_26_fu_421_p3;
reg   [1:0] select_ln20_26_reg_997;
reg   [1:0] select_ln20_26_reg_997_pp0_iter1_reg;
reg   [1:0] select_ln20_26_reg_997_pp0_iter2_reg;
reg   [1:0] select_ln20_26_reg_997_pp0_iter3_reg;
wire   [0:0] or_ln23_30_fu_458_p2;
reg   [0:0] or_ln23_30_reg_1003;
reg   [0:0] or_ln23_30_reg_1003_pp0_iter1_reg;
reg   [0:0] or_ln23_30_reg_1003_pp0_iter2_reg;
reg   [0:0] or_ln23_30_reg_1003_pp0_iter3_reg;
wire   [1:0] add_ln25_fu_464_p2;
wire   [3:0] select_ln20_29_fu_476_p3;
wire   [5:0] tmp_15_fu_701_p3;
reg   [5:0] tmp_15_reg_1025;
wire   [5:0] empty_121_fu_708_p2;
reg   [5:0] empty_121_reg_1030;
wire   [0:0] icmp_ln32_fu_714_p2;
reg   [0:0] icmp_ln32_reg_1035;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg   [1:0] ap_phi_mux_ii_phi_fu_159_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_182_p4;
wire   [63:0] zext_ln32_26_fu_696_p1;
wire   [63:0] zext_ln33_25_fu_795_p1;
wire   [16:0] zext_ln19_fu_205_p1;
wire   [16:0] empty_116_fu_213_p2;
wire   [16:0] j_cast_i_fu_201_p1;
wire   [16:0] add_ln22_fu_223_p2;
wire   [7:0] empty_fu_209_p1;
wire   [0:0] tmp_fu_239_p3;
wire   [0:0] icmp_ln24_fu_247_p2;
wire   [17:0] ii_cast_i_fu_271_p1;
wire   [17:0] empty_117_fu_275_p2;
wire   [17:0] zext_ln20_fu_286_p1;
wire   [17:0] add_ln22_6_fu_290_p2;
wire   [0:0] tmp_43_fu_295_p3;
wire   [0:0] icmp_ln24_6_fu_303_p2;
wire   [0:0] or_ln23_fu_309_p2;
wire   [0:0] empty_118_fu_280_p2;
wire   [17:0] ii_cast_i_mid1_fu_355_p1;
wire   [17:0] p_mid114_fu_359_p2;
wire   [0:0] p_mid116_fu_364_p2;
wire   [0:0] icmp_ln25_fu_389_p2;
wire   [0:0] xor_ln19_fu_383_p2;
wire   [1:0] select_ln19_fu_339_p3;
wire   [0:0] or_ln20_fu_407_p2;
wire   [17:0] zext_ln20_6_fu_429_p1;
wire   [17:0] add_ln22_7_fu_433_p2;
wire   [0:0] tmp_44_fu_438_p3;
wire   [0:0] icmp_ln24_7_fu_446_p2;
wire   [0:0] or_ln23_29_fu_452_p2;
wire   [0:0] select_ln19_33_fu_370_p3;
wire   [3:0] add_ln20_6_fu_470_p2;
wire   [7:0] ii_cast_fu_484_p1;
wire   [7:0] p_cast1_i_fu_488_p2;
wire   [2:0] zext_ln22_fu_493_p1;
wire   [2:0] tmp2_fu_504_p2;
wire   [15:0] tmp2_cast_fu_510_p1;
wire   [15:0] empty_119_fu_514_p2;
wire   [7:0] row_coord_int_fu_497_p3;
wire   [12:0] tmp_9_fu_534_p3;
wire   [15:0] tmp_s_fu_526_p3;
wire   [15:0] zext_ln32_fu_542_p1;
wire   [15:0] sub_ln32_fu_546_p2;
wire   [15:0] col_coord_int_fu_519_p3;
wire   [7:0] ii_cast_mid1_fu_558_p1;
wire   [7:0] p_cast1_i_mid1_fu_561_p2;
wire   [7:0] row_coord_int_mid134_fu_573_p3;
wire   [12:0] tmp_12_fu_594_p3;
wire   [15:0] tmp_11_fu_586_p3;
wire   [15:0] zext_ln32_24_fu_602_p1;
wire   [15:0] sub_ln32_1_fu_606_p2;
wire   [15:0] col_coord_int_mid142_fu_580_p3;
wire   [15:0] add_ln32_1_fu_612_p2;
wire   [15:0] add_ln32_fu_552_p2;
wire   [7:0] select_ln19_32_fu_566_p3;
wire   [2:0] zext_ln22_6_fu_625_p1;
wire   [2:0] tmp2_mid1_fu_635_p2;
wire   [15:0] tmp2_cast_mid1_fu_641_p1;
wire   [15:0] p_mid1_fu_645_p2;
wire   [7:0] row_coord_int_mid1_fu_628_p3;
wire   [12:0] tmp_14_fu_665_p3;
wire   [15:0] tmp_13_fu_657_p3;
wire   [15:0] zext_ln32_25_fu_673_p1;
wire   [15:0] sub_ln32_2_fu_677_p2;
wire   [15:0] col_coord_int_mid1_fu_650_p3;
wire   [15:0] add_ln32_2_fu_683_p2;
wire   [15:0] select_ln19_35_fu_618_p3;
wire   [15:0] select_ln20_28_fu_689_p3;
wire   [3:0] tmp_10_fu_723_p3;
wire   [4:0] zext_ln33_22_fu_730_p1;
wire   [4:0] zext_ln33_fu_720_p1;
wire   [4:0] sub_ln33_fu_734_p2;
wire   [5:0] sub_ln33_cast_fu_740_p1;
wire   [5:0] zext_ln33_23_fu_749_p1;
wire   [5:0] add_ln33_fu_752_p2;
wire   [2:0] trunc_ln33_1_fu_762_p1;
wire   [4:0] p_shl4_cast_fu_766_p3;
wire   [4:0] trunc_ln33_fu_758_p1;
wire   [0:0] select_ln19_34_fu_744_p3;
wire   [4:0] sub_ln33_1_fu_774_p2;
wire   [4:0] zext_ln33_24_fu_786_p1;
wire   [4:0] add_ln33_6_fu_789_p2;
wire   [6:0] zext_ln32_27_fu_800_p1;
wire   [6:0] zext_ln32_28_fu_803_p1;
wire   [6:0] sub_ln32_3_fu_816_p2;
wire   [6:0] sub_ln32_4_fu_828_p2;
reg   [63:0] tmp_45_fu_806_p4;
wire   [6:0] xor_ln32_fu_822_p2;
wire   [6:0] select_ln32_fu_834_p3;
wire   [6:0] select_ln32_2_fu_848_p3;
wire   [6:0] sub_ln32_5_fu_855_p2;
wire   [63:0] select_ln32_1_fu_841_p3;
wire   [63:0] zext_ln32_29_fu_861_p1;
wire   [63:0] zext_ln32_30_fu_865_p1;
wire   [63:0] lshr_ln32_fu_869_p2;
wire   [63:0] lshr_ln32_1_fu_875_p2;
wire   [63:0] and_ln32_fu_881_p2;
wire   [15:0] trunc_ln32_fu_887_p1;
wire   [0:0] select_ln20_27_fu_780_p3;
wire   [15:0] in_data_elem_fu_891_p1;
wire    ap_CS_fsm_state7;
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
            if ((1'b1 == ap_condition_pp0_exit_iter1_state3)) begin
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
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_950 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ii_reg_155 <= select_ln19_31_reg_966;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_155 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_321_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten52_reg_144 <= add_ln19_6_fu_265_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten52_reg_144 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_321_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_167 <= select_ln20_29_fu_476_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_167 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_950 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_178 <= select_ln20_26_reg_997;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_178 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_321_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_reg_190 <= add_ln25_fu_464_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_190 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_321_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln19_reg_954 <= add_ln19_fu_327_p2;
        add_ln20_reg_986 <= add_ln20_fu_401_p2;
        and_ln19_reg_980 <= and_ln19_fu_395_p2;
        icmp_ln20_reg_959 <= icmp_ln20_fu_333_p2;
        or_ln23_28_reg_973 <= or_ln23_28_fu_378_p2;
        or_ln23_30_reg_1003 <= or_ln23_30_fu_458_p2;
        select_ln20_reg_991 <= select_ln20_fu_413_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        and_ln19_reg_980_pp0_iter1_reg <= and_ln19_reg_980;
        icmp_ln19_reg_950 <= icmp_ln19_fu_321_p2;
        icmp_ln19_reg_950_pp0_iter1_reg <= icmp_ln19_reg_950;
        icmp_ln20_reg_959_pp0_iter1_reg <= icmp_ln20_reg_959;
        is_padding_reg_943 <= is_padding_fu_315_p2;
        is_padding_reg_943_pp0_iter1_reg <= is_padding_reg_943;
        or_ln23_28_reg_973_pp0_iter1_reg <= or_ln23_28_reg_973;
        or_ln23_30_reg_1003_pp0_iter1_reg <= or_ln23_30_reg_1003;
        select_ln19_31_reg_966_pp0_iter1_reg <= select_ln19_31_reg_966;
        select_ln20_26_reg_997_pp0_iter1_reg <= select_ln20_26_reg_997;
        select_ln20_reg_991_pp0_iter1_reg <= select_ln20_reg_991;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        and_ln19_reg_980_pp0_iter2_reg <= and_ln19_reg_980_pp0_iter1_reg;
        and_ln19_reg_980_pp0_iter3_reg <= and_ln19_reg_980_pp0_iter2_reg;
        icmp_ln19_reg_950_pp0_iter2_reg <= icmp_ln19_reg_950_pp0_iter1_reg;
        icmp_ln19_reg_950_pp0_iter3_reg <= icmp_ln19_reg_950_pp0_iter2_reg;
        icmp_ln20_reg_959_pp0_iter2_reg <= icmp_ln20_reg_959_pp0_iter1_reg;
        icmp_ln20_reg_959_pp0_iter3_reg <= icmp_ln20_reg_959_pp0_iter2_reg;
        is_padding_reg_943_pp0_iter2_reg <= is_padding_reg_943_pp0_iter1_reg;
        is_padding_reg_943_pp0_iter3_reg <= is_padding_reg_943_pp0_iter2_reg;
        or_ln23_28_reg_973_pp0_iter2_reg <= or_ln23_28_reg_973_pp0_iter1_reg;
        or_ln23_28_reg_973_pp0_iter3_reg <= or_ln23_28_reg_973_pp0_iter2_reg;
        or_ln23_30_reg_1003_pp0_iter2_reg <= or_ln23_30_reg_1003_pp0_iter1_reg;
        or_ln23_30_reg_1003_pp0_iter3_reg <= or_ln23_30_reg_1003_pp0_iter2_reg;
        select_ln19_31_reg_966_pp0_iter2_reg <= select_ln19_31_reg_966_pp0_iter1_reg;
        select_ln19_31_reg_966_pp0_iter3_reg <= select_ln19_31_reg_966_pp0_iter2_reg;
        select_ln20_26_reg_997_pp0_iter2_reg <= select_ln20_26_reg_997_pp0_iter1_reg;
        select_ln20_26_reg_997_pp0_iter3_reg <= select_ln20_26_reg_997_pp0_iter2_reg;
        select_ln20_reg_991_pp0_iter2_reg <= select_ln20_reg_991_pp0_iter1_reg;
        select_ln20_reg_991_pp0_iter3_reg <= select_ln20_reg_991_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_reg_950_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_121_reg_1030[5 : 4] <= empty_121_fu_708_p2[5 : 4];
        icmp_ln32_reg_1035 <= icmp_ln32_fu_714_p2;
        tmp_15_reg_1025[5 : 4] <= tmp_15_fu_701_p3[5 : 4];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        or_ln23_26_reg_928 <= or_ln23_26_fu_253_p2;
        p_cast_i_reg_910 <= p_cast_i_fu_219_p1;
        p_cast_reg_922 <= p_cast_fu_233_p2;
        p_mid140_reg_933 <= p_mid140_fu_259_p2;
        sext_ln22_reg_916 <= sext_ln22_fu_229_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln19_fu_321_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln19_31_reg_966 <= select_ln19_31_fu_347_p3;
        select_ln20_26_reg_997 <= select_ln20_26_fu_421_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_condition_pp0_exit_iter1_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter1_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_fu_321_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_950 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_ii_phi_fu_159_p4 = select_ln19_31_reg_966;
    end else begin
        ap_phi_mux_ii_phi_fu_159_p4 = ii_reg_155;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_950 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_182_p4 = select_ln20_26_reg_997;
    end else begin
        ap_phi_mux_jj_phi_fu_182_p4 = jj_reg_178;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ifmap_vec_ce0 = 1'b1;
    end else begin
        ifmap_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln19_reg_950_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ifmap_vec_we0 = 1'b1;
    end else begin
        ifmap_vec_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1)))) begin
        in_data_ce0 = 1'b1;
    end else begin
        in_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
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

assign add_ln19_6_fu_265_p2 = (indvar_flatten52_reg_144 + 5'd1);

assign add_ln19_fu_327_p2 = (ap_phi_mux_ii_phi_fu_159_p4 + 2'd1);

assign add_ln20_6_fu_470_p2 = (indvar_flatten_reg_167 + 4'd1);

assign add_ln20_fu_401_p2 = (select_ln19_fu_339_p3 + 2'd1);

assign add_ln22_6_fu_290_p2 = ((sext_ln22_reg_916) + (zext_ln20_fu_286_p1));

assign add_ln22_7_fu_433_p2 = ((sext_ln22_reg_916) + (zext_ln20_6_fu_429_p1));

assign add_ln22_fu_223_p2 = ((j_cast_i_fu_201_p1) + (17'd131071));

assign add_ln25_fu_464_p2 = (select_ln20_fu_413_p3 + 2'd1);

assign add_ln32_1_fu_612_p2 = (sub_ln32_1_fu_606_p2 + col_coord_int_mid142_fu_580_p3);

assign add_ln32_2_fu_683_p2 = (sub_ln32_2_fu_677_p2 + col_coord_int_mid1_fu_650_p3);

assign add_ln32_fu_552_p2 = (sub_ln32_fu_546_p2 + col_coord_int_fu_519_p3);

assign add_ln33_6_fu_789_p2 = (sub_ln33_1_fu_774_p2 + zext_ln33_24_fu_786_p1);

assign add_ln33_fu_752_p2 = ((sub_ln33_cast_fu_740_p1) + (zext_ln33_23_fu_749_p1));

assign and_ln19_fu_395_p2 = (xor_ln19_fu_383_p2 & icmp_ln25_fu_389_p2);

assign and_ln32_fu_881_p2 = (lshr_ln32_fu_869_p2 & lshr_ln32_1_fu_875_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign col_coord_int_fu_519_p3 = ((is_padding_reg_943[0:0] == 1'b1) ? 16'd0 : empty_119_fu_514_p2);

assign col_coord_int_mid142_fu_580_p3 = ((or_ln23_28_reg_973[0:0] == 1'b1) ? 16'd0 : p_mid140_reg_933);

assign col_coord_int_mid1_fu_650_p3 = ((or_ln23_30_reg_1003[0:0] == 1'b1) ? 16'd0 : p_mid1_fu_645_p2);

assign empty_116_fu_213_p2 = ((zext_ln19_fu_205_p1) + (17'd131071));

assign empty_117_fu_275_p2 = ((p_cast_i_reg_910) + (ii_cast_i_fu_271_p1));

assign empty_118_fu_280_p2 = ((empty_117_fu_275_p2 > 18'd223) ? 1'b1 : 1'b0);

assign empty_119_fu_514_p2 = ((tmp2_cast_fu_510_p1) + (j_19));

assign empty_121_fu_708_p2 = (tmp_15_fu_701_p3 | 6'd15);

assign empty_fu_209_p1 = i_19[7:0];

assign icmp_ln19_fu_321_p2 = ((indvar_flatten52_reg_144 == 5'd27) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_333_p2 = ((indvar_flatten_reg_167 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln24_6_fu_303_p2 = (((add_ln22_6_fu_290_p2) > (18'd223)) ? 1'b1 : 1'b0);

assign icmp_ln24_7_fu_446_p2 = (((add_ln22_7_fu_433_p2) > (18'd223)) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_247_p2 = (((add_ln22_fu_223_p2) > (17'd223)) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_389_p2 = ((kk_reg_190 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln32_fu_714_p2 = ((tmp_15_fu_701_p3 > empty_121_fu_708_p2) ? 1'b1 : 1'b0);

assign ifmap_vec_address0 = zext_ln33_25_fu_795_p1;

assign ifmap_vec_d0 = ((select_ln20_27_fu_780_p3[0:0] == 1'b1) ? 16'd0 : in_data_elem_fu_891_p1);

assign ii_cast_fu_484_p1 = ii_reg_155;

assign ii_cast_i_fu_271_p1 = ap_phi_mux_ii_phi_fu_159_p4;

assign ii_cast_i_mid1_fu_355_p1 = add_ln19_fu_327_p2;

assign ii_cast_mid1_fu_558_p1 = add_ln19_reg_954;

assign in_data_address0 = zext_ln32_26_fu_696_p1;

assign in_data_elem_fu_891_p1 = trunc_ln32_fu_887_p1;

assign is_padding_fu_315_p2 = (or_ln23_fu_309_p2 | empty_118_fu_280_p2);

assign j_cast_i_fu_201_p1 = j_19;

assign lshr_ln32_1_fu_875_p2 = 64'd18446744073709551615 >> zext_ln32_30_fu_865_p1;

assign lshr_ln32_fu_869_p2 = select_ln32_1_fu_841_p3 >> zext_ln32_29_fu_861_p1;

assign or_ln20_fu_407_p2 = (icmp_ln20_fu_333_p2 | and_ln19_fu_395_p2);

assign or_ln23_26_fu_253_p2 = (tmp_fu_239_p3 | icmp_ln24_fu_247_p2);

assign or_ln23_28_fu_378_p2 = (p_mid116_fu_364_p2 | or_ln23_26_reg_928);

assign or_ln23_29_fu_452_p2 = (tmp_44_fu_438_p3 | icmp_ln24_7_fu_446_p2);

assign or_ln23_30_fu_458_p2 = (select_ln19_33_fu_370_p3 | or_ln23_29_fu_452_p2);

assign or_ln23_fu_309_p2 = (tmp_43_fu_295_p3 | icmp_ln24_6_fu_303_p2);

assign p_cast1_i_fu_488_p2 = (p_cast_reg_922 + ii_cast_fu_484_p1);

assign p_cast1_i_mid1_fu_561_p2 = (p_cast_reg_922 + ii_cast_mid1_fu_558_p1);

assign p_cast_fu_233_p2 = ((empty_fu_209_p1) + (8'd255));

assign p_cast_i_fu_219_p1 = (empty_116_fu_213_p2);

assign p_mid114_fu_359_p2 = ((p_cast_i_reg_910) + (ii_cast_i_mid1_fu_355_p1));

assign p_mid116_fu_364_p2 = ((p_mid114_fu_359_p2 > 18'd223) ? 1'b1 : 1'b0);

assign p_mid140_fu_259_p2 = ((j_19) + (16'd65535));

assign p_mid1_fu_645_p2 = ((tmp2_cast_mid1_fu_641_p1) + (j_19));

assign p_shl4_cast_fu_766_p3 = {{trunc_ln33_1_fu_762_p1}, {2'd0}};

assign row_coord_int_fu_497_p3 = ((is_padding_reg_943[0:0] == 1'b1) ? 8'd0 : p_cast1_i_fu_488_p2);

assign row_coord_int_mid134_fu_573_p3 = ((or_ln23_28_reg_973[0:0] == 1'b1) ? 8'd0 : p_cast1_i_mid1_fu_561_p2);

assign row_coord_int_mid1_fu_628_p3 = ((or_ln23_30_reg_1003[0:0] == 1'b1) ? 8'd0 : select_ln19_32_fu_566_p3);

assign select_ln19_31_fu_347_p3 = ((icmp_ln20_fu_333_p2[0:0] == 1'b1) ? add_ln19_fu_327_p2 : ap_phi_mux_ii_phi_fu_159_p4);

assign select_ln19_32_fu_566_p3 = ((icmp_ln20_reg_959[0:0] == 1'b1) ? p_cast1_i_mid1_fu_561_p2 : p_cast1_i_fu_488_p2);

assign select_ln19_33_fu_370_p3 = ((icmp_ln20_fu_333_p2[0:0] == 1'b1) ? p_mid116_fu_364_p2 : empty_118_fu_280_p2);

assign select_ln19_34_fu_744_p3 = ((icmp_ln20_reg_959_pp0_iter3_reg[0:0] == 1'b1) ? or_ln23_28_reg_973_pp0_iter3_reg : is_padding_reg_943_pp0_iter3_reg);

assign select_ln19_35_fu_618_p3 = ((icmp_ln20_reg_959[0:0] == 1'b1) ? add_ln32_1_fu_612_p2 : add_ln32_fu_552_p2);

assign select_ln19_fu_339_p3 = ((icmp_ln20_fu_333_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_182_p4);

assign select_ln20_26_fu_421_p3 = ((and_ln19_fu_395_p2[0:0] == 1'b1) ? add_ln20_fu_401_p2 : select_ln19_fu_339_p3);

assign select_ln20_27_fu_780_p3 = ((and_ln19_reg_980_pp0_iter3_reg[0:0] == 1'b1) ? or_ln23_30_reg_1003_pp0_iter3_reg : select_ln19_34_fu_744_p3);

assign select_ln20_28_fu_689_p3 = ((and_ln19_reg_980[0:0] == 1'b1) ? add_ln32_2_fu_683_p2 : select_ln19_35_fu_618_p3);

assign select_ln20_29_fu_476_p3 = ((icmp_ln20_fu_333_p2[0:0] == 1'b1) ? 4'd1 : add_ln20_6_fu_470_p2);

assign select_ln20_fu_413_p3 = ((or_ln20_fu_407_p2[0:0] == 1'b1) ? 2'd0 : kk_reg_190);

assign select_ln32_1_fu_841_p3 = ((icmp_ln32_reg_1035[0:0] == 1'b1) ? tmp_45_fu_806_p4 : in_data_q0);

assign select_ln32_2_fu_848_p3 = ((icmp_ln32_reg_1035[0:0] == 1'b1) ? xor_ln32_fu_822_p2 : zext_ln32_27_fu_800_p1);

assign select_ln32_fu_834_p3 = ((icmp_ln32_reg_1035[0:0] == 1'b1) ? sub_ln32_3_fu_816_p2 : sub_ln32_4_fu_828_p2);

assign sext_ln22_fu_229_p1 = add_ln22_fu_223_p2;

assign sub_ln32_1_fu_606_p2 = (tmp_11_fu_586_p3 - zext_ln32_24_fu_602_p1);

assign sub_ln32_2_fu_677_p2 = (tmp_13_fu_657_p3 - zext_ln32_25_fu_673_p1);

assign sub_ln32_3_fu_816_p2 = (zext_ln32_27_fu_800_p1 - zext_ln32_28_fu_803_p1);

assign sub_ln32_4_fu_828_p2 = (zext_ln32_28_fu_803_p1 - zext_ln32_27_fu_800_p1);

assign sub_ln32_5_fu_855_p2 = (7'd63 - select_ln32_fu_834_p3);

assign sub_ln32_fu_546_p2 = (tmp_s_fu_526_p3 - zext_ln32_fu_542_p1);

assign sub_ln33_1_fu_774_p2 = (p_shl4_cast_fu_766_p3 - trunc_ln33_fu_758_p1);

assign sub_ln33_cast_fu_740_p1 = (sub_ln33_fu_734_p2);

assign sub_ln33_fu_734_p2 = (zext_ln33_22_fu_730_p1 - zext_ln33_fu_720_p1);

assign tmp2_cast_fu_510_p1 = (tmp2_fu_504_p2);

assign tmp2_cast_mid1_fu_641_p1 = (tmp2_mid1_fu_635_p2);

assign tmp2_fu_504_p2 = ((zext_ln22_fu_493_p1) + (3'd7));

assign tmp2_mid1_fu_635_p2 = ((zext_ln22_6_fu_625_p1) + (3'd7));

assign tmp_10_fu_723_p3 = {{select_ln19_31_reg_966_pp0_iter3_reg}, {2'd0}};

assign tmp_11_fu_586_p3 = {{row_coord_int_mid134_fu_573_p3}, {8'd0}};

assign tmp_12_fu_594_p3 = {{row_coord_int_mid134_fu_573_p3}, {5'd0}};

assign tmp_13_fu_657_p3 = {{row_coord_int_mid1_fu_628_p3}, {8'd0}};

assign tmp_14_fu_665_p3 = {{row_coord_int_mid1_fu_628_p3}, {5'd0}};

assign tmp_15_fu_701_p3 = {{select_ln20_reg_991_pp0_iter2_reg}, {4'd0}};

assign tmp_43_fu_295_p3 = add_ln22_6_fu_290_p2[32'd17];

assign tmp_44_fu_438_p3 = add_ln22_7_fu_433_p2[32'd17];

integer ap_tvar_int_0;

always @ (in_data_q0) begin
    //for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
    for (ap_tvar_int_0 = 0; ap_tvar_int_0 < 64; ap_tvar_int_0 = ap_tvar_int_0 + 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_45_fu_806_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_45_fu_806_p4[ap_tvar_int_0] = in_data_q0[63 - ap_tvar_int_0];
        end
    end
end

assign tmp_9_fu_534_p3 = {{row_coord_int_fu_497_p3}, {5'd0}};

assign tmp_fu_239_p3 = add_ln22_fu_223_p2[32'd16];

assign tmp_s_fu_526_p3 = {{row_coord_int_fu_497_p3}, {8'd0}};

assign trunc_ln32_fu_887_p1 = and_ln32_fu_881_p2[15:0];

assign trunc_ln33_1_fu_762_p1 = add_ln33_fu_752_p2[2:0];

assign trunc_ln33_fu_758_p1 = add_ln33_fu_752_p2[4:0];

assign xor_ln19_fu_383_p2 = (icmp_ln20_fu_333_p2 ^ 1'd1);

assign xor_ln32_fu_822_p2 = (zext_ln32_27_fu_800_p1 ^ 7'd63);

assign zext_ln19_fu_205_p1 = i_19;

assign zext_ln20_6_fu_429_p1 = add_ln20_fu_401_p2;

assign zext_ln20_fu_286_p1 = ap_phi_mux_jj_phi_fu_182_p4;

assign zext_ln22_6_fu_625_p1 = add_ln20_reg_986;

assign zext_ln22_fu_493_p1 = jj_reg_178;

assign zext_ln32_24_fu_602_p1 = tmp_12_fu_594_p3;

assign zext_ln32_25_fu_673_p1 = tmp_14_fu_665_p3;

assign zext_ln32_26_fu_696_p1 = select_ln20_28_fu_689_p3;

assign zext_ln32_27_fu_800_p1 = tmp_15_reg_1025;

assign zext_ln32_28_fu_803_p1 = empty_121_reg_1030;

assign zext_ln32_29_fu_861_p1 = select_ln32_2_fu_848_p3;

assign zext_ln32_30_fu_865_p1 = sub_ln32_5_fu_855_p2;

assign zext_ln32_fu_542_p1 = tmp_9_fu_534_p3;

assign zext_ln33_22_fu_730_p1 = tmp_10_fu_723_p3;

assign zext_ln33_23_fu_749_p1 = select_ln20_26_reg_997_pp0_iter3_reg;

assign zext_ln33_24_fu_786_p1 = select_ln20_reg_991_pp0_iter3_reg;

assign zext_ln33_25_fu_795_p1 = add_ln33_6_fu_789_p2;

assign zext_ln33_fu_720_p1 = select_ln19_31_reg_966_pp0_iter3_reg;

always @ (posedge ap_clk) begin
    tmp_15_reg_1025[3:0] <= 4'b0000;
    empty_121_reg_1030[3:0] <= 4'b1111;
end

endmodule //td_fused_top_tdf1_readInputs19
