`define BITS 32         // Bit width of the operands
`define NumPath 34     

module pri_encoder ( fract_in, fi_ldz );

input [47:0] fract_in;
output [5:0] fi_ldz;
reg [5:0] fi_ldz_r0;

assign fi_ldz = fi_ldz_r0;

always @(fract_in)
begin
	if (fract_in[47:47] == 1'b1) 
		 fi_ldz_r0 = 6'd1;
	else if (fract_in[47:46] == 2'b01) 
		 fi_ldz_r0 = 6'd2;
	else if (fract_in[47:45] == 3'b001) 
		 fi_ldz_r0 = 6'd3;
	else if (fract_in[47:44] == 4'b0001) 
		 fi_ldz_r0 = 6'd4;
	else if (fract_in[47:43] == 5'b00001) 
		 fi_ldz_r0 = 6'd5;
	else if (fract_in[47:42] == 6'b000001) 
		 fi_ldz_r0 = 6'd6;
	else if (fract_in[47:41] == 7'b0000001) 
		 fi_ldz_r0 = 6'd7;
	else if (fract_in[47:40] == 8'b00000001) 
		 fi_ldz_r0 = 6'd8;
	else if (fract_in[47:39] == 9'b000000001) 
		 fi_ldz_r0 = 6'd9;
	else if (fract_in[47:38] == 10'b0000000001) 
		 fi_ldz_r0 = 6'd10;
	else if (fract_in[47:37] == 11'b00000000001) 
		 fi_ldz_r0 = 6'd11;
	else if (fract_in[47:36] == 12'b000000000001) 
		 fi_ldz_r0 = 6'd12;
	else if (fract_in[47:35] == 13'b0000000000001) 
		 fi_ldz_r0 = 6'd13;
	else if (fract_in[47:34] == 14'b00000000000001) 
		 fi_ldz_r0 = 6'd14;
	else if (fract_in[47:33] == 15'b000000000000001) 
		 fi_ldz_r0 = 6'd15;
	else if (fract_in[47:32] == 16'b0000000000000001) 
		 fi_ldz_r0 = 6'd16;
	else if (fract_in[47:31] == 17'b00000000000000001) 
		 fi_ldz_r0 = 6'd17;
	else if (fract_in[47:30] == 18'b000000000000000001) 
		 fi_ldz_r0 = 6'd18;
	else if (fract_in[47:29] == 19'b0000000000000000001) 
		 fi_ldz_r0 = 6'd19;
	else if (fract_in[47:28] == 20'b00000000000000000001) 
		 fi_ldz_r0 = 6'd20;
	else if (fract_in[47:27] == 21'b000000000000000000001) 
		 fi_ldz_r0 = 6'd21;
	else if (fract_in[47:26] == 22'b0000000000000000000001) 
		 fi_ldz_r0 = 6'd22;
	else if (fract_in[47:25] == 23'b00000000000000000000001) 
		 fi_ldz_r0 = 6'd23;
	else if (fract_in[47:24] == 24'b000000000000000000000001) 
		 fi_ldz_r0 = 6'd24;
	else if (fract_in[47:23] == 25'b0000000000000000000000001) 
		 fi_ldz_r0 = 6'd25;
	else if (fract_in[47:22] == 26'b00000000000000000000000001) 
		 fi_ldz_r0 = 6'd26;
	else if (fract_in[47:21] == 27'b000000000000000000000000001) 
		 fi_ldz_r0 = 6'd27;
	else if (fract_in[47:20] == 28'b0000000000000000000000000001) 
		 fi_ldz_r0 = 6'd28;
	else if (fract_in[47:19] == 29'b00000000000000000000000000001) 
		 fi_ldz_r0 = 6'd29;
	else if (fract_in[47:18] == 30'b000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd30;
	else if (fract_in[47:17] == 31'b0000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd31;
	else if (fract_in[47:16] == 32'b00000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd32;
	else if (fract_in[47:15] == 33'b000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd33;
	else if (fract_in[47:14] == 34'b0000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd34;
	else if (fract_in[47:13] == 35'b00000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd35;
	else if (fract_in[47:12] == 36'b000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd36;
	else if (fract_in[47:11] == 37'b0000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd37;
	else if (fract_in[47:10] == 38'b00000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd38;
	else if (fract_in[47:9]  == 39'b000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd39;
	else if (fract_in[47:8]  == 40'b0000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd40;
	else if (fract_in[47:7]  == 41'b00000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd41;
	else if (fract_in[47:6]  == 42'b000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd42;
	else if (fract_in[47:5]  == 43'b0000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd43;
	else if (fract_in[47:4]  == 44'b00000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd44;
	else if (fract_in[47:3]  == 45'b000000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd45;
	else if (fract_in[47:2]  == 46'b0000000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd46;
	else if (fract_in[47:1]  == 47'b00000000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd47;
	else if (fract_in[47:0]  == 48'b000000000000000000000000000000000000000000000001) 
		 fi_ldz_r0 = 6'd48;
	else if (fract_in[47:0]  == 48'b000000000000000000000000000000000000000000000000) 
		 fi_ldz_r0 = 6'd48;
end

endmodule
