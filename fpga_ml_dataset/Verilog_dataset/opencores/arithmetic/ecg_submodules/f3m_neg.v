`define M     97          // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define W2    (4*`M-1)    // width for a GF(3^{2*M}) element
`define W3    (6*`M-1)    // width for a GF(3^{3*M}) element
`define W6    (12*`M-1)   // width for a GF(3^{6*M}) element
`define PX    196'h4000000000000000000000000000000000000000001000002 // PX is the irreducible polynomial
`define SCALAR_WIDTH (151-1) // the width for the scalar value
`define MOST 2*`M+1:2*`M

module f3m_neg(a, c);
    input [`WIDTH:0] a;
    output [`WIDTH:0] c;
    genvar i;
    generate
        for(i=0;i<=`WIDTH;i=i+2)
          begin:label
            assign c[i+1:i] = {a[i],a[i+1]};
          end
    endgenerate
endmodule
