`define SIMULATION_MEMORY
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

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_pp0_stage0 = 4'd2;
parameter    ap_ST_fsm_pp0_stage1 = 4'd4;
parameter    ap_ST_fsm_state5 = 4'd8;

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
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    indices_01_out_blk_n;
reg    indices_12_out_blk_n;
reg   [5:0] kk_0_i_i_reg_178;
wire   [0:0] is_padding_fu_216_p2;
reg   [0:0] is_padding_reg_436;
wire   [13:0] add_ln31_fu_276_p2;
reg   [13:0] add_ln31_reg_444;
wire   [0:0] icmp_ln24_fu_282_p2;
reg   [0:0] icmp_ln24_reg_449;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [5:0] add_ln24_fu_310_p2;
reg   [5:0] add_ln24_reg_458;
wire    ap_CS_fsm_pp0_stage1;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_pp0_stage1_11001;
wire   [4:0] empty_142_fu_321_p1;
reg   [4:0] empty_142_reg_463;
wire   [15:0] select_ln32_40_fu_388_p3;
reg   [15:0] select_ln32_40_reg_469;
wire   [15:0] select_ln32_41_fu_409_p3;
reg   [15:0] select_ln32_41_reg_474;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage1_subdone;
reg   [5:0] ap_phi_mux_kk_0_i_i_phi_fu_182_p4;
wire    ap_block_pp0_stage0;
wire   [63:0] sext_ln31_fu_305_p1;
wire   [63:0] kk_0_cast4_i_i_fu_316_p1;
wire    ap_block_pp0_stage1;
wire   [63:0] zext_ln31_9_fu_347_p1;
wire   [63:0] zext_ln31_10_fu_421_p1;
wire   [63:0] zext_ln31_11_fu_431_p1;
wire   [5:0] trunc_ln131_fu_190_p1;
wire   [15:0] select_ln32_fu_333_p3;
wire   [15:0] select_ln32_39_fu_366_p3;
wire   [0:0] cmp7_i_i_fu_204_p2;
wire   [0:0] icmp_ln23_fu_210_p2;
wire   [5:0] empty_140_fu_200_p1;
wire   [5:0] row_coord_int_fu_222_p3;
wire   [11:0] tmp_fu_238_p3;
wire   [8:0] tmp_s_fu_250_p3;
wire   [12:0] zext_ln31_fu_246_p1;
wire   [12:0] zext_ln31_17_fu_258_p1;
wire   [12:0] sub_ln31_fu_262_p2;
wire   [5:0] col_coord_int_fu_230_p3;
wire   [13:0] sub_ln31_cast_fu_268_p1;
wire   [13:0] zext_ln31_18_fu_272_p1;
wire   [2:0] lshr_ln_fu_288_p4;
wire   [16:0] tmp_79_fu_298_p3;
wire   [15:0] trunc_ln31_fu_325_p1;
wire   [15:0] bitcast_ln31_fu_329_p1;
wire   [4:0] or_ln24_fu_341_p2;
wire   [15:0] tmp_285_i_i_fu_352_p4;
wire   [15:0] bitcast_ln31_22_fu_362_p1;
wire   [15:0] tmp_286_i_i_fu_374_p4;
wire   [15:0] bitcast_ln31_23_fu_384_p1;
wire   [15:0] tmp_287_i_i_fu_395_p4;
wire   [15:0] bitcast_ln31_24_fu_405_p1;
wire   [4:0] or_ln24_5_fu_416_p2;
wire   [4:0] or_ln24_6_fu_426_p2;
wire    ap_CS_fsm_state5;
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
        end else if ((1'b1 == ap_CS_fsm_state5)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((((ap_enable_reg_pp0_iter0 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln24_reg_449 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        kk_0_i_i_reg_178 <= add_ln24_reg_458;
    end else if ((~((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_0_i_i_reg_178 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (icmp_ln24_reg_449 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        add_ln24_reg_458 <= add_ln24_fu_310_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        add_ln31_reg_444 <= add_ln31_fu_276_p2;
        is_padding_reg_436 <= is_padding_fu_216_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (icmp_ln24_reg_449 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        empty_142_reg_463 <= empty_142_fu_321_p1;
        select_ln32_40_reg_469 <= select_ln32_40_fu_388_p3;
        select_ln32_41_reg_474 <= select_ln32_41_fu_409_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln24_reg_449 <= icmp_ln24_fu_282_p2;
    end
end

always @ (*) begin
    if ((icmp_ln24_fu_282_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln24_reg_449 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_kk_0_i_i_phi_fu_182_p4 = add_ln24_reg_458;
    end else begin
        ap_phi_mux_kk_0_i_i_phi_fu_182_p4 = kk_0_i_i_reg_178;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_0_0_address0 = zext_ln31_11_fu_431_p1;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ifmap_vec_0_0_address0 = zext_ln31_9_fu_347_p1;
    end else begin
        ifmap_vec_0_0_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_0_0_address1 = zext_ln31_10_fu_421_p1;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ifmap_vec_0_0_address1 = kk_0_cast4_i_i_fu_316_p1;
    end else begin
        ifmap_vec_0_0_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        ifmap_vec_0_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        ifmap_vec_0_0_ce1 = 1'b1;
    end else begin
        ifmap_vec_0_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_0_0_d0 = select_ln32_41_reg_474;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ifmap_vec_0_0_d0 = select_ln32_39_fu_366_p3;
    end else begin
        ifmap_vec_0_0_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ifmap_vec_0_0_d1 = select_ln32_40_reg_469;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ifmap_vec_0_0_d1 = select_ln32_fu_333_p3;
    end else begin
        ifmap_vec_0_0_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln24_reg_449 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (icmp_ln24_reg_449 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        ifmap_vec_0_0_we0 = 1'b1;
    end else begin
        ifmap_vec_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln24_reg_449 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (icmp_ln24_reg_449 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        ifmap_vec_0_0_we1 = 1'b1;
    end else begin
        ifmap_vec_0_0_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln24_fu_282_p2 == 1'd1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln24_fu_282_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
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
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln24_fu_310_p2 = (kk_0_i_i_reg_178 + 6'd4);

assign add_ln31_fu_276_p2 = ((sub_ln31_cast_fu_268_p1) + (zext_ln31_18_fu_272_p1));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln31_22_fu_362_p1 = tmp_285_i_i_fu_352_p4;

assign bitcast_ln31_23_fu_384_p1 = tmp_286_i_i_fu_374_p4;

assign bitcast_ln31_24_fu_405_p1 = tmp_287_i_i_fu_395_p4;

assign bitcast_ln31_fu_329_p1 = trunc_ln31_fu_325_p1;

assign cmp7_i_i_fu_204_p2 = ((indices_01_dout > 16'd55) ? 1'b1 : 1'b0);

assign col_coord_int_fu_230_p3 = ((is_padding_fu_216_p2[0:0] == 1'b1) ? 6'd0 : empty_140_fu_200_p1);

assign empty_140_fu_200_p1 = indices_12_dout[5:0];

assign empty_142_fu_321_p1 = kk_0_i_i_reg_178[4:0];

assign icmp_ln23_fu_210_p2 = ((indices_12_dout > 16'd55) ? 1'b1 : 1'b0);

assign icmp_ln24_fu_282_p2 = ((ap_phi_mux_kk_0_i_i_phi_fu_182_p4 == 6'd32) ? 1'b1 : 1'b0);

assign in_data_address0 = sext_ln31_fu_305_p1;

assign indices_01_out_din = trunc_ln131_fu_190_p1;

assign indices_12_out_din = indices_12_dout[11:0];

assign is_padding_fu_216_p2 = (icmp_ln23_fu_210_p2 | cmp7_i_i_fu_204_p2);

assign kk_0_cast4_i_i_fu_316_p1 = kk_0_i_i_reg_178;

assign lshr_ln_fu_288_p4 = {{ap_phi_mux_kk_0_i_i_phi_fu_182_p4[4:2]}};

assign or_ln24_5_fu_416_p2 = (empty_142_reg_463 | 5'd2);

assign or_ln24_6_fu_426_p2 = (empty_142_reg_463 | 5'd3);

assign or_ln24_fu_341_p2 = (empty_142_fu_321_p1 | 5'd1);

assign row_coord_int_fu_222_p3 = ((is_padding_fu_216_p2[0:0] == 1'b1) ? 6'd0 : trunc_ln131_fu_190_p1);

assign select_ln32_39_fu_366_p3 = ((is_padding_reg_436[0:0] == 1'b1) ? 16'd0 : bitcast_ln31_22_fu_362_p1);

assign select_ln32_40_fu_388_p3 = ((is_padding_reg_436[0:0] == 1'b1) ? 16'd0 : bitcast_ln31_23_fu_384_p1);

assign select_ln32_41_fu_409_p3 = ((is_padding_reg_436[0:0] == 1'b1) ? 16'd0 : bitcast_ln31_24_fu_405_p1);

assign select_ln32_fu_333_p3 = ((is_padding_reg_436[0:0] == 1'b1) ? 16'd0 : bitcast_ln31_fu_329_p1);

assign sext_ln31_fu_305_p1 = (tmp_79_fu_298_p3);

assign sub_ln31_cast_fu_268_p1 = (sub_ln31_fu_262_p2);

assign sub_ln31_fu_262_p2 = (zext_ln31_fu_246_p1 - zext_ln31_17_fu_258_p1);

assign tmp_285_i_i_fu_352_p4 = {{in_data_q0[31:16]}};

assign tmp_286_i_i_fu_374_p4 = {{in_data_q0[47:32]}};

assign tmp_287_i_i_fu_395_p4 = {{in_data_q0[63:48]}};

assign tmp_79_fu_298_p3 = {{add_ln31_reg_444}, {lshr_ln_fu_288_p4}};

assign tmp_fu_238_p3 = {{row_coord_int_fu_222_p3}, {6'd0}};

assign tmp_s_fu_250_p3 = {{row_coord_int_fu_222_p3}, {3'd0}};

assign trunc_ln131_fu_190_p1 = indices_01_dout[5:0];

assign trunc_ln31_fu_325_p1 = in_data_q0[15:0];

assign zext_ln31_10_fu_421_p1 = or_ln24_5_fu_416_p2;

assign zext_ln31_11_fu_431_p1 = or_ln24_6_fu_426_p2;

assign zext_ln31_17_fu_258_p1 = tmp_s_fu_250_p3;

assign zext_ln31_18_fu_272_p1 = col_coord_int_fu_230_p3;

assign zext_ln31_9_fu_347_p1 = or_ln24_fu_341_p2;

assign zext_ln31_fu_246_p1 = tmp_fu_238_p3;

endmodule //td_fused_top_tdf3_readInputs
