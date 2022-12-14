`include "macro.v"
module mem_ctrl (ap_clk, ap_rst, ap_start, ap_done, rom_en, rom_addr, rom_data, ram_en, ram_addr, ram_data, kernel_ram_sel);

//Kernel RAM
parameter DATA_WIDTH = 32;
parameter DATA_SIZE = 64;
parameter RAM_ADDR_WIDTH = (`CLOG2(DATA_SIZE));
parameter RAM_UPDATE_INV = 4;

//Dataset ROM
parameter DATASET_NUM = 8;
parameter ROM_ADDR_WIDTH = (`CLOG2(DATA_SIZE*DATASET_NUM));

input ap_clk;
input ap_rst;
input ap_start;
input ap_done;

output reg rom_en;
output [ROM_ADDR_WIDTH-1:0] rom_addr;
input [DATA_WIDTH-1:0] rom_data;

output reg [1:0] ram_en;
output reg [RAM_ADDR_WIDTH-1:0] ram_addr;
output reg [DATA_WIDTH-1:0] ram_data;

output reg kernel_ram_sel = 0;

//##########################################
reg [9:0] inv_cnt = 0;

always@(posedge ap_clk)
begin        
    if(ap_rst) 
    begin
        inv_cnt <= 0;
        kernel_ram_sel <= 0;
    end
    else if(ap_done) 
    begin
        if(inv_cnt < RAM_UPDATE_INV-1) 
        begin
            inv_cnt <= inv_cnt + 1;
        end
        else 
        begin
            inv_cnt <= 0;
            kernel_ram_sel <= ~kernel_ram_sel;
        end
    end
end

//##########################################
reg reg_kernel_ram_sel;
wire pos_kernel_ram_sel, neg_kernel_ram_sel;
always@(posedge ap_clk) reg_kernel_ram_sel <= kernel_ram_sel;
assign pos_kernel_ram_sel = kernel_ram_sel & (~reg_kernel_ram_sel);
assign neg_kernel_ram_sel = (~kernel_ram_sel) & reg_kernel_ram_sel;

//##########################################
reg [2:0] inv_index = 1;

always@(posedge ap_clk)
begin
    if(ap_rst) inv_index <= 1;
    else if(pos_kernel_ram_sel || neg_kernel_ram_sel)
    begin
        if(inv_index >= 7) inv_index <= 0;
        else inv_index <= inv_index + 1;
    end
end

//##########################################
reg [RAM_ADDR_WIDTH:0] wx2_ram_cnt = 0;

parameter IDLE = 2'd0;
parameter RD_STAGE_1 = 2'd1;
parameter RD_STAGE_2 = 2'd2;

reg [1:0] current_state = IDLE;
reg [1:0] next_state = IDLE;

always@(posedge ap_clk)
begin
    current_state <= next_state;
end

always@(*)
begin
    case(current_state)
        IDLE:
        begin
            if(ap_rst) next_state = IDLE;
            else if(pos_kernel_ram_sel || neg_kernel_ram_sel) next_state = RD_STAGE_1;
            else next_state = IDLE;
        end
        RD_STAGE_1:
        begin
            next_state = RD_STAGE_2;
        end
        RD_STAGE_2:
        begin
            if(wx2_ram_cnt < DATA_SIZE-1) next_state = RD_STAGE_2;
            else next_state = IDLE;
        end
        default: next_state = IDLE;
    endcase
end

always@(posedge ap_clk)
begin
    case(next_state)
        IDLE:
        begin
            wx2_ram_cnt <= 0;
            rom_en <= 0;
        end
        RD_STAGE_1:
        begin
            wx2_ram_cnt <= 0;
            rom_en <= 1;
        end
        RD_STAGE_2:
        begin
            wx2_ram_cnt <= wx2_ram_cnt + 1;
            rom_en <= 1;
        end
    endcase
end

assign rom_addr = {inv_index, wx2_ram_cnt[RAM_ADDR_WIDTH-1:0]};

//##########################################
reg reg_rdram_en;
always@(posedge ap_clk) 
begin
    reg_rdram_en <= rom_en;
    ram_en <= {reg_rdram_en & (~kernel_ram_sel), reg_rdram_en & kernel_ram_sel};
end

reg [ROM_ADDR_WIDTH-1:0] reg_rdram_addr;
always@(posedge ap_clk)
begin
    reg_rdram_addr <= rom_addr;
    ram_addr <= reg_rdram_addr;
end

always@(posedge ap_clk)
begin
    ram_data <= rom_data;
end

endmodule