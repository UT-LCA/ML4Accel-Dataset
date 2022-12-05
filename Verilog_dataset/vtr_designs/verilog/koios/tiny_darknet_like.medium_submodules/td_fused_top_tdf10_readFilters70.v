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

module td_fused_top_tdf10_readFilters70 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        filter_data_0_address0,
        filter_data_0_ce0,
        filter_data_0_q0,
        filter_data_1_address0,
        filter_data_1_ce0,
        filter_data_1_q0,
        filter_data_2_address0,
        filter_data_2_ce0,
        filter_data_2_q0,
        filter_data_3_address0,
        filter_data_3_ce0,
        filter_data_3_q0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read,
        weight_vecs_0_0_address0,
        weight_vecs_0_0_ce0,
        weight_vecs_0_0_we0,
        weight_vecs_0_0_d0,
        weight_vecs_0_1_address0,
        weight_vecs_0_1_ce0,
        weight_vecs_0_1_we0,
        weight_vecs_0_1_d0,
        weight_vecs_0_2_address0,
        weight_vecs_0_2_ce0,
        weight_vecs_0_2_we0,
        weight_vecs_0_2_d0,
        weight_vecs_0_3_address0,
        weight_vecs_0_3_ce0,
        weight_vecs_0_3_we0,
        weight_vecs_0_3_d0,
        weight_vecs_1_0_address0,
        weight_vecs_1_0_ce0,
        weight_vecs_1_0_we0,
        weight_vecs_1_0_d0,
        weight_vecs_1_1_address0,
        weight_vecs_1_1_ce0,
        weight_vecs_1_1_we0,
        weight_vecs_1_1_d0,
        weight_vecs_1_2_address0,
        weight_vecs_1_2_ce0,
        weight_vecs_1_2_we0,
        weight_vecs_1_2_d0,
        weight_vecs_1_3_address0,
        weight_vecs_1_3_ce0,
        weight_vecs_1_3_we0,
        weight_vecs_1_3_d0,
        weight_vecs_2_0_address0,
        weight_vecs_2_0_ce0,
        weight_vecs_2_0_we0,
        weight_vecs_2_0_d0,
        weight_vecs_2_1_address0,
        weight_vecs_2_1_ce0,
        weight_vecs_2_1_we0,
        weight_vecs_2_1_d0,
        weight_vecs_2_2_address0,
        weight_vecs_2_2_ce0,
        weight_vecs_2_2_we0,
        weight_vecs_2_2_d0,
        weight_vecs_2_3_address0,
        weight_vecs_2_3_ce0,
        weight_vecs_2_3_we0,
        weight_vecs_2_3_d0,
        weight_vecs_3_0_address0,
        weight_vecs_3_0_ce0,
        weight_vecs_3_0_we0,
        weight_vecs_3_0_d0,
        weight_vecs_3_1_address0,
        weight_vecs_3_1_ce0,
        weight_vecs_3_1_we0,
        weight_vecs_3_1_d0,
        weight_vecs_3_2_address0,
        weight_vecs_3_2_ce0,
        weight_vecs_3_2_we0,
        weight_vecs_3_2_d0,
        weight_vecs_3_3_address0,
        weight_vecs_3_3_ce0,
        weight_vecs_3_3_we0,
        weight_vecs_3_3_d0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state6 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [14:0] filter_data_0_address0;
