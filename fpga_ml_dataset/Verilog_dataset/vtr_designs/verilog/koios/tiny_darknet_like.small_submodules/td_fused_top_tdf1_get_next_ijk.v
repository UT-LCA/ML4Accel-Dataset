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

module td_fused_top_tdf1_get_next_ijk (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        input_indices_2_out_din,
        input_indices_2_out_full_n,
        input_indices_2_out_write,
        input_indices_2_out1_din,
        input_indices_2_out1_full_n,
        input_indices_2_out1_write,
        output_indices_0_din,
        output_indices_0_full_n,
        output_indices_0_write,
        output_indices_1_din,
        output_indices_1_full_n,
        output_indices_1_write,
        resetMaximum_din,
        resetMaximum_full_n,
        resetMaximum_write,
        storeOutput_din,
        storeOutput_full_n,
        storeOutput_write,
        ap_return_0,
        ap_return_1
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
output  [3:0] input_indices_2_out_din;
input   input_indices_2_out_full_n;
output   input_indices_2_out_write;
output  [3:0] input_indices_2_out1_din;
input   input_indices_2_out1_full_n;
output   input_indices_2_out1_write;
output  [6:0] output_indices_0_din;
input   output_indices_0_full_n;
output   output_indices_0_write;
output  [13:0] output_indices_1_din;
input   output_indices_1_full_n;
output   output_indices_1_write;
output   resetMaximum_din;
input   resetMaximum_full_n;
output   resetMaximum_write;
output   storeOutput_din;
input   storeOutput_full_n;
output   storeOutput_write;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg start_write;
reg input_indices_2_out_write;
reg input_indices_2_out1_write;
reg output_indices_0_write;
reg output_indices_1_write;
reg resetMaximum_write;
reg storeOutput_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
  reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg   [1:0] i_p_3;
reg   [1:0] j_p_3;
reg   [15:0] i_7;
reg   [15:0] j_7;
reg   [15:0] k_7;
reg   [15:0] i_out_3;
reg   [15:0] j_out_3;
reg    input_indices_2_out_blk_n;
reg    input_indices_2_out1_blk_n;
reg    output_indices_0_blk_n;
reg    output_indices_1_blk_n;
reg    resetMaximum_blk_n;
reg    storeOutput_blk_n;
wire   [1:0] select_ln163_fu_338_p3;
reg    ap_block_state1;
wire   [0:0] or_ln163_fu_312_p2;
wire   [1:0] select_ln163_1_fu_346_p3;
wire   [15:0] select_ln168_fu_278_p3;
wire   [0:0] and_ln163_1_fu_306_p2;
wire   [15:0] select_ln163_2_fu_360_p3;
wire   [0:0] and_ln153_fu_354_p2;
wire   [15:0] select_ln163_3_fu_388_p3;
wire   [0:0] and_ln156_fu_294_p2;
wire   [15:0] select_ln168_1_fu_286_p3;
wire   [15:0] select_ln163_4_fu_396_p3;
wire   [3:0] trunc_ln149_fu_182_p1;
wire   [1:0] or_ln145_fu_126_p2;
wire   [0:0] icmp_ln146_fu_139_p2;
wire   [0:0] icmp_ln146_1_fu_145_p2;
wire   [15:0] zext_ln147_fu_114_p1;
wire   [15:0] zext_ln148_fu_122_p1;
wire   [1:0] add_ln152_fu_206_p2;
wire   [1:0] add_ln155_fu_218_p2;
wire   [15:0] add_ln158_fu_230_p2;
wire   [15:0] add_ln162_fu_248_p2;
wire   [15:0] add_ln167_fu_266_p2;
wire   [0:0] icmp_ln168_fu_272_p2;
wire   [15:0] add_ln166_fu_260_p2;
wire   [0:0] icmp_ln153_fu_212_p2;
wire   [0:0] icmp_ln156_fu_224_p2;
wire   [0:0] icmp_ln159_fu_236_p2;
wire   [0:0] icmp_ln163_fu_254_p2;
wire   [0:0] and_ln163_fu_300_p2;
wire   [0:0] xor_ln156_fu_318_p2;
wire   [0:0] and_ln156_1_fu_324_p2;
wire   [1:0] select_ln156_fu_330_p3;
wire   [15:0] add_ln161_fu_242_p2;
wire   [0:0] xor_ln159_fu_368_p2;
wire   [0:0] and_ln159_fu_374_p2;
wire   [15:0] select_ln159_fu_380_p3;
wire   [15:0] add_ln147_fu_162_p2;
wire   [15:0] add_ln148_fu_172_p2;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 i_p_3 = 2'd0;
#0 j_p_3 = 2'd0;
#0 i_7 = 16'd0;
#0 j_7 = 16'd0;
#0 k_7 = 16'd0;
#0 i_out_3 = 16'd0;
#0 j_out_3 = 16'd0;
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
        end else if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln163_1_fu_306_p2))) begin
        i_7 <= select_ln168_fu_278_p3;
        i_out_3 <= select_ln168_1_fu_286_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln163_fu_312_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_p_3 <= select_ln163_fu_338_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln153_fu_354_p2))) begin
        j_7 <= select_ln163_2_fu_360_p3;
        j_out_3 <= select_ln163_4_fu_396_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        j_p_3 <= select_ln163_1_fu_346_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln156_fu_294_p2))) begin
        k_7 <= select_ln163_3_fu_388_p3;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_2_out1_blk_n = input_indices_2_out1_full_n;
    end else begin
        input_indices_2_out1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_2_out1_write = 1'b1;
    end else begin
        input_indices_2_out1_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_2_out_blk_n = input_indices_2_out_full_n;
    end else begin
        input_indices_2_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        input_indices_2_out_write = 1'b1;
    end else begin
        input_indices_2_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_indices_0_blk_n = output_indices_0_full_n;
    end else begin
        output_indices_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_indices_0_write = 1'b1;
    end else begin
        output_indices_0_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_indices_1_blk_n = output_indices_1_full_n;
    end else begin
        output_indices_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        output_indices_1_write = 1'b1;
    end else begin
        output_indices_1_write = 1'b0;
    end
