`define BFLOAT16 
`define VCS
`define EXPONENT 8
`define MANTISSA 7
`define EXPONENT 5
`define MANTISSA 10
`define SIGN 1
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define AWIDTH 10
`define MEM_SIZE 1024
`define DESIGN_SIZE 12
`define CU_SIZE 4
`define MASK_WIDTH 4
`define MEM_ACCESS_LATENCY 1
`define REG_DATAWIDTH 32
`define REG_ADDRWIDTH 8
`define ITERATIONS_WIDTH 32
`define REG_STDN_ADDR 32'h4
`define REG_MATRIX_A_ADDR 32'he
`define REG_MATRIX_B_ADDR 32'h12
`define REG_MATRIX_C_ADDR 32'h16
`define REG_VALID_MASK_A_ADDR 32'h20
`define REG_VALID_MASK_B_ADDR 32'h5c
`define REG_ITERATIONS_ADDR 32'h40
`define PE_PIPELINE_DEPTH 5
`define IDLE     2'b00
`define W_ENABLE  2'b01
`define R_ENABLE  2'b10

module input_logic(
clk,
reset,
start_eltwise_op,
count,
a_addr,
b_addr,
address_mat_a,
address_mat_b,
a_data,
b_data,
a0_data,
a1_data,
a2_data,
a3_data,
b0_data,
b1_data,
b2_data,
b3_data,
validity_mask_a,
validity_mask_b
);

input clk;
input reset;
input start_eltwise_op;
input [`ITERATIONS_WIDTH-1:0] count;
output [`AWIDTH-1:0] a_addr;
output [`AWIDTH-1:0] b_addr;
input [`AWIDTH-1:0] address_mat_a;
input [`AWIDTH-1:0] address_mat_b;
input [`CU_SIZE*`DWIDTH-1:0] a_data;
input [`CU_SIZE*`DWIDTH-1:0] b_data;
output [`DWIDTH-1:0] a0_data;
output [`DWIDTH-1:0] a1_data;
output [`DWIDTH-1:0] a2_data;
output [`DWIDTH-1:0] a3_data;
output [`DWIDTH-1:0] b0_data;
output [`DWIDTH-1:0] b1_data;
output [`DWIDTH-1:0] b2_data;
output [`DWIDTH-1:0] b3_data;
input [`MASK_WIDTH-1:0] validity_mask_a;
input [`MASK_WIDTH-1:0] validity_mask_b;

reg [7:0] iterations;

wire [`DWIDTH-1:0] a0_data;
wire [`DWIDTH-1:0] a1_data;
wire [`DWIDTH-1:0] a2_data;
wire [`DWIDTH-1:0] a3_data;
wire [`DWIDTH-1:0] b0_data;
wire [`DWIDTH-1:0] b1_data;
wire [`DWIDTH-1:0] b2_data;
wire [`DWIDTH-1:0] b3_data;

//////////////////////////////////////////////////////////////////////////
// Logic to generate addresses to BRAM A
//////////////////////////////////////////////////////////////////////////
reg [`AWIDTH-1:0] a_addr;
reg a_mem_access; //flag that tells whether the compute unit is trying to access memory or not

always @(posedge clk) begin
  //else if (clk_cnt >= a_loc*`CU_SIZE+final_mat_mul_size) begin
  //Writing the line above to avoid multiplication:
  if (reset || ~start_eltwise_op) begin
    a_addr <= address_mat_a;
    a_mem_access <= 0;
    iterations <= 0;
  end

  //else if ((clk_cnt >= a_loc*`CU_SIZE) && (clk_cnt < a_loc*`CU_SIZE+final_mat_mul_size)) begin
  //Writing the line above to avoid multiplication:
  else if (iterations <= count) begin
    a_addr <= a_addr + 1;
    a_mem_access <= 1;
    iterations <= iterations + 1;
  end
end  

//////////////////////////////////////////////////////////////////////////
// Logic to generate valid signals for data coming from BRAM A
//////////////////////////////////////////////////////////////////////////
reg [7:0] a_mem_access_counter;
always @(posedge clk) begin
  if (reset || ~start_eltwise_op) begin
    a_mem_access_counter <= 0;
  end
  else if (a_mem_access == 1) begin
    a_mem_access_counter <= a_mem_access_counter + 1;  

  end
  else begin
    a_mem_access_counter <= 0;
  end
end

