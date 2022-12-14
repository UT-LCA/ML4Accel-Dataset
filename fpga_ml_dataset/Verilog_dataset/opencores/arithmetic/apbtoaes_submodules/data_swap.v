
module data_swap
#(
	parameter WIDTH = 32
)(
	//OUTPUTS
	output [WIDTH - 1:0] data_swap,
	//INPUTS
	input  [WIDTH - 1:0] data_in,
	input  [ 1:0] swap_type
);

//=====================================================================================
// Swap Types
//=====================================================================================
localparam NO_SWAP        = 2'b00;
localparam HALF_WORD_SWAP = 2'b01;
localparam BYTE_SWAP      = 2'b10;
localparam BIT_SWAP       = 2'b11;

localparam TYPES = 4;

wire [WIDTH - 1 : 0] words[0 : TYPES - 1];

generate
	genvar i, j;
	for(i = 0; i < TYPES; i = i + 1)
	begin:BLOCK
		for(j = 0; j < WIDTH; j = j + 1)
			begin: SUB_BLOCK
				if(i != 3)
					assign words[i][j] = data_in[(WIDTH - (WIDTH/2**i)) - 2*(WIDTH/2**i)*(j/(WIDTH/2**i)) + j];
				else
					assign words[i][j] = data_in[WIDTH - 1 - j];
			end
	end
endgenerate

assign data_swap = words[swap_type];

endmodule
