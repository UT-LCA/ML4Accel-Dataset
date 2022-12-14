`define BITS 32         // Bit width of the operands
`define NumPath 34     

module b_left_shifter (
	shift_in,
	shift_value,
	shift_out
);

input [47:0] shift_in;
input [5:0] shift_value;
output [47:0] shift_out;
reg [47:0] shift_out;

always @(shift_value)
begin
	case (shift_value)	
		6'b000000: shift_out = shift_in;
		6'b000001: shift_out = shift_in << 1;
		6'b000010: shift_out = shift_in << 2;
		6'b000011: shift_out = shift_in << 3;
		6'b000100: shift_out = shift_in << 4;
		6'b000101: shift_out = shift_in << 5;
		6'b000110: shift_out = shift_in << 6;
		6'b000111: shift_out = shift_in << 7;		
		6'b001000: shift_out = shift_in << 8;
		6'b001001: shift_out = shift_in << 9;
		6'b001010: shift_out = shift_in << 10;
		6'b001011: shift_out = shift_in << 11;
		6'b001100: shift_out = shift_in << 12;
		6'b001101: shift_out = shift_in << 13;
		6'b001110: shift_out = shift_in << 14;
		6'b001111: shift_out = shift_in << 15;		
		6'b010000: shift_out = shift_in << 16;
		6'b010001: shift_out = shift_in << 17;
		6'b010010: shift_out = shift_in << 18;
		6'b010011: shift_out = shift_in << 19;
		6'b010100: shift_out = shift_in << 20;
		6'b010101: shift_out = shift_in << 21;
		6'b010110: shift_out = shift_in << 22;
		6'b010111: shift_out = shift_in << 23;		
		6'b011000: shift_out = shift_in << 24;
		6'b011001: shift_out = shift_in << 25;
		6'b011010: shift_out = shift_in << 26;
		6'b011011: shift_out = shift_in << 27;
		6'b011100: shift_out = shift_in << 28;
		6'b011101: shift_out = shift_in << 29;
		6'b011110: shift_out = shift_in << 30;
		6'b011111: shift_out = shift_in << 31;		
		6'b100000: shift_out = shift_in << 32;
		6'b100001: shift_out = shift_in << 33;
		6'b100010: shift_out = shift_in << 34;
		6'b100011: shift_out = shift_in << 35;
		6'b100100: shift_out = shift_in << 36;
		6'b100101: shift_out = shift_in << 37;
		6'b100110: shift_out = shift_in << 38;
		6'b100111: shift_out = shift_in << 39;		
		6'b101000: shift_out = shift_in << 40;
		6'b101001: shift_out = shift_in << 41;
		6'b101010: shift_out = shift_in << 42;
		6'b101011: shift_out = shift_in << 43;
		6'b101100: shift_out = shift_in << 44;
		6'b101101: shift_out = shift_in << 45;
		6'b101110: shift_out = shift_in << 46;
		6'b101111: shift_out = shift_in << 47;	
		6'b110000: shift_out = shift_in << 48;
		
	endcase
end

endmodule 
