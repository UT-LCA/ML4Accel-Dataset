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

module output_logic(
clk,
reset,
start_eltwise_op,
done_eltwise_op,
address_mat_c,
c_data_out, 
c_addr,
c_data_available,
out0,
out1,
out2,
out3
);

input clk;
input reset;
input start_eltwise_op;
input done_eltwise_op;
input [`AWIDTH-1:0] address_mat_c;
output [`CU_SIZE*`DWIDTH-1:0] c_data_out;
output [`AWIDTH-1:0] c_addr;
output c_data_available;
input [`DWIDTH-1:0] out0;
input [`DWIDTH-1:0] out1;
input [`DWIDTH-1:0] out2;
input [`DWIDTH-1:0] out3;

reg c_data_available;
reg [`CU_SIZE*`DWIDTH-1:0] c_data_out;

//////////////////////////////////////////////////////////////////////////
// Logic to capture matrix C data from the PEs and send to RAM
//////////////////////////////////////////////////////////////////////////

reg [`AWIDTH-1:0] c_addr;
reg [7:0] cnt;

always @(posedge clk) begin
  if (reset | ~start_eltwise_op) begin
    c_data_available <= 1'b0;
    c_addr <= address_mat_c;
    c_data_out <= 0;
    cnt <= 0;
  end
  else if (cnt>`PE_PIPELINE_DEPTH) begin
    c_data_available <= 1'b1;
    c_addr <= c_addr+1;
    c_data_out <= {out3, out2, out1, out0};
    cnt <= cnt + 1;
  end else begin
    cnt <= cnt + 1;
  end 
end

endmodule
