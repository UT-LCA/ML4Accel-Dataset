
module shift_rows
(
	//OUTPUTS
	output [127 : 0] data_out_enc,  // Result after Shift Rows operation - enc
	output [127 : 0] data_out_dec,  // Result after Shift Rows operation - dec
	//INPUTS
	input  [127 : 0] data_in        // Input Bus
);

localparam integer BUS_WIDTH = 128;  // Bus Width
localparam integer ST_WORD   =   8;  // Data Size of word in State MAtrix
localparam integer ST_LINE   =   4;  // Number of Lines of State Matrix
localparam integer ST_COL    =   4;  // Number of Columns of State Matrix

wire [ST_WORD - 1 : 0] state[0 : ST_LINE - 1][0 : ST_COL - 1];
wire [ST_WORD - 1 : 0] state_sft_l[0 : ST_LINE - 1][0 : ST_COL - 1];
wire [ST_WORD - 1 : 0] state_sft_r[0 : ST_LINE - 1][0 : ST_COL - 1];

//=====================================================================================
// State Matrix generation
//=====================================================================================
generate
	genvar l,c;
	for(l = 0; l < ST_LINE; l = l + 1)
	begin:SMG
		for(c = 0; c < ST_COL; c = c + 1)
		begin:BLOCK
			assign state[l][c] = data_in[ST_WORD*((ST_COL - c)*ST_LINE - l) - 1 : ST_WORD*((ST_COL - c)*ST_LINE - l - 1)];
		end
	end
endgenerate

//=====================================================================================
// Shift Row operation
//=====================================================================================
generate
	genvar l1,c1;
	for(l1 = 0; l1 < ST_LINE; l1 = l1 + 1)
	begin:SRO
		for(c1 = 0; c1 < ST_COL; c1 = c1 + 1)
			begin:BLOCK
				assign state_sft_l[l1][c1] = state[l1][(c1 + l1)%ST_COL];
				assign state_sft_r[l1][c1] = state[l1][(c1 + (ST_COL - l1))%ST_COL];
			end
	end
endgenerate

//=====================================================================================
// State Matrix to Bus Output Transformation
//=====================================================================================
generate
	genvar l2,c2;
	for(l2 = 0; l2 < ST_LINE; l2 = l2 + 1)
	begin:SMBOT
		for(c2 = 0; c2 < ST_COL; c2 = c2 + 1)
			begin:BLOCK
				assign data_out_enc[ST_WORD*((ST_COL - c2)*ST_LINE - l2) - 1 : ST_WORD*((ST_COL - c2)*ST_LINE - l2 - 1)] = state_sft_l[l2][c2];
				assign data_out_dec[ST_WORD*((ST_COL - c2)*ST_LINE - l2) - 1 : ST_WORD*((ST_COL - c2)*ST_LINE - l2 - 1)] = state_sft_r[l2][c2];
			end
	end
endgenerate
endmodule
