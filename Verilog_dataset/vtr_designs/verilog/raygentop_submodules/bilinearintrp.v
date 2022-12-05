`define SIMULATION_MEMORY

     module bilinearintrp (u01a, u01b, u01c, v01a, v01b, v01c, u10a, u10b, u10c, v10a, v10b, v10c, selectuv, ru, rv, rw, gu, gv, gw, bu, bv, bw, r, g, b, clk);

        input[7:0] u01a; 
        input[7:0] u01b; 
        input[7:0] u01c; 
        input[7:0] v01a; 
        input[7:0] v01b; 
        input[7:0] v01c; 
        input[7:0] u10a; 
        input[7:0] u10b; 
        input[7:0] u10c; 
        input[7:0] v10a; 
        input[7:0] v10b; 
        input[7:0] v10c; 
        input[2:0] selectuv; 
        input[6:0] ru; 
        input[6:0] rv; 
        input[6:0] rw; 
        input[6:0] gu; 
        input[6:0] gv; 
        input[6:0] gw; 
        input[6:0] bu; 
        input[6:0] bv; 
        input[6:0] bw; 
        output[6:0] r; 
        wire[6:0] r;
        output[6:0] g; 
        wire[6:0] g;
        output[6:0] b; 
        wire[6:0] b;
        input clk; 

        reg[7:0] u; 
        reg[7:0] v; 
        reg[7:0] ul; 
        reg[7:0] vl; 
        reg[7:0] wl; 
        reg[14:0] i1b; 
        reg[14:0] i2b; 
        reg[14:0] i3b; 
        reg[14:0] i1g; 
        reg[14:0] i2g; 
        reg[14:0] i3g; 
        reg[14:0] i1r; 
        reg[14:0] i2r; 
        reg[14:0] i3r; 
        reg[6:0] rul; 
        reg[6:0] rvl; 
        reg[6:0] rwl; 
        reg[6:0] gul; 
        reg[6:0] gvl; 
        reg[6:0] gwl; 
        reg[6:0] bul; 
        reg[6:0] bvl; 
        reg[6:0] bwl; 

        always @(selectuv or u01a or u01b or u01c or v01a or v01b or v01c or u10a or 
                 u10b or u10c or v10a or v10b or v10c)
        begin
           case (selectuv)
              3'b000 :
                       begin
                          u = u01a ; 
                          v = v01a ; 
                       end
              3'b001 :
                       begin
                          u = u01b ; 
						 v = v01b ; 
                       end
              3'b010 :
                       begin
                          u = u01c ; 
                          v = v01c ; 
                       end
              3'b100 :
                       begin
                          u = u10a ; 
                          v = v10a ; 
                       end
              3'b101 :
                       begin
                          u = u10b ; 
                          v = v10b ; 
                       end
              3'b110 :
                       begin
                          u = u10c ; 
                          v = v10c ; 
                       end
              default :
                       begin
                          u = 0;
                          v = 0;
                       end
           endcase 
        end 

        always @(posedge clk)
        begin
           wl <= 8'b11111111 - u - v ; 
           ul <= u ; 
           vl <= v ; 
           rul <= ru ; 
           rvl <= rv ; 
           rwl <= rw ; 
           gul <= gu ; 
           gvl <= gv ; 
           gwl <= gw ; 
           bul <= bu ; 
           bvl <= bv ; 
           bwl <= bw ; 
           i1r <= ul * rul ; 
           i2r <= vl * rvl ; 
           i3r <= wl * rwl ; 
           i1g <= ul * gul ; 
           i2g <= vl * gvl ; 
           i3g <= wl * gwl ; 
           i1b <= ul * bul ; 
           i2b <= vl * bvl ; 
           i3b <= wl * bwl ;  
        end 
        assign r = (i1r + i2r + i3r) ;
        assign g = (i1g + i2g + i3g) ;
        assign b = (i1b + i2b + i3b) ;
     endmodule
