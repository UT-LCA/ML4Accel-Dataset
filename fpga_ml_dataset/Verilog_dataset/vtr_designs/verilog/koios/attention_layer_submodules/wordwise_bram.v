`define SIMULATION_MEMORY
//`define SIMULATION_addfp
`define VECTOR_DEPTH 64 //Q,K,V vector size
`define DATA_WIDTH 16
`define VECTOR_BITS 1024 // 16 bit each (16x64)
`define NUM_WORDS 32   //num of words in the sentence
`define BUF_AWIDTH 4 //16 entries in each buffer ram
`define BUF_LOC_SIZE 4 //4 words in each addr location
`define OUT_RAM_DEPTH 512 //512 entries in output bram
`define EXPONENT 8
`define MANTISSA 7
`define EXPONENT 5
`define MANTISSA 10
`define SIGN 1
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define DEFINES_DONE
`define DATAWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1
`define NUM 4
`define ADDRSIZE 4

module wordwise_bram (
        addr0, 
        d0, 
        we0, 
        q0,  
        addr1,
        d1,
        we1,
        q1,
        clk);

input [`BUF_AWIDTH-1:0] addr0;
input [`BUF_AWIDTH-1:0] addr1;
input [`BUF_LOC_SIZE*`DATA_WIDTH-1:0] d0;
input [`BUF_LOC_SIZE*`DATA_WIDTH-1:0] d1;
input [`BUF_LOC_SIZE-1:0] we0;
input [`BUF_LOC_SIZE-1:0] we1;
output reg [`BUF_LOC_SIZE*`DATA_WIDTH-1:0] q0;
output reg [`BUF_LOC_SIZE*`DATA_WIDTH-1:0] q1;
input clk;

`ifdef SIMULATION_MEMORY

reg [`BUF_LOC_SIZE*`DATA_WIDTH-1:0] ram[((1<<`BUF_AWIDTH)-1):0];
reg [3:0] i;

always @(posedge clk)  
begin 
    if(we0 == 0) begin   //read
	 for (i = 0; i < `BUF_LOC_SIZE; i=i+1) begin
        	q0[i*`DATA_WIDTH +: `DATA_WIDTH] <= ram[addr0][i*`DATA_WIDTH +: `DATA_WIDTH];
    	end
    end
    else begin  //write
    	for (i = 0; i < `BUF_LOC_SIZE; i=i+1) begin
      	  if (we0[i]) ram[addr0][i*`DATA_WIDTH +: `DATA_WIDTH] <= d0[i*`DATA_WIDTH +: `DATA_WIDTH]; 
    	end   
   end 
     
end

always @(posedge clk)  
begin 
    if(we1 == 0) begin 
	 for (i = 0; i < `BUF_LOC_SIZE; i=i+1) begin
        q1[i*`DATA_WIDTH +: `DATA_WIDTH] <= ram[addr1][i*`DATA_WIDTH +: `DATA_WIDTH];
        end
   end
    else begin  
    	for (i = 0; i < `BUF_LOC_SIZE; i=i+1) begin
        	if (we1[i]) ram[addr1][i*`DATA_WIDTH +: `DATA_WIDTH] <= d1[i*`DATA_WIDTH +: `DATA_WIDTH]; 
    	end
    end    
     
end

`else
//BRAMs available in VTR FPGA architectures have one bit write-enables.
//So let's combine multiple bits into 1. We don't have a usecase of
//writing/not-writing only parts of the word anyway.
wire we0_coalesced;
assign we0_coalesced = |we0;
wire we1_coalesced;
assign we1_coalesced = |we1;

dual_port_ram u_dual_port_ram(
.addr1(addr0),
.we1(we0_coalesced),
.data1(d0),
.out1(q0),
.addr2(addr1),
.we2(we1_coalesced),
.data2(d1),
.out2(q1),
.clk(clk)
);

`endif

endmodule
