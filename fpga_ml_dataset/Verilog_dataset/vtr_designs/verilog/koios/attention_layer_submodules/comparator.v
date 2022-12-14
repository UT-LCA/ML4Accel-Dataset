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

module comparator(
a,
b,
aeb,
aneb,
alb,
aleb,
agb,
ageb,
unordered
);

input [15:0] a;
input [15:0] b;
output aeb;
output aneb;
output alb;
output aleb;
output agb;
output ageb;
output unordered;

  

reg lt;
reg eq;
reg gt;

wire [15:0] a_t;
wire [15:0] b_t;

assign a_t = (~a[15:0])+1;
assign b_t = (~b[15:0])+1;

always @(*) begin
	if (a[15] == 1'b0 && b[15] == 1'b1) begin
		if (a != b) begin
		eq = 1'b0;
		lt = 1'b0;
		gt = 1'b1;
		end
		else begin
		eq = 1'b1;
		lt = 1'b0;
		gt = 1'b0;
		end
	end
	else if (a[15] == 1'b1 && b[15] == 1'b0) begin
		if (a != b) begin
		lt = 1'b1;
		gt = 1'b0;
		eq = 1'b0;
		end
		else begin
		lt = 1'b0;
		gt = 1'b0;
		eq = 1'b1;
		end
	end
	else if (a[15] == 1'b0 && b[15] == 1'b0) begin
		if (a > b) begin
		lt = 1'b0;
		gt = 1'b1;
		eq = 1'b0;
		end
		else if (a < b) begin
		lt = 1'b1;
		gt = 1'b0;
		eq = 1'b0;
		end
		else begin
		lt = 1'b0;
		gt = 1'b0;
		eq = 1'b1;
		end
	end
	else if (a[15] == 1'b1 && b[15] == 1'b1) begin
		if (a_t > b_t) begin
		lt = 1'b1;
		gt = 1'b0;
		eq = 1'b0;
		end
		else if (a_t < b_t) begin
		lt = 1'b0;
		gt = 1'b1;
		eq = 1'b0;
		end
		else begin
		lt = 1'b0;
		gt = 1'b0;
		eq = 1'b1;
		end
	end
end


//Result flags
assign aeb = eq;
assign aneb = ~eq;
assign alb = lt;
assign aleb = lt | eq;
assign agb = gt;
assign ageb = gt | eq;

endmodule
