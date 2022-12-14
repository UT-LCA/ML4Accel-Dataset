//`define ARCH_SPECIFIC_IMP 1
`define VCS
`define DWIDTH 16
`define AWIDTH 10
`define MEM_SIZE 1024
`define DESIGN_SIZE 8
`define MAT_MUL_SIZE 4
`define MASK_WIDTH 4
`define LOG2_MAT_MUL_SIZE 2
`define NUM_CYCLES_IN_MAC 3
`define MEM_ACCESS_LATENCY 1
`define REG_DATAWIDTH 32
`define REG_ADDRWIDTH 8
`define ADDR_STRIDE_WIDTH 16
`define REG_STDN_TPU_ADDR 32'h4
`define REG_MATRIX_A_ADDR 32'he
`define REG_MATRIX_B_ADDR 32'h12
`define REG_MATRIX_C_ADDR 32'h16
`define REG_VALID_MASK_A_ROWS_ADDR 32'h20
`define REG_VALID_MASK_A_COLS_ADDR 32'h54
`define REG_VALID_MASK_B_ROWS_ADDR 32'h5c
`define REG_VALID_MASK_B_COLS_ADDR 32'h58
`define REG_MATRIX_A_STRIDE_ADDR 32'h28
`define REG_MATRIX_B_STRIDE_ADDR 32'h32
`define REG_MATRIX_C_STRIDE_ADDR 32'h36
`define ADDRESS_BASE_A 10'd0
`define ADDRESS_BASE_B 10'd0
`define ADDRESS_BASE_C 10'd0

module systolic_pe_matrix(
reset,
clk,
pe_reset,
start_mat_mul,
ready_for_eltwise_op,
op,
a0, a1, a2, a3,
b0, b1, b2, b3,
matrixC00,
matrixC01,
matrixC02,
matrixC03,
matrixC10,
matrixC11,
matrixC12,
matrixC13,
matrixC20,
matrixC21,
matrixC22,
matrixC23,
matrixC30,
matrixC31,
matrixC32,
matrixC33,
a_data_out,
b_data_out,
flags
);

input clk;
input reset;
input pe_reset;
input start_mat_mul;
input ready_for_eltwise_op;
input [1:0] op;
input [`DWIDTH-1:0] a0;
input [`DWIDTH-1:0] a1;
input [`DWIDTH-1:0] a2;
input [`DWIDTH-1:0] a3;
input [`DWIDTH-1:0] b0;
input [`DWIDTH-1:0] b1;
input [`DWIDTH-1:0] b2;
input [`DWIDTH-1:0] b3;
output [`DWIDTH-1:0] matrixC00;
output [`DWIDTH-1:0] matrixC01;
output [`DWIDTH-1:0] matrixC02;
output [`DWIDTH-1:0] matrixC03;
output [`DWIDTH-1:0] matrixC10;
output [`DWIDTH-1:0] matrixC11;
output [`DWIDTH-1:0] matrixC12;
output [`DWIDTH-1:0] matrixC13;
output [`DWIDTH-1:0] matrixC20;
output [`DWIDTH-1:0] matrixC21;
output [`DWIDTH-1:0] matrixC22;
output [`DWIDTH-1:0] matrixC23;
output [`DWIDTH-1:0] matrixC30;
output [`DWIDTH-1:0] matrixC31;
output [`DWIDTH-1:0] matrixC32;
output [`DWIDTH-1:0] matrixC33;
output [`MAT_MUL_SIZE*`DWIDTH-1:0] a_data_out;
output [`MAT_MUL_SIZE*`DWIDTH-1:0] b_data_out;
output [3:0] flags;

wire [`DWIDTH-1:0] a00to01, a01to02, a02to03, a03to04;
wire [`DWIDTH-1:0] a10to11, a11to12, a12to13, a13to14;
wire [`DWIDTH-1:0] a20to21, a21to22, a22to23, a23to24;
wire [`DWIDTH-1:0] a30to31, a31to32, a32to33, a33to34;

wire [`DWIDTH-1:0] b00to10, b10to20, b20to30, b30to40; 
wire [`DWIDTH-1:0] b01to11, b11to21, b21to31, b31to41;
wire [`DWIDTH-1:0] b02to12, b12to22, b22to32, b32to42;
wire [`DWIDTH-1:0] b03to13, b13to23, b23to33, b33to43;

wire effective_rst;
assign effective_rst = reset | pe_reset;

wire [3:0] flags_pe00;
wire [3:0] flags_pe01;
wire [3:0] flags_pe02;
wire [3:0] flags_pe03;
wire [3:0] flags_pe10;
wire [3:0] flags_pe11;
wire [3:0] flags_pe12;
wire [3:0] flags_pe13;
wire [3:0] flags_pe20;
wire [3:0] flags_pe21;
wire [3:0] flags_pe22;
wire [3:0] flags_pe23;
wire [3:0] flags_pe30;
wire [3:0] flags_pe31;
wire [3:0] flags_pe32;
wire [3:0] flags_pe33;

assign flags = 
flags_pe00 |
flags_pe01 |
flags_pe02 |
flags_pe03 |
flags_pe10 |
flags_pe11 |
flags_pe12 |
flags_pe13 |
flags_pe20 |
flags_pe21 |
flags_pe22 |
flags_pe23 |
flags_pe30 |
flags_pe31 |
flags_pe32 |
flags_pe33;

assign flags_pe03 = 4'b0;
assign flags_pe13 = 4'b0;
assign flags_pe23 = 4'b0;
assign flags_pe33 = 4'b0;

processing_element pe00(.reset(effective_rst), .clk(clk),  .flags(flags_pe00), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a0),      .in_b(b0),  .out_a(a00to01), .out_b(b00to10), .out_c(matrixC00));
processing_element pe01(.reset(effective_rst), .clk(clk),  .flags(flags_pe01), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a00to01), .in_b(b1),  .out_a(a01to02), .out_b(b01to11), .out_c(matrixC01));
processing_element pe02(.reset(effective_rst), .clk(clk),  .flags(flags_pe02), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a01to02), .in_b(b2),  .out_a(a02to03), .out_b(b02to12), .out_c(matrixC02));
//processing_element pe03(.reset(effective_rst), .clk(clk),  .flags(flags_pe03), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a02to03), .in_b(b3),  .out_a(a03to04), .out_b(b03to13), .out_c(matrixC03));

processing_element pe10(.reset(effective_rst), .clk(clk),  .flags(flags_pe10), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a1),      .in_b(b00to10), .out_a(a10to11), .out_b(b10to20), .out_c(matrixC10));
processing_element pe11(.reset(effective_rst), .clk(clk),  .flags(flags_pe11), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a10to11), .in_b(b01to11), .out_a(a11to12), .out_b(b11to21), .out_c(matrixC11));
processing_element pe12(.reset(effective_rst), .clk(clk),  .flags(flags_pe12), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a11to12), .in_b(b02to12), .out_a(a12to13), .out_b(b12to22), .out_c(matrixC12));
//processing_element pe13(.reset(effective_rst), .clk(clk),  .flags(flags_pe13), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a12to13), .in_b(b03to13), .out_a(a13to14), .out_b(b13to23), .out_c(matrixC13));

processing_element pe20(.reset(effective_rst), .clk(clk),  .flags(flags_pe20), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a2),      .in_b(b10to20), .out_a(a20to21), .out_b(b20to30), .out_c(matrixC20));
processing_element pe21(.reset(effective_rst), .clk(clk),  .flags(flags_pe21), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a20to21), .in_b(b11to21), .out_a(a21to22), .out_b(b21to31), .out_c(matrixC21));
processing_element pe22(.reset(effective_rst), .clk(clk),  .flags(flags_pe22), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a21to22), .in_b(b12to22), .out_a(a22to23), .out_b(b22to32), .out_c(matrixC22));
//processing_element pe23(.reset(effective_rst), .clk(clk),  .flags(flags_pe23), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a22to23), .in_b(b13to23), .out_a(a23to24), .out_b(b23to33), .out_c(matrixC23));

processing_element pe30(.reset(effective_rst), .clk(clk),  .flags(flags_pe30), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a3),      .in_b(b20to30), .out_a(a30to31), .out_b(b30to40), .out_c(matrixC30));
processing_element pe31(.reset(effective_rst), .clk(clk),  .flags(flags_pe31), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a30to31), .in_b(b21to31), .out_a(a31to32), .out_b(b31to41), .out_c(matrixC31));
processing_element pe32(.reset(effective_rst), .clk(clk),  .flags(flags_pe32), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a31to32), .in_b(b22to32), .out_a(a32to33), .out_b(b32to42), .out_c(matrixC32));
//processing_element pe33(.reset(effective_rst), .clk(clk),  .flags(flags_pe33), .op(op), .ready_for_eltwise_op(ready_for_eltwise_op), .in_a(a32to33), .in_b(b23to33), .out_a(a33to34), .out_b(b33to43), .out_c(matrixC33));

assign a_data_out = {a33to34,a23to24,a13to14,a03to04};
assign b_data_out = {b33to43,b32to42,b31to41,b30to40};

endmodule
module processing_element(
 reset, 
 clk, 
 op,
 ready_for_eltwise_op,
 in_a,
 in_b, 
 out_a, 
 out_b, 
 out_c,
 flags
 );

 input reset;
 input clk;
 input [1:0] op;
 input ready_for_eltwise_op;
 input  [`DWIDTH-1:0] in_a;
 input  [`DWIDTH-1:0] in_b;
 output [`DWIDTH-1:0] out_a;
 output [`DWIDTH-1:0] out_b;
 output [`DWIDTH-1:0] out_c;  //reduced precision
 output [3:0] flags;

 reg [`DWIDTH-1:0] out_a;
 reg [`DWIDTH-1:0] out_b;
 wire [`DWIDTH-1:0] out_c;

 wire [`DWIDTH-1:0] out_mac;

