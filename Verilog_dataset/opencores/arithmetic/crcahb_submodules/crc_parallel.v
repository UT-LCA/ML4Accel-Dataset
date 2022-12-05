`define size ((DATA_SIZE/4) * (2 ** (type - 1)))

module crc_parallel
#(
	parameter CRC_SIZE      = 8,         // Define the size of CRC Code
	parameter FRAME_SIZE    = 8          // Number of bits in the data block
)(
	//OUTPUTS
	output [CRC_SIZE   - 1 : 0] crc_out,
	//INPUTS
	input  [FRAME_SIZE - 1 : 0] data_in,
	input  [CRC_SIZE   - 1 : 0] crc_init,
	input  [CRC_SIZE   - 1 : 0] crc_poly,
	input  [CRC_SIZE   - 1 : 0] crc_poly_size
);
localparam ENABLE  = {CRC_SIZE{1'b1}};
localparam DISABLE = {CRC_SIZE{1'b0}};

wire [CRC_SIZE - 1 : 0] crc_comb_out[0 : FRAME_SIZE];
wire [CRC_SIZE - 1 : 0] poly_sel    [1 : CRC_SIZE - 1];
wire [CRC_SIZE - 1 : 0] sel_out     [0 : CRC_SIZE - 1];
wire [CRC_SIZE - 1 : 0] crc_init_sel[0 : CRC_SIZE - 1];
wire [CRC_SIZE - 1 : 0] poly_mux;
wire [CRC_SIZE - 1 : 0] crc_poly_size_reversed;
wire [CRC_SIZE - 1 : 0] crc_init_justified;

assign poly_mux[0] = crc_poly[0];
generate
  genvar k;
	for(k = 1; k < CRC_SIZE; k = k + 1)
		begin
			assign poly_sel[CRC_SIZE - k] = crc_poly_size >> (k - 1);
			assign poly_mux[k] = |(crc_poly & poly_sel[k]);
		end
endgenerate

generate
	genvar l;
	for(l = 0; l < CRC_SIZE; l = l + 1)
		begin
			assign crc_poly_size_reversed[l] = crc_poly_size[CRC_SIZE - 1 - l];
			assign sel_out[l] = crc_poly_size_reversed << l;
			assign crc_out[l] = |(sel_out[l] & crc_comb_out[FRAME_SIZE]);
		end
endgenerate

generate
	genvar m;
	for(m = CRC_SIZE - 1; m >= 0; m = m - 1)
		begin
			assign crc_init_sel[m] = crc_poly_size >> (CRC_SIZE - 1 - m);
			assign crc_init_justified[m] = |(crc_init & crc_init_sel[m]);
		end
endgenerate

assign crc_comb_out[0] = crc_init_justified;

generate
	genvar i;
	for(i = 0; i < FRAME_SIZE; i = i + 1)
		begin
			crc_comb 
			#(
				.CRC_SIZE      ( CRC_SIZE      ),
				.MASK          ( ENABLE        )
			) CRC_COMB
			(
				.crc_out       ( crc_comb_out[i + 1]           ),
				.data_in       ( data_in[FRAME_SIZE - 1 - i]   ),
				.crc_in        ( crc_comb_out[i]               ),
				.crc_poly      ( poly_mux                      ),
				.crc_poly_size ( crc_poly_size[CRC_SIZE - 2:0] )
			);
		end
endgenerate

endmodule
module crc_comb
#(
	parameter CRC_SIZE      = 8,         // Define the size of CRC Code
 	parameter MASK          = 8'hff      // This mask define the level of configurability of the module
)(
	//OUTPUTS
	output [CRC_SIZE - 1 : 0] crc_out,   // CRC code after one round of calculation
	//INPUTS
	input                    data_in,    // One bit of data block
	input [CRC_SIZE - 1 : 0] crc_in,     // In cascated mode, this input is the previous calculated CRC code
	input [CRC_SIZE - 1 : 0] crc_poly,   // Generator Polynomial
  input [CRC_SIZE - 2 : 0] crc_poly_size
);

wire [CRC_SIZE - 2 : 0] MASK_REVERSED;
wire [CRC_SIZE - 1 : 0] feedback;
wire [CRC_SIZE - 2 : 0] crc_in_masked;
wire [CRC_SIZE - 2 : 0] crc_poly_size_reversed;

generate
  genvar i;
  for(i = 0; i < CRC_SIZE - 1; i = i + 1)
    begin
			assign crc_poly_size_reversed[i] = crc_poly_size[CRC_SIZE - 2 - i];
   		assign MASK_REVERSED[i] = MASK[CRC_SIZE - 2 - i]; 
		end
endgenerate

assign feedback = crc_poly & {CRC_SIZE{crc_in[CRC_SIZE - 1] ^ data_in}};
assign crc_in_masked = crc_in[CRC_SIZE - 2 : 0] & (~(crc_poly_size_reversed[CRC_SIZE - 2 : 0] & MASK_REVERSED)); 
assign crc_out = {crc_in_masked ^ feedback[CRC_SIZE - 1 : 1], feedback[0]}; 

endmodule
