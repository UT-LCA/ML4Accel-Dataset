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
        filter_data_address0,
        filter_data_ce0,
        filter_data_q0,
        input_indices_23_dout,
        input_indices_23_empty_n,
        input_indices_23_read,
        weight_vecs_0_address0,
        weight_vecs_0_ce0,
        weight_vecs_0_we0,
        weight_vecs_0_d0
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
output  [8:0] filter_data_address0;
output   filter_data_ce0;
input  [15:0] filter_data_q0;
input  [3:0] input_indices_23_dout;
input   input_indices_23_empty_n;
output   input_indices_23_read;
output  [4:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
output   weight_vecs_0_we0;
output  [15:0] weight_vecs_0_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_ce0;
reg input_indices_23_read;
reg weight_vecs_0_ce0;
reg weight_vecs_0_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    input_indices_23_blk_n;
reg   [4:0] indvar_flatten13_reg_117;
reg   [1:0] ii_reg_128;
reg   [3:0] indvar_flatten_reg_139;
reg   [1:0] jj_reg_150;
reg   [1:0] kk_reg_161;
wire   [7:0] sext_ln47_fu_194_p1;
reg   [7:0] sext_ln47_reg_448;
wire   [4:0] add_ln47_6_fu_198_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln47_fu_204_p2;
reg   [0:0] icmp_ln47_reg_458;
reg   [0:0] icmp_ln47_reg_458_pp0_iter1_reg;
reg   [0:0] icmp_ln47_reg_458_pp0_iter2_reg;
reg   [0:0] icmp_ln47_reg_458_pp0_iter3_reg;
wire   [0:0] icmp_ln48_fu_216_p2;
reg   [0:0] icmp_ln48_reg_462;
wire   [1:0] select_ln47_6_fu_222_p3;
reg   [1:0] select_ln47_6_reg_469;
wire   [3:0] select_ln48_12_fu_236_p3;
wire   [1:0] select_ln48_11_fu_341_p3;
reg   [1:0] select_ln48_11_reg_482;
reg    ap_enable_reg_pp0_iter1;
wire   [4:0] add_ln55_24_fu_432_p2;
reg   [4:0] add_ln55_24_reg_492;
reg   [4:0] add_ln55_24_reg_492_pp0_iter2_reg;
reg   [4:0] add_ln55_24_reg_492_pp0_iter3_reg;
wire   [1:0] add_ln49_fu_438_p2;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg   [1:0] ap_phi_mux_ii_phi_fu_132_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_154_p4;
wire   [63:0] zext_ln55_57_fu_427_p1;
wire   [63:0] zext_ln55_58_fu_444_p1;
wire   [5:0] tmp_fu_176_p3;
wire   [6:0] zext_ln55_49_fu_184_p1;
wire   [6:0] zext_ln55_fu_172_p1;
wire   [6:0] sub_ln55_fu_188_p2;
wire   [1:0] add_ln47_fu_210_p2;
wire   [3:0] add_ln48_6_fu_230_p2;
wire   [7:0] zext_ln55_51_fu_254_p1;
wire   [7:0] add_ln55_fu_257_p2;
wire   [9:0] tmp_46_fu_266_p3;
wire   [61:0] sext_ln55_1_fu_274_p1;
wire   [61:0] sext_ln55_fu_262_p1;
wire   [3:0] tmp_s_fu_284_p3;
wire   [4:0] zext_ln55_52_fu_291_p1;
wire   [4:0] zext_ln55_50_fu_251_p1;
wire   [4:0] sub_ln55_12_fu_295_p2;
wire   [0:0] icmp_ln49_fu_310_p2;
wire   [0:0] xor_ln47_fu_305_p2;
wire   [1:0] select_ln47_fu_244_p3;
wire   [0:0] and_ln47_fu_316_p2;
wire   [0:0] or_ln48_fu_328_p2;
wire   [1:0] add_ln48_fu_322_p2;
wire   [61:0] sub_ln55_11_fu_278_p2;
wire   [61:0] zext_ln55_54_fu_353_p1;
wire   [61:0] add_ln55_21_fu_357_p2;
wire   [6:0] trunc_ln55_1_fu_367_p1;
wire   [8:0] p_shl2_cast_fu_371_p3;
wire   [8:0] trunc_ln55_fu_363_p1;
wire   [5:0] sext_ln48_fu_301_p1;
wire   [5:0] zext_ln55_53_fu_349_p1;
wire   [5:0] add_ln55_22_fu_385_p2;
wire   [2:0] trunc_ln55_3_fu_395_p1;
wire   [4:0] p_shl1_cast_fu_399_p3;
wire   [4:0] trunc_ln55_2_fu_391_p1;
wire   [1:0] select_ln48_fu_333_p3;
wire   [8:0] sub_ln55_13_fu_379_p2;
wire   [8:0] zext_ln55_56_fu_417_p1;
wire   [8:0] add_ln55_23_fu_421_p2;
wire   [4:0] sub_ln55_14_fu_407_p2;
wire   [4:0] zext_ln55_55_fu_413_p1;
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
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_458 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ii_reg_128 <= select_ln47_6_reg_469;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_128 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_204_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten13_reg_117 <= add_ln47_6_fu_198_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_117 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_204_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_139 <= select_ln48_12_fu_236_p3;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_139 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_458_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        jj_reg_150 <= select_ln48_11_reg_482;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_150 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_458 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_reg_161 <= add_ln49_fu_438_p2;
    end else if ((~((ap_start == 1'b0) | (input_indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_161 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_458 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln55_24_reg_492 <= add_ln55_24_fu_432_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln55_24_reg_492_pp0_iter2_reg <= add_ln55_24_reg_492;
        add_ln55_24_reg_492_pp0_iter3_reg <= add_ln55_24_reg_492_pp0_iter2_reg;
        icmp_ln47_reg_458_pp0_iter2_reg <= icmp_ln47_reg_458_pp0_iter1_reg;
        icmp_ln47_reg_458_pp0_iter3_reg <= icmp_ln47_reg_458_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln47_reg_458 <= icmp_ln47_fu_204_p2;
        icmp_ln47_reg_458_pp0_iter1_reg <= icmp_ln47_reg_458;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_204_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln48_reg_462 <= icmp_ln48_fu_216_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_204_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln47_6_reg_469 <= select_ln47_6_fu_222_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_458 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln48_11_reg_482 <= select_ln48_11_fu_341_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln47_reg_448 <= sext_ln47_fu_194_p1;
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
    if (((icmp_ln47_fu_204_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_458 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_132_p4 = select_ln47_6_reg_469;
    end else begin
        ap_phi_mux_ii_phi_fu_132_p4 = ii_reg_128;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_458_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_154_p4 = select_ln48_11_reg_482;
    end else begin
        ap_phi_mux_jj_phi_fu_154_p4 = jj_reg_150;
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
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        filter_data_ce0 = 1'b1;
    end else begin
        filter_data_ce0 = 1'b0;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        weight_vecs_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_458_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        weight_vecs_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_we0 = 1'b0;
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
            if ((~((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0)))) begin
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

assign add_ln47_6_fu_198_p2 = (indvar_flatten13_reg_117 + 5'd1);

assign add_ln47_fu_210_p2 = (ap_phi_mux_ii_phi_fu_132_p4 + 2'd1);

assign add_ln48_6_fu_230_p2 = (indvar_flatten_reg_139 + 4'd1);

assign add_ln48_fu_322_p2 = (select_ln47_fu_244_p3 + 2'd1);

assign add_ln49_fu_438_p2 = (select_ln48_fu_333_p3 + 2'd1);

assign add_ln55_21_fu_357_p2 = (sub_ln55_11_fu_278_p2 + zext_ln55_54_fu_353_p1);

assign add_ln55_22_fu_385_p2 = ((sext_ln48_fu_301_p1) + (zext_ln55_53_fu_349_p1));

assign add_ln55_23_fu_421_p2 = (sub_ln55_13_fu_379_p2 + zext_ln55_56_fu_417_p1);

assign add_ln55_24_fu_432_p2 = (sub_ln55_14_fu_407_p2 + zext_ln55_55_fu_413_p1);

assign add_ln55_fu_257_p2 = ((sext_ln47_reg_448) + (zext_ln55_51_fu_254_p1));

assign and_ln47_fu_316_p2 = (xor_ln47_fu_305_p2 & icmp_ln49_fu_310_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd2];

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

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_address0 = zext_ln55_57_fu_427_p1;

assign icmp_ln47_fu_204_p2 = ((indvar_flatten13_reg_117 == 5'd27) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_216_p2 = ((indvar_flatten_reg_139 == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln49_fu_310_p2 = ((kk_reg_161 == 2'd3) ? 1'b1 : 1'b0);

assign or_ln48_fu_328_p2 = (icmp_ln48_reg_462 | and_ln47_fu_316_p2);

assign p_shl1_cast_fu_399_p3 = {{trunc_ln55_3_fu_395_p1}, {2'd0}};

assign p_shl2_cast_fu_371_p3 = {{trunc_ln55_1_fu_367_p1}, {2'd0}};

assign select_ln47_6_fu_222_p3 = ((icmp_ln48_fu_216_p2[0:0] == 1'b1) ? add_ln47_fu_210_p2 : ap_phi_mux_ii_phi_fu_132_p4);

assign select_ln47_fu_244_p3 = ((icmp_ln48_reg_462[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_154_p4);

assign select_ln48_11_fu_341_p3 = ((and_ln47_fu_316_p2[0:0] == 1'b1) ? add_ln48_fu_322_p2 : select_ln47_fu_244_p3);

assign select_ln48_12_fu_236_p3 = ((icmp_ln48_fu_216_p2[0:0] == 1'b1) ? 4'd1 : add_ln48_6_fu_230_p2);

assign select_ln48_fu_333_p3 = ((or_ln48_fu_328_p2[0:0] == 1'b1) ? 2'd0 : kk_reg_161);

assign sext_ln47_fu_194_p1 = (sub_ln55_fu_188_p2);

assign sext_ln48_fu_301_p1 = (sub_ln55_12_fu_295_p2);

assign sext_ln55_1_fu_274_p1 = (tmp_46_fu_266_p3);

assign sext_ln55_fu_262_p1 = add_ln55_fu_257_p2;

assign sub_ln55_11_fu_278_p2 = ((sext_ln55_1_fu_274_p1) - (sext_ln55_fu_262_p1));

assign sub_ln55_12_fu_295_p2 = (zext_ln55_52_fu_291_p1 - zext_ln55_50_fu_251_p1);

assign sub_ln55_13_fu_379_p2 = (p_shl2_cast_fu_371_p3 - trunc_ln55_fu_363_p1);

assign sub_ln55_14_fu_407_p2 = (p_shl1_cast_fu_399_p3 - trunc_ln55_2_fu_391_p1);

assign sub_ln55_fu_188_p2 = (zext_ln55_49_fu_184_p1 - zext_ln55_fu_172_p1);

assign tmp_46_fu_266_p3 = {{add_ln55_fu_257_p2}, {2'd0}};

assign tmp_fu_176_p3 = {{input_indices_23_dout}, {2'd0}};

assign tmp_s_fu_284_p3 = {{select_ln47_6_reg_469}, {2'd0}};

assign trunc_ln55_1_fu_367_p1 = add_ln55_21_fu_357_p2[6:0];

assign trunc_ln55_2_fu_391_p1 = add_ln55_22_fu_385_p2[4:0];

assign trunc_ln55_3_fu_395_p1 = add_ln55_22_fu_385_p2[2:0];

assign trunc_ln55_fu_363_p1 = add_ln55_21_fu_357_p2[8:0];

assign weight_vecs_0_address0 = zext_ln55_58_fu_444_p1;

assign weight_vecs_0_d0 = filter_data_q0;

assign xor_ln47_fu_305_p2 = (icmp_ln48_reg_462 ^ 1'd1);

assign zext_ln55_49_fu_184_p1 = tmp_fu_176_p3;

assign zext_ln55_50_fu_251_p1 = select_ln47_6_reg_469;

assign zext_ln55_51_fu_254_p1 = select_ln47_6_reg_469;

assign zext_ln55_52_fu_291_p1 = tmp_s_fu_284_p3;

assign zext_ln55_53_fu_349_p1 = select_ln48_11_fu_341_p3;

assign zext_ln55_54_fu_353_p1 = select_ln48_11_fu_341_p3;

assign zext_ln55_55_fu_413_p1 = select_ln48_fu_333_p3;

assign zext_ln55_56_fu_417_p1 = select_ln48_fu_333_p3;

assign zext_ln55_57_fu_427_p1 = add_ln55_23_fu_421_p2;

assign zext_ln55_58_fu_444_p1 = add_ln55_24_reg_492_pp0_iter3_reg;

assign zext_ln55_fu_172_p1 = input_indices_23_dout;

endmodule //td_fused_top_tdf1_readFilters18