end

always @ (*) begin
    if (((start_full_n == 1'b0) & (start_once_reg == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        resetMaximum_blk_n = resetMaximum_full_n;
    end else begin
        resetMaximum_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        resetMaximum_write = 1'b1;
    end else begin
        resetMaximum_write = 1'b0;
    end
end

always @ (*) begin
    if (((real_start == 1'b1) & (start_once_reg == 1'b0))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        storeOutput_blk_n = storeOutput_full_n;
    end else begin
        storeOutput_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        storeOutput_write = 1'b1;
    end else begin
        storeOutput_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln147_fu_162_p2 = (i_7 + zext_ln147_fu_114_p1);

assign add_ln148_fu_172_p2 = (j_7 + zext_ln148_fu_122_p1);

assign add_ln152_fu_206_p2 = (j_p_3 + 2'd1);

assign add_ln155_fu_218_p2 = (i_p_3 + 2'd1);

assign add_ln158_fu_230_p2 = (k_7 + 16'd1);

assign add_ln161_fu_242_p2 = (j_7 + 16'd2);

assign add_ln162_fu_248_p2 = (j_out_3 + 16'd1);

assign add_ln166_fu_260_p2 = (i_7 + 16'd2);

assign add_ln167_fu_266_p2 = (i_out_3 + 16'd1);

assign and_ln153_fu_354_p2 = (icmp_ln159_fu_236_p2 & and_ln156_fu_294_p2);

assign and_ln156_1_fu_324_p2 = (xor_ln156_fu_318_p2 & icmp_ln153_fu_212_p2);

assign and_ln156_fu_294_p2 = (icmp_ln156_fu_224_p2 & icmp_ln153_fu_212_p2);

assign and_ln159_fu_374_p2 = (xor_ln159_fu_368_p2 & and_ln156_fu_294_p2);

assign and_ln163_1_fu_306_p2 = (and_ln163_fu_300_p2 & and_ln156_fu_294_p2);

assign and_ln163_fu_300_p2 = (icmp_ln163_fu_254_p2 & icmp_ln159_fu_236_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign ap_return_0 = add_ln147_fu_162_p2;

assign ap_return_1 = add_ln148_fu_172_p2;

assign icmp_ln146_1_fu_145_p2 = ((j_p_3 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln146_fu_139_p2 = ((i_p_3 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln153_fu_212_p2 = ((add_ln152_fu_206_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln156_fu_224_p2 = ((add_ln155_fu_218_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln159_fu_236_p2 = ((add_ln158_fu_230_p2 == 16'd16) ? 1'b1 : 1'b0);

assign icmp_ln163_fu_254_p2 = ((add_ln162_fu_248_p2 == 16'd112) ? 1'b1 : 1'b0);

assign icmp_ln168_fu_272_p2 = ((add_ln167_fu_266_p2 == 16'd112) ? 1'b1 : 1'b0);

assign input_indices_2_out1_din = trunc_ln149_fu_182_p1;

assign input_indices_2_out_din = trunc_ln149_fu_182_p1;

assign or_ln145_fu_126_p2 = (j_p_3 | i_p_3);

assign or_ln163_fu_312_p2 = (icmp_ln153_fu_212_p2 | and_ln163_1_fu_306_p2);

assign output_indices_0_din = i_out_3[6:0];

assign output_indices_1_din = j_out_3[13:0];

assign resetMaximum_din = ((or_ln145_fu_126_p2 == 2'd0) ? 1'b1 : 1'b0);

assign select_ln156_fu_330_p3 = ((and_ln156_1_fu_324_p2[0:0] == 1'b1) ? add_ln155_fu_218_p2 : 2'd0);

assign select_ln159_fu_380_p3 = ((and_ln159_fu_374_p2[0:0] == 1'b1) ? add_ln158_fu_230_p2 : 16'd0);

assign select_ln163_1_fu_346_p3 = ((or_ln163_fu_312_p2[0:0] == 1'b1) ? 2'd0 : add_ln152_fu_206_p2);

assign select_ln163_2_fu_360_p3 = ((and_ln163_1_fu_306_p2[0:0] == 1'b1) ? 16'd0 : add_ln161_fu_242_p2);

assign select_ln163_3_fu_388_p3 = ((and_ln163_1_fu_306_p2[0:0] == 1'b1) ? 16'd0 : select_ln159_fu_380_p3);

assign select_ln163_4_fu_396_p3 = ((and_ln163_1_fu_306_p2[0:0] == 1'b1) ? 16'd0 : add_ln162_fu_248_p2);

assign select_ln163_fu_338_p3 = ((and_ln163_1_fu_306_p2[0:0] == 1'b1) ? 2'd0 : select_ln156_fu_330_p3);

assign select_ln168_1_fu_286_p3 = ((icmp_ln168_fu_272_p2[0:0] == 1'b1) ? 16'd0 : add_ln167_fu_266_p2);

assign select_ln168_fu_278_p3 = ((icmp_ln168_fu_272_p2[0:0] == 1'b1) ? 16'd0 : add_ln166_fu_260_p2);

assign start_out = real_start;

assign storeOutput_din = (icmp_ln146_fu_139_p2 & icmp_ln146_1_fu_145_p2);

assign trunc_ln149_fu_182_p1 = k_7[3:0];

assign xor_ln156_fu_318_p2 = (icmp_ln156_fu_224_p2 ^ 1'd1);

assign xor_ln159_fu_368_p2 = (icmp_ln159_fu_236_p2 ^ 1'd1);

assign zext_ln147_fu_114_p1 = i_p_3;

assign zext_ln148_fu_122_p1 = j_p_3;

endmodule //td_fused_top_tdf1_get_next_ijk
