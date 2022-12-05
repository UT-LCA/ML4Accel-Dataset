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

module mode1_max_tree(
  inp0, 
  inp1, 
  inp2, 
  inp3, 
 
  mode1_stage2_run,
  mode1_stage1_run,
  mode1_stage0_run,
  clk,
  reset,
  outp

);

  input  [`DATAWIDTH-1 : 0] inp0; 
  input  [`DATAWIDTH-1 : 0] inp1; 
  input  [`DATAWIDTH-1 : 0] inp2; 
  input  [`DATAWIDTH-1 : 0] inp3; 

  input mode1_stage2_run;
  input mode1_stage1_run;	
  input mode1_stage0_run;
  input clk;
  input reset;

  output reg [`DATAWIDTH-1 : 0] outp;

  wire   [`DATAWIDTH-1 : 0] cmp0_out_stage2;
  wire   [`DATAWIDTH-1 : 0] cmp1_out_stage2;
  wire   [`DATAWIDTH-1 : 0] cmp0_out_stage1;
  wire   [`DATAWIDTH-1 : 0] cmp0_out_stage0;

  reg   [`DATAWIDTH-1 : 0] cmp0_out_stage2_reg;
  reg   [`DATAWIDTH-1 : 0] cmp1_out_stage2_reg;
  reg   [`DATAWIDTH-1 : 0] cmp0_out_stage1_reg;
  
  always @(posedge clk) begin
    if (reset) begin
      outp <= 0;
    end

    else if(~reset && mode1_stage0_run) begin
      outp <= cmp0_out_stage0;
    end

  end

wire cmp0_stage2_aeb;
wire cmp0_stage2_aneb;
wire cmp0_stage2_alb;
wire cmp0_stage2_aleb;
wire cmp0_stage2_agb;
wire cmp0_stage2_ageb;
wire cmp0_stage2_unordered;

wire cmp1_stage2_aeb;
wire cmp1_stage2_aneb;
wire cmp1_stage2_alb;
wire cmp1_stage2_aleb;
wire cmp1_stage2_agb;
wire cmp1_stage2_ageb;
wire cmp1_stage2_unordered;

wire cmp0_stage1_aeb;
wire cmp0_stage1_aneb;
wire cmp0_stage1_alb;
wire cmp0_stage1_aleb;
wire cmp0_stage1_agb;
wire cmp0_stage1_ageb;
wire cmp0_stage1_unordered;

wire cmp0_stage0_aeb;
wire cmp0_stage0_aneb;
wire cmp0_stage0_alb;
wire cmp0_stage0_aleb;
wire cmp0_stage0_agb;
wire cmp0_stage0_ageb;
wire cmp0_stage0_unordered;

comparator cmp0_stage2(.a(inp0),       .b(inp1),        .aeb(cmp0_stage2_aeb), .aneb(cmp0_stage2_aneb), .alb(cmp0_stage2_alb), .aleb(cmp0_stage2_aleb), .agb(cmp0_stage2_agb), .ageb(cmp0_stage2_ageb), .unordered(cmp0_stage2_unordered));
assign cmp0_out_stage2 = (cmp0_stage2_ageb==1'b1) ? inp0 : inp1;

comparator cmp1_stage2(.a(inp2),       .b(inp3),         .aeb(cmp1_stage2_aeb), .aneb(cmp1_stage2_aneb), .alb(cmp1_stage2_alb), .aleb(cmp1_stage2_aleb), .agb(cmp1_stage2_agb), .ageb(cmp1_stage2_ageb), .unordered(cmp1_stage2_unordered));   
assign cmp1_out_stage2 = (cmp1_stage2_ageb==1'b1) ? inp2 : inp3;

always @(posedge clk) begin
	if (reset) begin
		cmp0_out_stage2_reg <= 16'b0;
		cmp1_out_stage2_reg <= 16'b0;
	end
	else if (~reset && mode1_stage2_run) begin
		cmp0_out_stage2_reg <= cmp0_out_stage2;
		cmp1_out_stage2_reg <= cmp1_out_stage2;
	end
end

comparator cmp0_stage1(.a(cmp0_out_stage2_reg),       .b(cmp1_out_stage2_reg),          .aeb(cmp0_stage1_aeb), .aneb(cmp0_stage1_aneb), .alb(cmp0_stage1_alb), .aleb(cmp0_stage1_aleb), .agb(cmp0_stage1_agb), .ageb(cmp0_stage1_ageb), .unordered(cmp0_stage1_unordered));
assign cmp0_out_stage1 = (cmp0_stage1_ageb==1'b1) ? cmp0_out_stage2_reg: cmp1_out_stage2_reg;

always @(posedge clk) begin
	if (reset) begin
		cmp0_out_stage1_reg <= 16'b0;
	end
	else if (~reset && mode1_stage1_run) begin
		cmp0_out_stage1_reg <= cmp0_out_stage1;

	end
end

comparator cmp0_stage0(.a(outp),       .b(cmp0_out_stage1_reg),         .aeb(cmp0_stage0_aeb), .aneb(cmp0_stage0_aneb), .alb(cmp0_stage0_alb), .aleb(cmp0_stage0_aleb), .agb(cmp0_stage0_agb), .ageb(cmp0_stage0_ageb), .unordered(cmp0_stage0_unordered));
assign cmp0_out_stage0 = (cmp0_stage0_ageb==1'b1) ? outp : cmp0_out_stage1_reg;

//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp0_stage2(.a(inp0),       .b(inp1),      .z1(cmp0_out_stage2), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp1_stage2(.a(inp2),       .b(inp3),      .z1(cmp1_out_stage2), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp0_stage1(.a(cmp0_out_stage2),       .b(cmp1_out_stage2),      .z1(cmp0_out_stage1), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp0_stage0(.a(outp),       .b(cmp0_out_stage1),      .z1(cmp0_out_stage0), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());

endmodule
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
