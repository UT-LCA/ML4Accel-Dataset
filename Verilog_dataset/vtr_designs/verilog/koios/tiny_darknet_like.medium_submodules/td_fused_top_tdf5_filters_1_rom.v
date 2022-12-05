`define EXPONENT 5
`define MANTISSA 10
`define ACTUAL_MANTISSA 11
`define EXPONENT_LSB 10
`define EXPONENT_MSB 14
`define MANTISSA_LSB 0
`define MANTISSA_MSB 9
`define MANTISSA_MUL_SPLIT_LSB 3
`define MANTISSA_MUL_SPLIT_MSB 9
`define SIGN 1
`define SIGN_LOC 15
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1

  module td_fused_top_tdf5_filters_1_rom (
addr0, ce0, q0, clk);

parameter DWIDTH = 32;
parameter AWIDTH = 12;
parameter MEM_SIZE = 2304;

input[AWIDTH-1:0] addr0;
input ce0;
output reg[DWIDTH-1:0] q0;
input clk;

 reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];

//initial begin
//    $readmemh("./td_fused_top_tdf5_filters_1_rom.dat", ram);
//end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[addr0];
    end
end



endmodule
