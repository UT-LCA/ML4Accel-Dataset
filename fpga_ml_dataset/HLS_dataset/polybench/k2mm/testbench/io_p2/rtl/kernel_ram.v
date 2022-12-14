`include "macro.v"
module kernel_ram (ap_clk, ap_rst, ap_start, ap_done, kram_en, kram_addr, kram_dout); 

//Kernel RAM: simple dual-port ram (1 wr + 1 rd port)
parameter DATA_WIDTH = 32;
parameter DATA_SIZE = 64;
parameter RAM_ADDR_WIDTH = (`CLOG2(DATA_SIZE));
parameter RAM_UPDATE_INV = 4;

//Dataset ROM: single-port rom 
parameter DATASET_NUM = 8;
parameter ROM_ADDR_WIDTH = (`CLOG2(DATA_SIZE*DATASET_NUM));

//Init file
parameter ROM_INIT_FILE = "/mif/"; 
parameter RAM_INIT_FILE_0 = "/mif/"; 
parameter RAM_INIT_FILE_1 = "/mif/";

input ap_clk, ap_rst, ap_start, ap_done;
input kram_en;
input [RAM_ADDR_WIDTH-1:0] kram_addr;
output reg [DATA_WIDTH-1:0] kram_dout;

//##########################################
wire rom_en;
wire [ROM_ADDR_WIDTH-1:0] rom_addr;
wire [DATA_WIDTH-1:0] rom_data;

wire [1:0] ram_en;
wire [RAM_ADDR_WIDTH-1:0] ram_addr;
wire [DATA_WIDTH-1:0] ram_data;
wire kram_sel;

mem_ctrl #(.DATA_WIDTH(DATA_WIDTH), .DATA_SIZE(DATA_SIZE), .RAM_ADDR_WIDTH(RAM_ADDR_WIDTH), .RAM_UPDATE_INV(RAM_UPDATE_INV),
    .DATASET_NUM(DATASET_NUM), .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH))
memctrl(.ap_clk(ap_clk), .ap_rst(ap_rst), .ap_start(ap_start), .ap_done(ap_done), 
    .rom_en(rom_en), .rom_addr(rom_addr), .rom_data(rom_data), 
    .ram_en(ram_en), .ram_addr(ram_addr), .ram_data(ram_data), .kernel_ram_sel(kram_sel));

//##########################################
sp_rom #(.INIT_FILE(ROM_INIT_FILE), .DATA_WIDTH(DATA_WIDTH), .DATA_NUM(DATA_SIZE*DATASET_NUM), .ADDR_WIDTH(ROM_ADDR_WIDTH))
drom (.a_clk(ap_clk), .a_en(rom_en), .a_addr(rom_addr), .a_dout(rom_data));

wire [DATA_WIDTH-1:0] kram_dout_0, kram_dout_1;
sdp_ram  #(.INIT_FILE(RAM_INIT_FILE_0), .DATA_WIDTH(DATA_WIDTH), .DATA_NUM(DATA_SIZE), .ADDR_WIDTH(RAM_ADDR_WIDTH))
kram_0 (.a_clk(ap_clk), .a_en(ram_en[0]), .a_wr(ram_en[0]), .a_addr(ram_addr), .a_din(ram_data), 
    .b_clk(ap_clk), .b_en(kram_en & (~kram_sel)), .b_addr(kram_addr), .b_dout(kram_dout_0));

sdp_ram  #(.INIT_FILE(RAM_INIT_FILE_1), .DATA_WIDTH(DATA_WIDTH), .DATA_NUM(DATA_SIZE), .ADDR_WIDTH(RAM_ADDR_WIDTH))
kram_1 (.a_clk(ap_clk), .a_en(ram_en[1]), .a_wr(ram_en[1]), .a_addr(ram_addr), .a_din(ram_data), 
    .b_clk(ap_clk), .b_en(kram_en & kram_sel), .b_addr(kram_addr), .b_dout(kram_dout_1));

reg reg_kram_en, reg_kram_sel;
always@(posedge ap_clk)
begin
    reg_kram_en <= kram_en;
    reg_kram_sel <= kram_sel;
end

always@(*)
begin
    if(reg_kram_en && (~reg_kram_sel)) kram_dout = kram_dout_0;
    else if(reg_kram_en && reg_kram_sel) kram_dout = kram_dout_1;
    else kram_dout = 0;
end

endmodule