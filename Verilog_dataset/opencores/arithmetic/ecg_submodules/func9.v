`define M     97          // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define W2    (4*`M-1)    // width for a GF(3^{2*M}) element
`define W3    (6*`M-1)    // width for a GF(3^{3*M}) element
`define W6    (12*`M-1)   // width for a GF(3^{6*M}) element
`define PX    196'h4000000000000000000000000000000000000000001000002 // PX is the irreducible polynomial
`define SCALAR_WIDTH (151-1) // the width for the scalar value
`define MOST 2*`M+1:2*`M

module func9(x1, y1, zero1, x2, y2, zero2, x3, y3, zero3);
    input [`WIDTH:0] x1, y1, x2, y2;
    input zero1; // asserted if P1 == 0
    input zero2; // asserted if P2 == 0
    output [`WIDTH:0] x3, y3;
    output zero3; // asserted if P3 == 0
    
    assign zero3 = zero1 & zero2;
    
    genvar i;
    generate
        for (i=0; i<=`WIDTH; i=i+1)
          begin:label
            assign x3[i] = (x2[i] & zero1) | (x1[i] & zero2);
            assign y3[i] = (y2[i] & zero1) | (y1[i] & zero2);
          end
    endgenerate
endmodule
