`define LSB_X 1'b0	
`define MSB_X 4'b1010 
`define LSB_Y 4'b1011
`define  MSB_Y 5'b10101
`define LSB_RunLength 5'b10110
`define MSB_RunLength 5'b11111 
`define LSB_RunSumValues 6'b100000
`define MSB_RunSumValues  6'b11111
`define LSB_RunSumXpositions 7'b1000000
`define MSB_RunSumXpositions 7'b1011111
`define LSB_RunSumYpositions  7'b1100000
`define MSB_RunSumYpositions 7'b1111111
`define LSB_EOFflag 1'b0
`define MSB_EOFflag 5'b11111
`define CONT_RANGE   5'b01010
`define BLOB_RANGE   5'b01010
`define FALSE 1'b0 
`define TRUE 1'b1
`define INIT 5'b00000
`define IDLE 5'b00001
`define CHECK_CONDITIONS 5'b00010
`define WRITE_FIFO 5'b00011
`define WAIT_FIFO 5'b00100
`define COMPUTE_CENTER 5'b00101
`define VALIDATE_CHECK_ADJACENT_CONTAINER 5'b00110
`define READ_FIFO 5'b00111
`define CONFIG_WRITE 5'b01000
`define  WRITE_WAIT 5'b01001
`define SELECT_EMPTY_CONTAINER 5'b01010
`define CHECK_ADJACENT_CONTAINTER 5'b01011
`define CHECK_CONT_ADJACENCY 5'b01100
`define MERGE_CONTAINER 5'b01101
`define WRITE_BLOB_0 4'b0000 
`define WRITE_BLOB_1 4'b0001 
`define WRITE_BLOB_2 4'b0010 
`define WRITE_BLOB_3 4'b0011 
`define WRITE_BLOB_4 4'b0100 
`define WRITE_BLOB_5 4'b0101
`define EOF 32'b00000000000000000000000000000000
`define MERGE_CONT_1_2 5'b01110
`define MERGE_CONT_1_3 5'b01111
`define MERGE_CONT_1_4 5'b10000
`define MERGE_CONT_1_5 5'b10001
`define MERGE_CONT_2_3 5'b10010
`define MERGE_CONT_2_4 5'b10011
`define MERGE_CONT_2_5 5'b10100
`define MERGE_CONT_3_4 5'b10101
`define MERGE_CONT_3_5 5'b10110
`define MERGE_CONT_4_5 5'b10111
`define MERGE_CONT_1_6 5'b11000
`define MERGE_CONT_2_6 5'b11001
`define MERGE_CONT_3_6 5'b11010
`define MERGE_CONT_4_6 5'b11011
`define MERGE_CONT_5_6 5'b11100

module divider(//clk, 
	opa, opb, quo, rem 
	//testy , testy2, testy_diff, dividend_test
	);   
   input  [10:0]  opa;
   input  [3:0]  opb;
   output [10:0]  quo, rem;
   //input         clk;
//output [49:0] testy;
//output [49:0] testy2;
//output [49:0] testy_diff;
//output [49:0] dividend_test;


//assign testy_diff = diff27;
//assign testy = quotient26;
//assign testy2 = divider_copy26;
//assign dividend_test = dividend_copy26;



   reg [10:0] quo, rem;

//  """"""""|
//     1011 |  <----  dividend_copy
// -0011    |  <----  divider_copy
//  """"""""|    0  Difference is negative: copy dividend and put 0 in quotient.
//     1011 |  <----  dividend_copy
//  -0011   |  <----  divider_copy
//  """"""""|   00  Difference is negative: copy dividend and put 0 in quotient.
//     1011 |  <----  dividend_copy
//   -0011  |  <----  divider_copy
//  """"""""|  001  Difference is positive: use difference and put 1 in quotient.
//            quotient (numbers above)   

   reg [10:0]    quotient0;
   reg [10:0]    dividend_copy0, diff0;
   reg [10:0]    divider_copy0;
   wire [10:0]   remainder0;

   reg [10:0]    quotient1;
   reg [10:0]    dividend_copy1, diff1;
   reg [10:0]    divider_copy1;
   wire [10:0]   remainder1;
 
   reg [10:0]    quotient2;
   reg [10:0]    dividend_copy2, diff2;
   reg [10:0]    divider_copy2;
   wire [10:0]   remainder2;
   
   reg [10:0]    quotient3;
   reg [10:0]    dividend_copy3, diff3;
   reg [10:0]    divider_copy3;
   wire [10:0]   remainder3;
   
   reg [10:0]    quotient4;
   reg [10:0]    dividend_copy4, diff4;
   reg [10:0]    divider_copy4;
   wire [10:0]   remainder4;
   
   reg [10:0]    quotient5;
   reg [10:0]    dividend_copy5, diff5;
   reg [10:0]    divider_copy5;
   wire [10:0]   remainder5;
   
   reg [10:0]    quotient6;
   reg [10:0]    dividend_copy6, diff6;
   reg [10:0]    divider_copy6;
   wire [10:0]   remainder6;
   
   reg [10:0]    quotient7;
   reg [10:0]    dividend_copy7, diff7;
   reg [10:0]    divider_copy7;
   wire [10:0]   remainder7;
   
   reg [10:0]    quotient8;
   reg [10:0]    dividend_copy8, diff8;
   reg [10:0]    divider_copy8;
   wire [10:0]   remainder8;
   
