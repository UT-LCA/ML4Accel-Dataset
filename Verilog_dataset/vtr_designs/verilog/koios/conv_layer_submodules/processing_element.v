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
