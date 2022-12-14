
module  type_conv (
    input   plus_one,
            minus_one,
    output  reg [ 1: 0] dat_o
    );
    
    always@(*)  begin
        case ({plus_one, minus_one})
            2'b00   :   dat_o   = 2'b00;
            2'b01   :   dat_o   = 2'b10;
            2'b10   :   dat_o   = 2'b01;
            2'b11   :   dat_o   = 2'b00;
            default :   dat_o   = 2'b00;
        endcase
    end
    
endmodule
