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
/*integer rec_E_out_0, rec_E_out_1, rec_E_out_2, rec_E_out_3;
integer rec_E_out_4, rec_E_out_5, rec_E_out_6, rec_E_out_7;
initial rec_E_out_0 = $fopen("fpga_E_out_0.txt","w");
initial rec_E_out_1 = $fopen("fpga_E_out_1.txt","w");
initial rec_E_out_2 = $fopen("fpga_E_out_2.txt","w");
initial rec_E_out_3 = $fopen("fpga_E_out_3.txt","w");
initial rec_E_out_4 = $fopen("fpga_E_out_4.txt","w");
initial rec_E_out_5 = $fopen("fpga_E_out_5.txt","w");
initial rec_E_out_6 = $fopen("fpga_E_out_6.txt","w");
initial rec_E_out_7 = $fopen("fpga_E_out_7.txt","w");

always@(posedge top. ap_clk)
begin
    if(top. E_out_0_write) $fwrite(rec_E_out_0, "%h\n", top. E_out_0_din);
    if(top. E_out_1_write) $fwrite(rec_E_out_1, "%h\n", top. E_out_1_din);
    if(top. E_out_2_write) $fwrite(rec_E_out_2, "%h\n", top. E_out_2_din);
    if(top. E_out_3_write) $fwrite(rec_E_out_3, "%h\n", top. E_out_3_din);
    if(top. E_out_4_write) $fwrite(rec_E_out_4, "%h\n", top. E_out_4_din);
    if(top. E_out_5_write) $fwrite(rec_E_out_5, "%h\n", top. E_out_5_din);
    if(top. E_out_6_write) $fwrite(rec_E_out_6, "%h\n", top. E_out_6_din);
    if(top. E_out_7_write) $fwrite(rec_E_out_7, "%h\n", top. E_out_7_din);
end
*/

endmodule
