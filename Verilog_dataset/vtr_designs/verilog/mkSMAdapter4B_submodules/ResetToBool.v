`define  n 32
`define max_size 30
`define SIMULATION_MEMORY
//`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset
 `define dwa  60
`define awa  6
//`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset
 `define dwb  32
`define awb  2
//`define SC_FIFO_ASYNC_RESET				// Uncomment for Syncr. reset
//`define SC_FIFO_ASYNC_RESET	or negedge rst		// Uncomment for Async. reset
 `define dwc  61
`define awc 3

module ResetToBool (RST, VAL);

input RST;
output VAL;
reg VAL;

always @ (RST or VAL)
begin

if (RST == 1)
VAL=1'b0;

end
endmodule
