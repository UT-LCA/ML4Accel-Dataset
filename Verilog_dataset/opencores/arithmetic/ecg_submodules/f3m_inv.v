`define M     97          // M is the degree of the irreducible polynomial
`define WIDTH (2*`M-1)    // width for a GF(3^M) element
`define W2    (4*`M-1)    // width for a GF(3^{2*M}) element
`define W3    (6*`M-1)    // width for a GF(3^{3*M}) element
`define W6    (12*`M-1)   // width for a GF(3^{6*M}) element
`define PX    196'h4000000000000000000000000000000000000000001000002 // PX is the irreducible polynomial
`define SCALAR_WIDTH (151-1) // the width for the scalar value
`define MOST 2*`M+1:2*`M

module f3m_inv(clk, reset, A, C, done);
    input [`WIDTH:0] A;
    input clk;
    input reset;
    output reg [`WIDTH:0] C;
    output reg done;
    
    reg [`WIDTH+2:0] S, R, U, V, d;
    reg [2*`M:0] i;
    wire [1:0] q;
    wire [`WIDTH+2:0] S1, S2,
                      R1,
                      U1, U2, U3,
                      V1, V2,
                      d1, d2;
    wire don;

    assign d1 = {d[`WIDTH+1:0], 1'b1}; // d1 == d+1
    assign d2 = {1'b0, d[`WIDTH+2:1]}; // d2 == d-1
    assign don = i[0];
    
    f3_mult 
        q1(S[`MOST], R[`MOST], q); // q = s_m / r_m
    func1
        ins1(S, R, q, S1), // S1 = S - q*R
        ins2(V, U, q, V1); // V1 = V - q*U
    func2
        ins3(S1, S2), // S2 = x*S1 = x*(S-q*R)
        ins4(R, R1); // R1 = x*R
    func3
        ins5(U, U1), // U1 = x*U mod p
        ins6(V1, V2); // V2 = x*V1 mod p = x*(V-qU) mod p
    func4
        ins7(U, R[`MOST], U2); // U2 = U/r_m
    func5
        ins8(U, U3); // U3 = (U/x) mod p
    
    always @ (posedge clk)
        if (reset)
            done <= 0;
        else if (don)
          begin
            done <= 1; C <= U2[`WIDTH:0];
          end

    always @ (posedge clk) 
        if (reset)
            i <= {1'b1, {(2*`M){1'b0}}};
        else
            i <= i >> 1;
    
    always @ (posedge clk)
        if (reset) 
          begin
            S<=`PX; R<=A; U<=1; V<=0; d<=0;
          end
        else if (R[`MOST] == 2'b0)
          begin
            R<=R1; U<=U1; d<=d1;
          end
        else if (d[0] == 1'b0) // d == 0
          begin
            R<=S2; S<=R; U<=V2; V<=U; d<=d1;
          end
        else // d != 0
          begin
            S<=S2; V<=V1; U<=U3; d<=d2;
          end
endmodule
module func5(A, C);
    input [`WIDTH+2:0] A;
    output [`WIDTH+2:0] C;
    assign C[195:194] = 0;
    assign C[193:192] = A[1:0];
    assign C[191:24] = A[193:26];
    f3_add a11 (A[25:24], A[1:0], C[23:22]);
    assign C[21:0] = A[23:2];
endmodule
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
module func3(B, C);
    input [`WIDTH+2:0] B;
    output [`WIDTH+2:0] C;
    wire [`WIDTH+2:0] A;
    assign A = {B[`WIDTH:0], 2'd0}; // A == B*x
    wire [1:0] w0;
    f3_mult m0 (A[195:194], 2'd2, w0);
    f3_sub s0 (A[1:0], w0, C[1:0]);
    assign C[23:2] = A[23:2];
    wire [1:0] w12;
    f3_mult m12 (A[195:194], 2'd1, w12);
    f3_sub s12 (A[25:24], w12, C[25:24]);
    assign C[193:26] = A[193:26];
    assign C[195:194] = 0;
endmodule
module func2(A, out);
    input [`WIDTH+2:0] A;
    output [`WIDTH+2:0] out;
    assign out = {A[`WIDTH:0], 2'd0};
endmodule
module func1(S, R, q, out);
    input [`WIDTH+2:0] S, R;
    input [1:0] q;
    output [`WIDTH+2:0] out;
    wire [`WIDTH+2:0] t;
    func4 f(R, q, t); // t == q*R
    genvar i;
    generate for(i=0; i<=`WIDTH+2; i=i+2) begin: label
        f3_sub s1(S[i+1:i], t[i+1:i], out[i+1:i]); // out == S - t
    end endgenerate
endmodule

module f3_add(A, B, C);
    input [1:0] A, B;
    output [1:0] C;
    wire a0, a1, b0, b1, c0, c1;
    assign {a1, a0} = A;
    assign {b1, b0} = B;
    assign C = {c1, c0};
    assign c0 = ( a0 & ~a1 & ~b0 & ~b1) |
                (~a0 & ~a1 &  b0 & ~b1) |
                (~a0 &  a1 & ~b0 &  b1) ;
    assign c1 = (~a0 &  a1 & ~b0 & ~b1) |
                ( a0 & ~a1 &  b0 & ~b1) |
                (~a0 & ~a1 & ~b0 &  b1) ;
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

module f3_sub(A, B, C);
    input [1:0] A, B;
    output [1:0] C;
    f3_add m1(A, {B[0], B[1]}, C);
endmodule