always @ (opa or opb)
begin
//stage initial
 quotient0 = 11'b00000000000;
 dividend_copy0 = opa;
 divider_copy0 = {opb,7'b0000000};
 
 //stage1
 diff1 = dividend_copy0 - divider_copy0;
 quotient1 [10:1] = quotient0[9:0] ;
 if (!diff1[10]) // if diff1[10] == 0 (diff is positive, use difference )
 begin
 dividend_copy1 = diff1;
 quotient1[0] = 1'b1;
 end
else   // diff was negative, use old dividend
begin
dividend_copy1 = dividend_copy0;
 quotient1[0] = 1'b0;

end
 divider_copy1 = (divider_copy0 >> 1);
//stage2
 diff2 = dividend_copy1 - divider_copy1;
 quotient2[10:1]  = quotient1 [9:0] ;
 if (!diff2[10])
 begin
 dividend_copy2 = diff2;
 quotient2[0] = 1'b1;
 end
 else
begin
dividend_copy2 = dividend_copy1;
 quotient2[0] = 1'b0;

end
 divider_copy2 = divider_copy1 >> 1;
 
 //stage3
 diff3 = dividend_copy2 - divider_copy2;
 quotient3[10:1]  = quotient2 [9:0] ;
 if (!diff3[10])
 begin
 dividend_copy3 = diff3;
 quotient3[0] = 1'b1;
 end
 else
begin
dividend_copy3 = dividend_copy2;
 quotient3[0] = 1'b0;

end
 divider_copy3 = divider_copy2 >> 1;
 
 //stage4
 diff4 = dividend_copy3 - divider_copy3;
 quotient4[10:1]  = quotient3 [9:0] ;
 if (!diff4[10])
 begin
 dividend_copy4 = diff4;
 quotient4[0] = 1'b1;
 end
 else
begin
dividend_copy4 = dividend_copy3;
 quotient4[0] = 1'b0;

end
 divider_copy4 = divider_copy3 >> 1;
  //stage5
 diff5 = dividend_copy4 - divider_copy4;
 quotient5[10:1]  = quotient4 [9:0] ;
 if (!diff5[10])
 begin
 dividend_copy5 = diff5;
 quotient5[0] = 1'b1;
 end
 else
begin
dividend_copy5 = dividend_copy4;
 quotient5[0] = 1'b0;

end
 divider_copy5 = divider_copy4 >> 1;
  //stage6
 diff6 = dividend_copy5 - divider_copy5;
 quotient6[10:1]  = quotient5 [9:0] ;
 if (!diff6[10])
 begin
 dividend_copy6 = diff6;
 quotient6[0] = 1'b1;
 end
 else
begin
dividend_copy6 = dividend_copy5;
 quotient6[0] = 1'b0;

end
 divider_copy6 = divider_copy5>> 1;
 
  //stage7
 diff7 = dividend_copy6 - divider_copy6;
 quotient7[10:1]  = quotient6 [9:0] ;
 if (!diff7[10])
 begin
 dividend_copy7 = diff7;
 quotient7[0] = 1'b1;
 end
 else
begin
dividend_copy7 = dividend_copy6;
 quotient7[0] = 1'b0;

end
 divider_copy7 = divider_copy6>> 1;
  //stage8
 diff8 = dividend_copy7 - divider_copy7;
 quotient8[10:1]  = quotient7 [9:0] ;
 if (!diff8[10])
 begin
 dividend_copy8 = diff8;
 quotient8[0] = 1'b1;
 end
 else
begin
dividend_copy8 = dividend_copy7;
 quotient8[0] = 1'b0;

end
 divider_copy8 = divider_copy7>> 1;
 
quo = quotient8;
rem =  dividend_copy8;

end

   //integer i;

   /*
always @(opa,opb) 
begin
    for (i=-1; i<8; i=i+1) 
begin
if (i==-1) 
begin
            // initialization
quotient = 10'd0;
dividend_copy = opa;
divider_copy = {opb,7'd0};
end 
else 
begin
diff = dividend_copy - divider_copy;
quotient = quotient ;

if( !diff[10] ) 
begin
dividend_copy = diff;
quotient[0] = 1'd1;
end
divider_copy = divider_copy >> 1;
end
end
end
*/

endmodule
