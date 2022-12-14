
module  mod3_adder (
    input   [ 1: 0] din_a, din_b,
    output  reg [ 1: 0] dat_o
    );
    
    always@(*)  begin
        case ({din_a, din_b})
            4'b00_00    :   dat_o   = 2'b00;
            4'b00_01    :   dat_o   = 2'b01;
            4'b00_10    :   dat_o   = 2'b10;
            4'b01_00    :   dat_o   = 2'b01;
            4'b01_01    :   dat_o   = 2'b10;
            4'b01_10    :   dat_o   = 2'b00;
            4'b10_00    :   dat_o   = 2'b10;
            4'b10_01    :   dat_o   = 2'b00;
            4'b10_10    :   dat_o   = 2'b01;
            default     :   dat_o   = 2'b00;
        endcase
    end
endmodule
