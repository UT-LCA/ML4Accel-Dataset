`define SIMULATION_MEMORY
`define ARRAY_DEPTH 64      //Number of Hidden neurons
`define INPUT_DEPTH 100	    //LSTM input vector dimensions
`define DATA_WIDTH 16		//16 bit representation
`define INWEIGHT_DEPTH 6400 //100x64
`define HWEIGHT_DEPTH 4096  //64x64
`define varraysize 1600   //100x16
`define uarraysize 1024  //64x16

module qadd2(
 input [15:0] a,
 input [15:0] b,
 output [15:0] c
    );
    
assign c = a + b;


endmodule
