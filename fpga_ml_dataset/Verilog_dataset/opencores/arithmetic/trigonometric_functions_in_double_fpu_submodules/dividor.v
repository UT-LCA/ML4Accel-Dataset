`define INPUT_WIDTH 32
`define INPUT_WIDTH 32
`define INPUT_WIDTH 32
`define INPUT_WIDTH 32
`define INPUT_WIDTH 32
`define INPUT_WIDTH 32
`define INPUT_WIDTH 32
`define INPUT_WIDTH 32

module dividor (clk, inp, rst, out);
  
  input clk;
  input [`INPUT_WIDTH-1:0] inp;
  input rst;

//////////////inputs/////////////////

  output  reg [`INPUT_WIDTH-1:0] out;

//////////////output/////////////////  
  
 wire [`INPUT_WIDTH-1:0]DIVISOR = `INPUT_WIDTH'd360 ;
 
  
  always @ (posedge clk)

// modulo division 

   if(rst)
     out <= 8'd0 ;
   else 
    out <= inp % DIVISOR ;
    
    

   
     
 endmodule
