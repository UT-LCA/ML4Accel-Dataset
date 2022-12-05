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
