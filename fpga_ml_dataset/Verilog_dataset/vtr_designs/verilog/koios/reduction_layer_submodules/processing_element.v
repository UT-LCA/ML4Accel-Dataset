`define DWIDTH 16
`define LOGDWIDTH 4
`define AWIDTH 5
`define MEM_SIZE 2048
`define NUM_INPUTS 128
`define VCS

module processing_element(
  A, B, OUT, MODE
);
parameter IN_DWIDTH = 16;
parameter OUT_DWIDTH = 4;
input [IN_DWIDTH-1:0] A;
input [IN_DWIDTH-1:0] B;
output [OUT_DWIDTH-1:0] OUT;
input [1:0] MODE;

wire [OUT_DWIDTH-1:0] greater;
wire [OUT_DWIDTH-1:0] smaller;
wire [OUT_DWIDTH-1:0] sum;

assign greater = (A>B) ? A : B;
assign smaller = (A<B) ? A : B;
assign sum = A + B;

assign OUT = (MODE==0) ? sum : 
             (MODE==1) ? greater :
             smaller;

endmodule
