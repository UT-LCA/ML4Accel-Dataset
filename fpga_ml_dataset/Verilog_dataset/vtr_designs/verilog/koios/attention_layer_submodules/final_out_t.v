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