output   filter_data_0_ce0;
input  [63:0] filter_data_0_q0;
output  [14:0] filter_data_1_address0;
output   filter_data_1_ce0;
input  [63:0] filter_data_1_q0;
output  [14:0] filter_data_2_address0;
output   filter_data_2_ce0;
input  [63:0] filter_data_2_q0;
output  [14:0] filter_data_3_address0;
output   filter_data_3_ce0;
input  [63:0] filter_data_3_q0;
input  [6:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [7:0] weight_vecs_0_0_address0;
output   weight_vecs_0_0_ce0;
output   weight_vecs_0_0_we0;
output  [15:0] weight_vecs_0_0_d0;
output  [7:0] weight_vecs_0_1_address0;
output   weight_vecs_0_1_ce0;
output   weight_vecs_0_1_we0;
output  [15:0] weight_vecs_0_1_d0;
output  [7:0] weight_vecs_0_2_address0;
output   weight_vecs_0_2_ce0;
output   weight_vecs_0_2_we0;
output  [15:0] weight_vecs_0_2_d0;
output  [7:0] weight_vecs_0_3_address0;
output   weight_vecs_0_3_ce0;
output   weight_vecs_0_3_we0;
output  [15:0] weight_vecs_0_3_d0;
output  [7:0] weight_vecs_1_0_address0;
output   weight_vecs_1_0_ce0;
output   weight_vecs_1_0_we0;
output  [15:0] weight_vecs_1_0_d0;
output  [7:0] weight_vecs_1_1_address0;
output   weight_vecs_1_1_ce0;
output   weight_vecs_1_1_we0;
output  [15:0] weight_vecs_1_1_d0;
output  [7:0] weight_vecs_1_2_address0;
output   weight_vecs_1_2_ce0;
output   weight_vecs_1_2_we0;
output  [15:0] weight_vecs_1_2_d0;
output  [7:0] weight_vecs_1_3_address0;
output   weight_vecs_1_3_ce0;
output   weight_vecs_1_3_we0;
output  [15:0] weight_vecs_1_3_d0;
output  [7:0] weight_vecs_2_0_address0;
output   weight_vecs_2_0_ce0;
output   weight_vecs_2_0_we0;
output  [15:0] weight_vecs_2_0_d0;
output  [7:0] weight_vecs_2_1_address0;
output   weight_vecs_2_1_ce0;
output   weight_vecs_2_1_we0;
output  [15:0] weight_vecs_2_1_d0;
output  [7:0] weight_vecs_2_2_address0;
output   weight_vecs_2_2_ce0;
output   weight_vecs_2_2_we0;
output  [15:0] weight_vecs_2_2_d0;
output  [7:0] weight_vecs_2_3_address0;
output   weight_vecs_2_3_ce0;
output   weight_vecs_2_3_we0;
output  [15:0] weight_vecs_2_3_d0;
output  [7:0] weight_vecs_3_0_address0;
output   weight_vecs_3_0_ce0;
output   weight_vecs_3_0_we0;
output  [15:0] weight_vecs_3_0_d0;
output  [7:0] weight_vecs_3_1_address0;
output   weight_vecs_3_1_ce0;
output   weight_vecs_3_1_we0;
output  [15:0] weight_vecs_3_1_d0;
output  [7:0] weight_vecs_3_2_address0;
output   weight_vecs_3_2_ce0;
output   weight_vecs_3_2_we0;
output  [15:0] weight_vecs_3_2_d0;
output  [7:0] weight_vecs_3_3_address0;
output   weight_vecs_3_3_ce0;
output   weight_vecs_3_3_we0;
output  [15:0] weight_vecs_3_3_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_0_ce0;
reg filter_data_1_ce0;
reg filter_data_2_ce0;
reg filter_data_3_ce0;
reg indices_23_read;
reg weight_vecs_0_0_ce0;
reg weight_vecs_0_0_we0;
reg weight_vecs_0_1_ce0;
reg weight_vecs_0_1_we0;
reg weight_vecs_0_2_ce0;
reg weight_vecs_0_2_we0;
reg weight_vecs_0_3_ce0;
reg weight_vecs_0_3_we0;
reg weight_vecs_1_0_ce0;
reg weight_vecs_1_0_we0;
reg weight_vecs_1_1_ce0;
reg weight_vecs_1_1_we0;
reg weight_vecs_1_2_ce0;
reg weight_vecs_1_2_we0;
reg weight_vecs_1_3_ce0;
reg weight_vecs_1_3_we0;
reg weight_vecs_2_0_ce0;
reg weight_vecs_2_0_we0;
reg weight_vecs_2_1_ce0;
reg weight_vecs_2_1_we0;
reg weight_vecs_2_2_ce0;
reg weight_vecs_2_2_we0;
reg weight_vecs_2_3_ce0;
reg weight_vecs_2_3_we0;
reg weight_vecs_3_0_ce0;
reg weight_vecs_3_0_we0;
reg weight_vecs_3_1_ce0;
reg weight_vecs_3_1_we0;
reg weight_vecs_3_2_ce0;
reg weight_vecs_3_2_we0;
reg weight_vecs_3_3_ce0;
reg weight_vecs_3_3_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [7:0] indvar_flatten13_reg_412;
reg   [1:0] ii_reg_423;
reg   [6:0] indvar_flatten_reg_434;
reg   [1:0] jj_reg_445;
reg   [6:0] kk_reg_456;
wire   [10:0] sext_ln47_fu_489_p1;
reg   [10:0] sext_ln47_reg_989;
wire   [7:0] add_ln47_8_fu_493_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln47_fu_499_p2;
reg   [0:0] icmp_ln47_reg_999;
reg   [0:0] icmp_ln47_reg_999_pp0_iter1_reg;
reg   [0:0] icmp_ln47_reg_999_pp0_iter2_reg;
wire   [1:0] select_ln47_15_fu_533_p3;
reg   [1:0] select_ln47_15_reg_1003;
wire   [10:0] add_ln55_fu_545_p2;
reg   [10:0] add_ln55_reg_1010;
wire   [1:0] select_ln48_15_fu_584_p3;
reg   [1:0] select_ln48_15_reg_1016;
reg   [3:0] lshr_ln_reg_1023;
reg   [3:0] lshr_ln_reg_1023_pp0_iter1_reg;
reg   [3:0] lshr_ln_reg_1023_pp0_iter2_reg;
wire   [6:0] add_ln49_fu_602_p2;
wire   [6:0] select_ln48_16_fu_614_p3;
wire   [5:0] add_ln55_18_fu_678_p2;
reg   [5:0] add_ln55_18_reg_1039;
reg   [5:0] add_ln55_18_reg_1039_pp0_iter2_reg;
reg   [63:0] filter_data_0_load_reg_1064;
reg   [63:0] filter_data_1_load_reg_1069;
reg   [63:0] filter_data_2_load_reg_1074;
reg   [63:0] filter_data_3_load_reg_1079;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg   [1:0] ap_phi_mux_ii_phi_fu_427_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_449_p4;
wire   [63:0] tmp_68_fu_684_p3;
wire   [63:0] sext_ln55_15_fu_701_p1;
wire   [8:0] tmp_66_fu_471_p3;
wire   [9:0] zext_ln55_50_fu_479_p1;
wire   [9:0] zext_ln55_fu_467_p1;
wire   [9:0] sub_ln55_fu_483_p2;
wire   [0:0] icmp_ln48_fu_511_p2;
wire   [1:0] add_ln47_fu_505_p2;
wire   [10:0] zext_ln55_52_fu_541_p1;
wire   [0:0] tmp_103_fu_550_p3;
wire   [0:0] xor_ln49_fu_558_p2;
wire   [1:0] select_ln47_fu_517_p3;
wire   [0:0] or_ln47_fu_564_p2;
wire   [6:0] select_ln47_14_fu_525_p3;
wire   [1:0] add_ln48_fu_570_p2;
wire   [6:0] select_ln48_fu_576_p3;
wire   [6:0] add_ln48_8_fu_608_p2;
wire   [12:0] tmp_102_fu_628_p3;
wire   [59:0] sext_ln55_14_fu_635_p1;
wire   [59:0] sext_ln55_fu_625_p1;
wire   [3:0] tmp_67_fu_645_p3;
wire   [4:0] zext_ln55_53_fu_652_p1;
wire   [4:0] zext_ln55_51_fu_622_p1;
wire   [4:0] sub_ln55_18_fu_656_p2;
wire   [59:0] sub_ln55_17_fu_639_p2;
wire   [59:0] zext_ln55_55_fu_669_p1;
wire   [5:0] sext_ln48_fu_662_p1;
wire   [5:0] zext_ln55_54_fu_666_p1;
wire   [59:0] add_ln55_17_fu_672_p2;
wire   [9:0] tmp_104_fu_695_p3;
wire   [63:0] tmp_fu_721_p6;
wire   [15:0] trunc_ln55_fu_734_p1;
wire   [63:0] tmp_s_fu_743_p6;
wire   [15:0] trunc_ln55_23_fu_756_p1;
wire   [63:0] tmp_9_fu_765_p6;
wire   [15:0] trunc_ln55_24_fu_778_p1;
wire   [63:0] tmp_10_fu_787_p6;
wire   [15:0] trunc_ln55_25_fu_800_p1;
wire   [15:0] tmp_368_i_i_fu_809_p4;
wire   [15:0] tmp_370_i_i_fu_824_p4;
wire   [15:0] tmp_372_i_i_fu_839_p4;
wire   [15:0] tmp_374_i_i_fu_854_p4;
wire   [15:0] tmp_376_i_i_fu_869_p4;
wire   [15:0] tmp_378_i_i_fu_884_p4;
wire   [15:0] tmp_380_i_i_fu_899_p4;
wire   [15:0] tmp_382_i_i_fu_914_p4;
wire   [15:0] tmp_384_i_i_fu_929_p4;
wire   [15:0] tmp_386_i_i_fu_944_p4;
wire   [15:0] tmp_388_i_i_fu_959_p4;
wire   [15:0] tmp_390_i_i_fu_974_p4;
wire    ap_CS_fsm_state6;
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
end

td_fused_top_mux_416_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 64 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 64 ))
mux_416_64_1_1_U1390(
    .din0(filter_data_0_load_reg_1064),
    .din1(64'd0),
    .din2(64'd0),
    .din3(64'd0),
    .din4(16'd0),
    .dout(tmp_fu_721_p6)
);

td_fused_top_mux_416_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 64 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 64 ))
mux_416_64_1_1_U1391(
    .din0(filter_data_1_load_reg_1069),
    .din1(64'd0),
    .din2(64'd0),
    .din3(64'd0),
    .din4(16'd0),
    .dout(tmp_s_fu_743_p6)
);

td_fused_top_mux_416_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 64 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 64 ))
mux_416_64_1_1_U1392(
    .din0(filter_data_2_load_reg_1074),
    .din1(64'd0),
    .din2(64'd0),
    .din3(64'd0),
    .din4(16'd0),
    .dout(tmp_9_fu_765_p6)
);

td_fused_top_mux_416_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 64 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 64 ))
mux_416_64_1_1_U1393(
    .din0(filter_data_3_load_reg_1079),
    .din1(64'd0),
    .din2(64'd0),
    .din3(64'd0),
    .din4(16'd0),
    .dout(tmp_10_fu_787_p6)
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
        end else if ((1'b1 == ap_CS_fsm_state6)) begin
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
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_999 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_423 <= select_ln47_15_reg_1003;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_423 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten13_reg_412 <= add_ln47_8_fu_493_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_412 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_434 <= select_ln48_16_fu_614_p3;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_434 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_999 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_445 <= select_ln48_15_reg_1016;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_445 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        kk_reg_456 <= add_ln49_fu_602_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_456 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_999 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln55_18_reg_1039 <= add_ln55_18_fu_678_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln55_18_reg_1039_pp0_iter2_reg <= add_ln55_18_reg_1039;
        icmp_ln47_reg_999_pp0_iter2_reg <= icmp_ln47_reg_999_pp0_iter1_reg;
        lshr_ln_reg_1023_pp0_iter2_reg <= lshr_ln_reg_1023_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln55_reg_1010 <= add_ln55_fu_545_p2;
        lshr_ln_reg_1023 <= {{select_ln48_fu_576_p3[5:2]}};
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_999_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_0_load_reg_1064 <= filter_data_0_q0;
        filter_data_1_load_reg_1069 <= filter_data_1_q0;
        filter_data_2_load_reg_1074 <= filter_data_2_q0;
        filter_data_3_load_reg_1079 <= filter_data_3_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln47_reg_999 <= icmp_ln47_fu_499_p2;
        icmp_ln47_reg_999_pp0_iter1_reg <= icmp_ln47_reg_999;
        lshr_ln_reg_1023_pp0_iter1_reg <= lshr_ln_reg_1023;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_499_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln47_15_reg_1003 <= select_ln47_15_fu_533_p3;
        select_ln48_15_reg_1016 <= select_ln48_15_fu_584_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln47_reg_989 <= sext_ln47_fu_489_p1;
    end
end

always @ (*) begin
    if ((icmp_ln47_fu_499_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_999 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_427_p4 = select_ln47_15_reg_1003;
    end else begin
        ap_phi_mux_ii_phi_fu_427_p4 = ii_reg_423;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_999 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_449_p4 = select_ln48_15_reg_1016;
    end else begin
        ap_phi_mux_jj_phi_fu_449_p4 = jj_reg_445;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_0_ce0 = 1'b1;
    end else begin
        filter_data_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_1_ce0 = 1'b1;
    end else begin
        filter_data_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_2_ce0 = 1'b1;
    end else begin
        filter_data_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_3_ce0 = 1'b1;
    end else begin
        filter_data_3_ce0 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_1_ce0 = 1'b1;
    end else begin
        weight_vecs_0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_1_we0 = 1'b1;
    end else begin
        weight_vecs_0_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_2_ce0 = 1'b1;
    end else begin
        weight_vecs_0_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_2_we0 = 1'b1;
    end else begin
        weight_vecs_0_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_3_ce0 = 1'b1;
    end else begin
        weight_vecs_0_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_3_we0 = 1'b1;
    end else begin
        weight_vecs_0_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_0_we0 = 1'b1;
    end else begin
        weight_vecs_1_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_1_ce0 = 1'b1;
    end else begin
        weight_vecs_1_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_1_we0 = 1'b1;
    end else begin
        weight_vecs_1_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_2_ce0 = 1'b1;
    end else begin
        weight_vecs_1_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_2_we0 = 1'b1;
    end else begin
        weight_vecs_1_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_3_ce0 = 1'b1;
    end else begin
        weight_vecs_1_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_3_we0 = 1'b1;
    end else begin
        weight_vecs_1_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_0_ce0 = 1'b1;
    end else begin
        weight_vecs_2_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_0_we0 = 1'b1;
    end else begin
        weight_vecs_2_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_1_ce0 = 1'b1;
    end else begin
        weight_vecs_2_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_1_we0 = 1'b1;
    end else begin
        weight_vecs_2_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_2_ce0 = 1'b1;
    end else begin
        weight_vecs_2_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_2_we0 = 1'b1;
    end else begin
        weight_vecs_2_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_3_ce0 = 1'b1;
    end else begin
        weight_vecs_2_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_3_we0 = 1'b1;
    end else begin
        weight_vecs_2_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_0_ce0 = 1'b1;
    end else begin
        weight_vecs_3_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_0_we0 = 1'b1;
    end else begin
        weight_vecs_3_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_1_ce0 = 1'b1;
    end else begin
        weight_vecs_3_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_1_we0 = 1'b1;
    end else begin
        weight_vecs_3_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_2_ce0 = 1'b1;
    end else begin
        weight_vecs_3_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_2_we0 = 1'b1;
    end else begin
        weight_vecs_3_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_3_ce0 = 1'b1;
    end else begin
        weight_vecs_3_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_999_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_3_we0 = 1'b1;
    end else begin
        weight_vecs_3_3_we0 = 1'b0;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln47_fu_499_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln47_fu_499_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln47_8_fu_493_p2 = (indvar_flatten13_reg_412 + 8'd1);

assign add_ln47_fu_505_p2 = (ap_phi_mux_ii_phi_fu_427_p4 + 2'd1);

assign add_ln48_8_fu_608_p2 = (indvar_flatten_reg_434 + 7'd1);

assign add_ln48_fu_570_p2 = (select_ln47_fu_517_p3 + 2'd1);

assign add_ln49_fu_602_p2 = (select_ln48_fu_576_p3 + 7'd4);

assign add_ln55_17_fu_672_p2 = (sub_ln55_17_fu_639_p2 + zext_ln55_55_fu_669_p1);

assign add_ln55_18_fu_678_p2 = ((sext_ln48_fu_662_p1) + (zext_ln55_54_fu_666_p1));

assign add_ln55_fu_545_p2 = ((sext_ln47_reg_989) + (zext_ln55_52_fu_541_p1));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_0_address0 = tmp_68_fu_684_p3;

assign filter_data_1_address0 = tmp_68_fu_684_p3;

assign filter_data_2_address0 = tmp_68_fu_684_p3;

assign filter_data_3_address0 = tmp_68_fu_684_p3;

assign icmp_ln47_fu_499_p2 = ((indvar_flatten13_reg_412 == 8'd144) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_511_p2 = ((indvar_flatten_reg_434 == 7'd48) ? 1'b1 : 1'b0);

assign or_ln47_fu_564_p2 = (xor_ln49_fu_558_p2 | icmp_ln48_fu_511_p2);

assign select_ln47_14_fu_525_p3 = ((icmp_ln48_fu_511_p2[0:0] == 1'b1) ? 7'd0 : kk_reg_456);

assign select_ln47_15_fu_533_p3 = ((icmp_ln48_fu_511_p2[0:0] == 1'b1) ? add_ln47_fu_505_p2 : ap_phi_mux_ii_phi_fu_427_p4);

assign select_ln47_fu_517_p3 = ((icmp_ln48_fu_511_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_449_p4);

assign select_ln48_15_fu_584_p3 = ((or_ln47_fu_564_p2[0:0] == 1'b1) ? select_ln47_fu_517_p3 : add_ln48_fu_570_p2);

assign select_ln48_16_fu_614_p3 = ((icmp_ln48_fu_511_p2[0:0] == 1'b1) ? 7'd1 : add_ln48_8_fu_608_p2);

assign select_ln48_fu_576_p3 = ((or_ln47_fu_564_p2[0:0] == 1'b1) ? select_ln47_14_fu_525_p3 : 7'd0);

assign sext_ln47_fu_489_p1 = (sub_ln55_fu_483_p2);

assign sext_ln48_fu_662_p1 = (sub_ln55_18_fu_656_p2);

assign sext_ln55_14_fu_635_p1 = (tmp_102_fu_628_p3);

assign sext_ln55_15_fu_701_p1 = (tmp_104_fu_695_p3);

assign sext_ln55_fu_625_p1 = add_ln55_reg_1010;

assign sub_ln55_17_fu_639_p2 = ((sext_ln55_14_fu_635_p1) - (sext_ln55_fu_625_p1));

assign sub_ln55_18_fu_656_p2 = (zext_ln55_53_fu_652_p1 - zext_ln55_51_fu_622_p1);

assign sub_ln55_fu_483_p2 = (zext_ln55_50_fu_479_p1 - zext_ln55_fu_467_p1);

assign tmp_102_fu_628_p3 = {{add_ln55_reg_1010}, {2'd0}};

assign tmp_103_fu_550_p3 = kk_reg_456[32'd6];

assign tmp_104_fu_695_p3 = {{add_ln55_18_reg_1039_pp0_iter2_reg}, {lshr_ln_reg_1023_pp0_iter2_reg}};

assign tmp_368_i_i_fu_809_p4 = {{tmp_fu_721_p6[31:16]}};

assign tmp_370_i_i_fu_824_p4 = {{tmp_s_fu_743_p6[31:16]}};

assign tmp_372_i_i_fu_839_p4 = {{tmp_9_fu_765_p6[31:16]}};

assign tmp_374_i_i_fu_854_p4 = {{tmp_10_fu_787_p6[31:16]}};

assign tmp_376_i_i_fu_869_p4 = {{tmp_fu_721_p6[47:32]}};

assign tmp_378_i_i_fu_884_p4 = {{tmp_s_fu_743_p6[47:32]}};

assign tmp_380_i_i_fu_899_p4 = {{tmp_9_fu_765_p6[47:32]}};

assign tmp_382_i_i_fu_914_p4 = {{tmp_10_fu_787_p6[47:32]}};

assign tmp_384_i_i_fu_929_p4 = {{tmp_fu_721_p6[63:48]}};

assign tmp_386_i_i_fu_944_p4 = {{tmp_s_fu_743_p6[63:48]}};

assign tmp_388_i_i_fu_959_p4 = {{tmp_9_fu_765_p6[63:48]}};

assign tmp_390_i_i_fu_974_p4 = {{tmp_10_fu_787_p6[63:48]}};

assign tmp_66_fu_471_p3 = {{indices_23_dout}, {2'd0}};

assign tmp_67_fu_645_p3 = {{select_ln47_15_reg_1003}, {2'd0}};

assign tmp_68_fu_684_p3 = {{add_ln55_17_fu_672_p2}, {lshr_ln_reg_1023}};

assign trunc_ln55_23_fu_756_p1 = tmp_s_fu_743_p6[15:0];

assign trunc_ln55_24_fu_778_p1 = tmp_9_fu_765_p6[15:0];

assign trunc_ln55_25_fu_800_p1 = tmp_10_fu_787_p6[15:0];

assign trunc_ln55_fu_734_p1 = tmp_fu_721_p6[15:0];

assign weight_vecs_0_0_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_0_0_d0 = trunc_ln55_fu_734_p1;

assign weight_vecs_0_1_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_0_1_d0 = tmp_368_i_i_fu_809_p4;

assign weight_vecs_0_2_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_0_2_d0 = tmp_376_i_i_fu_869_p4;

assign weight_vecs_0_3_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_0_3_d0 = tmp_384_i_i_fu_929_p4;

assign weight_vecs_1_0_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_1_0_d0 = trunc_ln55_23_fu_756_p1;

assign weight_vecs_1_1_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_1_1_d0 = tmp_370_i_i_fu_824_p4;

assign weight_vecs_1_2_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_1_2_d0 = tmp_378_i_i_fu_884_p4;

assign weight_vecs_1_3_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_1_3_d0 = tmp_386_i_i_fu_944_p4;

assign weight_vecs_2_0_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_2_0_d0 = trunc_ln55_24_fu_778_p1;

assign weight_vecs_2_1_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_2_1_d0 = tmp_372_i_i_fu_839_p4;

assign weight_vecs_2_2_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_2_2_d0 = tmp_380_i_i_fu_899_p4;

assign weight_vecs_2_3_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_2_3_d0 = tmp_388_i_i_fu_959_p4;

assign weight_vecs_3_0_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_3_0_d0 = trunc_ln55_25_fu_800_p1;

assign weight_vecs_3_1_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_3_1_d0 = tmp_374_i_i_fu_854_p4;

assign weight_vecs_3_2_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_3_2_d0 = tmp_382_i_i_fu_914_p4;

assign weight_vecs_3_3_address0 = sext_ln55_15_fu_701_p1;

assign weight_vecs_3_3_d0 = tmp_390_i_i_fu_974_p4;

assign xor_ln49_fu_558_p2 = (tmp_103_fu_550_p3 ^ 1'd1);

assign zext_ln55_50_fu_479_p1 = tmp_66_fu_471_p3;

assign zext_ln55_51_fu_622_p1 = select_ln47_15_reg_1003;

assign zext_ln55_52_fu_541_p1 = select_ln47_15_fu_533_p3;

assign zext_ln55_53_fu_652_p1 = tmp_67_fu_645_p3;

assign zext_ln55_54_fu_666_p1 = select_ln48_15_reg_1016;

assign zext_ln55_55_fu_669_p1 = select_ln48_15_reg_1016;

assign zext_ln55_fu_467_p1 = indices_23_dout;

endmodule //td_fused_top_tdf10_readFilters70

module td_fused_top_mux_416_64_1_1 #(
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
    input  [63 : 0]     din0,
    input  [63 : 0]     din1,
    input  [63 : 0]     din2,
    input  [63 : 0]     din3,
    input  [15 : 0]    din4,
    output [63 : 0]   dout);

// puts internal signals
wire [15 : 0]     sel;
// level 1 signals
wire [63 : 0]         mux_1_0;
wire [63 : 0]         mux_1_1;
// level 2 signals
wire [63 : 0]         mux_2_0;
// level 3 signals
wire [63 : 0]         mux_3_0;
// level 4 signals
wire [63 : 0]         mux_4_0;
// level 5 signals
wire [63 : 0]         mux_5_0;
// level 6 signals
wire [63 : 0]         mux_6_0;
// level 7 signals
wire [63 : 0]         mux_7_0;
// level 8 signals
wire [63 : 0]         mux_8_0;
// level 9 signals
wire [63 : 0]         mux_9_0;
// level 10 signals
wire [63 : 0]         mux_10_0;
// level 11 signals
wire [63 : 0]         mux_11_0;
// level 12 signals
wire [63 : 0]         mux_12_0;
// level 13 signals
wire [63 : 0]         mux_13_0;
// level 14 signals
wire [63 : 0]         mux_14_0;
// level 15 signals
wire [63 : 0]         mux_15_0;
// level 16 signals
wire [63 : 0]         mux_16_0;

assign sel = din4;

// Generate level 1 logic
assign mux_1_0 = (sel[0] == 0)? din0 : din1;
assign mux_1_1 = (sel[0] == 0)? din2 : din3;

// Generate level 2 logic
assign mux_2_0 = (sel[1] == 0)? mux_1_0 : mux_1_1;

// Generate level 3 logic
assign mux_3_0 = mux_2_0;

// Generate level 4 logic
assign mux_4_0 = mux_3_0;

// Generate level 5 logic
assign mux_5_0 = mux_4_0;

// Generate level 6 logic
assign mux_6_0 = mux_5_0;

// Generate level 7 logic
assign mux_7_0 = mux_6_0;

// Generate level 8 logic
assign mux_8_0 = mux_7_0;

// Generate level 9 logic
assign mux_9_0 = mux_8_0;

// Generate level 10 logic
assign mux_10_0 = mux_9_0;

// Generate level 11 logic
assign mux_11_0 = mux_10_0;

// Generate level 12 logic
assign mux_12_0 = mux_11_0;

// Generate level 13 logic
assign mux_13_0 = mux_12_0;

// Generate level 14 logic
assign mux_14_0 = mux_13_0;

// Generate level 15 logic
assign mux_15_0 = mux_14_0;

// Generate level 16 logic
assign mux_16_0 = mux_15_0;

// output logic
assign dout = mux_16_0;

endmodule



