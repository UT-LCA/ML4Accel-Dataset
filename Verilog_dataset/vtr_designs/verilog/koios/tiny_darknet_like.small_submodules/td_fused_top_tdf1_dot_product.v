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

module td_fused_top_tdf1_dot_product (
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
parameter    ap_ST_fsm_state8 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [4:0] ifmap_vec_address0;
output   ifmap_vec_ce0;
input  [15:0] ifmap_vec_q0;
output  [4:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
input  [15:0] weight_vecs_0_q0;
output  [4:0] products_0_address0;
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
reg   [4:0] indvar_flatten21_reg_93;
reg   [1:0] ii_reg_104;
reg   [3:0] indvar_flatten_reg_116;
reg   [1:0] jj_reg_127;
reg   [1:0] ic_reg_138;
wire   [4:0] add_ln147_6_fu_156_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln147_fu_162_p2;
reg   [0:0] icmp_ln147_reg_466;
reg   [0:0] icmp_ln147_reg_466_pp0_iter1_reg;
reg   [0:0] icmp_ln147_reg_466_pp0_iter2_reg;
reg   [0:0] icmp_ln147_reg_466_pp0_iter3_reg;
reg   [0:0] icmp_ln147_reg_466_pp0_iter4_reg;
wire   [1:0] add_ln147_fu_168_p2;
reg   [1:0] add_ln147_reg_470;
wire   [0:0] icmp_ln148_fu_174_p2;
reg   [0:0] icmp_ln148_reg_476;
wire   [1:0] select_ln147_17_fu_180_p3;
reg   [1:0] select_ln147_17_reg_485;
wire   [3:0] select_ln148_18_fu_194_p3;
wire   [1:0] select_ln148_16_fu_359_p3;
reg   [1:0] select_ln148_16_reg_497;
reg    ap_enable_reg_pp0_iter1;
wire   [4:0] p_fu_445_p2;
reg   [4:0] p_reg_512;
reg   [4:0] p_reg_512_pp0_iter2_reg;
reg   [4:0] p_reg_512_pp0_iter3_reg;
reg   [4:0] p_reg_512_pp0_iter4_reg;
wire   [1:0] add_ln149_fu_451_p2;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg   [1:0] ap_phi_mux_ii_phi_fu_108_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_131_p4;
wire   [63:0] p_cast27_fu_439_p1;
wire   [63:0] idxprom30_fu_457_p1;
wire   [15:0] grp_fu_149_p2;
wire   [3:0] add_ln148_6_fu_188_p2;
wire   [3:0] shl_ln_fu_206_p3;
wire   [4:0] zext_ln150_7_fu_214_p1;
wire   [4:0] zext_ln150_fu_202_p1;
wire   [4:0] sub_ln150_fu_218_p2;
wire   [4:0] zext_ln150_8_fu_224_p1;
wire   [4:0] add_ln150_fu_228_p2;
wire   [4:0] shl_ln150_fu_234_p2;
wire   [3:0] tmp_s_fu_256_p3;
wire   [4:0] tmp_145_cast_fu_263_p1;
wire   [4:0] select_ln147_22_cast_fu_253_p1;
wire   [4:0] empty_122_fu_267_p2;
wire   [3:0] shl_ln150_mid1_fu_280_p3;
wire   [4:0] zext_ln150_13_fu_287_p1;
wire   [4:0] zext_ln150_12_fu_277_p1;
wire   [4:0] sub_ln150_6_fu_291_p2;
wire   [4:0] shl_ln150_1_fu_304_p2;
wire   [4:0] sub_ln150_7_fu_310_p2;
wire   [4:0] sub_ln150_1_fu_240_p2;
wire   [0:0] icmp_ln149_fu_328_p2;
wire   [0:0] xor_ln147_fu_323_p2;
wire   [1:0] select_ln147_fu_246_p3;
wire   [0:0] and_ln147_fu_334_p2;
wire   [0:0] or_ln148_fu_346_p2;
wire   [1:0] add_ln148_fu_340_p2;
wire   [5:0] sext_ln150_fu_273_p1;
wire   [5:0] select_ln148_21_cast_fu_367_p1;
wire   [5:0] empty_123_fu_371_p2;
wire   [2:0] empty_125_fu_381_p1;
wire   [4:0] p_shl_cast_fu_385_p3;
wire   [4:0] empty_124_fu_377_p1;
wire   [4:0] select_ln147_18_fu_297_p3;
wire   [4:0] zext_ln150_14_fu_399_p1;
wire   [4:0] add_ln150_6_fu_403_p2;
wire   [4:0] shl_ln150_2_fu_409_p2;
wire   [4:0] sub_ln150_8_fu_415_p2;
wire   [4:0] select_ln147_19_fu_316_p3;
wire   [1:0] select_ln148_fu_351_p3;
wire   [4:0] empty_126_fu_393_p2;
wire   [4:0] select_ln148_cast_fu_429_p1;
wire   [4:0] empty_127_fu_433_p2;
wire   [4:0] select_ln148_17_fu_421_p3;
wire    ap_CS_fsm_state8;
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
end

td_fused_top_hmul_16ns_16ns_16_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 16 ))
hmul_16ns_16ns_16_4_max_dsp_1_U20(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .din0(ifmap_vec_q0),
    .din1(weight_vecs_0_q0),
    .dout(grp_fu_149_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state8)) begin
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
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter5 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln147_reg_466 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ic_reg_138 <= add_ln149_fu_451_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ic_reg_138 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln147_reg_466 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ii_reg_104 <= select_ln147_17_reg_485;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_104 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_162_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten21_reg_93 <= add_ln147_6_fu_156_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten21_reg_93 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_162_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_116 <= select_ln148_18_fu_194_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_116 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_466_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        jj_reg_127 <= select_ln148_16_reg_497;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_127 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_162_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln147_reg_470 <= add_ln147_fu_168_p2;
        icmp_ln148_reg_476 <= icmp_ln148_fu_174_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln147_reg_466 <= icmp_ln147_fu_162_p2;
        icmp_ln147_reg_466_pp0_iter1_reg <= icmp_ln147_reg_466;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln147_reg_466_pp0_iter2_reg <= icmp_ln147_reg_466_pp0_iter1_reg;
        icmp_ln147_reg_466_pp0_iter3_reg <= icmp_ln147_reg_466_pp0_iter2_reg;
        icmp_ln147_reg_466_pp0_iter4_reg <= icmp_ln147_reg_466_pp0_iter3_reg;
        p_reg_512_pp0_iter2_reg <= p_reg_512;
        p_reg_512_pp0_iter3_reg <= p_reg_512_pp0_iter2_reg;
        p_reg_512_pp0_iter4_reg <= p_reg_512_pp0_iter3_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_reg_466 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_reg_512 <= p_fu_445_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln147_fu_162_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln147_17_reg_485 <= select_ln147_17_fu_180_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln147_reg_466 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln148_16_reg_497 <= select_ln148_16_fu_359_p3;
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
    if (((icmp_ln147_fu_162_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_pp0_flush_enable = 1'b1;
    end else begin
        ap_condition_pp0_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln147_reg_466 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_108_p4 = select_ln147_17_reg_485;
    end else begin
        ap_phi_mux_ii_phi_fu_108_p4 = ii_reg_104;
    end
end

always @ (*) begin
    if (((icmp_ln147_reg_466_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_131_p4 = select_ln148_16_reg_497;
    end else begin
        ap_phi_mux_jj_phi_fu_131_p4 = jj_reg_127;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ifmap_vec_ce0 = 1'b1;
    end else begin
        ifmap_vec_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        products_0_ce0 = 1'b1;
    end else begin
        products_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln147_reg_466_pp0_iter4_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        products_0_we0 = 1'b1;
    end else begin
        products_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln147_6_fu_156_p2 = (indvar_flatten21_reg_93 + 5'd1);

assign add_ln147_fu_168_p2 = (ap_phi_mux_ii_phi_fu_108_p4 + 2'd1);

assign add_ln148_6_fu_188_p2 = (indvar_flatten_reg_116 + 4'd1);

assign add_ln148_fu_340_p2 = (select_ln147_fu_246_p3 + 2'd1);

assign add_ln149_fu_451_p2 = (select_ln148_fu_351_p3 + 2'd1);

assign add_ln150_6_fu_403_p2 = (select_ln147_18_fu_297_p3 + zext_ln150_14_fu_399_p1);

assign add_ln150_fu_228_p2 = (sub_ln150_fu_218_p2 + zext_ln150_8_fu_224_p1);

assign and_ln147_fu_334_p2 = (xor_ln147_fu_323_p2 & icmp_ln149_fu_328_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd2];

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

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign empty_122_fu_267_p2 = (tmp_145_cast_fu_263_p1 - select_ln147_22_cast_fu_253_p1);

assign empty_123_fu_371_p2 = ((sext_ln150_fu_273_p1) + (select_ln148_21_cast_fu_367_p1));

assign empty_124_fu_377_p1 = empty_123_fu_371_p2[4:0];

assign empty_125_fu_381_p1 = empty_123_fu_371_p2[2:0];

assign empty_126_fu_393_p2 = (p_shl_cast_fu_385_p3 - empty_124_fu_377_p1);

assign empty_127_fu_433_p2 = (empty_126_fu_393_p2 + select_ln148_cast_fu_429_p1);

assign icmp_ln147_fu_162_p2 = ((indvar_flatten21_reg_93 == 5'd27) ? 1'b1 : 1'b0);

assign icmp_ln148_fu_174_p2 = ((indvar_flatten_reg_116 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln149_fu_328_p2 = ((ic_reg_138 == 2'd3) ? 1'b1 : 1'b0);

assign idxprom30_fu_457_p1 = p_reg_512_pp0_iter4_reg;

assign ifmap_vec_address0 = p_cast27_fu_439_p1;

assign or_ln148_fu_346_p2 = (icmp_ln148_reg_476 | and_ln147_fu_334_p2);

assign p_cast27_fu_439_p1 = empty_127_fu_433_p2;

assign p_fu_445_p2 = (select_ln148_17_fu_421_p3 + select_ln148_cast_fu_429_p1);

assign p_shl_cast_fu_385_p3 = {{empty_125_fu_381_p1}, {2'd0}};

assign products_0_address0 = idxprom30_fu_457_p1;

assign products_0_d0 = grp_fu_149_p2;

assign select_ln147_17_fu_180_p3 = ((icmp_ln148_fu_174_p2[0:0] == 1'b1) ? add_ln147_fu_168_p2 : ap_phi_mux_ii_phi_fu_108_p4);

assign select_ln147_18_fu_297_p3 = ((icmp_ln148_reg_476[0:0] == 1'b1) ? sub_ln150_6_fu_291_p2 : sub_ln150_fu_218_p2);

assign select_ln147_19_fu_316_p3 = ((icmp_ln148_reg_476[0:0] == 1'b1) ? sub_ln150_7_fu_310_p2 : sub_ln150_1_fu_240_p2);

assign select_ln147_22_cast_fu_253_p1 = select_ln147_17_reg_485;

assign select_ln147_fu_246_p3 = ((icmp_ln148_reg_476[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_131_p4);

assign select_ln148_16_fu_359_p3 = ((and_ln147_fu_334_p2[0:0] == 1'b1) ? add_ln148_fu_340_p2 : select_ln147_fu_246_p3);

assign select_ln148_17_fu_421_p3 = ((and_ln147_fu_334_p2[0:0] == 1'b1) ? sub_ln150_8_fu_415_p2 : select_ln147_19_fu_316_p3);

assign select_ln148_18_fu_194_p3 = ((icmp_ln148_fu_174_p2[0:0] == 1'b1) ? 4'd1 : add_ln148_6_fu_188_p2);

assign select_ln148_21_cast_fu_367_p1 = select_ln148_16_fu_359_p3;

assign select_ln148_cast_fu_429_p1 = select_ln148_fu_351_p3;

assign select_ln148_fu_351_p3 = ((or_ln148_fu_346_p2[0:0] == 1'b1) ? 2'd0 : ic_reg_138);

assign sext_ln150_fu_273_p1 = (empty_122_fu_267_p2);

assign shl_ln150_1_fu_304_p2 = sub_ln150_6_fu_291_p2 << 5'd2;

assign shl_ln150_2_fu_409_p2 = add_ln150_6_fu_403_p2 << 5'd2;

assign shl_ln150_fu_234_p2 = add_ln150_fu_228_p2 << 5'd2;

assign shl_ln150_mid1_fu_280_p3 = {{add_ln147_reg_470}, {2'd0}};

assign shl_ln_fu_206_p3 = {{ii_reg_104}, {2'd0}};

assign sub_ln150_1_fu_240_p2 = (shl_ln150_fu_234_p2 - add_ln150_fu_228_p2);

assign sub_ln150_6_fu_291_p2 = (zext_ln150_13_fu_287_p1 - zext_ln150_12_fu_277_p1);

assign sub_ln150_7_fu_310_p2 = (shl_ln150_1_fu_304_p2 - sub_ln150_6_fu_291_p2);

assign sub_ln150_8_fu_415_p2 = (shl_ln150_2_fu_409_p2 - add_ln150_6_fu_403_p2);

assign sub_ln150_fu_218_p2 = (zext_ln150_7_fu_214_p1 - zext_ln150_fu_202_p1);

assign tmp_145_cast_fu_263_p1 = tmp_s_fu_256_p3;

assign tmp_s_fu_256_p3 = {{select_ln147_17_reg_485}, {2'd0}};

assign weight_vecs_0_address0 = p_cast27_fu_439_p1;

assign xor_ln147_fu_323_p2 = (icmp_ln148_reg_476 ^ 1'd1);

assign zext_ln150_12_fu_277_p1 = add_ln147_reg_470;

assign zext_ln150_13_fu_287_p1 = shl_ln150_mid1_fu_280_p3;

assign zext_ln150_14_fu_399_p1 = add_ln148_fu_340_p2;

assign zext_ln150_7_fu_214_p1 = shl_ln_fu_206_p3;

assign zext_ln150_8_fu_224_p1 = ap_phi_mux_jj_phi_fu_131_p4;

assign zext_ln150_fu_202_p1 = ii_reg_104;

endmodule //td_fused_top_tdf1_dot_product

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



