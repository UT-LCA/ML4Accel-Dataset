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

module td_fused_top_td_fused_axi_out (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        fmaps_address0,
        fmaps_ce0,
        fmaps_q0,
        stream_out_TDATA,
        stream_out_TVALID,
        stream_out_TREADY,
        stream_out_TKEEP,
        stream_out_TSTRB,
        stream_out_TLAST
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_pp0_stage0 = 6'd2;
parameter    ap_ST_fsm_pp0_stage1 = 6'd4;
parameter    ap_ST_fsm_pp0_stage2 = 6'd8;
parameter    ap_ST_fsm_pp0_stage3 = 6'd16;
parameter    ap_ST_fsm_state13 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [15:0] fmaps_address0;
output   fmaps_ce0;
input  [63:0] fmaps_q0;
output  [15:0] stream_out_TDATA;
output   stream_out_TVALID;
input   stream_out_TREADY;
output  [1:0] stream_out_TKEEP;
output  [1:0] stream_out_TSTRB;
output  [0:0] stream_out_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg fmaps_ce0;
reg[15:0] stream_out_TDATA;
reg stream_out_TVALID;

reg    ap_done_reg;
  reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    stream_out_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage3;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage3;
reg   [0:0] icmp_ln17_reg_400;
reg   [0:0] icmp_ln17_reg_400_pp0_iter1_reg;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter2;
wire    ap_block_pp0_stage0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1;
reg   [0:0] icmp_ln17_reg_400_pp0_iter2_reg;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_pp0_stage2;
reg   [15:0] indvar_flatten13_reg_134;
reg   [3:0] r_reg_145;
reg   [11:0] indvar_flatten_reg_156;
reg   [3:0] c_reg_167;
reg   [9:0] phi_ln25_reg_178;
wire   [15:0] add_ln17_1_fu_189_p2;
reg   [15:0] add_ln17_1_reg_395;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state6_pp0_stage0_iter1;
reg    ap_block_state10_pp0_stage0_iter2;
reg    ap_block_state10_io;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln17_fu_195_p2;
wire   [0:0] icmp_ln18_fu_207_p2;
reg   [0:0] icmp_ln18_reg_404;
wire   [3:0] select_ln17_fu_213_p3;
reg   [3:0] select_ln17_reg_411;
wire   [3:0] select_ln17_1_fu_221_p3;
reg   [3:0] select_ln17_1_reg_417;
wire   [11:0] add_ln18_1_fu_229_p2;
reg   [11:0] add_ln18_1_reg_424;
wire   [9:0] select_ln18_fu_294_p3;
reg   [9:0] select_ln18_reg_429;
wire    ap_block_state3_pp0_stage1_iter0;
wire    ap_block_state7_pp0_stage1_iter1;
reg    ap_block_state11_pp0_stage1_iter2;
reg    ap_block_state11_io;
reg    ap_block_pp0_stage1_11001;
wire   [3:0] select_ln18_1_fu_302_p3;
reg   [3:0] select_ln18_1_reg_434;
reg   [7:0] lshr_ln_reg_444;
wire   [11:0] select_ln18_2_fu_333_p3;
reg   [11:0] select_ln18_2_reg_449;
wire    ap_block_state5_pp0_stage3_iter0;
reg    ap_block_state9_pp0_stage3_iter1;
reg    ap_block_state9_io;
reg    ap_block_pp0_stage3_11001;
wire   [9:0] add_ln19_fu_346_p2;
reg   [9:0] add_ln19_reg_464;
reg   [15:0] tmp_s_reg_469;
reg   [15:0] tmp_1_reg_474;
reg   [15:0] tmp_2_reg_479;
reg    ap_block_state1;
reg    ap_block_pp0_stage1_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_block_pp0_stage3_subdone;
wire    ap_block_state4_pp0_stage2_iter0;
wire    ap_block_state8_pp0_stage2_iter1;
reg    ap_block_state12_pp0_stage2_iter2;
reg    ap_block_state12_io;
reg    ap_block_pp0_stage2_subdone;
reg   [15:0] ap_phi_mux_indvar_flatten13_phi_fu_138_p4;
reg   [3:0] ap_phi_mux_r_phi_fu_149_p4;
reg   [11:0] ap_phi_mux_indvar_flatten_phi_fu_160_p4;
reg   [3:0] ap_phi_mux_c_phi_fu_171_p4;
reg   [9:0] ap_phi_mux_phi_ln25_phi_fu_182_p4;
wire   [63:0] zext_ln25_4_fu_342_p1;
wire   [15:0] trunc_ln25_fu_351_p1;
reg    ap_block_pp0_stage3_01001;
reg    ap_block_pp0_stage0_01001;
reg    ap_block_pp0_stage1_01001;
reg    ap_block_pp0_stage2_01001;
reg    ap_block_pp0_stage2_11001;
wire   [3:0] add_ln17_fu_201_p2;
wire   [7:0] tmp_20_fu_235_p3;
wire   [4:0] tmp_21_fu_246_p3;
wire   [8:0] zext_ln25_fu_242_p1;
wire   [8:0] zext_ln25_1_fu_253_p1;
wire   [8:0] sub_ln25_fu_257_p2;
wire   [0:0] icmp_ln19_fu_272_p2;
wire   [0:0] xor_ln17_fu_267_p2;
wire   [0:0] and_ln17_fu_278_p2;
wire   [0:0] or_ln18_fu_289_p2;
wire   [3:0] add_ln18_fu_284_p2;
wire   [9:0] sext_ln18_fu_263_p1;
wire   [9:0] zext_ln25_2_fu_309_p1;
wire   [9:0] add_ln25_fu_313_p2;
wire   [15:0] grp_fu_386_p3;
wire   [8:0] grp_fu_386_p1;
wire   [7:0] grp_fu_386_p2;
reg    grp_fu_386_ce;
wire    ap_CS_fsm_state13;
reg   [5:0] ap_NS_fsm;
reg    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [15:0] grp_fu_386_p20;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 6'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

td_fused_top_mac_muladd_10s_9ns_8ns_16_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 10 ),
    .din1_WIDTH( 9 ),
    .din2_WIDTH( 8 ),
    .dout_WIDTH( 16 ))
