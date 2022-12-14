`define SIMULATION_MEMORY

 module col16to21 (dataline, texelselect, r, g, b);

    input[63:0] dataline; 
    input[1:0] texelselect; 
    output[6:0] r; 
    wire[6:0] r;
    output[6:0] g; 
    wire[6:0] g;
    output[6:0] b; 
    wire[6:0] b;

    reg[15:0] col16; 

    always @(dataline or texelselect)
    begin
       case (texelselect)
          2'b00 :
                   begin
                      col16 = dataline[15:0] ; 
                   end
          2'b01 :
                   begin
                      col16 = dataline[31:16] ; 
                   end
          2'b10 :
                   begin
                      col16 = dataline[47:32] ; 
                   end
          2'b11 :
                   begin
                      col16 = dataline[63:48] ; 
                   end
       endcase 
    end 
    assign r = {col16[15:10], 1'b0} ;
    assign g = {col16[9:5], 2'b00} ;
    assign b = {col16[4:0], 2'b00} ;
 endmodule
