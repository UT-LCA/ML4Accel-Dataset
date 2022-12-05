`define SIMULATION_MEMORY
`define ARRAY_DEPTH 64      //Number of Hidden neurons
`define INPUT_DEPTH 100	    //LSTM input vector dimensions
`define DATA_WIDTH 16		//16 bit representation
`define INWEIGHT_DEPTH 6400 //100x64
`define HWEIGHT_DEPTH 4096  //64x64
`define varraysize 1600   //100x16
`define uarraysize 1024  //64x16

module signedmul(
  input clk,
  input [15:0] a,
  input [15:0] b,
  output [15:0] c
);

wire [31:0] result;
wire [15:0] a_new;
wire [15:0] b_new;

reg [15:0] a_ff;
reg [15:0] b_ff;
reg [31:0] result_ff;
reg a_sign,b_sign,a_sign_ff,b_sign_ff;

assign c = (b_sign_ff==a_sign_ff)?result_ff[26:12]:(~result_ff[26:12]+1'b1);
assign a_new = a[15]?(~a + 1'b1):a;
assign b_new = b[15]?(~b + 1'b1):b;
assign result = a_ff*b_ff;

always@(posedge clk) begin
	a_ff <= a_new;
	b_ff <= b_new; 

	a_sign <= a[15];
	b_sign <= b[15];
	a_sign_ff <= a_sign;
	b_sign_ff <= b_sign;
    result_ff <= result;
    
end


endmodule
