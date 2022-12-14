`define M     593         // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define WIDTH_D0 1187
`define M     593         // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define WIDTH_D0 1187
`define M     593         // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define WIDTH_D0 1187
`define M     593         // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define WIDTH_D0 1187
`define M     593         // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define WIDTH_D0 1187

module const_ (clk, addr, out, effective);
    input clk;
    input [5:0] addr;
    output reg [`WIDTH_D0:0] out;
    output reg effective; // active high if out is effective
    
    always @ (posedge clk)
      begin
         effective <= 1;
         case (addr)
            1:  out <= 0;
            2:  out <= 1;
            4:  out <= {6'b000101, 1182'd0};
            8:  out <= {6'b001001, 1182'd0};
            16: out <= {6'b010101, 1182'd0};
            default: 
               begin out <= 0; effective <= 0; end
         endcase
      end
endmodule
