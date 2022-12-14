`define BITS 32         // Bit width of the operands
`define NumPath 34     

module b_right_shifter_new (
	shift_in,
	shift_value,
	shift_out
);

input [26:0] shift_in;
input [4:0] shift_value;
output [26:0] shift_out;
reg [26:0] shift_out;

always @(shift_value)
begin
	case (shift_value)	
		5'b00000: shift_out = shift_in;
		5'b00001: shift_out = shift_in >> 1;
		5'b00010: shift_out = shift_in >> 2;
		5'b00011: shift_out = shift_in >> 3;
		5'b00100: shift_out = shift_in >> 4;
		5'b00101: shift_out = shift_in >> 5;
		5'b00110: shift_out = shift_in >> 6;
		5'b00111: shift_out = shift_in >> 7;		
		5'b01000: shift_out = shift_in >> 8;
		5'b01001: shift_out = shift_in >> 9;
		5'b01010: shift_out = shift_in >> 10;
		5'b01011: shift_out = shift_in >> 11;
		5'b01100: shift_out = shift_in >> 12;
		5'b01101: shift_out = shift_in >> 13;
		5'b01110: shift_out = shift_in >> 14;
		5'b01111: shift_out = shift_in >> 15;		
		5'b10000: shift_out = shift_in >> 16;
		5'b10001: shift_out = shift_in >> 17;
		5'b10010: shift_out = shift_in >> 18;
		5'b10011: shift_out = shift_in >> 19;
		5'b10100: shift_out = shift_in >> 20;
		5'b10101: shift_out = shift_in >> 21;
		5'b10110: shift_out = shift_in >> 22;
		5'b10111: shift_out = shift_in >> 23;		
		5'b11000: shift_out = shift_in >> 24;
		5'b11001: shift_out = shift_in >> 25;
		5'b11010: shift_out = shift_in >> 26;
		5'b11011: shift_out = shift_in >> 27;
	endcase
end


endmodule 
