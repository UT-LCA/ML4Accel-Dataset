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

module td_fused_top_tdf7_readFilters52 (
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
output  [16:0] filter_data_address0;
output   filter_data_ce0;
input  [15:0] filter_data_q0;
input  [7:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [8:0] weight_vecs_0_address0;
output   weight_vecs_0_ce0;
output   weight_vecs_0_we0;
output  [15:0] weight_vecs_0_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_ce0;
reg indices_23_read;
reg weight_vecs_0_ce0;
reg weight_vecs_0_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [8:0] indvar_flatten13_reg_123;
reg   [1:0] ii_reg_134;
reg   [7:0] indvar_flatten_reg_145;
reg   [1:0] jj_reg_156;
reg   [5:0] kk_reg_167;
wire   [11:0] sext_ln47_fu_200_p1;
reg   [11:0] sext_ln47_reg_408;
wire   [8:0] add_ln47_2_fu_204_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln47_fu_210_p2;
reg   [0:0] icmp_ln47_reg_418;
reg   [0:0] icmp_ln47_reg_418_pp0_iter1_reg;
reg   [0:0] icmp_ln47_reg_418_pp0_iter2_reg;
reg   [0:0] icmp_ln47_reg_418_pp0_iter3_reg;
wire   [0:0] icmp_ln48_fu_222_p2;
reg   [0:0] icmp_ln48_reg_422;
wire   [1:0] select_ln47_2_fu_228_p3;
reg   [1:0] select_ln47_2_reg_429;
wire   [7:0] select_ln48_4_fu_242_p3;
wire   [1:0] select_ln48_3_fu_329_p3;
reg   [1:0] select_ln48_3_reg_442;
reg    ap_enable_reg_pp0_iter1;
wire   [8:0] add_ln55_8_fu_392_p2;
reg   [8:0] add_ln55_8_reg_452;
reg   [8:0] add_ln55_8_reg_452_pp0_iter2_reg;
reg   [8:0] add_ln55_8_reg_452_pp0_iter3_reg;
wire   [5:0] add_ln49_fu_398_p2;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_enable_reg_pp0_iter2;
reg    ap_condition_pp0_exit_iter1_state3;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg   [1:0] ap_phi_mux_ii_phi_fu_138_p4;
wire    ap_block_pp0_stage0;
reg   [1:0] ap_phi_mux_jj_phi_fu_160_p4;
wire   [63:0] zext_ln55_18_fu_387_p1;
wire   [63:0] zext_ln55_19_fu_404_p1;
wire   [9:0] tmp_fu_182_p3;
wire   [10:0] zext_ln55_11_fu_190_p1;
wire   [10:0] zext_ln55_fu_178_p1;
wire   [10:0] sub_ln55_fu_194_p2;
wire   [1:0] add_ln47_fu_216_p2;
wire   [7:0] add_ln48_2_fu_236_p2;
wire   [11:0] zext_ln55_13_fu_260_p1;
wire   [11:0] add_ln55_fu_263_p2;
wire   [11:0] shl_ln55_fu_268_p2;
wire   [3:0] tmp_s_fu_280_p3;
wire   [3:0] zext_ln55_12_fu_257_p1;
wire   [0:0] icmp_ln49_fu_298_p2;
wire   [0:0] xor_ln47_fu_293_p2;
wire   [1:0] select_ln47_fu_250_p3;
wire   [0:0] and_ln47_fu_304_p2;
wire   [0:0] or_ln48_fu_316_p2;
wire   [1:0] add_ln48_fu_310_p2;
wire   [11:0] sub_ln55_3_fu_274_p2;
wire   [11:0] zext_ln55_15_fu_341_p1;
wire   [11:0] add_ln55_5_fu_345_p2;
wire   [3:0] sub_ln55_4_fu_287_p2;
wire   [3:0] zext_ln55_14_fu_337_p1;
wire   [3:0] add_ln55_6_fu_359_p2;
wire   [5:0] select_ln48_fu_321_p3;
wire   [16:0] tmp_41_cast_fu_351_p3;
wire   [16:0] zext_ln55_17_fu_377_p1;
wire   [16:0] add_ln55_7_fu_381_p2;
wire   [8:0] tmp_43_cast_fu_365_p3;
wire   [8:0] zext_ln55_16_fu_373_p1;
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
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ii_reg_134 <= select_ln47_2_reg_429;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ii_reg_134 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten13_reg_123 <= add_ln47_2_fu_204_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_123 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_145 <= select_ln48_4_fu_242_p3;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_145 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_418_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        jj_reg_156 <= select_ln48_3_reg_442;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        jj_reg_156 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_reg_167 <= add_ln49_fu_398_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_reg_167 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln55_8_reg_452 <= add_ln55_8_fu_392_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln55_8_reg_452_pp0_iter2_reg <= add_ln55_8_reg_452;
        add_ln55_8_reg_452_pp0_iter3_reg <= add_ln55_8_reg_452_pp0_iter2_reg;
        icmp_ln47_reg_418_pp0_iter2_reg <= icmp_ln47_reg_418_pp0_iter1_reg;
        icmp_ln47_reg_418_pp0_iter3_reg <= icmp_ln47_reg_418_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln47_reg_418 <= icmp_ln47_fu_210_p2;
        icmp_ln47_reg_418_pp0_iter1_reg <= icmp_ln47_reg_418;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln48_reg_422 <= icmp_ln48_fu_222_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln47_fu_210_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln47_2_reg_429 <= select_ln47_2_fu_228_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln48_3_reg_442 <= select_ln48_3_fu_329_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln47_reg_408 <= sext_ln47_fu_200_p1;
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
    if (((icmp_ln47_fu_210_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln47_reg_418 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_ii_phi_fu_138_p4 = select_ln47_2_reg_429;
    end else begin
        ap_phi_mux_ii_phi_fu_138_p4 = ii_reg_134;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_418_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_jj_phi_fu_160_p4 = select_ln48_3_reg_442;
    end else begin
        ap_phi_mux_jj_phi_fu_160_p4 = jj_reg_156;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        weight_vecs_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln47_reg_418_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        weight_vecs_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_we0 = 1'b0;
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

assign add_ln47_2_fu_204_p2 = (indvar_flatten13_reg_123 + 9'd1);

assign add_ln47_fu_216_p2 = (ap_phi_mux_ii_phi_fu_138_p4 + 2'd1);

assign add_ln48_2_fu_236_p2 = (indvar_flatten_reg_145 + 8'd1);

assign add_ln48_fu_310_p2 = (select_ln47_fu_250_p3 + 2'd1);

assign add_ln49_fu_398_p2 = (select_ln48_fu_321_p3 + 6'd1);

assign add_ln55_5_fu_345_p2 = (sub_ln55_3_fu_274_p2 + zext_ln55_15_fu_341_p1);

assign add_ln55_6_fu_359_p2 = (sub_ln55_4_fu_287_p2 + zext_ln55_14_fu_337_p1);

assign add_ln55_7_fu_381_p2 = (tmp_41_cast_fu_351_p3 + zext_ln55_17_fu_377_p1);

assign add_ln55_8_fu_392_p2 = (tmp_43_cast_fu_365_p3 + zext_ln55_16_fu_373_p1);

assign add_ln55_fu_263_p2 = ((sext_ln47_reg_408) + (zext_ln55_13_fu_260_p1));

assign and_ln47_fu_304_p2 = (xor_ln47_fu_293_p2 & icmp_ln49_fu_298_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd2];

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

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_address0 = zext_ln55_18_fu_387_p1;

assign icmp_ln47_fu_210_p2 = ((indvar_flatten13_reg_123 == 9'd288) ? 1'b1 : 1'b0);

assign icmp_ln48_fu_222_p2 = ((indvar_flatten_reg_145 == 8'd96) ? 1'b1 : 1'b0);

assign icmp_ln49_fu_298_p2 = ((kk_reg_167 == 6'd32) ? 1'b1 : 1'b0);

assign or_ln48_fu_316_p2 = (icmp_ln48_reg_422 | and_ln47_fu_304_p2);

assign select_ln47_2_fu_228_p3 = ((icmp_ln48_fu_222_p2[0:0] == 1'b1) ? add_ln47_fu_216_p2 : ap_phi_mux_ii_phi_fu_138_p4);

assign select_ln47_fu_250_p3 = ((icmp_ln48_reg_422[0:0] == 1'b1) ? 2'd0 : ap_phi_mux_jj_phi_fu_160_p4);

assign select_ln48_3_fu_329_p3 = ((and_ln47_fu_304_p2[0:0] == 1'b1) ? add_ln48_fu_310_p2 : select_ln47_fu_250_p3);

assign select_ln48_4_fu_242_p3 = ((icmp_ln48_fu_222_p2[0:0] == 1'b1) ? 8'd1 : add_ln48_2_fu_236_p2);

assign select_ln48_fu_321_p3 = ((or_ln48_fu_316_p2[0:0] == 1'b1) ? 6'd0 : kk_reg_167);

assign sext_ln47_fu_200_p1 = (sub_ln55_fu_194_p2);

assign shl_ln55_fu_268_p2 = add_ln55_fu_263_p2 << 12'd2;

assign sub_ln55_3_fu_274_p2 = (shl_ln55_fu_268_p2 - add_ln55_fu_263_p2);

assign sub_ln55_4_fu_287_p2 = (tmp_s_fu_280_p3 - zext_ln55_12_fu_257_p1);

assign sub_ln55_fu_194_p2 = (zext_ln55_11_fu_190_p1 - zext_ln55_fu_178_p1);

assign tmp_41_cast_fu_351_p3 = {{add_ln55_5_fu_345_p2}, {5'd0}};

assign tmp_43_cast_fu_365_p3 = {{add_ln55_6_fu_359_p2}, {5'd0}};

assign tmp_fu_182_p3 = {{indices_23_dout}, {2'd0}};

assign tmp_s_fu_280_p3 = {{select_ln47_2_reg_429}, {2'd0}};

assign weight_vecs_0_address0 = zext_ln55_19_fu_404_p1;

assign weight_vecs_0_d0 = filter_data_q0;

assign xor_ln47_fu_293_p2 = (icmp_ln48_reg_422 ^ 1'd1);

assign zext_ln55_11_fu_190_p1 = tmp_fu_182_p3;

assign zext_ln55_12_fu_257_p1 = select_ln47_2_reg_429;

assign zext_ln55_13_fu_260_p1 = select_ln47_2_reg_429;

assign zext_ln55_14_fu_337_p1 = select_ln48_3_fu_329_p3;

assign zext_ln55_15_fu_341_p1 = select_ln48_3_fu_329_p3;

assign zext_ln55_16_fu_373_p1 = select_ln48_fu_321_p3;

assign zext_ln55_17_fu_377_p1 = select_ln48_fu_321_p3;

assign zext_ln55_18_fu_387_p1 = add_ln55_7_fu_381_p2;

assign zext_ln55_19_fu_404_p1 = add_ln55_8_reg_452_pp0_iter3_reg;

assign zext_ln55_fu_178_p1 = indices_23_dout;

endmodule //td_fused_top_tdf7_readFilters52
