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

module muxer(from_ram, from_const, const_effective, out);
    input [`WIDTH_D0:0] from_ram, from_const;
    input const_effective;
    output [`WIDTH_D0:0] out;
    
    assign out = const_effective ? from_const : from_ram;
endmodule
