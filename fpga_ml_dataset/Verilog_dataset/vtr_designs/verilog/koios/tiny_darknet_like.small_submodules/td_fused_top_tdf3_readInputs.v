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

module td_fused_top_tdf3_readInputs (
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
        ifmap_vec_0_0_address0,
        ifmap_vec_0_0_ce0,
        ifmap_vec_0_0_we0,
        ifmap_vec_0_0_d0,
        ifmap_vec_0_0_address1,
        ifmap_vec_0_0_ce1,
        ifmap_vec_0_0_we1,
        ifmap_vec_0_0_d1,
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
parameter    ap_ST_fsm_state8 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [14:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [15:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
output  [4:0] ifmap_vec_0_0_address0;
output   ifmap_vec_0_0_ce0;
output   ifmap_vec_0_0_we0;
output  [15:0] ifmap_vec_0_0_d0;
output  [4:0] ifmap_vec_0_0_address1;
output   ifmap_vec_0_0_ce1;
output   ifmap_vec_0_0_we1;
output  [15:0] ifmap_vec_0_0_d1;
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
reg[4:0] ifmap_vec_0_0_address0;
reg ifmap_vec_0_0_ce0;
reg ifmap_vec_0_0_we0;
reg[15:0] ifmap_vec_0_0_d0;
reg[4:0] ifmap_vec_0_0_address1;
reg ifmap_vec_0_0_ce1;
reg ifmap_vec_0_0_we1;
reg[15:0] ifmap_vec_0_0_d1;
reg indices_01_out_write;
reg indices_12_out_write;

reg    ap_done_reg;
  reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    indices_01_out_blk_n;
reg    indices_12_out_blk_n;
reg   [5:0] kk_0_i_i_reg_178;
reg   [5:0] kk_0_i_i_reg_178_pp0_iter1_reg;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_state7_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
wire   [5:0] trunc_ln135_fu_190_p1;
reg   [5:0] trunc_ln135_reg_432;
reg   [15:0] col_coord_reg_437;
wire   [0:0] is_padding_fu_212_p2;
reg   [0:0] is_padding_reg_442;
wire   [13:0] add_ln32_fu_272_p2;
reg   [13:0] add_ln32_reg_452;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln25_fu_278_p2;
reg   [0:0] icmp_ln25_reg_457;
reg   [0:0] icmp_ln25_reg_457_pp0_iter1_reg;
wire   [5:0] add_ln25_fu_306_p2;
reg   [5:0] add_ln25_reg_466;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state4_pp0_stage1_iter0;
wire    ap_block_state6_pp0_stage1_iter1;
wire    ap_block_pp0_stage1_11001;
wire   [4:0] empty_104_fu_317_p1;
reg   [4:0] empty_104_reg_471;
wire   [15:0] select_ln33_20_fu_384_p3;
reg   [15:0] select_ln33_20_reg_477;
wire   [15:0] select_ln33_21_fu_405_p3;
reg   [15:0] select_ln33_21_reg_482;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage1_subdone;
reg    ap_enable_reg_pp0_iter2;
reg   [5:0] ap_phi_mux_kk_0_i_i_phi_fu_182_p4;
wire    ap_block_pp0_stage0;
wire   [63:0] sext_ln32_fu_301_p1;
wire   [63:0] kk_0_cast4_i_i_fu_312_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln32_16_fu_343_p1;
wire   [63:0] zext_ln32_17_fu_417_p1;
wire   [63:0] zext_ln32_18_fu_427_p1;
reg    ap_block_state1;
wire   [15:0] select_ln33_fu_329_p3;
wire   [15:0] select_ln33_19_fu_362_p3;
wire   [0:0] cmp7_i_i_fu_200_p2;
wire   [0:0] icmp_ln24_fu_206_p2;
wire   [5:0] empty_102_fu_218_p1;
wire   [5:0] row_coord_int_fu_221_p3;
wire   [11:0] tmp_fu_234_p3;
wire   [8:0] tmp_s_fu_246_p3;
wire   [12:0] zext_ln32_fu_242_p1;
wire   [12:0] zext_ln32_20_fu_254_p1;
wire   [12:0] sub_ln32_fu_258_p2;
wire   [5:0] col_coord_int_fu_227_p3;
wire   [13:0] sub_ln32_cast_fu_264_p1;
wire   [13:0] zext_ln32_21_fu_268_p1;
wire   [2:0] lshr_ln_fu_284_p4;
wire   [16:0] tmp_35_fu_294_p3;
wire   [15:0] trunc_ln32_fu_321_p1;
wire   [15:0] bitcast_ln32_fu_325_p1;
wire   [4:0] or_ln25_fu_337_p2;
wire   [15:0] tmp_58_i_i_fu_348_p4;
wire   [15:0] bitcast_ln32_19_fu_358_p1;
wire   [15:0] tmp_59_i_i_fu_370_p4;
wire   [15:0] bitcast_ln32_20_fu_380_p1;
wire   [15:0] tmp_60_i_i_fu_391_p4;
wire   [15:0] bitcast_ln32_21_fu_401_p1;
wire   [4:0] or_ln25_13_fu_412_p2;
wire   [4:0] or_ln25_14_fu_422_p2;
wire    ap_CS_fsm_state8;
reg   [4:0] ap_NS_fsm;
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
        end else if ((1'b1 == ap_CS_fsm_state8)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state3))) begin
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
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln25_reg_457 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        kk_0_i_i_reg_178 <= add_ln25_reg_466;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        kk_0_i_i_reg_178 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln25_reg_457 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        add_ln25_reg_466 <= add_ln25_fu_306_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln32_reg_452 <= add_ln32_fu_272_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        col_coord_reg_437 <= indices_12_dout;
        is_padding_reg_442 <= is_padding_fu_212_p2;
        trunc_ln135_reg_432 <= trunc_ln135_fu_190_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (icmp_ln25_reg_457_pp0_iter1_reg == 1'd0))) begin
        empty_104_reg_471 <= empty_104_fu_317_p1;
        select_ln33_20_reg_477 <= select_ln33_20_fu_384_p3;
        select_ln33_21_reg_482 <= select_ln33_21_fu_405_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln25_reg_457 <= icmp_ln25_fu_278_p2;
        icmp_ln25_reg_457_pp0_iter1_reg <= icmp_ln25_reg_457;
        kk_0_i_i_reg_178_pp0_iter1_reg <= kk_0_i_i_reg_178;
    end
end

always @ (*) begin
    if ((icmp_ln25_fu_278_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
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
    if (((icmp_ln25_reg_457 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_kk_0_i_i_phi_fu_182_p4 = add_ln25_reg_466;
    end else begin
        ap_phi_mux_kk_0_i_i_phi_fu_182_p4 = kk_0_i_i_reg_178;
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
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ifmap_vec_0_0_address0 = zext_ln32_18_fu_427_p1;
    end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_0_0_address0 = zext_ln32_16_fu_343_p1;
    end else begin
        ifmap_vec_0_0_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ifmap_vec_0_0_address1 = zext_ln32_17_fu_417_p1;
    end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_0_0_address1 = kk_0_cast4_i_i_fu_312_p1;
    end else begin
        ifmap_vec_0_0_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        ifmap_vec_0_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        ifmap_vec_0_0_ce1 = 1'b1;
    end else begin
        ifmap_vec_0_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ifmap_vec_0_0_d0 = select_ln33_21_reg_482;
    end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_0_0_d0 = select_ln33_19_fu_362_p3;
    end else begin
        ifmap_vec_0_0_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ifmap_vec_0_0_d1 = select_ln33_20_reg_477;
    end else if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_0_0_d1 = select_ln33_fu_329_p3;
    end else begin
        ifmap_vec_0_0_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln25_reg_457_pp0_iter1_reg == 1'd0)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln25_reg_457_pp0_iter1_reg == 1'd0)))) begin
        ifmap_vec_0_0_we0 = 1'b1;
    end else begin
        ifmap_vec_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln25_reg_457_pp0_iter1_reg == 1'd0)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln25_reg_457_pp0_iter1_reg == 1'd0)))) begin
        ifmap_vec_0_0_we1 = 1'b1;
    end else begin
        ifmap_vec_0_0_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
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
            if ((~((icmp_ln25_fu_278_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if ((((icmp_ln25_fu_278_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
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
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln25_fu_306_p2 = (kk_0_i_i_reg_178 + 6'd4);

assign add_ln32_fu_272_p2 = ((sub_ln32_cast_fu_264_p1) + (zext_ln32_21_fu_268_p1));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd4];

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

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln32_19_fu_358_p1 = tmp_58_i_i_fu_348_p4;

assign bitcast_ln32_20_fu_380_p1 = tmp_59_i_i_fu_370_p4;

assign bitcast_ln32_21_fu_401_p1 = tmp_60_i_i_fu_391_p4;

assign bitcast_ln32_fu_325_p1 = trunc_ln32_fu_321_p1;

assign cmp7_i_i_fu_200_p2 = ((indices_01_dout > 16'd55) ? 1'b1 : 1'b0);

assign col_coord_int_fu_227_p3 = ((is_padding_reg_442[0:0] == 1'b1) ? 6'd0 : empty_102_fu_218_p1);

assign empty_102_fu_218_p1 = col_coord_reg_437[5:0];

assign empty_104_fu_317_p1 = kk_0_i_i_reg_178_pp0_iter1_reg[4:0];

assign icmp_ln24_fu_206_p2 = ((indices_12_dout > 16'd55) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_278_p2 = ((ap_phi_mux_kk_0_i_i_phi_fu_182_p4 == 6'd32) ? 1'b1 : 1'b0);

assign in_data_address0 = sext_ln32_fu_301_p1;

assign indices_01_out_din = indices_01_dout[5:0];

assign indices_12_out_din = indices_12_dout[11:0];

assign is_padding_fu_212_p2 = (icmp_ln24_fu_206_p2 | cmp7_i_i_fu_200_p2);

assign kk_0_cast4_i_i_fu_312_p1 = kk_0_i_i_reg_178_pp0_iter1_reg;

assign lshr_ln_fu_284_p4 = {{ap_phi_mux_kk_0_i_i_phi_fu_182_p4[4:2]}};

assign or_ln25_13_fu_412_p2 = (empty_104_reg_471 | 5'd2);

assign or_ln25_14_fu_422_p2 = (empty_104_reg_471 | 5'd3);

assign or_ln25_fu_337_p2 = (empty_104_fu_317_p1 | 5'd1);

assign row_coord_int_fu_221_p3 = ((is_padding_reg_442[0:0] == 1'b1) ? 6'd0 : trunc_ln135_reg_432);

assign select_ln33_19_fu_362_p3 = ((is_padding_reg_442[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_19_fu_358_p1);

assign select_ln33_20_fu_384_p3 = ((is_padding_reg_442[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_20_fu_380_p1);

assign select_ln33_21_fu_405_p3 = ((is_padding_reg_442[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_21_fu_401_p1);

assign select_ln33_fu_329_p3 = ((is_padding_reg_442[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_fu_325_p1);

assign sext_ln32_fu_301_p1 = (tmp_35_fu_294_p3);

assign sub_ln32_cast_fu_264_p1 = (sub_ln32_fu_258_p2);

assign sub_ln32_fu_258_p2 = (zext_ln32_fu_242_p1 - zext_ln32_20_fu_254_p1);

assign tmp_35_fu_294_p3 = {{add_ln32_reg_452}, {lshr_ln_fu_284_p4}};

assign tmp_58_i_i_fu_348_p4 = {{in_data_q0[31:16]}};

assign tmp_59_i_i_fu_370_p4 = {{in_data_q0[47:32]}};

assign tmp_60_i_i_fu_391_p4 = {{in_data_q0[63:48]}};

assign tmp_fu_234_p3 = {{row_coord_int_fu_221_p3}, {6'd0}};

assign tmp_s_fu_246_p3 = {{row_coord_int_fu_221_p3}, {3'd0}};

assign trunc_ln135_fu_190_p1 = indices_01_dout[5:0];

assign trunc_ln32_fu_321_p1 = in_data_q0[15:0];

assign zext_ln32_16_fu_343_p1 = or_ln25_fu_337_p2;

assign zext_ln32_17_fu_417_p1 = or_ln25_13_fu_412_p2;

assign zext_ln32_18_fu_427_p1 = or_ln25_14_fu_422_p2;

assign zext_ln32_20_fu_254_p1 = tmp_s_fu_246_p3;

assign zext_ln32_21_fu_268_p1 = col_coord_int_fu_227_p3;

assign zext_ln32_fu_242_p1 = tmp_fu_234_p3;

endmodule //td_fused_top_tdf3_readInputs
