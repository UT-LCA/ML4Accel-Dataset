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

module td_fused_top_tdf3_writeOutputs_unaligned (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        indices_01_dout,
        indices_01_empty_n,
        indices_01_read,
        indices_12_dout,
        indices_12_empty_n,
        indices_12_read,
        p_read,
        out_data_address0,
        out_data_ce0,
        out_data_q0,
        out_data_address1,
        out_data_ce1,
        out_data_we1,
        out_data_d1
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [5:0] indices_01_dout;
input   indices_01_empty_n;
output   indices_01_read;
input  [11:0] indices_12_dout;
input   indices_12_empty_n;
output   indices_12_read;
input  [15:0] p_read;
output  [11:0] out_data_address0;
output   out_data_ce0;
input  [255:0] out_data_q0;
output  [11:0] out_data_address1;
output   out_data_ce1;
output   out_data_we1;
output  [255:0] out_data_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg indices_01_read;
reg indices_12_read;
reg out_data_ce0;
reg out_data_ce1;
reg out_data_we1;

reg    ap_done_reg;
  reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] outputCount_4;
reg   [15:0] outputChanIdx_4;
reg   [15:0] outputRow_8_0;
reg   [15:0] outputRow_8_1;
reg   [15:0] outputRow_8_2;
reg   [15:0] outputRow_8_3;
reg    indices_01_blk_n;
reg    indices_12_blk_n;
reg   [11:0] out_data_addr_reg_903;
wire   [15:0] add_ln86_fu_208_p2;
wire   [0:0] icmp_ln87_fu_214_p2;
reg   [0:0] icmp_ln87_reg_917;
reg   [15:0] ap_phi_mux_empty_139_phi_fu_132_p4;
reg   [15:0] empty_139_reg_129;
reg    ap_block_state1;
wire    ap_CS_fsm_state2;
wire   [63:0] zext_ln93_59_fu_171_p1;
wire   [15:0] select_ln96_fu_883_p3;
wire   [1:0] trunc_ln85_fu_180_p1;
wire   [8:0] tmp_s_fu_147_p3;
wire   [11:0] tmp_fu_139_p3;
wire   [11:0] zext_ln93_fu_155_p1;
wire   [11:0] sub_ln93_fu_159_p2;
wire   [11:0] add_ln93_fu_165_p2;
wire   [1:0] trunc_ln93_fu_228_p1;
wire   [7:0] shl_ln_fu_244_p3;
wire   [7:0] empty_fu_252_p2;
wire   [15:0] bitcast_ln93_fu_240_p1;
wire   [8:0] zext_ln93_60_fu_264_p1;
wire   [0:0] icmp_ln93_fu_258_p2;
wire   [8:0] zext_ln93_61_fu_268_p1;
wire   [8:0] xor_ln93_fu_276_p2;
wire   [8:0] select_ln93_fu_282_p3;
wire   [8:0] select_ln93_32_fu_298_p3;
wire   [8:0] select_ln93_31_fu_290_p3;
wire   [8:0] xor_ln93_23_fu_306_p2;
wire   [255:0] zext_ln93_62_fu_272_p1;
wire   [255:0] zext_ln93_63_fu_312_p1;
wire   [255:0] shl_ln93_fu_324_p2;
reg   [255:0] tmp_75_fu_330_p4;
wire   [255:0] zext_ln93_64_fu_316_p1;
wire   [255:0] zext_ln93_65_fu_320_p1;
wire   [255:0] shl_ln93_19_fu_348_p2;
wire   [255:0] lshr_ln93_fu_354_p2;
wire   [255:0] and_ln93_fu_360_p2;
wire   [255:0] xor_ln93_24_fu_366_p2;
wire   [255:0] select_ln93_33_fu_340_p3;
wire   [255:0] and_ln93_23_fu_372_p2;
wire   [255:0] and_ln93_24_fu_378_p2;
wire   [3:0] trunc_ln_fu_232_p3;
wire   [3:0] or_ln93_fu_394_p2;
wire   [7:0] shl_ln93_9_fu_404_p3;
wire   [7:0] empty_136_fu_412_p2;
wire   [15:0] bitcast_ln93_13_fu_400_p1;
wire   [8:0] zext_ln93_66_fu_424_p1;
wire   [0:0] icmp_ln93_7_fu_418_p2;
wire   [8:0] zext_ln93_67_fu_428_p1;
wire   [8:0] xor_ln93_25_fu_436_p2;
wire   [8:0] select_ln93_34_fu_442_p3;
wire   [8:0] select_ln93_36_fu_458_p3;
wire   [8:0] select_ln93_35_fu_450_p3;
wire   [8:0] xor_ln93_26_fu_466_p2;
wire   [255:0] zext_ln93_68_fu_432_p1;
wire   [255:0] zext_ln93_69_fu_472_p1;
wire   [255:0] shl_ln93_20_fu_484_p2;
reg   [255:0] tmp_76_fu_490_p4;
wire   [255:0] zext_ln93_70_fu_476_p1;
wire   [255:0] zext_ln93_71_fu_480_p1;
wire   [255:0] shl_ln93_21_fu_508_p2;
wire   [255:0] lshr_ln93_7_fu_514_p2;
wire   [255:0] and_ln93_25_fu_520_p2;
wire   [255:0] or_ln93_11_fu_384_p2;
wire   [255:0] xor_ln93_27_fu_526_p2;
wire   [255:0] select_ln93_37_fu_500_p3;
wire   [255:0] and_ln93_26_fu_532_p2;
wire   [255:0] and_ln93_27_fu_538_p2;
wire   [3:0] or_ln93_5_fu_554_p2;
wire   [7:0] shl_ln93_s_fu_564_p3;
wire   [7:0] empty_137_fu_572_p2;
wire   [15:0] bitcast_ln93_14_fu_560_p1;
wire   [8:0] zext_ln93_72_fu_584_p1;
wire   [0:0] icmp_ln93_8_fu_578_p2;
wire   [8:0] zext_ln93_73_fu_588_p1;
wire   [8:0] xor_ln93_28_fu_596_p2;
wire   [8:0] select_ln93_38_fu_602_p3;
wire   [8:0] select_ln93_40_fu_618_p3;
wire   [8:0] select_ln93_39_fu_610_p3;
wire   [8:0] xor_ln93_29_fu_626_p2;
wire   [255:0] zext_ln93_74_fu_592_p1;
wire   [255:0] zext_ln93_75_fu_632_p1;
wire   [255:0] shl_ln93_22_fu_644_p2;
reg   [255:0] tmp_77_fu_650_p4;
wire   [255:0] zext_ln93_76_fu_636_p1;
wire   [255:0] zext_ln93_77_fu_640_p1;
wire   [255:0] shl_ln93_23_fu_668_p2;
wire   [255:0] lshr_ln93_8_fu_674_p2;
wire   [255:0] and_ln93_28_fu_680_p2;
wire   [255:0] or_ln93_12_fu_544_p2;
wire   [255:0] xor_ln93_30_fu_686_p2;
wire   [255:0] select_ln93_41_fu_660_p3;
wire   [255:0] and_ln93_29_fu_692_p2;
wire   [255:0] and_ln93_30_fu_698_p2;
wire   [3:0] or_ln93_6_fu_714_p2;
wire   [7:0] shl_ln93_1_fu_724_p3;
wire   [7:0] empty_138_fu_732_p2;
wire   [15:0] bitcast_ln93_15_fu_720_p1;
wire   [8:0] zext_ln93_78_fu_744_p1;
wire   [0:0] icmp_ln93_9_fu_738_p2;
wire   [8:0] zext_ln93_79_fu_748_p1;
wire   [8:0] xor_ln93_31_fu_756_p2;
wire   [8:0] select_ln93_42_fu_762_p3;
wire   [8:0] select_ln93_44_fu_778_p3;
wire   [8:0] select_ln93_43_fu_770_p3;
wire   [8:0] xor_ln93_32_fu_786_p2;
wire   [255:0] zext_ln93_80_fu_752_p1;
wire   [255:0] zext_ln93_81_fu_792_p1;
wire   [255:0] shl_ln93_24_fu_804_p2;
reg   [255:0] tmp_78_fu_810_p4;
wire   [255:0] zext_ln93_82_fu_796_p1;
wire   [255:0] zext_ln93_83_fu_800_p1;
wire   [255:0] shl_ln93_25_fu_828_p2;
wire   [255:0] lshr_ln93_9_fu_834_p2;
wire   [255:0] and_ln93_31_fu_840_p2;
wire   [255:0] or_ln93_13_fu_704_p2;
wire   [255:0] xor_ln93_33_fu_846_p2;
wire   [255:0] select_ln93_45_fu_820_p3;
wire   [255:0] and_ln93_32_fu_852_p2;
wire   [255:0] and_ln93_33_fu_858_p2;
wire   [15:0] add_ln95_fu_871_p2;
wire   [0:0] icmp_ln96_fu_877_p2;
reg   [1:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
#0 outputCount_4 = 16'd0;
#0 outputChanIdx_4 = 16'd0;
#0 outputRow_8_0 = 16'd0;
#0 outputRow_8_1 = 16'd0;
#0 outputRow_8_2 = 16'd0;
#0 outputRow_8_3 = 16'd0;
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
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln87_reg_917 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_139_reg_129 <= 16'd0;
    end else if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (icmp_ln87_fu_214_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        empty_139_reg_129 <= add_ln86_fu_208_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln87_reg_917 <= icmp_ln87_fu_214_p2;
        out_data_addr_reg_903 <= zext_ln93_59_fu_171_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln87_reg_917 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        outputChanIdx_4 <= select_ln96_fu_883_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        outputCount_4 <= ap_phi_mux_empty_139_phi_fu_132_p4;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (trunc_ln85_fu_180_p1 == 2'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_8_0 <= p_read;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (trunc_ln85_fu_180_p1 == 2'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_8_1 <= p_read;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (trunc_ln85_fu_180_p1 == 2'd2) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_8_2 <= p_read;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (trunc_ln85_fu_180_p1 == 2'd3) & (1'b1 == ap_CS_fsm_state1))) begin
        outputRow_8_3 <= p_read;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
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
    if (((icmp_ln87_reg_917 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_phi_mux_empty_139_phi_fu_132_p4 = 16'd0;
    end else begin
        ap_phi_mux_empty_139_phi_fu_132_p4 = empty_139_reg_129;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
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
    if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
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
    if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indices_12_read = 1'b1;
    end else begin
        indices_12_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        out_data_ce0 = 1'b1;
    end else begin
        out_data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        out_data_ce1 = 1'b1;
    end else begin
        out_data_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln87_reg_917 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        out_data_we1 = 1'b1;
    end else begin
        out_data_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln86_fu_208_p2 = (outputCount_4 + 16'd1);

assign add_ln93_fu_165_p2 = (sub_ln93_fu_159_p2 + indices_12_dout);

assign add_ln95_fu_871_p2 = (outputChanIdx_4 + 16'd1);

assign and_ln93_23_fu_372_p2 = (xor_ln93_24_fu_366_p2 & out_data_q0);

assign and_ln93_24_fu_378_p2 = (select_ln93_33_fu_340_p3 & and_ln93_fu_360_p2);

assign and_ln93_25_fu_520_p2 = (shl_ln93_21_fu_508_p2 & lshr_ln93_7_fu_514_p2);

assign and_ln93_26_fu_532_p2 = (xor_ln93_27_fu_526_p2 & or_ln93_11_fu_384_p2);

assign and_ln93_27_fu_538_p2 = (select_ln93_37_fu_500_p3 & and_ln93_25_fu_520_p2);

assign and_ln93_28_fu_680_p2 = (shl_ln93_23_fu_668_p2 & lshr_ln93_8_fu_674_p2);

assign and_ln93_29_fu_692_p2 = (xor_ln93_30_fu_686_p2 & or_ln93_12_fu_544_p2);

assign and_ln93_30_fu_698_p2 = (select_ln93_41_fu_660_p3 & and_ln93_28_fu_680_p2);

assign and_ln93_31_fu_840_p2 = (shl_ln93_25_fu_828_p2 & lshr_ln93_9_fu_834_p2);

assign and_ln93_32_fu_852_p2 = (xor_ln93_33_fu_846_p2 & or_ln93_13_fu_704_p2);

assign and_ln93_33_fu_858_p2 = (select_ln93_45_fu_820_p3 & and_ln93_31_fu_840_p2);

assign and_ln93_fu_360_p2 = (shl_ln93_19_fu_348_p2 & lshr_ln93_fu_354_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_12_empty_n == 1'b0) | (indices_01_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign bitcast_ln93_13_fu_400_p1 = outputRow_8_1;

assign bitcast_ln93_14_fu_560_p1 = outputRow_8_2;

assign bitcast_ln93_15_fu_720_p1 = outputRow_8_3;

assign bitcast_ln93_fu_240_p1 = outputRow_8_0;

assign empty_136_fu_412_p2 = (shl_ln93_9_fu_404_p3 | 8'd15);

assign empty_137_fu_572_p2 = (shl_ln93_s_fu_564_p3 | 8'd15);

assign empty_138_fu_732_p2 = (shl_ln93_1_fu_724_p3 | 8'd15);

assign empty_fu_252_p2 = (shl_ln_fu_244_p3 | 8'd15);

assign icmp_ln87_fu_214_p2 = ((add_ln86_fu_208_p2 == 16'd4) ? 1'b1 : 1'b0);

assign icmp_ln93_7_fu_418_p2 = ((shl_ln93_9_fu_404_p3 > empty_136_fu_412_p2) ? 1'b1 : 1'b0);

assign icmp_ln93_8_fu_578_p2 = ((shl_ln93_s_fu_564_p3 > empty_137_fu_572_p2) ? 1'b1 : 1'b0);

assign icmp_ln93_9_fu_738_p2 = ((shl_ln93_1_fu_724_p3 > empty_138_fu_732_p2) ? 1'b1 : 1'b0);

assign icmp_ln93_fu_258_p2 = ((shl_ln_fu_244_p3 > empty_fu_252_p2) ? 1'b1 : 1'b0);

assign icmp_ln96_fu_877_p2 = ((add_ln95_fu_871_p2 == 16'd4) ? 1'b1 : 1'b0);

assign lshr_ln93_7_fu_514_p2 = 256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 >> zext_ln93_71_fu_480_p1;

assign lshr_ln93_8_fu_674_p2 = 256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 >> zext_ln93_77_fu_640_p1;

assign lshr_ln93_9_fu_834_p2 = 256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 >> zext_ln93_83_fu_800_p1;

assign lshr_ln93_fu_354_p2 = 256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 >> zext_ln93_65_fu_320_p1;

assign or_ln93_11_fu_384_p2 = (and_ln93_24_fu_378_p2 | and_ln93_23_fu_372_p2);

assign or_ln93_12_fu_544_p2 = (and_ln93_27_fu_538_p2 | and_ln93_26_fu_532_p2);

assign or_ln93_13_fu_704_p2 = (and_ln93_30_fu_698_p2 | and_ln93_29_fu_692_p2);

assign or_ln93_5_fu_554_p2 = (trunc_ln_fu_232_p3 | 4'd2);

assign or_ln93_6_fu_714_p2 = (trunc_ln_fu_232_p3 | 4'd3);

assign or_ln93_fu_394_p2 = (trunc_ln_fu_232_p3 | 4'd1);

assign out_data_address0 = zext_ln93_59_fu_171_p1;

assign out_data_address1 = out_data_addr_reg_903;

assign out_data_d1 = (and_ln93_33_fu_858_p2 | and_ln93_32_fu_852_p2);

assign select_ln93_31_fu_290_p3 = ((icmp_ln93_fu_258_p2[0:0] == 1'b1) ? zext_ln93_61_fu_268_p1 : zext_ln93_60_fu_264_p1);

assign select_ln93_32_fu_298_p3 = ((icmp_ln93_fu_258_p2[0:0] == 1'b1) ? xor_ln93_fu_276_p2 : zext_ln93_60_fu_264_p1);

assign select_ln93_33_fu_340_p3 = ((icmp_ln93_fu_258_p2[0:0] == 1'b1) ? tmp_75_fu_330_p4 : shl_ln93_fu_324_p2);

assign select_ln93_34_fu_442_p3 = ((icmp_ln93_7_fu_418_p2[0:0] == 1'b1) ? zext_ln93_66_fu_424_p1 : zext_ln93_67_fu_428_p1);

assign select_ln93_35_fu_450_p3 = ((icmp_ln93_7_fu_418_p2[0:0] == 1'b1) ? zext_ln93_67_fu_428_p1 : zext_ln93_66_fu_424_p1);

assign select_ln93_36_fu_458_p3 = ((icmp_ln93_7_fu_418_p2[0:0] == 1'b1) ? xor_ln93_25_fu_436_p2 : zext_ln93_66_fu_424_p1);

assign select_ln93_37_fu_500_p3 = ((icmp_ln93_7_fu_418_p2[0:0] == 1'b1) ? tmp_76_fu_490_p4 : shl_ln93_20_fu_484_p2);

assign select_ln93_38_fu_602_p3 = ((icmp_ln93_8_fu_578_p2[0:0] == 1'b1) ? zext_ln93_72_fu_584_p1 : zext_ln93_73_fu_588_p1);

assign select_ln93_39_fu_610_p3 = ((icmp_ln93_8_fu_578_p2[0:0] == 1'b1) ? zext_ln93_73_fu_588_p1 : zext_ln93_72_fu_584_p1);

assign select_ln93_40_fu_618_p3 = ((icmp_ln93_8_fu_578_p2[0:0] == 1'b1) ? xor_ln93_28_fu_596_p2 : zext_ln93_72_fu_584_p1);

assign select_ln93_41_fu_660_p3 = ((icmp_ln93_8_fu_578_p2[0:0] == 1'b1) ? tmp_77_fu_650_p4 : shl_ln93_22_fu_644_p2);

assign select_ln93_42_fu_762_p3 = ((icmp_ln93_9_fu_738_p2[0:0] == 1'b1) ? zext_ln93_78_fu_744_p1 : zext_ln93_79_fu_748_p1);

assign select_ln93_43_fu_770_p3 = ((icmp_ln93_9_fu_738_p2[0:0] == 1'b1) ? zext_ln93_79_fu_748_p1 : zext_ln93_78_fu_744_p1);

assign select_ln93_44_fu_778_p3 = ((icmp_ln93_9_fu_738_p2[0:0] == 1'b1) ? xor_ln93_31_fu_756_p2 : zext_ln93_78_fu_744_p1);

assign select_ln93_45_fu_820_p3 = ((icmp_ln93_9_fu_738_p2[0:0] == 1'b1) ? tmp_78_fu_810_p4 : shl_ln93_24_fu_804_p2);

assign select_ln93_fu_282_p3 = ((icmp_ln93_fu_258_p2[0:0] == 1'b1) ? zext_ln93_60_fu_264_p1 : zext_ln93_61_fu_268_p1);

assign select_ln96_fu_883_p3 = ((icmp_ln96_fu_877_p2[0:0] == 1'b1) ? 16'd0 : add_ln95_fu_871_p2);

assign shl_ln93_19_fu_348_p2 = 256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 << zext_ln93_64_fu_316_p1;

assign shl_ln93_1_fu_724_p3 = {{or_ln93_6_fu_714_p2}, {4'd0}};

assign shl_ln93_20_fu_484_p2 = zext_ln93_68_fu_432_p1 << zext_ln93_69_fu_472_p1;

assign shl_ln93_21_fu_508_p2 = 256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 << zext_ln93_70_fu_476_p1;

assign shl_ln93_22_fu_644_p2 = zext_ln93_74_fu_592_p1 << zext_ln93_75_fu_632_p1;

assign shl_ln93_23_fu_668_p2 = 256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 << zext_ln93_76_fu_636_p1;

assign shl_ln93_24_fu_804_p2 = zext_ln93_80_fu_752_p1 << zext_ln93_81_fu_792_p1;

assign shl_ln93_25_fu_828_p2 = 256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 << zext_ln93_82_fu_796_p1;

assign shl_ln93_9_fu_404_p3 = {{or_ln93_fu_394_p2}, {4'd0}};

assign shl_ln93_fu_324_p2 = zext_ln93_62_fu_272_p1 << zext_ln93_63_fu_312_p1;

assign shl_ln93_s_fu_564_p3 = {{or_ln93_5_fu_554_p2}, {4'd0}};

assign shl_ln_fu_244_p3 = {{trunc_ln93_fu_228_p1}, {6'd0}};

assign sub_ln93_fu_159_p2 = (tmp_fu_139_p3 - zext_ln93_fu_155_p1);

integer ap_tvar_int_0;

always @ (shl_ln93_fu_324_p2) begin
    //for (ap_tvar_int_0 = 256 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
    for (ap_tvar_int_0 = 0; ap_tvar_int_0 < 256; ap_tvar_int_0 = ap_tvar_int_0 + 1) begin
        if (ap_tvar_int_0 > 255 - 0) begin
            tmp_75_fu_330_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_75_fu_330_p4[ap_tvar_int_0] = shl_ln93_fu_324_p2[255 - ap_tvar_int_0];
        end
    end
end

integer ap_tvar_int_1;

always @ (shl_ln93_20_fu_484_p2) begin
    //for (ap_tvar_int_1 = 256 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
    for (ap_tvar_int_1 = 0; ap_tvar_int_1 < 256; ap_tvar_int_1 = ap_tvar_int_1 + 1) begin
        if (ap_tvar_int_1 > 255 - 0) begin
            tmp_76_fu_490_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            tmp_76_fu_490_p4[ap_tvar_int_1] = shl_ln93_20_fu_484_p2[255 - ap_tvar_int_1];
        end
    end
end

integer ap_tvar_int_2;

always @ (shl_ln93_22_fu_644_p2) begin
    //for (ap_tvar_int_2 = 256 - 1; ap_tvar_int_2 >= 0; ap_tvar_int_2 = ap_tvar_int_2 - 1) begin
    for (ap_tvar_int_2 = 0; ap_tvar_int_2 < 256; ap_tvar_int_2 = ap_tvar_int_2 + 1) begin
        if (ap_tvar_int_2 > 255 - 0) begin
            tmp_77_fu_650_p4[ap_tvar_int_2] = 1'b0;
        end else begin
            tmp_77_fu_650_p4[ap_tvar_int_2] = shl_ln93_22_fu_644_p2[255 - ap_tvar_int_2];
        end
    end
end

integer ap_tvar_int_3;

always @ (shl_ln93_24_fu_804_p2) begin
    //for (ap_tvar_int_3 = 256 - 1; ap_tvar_int_3 >= 0; ap_tvar_int_3 = ap_tvar_int_3 - 1) begin
    for (ap_tvar_int_3 = 0; ap_tvar_int_3 < 256; ap_tvar_int_3 = ap_tvar_int_3 + 1) begin
        if (ap_tvar_int_3 > 255 - 0) begin
            tmp_78_fu_810_p4[ap_tvar_int_3] = 1'b0;
        end else begin
            tmp_78_fu_810_p4[ap_tvar_int_3] = shl_ln93_24_fu_804_p2[255 - ap_tvar_int_3];
        end
    end
end

assign tmp_fu_139_p3 = {{indices_01_dout}, {6'd0}};

assign tmp_s_fu_147_p3 = {{indices_01_dout}, {3'd0}};

assign trunc_ln85_fu_180_p1 = outputCount_4[1:0];

assign trunc_ln93_fu_228_p1 = outputChanIdx_4[1:0];

assign trunc_ln_fu_232_p3 = {{trunc_ln93_fu_228_p1}, {2'd0}};

assign xor_ln93_23_fu_306_p2 = (select_ln93_fu_282_p3 ^ 9'd255);

assign xor_ln93_24_fu_366_p2 = (256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 ^ and_ln93_fu_360_p2);

assign xor_ln93_25_fu_436_p2 = (zext_ln93_66_fu_424_p1 ^ 9'd255);

assign xor_ln93_26_fu_466_p2 = (select_ln93_34_fu_442_p3 ^ 9'd255);

assign xor_ln93_27_fu_526_p2 = (256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 ^ and_ln93_25_fu_520_p2);

assign xor_ln93_28_fu_596_p2 = (zext_ln93_72_fu_584_p1 ^ 9'd255);

assign xor_ln93_29_fu_626_p2 = (select_ln93_38_fu_602_p3 ^ 9'd255);

assign xor_ln93_30_fu_686_p2 = (256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 ^ and_ln93_28_fu_680_p2);

assign xor_ln93_31_fu_756_p2 = (zext_ln93_78_fu_744_p1 ^ 9'd255);

assign xor_ln93_32_fu_786_p2 = (select_ln93_42_fu_762_p3 ^ 9'd255);

assign xor_ln93_33_fu_846_p2 = (256'd115792089237316195423570985008687907853269984665640564039457584007913129639935 ^ and_ln93_31_fu_840_p2);

assign xor_ln93_fu_276_p2 = (zext_ln93_60_fu_264_p1 ^ 9'd255);

assign zext_ln93_59_fu_171_p1 = add_ln93_fu_165_p2;

assign zext_ln93_60_fu_264_p1 = shl_ln_fu_244_p3;

assign zext_ln93_61_fu_268_p1 = empty_fu_252_p2;

assign zext_ln93_62_fu_272_p1 = bitcast_ln93_fu_240_p1;

assign zext_ln93_63_fu_312_p1 = select_ln93_32_fu_298_p3;

assign zext_ln93_64_fu_316_p1 = select_ln93_31_fu_290_p3;

assign zext_ln93_65_fu_320_p1 = xor_ln93_23_fu_306_p2;

assign zext_ln93_66_fu_424_p1 = shl_ln93_9_fu_404_p3;

assign zext_ln93_67_fu_428_p1 = empty_136_fu_412_p2;

assign zext_ln93_68_fu_432_p1 = bitcast_ln93_13_fu_400_p1;

assign zext_ln93_69_fu_472_p1 = select_ln93_36_fu_458_p3;

assign zext_ln93_70_fu_476_p1 = select_ln93_35_fu_450_p3;

assign zext_ln93_71_fu_480_p1 = xor_ln93_26_fu_466_p2;

assign zext_ln93_72_fu_584_p1 = shl_ln93_s_fu_564_p3;

assign zext_ln93_73_fu_588_p1 = empty_137_fu_572_p2;

assign zext_ln93_74_fu_592_p1 = bitcast_ln93_14_fu_560_p1;

assign zext_ln93_75_fu_632_p1 = select_ln93_40_fu_618_p3;

assign zext_ln93_76_fu_636_p1 = select_ln93_39_fu_610_p3;

assign zext_ln93_77_fu_640_p1 = xor_ln93_29_fu_626_p2;

assign zext_ln93_78_fu_744_p1 = shl_ln93_1_fu_724_p3;

assign zext_ln93_79_fu_748_p1 = empty_138_fu_732_p2;

assign zext_ln93_80_fu_752_p1 = bitcast_ln93_15_fu_720_p1;

assign zext_ln93_81_fu_792_p1 = select_ln93_44_fu_778_p3;

assign zext_ln93_82_fu_796_p1 = select_ln93_43_fu_770_p3;

assign zext_ln93_83_fu_800_p1 = xor_ln93_32_fu_786_p2;

assign zext_ln93_fu_155_p1 = tmp_s_fu_147_p3;

endmodule //td_fused_top_tdf3_writeOutputs_unaligned
