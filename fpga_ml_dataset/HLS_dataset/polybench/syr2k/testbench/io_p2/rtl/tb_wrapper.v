`timescale 1 ns / 1 ps 
`include "macro.v"
module tb;

//################################################
//reg clk_p;
//wire clk_n;
reg ap_rst;
reg ap_clk;
reg ap_start;
//wire probe_out;
wire [3:0] data_out;
wire data_valid;

//wrapper top(.clk_p(clk_p), .clk_n(clk_n), .ap_rst(ap_rst), .probe_out(probe_out), .data_out(data_out), .data_valid(data_valid));

wrapper top(.ap_clk(ap_clk), .ap_rst(ap_rst), .data_out(data_out), .data_valid(data_valid), .ap_start(ap_start));

//################################################
//initial
//begin
//    clk_p = 0;
//    ap_rst = 1;
//    #100 ap_rst = 0;
//end

//always #1.667 clk_p = ~clk_p;
//assign clk_n = ~clk_p;

initial
begin
    ap_clk = 0;
    ap_rst = 1;
    #100 
    ap_rst = 0;
    ap_start = 1;
end

always #5 ap_clk = ~ap_clk;

//################################################
/*integer rec_D_out_0, rec_D_out_1;
initial rec_D_out_0 = $fopen("fpga_D_out_0.txt","w");
initial rec_D_out_1 = $fopen("fpga_D_out_1.txt","w");
always@(posedge top. ap_clk)
begin
    if(top. D_out_0_write) $fwrite(rec_D_out_0, "%h\n", top. D_out_0_din);
    if(top. D_out_1_write) $fwrite(rec_D_out_1, "%h\n", top. D_out_1_din);
end

reg [5:0] exe_cnt = 0;
always@(posedge top. ap_clk)
begin
    if(top. ap_done)
    begin
        exe_cnt <= exe_cnt + 1;
        $display("exe_cnt = %d", exe_cnt);
    end

    // if(exe_cnt >= 6'd8) $finish;
    if(exe_cnt >= 6'd2) $finish;
end
*/
endmodule
