`define SIMULATION_MEMORY
`define ARRAY_DEPTH 64      //Number of Hidden neurons
`define INPUT_DEPTH 100	    //LSTM input vector dimensions
`define DATA_WIDTH 16		//16 bit representation
`define INWEIGHT_DEPTH 6400 //100x64
`define HWEIGHT_DEPTH 4096  //64x64
`define varraysize 1600   //100x16
`define uarraysize 1024  //64x16

module sigmoid(
input [15:0] x,
output [15:0] sig_out
);

reg [15:0] lut;
reg [5:0] address;

assign sig_out = lut;

always @(address)
begin

       case(address)
       6'd0: lut = 16'b0000000000101101; //sig(-4.5)
       6'd1: lut = 16'b0000000000110110; //sig(-4.3)
       6'd2: lut = 16'b0000000001000010; //sig(-4.1)
       6'd3: lut = 16'b0000000001010001; //sig(-3.9)
       6'd4:  lut = 16'b0000000001100010; //sig(-3.7)
       6'd5 :  lut = 16'b0000000001111000; //sig(-3.5)
       6'd6 :  lut= 16'b0000000010010001; //sig(-3.3)
       6'd7 :  lut= 16'b0000000010110000; //sig(-3.1)
       6'd8:  lut= 16'b0000000011010101; //sig(-2.9)
       6'd9 :  lut= 16'b0000000100000010; //sig(-2.7)
       6'd10 :  lut= 16'b0000000100110110; //sig(-2.5)
       6'd11 :  lut= 16'b0000000101110101; //sig(-2.3)
       6'd12 :  lut= 16'b0000000110111110; //sig(-2.1)
       6'd13 :  lut= 16'b0000001000010100; //sig(-1.9)
       6'd14 :  lut= 16'b0000001001111000; //sig(-1.7)
       6'd15 :  lut= 16'b0000001011101011; //sig(-1.5)
       6'd16 :  lut= 16'b0000001101101101; //sig(-1.3)
       6'd17:  lut= 16'b0000001111111110; //sig(-1.1) 
       6'd18 :  lut= 16'b0000010010100000; //sig(-0.9)
       6'd19 :  lut= 16'b0000010101001111; //sig(-0.7)
       6'd20 :  lut= 16'b0000011000001010; //sig(-0.5)
       6'd21 :  lut= 16'b0000011011001111; //sig(-0.3)
       6'd22 :  lut= 16'b0000011110011001; //sig(-0.1)
       6'd23 :  lut= 16'b0000100001100110; //sig(0.1)
       6'd24 :  lut= 16'b0000100100110000; //sig(0.3)
       6'd25 :  lut= 16'b0000100111110101; //sig(0.5)
       6'd26 :  lut= 16'b0000101010110000; //sig(0.7)
       6'd27 :  lut= 16'b0000101101100000; //sig(0.9)
       6'd28 :  lut= 16'b0000110000000001; //sig(1.1)
       6'd29 :  lut= 16'b0000110010010010; //sig(1.3)
       6'd30 :  lut= 16'b0000110100010100; //sig(1.5)
       6'd31 :  lut= 16'b0000110110000111; //sig(1.7)
       6'd32 :  lut= 16'b0000110111101011; //sig(1.9)
       6'd33 :  lut= 16'b0000111001000001; //sig(2.1)
       6'd34 :  lut= 16'b0000111010001010; //sig(2.3)
       6'd35 :  lut= 16'b0000111011001001; //sig(2.5)
       6'd36 :  lut= 16'b0000111011111110; //sig(2.7)
       6'd37 :  lut= 16'b0000111100101010; //sig(2.9)
       6'd38 :  lut= 16'b0000111101001111; //sig(3.1)
       6'd39 :  lut= 16'b0000111101101110; //sig(3.3)
       6'd40 :  lut= 16'b0000111110000111; //sig(3.5)
       6'd41 :  lut= 16'b0000111110011101; //sig(3.7)
       6'd42 :  lut= 16'b0000111110101110; //sig(3.9)
       6'd43 :  lut= 16'b0000111110111101; //sig(4.1)
       6'd44 :  lut= 16'b0000111111001001; //sig(4.3)
       6'd45 :  lut= 16'b0000111111010011; //sig(4.5) 
       6'd46 :  lut= 16'b0000111111011011; //sig(4.7) 
       6'd47 :  lut= 16'b0000000000100100; //sig(-4.7)
       6'd48:	lut= 16'b0000000000000000; //0  
       6'd49:	lut= 16'b0001000000000000; //1 
       default: lut=0;
	endcase
end


