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

module td_fused_top_tdf12_readInputs (
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
        ifmap_vec_0_0_0_address0,
        ifmap_vec_0_0_0_ce0,
        ifmap_vec_0_0_0_we0,
        ifmap_vec_0_0_0_d0,
        ifmap_vec_1_0_0_address0,
        ifmap_vec_1_0_0_ce0,
        ifmap_vec_1_0_0_we0,
        ifmap_vec_1_0_0_d0,
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
parameter    ap_ST_fsm_state6 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [12:0] in_data_address0;
output   in_data_ce0;
input  [63:0] in_data_q0;
input  [15:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [15:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
output  [5:0] ifmap_vec_0_0_0_address0;
output   ifmap_vec_0_0_0_ce0;
output   ifmap_vec_0_0_0_we0;
output  [15:0] ifmap_vec_0_0_0_d0;
output  [5:0] ifmap_vec_1_0_0_address0;
output   ifmap_vec_1_0_0_ce0;
output   ifmap_vec_1_0_0_we0;
output  [15:0] ifmap_vec_1_0_0_d0;
output  [3:0] indices_01_out_din;
input   indices_01_out_full_n;
output   indices_01_out_write;
output  [7:0] indices_12_out_din;
input   indices_12_out_full_n;
output   indices_12_out_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_data_ce0;
reg indices_01_read;
reg indices_12_read;
reg ifmap_vec_0_0_0_ce0;
reg ifmap_vec_0_0_0_we0;
reg ifmap_vec_1_0_0_ce0;
reg ifmap_vec_1_0_0_we0;
reg indices_01_out_write;
reg indices_12_out_write;

reg    ap_done_reg;
  reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg    indices_01_out_blk_n;
reg    indices_12_out_blk_n;
reg   [7:0] kk_0_i_i_reg_165;
wire   [3:0] trunc_ln165_fu_176_p1;
reg   [3:0] trunc_ln165_reg_566;
reg   [15:0] col_coord_reg_571;
wire   [0:0] is_padding_fu_198_p2;
reg   [0:0] is_padding_reg_576;
wire   [9:0] add_ln32_fu_258_p2;
reg   [9:0] add_ln32_reg_584;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln25_fu_264_p2;
reg   [0:0] icmp_ln25_reg_589;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln25_reg_589_pp0_iter1_reg;
wire   [7:0] add_ln25_fu_270_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [1:0] empty_144_fu_298_p1;
reg   [1:0] empty_144_reg_603;
reg   [5:0] lshr_ln5_reg_608;
reg   [5:0] lshr_ln5_reg_608_pp0_iter1_reg;
wire   [6:0] sub_ln32_24_fu_391_p2;
reg   [6:0] sub_ln32_24_reg_613;
wire   [63:0] lshr_ln32_fu_401_p2;
reg   [63:0] lshr_ln32_reg_618;
wire   [6:0] sub_ln32_27_fu_485_p2;
reg   [6:0] sub_ln32_27_reg_623;
wire   [63:0] lshr_ln32_12_fu_495_p2;
reg   [63:0] lshr_ln32_12_reg_628;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
wire   [63:0] sext_ln32_fu_293_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln33_fu_531_p1;
reg    ap_block_state1;
wire   [0:0] cmp7_i_i_fu_186_p2;
wire   [0:0] icmp_ln24_fu_192_p2;
wire   [3:0] empty_142_fu_204_p1;
wire   [3:0] row_coord_int_fu_207_p3;
wire   [7:0] tmp_fu_220_p3;
wire   [4:0] tmp_s_fu_232_p3;
wire   [8:0] zext_ln32_fu_228_p1;
wire   [8:0] zext_ln32_53_fu_240_p1;
wire   [8:0] sub_ln32_fu_244_p2;
wire   [3:0] col_coord_int_fu_213_p3;
wire   [9:0] sub_ln32_cast_fu_250_p1;
wire   [9:0] zext_ln32_54_fu_254_p1;
wire   [4:0] lshr_ln_fu_276_p4;
wire   [14:0] tmp_78_fu_286_p3;
wire   [5:0] tmp_54_fu_312_p3;
wire   [5:0] empty_145_fu_319_p2;
wire   [6:0] zext_ln32_55_fu_331_p1;
wire   [6:0] zext_ln32_56_fu_335_p1;
wire   [0:0] icmp_ln32_fu_325_p2;
wire   [6:0] sub_ln32_22_fu_349_p2;
wire   [6:0] sub_ln32_23_fu_361_p2;
reg   [63:0] tmp_79_fu_339_p4;
wire   [6:0] xor_ln32_fu_355_p2;
wire   [6:0] select_ln32_fu_367_p3;
wire   [6:0] select_ln32_19_fu_383_p3;
wire   [63:0] select_ln32_18_fu_375_p3;
wire   [63:0] zext_ln32_57_fu_397_p1;
wire   [5:0] empty_146_fu_407_p2;
wire   [5:0] empty_147_fu_413_p2;
wire   [6:0] zext_ln32_59_fu_425_p1;
wire   [6:0] zext_ln32_60_fu_429_p1;
wire   [0:0] icmp_ln32_4_fu_419_p2;
wire   [6:0] sub_ln32_25_fu_443_p2;
wire   [6:0] sub_ln32_26_fu_455_p2;
reg   [63:0] tmp_80_fu_433_p4;
wire   [6:0] xor_ln32_4_fu_449_p2;
wire   [6:0] select_ln32_20_fu_461_p3;
wire   [6:0] select_ln32_22_fu_477_p3;
wire   [63:0] select_ln32_21_fu_469_p3;
wire   [63:0] zext_ln32_61_fu_491_p1;
wire   [63:0] zext_ln32_58_fu_501_p1;
wire   [63:0] lshr_ln32_11_fu_504_p2;
wire   [63:0] and_ln32_fu_510_p2;
wire   [15:0] trunc_ln32_fu_515_p1;
wire   [15:0] bitcast_ln32_fu_519_p1;
wire   [63:0] zext_ln32_62_fu_536_p1;
wire   [63:0] lshr_ln32_13_fu_539_p2;
wire   [63:0] and_ln32_4_fu_545_p2;
wire   [15:0] trunc_ln32_7_fu_550_p1;
wire   [15:0] bitcast_ln32_10_fu_554_p1;
wire    ap_CS_fsm_state6;
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
        end else if ((1'b1 == ap_CS_fsm_state6)) begin
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
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state3)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
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
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln25_fu_264_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        kk_0_i_i_reg_165 <= add_ln25_fu_270_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        kk_0_i_i_reg_165 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln32_reg_584 <= add_ln32_fu_258_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        col_coord_reg_571 <= indices_12_dout;
        is_padding_reg_576 <= is_padding_fu_198_p2;
        trunc_ln165_reg_566 <= trunc_ln165_fu_176_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln25_fu_264_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_144_reg_603 <= empty_144_fu_298_p1;
        lshr_ln5_reg_608 <= {{kk_0_i_i_reg_165[6:1]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln25_reg_589 <= icmp_ln25_fu_264_p2;
        icmp_ln25_reg_589_pp0_iter1_reg <= icmp_ln25_reg_589;
        lshr_ln5_reg_608_pp0_iter1_reg <= lshr_ln5_reg_608;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln25_reg_589 == 1'd0) & (is_padding_reg_576 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lshr_ln32_12_reg_628 <= lshr_ln32_12_fu_495_p2;
        lshr_ln32_reg_618 <= lshr_ln32_fu_401_p2;
        sub_ln32_24_reg_613[6 : 1] <= sub_ln32_24_fu_391_p2[6 : 1];
        sub_ln32_27_reg_623[6 : 1] <= sub_ln32_27_fu_485_p2[6 : 1];
    end
end

always @ (*) begin
    if ((icmp_ln25_fu_264_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ifmap_vec_0_0_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_0_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln25_reg_589_pp0_iter1_reg == 1'd0))) begin
        ifmap_vec_0_0_0_we0 = 1'b1;
    end else begin
        ifmap_vec_0_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ifmap_vec_1_0_0_ce0 = 1'b1;
    end else begin
        ifmap_vec_1_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln25_reg_589_pp0_iter1_reg == 1'd0))) begin
        ifmap_vec_1_0_0_we0 = 1'b1;
    end else begin
        ifmap_vec_1_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
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
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln25_fu_264_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln25_fu_264_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
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

assign add_ln25_fu_270_p2 = (kk_0_i_i_reg_165 + 8'd2);

assign add_ln32_fu_258_p2 = ((sub_ln32_cast_fu_250_p1) + (zext_ln32_54_fu_254_p1));

assign and_ln32_4_fu_545_p2 = (lshr_ln32_13_fu_539_p2 & lshr_ln32_12_reg_628);

assign and_ln32_fu_510_p2 = (lshr_ln32_reg_618 & lshr_ln32_11_fu_504_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_12_out_full_n == 1'b0) | (indices_01_out_full_n == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln32_10_fu_554_p1 = trunc_ln32_7_fu_550_p1;

assign bitcast_ln32_fu_519_p1 = trunc_ln32_fu_515_p1;

assign cmp7_i_i_fu_186_p2 = ((indices_01_dout > 16'd13) ? 1'b1 : 1'b0);

assign col_coord_int_fu_213_p3 = ((is_padding_reg_576[0:0] == 1'b1) ? 4'd0 : empty_142_fu_204_p1);

assign empty_142_fu_204_p1 = col_coord_reg_571[3:0];

assign empty_144_fu_298_p1 = kk_0_i_i_reg_165[1:0];

assign empty_145_fu_319_p2 = (tmp_54_fu_312_p3 | 6'd15);

assign empty_146_fu_407_p2 = (tmp_54_fu_312_p3 | 6'd16);

assign empty_147_fu_413_p2 = (tmp_54_fu_312_p3 | 6'd31);

assign icmp_ln24_fu_192_p2 = ((indices_12_dout > 16'd13) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_264_p2 = ((kk_0_i_i_reg_165 == 8'd128) ? 1'b1 : 1'b0);

assign icmp_ln32_4_fu_419_p2 = ((empty_146_fu_407_p2 > empty_147_fu_413_p2) ? 1'b1 : 1'b0);

assign icmp_ln32_fu_325_p2 = ((tmp_54_fu_312_p3 > empty_145_fu_319_p2) ? 1'b1 : 1'b0);

assign ifmap_vec_0_0_0_address0 = zext_ln33_fu_531_p1;

assign ifmap_vec_0_0_0_d0 = ((is_padding_reg_576[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_fu_519_p1);

assign ifmap_vec_1_0_0_address0 = zext_ln33_fu_531_p1;

assign ifmap_vec_1_0_0_d0 = ((is_padding_reg_576[0:0] == 1'b1) ? 16'd0 : bitcast_ln32_10_fu_554_p1);

assign in_data_address0 = sext_ln32_fu_293_p1;

assign indices_01_out_din = indices_01_dout[3:0];

assign indices_12_out_din = indices_12_dout[7:0];

assign is_padding_fu_198_p2 = (icmp_ln24_fu_192_p2 | cmp7_i_i_fu_186_p2);

assign lshr_ln32_11_fu_504_p2 = 64'd18446744073709551615 >> zext_ln32_58_fu_501_p1;

assign lshr_ln32_12_fu_495_p2 = select_ln32_21_fu_469_p3 >> zext_ln32_61_fu_491_p1;

assign lshr_ln32_13_fu_539_p2 = 64'd18446744073709551615 >> zext_ln32_62_fu_536_p1;

assign lshr_ln32_fu_401_p2 = select_ln32_18_fu_375_p3 >> zext_ln32_57_fu_397_p1;

assign lshr_ln_fu_276_p4 = {{kk_0_i_i_reg_165[6:2]}};

assign row_coord_int_fu_207_p3 = ((is_padding_reg_576[0:0] == 1'b1) ? 4'd0 : trunc_ln165_reg_566);

assign select_ln32_18_fu_375_p3 = ((icmp_ln32_fu_325_p2[0:0] == 1'b1) ? tmp_79_fu_339_p4 : in_data_q0);

assign select_ln32_19_fu_383_p3 = ((icmp_ln32_fu_325_p2[0:0] == 1'b1) ? xor_ln32_fu_355_p2 : zext_ln32_55_fu_331_p1);

assign select_ln32_20_fu_461_p3 = ((icmp_ln32_4_fu_419_p2[0:0] == 1'b1) ? sub_ln32_25_fu_443_p2 : sub_ln32_26_fu_455_p2);

assign select_ln32_21_fu_469_p3 = ((icmp_ln32_4_fu_419_p2[0:0] == 1'b1) ? tmp_80_fu_433_p4 : in_data_q0);

assign select_ln32_22_fu_477_p3 = ((icmp_ln32_4_fu_419_p2[0:0] == 1'b1) ? xor_ln32_4_fu_449_p2 : zext_ln32_59_fu_425_p1);

assign select_ln32_fu_367_p3 = ((icmp_ln32_fu_325_p2[0:0] == 1'b1) ? sub_ln32_22_fu_349_p2 : sub_ln32_23_fu_361_p2);

assign sext_ln32_fu_293_p1 = (tmp_78_fu_286_p3);

assign sub_ln32_22_fu_349_p2 = (zext_ln32_55_fu_331_p1 - zext_ln32_56_fu_335_p1);

assign sub_ln32_23_fu_361_p2 = (zext_ln32_56_fu_335_p1 - zext_ln32_55_fu_331_p1);

assign sub_ln32_24_fu_391_p2 = (7'd63 - select_ln32_fu_367_p3);

assign sub_ln32_25_fu_443_p2 = (zext_ln32_59_fu_425_p1 - zext_ln32_60_fu_429_p1);

assign sub_ln32_26_fu_455_p2 = (zext_ln32_60_fu_429_p1 - zext_ln32_59_fu_425_p1);

assign sub_ln32_27_fu_485_p2 = (7'd63 - select_ln32_20_fu_461_p3);

assign sub_ln32_cast_fu_250_p1 = (sub_ln32_fu_244_p2);

assign sub_ln32_fu_244_p2 = (zext_ln32_fu_228_p1 - zext_ln32_53_fu_240_p1);

assign tmp_54_fu_312_p3 = {{empty_144_reg_603}, {4'd0}};

assign tmp_78_fu_286_p3 = {{add_ln32_reg_584}, {lshr_ln_fu_276_p4}};

integer ap_tvar_int_0;

always @ (in_data_q0) begin
    //for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
    for (ap_tvar_int_0 = 0; ap_tvar_int_0 < 64; ap_tvar_int_0 = ap_tvar_int_0 + 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_79_fu_339_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_79_fu_339_p4[ap_tvar_int_0] = in_data_q0[63 - ap_tvar_int_0];
        end
    end
end

integer ap_tvar_int_1;

always @ (in_data_q0) begin
    //for (ap_tvar_int_1 = 64 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
    for (ap_tvar_int_1 = 0; ap_tvar_int_1 < 64; ap_tvar_int_1 = ap_tvar_int_1 + 1) begin
        if (ap_tvar_int_1 > 63 - 0) begin
            tmp_80_fu_433_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            tmp_80_fu_433_p4[ap_tvar_int_1] = in_data_q0[63 - ap_tvar_int_1];
        end
    end
end

assign tmp_fu_220_p3 = {{row_coord_int_fu_207_p3}, {4'd0}};

assign tmp_s_fu_232_p3 = {{row_coord_int_fu_207_p3}, {1'd0}};

assign trunc_ln165_fu_176_p1 = indices_01_dout[3:0];

assign trunc_ln32_7_fu_550_p1 = and_ln32_4_fu_545_p2[15:0];

assign trunc_ln32_fu_515_p1 = and_ln32_fu_510_p2[15:0];

assign xor_ln32_4_fu_449_p2 = (zext_ln32_59_fu_425_p1 ^ 7'd63);

assign xor_ln32_fu_355_p2 = (zext_ln32_55_fu_331_p1 ^ 7'd63);

assign zext_ln32_53_fu_240_p1 = tmp_s_fu_232_p3;

assign zext_ln32_54_fu_254_p1 = col_coord_int_fu_213_p3;

assign zext_ln32_55_fu_331_p1 = tmp_54_fu_312_p3;

assign zext_ln32_56_fu_335_p1 = empty_145_fu_319_p2;

assign zext_ln32_57_fu_397_p1 = select_ln32_19_fu_383_p3;

assign zext_ln32_58_fu_501_p1 = sub_ln32_24_reg_613;

assign zext_ln32_59_fu_425_p1 = empty_146_fu_407_p2;

assign zext_ln32_60_fu_429_p1 = empty_147_fu_413_p2;

assign zext_ln32_61_fu_491_p1 = select_ln32_22_fu_477_p3;

assign zext_ln32_62_fu_536_p1 = sub_ln32_27_reg_623;

assign zext_ln32_fu_228_p1 = tmp_fu_220_p3;

assign zext_ln33_fu_531_p1 = lshr_ln5_reg_608_pp0_iter1_reg;

always @ (posedge ap_clk) begin
    sub_ln32_24_reg_613[0] <= 1'b0;
    sub_ln32_27_reg_623[0] <= 1'b0;
end

endmodule //td_fused_top_tdf12_readInputs
