`define SIMULATION_MEMORY
`define ARRAY_DEPTH 64      //Number of Hidden neurons
`define INPUT_DEPTH 100	    //LSTM input vector dimensions
`define DATA_WIDTH 16		//16 bit representation
`define INWEIGHT_DEPTH 6400 //100x64
`define HWEIGHT_DEPTH 4096  //64x64
`define varraysize 1600   //100x16
`define uarraysize 1024  //64x16

module spram_v(	
input clk,
input [(7-1):0] address_a,
input  wren_a,
input [(`varraysize-1):0] data_a,
output reg [(`varraysize-1):0] out_a
);


`ifdef SIMULATION_MEMORY

reg [`varraysize-1:0] ram[`ARRAY_DEPTH-1:0];

always @ (posedge clk) begin 
  if (wren_a) begin
      ram[address_a] <= data_a;
  end
  else begin
      out_a <= ram[address_a];
  end
end
  

`else

single_port_ram u_single_port_ram(
.addr(address_a),
.we(wren_a),
.data(data_a),
.out(out_a),
.clk(clk)
);

`endif

endmodule
