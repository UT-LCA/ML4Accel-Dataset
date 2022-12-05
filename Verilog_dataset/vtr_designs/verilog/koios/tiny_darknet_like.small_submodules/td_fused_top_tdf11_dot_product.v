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

module td_fused_top_tdf11_dot_product (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        ifmap_vec_address0,
        ifmap_vec_ce0,
        ifmap_vec_q0,
        weight_vecs_0_address0,
        weight_vecs_0_ce0,
        weight_vecs_0_q0,
        products_0_address0,
        products_0_ce0,
        products_0_we0,
        products_0_d0
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
output  [9:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
input  [15:0] ifmap_vec_q0;
output  [9:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
input  [15:0] weight_vecs_0_q0;
output  [9:0] products_0_address0;
output   products_0_ce0;
output   products_0_we0;
output  [15:0] products_0_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ifmap_vec_ce0;
reg weight_vecs_0_ce0;
reg products_0_ce0;
reg products_0_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [9:0] indvar_flatten17_reg_97;
reg   [8:0] indvar_flatten_reg_108;
reg   [1:0] jj_reg_119;
reg   [6:0] ic_reg_131;
reg   [1:0] ii_reg_142;
wire   [9:0] add_ln147_7_fu_157_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln147_fu_163_p2;
reg   [0:0] icmp_ln147_reg_408;
reg   [0:0] icmp_ln147_reg_408_pp0_iter1_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter2_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter3_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter4_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter5_reg;
reg   [0:0] icmp_ln147_reg_408_pp0_iter6_reg;
wire   [0:0] icmp_ln148_fu_169_p2;
reg   [0:0] icmp_ln148_reg_412;
wire   [0:0] and_ln147_fu_195_p2;
reg   [0:0] and_ln147_reg_419;
wire   [1:0] add_ln148_fu_201_p2;
reg   [1:0] add_ln148_reg_424;
wire   [6:0] select_ln148_fu_213_p3;
reg   [6:0] select_ln148_reg_429;
wire   [1:0] select_ln148_19_fu_221_p3;
reg   [1:0] select_ln148_19_reg_434;
wire   [5:0] trunc_ln150_fu_229_p1;
reg   [5:0] trunc_ln150_reg_440;
reg   [5:0] trunc_ln150_reg_440_pp0_iter1_reg;
reg   [5:0] trunc_ln150_reg_440_pp0_iter2_reg;
reg   [5:0] trunc_ln150_reg_440_pp0_iter3_reg;
reg   [5:0] trunc_ln150_reg_440_pp0_iter4_reg;
reg   [5:0] trunc_ln150_reg_440_pp0_iter5_reg;
reg   [5:0] trunc_ln150_reg_440_pp0_iter6_reg;
wire   [6:0] add_ln149_fu_233_p2;
wire   [8:0] select_ln148_21_fu_245_p3;
wire   [1:0] select_ln147_20_fu_287_p3;
reg   [1:0] select_ln147_20_reg_455;
reg    ap_enable_reg_pp0_iter1;
wire   [3:0] select_ln148_20_fu_370_p3;
reg   [3:0] select_ln148_20_reg_460;
reg   [3:0] select_ln148_20_reg_460_pp0_iter2_reg;
reg   [3:0] select_ln148_20_reg_460_pp0_iter3_reg;
reg   [3:0] select_ln148_20_reg_460_pp0_iter4_reg;
reg   [3:0] select_ln148_20_reg_460_pp0_iter5_reg;
reg   [3:0] select_ln148_20_reg_460_pp0_iter6_reg;
reg   [15:0] ifmap_vec_load_reg_475;
reg   [15:0] weight_vecs_0_load_reg_480;
wire   [15:0] grp_fu_153_p2;
reg   [15:0] mul_reg_485;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg   [1:0] ap_phi_mux_jj_phi_fu_123_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_ii_phi_fu_146_p4;
wire   [63:0] p_cast25_fu_386_p1;
wire   [63:0] idxprom30_fu_398_p1;
wire   [0:0] icmp_ln149_fu_189_p2;
wire   [0:0] xor_ln147_fu_183_p2;
wire   [1:0] select_ln147_fu_175_p3;
wire   [0:0] or_ln148_fu_207_p2;
wire   [8:0] add_ln148_7_fu_239_p2;
wire   [3:0] shl_ln_fu_257_p3;
wire   [3:0] zext_ln150_fu_253_p1;
wire   [3:0] sub_ln150_fu_265_p2;
wire   [3:0] zext_ln150_10_fu_271_p1;
wire   [1:0] add_ln147_fu_281_p2;
wire   [3:0] tmp_fu_298_p3;
wire   [3:0] select_ln147_26_cast_fu_294_p1;
wire   [3:0] shl_ln150_mid1_fu_316_p3;
wire   [3:0] zext_ln150_15_fu_312_p1;
wire   [3:0] sub_ln150_9_fu_324_p2;
wire   [3:0] add_ln150_fu_275_p2;
wire   [3:0] empty_139_fu_306_p2;
wire   [3:0] select_ln148_25_cast_fu_344_p1;
wire   [3:0] empty_140_fu_347_p2;
wire   [3:0] select_ln147_21_fu_330_p3;
wire   [3:0] zext_ln150_16_fu_361_p1;
wire   [3:0] add_ln150_8_fu_364_p2;
wire   [3:0] select_ln147_22_fu_337_p3;
wire   [9:0] tmp_178_cast_fu_353_p3;
wire   [9:0] select_ln148_cast_fu_377_p1;
wire   [9:0] empty_141_fu_380_p2;
wire   [9:0] p_fu_392_p3;
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

td_fused_top_hmul_16ns_16ns_16_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_4_max_dsp_1_U695(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_load_reg_475),
    .din1(weight_vecs_0_load_reg_480),
    .dout(grp_fu_153_p2)
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter7 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ic_reg_131 <= add_ln149_fu_233_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ic_reg_131 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ii_reg_142 <= select_ln147_20_reg_455;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_142 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten17_reg_97 <= add_ln147_7_fu_157_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten17_reg_97 <= 10'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_108 <= select_ln148_21_fu_245_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_108 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        jj_reg_119 <= select_ln148_19_reg_434;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_119 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln148_reg_424 <= add_ln148_fu_201_p2;
        and_ln147_reg_419 <= and_ln147_fu_195_p2;
        icmp_ln148_reg_412 <= icmp_ln148_fu_169_p2;
        select_ln148_reg_429 <= select_ln148_fu_213_p3;
        trunc_ln150_reg_440 <= trunc_ln150_fu_229_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln147_reg_408 <= icmp_ln147_fu_163_p2;
        icmp_ln147_reg_408_pp0_iter1_reg <= icmp_ln147_reg_408;
        trunc_ln150_reg_440_pp0_iter1_reg <= trunc_ln150_reg_440;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln147_reg_408_pp0_iter2_reg <= icmp_ln147_reg_408_pp0_iter1_reg;
        icmp_ln147_reg_408_pp0_iter3_reg <= icmp_ln147_reg_408_pp0_iter2_reg;
        icmp_ln147_reg_408_pp0_iter4_reg <= icmp_ln147_reg_408_pp0_iter3_reg;
        icmp_ln147_reg_408_pp0_iter5_reg <= icmp_ln147_reg_408_pp0_iter4_reg;
        icmp_ln147_reg_408_pp0_iter6_reg <= icmp_ln147_reg_408_pp0_iter5_reg;
        select_ln148_20_reg_460_pp0_iter2_reg <= select_ln148_20_reg_460;
        select_ln148_20_reg_460_pp0_iter3_reg <= select_ln148_20_reg_460_pp0_iter2_reg;
        select_ln148_20_reg_460_pp0_iter4_reg <= select_ln148_20_reg_460_pp0_iter3_reg;
        select_ln148_20_reg_460_pp0_iter5_reg <= select_ln148_20_reg_460_pp0_iter4_reg;
        select_ln148_20_reg_460_pp0_iter6_reg <= select_ln148_20_reg_460_pp0_iter5_reg;
        trunc_ln150_reg_440_pp0_iter2_reg <= trunc_ln150_reg_440_pp0_iter1_reg;
        trunc_ln150_reg_440_pp0_iter3_reg <= trunc_ln150_reg_440_pp0_iter2_reg;
        trunc_ln150_reg_440_pp0_iter4_reg <= trunc_ln150_reg_440_pp0_iter3_reg;
        trunc_ln150_reg_440_pp0_iter5_reg <= trunc_ln150_reg_440_pp0_iter4_reg;
        trunc_ln150_reg_440_pp0_iter6_reg <= trunc_ln150_reg_440_pp0_iter5_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_vec_load_reg_475 <= ifmap_vec_q0;
        weight_vecs_0_load_reg_480 <= weight_vecs_0_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408_pp0_iter5_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mul_reg_485 <= grp_fu_153_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        select_ln147_20_reg_455 <= select_ln147_20_fu_287_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_163_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln148_19_reg_434 <= select_ln148_19_fu_221_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln148_20_reg_460 <= select_ln148_20_fu_370_p3;
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
    if (((icmp_ln147_fu_163_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln147_reg_408_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_ii_phi_fu_146_p4 = select_ln147_20_reg_455;
    end else begin
        ap_phi_mux_ii_phi_fu_146_p4 = ii_reg_142;
    end
end

always @ (*) begin
    if (((icmp_ln147_reg_408 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_123_p4 = select_ln148_19_reg_434;
    end else begin
        ap_phi_mux_jj_phi_fu_123_p4 = jj_reg_119;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_ce0 = 1'b1;
    end else begin
        ifmap_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
        products_0_ce0 = 1'b1;
    end else begin
        products_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln147_reg_408_pp0_iter6_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
        products_0_we0 = 1'b1;
    end else begin
        products_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_ce0 = 1'b0;
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
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
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

assign add_ln147_7_fu_157_p2 = (indvar_flatten17_reg_97 + 10'd1);

assign add_ln147_fu_281_p2 = (ap_phi_mux_ii_phi_fu_146_p4 + 2'd1);

assign add_ln148_7_fu_239_p2 = (indvar_flatten_reg_108 + 9'd1);

assign add_ln148_fu_201_p2 = (select_ln147_fu_175_p3 + 2'd1);

assign add_ln149_fu_233_p2 = (select_ln148_fu_213_p3 + 7'd1);

assign add_ln150_8_fu_364_p2 = (select_ln147_21_fu_330_p3 + zext_ln150_16_fu_361_p1);

assign add_ln150_fu_275_p2 = (sub_ln150_fu_265_p2 + zext_ln150_10_fu_271_p1);

assign and_ln147_fu_195_p2 = (xor_ln147_fu_183_p2 & icmp_ln149_fu_189_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd2];

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

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign empty_139_fu_306_p2 = (tmp_fu_298_p3 - select_ln147_26_cast_fu_294_p1);

assign empty_140_fu_347_p2 = (empty_139_fu_306_p2 + select_ln148_25_cast_fu_344_p1);

assign empty_141_fu_380_p2 = (tmp_178_cast_fu_353_p3 + select_ln148_cast_fu_377_p1);

assign icmp_ln147_fu_163_p2 = ((indvar_flatten17_reg_97 == 10'd576) ? 1'b1 : 1'b0);

assign icmp_ln148_fu_169_p2 = ((indvar_flatten_reg_108 == 9'd192) ? 1'b1 : 1'b0);

assign icmp_ln149_fu_189_p2 = ((ic_reg_131 == 7'd64) ? 1'b1 : 1'b0);

assign idxprom30_fu_398_p1 = p_fu_392_p3;

assign ifmap_vec_address0 = p_cast25_fu_386_p1;

assign or_ln148_fu_207_p2 = (icmp_ln148_fu_169_p2 | and_ln147_fu_195_p2);

assign p_cast25_fu_386_p1 = empty_141_fu_380_p2;

assign p_fu_392_p3 = {{select_ln148_20_reg_460_pp0_iter6_reg}, {trunc_ln150_reg_440_pp0_iter6_reg}};

assign products_0_address0 = idxprom30_fu_398_p1;

assign products_0_d0 = mul_reg_485;

assign select_ln147_20_fu_287_p3 = ((icmp_ln148_reg_412[0:0] == 1'b1) ? add_ln147_fu_281_p2 : ap_phi_mux_ii_phi_fu_146_p4);

assign select_ln147_21_fu_330_p3 = ((icmp_ln148_reg_412[0:0] == 1'b1) ? sub_ln150_9_fu_324_p2 : sub_ln150_fu_265_p2);

assign select_ln147_22_fu_337_p3 = ((icmp_ln148_reg_412[0:0] == 1'b1) ? sub_ln150_9_fu_324_p2 : add_ln150_fu_275_p2);

assign select_ln147_26_cast_fu_294_p1 = select_ln147_20_fu_287_p3;

assign select_ln147_fu_175_p3 = ((icmp_ln148_fu_169_p2[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_123_p4);

assign select_ln148_19_fu_221_p3 = ((and_ln147_fu_195_p2[0:0] == 1'b1) ? add_ln148_fu_201_p2 : select_ln147_fu_175_p3);

assign select_ln148_20_fu_370_p3 = ((and_ln147_reg_419[0:0] == 1'b1) ? add_ln150_8_fu_364_p2 : select_ln147_22_fu_337_p3);

assign select_ln148_21_fu_245_p3 = ((icmp_ln148_fu_169_p2[0:0] == 1'b1) ? 9'd1 : add_ln148_7_fu_239_p2);

assign select_ln148_25_cast_fu_344_p1 = select_ln148_19_reg_434;

assign select_ln148_cast_fu_377_p1 = select_ln148_reg_429;

assign select_ln148_fu_213_p3 = ((or_ln148_fu_207_p2[0:0] == 1'b1) ? 7'd0 : ic_reg_131);

assign shl_ln150_mid1_fu_316_p3 = {{add_ln147_fu_281_p2}, {2'd0}};

assign shl_ln_fu_257_p3 = {{ap_phi_mux_ii_phi_fu_146_p4}, {2'd0}};

assign sub_ln150_9_fu_324_p2 = (shl_ln150_mid1_fu_316_p3 - zext_ln150_15_fu_312_p1);

assign sub_ln150_fu_265_p2 = (shl_ln_fu_257_p3 - zext_ln150_fu_253_p1);

assign tmp_178_cast_fu_353_p3 = {{empty_140_fu_347_p2}, {6'd0}};

assign tmp_fu_298_p3 = {{select_ln147_20_fu_287_p3}, {2'd0}};

assign trunc_ln150_fu_229_p1 = select_ln148_fu_213_p3[5:0];

assign weight_vecs_0_address0 = p_cast25_fu_386_p1;

assign xor_ln147_fu_183_p2 = (icmp_ln148_fu_169_p2 ^ 1'd1);

assign zext_ln150_10_fu_271_p1 = jj_reg_119;

assign zext_ln150_15_fu_312_p1 = add_ln147_fu_281_p2;

assign zext_ln150_16_fu_361_p1 = add_ln148_reg_424;

assign zext_ln150_fu_253_p1 = ap_phi_mux_ii_phi_fu_146_p4;

endmodule //td_fused_top_tdf11_dot_product

module td_fused_top_hmul_16ns_16ns_16_4_max_dsp_1
#(parameter
    ID         = 20,
    NUM_STAGE  = 4,
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
td_fused_top_ap_hmul_2_max_dsp_16 td_fused_top_ap_hmul_2_max_dsp_16_u (
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
module td_fused_top_ap_hmul_2_max_dsp_16 (
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