//op[1]  op[0]
//   0      0   -> mat mul
//   0      1   -> elt mul
//   1      0   -> elt add
//   1      1   -> elt sub
wire eltwise_mode;
wire eltwise_mul;
wire eltwise_add;
wire eltwise_sub;
assign eltwise_mode =  ( op[1]  |   op[0]);
assign eltwise_mul  =  (~op[1]  &   op[0]);
assign eltwise_add  =  ( op[1]  &  ~op[0]);
assign eltwise_sub  =  ( op[1]  &   op[0]);

 assign out_c = out_mac;

 //Keep the mac in reset if we're adding 
 wire mac_reset;
 assign mac_reset = reset || (eltwise_mode && (~ready_for_eltwise_op));
 seq_mac u_mac(.a(in_a), .b(in_b), .out(out_mac), .eltwise_mode(eltwise_mode), .eltwise_add(eltwise_add), .reset(mac_reset), .clk(clk));

 always @(posedge clk)begin
    if(reset) begin
      out_a<=0;
      out_b<=0;
    end
    //stop shifting when you're in eltwise mode and ready to perform the op
    else if ((~eltwise_mode) || (eltwise_mode & ~ready_for_eltwise_op)) begin  
      out_a<=in_a;
      out_b<=in_b;
    end
 end
 
