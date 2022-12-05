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

module td_fused_top_td_fused_axi_in (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        stream_in_TDATA,
        stream_in_TVALID,
        stream_in_TREADY,
        stream_in_TKEEP,
        stream_in_TSTRB,
        stream_in_TLAST,
        fmaps_address1,
        fmaps_ce1,
        fmaps_we1,
        fmaps_d1
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
input  [15:0] stream_in_TDATA;
input   stream_in_TVALID;
output   stream_in_TREADY;
input  [1:0] stream_in_TKEEP;
input  [1:0] stream_in_TSTRB;
input  [0:0] stream_in_TLAST;
output  [15:0] fmaps_address1;
output   fmaps_ce1;
output   fmaps_we1;
output  [63:0] fmaps_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg stream_in_TREADY;
reg fmaps_ce1;
reg fmaps_we1;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [17:0] indvar_flatten16_reg_185;
reg   [9:0] indvar_flatten_reg_196;
reg   [1:0] ch_reg_207;
reg   [7:0] r_reg_218;
reg   [7:0] c_reg_229;
wire   [17:0] add_ln17_fu_240_p2;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln17_fu_246_p2;
reg   [0:0] icmp_ln17_reg_483;
reg   [0:0] icmp_ln17_reg_483_pp0_iter1_reg;
reg   [0:0] icmp_ln17_reg_483_pp0_iter2_reg;
wire   [0:0] icmp_ln18_fu_255_p2;
reg   [0:0] icmp_ln18_reg_487;
reg   [0:0] icmp_ln18_reg_487_pp0_iter1_reg;
wire   [0:0] and_ln22_fu_273_p2;
reg   [0:0] and_ln22_reg_493;
reg   [0:0] and_ln22_reg_493_pp0_iter1_reg;
wire   [0:0] icmp_ln25_fu_319_p2;
reg   [0:0] icmp_ln25_reg_498;
reg   [0:0] icmp_ln25_reg_498_pp0_iter1_reg;
wire   [1:0] add_ln20_fu_330_p2;
wire   [9:0] select_ln18_fu_342_p3;
wire   [15:0] p_q4;
reg   [15:0] p_load_3_reg_512;
reg    ap_enable_reg_pp0_iter1;
wire   [7:0] select_ln22_1_fu_363_p3;
reg   [7:0] select_ln22_1_reg_517;
reg    ap_enable_reg_pp0_iter2;
wire   [7:0] select_ln19_48_fu_402_p3;
reg   [7:0] select_ln19_48_reg_522;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_flush_enable;
reg    ap_condition_pp0_exit_iter2_state4;
reg    ap_enable_reg_pp0_iter3;
wire   [1:0] p_address0;
reg    p_ce0;
reg    p_we0;
wire   [15:0] p_d0;
wire   [1:0] p_address1;
reg    p_ce1;
wire   [15:0] p_q1;
wire   [1:0] p_address2;
reg    p_ce2;
wire   [15:0] p_q2;
wire   [1:0] p_address3;
reg    p_ce3;
wire   [15:0] p_q3;
wire   [1:0] p_address4;
reg    p_ce4;
reg   [7:0] ap_phi_mux_r_phi_fu_222_p4;
wire    ap_block_pp0_stage0;
reg   [7:0] ap_phi_mux_c_phi_fu_233_p4;
wire   [63:0] zext_ln20_fu_293_p1;
wire   [63:0] zext_ln27_2_fu_419_p1;
reg   [15:0] tmp_data_1_fu_88;
wire   [15:0] tmp_data_fu_310_p3;
wire   [0:0] empty_154_nbread_fu_96_p5_0;
wire   [0:0] icmp_ln20_fu_267_p2;
wire   [0:0] xor_ln22_fu_261_p2;
wire   [0:0] or_ln19_fu_279_p2;
wire   [1:0] select_ln19_fu_285_p3;
wire   [15:0] tmp_data_2_fu_306_p1;
wire   [9:0] add_ln18_2_fu_336_p2;
wire   [7:0] r_2_fu_350_p2;
wire   [12:0] tmp_22_fu_378_p3;
wire   [15:0] tmp_fu_370_p3;
wire   [15:0] zext_ln27_fu_386_p1;
wire   [7:0] select_ln22_fu_356_p3;
wire   [7:0] c_2_fu_396_p2;
wire   [15:0] sub_ln27_fu_390_p2;
wire   [15:0] zext_ln27_1_fu_409_p1;
wire   [15:0] add_ln27_fu_413_p2;
wire   [15:0] bitcast_ln27_3_fu_436_p1;
wire   [15:0] bitcast_ln27_2_fu_432_p1;
wire   [15:0] bitcast_ln27_1_fu_428_p1;
wire   [15:0] bitcast_ln27_fu_424_p1;
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

td_fused_top_td_fused_axi_in_p #(
    .DataWidth( 16 ),
    .AddressRange( 4 ),
    .AddressWidth( 2 ))
