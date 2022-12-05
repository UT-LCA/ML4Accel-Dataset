`define M     97          // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define W2    (4*`M-1)    // width for a GF(3^{2*M}) element
`define W3    (6*`M-1)    // width for a GF(3^{3*M}) element
`define W6    (12*`M-1)   // width for a GF(3^{6*M}) element
`define PX    196'h4000000000000000000000000000000000000000001000002 // PX is the irreducible polynomial
`define SCALAR_WIDTH (151-1) // the width for the scalar value
`define MOST 2*`M+1:2*`M

module func4(A, aa, C);
    input [`WIDTH+2:0] A;
    input [1:0] aa;
    output [`WIDTH+2:0] C;
    genvar i;
    generate
      for(i=0; i<=`WIDTH+2; i=i+2) 
      begin: label
        f3_mult m(A[i+1:i], aa, C[i+1:i]);
      end 
    endgenerate
endmodule

module f3_mult(A, B, C); 
    input [1:0] A;
    input [1:0] B; 
    output [1:0] C;
    wire a0, a1, b0, b1;
    assign {a1, a0} = A;
    assign {b1, b0} = B;
    assign C[0] = (~a1 & a0 & ~b1 & b0) | (a1 & ~a0 & b1 & ~b0);
    assign C[1] = (~a1 & a0 & b1 & ~b0) | (a1 & ~a0 & ~b1 & b0);
endmodule