always@(x)
begin
 
    case({x[15:12]})
	4'b1000:address = 6'd48; 
	4'b1001:address = 6'd48; 
	4'b1010:address = 6'd48; 
	4'b1011:address = 6'd48; 
	4'b1100:address = 6'd48;  
        4'b1101:if((x[11:0] >= 12'h000) && (x[11:0] <= 12'h333)) // -3
                    begin
                       address = 6'd8;                 
                    end 
                else if((x[11:0] > 12'h333) && (x[11:0] <= 12'h666))
                    begin
                        address = 6'd9;
                    end
                 else if((x[11:0] > 12'h666) && (x[11:0] <= 12'h99a))
                    begin
                        address = 6'd10;                                        
                    end
                 else if((x[11:0] > 12'h99a) && (x[11:0] <= 12'hccd))
                    begin
                        address =  6'd11;                                                          
                    end
                 else if(x[11:0] > 12'hccd)
                    begin
                        address =  6'd12;                                    
                    end   
        4'b1110:if((x[11:0] >= 12'h000) && (x[11:0] <= 12'h333)) // -2
                    begin
                        address =  6'd13;              
                    end 
                else if((x[11:0] > 12'h333) && (x[11:0] <= 12'h666))
                    begin
                        address =  6'd14;                
                    end
                 else if((x[11:0] > 12'h666) && (x[11:0] <= 12'h99a))
                    begin
                        address = 6'd15;                                                         
                    end
                 else if((x[11:0] > 12'h99a) && (x[11:0] <= 12'hccd))
                    begin
                        address =  6'd16;                                                                           
                    end
                 else if(x[11:0] > 12'hccd)
                    begin
                        address =  6'd17;                                                        
                    end 
        4'b1111:if((x[11:0] >= 12'h000) && (x[11:0] <= 12'h333))  // -1
                    begin
                        address =  6'd18;                
                    end 
                else if((x[11:0] > 12'h333) && (x[11:0] <= 12'h666))
                    begin
                        address =  6'd19;                                    
                    end
                 else if((x[11:0] > 12'h666) && (x[11:0] <= 12'h99a))
                    begin
                        address =  6'd20;                                                                         
                    end
                 else if((x[11:0] > 12'h99a) && (x[11:0] <= 12'hccd))
                    begin
                        address =  6'd21;                                                                                                
                    end
                 else if(x[11:0] > 12'hccd)
                    begin
                        address =  6'd22;                                                                            
                    end 
        4'b0000:if((x[11:0] >= 12'h000) && (x[11:0] <= 12'h333)) // 0
                    begin
                        address =  6'd23;                
                    end 
                else if((x[11:0] > 12'h333) && (x[11:0] <= 12'h666))
                    begin
                        address =  6'd24;                
                    end
                 else if((x[11:0] > 12'h666) && (x[11:0] <= 12'h99a))
                    begin
                        address =  6'd25;                                                        
                    end
                 else if((x[11:0] > 12'h99a) && (x[11:0] <= 12'hccd))
                    begin
                        address =  6'd26;                                                                            
                    end
                 else if(x[11:0] > 12'hccd)
                    begin
                        address =  6'd27;                                                        
                    end 
        4'b0001:if((x[11:0] >= 12'h000) && (x[11:0] <= 12'h333)) // 1
                    begin
                        address =  6'd28;                
                    end 
                else if((x[11:0] > 12'h333) && (x[11:0] <= 12'h666))
                    begin
                        address =  6'd29;                
                    end
                else if((x[11:0] > 12'h666) && (x[11:0] <= 12'h99a))
                    begin
                        address =  6'd30;                                                        
                    end
                else if((x[11:0] > 12'h99a) && (x[11:0] <= 12'hccd))
                    begin
                        address =  6'd31;                                                                            
                    end
                else if(x[11:0] > 12'hccd)
                    begin
                       address =  6'd32;                                                         
                    end 
        4'b0010:if((x[11:0] >= 12'h000) && (x[11:0] <= 12'h333))  // 2
                    begin
                      address =  6'd33;                  
                    end 
                else if((x[11:0] > 12'h333) && (x[11:0] <= 12'h666))
                    begin
                      address =  6'd34;                   
                    end
                 else if((x[11:0] > 12'h666) && (x[11:0] <= 12'h99a))
                    begin
                       address =  6'd35;                                                          
                    end
                 else if((x[11:0] > 12'h99a) && (x[11:0] <= 12'hccd))
                    begin
                       address =  6'd36;                                                                               
                    end
                 else if(x[11:0] > 12'hccd)
                    begin
                       address =  6'd37;                                                          
                    end 
        4'b0011:if((x[11:0] >= 12'h000) && (x[11:0] <= 12'h333)) // 3
                    begin
                       address =  6'd38;                  
                    end 
                else if((x[11:0] > 12'h333) && (x[11:0] <= 12'h666))
                    begin
                      address =  6'd39;                  
                    end
                else if((x[11:0] > 12'h666) && (x[11:0] <= 12'h99a))
                    begin
                      address =  6'd40;                                                          
                    end
                else if((x[11:0] > 12'h99a) && (x[11:0] <= 12'hccd))
                    begin
                      address = 6'd41;                                                                              
                    end
               else if(x[11:0] > 12'hccd)
                    begin
                       address = 6'd42;                                                        
                    end 
	4'b0100:address = 6'd49;  
	4'b0101:address = 6'd49;  
	4'b0110:address = 6'd49;  
	4'b0111:address = 6'd49;  
       /* 4'b0100:if((x[11:0] >= 12'h000) && (x[11:0] <= 12'h333)) //4
                    begin
                      address = lut[43];                 
                    end 
                else if((x[11:0] > 12'h333) && (x[11:0] <= 12'h666))
                    begin
                       address = lut[44];                 
                    end
                else if((x[11:0] > 12'h666) && (x[11:0] <= 12'h99a))
                    begin
                       address = lut[45];                                                   
                    end
                else if(x[11:0] > 12'h99a) 
                    begin
                        address = lut[46];                                                                            
                    end
	4'b0101: address = lut[46];    
	4'b0110: address = lut[46];   
	4'b0111: address = lut[46];  */ 
	/*default:begin
			address = 16'h1000;
		end*/
        endcase

end

endmodule
