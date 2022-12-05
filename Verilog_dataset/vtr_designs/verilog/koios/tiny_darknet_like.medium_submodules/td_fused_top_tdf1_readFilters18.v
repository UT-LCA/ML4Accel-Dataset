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

module td_fused_top_tdf1_readFilters18 (
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
        input_indices_23_dout,
        input_indices_23_empty_n,
        input_indices_23_read,
        weight_vecs_0_address0,
        weight_vecs_0_ce0,
        weight_vecs_0_we0,
        weight_vecs_0_d0,
        weight_vecs_1_address0,
        weight_vecs_1_ce0,
        weight_vecs_1_we0,
        weight_vecs_1_d0,
        weight_vecs_2_address0,
        weight_vecs_2_ce0,
        weight_vecs_2_we0,
        weight_vecs_2_d0,
        weight_vecs_3_address0,
        weight_vecs_3_ce0,
        weight_vecs_3_we0,
        weight_vecs_3_d0
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
output  [6:0] filter_data_0_address0;
output   filter_data_0_ce0;
input  [15:0] filter_data_0_q0;
output  [6:0] filter_data_1_address0;
output   filter_data_1_ce0;
input  [15:0] filter_data_1_q0;
output  [6:0] filter_data_2_address0;
output   filter_data_2_ce0;
input  [15:0] filter_data_2_q0;
output  [6:0] filter_data_3_address0;
output   filter_data_3_ce0;
input  [15:0] filter_data_3_q0;
input  [1:0] input_indices_23_dout;
input   input_indices_23_empty_n;
output   input_indices_23_read;
output  [4:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
output   weight_vecs_0_we0;
output  [15:0] weight_vecs_0_d0;
output  [4:0] weight_vecs_1_address0;
output   weight_vecs_1_ce0;
output   weight_vecs_1_we0;
output  [15:0] weight_vecs_1_d0;
output  [4:0] weight_vecs_2_address0;
output   weight_vecs_2_ce0;
output   weight_vecs_2_we0;
output  [15:0] weight_vecs_2_d0;
output  [4:0] weight_vecs_3_address0;
output   weight_vecs_3_ce0;
output   weight_vecs_3_we0;
output  [15:0] weight_vecs_3_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_0_ce0;
reg filter_data_1_ce0;
reg filter_data_2_ce0;
reg filter_data_3_ce0;
reg input_indices_23_read;
reg weight_vecs_0_ce0;
reg weight_vecs_0_we0;
reg weight_vecs_1_ce0;
reg weight_vecs_1_we0;
reg weight_vecs_2_ce0;
reg weight_vecs_2_we0;
reg weight_vecs_3_ce0;
reg weight_vecs_3_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    input_indices_23_blk_n;
reg   [4:0] indvar_flatten13_reg_210;
reg   [3:0] indvar_flatten_reg_221;
reg   [1:0] ii_reg_232;
reg   [1:0] jj_reg_243;
reg   [1:0] kk_reg_254;
wire   [5:0] sext_ln47_fu_287_p1;
reg   [5:0] sext_ln47_reg_602;
wire   [4:0] add_ln47_6_fu_291_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln47_fu_297_p2;
reg   [0:0] icmp_ln47_reg_612;
reg   [0:0] icmp_ln47_reg_612_pp0_iter1_reg;
reg   [0:0] icmp_ln47_reg_612_pp0_iter2_reg;
wire   [0:0] icmp_ln48_fu_303_p2;
reg   [0:0] icmp_ln48_reg_616;
wire   [3:0] select_ln48_12_fu_315_p3;
wire   [1:0] select_ln47_11_fu_336_p3;
reg   [1:0] select_ln47_11_reg_629;
reg    ap_enable_reg_pp0_iter1;
wire   [1:0] select_ln48_fu_402_p3;
reg   [1:0] select_ln48_reg_636;
wire   [1:0] select_ln48_11_fu_410_p3;
reg   [1:0] select_ln48_11_reg_642;
wire   [6:0] trunc_ln55_fu_428_p1;
reg   [6:0] trunc_ln55_reg_648;
wire   [4:0] trunc_ln55_16_fu_432_p1;
reg   [4:0] trunc_ln55_16_reg_653;
wire   [1:0] add_ln49_fu_436_p2;
wire   [4:0] add_ln55_14_fu_529_p2;
reg   [4:0] add_ln55_14_reg_683;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg   [1:0] ap_phi_mux_ii_phi_fu_236_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_247_p4;
wire   [63:0] zext_ln55_42_fu_521_p1;
wire   [63:0] zext_ln55_43_fu_535_p1;
wire   [15:0] tmp_fu_542_p6;
wire   [15:0] tmp_s_fu_557_p6;
wire   [15:0] tmp_5_fu_572_p6;
wire   [15:0] tmp_6_fu_587_p6;
wire   [3:0] tmp_52_fu_269_p3;
wire   [4:0] zext_ln55_34_fu_277_p1;
wire   [4:0] zext_ln55_fu_265_p1;
wire   [4:0] sub_ln55_fu_281_p2;
wire   [3:0] add_ln48_6_fu_309_p2;
wire   [1:0] add_ln47_fu_323_p2;
wire   [5:0] zext_ln55_36_fu_343_p1;
wire   [5:0] add_ln55_fu_347_p2;
wire   [7:0] tmp_77_fu_356_p3;
wire   [61:0] sext_ln55_11_fu_364_p1;
wire   [61:0] sext_ln55_fu_352_p1;
wire   [0:0] icmp_ln49_fu_379_p2;
wire   [0:0] xor_ln47_fu_374_p2;
wire   [1:0] select_ln47_fu_329_p3;
wire   [0:0] and_ln47_fu_385_p2;
wire   [0:0] or_ln48_fu_397_p2;
wire   [1:0] add_ln48_fu_391_p2;
wire   [61:0] sub_ln55_11_fu_368_p2;
wire   [61:0] zext_ln55_39_fu_418_p1;
wire   [61:0] add_ln55_11_fu_422_p2;
wire   [3:0] tmp_53_fu_445_p3;
wire   [4:0] zext_ln55_37_fu_452_p1;
wire   [4:0] zext_ln55_35_fu_442_p1;
wire   [4:0] sub_ln55_12_fu_456_p2;
wire   [6:0] p_shl2_cast_fu_469_p3;
wire   [5:0] sext_ln48_fu_462_p1;
wire   [5:0] zext_ln55_38_fu_466_p1;
wire   [5:0] add_ln55_12_fu_481_p2;
wire   [2:0] trunc_ln55_18_fu_491_p1;
wire   [4:0] p_shl1_cast_fu_495_p3;
wire   [4:0] trunc_ln55_17_fu_487_p1;
wire   [6:0] sub_ln55_13_fu_476_p2;
wire   [6:0] zext_ln55_41_fu_512_p1;
wire   [6:0] add_ln55_13_fu_515_p2;
wire   [4:0] sub_ln55_14_fu_503_p2;
wire   [4:0] zext_ln55_40_fu_509_p1;
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

td_fused_top_mux_416_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mux_416_16_1_1_U17(
    .din0(filter_data_0_q0),
    .din1(16'd0),
    .din2(16'd0),
    .din3(16'd0),
    .din4(16'd0),
    .dout(tmp_fu_542_p6)
);

td_fused_top_mux_416_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mux_416_16_1_1_U18(
    .din0(filter_data_1_q0),
    .din1(16'd0),
    .din2(16'd0),
    .din3(16'd0),
    .din4(16'd0),
    .dout(tmp_s_fu_557_p6)
);

td_fused_top_mux_416_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mux_416_16_1_1_U19(
    .din0(filter_data_2_q0),
    .din1(16'd0),
    .din2(16'd0),
    .din3(16'd0),
    .din4(16'd0),
    .dout(tmp_5_fu_572_p6)
);

td_fused_top_mux_416_16_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
mux_416_16_1_1_U20(
    .din0(filter_data_3_q0),
    .din1(16'd0),
    .din2(16'd0),
    .din3(16'd0),
    .din4(16'd0),
    .dout(tmp_6_fu_587_p6)
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
        if ((1'b1 == ap_condition_pp0_flush_enable)) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
        end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ii_reg_232 <= select_ln47_11_reg_629;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_232 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_297_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten13_reg_210 <= add_ln47_6_fu_291_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_210 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_297_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        indvar_flatten_reg_221 <= select_ln48_12_fu_315_p3;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_221 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        jj_reg_243 <= select_ln48_11_reg_642;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_243 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_612 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        kk_reg_254 <= add_ln49_fu_436_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_254 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        add_ln55_14_reg_683 <= add_ln55_14_fu_529_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln47_reg_612 <= icmp_ln47_fu_297_p2;
        icmp_ln47_reg_612_pp0_iter1_reg <= icmp_ln47_reg_612;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln47_reg_612_pp0_iter2_reg <= icmp_ln47_reg_612_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_297_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln48_reg_616 <= icmp_ln48_fu_303_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_612 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln47_11_reg_629 <= select_ln47_11_fu_336_p3;
        select_ln48_11_reg_642 <= select_ln48_11_fu_410_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_reg_612 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln48_reg_636 <= select_ln48_fu_402_p3;
        trunc_ln55_16_reg_653 <= trunc_ln55_16_fu_432_p1;
        trunc_ln55_reg_648 <= trunc_ln55_fu_428_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln47_reg_602 <= sext_ln47_fu_287_p1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_condition_pp0_exit_iter1_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter1_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln47_fu_297_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
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
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_236_p4 = select_ln47_11_reg_629;
    end else begin
        ap_phi_mux_ii_phi_fu_236_p4 = ii_reg_232;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln47_reg_612_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_jj_phi_fu_247_p4 = select_ln48_11_reg_642;
    end else begin
        ap_phi_mux_jj_phi_fu_247_p4 = jj_reg_243;
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
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_0_ce0 = 1'b1;
    end else begin
        filter_data_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_1_ce0 = 1'b1;
    end else begin
        filter_data_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_2_ce0 = 1'b1;
    end else begin
        filter_data_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        filter_data_3_ce0 = 1'b1;
    end else begin
        filter_data_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_23_blk_n = input_indices_23_empty_n;
    end else begin
        input_indices_23_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_23_read = 1'b1;
    end else begin
        input_indices_23_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_612_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_ce0 = 1'b1;
    end else begin
        weight_vecs_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_612_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_1_we0 = 1'b1;
    end else begin
        weight_vecs_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_ce0 = 1'b1;
    end else begin
        weight_vecs_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_612_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_2_we0 = 1'b1;
    end else begin
        weight_vecs_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_ce0 = 1'b1;
    end else begin
        weight_vecs_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (icmp_ln47_reg_612_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        weight_vecs_3_we0 = 1'b1;
    end else begin
        weight_vecs_3_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)) & ~((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0)))) begin
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

assign add_ln47_6_fu_291_p2 = (indvar_flatten13_reg_210 + 5'd1);

assign add_ln47_fu_323_p2 = (ap_phi_mux_ii_phi_fu_236_p4 + 2'd1);

assign add_ln48_6_fu_309_p2 = (indvar_flatten_reg_221 + 4'd1);

assign add_ln48_fu_391_p2 = (select_ln47_fu_329_p3 + 2'd1);

assign add_ln49_fu_436_p2 = (select_ln48_fu_402_p3 + 2'd1);

assign add_ln55_11_fu_422_p2 = (sub_ln55_11_fu_368_p2 + zext_ln55_39_fu_418_p1);

assign add_ln55_12_fu_481_p2 = ((sext_ln48_fu_462_p1) + (zext_ln55_38_fu_466_p1));

assign add_ln55_13_fu_515_p2 = (sub_ln55_13_fu_476_p2 + zext_ln55_41_fu_512_p1);

assign add_ln55_14_fu_529_p2 = (sub_ln55_14_fu_503_p2 + zext_ln55_40_fu_509_p1);

assign add_ln55_fu_347_p2 = ((sext_ln47_reg_602) + (zext_ln55_36_fu_343_p1));

assign and_ln47_fu_385_p2 = (xor_ln47_fu_374_p2 & icmp_ln49_fu_379_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_0_address0 = zext_ln55_42_fu_521_p1;

assign filter_data_1_address0 = zext_ln55_42_fu_521_p1;

assign filter_data_2_address0 = zext_ln55_42_fu_521_p1;

assign filter_data_3_address0 = zext_ln55_42_fu_521_p1;

assign icmp_ln47_fu_297_p2 = ((indvar_flatten13_reg_210 == 5'd27) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_303_p2 = ((indvar_flatten_reg_221 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln49_fu_379_p2 = ((kk_reg_254 == 2'd3) ? 1'b1 : 1'b0);

assign or_ln48_fu_397_p2 = (icmp_ln48_reg_616 | and_ln47_fu_385_p2);

assign p_shl1_cast_fu_495_p3 = {{trunc_ln55_18_fu_491_p1}, {2'd0}};

assign p_shl2_cast_fu_469_p3 = {{trunc_ln55_16_reg_653}, {2'd0}};

assign select_ln47_11_fu_336_p3 = ((icmp_ln48_reg_616[0:0] == 1'b1) ? add_ln47_fu_323_p2 : ap_phi_mux_ii_phi_fu_236_p4);

assign select_ln47_fu_329_p3 = ((icmp_ln48_reg_616[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_247_p4);

assign select_ln48_11_fu_410_p3 = ((and_ln47_fu_385_p2[0:0] == 1'b1) ? add_ln48_fu_391_p2 : select_ln47_fu_329_p3);

assign select_ln48_12_fu_315_p3 = ((icmp_ln48_fu_303_p2[0:0] == 1'b1) ? 4'd1 : add_ln48_6_fu_309_p2);

assign select_ln48_fu_402_p3 = ((or_ln48_fu_397_p2[0:0] == 1'b1) ? 2'd0 : kk_reg_254);

assign sext_ln47_fu_287_p1 = (sub_ln55_fu_281_p2);

assign sext_ln48_fu_462_p1 = (sub_ln55_12_fu_456_p2);

assign sext_ln55_11_fu_364_p1 = (tmp_77_fu_356_p3);

assign sext_ln55_fu_352_p1 = add_ln55_fu_347_p2;

assign sub_ln55_11_fu_368_p2 = ((sext_ln55_11_fu_364_p1) - (sext_ln55_fu_352_p1));

assign sub_ln55_12_fu_456_p2 = (zext_ln55_37_fu_452_p1 - zext_ln55_35_fu_442_p1);

assign sub_ln55_13_fu_476_p2 = (p_shl2_cast_fu_469_p3 - trunc_ln55_reg_648);

assign sub_ln55_14_fu_503_p2 = (p_shl1_cast_fu_495_p3 - trunc_ln55_17_fu_487_p1);

assign sub_ln55_fu_281_p2 = (zext_ln55_34_fu_277_p1 - zext_ln55_fu_265_p1);

assign tmp_52_fu_269_p3 = {{input_indices_23_dout}, {2'd0}};

assign tmp_53_fu_445_p3 = {{select_ln47_11_reg_629}, {2'd0}};

assign tmp_77_fu_356_p3 = {{add_ln55_fu_347_p2}, {2'd0}};

assign trunc_ln55_16_fu_432_p1 = add_ln55_11_fu_422_p2[4:0];

assign trunc_ln55_17_fu_487_p1 = add_ln55_12_fu_481_p2[4:0];

assign trunc_ln55_18_fu_491_p1 = add_ln55_12_fu_481_p2[2:0];

assign trunc_ln55_fu_428_p1 = add_ln55_11_fu_422_p2[6:0];

assign weight_vecs_0_address0 = zext_ln55_43_fu_535_p1;

assign weight_vecs_0_d0 = tmp_fu_542_p6;

assign weight_vecs_1_address0 = zext_ln55_43_fu_535_p1;

assign weight_vecs_1_d0 = tmp_s_fu_557_p6;

assign weight_vecs_2_address0 = zext_ln55_43_fu_535_p1;

assign weight_vecs_2_d0 = tmp_5_fu_572_p6;

assign weight_vecs_3_address0 = zext_ln55_43_fu_535_p1;

assign weight_vecs_3_d0 = tmp_6_fu_587_p6;

assign xor_ln47_fu_374_p2 = (icmp_ln48_reg_616 ^ 1'd1);

assign zext_ln55_34_fu_277_p1 = tmp_52_fu_269_p3;

assign zext_ln55_35_fu_442_p1 = select_ln47_11_reg_629;

assign zext_ln55_36_fu_343_p1 = select_ln47_11_fu_336_p3;

assign zext_ln55_37_fu_452_p1 = tmp_53_fu_445_p3;

assign zext_ln55_38_fu_466_p1 = select_ln48_11_reg_642;

assign zext_ln55_39_fu_418_p1 = select_ln48_11_fu_410_p3;

assign zext_ln55_40_fu_509_p1 = select_ln48_reg_636;

assign zext_ln55_41_fu_512_p1 = select_ln48_reg_636;

assign zext_ln55_42_fu_521_p1 = add_ln55_13_fu_515_p2;

assign zext_ln55_43_fu_535_p1 = add_ln55_14_reg_683;

assign zext_ln55_fu_265_p1 = input_indices_23_dout;

endmodule //td_fused_top_tdf1_readFilters18
module td_fused_top_mux_416_16_1_1 #(
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
    input  [15 : 0]    din4,
    output [15 : 0]   dout);

// puts internal signals
wire [15 : 0]     sel;
// level 1 signals
wire [15 : 0]         mux_1_0;
wire [15 : 0]         mux_1_1;
// level 2 signals
wire [15 : 0]         mux_2_0;
// level 3 signals
wire [15 : 0]         mux_3_0;
// level 4 signals
wire [15 : 0]         mux_4_0;
// level 5 signals
wire [15 : 0]         mux_5_0;
// level 6 signals
wire [15 : 0]         mux_6_0;
// level 7 signals
wire [15 : 0]         mux_7_0;
// level 8 signals
wire [15 : 0]         mux_8_0;
// level 9 signals
wire [15 : 0]         mux_9_0;
// level 10 signals
wire [15 : 0]         mux_10_0;
// level 11 signals
wire [15 : 0]         mux_11_0;
// level 12 signals
wire [15 : 0]         mux_12_0;
// level 13 signals
wire [15 : 0]         mux_13_0;
// level 14 signals
wire [15 : 0]         mux_14_0;
// level 15 signals
wire [15 : 0]         mux_15_0;
// level 16 signals
wire [15 : 0]         mux_16_0;

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