mac_muladd_10s_9ns_8ns_16_4_1_U817(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(grp_fu_386_ce),
    .din0(add_ln25_fu_313_p2),
    .din1(grp_fu_386_p1),
    .din2(grp_fu_386_p2),
    .dout(grp_fu_386_p3)
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
        end else if ((1'b1 == ap_CS_fsm_state13)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (1'b1 == ap_condition_pp0_exit_iter0_state3))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((((1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage3_subdone) & (1'b1 == ap_CS_fsm_pp0_stage3)))) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        c_reg_167 <= select_ln18_1_reg_434;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        c_reg_167 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten13_reg_134 <= add_ln17_1_reg_395;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten13_reg_134 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_156 <= select_ln18_2_reg_449;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_156 <= 12'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        phi_ln25_reg_178 <= add_ln19_reg_464;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        phi_ln25_reg_178 <= 10'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        r_reg_145 <= select_ln17_1_reg_417;
    end else if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        r_reg_145 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        add_ln17_1_reg_395 <= add_ln17_1_fu_189_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln17_fu_195_p2 == 1'd0))) begin
        add_ln18_1_reg_424 <= add_ln18_1_fu_229_p2;
        icmp_ln18_reg_404 <= icmp_ln18_fu_207_p2;
        select_ln17_reg_411 <= select_ln17_fu_213_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln19_reg_464 <= add_ln19_fu_346_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln17_reg_400 <= icmp_ln17_fu_195_p2;
        icmp_ln17_reg_400_pp0_iter1_reg <= icmp_ln17_reg_400;
        icmp_ln17_reg_400_pp0_iter2_reg <= icmp_ln17_reg_400_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        lshr_ln_reg_444 <= {{select_ln18_fu_294_p3[9:2]}};
        select_ln18_reg_429 <= select_ln18_fu_294_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln17_fu_195_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln17_1_reg_417 <= select_ln17_1_fu_221_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        select_ln18_1_reg_434 <= select_ln18_1_fu_302_p3;
        select_ln18_2_reg_449 <= select_ln18_2_fu_333_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        tmp_1_reg_474 <= {{fmaps_q0[47:32]}};
        tmp_2_reg_479 <= {{fmaps_q0[63:48]}};
        tmp_s_reg_469 <= {{fmaps_q0[31:16]}};
    end
end

always @ (*) begin
    if ((icmp_ln17_reg_400 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
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
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_c_phi_fu_171_p4 = select_ln18_1_reg_434;
    end else begin
        ap_phi_mux_c_phi_fu_171_p4 = c_reg_167;
    end
end

always @ (*) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten13_phi_fu_138_p4 = add_ln17_1_reg_395;
    end else begin
        ap_phi_mux_indvar_flatten13_phi_fu_138_p4 = indvar_flatten13_reg_134;
    end
end

always @ (*) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_indvar_flatten_phi_fu_160_p4 = select_ln18_2_reg_449;
    end else begin
        ap_phi_mux_indvar_flatten_phi_fu_160_p4 = indvar_flatten_reg_156;
    end
end

always @ (*) begin
    if (((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_phi_mux_phi_ln25_phi_fu_182_p4 = add_ln19_reg_464;
    end else begin
        ap_phi_mux_phi_ln25_phi_fu_182_p4 = phi_ln25_reg_178;
    end
end

always @ (*) begin
    if (((icmp_ln17_reg_400 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_r_phi_fu_149_p4 = select_ln17_1_reg_417;
    end else begin
        ap_phi_mux_r_phi_fu_149_p4 = r_reg_145;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        fmaps_ce0 = 1'b1;
    end else begin
        fmaps_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage3_11001) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        grp_fu_386_ce = 1'b1;
    end else begin
        grp_fu_386_ce = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage2_01001) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
        stream_out_TDATA = tmp_2_reg_479;
    end else if (((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage1_01001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        stream_out_TDATA = tmp_1_reg_474;
    end else if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_01001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        stream_out_TDATA = tmp_s_reg_469;
    end else if (((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage3_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
        stream_out_TDATA = trunc_ln25_fu_351_p1;
    end else begin
        stream_out_TDATA = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage2) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage3) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)))) begin
        stream_out_TDATA_blk_n = stream_out_TREADY;
    end else begin
        stream_out_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage2_11001) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage3_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage3)))) begin
        stream_out_TVALID = 1'b1;
    end else begin
        stream_out_TVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((~((icmp_ln17_reg_400 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b0 == ap_block_pp0_stage1_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else if (((icmp_ln17_reg_400 == 1'd1) & (1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((~((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage2)) & (1'b0 == ap_block_pp0_stage2_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage2_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln17_1_fu_189_p2 = (ap_phi_mux_indvar_flatten13_phi_fu_138_p4 + 16'd1);

assign add_ln17_fu_201_p2 = (ap_phi_mux_r_phi_fu_149_p4 + 4'd1);

assign add_ln18_1_fu_229_p2 = (ap_phi_mux_indvar_flatten_phi_fu_160_p4 + 12'd1);

assign add_ln18_fu_284_p2 = (select_ln17_reg_411 + 4'd1);

assign add_ln19_fu_346_p2 = (select_ln18_reg_429 + 10'd4);

assign add_ln25_fu_313_p2 = ((sext_ln18_fu_263_p1) + (zext_ln25_2_fu_309_p1));

assign and_ln17_fu_278_p2 = (xor_ln17_fu_267_p2 & icmp_ln19_fu_272_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd5];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state10_io) | ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (stream_out_TREADY == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state10_io) | ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (stream_out_TREADY == 1'b0))));
end

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_01001 = ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_pp0_stage1_11001 = ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state11_io) | ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (stream_out_TREADY == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state11_io) | ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (stream_out_TREADY == 1'b0))));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage2_01001 = ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_pp0_stage2_11001 = ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state12_io) | ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (stream_out_TREADY == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage2_subdone = ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state12_io) | ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (stream_out_TREADY == 1'b0))));
end

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage3_01001 = ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_pp0_stage3_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state9_io) | ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (stream_out_TREADY == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage3_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state9_io) | ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (stream_out_TREADY == 1'b0))));
end

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state10_io = ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state10_pp0_stage0_iter2 = ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state11_io = ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state11_pp0_stage1_iter2 = ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state12_io = ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state12_pp0_stage2_iter2 = ((icmp_ln17_reg_400_pp0_iter2_reg == 1'd0) & (stream_out_TREADY == 1'b0));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage1_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage1_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage2_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state9_io = ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (stream_out_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state9_pp0_stage3_iter1 = ((icmp_ln17_reg_400_pp0_iter1_reg == 1'd0) & (stream_out_TREADY == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign fmaps_address0 = zext_ln25_4_fu_342_p1;

assign grp_fu_386_p1 = 16'd250;

assign grp_fu_386_p2 = grp_fu_386_p20;

assign grp_fu_386_p20 = lshr_ln_reg_444;

assign icmp_ln17_fu_195_p2 = ((ap_phi_mux_indvar_flatten13_phi_fu_138_p4 == 16'd49000) ? 1'b1 : 1'b0);

assign icmp_ln18_fu_207_p2 = ((ap_phi_mux_indvar_flatten_phi_fu_160_p4 == 12'd3500) ? 1'b1 : 1'b0);

assign icmp_ln19_fu_272_p2 = ((ap_phi_mux_phi_ln25_phi_fu_182_p4 == 10'd1000) ? 1'b1 : 1'b0);

assign or_ln18_fu_289_p2 = (icmp_ln18_reg_404 | and_ln17_fu_278_p2);

assign select_ln17_1_fu_221_p3 = ((icmp_ln18_fu_207_p2[0:0] == 1'b1) ? add_ln17_fu_201_p2 : ap_phi_mux_r_phi_fu_149_p4);

assign select_ln17_fu_213_p3 = ((icmp_ln18_fu_207_p2[0:0] == 1'b1) ? 4'd0 : ap_phi_mux_c_phi_fu_171_p4);

assign select_ln18_1_fu_302_p3 = ((and_ln17_fu_278_p2[0:0] == 1'b1) ? add_ln18_fu_284_p2 : select_ln17_reg_411);

assign select_ln18_2_fu_333_p3 = ((icmp_ln18_reg_404[0:0] == 1'b1) ? 12'd1 : add_ln18_1_reg_424);

assign select_ln18_fu_294_p3 = ((or_ln18_fu_289_p2[0:0] == 1'b1) ? 10'd0 : ap_phi_mux_phi_ln25_phi_fu_182_p4);

assign sext_ln18_fu_263_p1 = (sub_ln25_fu_257_p2);

assign stream_out_TKEEP = 2'd0;

assign stream_out_TLAST = 1'd0;

assign stream_out_TSTRB = 2'd0;

assign sub_ln25_fu_257_p2 = (zext_ln25_fu_242_p1 - zext_ln25_1_fu_253_p1);

assign tmp_20_fu_235_p3 = {{select_ln17_1_reg_417}, {4'd0}};

assign tmp_21_fu_246_p3 = {{select_ln17_1_reg_417}, {1'd0}};

assign trunc_ln25_fu_351_p1 = fmaps_q0[15:0];

assign xor_ln17_fu_267_p2 = (icmp_ln18_reg_404 ^ 1'd1);

assign zext_ln25_1_fu_253_p1 = tmp_21_fu_246_p3;

assign zext_ln25_2_fu_309_p1 = select_ln18_1_fu_302_p3;

assign zext_ln25_4_fu_342_p1 = (grp_fu_386_p3);

assign zext_ln25_fu_242_p1 = tmp_20_fu_235_p3;

endmodule //td_fused_top_td_fused_axi_out
module td_fused_top_mac_muladd_10s_9ns_8ns_16_4_1(
    clk,
    reset,
    ce,
    din0,
    din1,
    din2,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter din2_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
input[din2_WIDTH - 1:0] din2;
output[dout_WIDTH - 1:0] dout;



td_fused_top_mac_muladd_10s_9ns_8ns_16_4_1_DSP48_0 td_fused_top_mac_muladd_10s_9ns_8ns_16_4_1_DSP48_0_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .in0( din0 ),
    .in1( din1 ),
    .in2( din2 ),
    .dout( dout )
);

endmodule
  module td_fused_top_mac_muladd_10s_9ns_8ns_16_4_1_DSP48_0(
    input clk,
    input rst,
    input ce,
    input  [10 - 1:0] in0,
    input  [9 - 1:0] in1,
    input  [8 - 1:0] in2,
    output [16 - 1:0]  dout);

wire  [27 - 1:0]     a;
wire  [18 - 1:0]     b;
wire  [48 - 1:0]     c;
wire  [45 - 1:0]     m;
wire  [48 - 1:0]     p;
reg   [45 - 1:0]     m_reg;
reg   [27 - 1:0]     a_reg;
reg   [18 - 1:0]     b_reg;
reg   [48 - 1:0]     p_reg;

assign a  = (in0);
assign b  = (in1);
assign c  = (in2);

assign m  = a_reg * b_reg;
assign p  = m_reg + c;

always @(posedge clk) begin
    if (ce) begin
        m_reg  <= m;
        a_reg  <= a;
        b_reg  <= b;
        p_reg  <= p;
    end
end

assign dout = p_reg;

endmodule
