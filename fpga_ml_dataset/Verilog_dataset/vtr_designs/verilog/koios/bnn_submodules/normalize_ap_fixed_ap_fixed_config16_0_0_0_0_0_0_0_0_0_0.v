
module normalize_ap_fixed_ap_fixed_config16_0_0_0_0_0_0_0_0_0_0 (
        ap_clk,
        ap_rst,
        data_0_V_read,
        data_1_V_read,
        data_2_V_read,
        data_3_V_read,
        data_4_V_read,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3,
        ap_return_4,
        ap_ce
);


input   ap_clk;
input   ap_rst;
input  [15:0] data_0_V_read;
input  [15:0] data_1_V_read;
input  [15:0] data_2_V_read;
input  [15:0] data_3_V_read;
input  [15:0] data_4_V_read;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;
output  [15:0] ap_return_2;
output  [15:0] ap_return_3;
output  [15:0] ap_return_4;
input   ap_ce;

reg[15:0] ap_return_0;
reg[15:0] ap_return_1;
reg[15:0] ap_return_2;
reg[15:0] ap_return_3;
reg[15:0] ap_return_4;

wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_pp0_stage0_11001;
reg   [12:0] trunc_ln708_s_reg_362;
reg   [12:0] trunc_ln708_s_reg_362_pp0_iter1_reg;
reg   [14:0] trunc_ln_reg_382;
reg   [14:0] trunc_ln708_1_reg_387;
reg   [14:0] trunc_ln708_2_reg_392;
reg   [14:0] trunc_ln708_3_reg_397;
wire   [8:0] grp_fu_95_p1;
wire    ap_block_pp0_stage0;
wire   [8:0] grp_fu_96_p1;
wire   [8:0] grp_fu_97_p1;
wire   [8:0] grp_fu_98_p1;
wire   [24:0] grp_fu_98_p2;
wire   [24:0] grp_fu_96_p2;
wire   [24:0] grp_fu_97_p2;
wire   [24:0] grp_fu_95_p2;
wire   [15:0] sext_ln708_fu_278_p1;
wire   [13:0] sext_ln703_fu_287_p1;
wire   [13:0] add_ln703_1_fu_290_p2;
wire   [15:0] sext_ln708_1_fu_300_p1;
wire   [15:0] sext_ln708_2_fu_309_p1;
wire   [15:0] sext_ln708_3_fu_318_p1;
wire   [15:0] add_ln703_fu_281_p2;
wire   [15:0] sext_ln703_1_fu_296_p1;
wire   [15:0] add_ln703_2_fu_303_p2;
wire   [15:0] add_ln703_3_fu_312_p2;
wire   [15:0] add_ln703_4_fu_321_p2;
reg    grp_fu_95_ce;
reg    grp_fu_96_ce;
reg    grp_fu_97_ce;
reg    grp_fu_98_ce;
reg    ap_ce_reg;
reg   [15:0] data_0_V_read_int_reg;
reg   [15:0] data_1_V_read_int_reg;
reg   [15:0] data_2_V_read_int_reg;
reg   [15:0] data_3_V_read_int_reg;
reg   [15:0] data_4_V_read_int_reg;
reg   [15:0] ap_return_0_int_reg;
reg   [15:0] ap_return_1_int_reg;
reg   [15:0] ap_return_2_int_reg;
reg   [15:0] ap_return_3_int_reg;
reg   [15:0] ap_return_4_int_reg;

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U513(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_4_V_read_int_reg),
    .din1(grp_fu_95_p1),
    .ce(grp_fu_95_ce),
    .dout(grp_fu_95_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U514(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_2_V_read_int_reg),
    .din1(grp_fu_96_p1),
    .ce(grp_fu_96_ce),
    .dout(grp_fu_96_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U515(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_3_V_read_int_reg),
    .din1(grp_fu_97_p1),
    .ce(grp_fu_97_ce),
    .dout(grp_fu_97_p2)
);

myproject_mul_16s_9ns_25_2_0 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 9 ),
    .dout_WIDTH( 25 ))
myproject_mul_16s_9ns_25_2_0_U516(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_0_V_read_int_reg),
    .din1(grp_fu_98_p1),
    .ce(grp_fu_98_ce),
    .dout(grp_fu_98_p2)
);

