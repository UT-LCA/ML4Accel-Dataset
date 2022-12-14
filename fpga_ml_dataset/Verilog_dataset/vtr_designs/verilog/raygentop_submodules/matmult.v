`define SIMULATION_MEMORY

module matmult (Ax, Ay, Az, m11, m12, m13, m21, m22, m23, m31, m32, m33, Cx, Cy, Cz, clk);

    input[16 - 1:0] Ax; 
    input[16 - 1:0] Ay; 
    input[16 - 1:0] Az; 
    input[16 - 1:0] m11; 
    input[16 - 1:0] m12; 

    input[16 - 1:0] m13; 
    input[16 - 1:0] m21; 
    input[16 - 1:0] m22; 
    input[16 - 1:0] m23; 
    input[16 - 1:0] m31; 
    input[16 - 1:0] m32; 
    input[16 - 1:0] m33; 
    output[16 - 1:0] Cx; 
    reg[16 - 1:0] Cx;
    output[16 - 1:0] Cy; 
    reg[16 - 1:0] Cy;
    output[16 - 1:0] Cz; 

    reg[16 - 1:0] Cz;
    input clk; 

    reg[16 + 16 - 1:0] am11; 
    reg[16 + 16 - 1:0] am12; 
    reg[16 + 16 - 1:0] am13; 
    reg[16 + 16 - 1:0] am21; 
    reg[16 + 16 - 1:0] am22; 
    reg[16 + 16 - 1:0] am23; 
    reg[16 + 16 - 1:0] am31; 
    reg[16 + 16 - 1:0] am32; 
    reg[16 + 16 - 1:0] am33; 


    always @(posedge clk)
    begin
       am11 <= Ax * m11 ; 
       am12 <= Ay * m12 ; 
       am13 <= Az * m13 ; 
       am21 <= Ax * m21 ; 
       am22 <= Ay * m22 ; 
       am23 <= Az * m23 ; 
       am31 <= Ax * m31 ; 
       am32 <= Ay * m32 ; 
       am33 <= Az * m33 ; 

       //      Cx <= (am11 + am12 + am13) (`widthA+`widthB-2 downto `widthB-1);
       //      Cy <= (am21 + am22 + am23) (`widthA+`widthB-2 downto `widthB-1);
       //      Cz <= (am31 + am32 + am33) (`widthA+`widthB-2 downto `widthB-1);
       Cx <= (am11[16+16-2:16-1] + am12[16+16-2:16-1] + am13[16+16-2:16-1]) ; 
       Cy <= (am21[16+16-2:16-1] + am22[16+16-2:16-1] + am23[16+16-2:16-1]); 
       Cz <= (am31[16+16-2:16-1] + am32[16+16-2:16-1] + am33[16+16-2:16-1]) ;  
    end 
 endmodule