p_U(
    .reset(ap_rst),
    .clk(ap_clk),
    .address0(p_address0),
    .ce0(p_ce0),
    .we0(p_we0),
    .d0(p_d0),
    .address1(p_address1),
    .ce1(p_ce1),
    .q1(p_q1),
    .address2(p_address2),
    .ce2(p_ce2),
    .q2(p_q2),
    .address3(p_address3),
    .ce3(p_ce3),
    .q3(p_q3),
    .address4(p_address4),
    .ce4(p_ce4),
    .q4(p_q4)
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
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter2_state4) & (ap_enable_reg_pp0_iter1 == 1'b0)) | (~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter2_state4))) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter1;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_483_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        c_reg_229 <= select_ln19_48_reg_522;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        c_reg_229 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_fu_246_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ch_reg_207 <= add_ln20_fu_330_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ch_reg_207 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_fu_246_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten16_reg_185 <= add_ln17_fu_240_p2;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten16_reg_185 <= 18'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_fu_246_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_196 <= select_ln18_fu_342_p3;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_196 <= 10'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_483_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        r_reg_218 <= select_ln22_1_reg_517;
    end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        r_reg_218 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_fu_246_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        and_ln22_reg_493 <= and_ln22_fu_273_p2;
        icmp_ln18_reg_487 <= icmp_ln18_fu_255_p2;
        icmp_ln25_reg_498 <= icmp_ln25_fu_319_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        and_ln22_reg_493_pp0_iter1_reg <= and_ln22_reg_493;
        icmp_ln17_reg_483 <= icmp_ln17_fu_246_p2;
        icmp_ln17_reg_483_pp0_iter1_reg <= icmp_ln17_reg_483;
        icmp_ln18_reg_487_pp0_iter1_reg <= icmp_ln18_reg_487;
        icmp_ln25_reg_498_pp0_iter1_reg <= icmp_ln25_reg_498;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        icmp_ln17_reg_483_pp0_iter2_reg <= icmp_ln17_reg_483_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln25_reg_498 == 1'd1) & (icmp_ln17_reg_483 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        p_load_3_reg_512 <= p_q4;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_483_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        select_ln19_48_reg_522 <= select_ln19_48_fu_402_p3;
        select_ln22_1_reg_517 <= select_ln22_1_fu_363_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_fu_246_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_data_1_fu_88 <= tmp_data_fu_310_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_condition_pp0_exit_iter2_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter2_state4 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln17_fu_246_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln17_reg_483_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ap_phi_mux_c_phi_fu_233_p4 = select_ln19_48_reg_522;
    end else begin
        ap_phi_mux_c_phi_fu_233_p4 = c_reg_229;
    end
end

always @ (*) begin
    if (((icmp_ln17_reg_483_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ap_phi_mux_r_phi_fu_222_p4 = select_ln22_1_reg_517;
    end else begin
        ap_phi_mux_r_phi_fu_222_p4 = r_reg_218;
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
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        fmaps_ce1 = 1'b1;
    end else begin
        fmaps_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln25_reg_498_pp0_iter1_reg == 1'd1) & (icmp_ln17_reg_483_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        fmaps_we1 = 1'b1;
    end else begin
        fmaps_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_ce0 = 1'b1;
    end else begin
        p_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        p_ce1 = 1'b1;
    end else begin
        p_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        p_ce2 = 1'b1;
    end else begin
        p_ce2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        p_ce3 = 1'b1;
    end else begin
        p_ce3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_ce4 = 1'b1;
    end else begin
        p_ce4 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln17_fu_246_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_we0 = 1'b1;
    end else begin
        p_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln17_fu_246_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (stream_in_TVALID == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        stream_in_TREADY = 1'b1;
    end else begin
        stream_in_TREADY = 1'b0;
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
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
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

assign add_ln17_fu_240_p2 = (indvar_flatten16_reg_185 + 18'd1);

assign add_ln18_2_fu_336_p2 = (indvar_flatten_reg_196 + 10'd1);

assign add_ln20_fu_330_p2 = (select_ln19_fu_285_p3 + 2'd1);

assign add_ln27_fu_413_p2 = (sub_ln27_fu_390_p2 + zext_ln27_1_fu_409_p1);

assign and_ln22_fu_273_p2 = (xor_ln22_fu_261_p2 & icmp_ln20_fu_267_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd2];

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

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln27_1_fu_428_p1 = p_q2;

assign bitcast_ln27_2_fu_432_p1 = p_q1;

assign bitcast_ln27_3_fu_436_p1 = p_load_3_reg_512;

assign bitcast_ln27_fu_424_p1 = p_q3;

assign c_2_fu_396_p2 = (select_ln22_fu_356_p3 + 8'd1);

assign empty_154_nbread_fu_96_p5_0 = stream_in_TVALID;

assign fmaps_address1 = zext_ln27_2_fu_419_p1;

assign fmaps_d1 = {{{{bitcast_ln27_3_fu_436_p1}, {bitcast_ln27_2_fu_432_p1}}, {bitcast_ln27_1_fu_428_p1}}, {bitcast_ln27_fu_424_p1}};

assign icmp_ln17_fu_246_p2 = ((indvar_flatten16_reg_185 == 18'd150528) ? 1'b1 : 1'b0);

assign icmp_ln18_fu_255_p2 = ((indvar_flatten_reg_196 == 10'd672) ? 1'b1 : 1'b0);

assign icmp_ln20_fu_267_p2 = ((ch_reg_207 == 2'd3) ? 1'b1 : 1'b0);

assign icmp_ln25_fu_319_p2 = ((select_ln19_fu_285_p3 == 2'd2) ? 1'b1 : 1'b0);

assign or_ln19_fu_279_p2 = (icmp_ln18_fu_255_p2 | and_ln22_fu_273_p2);

assign p_address0 = zext_ln20_fu_293_p1;

assign p_address1 = 64'd2;

assign p_address2 = 64'd1;

assign p_address3 = 64'd0;

assign p_address4 = 64'd3;

assign p_d0 = ((empty_154_nbread_fu_96_p5_0[0:0] == 1'b1) ? tmp_data_2_fu_306_p1 : tmp_data_1_fu_88);

assign r_2_fu_350_p2 = (ap_phi_mux_r_phi_fu_222_p4 + 8'd1);

assign select_ln18_fu_342_p3 = ((icmp_ln18_fu_255_p2[0:0] == 1'b1) ? 10'd1 : add_ln18_2_fu_336_p2);

assign select_ln19_48_fu_402_p3 = ((and_ln22_reg_493_pp0_iter1_reg[0:0] == 1'b1) ? c_2_fu_396_p2 : select_ln22_fu_356_p3);

assign select_ln19_fu_285_p3 = ((or_ln19_fu_279_p2[0:0] == 1'b1) ? 2'd0 : ch_reg_207);

assign select_ln22_1_fu_363_p3 = ((icmp_ln18_reg_487_pp0_iter1_reg[0:0] == 1'b1) ? r_2_fu_350_p2 : ap_phi_mux_r_phi_fu_222_p4);

assign select_ln22_fu_356_p3 = ((icmp_ln18_reg_487_pp0_iter1_reg[0:0] == 1'b1) ? 8'd0 : ap_phi_mux_c_phi_fu_233_p4);

assign sub_ln27_fu_390_p2 = (tmp_fu_370_p3 - zext_ln27_fu_386_p1);

assign tmp_22_fu_378_p3 = {{select_ln22_1_fu_363_p3}, {5'd0}};

assign tmp_data_2_fu_306_p1 = stream_in_TDATA;

assign tmp_data_fu_310_p3 = ((empty_154_nbread_fu_96_p5_0[0:0] == 1'b1) ? tmp_data_2_fu_306_p1 : tmp_data_1_fu_88);

assign tmp_fu_370_p3 = {{select_ln22_1_fu_363_p3}, {8'd0}};

assign xor_ln22_fu_261_p2 = (icmp_ln18_fu_255_p2 ^ 1'd1);

assign zext_ln20_fu_293_p1 = select_ln19_fu_285_p3;

assign zext_ln27_1_fu_409_p1 = select_ln19_48_fu_402_p3;

assign zext_ln27_2_fu_419_p1 = add_ln27_fu_413_p2;

assign zext_ln27_fu_386_p1 = tmp_22_fu_378_p3;

endmodule //td_fused_top_td_fused_axi_in
module td_fused_top_td_fused_axi_in_p(
    reset,
    clk,
    address0,
    ce0,
    we0,
    d0,
    address1,
    ce1,
    q1,
    address2,
    ce2,
    q2,
    address3,
    ce3,
    q3,
    address4,
    ce4,
    q4);

parameter DataWidth = 32'd16;
parameter AddressRange = 32'd4;
parameter AddressWidth = 32'd2;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
input we0;
input[DataWidth - 1:0] d0;
input[AddressWidth - 1:0] address1;
input ce1;
output[DataWidth - 1:0] q1;
input[AddressWidth - 1:0] address2;
input ce2;
output[DataWidth - 1:0] q2;
input[AddressWidth - 1:0] address3;
input ce3;
output[DataWidth - 1:0] q3;
input[AddressWidth - 1:0] address4;
input ce4;
output[DataWidth - 1:0] q4;



td_fused_top_td_fused_axi_in_p_ram td_fused_top_td_fused_axi_in_p_ram_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .we0( we0 ),
    .d0( d0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .q1( q1 ),
    .addr2( address2 ),
    .ce2( ce2 ),
    .q2( q2 ),
    .addr3( address3 ),
    .ce3( ce3 ),
    .q3( q3 ),
    .addr4( address4 ),
    .ce4( ce4 ),
    .q4( q4 )
);

endmodule
module td_fused_top_td_fused_axi_in_p_ram (addr0, ce0, d0, we0, addr1, ce1, q1, addr2, ce2, q2, addr3, ce3, q3, addr4, ce4, q4,  clk);

parameter DWIDTH = 16;
parameter AWIDTH = 2;
parameter MEM_SIZE = 4;

input[AWIDTH-1:0] addr0;
input ce0;
input[DWIDTH-1:0] d0;
input we0;
input[AWIDTH-1:0] addr1;
input ce1;
output reg[DWIDTH-1:0] q1;
input[AWIDTH-1:0] addr2;
input ce2;
output reg[DWIDTH-1:0] q2;
input[AWIDTH-1:0] addr3;
input ce3;
output reg[DWIDTH-1:0] q3;
input[AWIDTH-1:0] addr4;
input ce4;
output reg[DWIDTH-1:0] q4;
input clk;

reg [DWIDTH-1:0] ram0[MEM_SIZE-1:0];
reg [DWIDTH-1:0] ram1[MEM_SIZE-1:0];
reg [DWIDTH-1:0] ram2[MEM_SIZE-1:0];
reg [DWIDTH-1:0] ram3[MEM_SIZE-1:0];



always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram0[addr0] <= d0; 
    end
end


always @(posedge clk)  
begin 
    if (ce1) begin
        q1 <= ram0[addr1];
    end
end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram1[addr0] <= d0; 
    end
end

always @(posedge clk)  
begin 
    if (ce2) begin
        q2 <= ram1[addr2];
    end
end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram2[addr0] <= d0; 
    end
end

always @(posedge clk)  
begin 
    if (ce3) begin
        q3 <= ram2[addr3];
    end
end


always @(posedge clk)  
begin 
    if (ce0) begin
        if (we0) 
            ram3[addr0] <= d0; 
    end
end

always @(posedge clk)  
begin 
    if (ce4) begin
        q4 <= ram3[addr4];
    end
end


endmodule