always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_0_int_reg <= add_ln703_fu_281_p2;
        ap_return_1_int_reg <= sext_ln703_1_fu_296_p1;
        ap_return_2_int_reg <= add_ln703_2_fu_303_p2;
        ap_return_3_int_reg <= add_ln703_3_fu_312_p2;
        ap_return_4_int_reg <= add_ln703_4_fu_321_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        data_0_V_read_int_reg <= data_0_V_read;
        data_1_V_read_int_reg <= data_1_V_read;
        data_2_V_read_int_reg <= data_2_V_read;
        data_3_V_read_int_reg <= data_3_V_read;
        data_4_V_read_int_reg <= data_4_V_read;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        trunc_ln708_1_reg_387 <= {{grp_fu_96_p2[24:10]}};
        trunc_ln708_2_reg_392 <= {{grp_fu_97_p2[24:10]}};
        trunc_ln708_3_reg_397 <= {{grp_fu_95_p2[24:10]}};
        trunc_ln708_s_reg_362 <= {{data_1_V_read_int_reg[15:3]}};
        trunc_ln708_s_reg_362_pp0_iter1_reg <= trunc_ln708_s_reg_362;
        trunc_ln_reg_382 <= {{grp_fu_98_p2[24:10]}};
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_0 = ap_return_0_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_0 = add_ln703_fu_281_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_1 = ap_return_1_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_1 = sext_ln703_1_fu_296_p1;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_2 = ap_return_2_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_2 = add_ln703_2_fu_303_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_3 = ap_return_3_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_3 = add_ln703_3_fu_312_p2;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return_4 = ap_return_4_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return_4 = add_ln703_4_fu_321_p2;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_95_ce = 1'b1;
    end else begin
        grp_fu_95_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_96_ce = 1'b1;
    end else begin
        grp_fu_96_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_97_ce = 1'b1;
    end else begin
        grp_fu_97_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_98_ce = 1'b1;
    end else begin
        grp_fu_98_ce = 1'b0;
    end
end

assign add_ln703_1_fu_290_p2 = ((sext_ln703_fu_287_p1) + (14'd15560));

assign add_ln703_2_fu_303_p2 = ((sext_ln708_1_fu_300_p1) + (16'd64405));

assign add_ln703_3_fu_312_p2 = ((sext_ln708_2_fu_309_p1) + (16'd64656));

assign add_ln703_4_fu_321_p2 = ((sext_ln708_3_fu_318_p1) + (16'd65325));

assign add_ln703_fu_281_p2 = ((sext_ln708_fu_278_p1) + (16'd64860));

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign grp_fu_95_p1 = 25'd162;

assign grp_fu_96_p1 = 25'd239;

assign grp_fu_97_p1 = 25'd221;

assign grp_fu_98_p1 = 25'd174;

assign sext_ln703_1_fu_296_p1 = (add_ln703_1_fu_290_p2);

assign sext_ln703_fu_287_p1 = (trunc_ln708_s_reg_362_pp0_iter1_reg);

assign sext_ln708_1_fu_300_p1 = (trunc_ln708_1_reg_387);

assign sext_ln708_2_fu_309_p1 = (trunc_ln708_2_reg_392);

assign sext_ln708_3_fu_318_p1 = (trunc_ln708_3_reg_397);

assign sext_ln708_fu_278_p1 = (trunc_ln_reg_382);

endmodule //normalize_ap_fixed_ap_fixed_config16_0_0_0_0_0_0_0_0_0_0
module myproject_mul_16s_9ns_25_2_0(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



myproject_mul_16s_9ns_25_2_0_MulnS_3 myproject_mul_16s_9ns_25_2_0_MulnS_3_U(
    .clk( clk ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule
module myproject_mul_16s_9ns_25_2_0_MulnS_3(clk, ce, a, b, p);
input clk;
input ce;
input  [16 - 1 : 0] a;
input [9 - 1 : 0] b;
output[25 - 1 : 0] p;
reg  [25 - 1 : 0] p;
wire  [25 - 1 : 0] tmp_product;

assign tmp_product = (a) * ({1'b0, b});
always @ (posedge clk) begin
    if (ce) begin
        p <= tmp_product;
    end
end
endmodule
