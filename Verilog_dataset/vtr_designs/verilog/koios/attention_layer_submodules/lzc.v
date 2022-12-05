`define SIMULATION_MEMORY
//`define SIMULATION_addfp
`define VECTOR_DEPTH 64 //Q,K,V vector size
`define DATA_WIDTH 16
`define VECTOR_BITS 1024 // 16 bit each (16x64)
`define NUM_WORDS 32   //num of words in the sentence
`define BUF_AWIDTH 4 //16 entries in each buffer ram
`define BUF_LOC_SIZE 4 //4 words in each addr location
`define OUT_RAM_DEPTH 512 //512 entries in output bram
`define EXPONENT 8
`define MANTISSA 7
`define EXPONENT 5
`define MANTISSA 10
`define SIGN 1
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define DEFINES_DONE
`define DATAWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1
`define NUM 4
`define ADDRSIZE 4

module lzc (
  input [15:0] z_m,
  output reg [4:0] tmp_cnt_final);

  wire [15:0] Sj_int;
  //wire [15:0] val32;
wire [7:0] val8;
wire [3:0] val4;
  wire [4:0] tmp_cnt;

assign Sj_int = z_m;
  
assign    tmp_cnt[4] = 1'b0;
assign    tmp_cnt[3] = (Sj_int[15:8] == 8'b0);
assign    val8 = tmp_cnt[3] ? Sj_int[7:0] : Sj_int[15:8];
assign    tmp_cnt[2] = (val8[7:4] == 4'b0);
assign    val4 = tmp_cnt[2] ? val8[3:0] : val8[7:4];
assign    tmp_cnt[1] = (val4[3:2] == 2'b0);
assign    tmp_cnt[0] = tmp_cnt[1] ? ~val4[1] : ~val4[3];

always@(Sj_int or tmp_cnt)
begin
  if (Sj_int[15:0] == 16'b0)
   tmp_cnt_final = 5'd16;
else
   begin
   tmp_cnt_final = tmp_cnt;
end
end
endmodule
