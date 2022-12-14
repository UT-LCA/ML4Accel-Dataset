
module mix_columns
(
	// OUTPUTS
	output [31:0] mix_out_enc,
	output [31:0] mix_out_dec,
	// INPUTS
	input  [31:0] mix_in
);

localparam integer SIZE      = 32;
localparam integer WORD_SIZE = 8;
localparam integer NUM_WORDS = 4;

wire [WORD_SIZE - 1 : 0] col  [0 : NUM_WORDS - 1];
wire [WORD_SIZE - 1 : 0] sum_p[0 : NUM_WORDS - 1];
wire [WORD_SIZE - 1 : 0] y    [0 : NUM_WORDS - 2];

//=====================================================================================
// Multiplication by 02 in GF(2^8) 
//=====================================================================================
function [7:0] aes_mult_02;
  input [7:0] data_in;
  begin
    aes_mult_02 = (data_in << 1) ^ {8{data_in[7]}} & 8'h1b;
  end
endfunction

//=====================================================================================
// Multiplication by 04 in GF(2^8)
//=====================================================================================
function [7:0] aes_mult_04;
  input [7:0] data_in;
  begin
    aes_mult_04 = ((data_in << 2) ^ {8{data_in[6]}} & 8'h1b) ^ {8{data_in[7]}} & 8'h36;
  end
endfunction

//=====================================================================================
// Word to Byte transformation
//=====================================================================================
generate
	genvar i;
	for(i = 0 ; i < NUM_WORDS; i = i + 1)
	begin:WBT
		assign col[i] = mix_in[WORD_SIZE*(i + 1) - 1: WORD_SIZE*i];
	end
endgenerate

//=====================================================================================
// Direct Mix Column Operation
//=====================================================================================
generate
	genvar j;
	for(j = 0; j < NUM_WORDS; j = j + 1)
		begin:DMCO
			assign sum_p[j] = col[(j + 1)%NUM_WORDS] ^ col[(j + 2)%NUM_WORDS] ^ col[(j + 3)%NUM_WORDS];
			assign mix_out_enc[ WORD_SIZE*(j + 1) - 1 : WORD_SIZE*j] = aes_mult_02(col[j] ^ col[(j + NUM_WORDS - 1)%NUM_WORDS]) ^ sum_p[j];
		end
endgenerate

//=====================================================================================
// Inverse Mix Column Operation
//=====================================================================================
assign y[0] = aes_mult_04(col[2] ^ col[0]); 
assign y[1] = aes_mult_04(col[3] ^ col[1]);
assign y[2] = aes_mult_02(  y[1] ^   y[0]);  
assign mix_out_dec = mix_out_enc ^ {2{y[2] ^ y[1], y[2] ^ y[0]}};

endmodule
