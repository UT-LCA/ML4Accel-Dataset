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

module td_fused_top_tdf12_readFilters82 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        filter_data_0_address0,
        filter_data_0_ce0,
        filter_data_0_q0,
        filter_data_1_address0,
        filter_data_1_ce0,
        filter_data_1_q0,
        indices_23_dout,
        indices_23_empty_n,
        indices_23_read,
        weight_vecs_0_0_0_0_address0,
        weight_vecs_0_0_0_0_ce0,
        weight_vecs_0_0_0_0_we0,
        weight_vecs_0_0_0_0_d0,
        weight_vecs_0_1_0_0_address0,
        weight_vecs_0_1_0_0_ce0,
        weight_vecs_0_1_0_0_we0,
        weight_vecs_0_1_0_0_d0,
        weight_vecs_1_0_0_0_address0,
        weight_vecs_1_0_0_0_ce0,
        weight_vecs_1_0_0_0_we0,
        weight_vecs_1_0_0_0_d0,
        weight_vecs_1_1_0_0_address0,
        weight_vecs_1_1_0_0_ce0,
        weight_vecs_1_1_0_0_we0,
        weight_vecs_1_1_0_0_d0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state4 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [14:0] filter_data_0_address0;
output   filter_data_0_ce0;
input  [31:0] filter_data_0_q0;
output  [14:0] filter_data_1_address0;
output   filter_data_1_ce0;
input  [31:0] filter_data_1_q0;
input  [8:0] indices_23_dout;
input   indices_23_empty_n;
output   indices_23_read;
output  [5:0] weight_vecs_0_0_0_0_address0;
output   weight_vecs_0_0_0_0_ce0;
output   weight_vecs_0_0_0_0_we0;
output  [15:0] weight_vecs_0_0_0_0_d0;
output  [5:0] weight_vecs_0_1_0_0_address0;
output   weight_vecs_0_1_0_0_ce0;
output   weight_vecs_0_1_0_0_we0;
output  [15:0] weight_vecs_0_1_0_0_d0;
output  [5:0] weight_vecs_1_0_0_0_address0;
output   weight_vecs_1_0_0_0_ce0;
output   weight_vecs_1_0_0_0_we0;
output  [15:0] weight_vecs_1_0_0_0_d0;
output  [5:0] weight_vecs_1_1_0_0_address0;
output   weight_vecs_1_1_0_0_ce0;
output   weight_vecs_1_1_0_0_we0;
output  [15:0] weight_vecs_1_1_0_0_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg filter_data_0_ce0;
reg filter_data_1_ce0;
reg indices_23_read;
reg weight_vecs_0_0_0_0_ce0;
reg weight_vecs_0_0_0_0_we0;
reg weight_vecs_0_1_0_0_ce0;
reg weight_vecs_0_1_0_0_we0;
reg weight_vecs_1_0_0_0_ce0;
reg weight_vecs_1_0_0_0_we0;
reg weight_vecs_1_1_0_0_ce0;
reg weight_vecs_1_1_0_0_we0;

reg    ap_done_reg;
  reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    indices_23_blk_n;
reg   [7:0] kk_0_0_0_i_i_reg_160;
reg   [8:0] indices_23_read_reg_261;
wire   [0:0] icmp_ln49_fu_171_p2;
reg   [0:0] icmp_ln49_reg_266;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [7:0] add_ln49_fu_177_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [5:0] lshr_ln_fu_183_p4;
reg   [5:0] lshr_ln_reg_275;
reg    ap_block_state1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
wire   [63:0] zext_ln55_fu_200_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln55_7_fu_206_p1;
wire   [14:0] tmp_s_fu_193_p3;
wire   [15:0] trunc_ln55_fu_213_p1;
wire   [15:0] trunc_ln55_19_fu_222_p1;
wire   [15:0] tmp_268_i_i_fu_231_p4;
wire   [15:0] tmp_269_i_i_fu_246_p4;
wire    ap_CS_fsm_state4;
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
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
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
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_fu_171_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        kk_0_0_0_i_i_reg_160 <= add_ln49_fu_177_p2;
    end else if ((~((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        kk_0_0_0_i_i_reg_160 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln49_reg_266 <= icmp_ln49_fu_171_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        indices_23_read_reg_261 <= indices_23_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_fu_171_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lshr_ln_reg_275 <= {{kk_0_0_0_i_i_reg_160[6:1]}};
    end
end

always @ (*) begin
    if ((icmp_ln49_fu_171_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
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
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        filter_data_0_ce0 = 1'b1;
    end else begin
        filter_data_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        filter_data_1_ce0 = 1'b1;
    end else begin
        filter_data_1_ce0 = 1'b0;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_0_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_0_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_266 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_0_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_0_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_1_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_0_1_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_266 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_0_1_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_0_1_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_1_0_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_0_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_266 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_1_0_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_1_0_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_1_1_0_0_ce0 = 1'b1;
    end else begin
        weight_vecs_1_1_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln49_reg_266 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        weight_vecs_1_1_0_0_we0 = 1'b1;
    end else begin
        weight_vecs_1_1_0_0_we0 = 1'b0;
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
            if (~((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln49_fu_171_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln49_fu_171_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln49_fu_177_p2 = (kk_0_0_0_i_i_reg_160 + 8'd2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (indices_23_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign filter_data_0_address0 = zext_ln55_fu_200_p1;

assign filter_data_1_address0 = zext_ln55_fu_200_p1;

assign icmp_ln49_fu_171_p2 = ((kk_0_0_0_i_i_reg_160 == 8'd128) ? 1'b1 : 1'b0);

assign lshr_ln_fu_183_p4 = {{kk_0_0_0_i_i_reg_160[6:1]}};

assign tmp_268_i_i_fu_231_p4 = {{filter_data_0_q0[31:16]}};

assign tmp_269_i_i_fu_246_p4 = {{filter_data_1_q0[31:16]}};

assign tmp_s_fu_193_p3 = {{indices_23_read_reg_261}, {lshr_ln_fu_183_p4}};

assign trunc_ln55_19_fu_222_p1 = filter_data_1_q0[15:0];

assign trunc_ln55_fu_213_p1 = filter_data_0_q0[15:0];

assign weight_vecs_0_0_0_0_address0 = zext_ln55_7_fu_206_p1;

assign weight_vecs_0_0_0_0_d0 = trunc_ln55_fu_213_p1;

assign weight_vecs_0_1_0_0_address0 = zext_ln55_7_fu_206_p1;

assign weight_vecs_0_1_0_0_d0 = tmp_268_i_i_fu_231_p4;

assign weight_vecs_1_0_0_0_address0 = zext_ln55_7_fu_206_p1;

assign weight_vecs_1_0_0_0_d0 = trunc_ln55_19_fu_222_p1;

assign weight_vecs_1_1_0_0_address0 = zext_ln55_7_fu_206_p1;

assign weight_vecs_1_1_0_0_d0 = tmp_269_i_i_fu_246_p4;

assign zext_ln55_7_fu_206_p1 = lshr_ln_reg_275;

assign zext_ln55_fu_200_p1 = tmp_s_fu_193_p3;

endmodule //td_fused_top_tdf12_readFilters82
