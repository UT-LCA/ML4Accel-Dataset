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

module int_to_float_fp16(
        input_a,
        output_z);


  input     [15:0] input_a;
  output    [15:0] output_z;

  
  wire [15:0] value;
  wire z_s;
  wire [4:0] tmp_cnt;
  wire [4:0] sub_a_e;
  wire [4:0] sub_z_e;
  wire [15:0] a_m_shift;
  wire [10:0] z_m_final;
  wire [4:0] z_e_final;
  //wire [31:0] z;
  
  align dut_align (input_a,value,z_s);
  lzc dut_lzc (value,tmp_cnt);
  sub dut_sub (tmp_cnt,sub_a_e);
  sub2 dut_sub2 (sub_a_e,sub_z_e);
  am_shift dut_am_shift (value,sub_a_e,a_m_shift);
  exception dut_exception (a_m_shift,sub_z_e,z_m_final,z_e_final);
  final_out dut_final_out (input_a,z_m_final,z_e_final,z_s,output_z);

  
endmodule
module final_out (
  input [15:0] a,
  input [10:0] z_m,
  input [4:0] z_e,
  input z_s,
  output reg [15:0] output_z);

  always@(a or z_m or z_e or z_s) begin
    if (a == 16'b0) begin
		output_z = 16'b0;
	end
	else begin
      output_z[9:0] = z_m[9:0];
      output_z[14:10] = z_e + 8'd3;
      output_z[15] = z_s;
	end
  end

endmodule
module exception (
  input [15:0] a_m_shift,
  input [4:0] z_e,
  output reg [10:0] z_m_final,
  output reg [4:0] z_e_final
);

wire guard;
wire round_bit;
wire sticky;
  wire [10:0] z_m;

  assign guard = a_m_shift[4];
  assign round_bit = a_m_shift[3];
  assign sticky = a_m_shift[2:0] != 0;

  assign z_m = a_m_shift[15:5];

always@(guard or round_bit or sticky or z_m or z_e)
begin
if (guard && (round_bit || sticky || z_m[0])) begin
    z_m_final = z_m + 1;
   if (z_m == 11'b11111111111) begin
            z_e_final = z_e + 1;
          end
		  else z_e_final = z_e;
          end
else begin 
  z_m_final = z_m;
  z_e_final = z_e;
end
end
endmodule
module am_shift (
  input [15:0] a_m,
  input [4:0] tmp_cnt,
  output [15:0] a_m_shift);

assign a_m_shift = a_m << tmp_cnt;  
endmodule
module sub2 (
  input [4:0] a_e,
  output [4:0] sub_a_e);

assign sub_a_e = 15 - a_e;

endmodule
module sub (
  input [4:0] a_e,
  output [4:0] sub_a_e);

assign sub_a_e = a_e;

endmodule
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
module align (
  input [15:0] a,
  output [15:0] value,
output z_s);


  assign value = a[15] ? -a : a;
  assign z_s = a[15];

endmodule