endmodule
module seq_mac(a, b, out, eltwise_mode, eltwise_add, reset, clk);
input [`DWIDTH-1:0] a;
input [`DWIDTH-1:0] b;
output [`DWIDTH-1:0] out;
input eltwise_mode;
input eltwise_add;
input reset;
input clk;

reg [`DWIDTH-1:0] out;
wire [`DWIDTH-1:0] add_out;
wire [2*`DWIDTH-1:0] add_out_temp;
wire [2*`DWIDTH-1:0] mac_out;
reg [2*`DWIDTH-1:0] add_out_reg;

reg [`DWIDTH-1:0] a_flopped;
reg [`DWIDTH-1:0] b_flopped;

always @(posedge clk) begin
  if (reset) begin
    a_flopped <= 0;
    b_flopped <= 0;
  end else begin
    a_flopped <= a;
    b_flopped <= b;
  end
end

wire [17:0] a_in;
wire [18:0] b_in;
wire [36:0] c_out;
assign a_in = {1'b0,a_flopped};
assign b_in = {1'b0,1'b0,b_flopped};
mac_int u_mac (.clk(clk), .reset(reset), .a(a_flopped), .b(b_flopped), .out(c_out));
assign mac_out = c_out[2*`DWIDTH-1:0];


wire [2*`DWIDTH-1:0] add_in1;
wire [2*`DWIDTH-1:0] add_in2;
assign add_in1 = {{`DWIDTH{1'b0}}, a_flopped};
assign add_in2 = {{`DWIDTH{1'b0}}, b_flopped};
qadd add_u1(.a(add_in1), .b(add_in2), .c(add_out_temp));

always @(posedge clk) begin
  if (reset) begin
    add_out_reg <= 0;
  end
  else if(eltwise_mode & eltwise_add) begin
    add_out_reg <= add_out_temp;
  end
  else begin
    add_out_reg <= mac_out;
  end
end

//down cast the result
assign add_out = 
    (add_out_reg[2*`DWIDTH-1] == 0) ?  //positive number
        (
           (|(add_out_reg[2*`DWIDTH-2 : `DWIDTH-1])) ?  //is any bit from 14:7 is 1, that means overlfow
             {add_out_reg[2*`DWIDTH-1] , {(`DWIDTH-1){1'b1}}} : //sign bit and then all 1s
             {add_out_reg[2*`DWIDTH-1] , add_out_reg[`DWIDTH-2:0]} 
        )
        : //negative number
        (
           (|(add_out_reg[2*`DWIDTH-2 : `DWIDTH-1])) ?  //is any bit from 14:7 is 0, that means overlfow
             {add_out_reg[2*`DWIDTH-1] , add_out_reg[`DWIDTH-2:0]} :
             {add_out_reg[2*`DWIDTH-1] , {(`DWIDTH-1){1'b0}}} //sign bit and then all 0s
        );


always @(posedge clk) begin
  if (reset) begin
    out <= 0;
  end 
  else begin
    out <= add_out;
  end
end

endmodule
module qadd(a,b,c);
input [2*`DWIDTH-1:0] a;
input [2*`DWIDTH-1:0] b;
output [2*`DWIDTH-1:0] c;

assign c = a + b;
//DW01_add #(`DWIDTH) u_add(.A(a), .B(b), .CI(1'b0), .SUM(c), .CO());
endmodule
module qmult(i_multiplicand,i_multiplier,o_result);
input [`DWIDTH-1:0] i_multiplicand;
input [`DWIDTH-1:0] i_multiplier;
output [2*`DWIDTH-1:0] o_result;

assign o_result = i_multiplicand * i_multiplier;
//DW02_mult #(`DWIDTH,`DWIDTH) u_mult(.A(i_multiplicand), .B(i_multiplier), .TC(1'b1), .PRODUCT(o_result));

endmodule
