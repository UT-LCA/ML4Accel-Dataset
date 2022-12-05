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

module td_fused_top_tdf5_get_next_ijk (
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
output  [4:0] input_indices_2_out_din;
input   input_indices_2_out_full_n;
output   input_indices_2_out_write;
output  [6:0] input_indices_2_out1_din;
input   input_indices_2_out1_full_n;
output   input_indices_2_out1_write;
output  [4:0] output_indices_0_din;
input   output_indices_0_full_n;
output   output_indices_0_write;
output  [9:0] output_indices_1_din;
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
reg   [1:0] i_p_1;
reg   [1:0] j_p_1;
reg   [15:0] i_3;
reg   [15:0] j_3;
reg   [15:0] k_3;
reg   [15:0] i_out_1;
reg   [15:0] j_out_1;
reg    input_indices_2_out_blk_n;
reg    input_indices_2_out1_blk_n;
reg    output_indices_0_blk_n;
reg    output_indices_1_blk_n;
reg    resetMaximum_blk_n;
reg    storeOutput_blk_n;
wire   [1:0] select_ln172_fu_342_p3;
reg    ap_block_state1;
wire   [0:0] or_ln172_fu_316_p2;
wire   [1:0] select_ln172_1_fu_350_p3;
wire   [15:0] select_ln177_fu_282_p3;
wire   [0:0] and_ln172_1_fu_310_p2;
wire   [15:0] select_ln172_2_fu_364_p3;
wire   [0:0] and_ln162_fu_358_p2;
wire   [15:0] select_ln172_3_fu_392_p3;
wire   [0:0] and_ln165_fu_298_p2;
wire   [15:0] select_ln177_1_fu_290_p3;
wire   [15:0] select_ln172_4_fu_400_p3;
wire   [1:0] or_ln154_fu_126_p2;
wire   [0:0] icmp_ln155_fu_139_p2;
wire   [0:0] icmp_ln155_1_fu_145_p2;
wire   [15:0] zext_ln156_fu_114_p1;
wire   [15:0] zext_ln157_fu_122_p1;
wire   [1:0] add_ln161_fu_210_p2;
wire   [1:0] add_ln164_fu_222_p2;
wire   [15:0] add_ln167_fu_234_p2;
wire   [15:0] add_ln171_fu_252_p2;
wire   [15:0] add_ln176_fu_270_p2;
wire   [0:0] icmp_ln177_fu_276_p2;
wire   [15:0] add_ln175_fu_264_p2;
wire   [0:0] icmp_ln162_fu_216_p2;
wire   [0:0] icmp_ln165_fu_228_p2;
wire   [0:0] icmp_ln168_fu_240_p2;
wire   [0:0] icmp_ln172_fu_258_p2;
wire   [0:0] and_ln172_fu_304_p2;
wire   [0:0] xor_ln165_fu_322_p2;
wire   [0:0] and_ln165_1_fu_328_p2;
wire   [1:0] select_ln165_fu_334_p3;
wire   [15:0] add_ln170_fu_246_p2;
wire   [0:0] xor_ln168_fu_372_p2;
wire   [0:0] and_ln168_fu_378_p2;
wire   [15:0] select_ln168_fu_384_p3;
wire   [15:0] add_ln156_fu_162_p2;
wire   [15:0] add_ln157_fu_172_p2;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 i_p_1 = 2'd0;
#0 j_p_1 = 2'd0;
#0 i_3 = 16'd0;
#0 j_3 = 16'd0;
#0 k_3 = 16'd0;
#0 i_out_1 = 16'd0;
#0 j_out_1 = 16'd0;
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
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln172_1_fu_310_p2))) begin
        i_3 <= select_ln177_fu_282_p3;
        i_out_1 <= select_ln177_1_fu_290_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln172_fu_316_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_p_1 <= select_ln172_fu_342_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln162_fu_358_p2))) begin
        j_3 <= select_ln172_2_fu_364_p3;
        j_out_1 <= select_ln172_4_fu_400_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        j_p_1 <= select_ln172_1_fu_350_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1) & (1'd1 == and_ln165_fu_298_p2))) begin
        k_3 <= select_ln172_3_fu_392_p3;
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

assign add_ln156_fu_162_p2 = (i_3 + zext_ln156_fu_114_p1);

assign add_ln157_fu_172_p2 = (j_3 + zext_ln157_fu_122_p1);

assign add_ln161_fu_210_p2 = (j_p_1 + 2'd1);

assign add_ln164_fu_222_p2 = (i_p_1 + 2'd1);

assign add_ln167_fu_234_p2 = (k_3 + 16'd1);

assign add_ln170_fu_246_p2 = (j_3 + 16'd2);

assign add_ln171_fu_252_p2 = (j_out_1 + 16'd1);

assign add_ln175_fu_264_p2 = (i_3 + 16'd2);

assign add_ln176_fu_270_p2 = (i_out_1 + 16'd1);

assign and_ln162_fu_358_p2 = (icmp_ln168_fu_240_p2 & and_ln165_fu_298_p2);

assign and_ln165_1_fu_328_p2 = (xor_ln165_fu_322_p2 & icmp_ln162_fu_216_p2);

assign and_ln165_fu_298_p2 = (icmp_ln165_fu_228_p2 & icmp_ln162_fu_216_p2);

assign and_ln168_fu_378_p2 = (xor_ln168_fu_372_p2 & and_ln165_fu_298_p2);

assign and_ln172_1_fu_310_p2 = (and_ln172_fu_304_p2 & and_ln165_fu_298_p2);

assign and_ln172_fu_304_p2 = (icmp_ln172_fu_258_p2 & icmp_ln168_fu_240_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (storeOutput_full_n == 1'b0) | (resetMaximum_full_n == 1'b0) | (output_indices_1_full_n == 1'b0) | (output_indices_0_full_n == 1'b0) | (input_indices_2_out1_full_n == 1'b0) | (input_indices_2_out_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign ap_return_0 = add_ln156_fu_162_p2;

assign ap_return_1 = add_ln157_fu_172_p2;

assign icmp_ln155_1_fu_145_p2 = ((j_p_1 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln155_fu_139_p2 = ((i_p_1 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln162_fu_216_p2 = ((add_ln161_fu_210_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln165_fu_228_p2 = ((add_ln164_fu_222_p2 == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln168_fu_240_p2 = ((add_ln167_fu_234_p2 == 16'd32) ? 1'b1 : 1'b0);

assign icmp_ln172_fu_258_p2 = ((add_ln171_fu_252_p2 == 16'd28) ? 1'b1 : 1'b0);

assign icmp_ln177_fu_276_p2 = ((add_ln176_fu_270_p2 == 16'd28) ? 1'b1 : 1'b0);

assign input_indices_2_out1_din = k_3[6:0];

assign input_indices_2_out_din = k_3[4:0];

assign or_ln154_fu_126_p2 = (j_p_1 | i_p_1);

assign or_ln172_fu_316_p2 = (icmp_ln162_fu_216_p2 | and_ln172_1_fu_310_p2);

assign output_indices_0_din = i_out_1[4:0];

assign output_indices_1_din = j_out_1[9:0];

assign resetMaximum_din = ((or_ln154_fu_126_p2 == 2'd0) ? 1'b1 : 1'b0);

assign select_ln165_fu_334_p3 = ((and_ln165_1_fu_328_p2[0:0] == 1'b1) ? add_ln164_fu_222_p2 : 2'd0);

assign select_ln168_fu_384_p3 = ((and_ln168_fu_378_p2[0:0] == 1'b1) ? add_ln167_fu_234_p2 : 16'd0);

assign select_ln172_1_fu_350_p3 = ((or_ln172_fu_316_p2[0:0] == 1'b1) ? 2'd0 : add_ln161_fu_210_p2);

assign select_ln172_2_fu_364_p3 = ((and_ln172_1_fu_310_p2[0:0] == 1'b1) ? 16'd0 : add_ln170_fu_246_p2);

assign select_ln172_3_fu_392_p3 = ((and_ln172_1_fu_310_p2[0:0] == 1'b1) ? 16'd0 : select_ln168_fu_384_p3);

assign select_ln172_4_fu_400_p3 = ((and_ln172_1_fu_310_p2[0:0] == 1'b1) ? 16'd0 : add_ln171_fu_252_p2);

assign select_ln172_fu_342_p3 = ((and_ln172_1_fu_310_p2[0:0] == 1'b1) ? 2'd0 : select_ln165_fu_334_p3);

assign select_ln177_1_fu_290_p3 = ((icmp_ln177_fu_276_p2[0:0] == 1'b1) ? 16'd0 : add_ln176_fu_270_p2);

assign select_ln177_fu_282_p3 = ((icmp_ln177_fu_276_p2[0:0] == 1'b1) ? 16'd0 : add_ln175_fu_264_p2);

assign start_out = real_start;

assign storeOutput_din = (icmp_ln155_fu_139_p2 & icmp_ln155_1_fu_145_p2);

assign xor_ln165_fu_322_p2 = (icmp_ln165_fu_228_p2 ^ 1'd1);

assign xor_ln168_fu_372_p2 = (icmp_ln168_fu_240_p2 ^ 1'd1);

assign zext_ln156_fu_114_p1 = i_p_1;

assign zext_ln157_fu_122_p1 = j_p_1;

endmodule //td_fused_top_tdf5_get_next_ijk
