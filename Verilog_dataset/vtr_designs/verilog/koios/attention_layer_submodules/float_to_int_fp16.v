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

module float_to_int_fp16(
        input_a,
        output_z);


  input     [15:0] input_a;
  output    [15:0] output_z;

  
  wire [27:0] z;
  wire [5:0] a_e, sub_a_e;
  wire a_s;
  wire [15:0] a_m;
  wire [27:0] a_m_shift;  
  
  align_t dut_align (input_a,a_m,a_e,a_s);
  sub_t dut_sub (a_e,sub_a_e);
  am_shift_t dut_am_shift (a_e,sub_a_e,a_m,a_m_shift);
  two_comp_t dut_two_comp (a_m_shift,a_s,z);
  final_out_t dut_final_out (z, a_e, output_z);
  
endmodule
module final_out_t (
  input [27:0] z,
  input [5:0] a_e,
  output [15:0] output_z);
  
  reg [27:0] output_z_temp;

always@(a_e or z) begin
  if (a_e[5] == 1'b1 && a_e[4:0] == 5'd15) begin
		output_z_temp = 27'b0;
	end
  else if (a_e[5] == 0 && a_e[4:0] > 5'd15) begin
		output_z_temp = 27'hFFFF;
	end
	else begin
		output_z_temp = z << 12;
	end
  end
  assign output_z = output_z_temp[27:12];
endmodule
module two_comp_t (
  input [27:0] a_m_shift,
  input a_s,
  output [27:0] z);

assign z = a_s ? -a_m_shift : a_m_shift; // 2's complement

endmodule
module am_shift_t (
  input [5:0] a_e,
  input [5:0] sub_a_e,
  input [15:0] a_m,
  output reg [27:0] a_m_shift);

always@(a_e or sub_a_e or a_m) begin
  if (a_e <= 15 && a_e >= 0 ) begin
    a_m_shift = {a_m,12'b0} >> sub_a_e;
	end
	else begin
		a_m_shift = 24'h0;
	end
  end
  
endmodule
module sub_t (
  input [5:0] a_e,
  output [5:0] sub_a_e);

assign sub_a_e = 15 - a_e;

endmodule
module align_t (
  input [15:0] input_a,
  output [15:0] a_m,
  output [5:0] a_e,
  output a_s);

  wire [15:0] a;

  assign a = input_a;
  assign a_m[15:5] = {1'b1, a[9 : 0]};
  assign a_m[4:0] = 8'b0;
  assign a_e = a[14 : 10] - 15;
  assign a_s = a[15];

endmodule