wire bram_rdata_a_valid; //flag that tells whether the data from memory is valid
assign bram_rdata_a_valid = 
       ((validity_mask_a[0]==1'b0 && a_mem_access_counter==1) ||
        (validity_mask_a[1]==1'b0 && a_mem_access_counter==2) ||
        (validity_mask_a[2]==1'b0 && a_mem_access_counter==3) ||
        (validity_mask_a[3]==1'b0 && a_mem_access_counter==4)) ?
        1'b0 : (a_mem_access_counter >= `MEM_ACCESS_LATENCY);

//////////////////////////////////////////////////////////////////////////
// Logic to delay certain parts of the data received from BRAM A (systolic data setup)
//////////////////////////////////////////////////////////////////////////
//Slice data into chunks and qualify it with whether it is valid or not
assign a0_data = a_data[1*`DWIDTH-1:0*`DWIDTH] & {`DWIDTH{bram_rdata_a_valid}} & {`DWIDTH{validity_mask_a[0]}};
assign a1_data = a_data[2*`DWIDTH-1:1*`DWIDTH] & {`DWIDTH{bram_rdata_a_valid}} & {`DWIDTH{validity_mask_a[1]}};
assign a2_data = a_data[3*`DWIDTH-1:2*`DWIDTH] & {`DWIDTH{bram_rdata_a_valid}} & {`DWIDTH{validity_mask_a[2]}};
assign a3_data = a_data[4*`DWIDTH-1:3*`DWIDTH] & {`DWIDTH{bram_rdata_a_valid}} & {`DWIDTH{validity_mask_a[3]}};


//////////////////////////////////////////////////////////////////////////
// Logic to generate addresses to BRAM B
//////////////////////////////////////////////////////////////////////////
reg [`AWIDTH-1:0] b_addr;
reg b_mem_access; //flag that tells whether the compute unit is trying to access memory or not

always @(posedge clk) begin
  //else if (clk_cnt >= b_loc*`CU_SIZE+final_mat_mul_size) begin
  //Writing the line above to avoid multiplication:
  if (reset || ~start_eltwise_op) begin
    b_addr <= address_mat_b ;
    b_mem_access <= 0;
  end
  //else if ((clk_cnt >= b_loc*`CU_SIZE) && (clk_cnt < b_loc*`CU_SIZE+final_mat_mul_size)) begin
  //Writing the line above to avoid multiplication:
  else if (iterations <= count) begin
    b_addr <= b_addr + 1;
    b_mem_access <= 1;
  end
end  

//////////////////////////////////////////////////////////////////////////
// Logic to generate valid signals for data coming from BRAM B
//////////////////////////////////////////////////////////////////////////
reg [7:0] b_mem_access_counter;
always @(posedge clk) begin
  if (reset || ~start_eltwise_op) begin
    b_mem_access_counter <= 0;
  end
  else if (b_mem_access == 1) begin
    b_mem_access_counter <= b_mem_access_counter + 1;  
  end
  else begin
    b_mem_access_counter <= 0;
  end
end

wire bram_rdata_b_valid; //flag that tells whether the data from memory is valid
assign bram_rdata_b_valid = 
       ((validity_mask_b[0]==1'b0 && b_mem_access_counter==1) ||
        (validity_mask_b[1]==1'b0 && b_mem_access_counter==2) ||
        (validity_mask_b[2]==1'b0 && b_mem_access_counter==3) ||
        (validity_mask_b[3]==1'b0 && b_mem_access_counter==4)) ?
        1'b0 : (b_mem_access_counter >= `MEM_ACCESS_LATENCY);

//Slice data into chunks and qualify it with whether it is valid or not
assign b0_data = b_data[1*`DWIDTH-1:0*`DWIDTH] & {`DWIDTH{bram_rdata_b_valid}} & {`DWIDTH{validity_mask_b[0]}};
assign b1_data = b_data[2*`DWIDTH-1:1*`DWIDTH] & {`DWIDTH{bram_rdata_b_valid}} & {`DWIDTH{validity_mask_b[1]}};
assign b2_data = b_data[3*`DWIDTH-1:2*`DWIDTH] & {`DWIDTH{bram_rdata_b_valid}} & {`DWIDTH{validity_mask_b[2]}};
assign b3_data = b_data[4*`DWIDTH-1:3*`DWIDTH] & {`DWIDTH{bram_rdata_b_valid}} & {`DWIDTH{validity_mask_b[3]}};


endmodule
