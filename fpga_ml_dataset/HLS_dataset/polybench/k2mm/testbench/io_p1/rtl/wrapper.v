`include "macro.v"
//module wrapper(clk_p, clk_n, ap_rst, probe_out, data_out, data_valid);
module wrapper(ap_clk, ap_rst, data_out, data_valid, ap_start);
parameter IO_PARTITION_FACTOR = 1; //change according to different io partition factors
parameter DATASET_UPDATE_INV = 1;  //change to reduce ram writing frequency
parameter INV_DATASET_SIZE = 4096; //in[64][64] = 4096

parameter DATA_SIZE_PER_RAM = (INV_DATASET_SIZE / IO_PARTITION_FACTOR);
parameter DATA_WIDTH = 64;
parameter DATASET_NUM = 8;

//###############################
// input clk_p;
// input clk_n;
input ap_rst;
input ap_clk;
// output probe_out;
output reg [3:0] data_out;
output reg data_valid;

// wire ap_clk;
// clk_wiz_0 gen_clk(.clk_in1_p(clk_p), .clk_in1_n(clk_n), .clk_out1(ap_clk), .reset(1'b0), .locked());

wire ap_done;
wire ap_idle;
wire ap_ready;
//reg ap_start;
input ap_start;

//###############################
reg [31:0] alpha = 32'hbe000000;
reg [31:0] beta = 32'h3eaa7efa;

wire [11:0] A_address0;
wire A_ce0;
wire [31:0] A_q0;
wire [11:0] B_address0;
wire B_ce0;
wire [31:0] B_q0;
wire [11:0] C_address0;
wire C_ce0;
wire [31:0] C_q0;
wire [11:0] D_address0;
wire D_ce0;
wire [31:0] D_q0;
wire [31:0] E_out_din;
wire E_out_write;

//###############################
// vio_0 vio_inst(.clk(ap_clk), .probe_out0(probe_out));

// reg pp_ap_start, p_ap_start;
// always@(posedge ap_clk)
// begin
//     pp_ap_start <= probe_out;
//     p_ap_start <= pp_ap_start;
//     ap_start <= p_ap_start;
// end

//############# A #############
kernel_ram #(.DATA_WIDTH(DATA_WIDTH), .DATA_SIZE(DATA_SIZE_PER_RAM), .RAM_ADDR_WIDTH(`CLOG2(DATA_SIZE_PER_RAM)), .RAM_UPDATE_INV(DATASET_UPDATE_INV),
    .DATASET_NUM(DATASET_NUM), .ROM_ADDR_WIDTH((`CLOG2(DATA_SIZE_PER_RAM*DATASET_NUM))), 
    .ROM_INIT_FILE({`PRJ_DIR, "mif/A_rom_0.mif"}), 
    .RAM_INIT_FILE_0({`PRJ_DIR, "mif/A_ram_0_0.mif"}), 
    .RAM_INIT_FILE_1({`PRJ_DIR, "mif/A_ram_0_1.mif"}))
A_ram_0 (.ap_clk(ap_clk), .ap_rst(ap_rst), .ap_start(ap_start), .ap_done(ap_done), 
    .kram_en(A_ce0), .kram_addr(A_address0), .kram_dout(A_q0));

//############# B #############
kernel_ram #(.DATA_WIDTH(DATA_WIDTH), .DATA_SIZE(DATA_SIZE_PER_RAM), .RAM_ADDR_WIDTH(`CLOG2(DATA_SIZE_PER_RAM)), .RAM_UPDATE_INV(DATASET_UPDATE_INV),
    .DATASET_NUM(DATASET_NUM), .ROM_ADDR_WIDTH((`CLOG2(DATA_SIZE_PER_RAM*DATASET_NUM))), 
    .ROM_INIT_FILE({`PRJ_DIR, "mif/B_rom_0.mif"}), 
    .RAM_INIT_FILE_0({`PRJ_DIR, "mif/B_ram_0_0.mif"}), 
    .RAM_INIT_FILE_1({`PRJ_DIR, "mif/B_ram_0_1.mif"}))
B_ram_0 (.ap_clk(ap_clk), .ap_rst(ap_rst), .ap_start(ap_start), .ap_done(ap_done), 
    .kram_en(B_ce0), .kram_addr(B_address0), .kram_dout(B_q0));

//############# C #############
kernel_ram #(.DATA_WIDTH(DATA_WIDTH), .DATA_SIZE(DATA_SIZE_PER_RAM), .RAM_ADDR_WIDTH(`CLOG2(DATA_SIZE_PER_RAM)), .RAM_UPDATE_INV(DATASET_UPDATE_INV),
    .DATASET_NUM(DATASET_NUM), .ROM_ADDR_WIDTH((`CLOG2(DATA_SIZE_PER_RAM*DATASET_NUM))), 
    .ROM_INIT_FILE({`PRJ_DIR, "mif/C_rom_0.mif"}), 
    .RAM_INIT_FILE_0({`PRJ_DIR, "mif/C_ram_0_0.mif"}), 
    .RAM_INIT_FILE_1({`PRJ_DIR, "mif/C_ram_0_1.mif"}))
C_ram_0 (.ap_clk(ap_clk), .ap_rst(ap_rst), .ap_start(ap_start), .ap_done(ap_done), 
    .kram_en(C_ce0), .kram_addr(C_address0), .kram_dout(C_q0));

//############# D #############
kernel_ram #(.DATA_WIDTH(DATA_WIDTH), .DATA_SIZE(DATA_SIZE_PER_RAM), .RAM_ADDR_WIDTH(`CLOG2(DATA_SIZE_PER_RAM)), .RAM_UPDATE_INV(DATASET_UPDATE_INV),
    .DATASET_NUM(DATASET_NUM), .ROM_ADDR_WIDTH((`CLOG2(DATA_SIZE_PER_RAM*DATASET_NUM))), 
    .ROM_INIT_FILE({`PRJ_DIR, "mif/D_rom_0.mif"}), 
    .RAM_INIT_FILE_0({`PRJ_DIR, "mif/D_ram_0_0.mif"}), 
    .RAM_INIT_FILE_1({`PRJ_DIR, "mif/D_ram_0_1.mif"}))
D_ram_0 (.ap_clk(ap_clk), .ap_rst(ap_rst), .ap_start(ap_start), .ap_done(ap_done), 
    .kram_en(D_ce0), .kram_addr(D_address0), .kram_dout(D_q0));

//#############################
k2mm kernel(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .alpha(alpha),
    .beta(beta),
    .A_address0(A_address0),
    .A_ce0(A_ce0),
    .A_q0(A_q0),
    .B_address0(B_address0),
    .B_ce0(B_ce0),
    .B_q0(B_q0),
    .C_address0(C_address0),
    .C_ce0(C_ce0),
    .C_q0(C_q0),
    .D_address0(D_address0),
    .D_ce0(D_ce0),
    .D_q0(D_q0),
    .E_out_din(E_out_din),
    .E_out_full_n(1'b1),
    .E_out_write(E_out_write)
);

//############## output stage 1: xor output by itself ##############
reg [8-1:0] xor_1;
reg xor_valid_1;

always@(posedge ap_clk)
begin
    xor_valid_1 <= E_out_write;
    xor_1 <= E_out_din[7:0] ^ E_out_din[15:8] ^ E_out_din[23:16] ^ E_out_din[31:24];
end

always@(posedge ap_clk)
begin
    data_valid <= xor_valid_1;
    data_out <= xor_valid_1 ? xor_1[7:4] ^ xor_1[3:0] : 0;
end

endmodule