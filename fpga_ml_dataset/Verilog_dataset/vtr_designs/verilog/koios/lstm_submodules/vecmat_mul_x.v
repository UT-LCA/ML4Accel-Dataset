`define SIMULATION_MEMORY
`define ARRAY_DEPTH 64      //Number of Hidden neurons
`define INPUT_DEPTH 100	    //LSTM input vector dimensions
`define DATA_WIDTH 16		//16 bit representation
`define INWEIGHT_DEPTH 6400 //100x64
`define HWEIGHT_DEPTH 4096  //64x64
`define varraysize 1600   //100x16
`define uarraysize 1024  //64x16

module vecmat_mul_x #(parameter varraysize=1600,vectwidth=100) //,matsize=64)   // varraysize=1024 vectwidth=64,matsize=4096
(
 input clk,reset,
 input [varraysize-1:0] data,
 input [varraysize-1:0] W,
 //output reg [15:0] data_out
 output [varraysize-1:0] tmp
 );

 
// wire overflow [vectwidth-1:0];  

 wire [15:0] matrix_output[vectwidth-1:0];  
 //wire [15:0] tmp[vectwidth-1:0];


 reg [varraysize-1:0] vector;
 reg [varraysize-1:0] matrix;

 
   
 always @(posedge clk) begin
	if(~reset) begin
		vector <= data;
		matrix <= W;			
       	                         
	   	///count <= count+1;
		//data_out <= tmp97;
	end   
 end      


 /*genvar j;
 generate
	 for(j=0;j<100;j=j+1) begin
   			signedmul mult_u0(.a(vector[j*16+:16]),.b(matrix[j*16+:16]),.c(tmp[j*16+:16]));
	 end
 endgenerate*/
 
 	 signedmul mult_u0(.clk(clk),.a(vector[0*16+:16]),.b(matrix[0*16+:16]),.c(tmp[0*16+:16]));
	signedmul mult_u1(.clk(clk),.a(vector[1*16+:16]),.b(matrix[1*16+:16]),.c(tmp[1*16+:16]));
	signedmul mult_u2(.clk(clk),.a(vector[2*16+:16]),.b(matrix[2*16+:16]),.c(tmp[2*16+:16]));
	signedmul mult_u3(.clk(clk),.a(vector[3*16+:16]),.b(matrix[3*16+:16]),.c(tmp[3*16+:16]));
	signedmul mult_u4(.clk(clk),.a(vector[4*16+:16]),.b(matrix[4*16+:16]),.c(tmp[4*16+:16]));
	signedmul mult_u5(.clk(clk),.a(vector[5*16+:16]),.b(matrix[5*16+:16]),.c(tmp[5*16+:16]));
	signedmul mult_u6(.clk(clk),.a(vector[6*16+:16]),.b(matrix[6*16+:16]),.c(tmp[6*16+:16]));
	signedmul mult_u7(.clk(clk),.a(vector[7*16+:16]),.b(matrix[7*16+:16]),.c(tmp[7*16+:16]));
	signedmul mult_u8(.clk(clk),.a(vector[8*16+:16]),.b(matrix[8*16+:16]),.c(tmp[8*16+:16]));
	signedmul mult_u9(.clk(clk),.a(vector[9*16+:16]),.b(matrix[9*16+:16]),.c(tmp[9*16+:16]));
	signedmul mult_u10(.clk(clk),.a(vector[10*16+:16]),.b(matrix[10*16+:16]),.c(tmp[10*16+:16]));
	signedmul mult_u11(.clk(clk),.a(vector[11*16+:16]),.b(matrix[11*16+:16]),.c(tmp[11*16+:16]));
	signedmul mult_u12(.clk(clk),.a(vector[12*16+:16]),.b(matrix[12*16+:16]),.c(tmp[12*16+:16]));
	signedmul mult_u13(.clk(clk),.a(vector[13*16+:16]),.b(matrix[13*16+:16]),.c(tmp[13*16+:16]));
	signedmul mult_u14(.clk(clk),.a(vector[14*16+:16]),.b(matrix[14*16+:16]),.c(tmp[14*16+:16]));
	signedmul mult_u15(.clk(clk),.a(vector[15*16+:16]),.b(matrix[15*16+:16]),.c(tmp[15*16+:16]));
	signedmul mult_u16(.clk(clk),.a(vector[16*16+:16]),.b(matrix[16*16+:16]),.c(tmp[16*16+:16]));
	signedmul mult_u17(.clk(clk),.a(vector[17*16+:16]),.b(matrix[17*16+:16]),.c(tmp[17*16+:16]));
	signedmul mult_u18(.clk(clk),.a(vector[18*16+:16]),.b(matrix[18*16+:16]),.c(tmp[18*16+:16]));
	signedmul mult_u19(.clk(clk),.a(vector[19*16+:16]),.b(matrix[19*16+:16]),.c(tmp[19*16+:16]));
	signedmul mult_u20(.clk(clk),.a(vector[20*16+:16]),.b(matrix[20*16+:16]),.c(tmp[20*16+:16]));
	signedmul mult_u21(.clk(clk),.a(vector[21*16+:16]),.b(matrix[21*16+:16]),.c(tmp[21*16+:16]));
	signedmul mult_u22(.clk(clk),.a(vector[22*16+:16]),.b(matrix[22*16+:16]),.c(tmp[22*16+:16]));
	signedmul mult_u23(.clk(clk),.a(vector[23*16+:16]),.b(matrix[23*16+:16]),.c(tmp[23*16+:16]));
	signedmul mult_u24(.clk(clk),.a(vector[24*16+:16]),.b(matrix[24*16+:16]),.c(tmp[24*16+:16]));
	signedmul mult_u25(.clk(clk),.a(vector[25*16+:16]),.b(matrix[25*16+:16]),.c(tmp[25*16+:16]));
	signedmul mult_u26(.clk(clk),.a(vector[26*16+:16]),.b(matrix[26*16+:16]),.c(tmp[26*16+:16]));
	signedmul mult_u27(.clk(clk),.a(vector[27*16+:16]),.b(matrix[27*16+:16]),.c(tmp[27*16+:16]));
	signedmul mult_u28(.clk(clk),.a(vector[28*16+:16]),.b(matrix[28*16+:16]),.c(tmp[28*16+:16]));
	signedmul mult_u29(.clk(clk),.a(vector[29*16+:16]),.b(matrix[29*16+:16]),.c(tmp[29*16+:16]));
	signedmul mult_u30(.clk(clk),.a(vector[30*16+:16]),.b(matrix[30*16+:16]),.c(tmp[30*16+:16]));
	signedmul mult_u31(.clk(clk),.a(vector[31*16+:16]),.b(matrix[31*16+:16]),.c(tmp[31*16+:16]));
	signedmul mult_u32(.clk(clk),.a(vector[32*16+:16]),.b(matrix[32*16+:16]),.c(tmp[32*16+:16]));
	signedmul mult_u33(.clk(clk),.a(vector[33*16+:16]),.b(matrix[33*16+:16]),.c(tmp[33*16+:16]));
	signedmul mult_u34(.clk(clk),.a(vector[34*16+:16]),.b(matrix[34*16+:16]),.c(tmp[34*16+:16]));
	signedmul mult_u35(.clk(clk),.a(vector[35*16+:16]),.b(matrix[35*16+:16]),.c(tmp[35*16+:16]));
	signedmul mult_u36(.clk(clk),.a(vector[36*16+:16]),.b(matrix[36*16+:16]),.c(tmp[36*16+:16]));
	signedmul mult_u37(.clk(clk),.a(vector[37*16+:16]),.b(matrix[37*16+:16]),.c(tmp[37*16+:16]));
	signedmul mult_u38(.clk(clk),.a(vector[38*16+:16]),.b(matrix[38*16+:16]),.c(tmp[38*16+:16]));
	signedmul mult_u39(.clk(clk),.a(vector[39*16+:16]),.b(matrix[39*16+:16]),.c(tmp[39*16+:16]));
	signedmul mult_u40(.clk(clk),.a(vector[40*16+:16]),.b(matrix[40*16+:16]),.c(tmp[40*16+:16]));
	signedmul mult_u41(.clk(clk),.a(vector[41*16+:16]),.b(matrix[41*16+:16]),.c(tmp[41*16+:16]));
	signedmul mult_u42(.clk(clk),.a(vector[42*16+:16]),.b(matrix[42*16+:16]),.c(tmp[42*16+:16]));
	signedmul mult_u43(.clk(clk),.a(vector[43*16+:16]),.b(matrix[43*16+:16]),.c(tmp[43*16+:16]));
	signedmul mult_u44(.clk(clk),.a(vector[44*16+:16]),.b(matrix[44*16+:16]),.c(tmp[44*16+:16]));
	signedmul mult_u45(.clk(clk),.a(vector[45*16+:16]),.b(matrix[45*16+:16]),.c(tmp[45*16+:16]));
	signedmul mult_u46(.clk(clk),.a(vector[46*16+:16]),.b(matrix[46*16+:16]),.c(tmp[46*16+:16]));
	signedmul mult_u47(.clk(clk),.a(vector[47*16+:16]),.b(matrix[47*16+:16]),.c(tmp[47*16+:16]));
	signedmul mult_u48(.clk(clk),.a(vector[48*16+:16]),.b(matrix[48*16+:16]),.c(tmp[48*16+:16]));
	signedmul mult_u49(.clk(clk),.a(vector[49*16+:16]),.b(matrix[49*16+:16]),.c(tmp[49*16+:16]));
	signedmul mult_u50(.clk(clk),.a(vector[50*16+:16]),.b(matrix[50*16+:16]),.c(tmp[50*16+:16]));
	signedmul mult_u51(.clk(clk),.a(vector[51*16+:16]),.b(matrix[51*16+:16]),.c(tmp[51*16+:16]));
	signedmul mult_u52(.clk(clk),.a(vector[52*16+:16]),.b(matrix[52*16+:16]),.c(tmp[52*16+:16]));
	signedmul mult_u53(.clk(clk),.a(vector[53*16+:16]),.b(matrix[53*16+:16]),.c(tmp[53*16+:16]));
	signedmul mult_u54(.clk(clk),.a(vector[54*16+:16]),.b(matrix[54*16+:16]),.c(tmp[54*16+:16]));
	signedmul mult_u55(.clk(clk),.a(vector[55*16+:16]),.b(matrix[55*16+:16]),.c(tmp[55*16+:16]));
	signedmul mult_u56(.clk(clk),.a(vector[56*16+:16]),.b(matrix[56*16+:16]),.c(tmp[56*16+:16]));
	signedmul mult_u57(.clk(clk),.a(vector[57*16+:16]),.b(matrix[57*16+:16]),.c(tmp[57*16+:16]));
	signedmul mult_u58(.clk(clk),.a(vector[58*16+:16]),.b(matrix[58*16+:16]),.c(tmp[58*16+:16]));
	signedmul mult_u59(.clk(clk),.a(vector[59*16+:16]),.b(matrix[59*16+:16]),.c(tmp[59*16+:16]));
	signedmul mult_u60(.clk(clk),.a(vector[60*16+:16]),.b(matrix[60*16+:16]),.c(tmp[60*16+:16]));
	signedmul mult_u61(.clk(clk),.a(vector[61*16+:16]),.b(matrix[61*16+:16]),.c(tmp[61*16+:16]));
	signedmul mult_u62(.clk(clk),.a(vector[62*16+:16]),.b(matrix[62*16+:16]),.c(tmp[62*16+:16]));
	signedmul mult_u63(.clk(clk),.a(vector[63*16+:16]),.b(matrix[63*16+:16]),.c(tmp[63*16+:16]));
	signedmul mult_u64(.clk(clk),.a(vector[64*16+:16]),.b(matrix[64*16+:16]),.c(tmp[64*16+:16]));
	signedmul mult_u65(.clk(clk),.a(vector[65*16+:16]),.b(matrix[65*16+:16]),.c(tmp[65*16+:16]));
	signedmul mult_u66(.clk(clk),.a(vector[66*16+:16]),.b(matrix[66*16+:16]),.c(tmp[66*16+:16]));
	signedmul mult_u67(.clk(clk),.a(vector[67*16+:16]),.b(matrix[67*16+:16]),.c(tmp[67*16+:16]));
	signedmul mult_u68(.clk(clk),.a(vector[68*16+:16]),.b(matrix[68*16+:16]),.c(tmp[68*16+:16]));
	signedmul mult_u69(.clk(clk),.a(vector[69*16+:16]),.b(matrix[69*16+:16]),.c(tmp[69*16+:16]));
	signedmul mult_u70(.clk(clk),.a(vector[70*16+:16]),.b(matrix[70*16+:16]),.c(tmp[70*16+:16]));
	signedmul mult_u71(.clk(clk),.a(vector[71*16+:16]),.b(matrix[71*16+:16]),.c(tmp[71*16+:16]));
	signedmul mult_u72(.clk(clk),.a(vector[72*16+:16]),.b(matrix[72*16+:16]),.c(tmp[72*16+:16]));
	signedmul mult_u73(.clk(clk),.a(vector[73*16+:16]),.b(matrix[73*16+:16]),.c(tmp[73*16+:16]));
	signedmul mult_u74(.clk(clk),.a(vector[74*16+:16]),.b(matrix[74*16+:16]),.c(tmp[74*16+:16]));
	signedmul mult_u75(.clk(clk),.a(vector[75*16+:16]),.b(matrix[75*16+:16]),.c(tmp[75*16+:16]));
	signedmul mult_u76(.clk(clk),.a(vector[76*16+:16]),.b(matrix[76*16+:16]),.c(tmp[76*16+:16]));
	signedmul mult_u77(.clk(clk),.a(vector[77*16+:16]),.b(matrix[77*16+:16]),.c(tmp[77*16+:16]));
	signedmul mult_u78(.clk(clk),.a(vector[78*16+:16]),.b(matrix[78*16+:16]),.c(tmp[78*16+:16]));
	signedmul mult_u79(.clk(clk),.a(vector[79*16+:16]),.b(matrix[79*16+:16]),.c(tmp[79*16+:16]));
	signedmul mult_u80(.clk(clk),.a(vector[80*16+:16]),.b(matrix[80*16+:16]),.c(tmp[80*16+:16]));
	signedmul mult_u81(.clk(clk),.a(vector[81*16+:16]),.b(matrix[81*16+:16]),.c(tmp[81*16+:16]));
	signedmul mult_u82(.clk(clk),.a(vector[82*16+:16]),.b(matrix[82*16+:16]),.c(tmp[82*16+:16]));
	signedmul mult_u83(.clk(clk),.a(vector[83*16+:16]),.b(matrix[83*16+:16]),.c(tmp[83*16+:16]));
	signedmul mult_u84(.clk(clk),.a(vector[84*16+:16]),.b(matrix[84*16+:16]),.c(tmp[84*16+:16]));
	signedmul mult_u85(.clk(clk),.a(vector[85*16+:16]),.b(matrix[85*16+:16]),.c(tmp[85*16+:16]));
	signedmul mult_u86(.clk(clk),.a(vector[86*16+:16]),.b(matrix[86*16+:16]),.c(tmp[86*16+:16]));
	signedmul mult_u87(.clk(clk),.a(vector[87*16+:16]),.b(matrix[87*16+:16]),.c(tmp[87*16+:16]));
	signedmul mult_u88(.clk(clk),.a(vector[88*16+:16]),.b(matrix[88*16+:16]),.c(tmp[88*16+:16]));
	signedmul mult_u89(.clk(clk),.a(vector[89*16+:16]),.b(matrix[89*16+:16]),.c(tmp[89*16+:16]));
	signedmul mult_u90(.clk(clk),.a(vector[90*16+:16]),.b(matrix[90*16+:16]),.c(tmp[90*16+:16]));
	signedmul mult_u91(.clk(clk),.a(vector[91*16+:16]),.b(matrix[91*16+:16]),.c(tmp[91*16+:16]));
	signedmul mult_u92(.clk(clk),.a(vector[92*16+:16]),.b(matrix[92*16+:16]),.c(tmp[92*16+:16]));
	signedmul mult_u93(.clk(clk),.a(vector[93*16+:16]),.b(matrix[93*16+:16]),.c(tmp[93*16+:16]));
	signedmul mult_u94(.clk(clk),.a(vector[94*16+:16]),.b(matrix[94*16+:16]),.c(tmp[94*16+:16]));
	signedmul mult_u95(.clk(clk),.a(vector[95*16+:16]),.b(matrix[95*16+:16]),.c(tmp[95*16+:16]));
	signedmul mult_u96(.clk(clk),.a(vector[96*16+:16]),.b(matrix[96*16+:16]),.c(tmp[96*16+:16]));
	signedmul mult_u97(.clk(clk),.a(vector[97*16+:16]),.b(matrix[97*16+:16]),.c(tmp[97*16+:16]));
	signedmul mult_u98(.clk(clk),.a(vector[98*16+:16]),.b(matrix[98*16+:16]),.c(tmp[98*16+:16]));
	signedmul mult_u99(.clk(clk),.a(vector[99*16+:16]),.b(matrix[99*16+:16]),.c(tmp[99*16+:16]));
	
 endmodule

module signedmul(
  input clk,
  input [15:0] a,
  input [15:0] b,
  output [15:0] c
);

wire [31:0] result;
wire [15:0] a_new;
wire [15:0] b_new;

reg [15:0] a_ff;
reg [15:0] b_ff;
reg [31:0] result_ff;
reg a_sign,b_sign,a_sign_ff,b_sign_ff;

assign c = (b_sign_ff==a_sign_ff)?result_ff[26:12]:(~result_ff[26:12]+1'b1);
assign a_new = a[15]?(~a + 1'b1):a;
assign b_new = b[15]?(~b + 1'b1):b;
assign result = a_ff*b_ff;

always@(posedge clk) begin
	a_ff <= a_new;
	b_ff <= b_new; 

	a_sign <= a[15];
	b_sign <= b[15];
	a_sign_ff <= a_sign;
	b_sign_ff <= b_sign;
    result_ff <= result;
    
end


endmodule



