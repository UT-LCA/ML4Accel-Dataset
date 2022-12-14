`define DEFINES_DONE
`define EXPONENT 5
`define MANTISSA 10
`define SIGN 1
`define DATAWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1
`define NUM 8
`define ADDRSIZE 7
`define ADDRSIZE_FOR_TB 10
`define EXPONENT 5
`define MANTISSA 10
`define ACTUAL_MANTISSA 11
`define EXPONENT_LSB 10
`define EXPONENT_MSB 14
`define MANTISSA_LSB 0
`define MANTISSA_MSB 9
`define MANTISSA_MUL_SPLIT_LSB 3
`define MANTISSA_MUL_SPLIT_MSB 9
`define SIGN 1
`define SIGN_LOC 15
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1
`define EXPONENT 5
`define MANTISSA 10
`define ACTUAL_MANTISSA 11
`define EXPONENT_LSB 10
`define EXPONENT_MSB 14
`define MANTISSA_LSB 0
`define MANTISSA_MSB 9
`define MANTISSA_MUL_SPLIT_LSB 3
`define MANTISSA_MUL_SPLIT_MSB 9
`define SIGN 1
`define SIGN_LOC 15
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1
`define EXPONENT 5
`define MANTISSA 10
`define ACTUAL_MANTISSA 11
`define EXPONENT_LSB 10
`define EXPONENT_MSB 14
`define MANTISSA_LSB 0
`define MANTISSA_MSB 9
`define MANTISSA_MUL_SPLIT_LSB 3
`define MANTISSA_MUL_SPLIT_MSB 9
`define SIGN 1
`define SIGN_LOC 15
`define DWIDTH (`SIGN+`EXPONENT+`MANTISSA)
`define IEEE_COMPLIANCE 1

module mode1_max_tree(
  inp0, 
  inp1, 
  inp2, 
  inp3, 
  inp4, 
  inp5, 
  inp6, 
  inp7, 
  mode1_stage3_run,
  mode1_stage2_run,
  mode1_stage1_run,  
  mode1_stage0_run,
  clk,
  reset,
  outp,
);

  input  [`DATAWIDTH-1 : 0] inp0; 
  input  [`DATAWIDTH-1 : 0] inp1; 
  input  [`DATAWIDTH-1 : 0] inp2; 
  input  [`DATAWIDTH-1 : 0] inp3; 
  input  [`DATAWIDTH-1 : 0] inp4; 
  input  [`DATAWIDTH-1 : 0] inp5; 
  input  [`DATAWIDTH-1 : 0] inp6; 
  input  [`DATAWIDTH-1 : 0] inp7; 
  input mode1_stage3_run;
  input mode1_stage2_run;
  input mode1_stage1_run;
  input mode1_stage0_run;
  input clk;
  input reset;
  output [`DATAWIDTH-1 : 0] outp;

  reg    [`DATAWIDTH-1 : 0] outp;

  reg    [`DATAWIDTH-1 : 0] cmp0_out_stage3_reg;
  wire   [`DATAWIDTH-1 : 0] cmp0_out_stage3;
  reg    [`DATAWIDTH-1 : 0] cmp1_out_stage3_reg;
  wire   [`DATAWIDTH-1 : 0] cmp1_out_stage3;
  reg    [`DATAWIDTH-1 : 0] cmp2_out_stage3_reg;
  wire   [`DATAWIDTH-1 : 0] cmp2_out_stage3;
  reg    [`DATAWIDTH-1 : 0] cmp3_out_stage3_reg;
  wire   [`DATAWIDTH-1 : 0] cmp3_out_stage3;
  wire   [`DATAWIDTH-1 : 0] cmp0_out_stage2;
  wire   [`DATAWIDTH-1 : 0] cmp1_out_stage2;
  wire   [`DATAWIDTH-1 : 0] cmp0_out_stage1;
  wire   [`DATAWIDTH-1 : 0] cmp0_out_stage0;
  reg    [`DATAWIDTH-1 : 0] cmp1_out_stage2_reg;
  reg    [`DATAWIDTH-1 : 0] cmp0_out_stage2_reg;
  reg    [`DATAWIDTH-1 : 0] cmp0_out_stage1_reg;


  always @(posedge clk) begin
    if (reset) begin
      outp <= 0;
      cmp0_out_stage3_reg <= 0;
      cmp1_out_stage3_reg <= 0;
      cmp2_out_stage3_reg <= 0;
      cmp3_out_stage3_reg <= 0;
	  cmp0_out_stage2_reg <= 0;
      cmp1_out_stage2_reg <= 0;
	  cmp0_out_stage1_reg <= 0;
    end

    else if(~reset && mode1_stage3_run) begin
      cmp0_out_stage3_reg <= cmp0_out_stage3;
      cmp1_out_stage3_reg <= cmp1_out_stage3;
      cmp2_out_stage3_reg <= cmp2_out_stage3;
      cmp3_out_stage3_reg <= cmp3_out_stage3;
    end
	
	else if(~reset && mode1_stage2_run) begin
      cmp0_out_stage2_reg <= cmp0_out_stage2;
      cmp1_out_stage2_reg <= cmp1_out_stage2;
    end
	
	else if(~reset && mode1_stage1_run) begin
      cmp0_out_stage1_reg <= cmp0_out_stage1;
    end

    else if(~reset && mode1_stage0_run) begin
      outp <= cmp0_out_stage0;
    end

  end

wire cmp0_stage3_aeb;
wire cmp0_stage3_aneb;
wire cmp0_stage3_alb;
wire cmp0_stage3_aleb;
wire cmp0_stage3_agb;
wire cmp0_stage3_ageb;
wire cmp0_stage3_unordered;

wire cmp1_stage3_aeb;
wire cmp1_stage3_aneb;
wire cmp1_stage3_alb;
wire cmp1_stage3_aleb;
wire cmp1_stage3_agb;
wire cmp1_stage3_ageb;
wire cmp1_stage3_unordered;

wire cmp2_stage3_aeb;
wire cmp2_stage3_aneb;
wire cmp2_stage3_alb;
wire cmp2_stage3_aleb;
wire cmp2_stage3_agb;
wire cmp2_stage3_ageb;
wire cmp2_stage3_unordered;

wire cmp3_stage3_aeb;
wire cmp3_stage3_aneb;
wire cmp3_stage3_alb;
wire cmp3_stage3_aleb;
wire cmp3_stage3_agb;
wire cmp3_stage3_ageb;
wire cmp3_stage3_unordered;

wire cmp0_stage2_aeb;
wire cmp0_stage2_aneb;
wire cmp0_stage2_alb;
wire cmp0_stage2_aleb;
wire cmp0_stage2_agb;
wire cmp0_stage2_ageb;
wire cmp0_stage2_unordered;

wire cmp1_stage2_aeb;
wire cmp1_stage2_aneb;
wire cmp1_stage2_alb;
wire cmp1_stage2_aleb;
wire cmp1_stage2_agb;
wire cmp1_stage2_ageb;
wire cmp1_stage2_unordered;

wire cmp0_stage1_aeb;
wire cmp0_stage1_aneb;
wire cmp0_stage1_alb;
wire cmp0_stage1_aleb;
wire cmp0_stage1_agb;
wire cmp0_stage1_ageb;
wire cmp0_stage1_unordered;

wire cmp0_stage0_aeb;
wire cmp0_stage0_aneb;
wire cmp0_stage0_alb;
wire cmp0_stage0_aleb;
wire cmp0_stage0_agb;
wire cmp0_stage0_ageb;
wire cmp0_stage0_unordered;

//Stage3
comparator cmp0_stage3(.a(inp0),       .b(inp1),        .aeb(cmp0_stage3_aeb), .aneb(cmp0_stage3_aneb), .alb(cmp0_stage3_alb), .aleb(cmp0_stage3_aleb), .agb(cmp0_stage3_agb), .ageb(cmp0_stage3_ageb), .unordered(cmp0_stage3_unordered));
assign cmp0_out_stage3 = (cmp0_stage3_ageb==1'b1) ? inp0 : inp1;

comparator cmp1_stage3(.a(inp2),       .b(inp3),         .aeb(cmp1_stage3_aeb), .aneb(cmp1_stage3_aneb), .alb(cmp1_stage3_alb), .aleb(cmp1_stage3_aleb), .agb(cmp1_stage3_agb), .ageb(cmp1_stage3_ageb), .unordered(cmp1_stage3_unordered));   
assign cmp1_out_stage3 = (cmp1_stage3_ageb==1'b1) ? inp2 : inp3;

comparator cmp2_stage3(.a(inp4),       .b(inp5),         .aeb(cmp2_stage3_aeb), .aneb(cmp2_stage3_aneb), .alb(cmp2_stage3_alb), .aleb(cmp2_stage3_aleb), .agb(cmp2_stage3_agb), .ageb(cmp2_stage3_ageb), .unordered(cmp2_stage3_unordered));   
assign cmp2_out_stage3 = (cmp2_stage3_ageb==1'b1) ? inp4 : inp5;

comparator cmp3_stage3(.a(inp6),       .b(inp7),         .aeb(cmp3_stage3_aeb), .aneb(cmp3_stage3_aneb), .alb(cmp3_stage3_alb), .aleb(cmp3_stage3_aleb), .agb(cmp3_stage3_agb), .ageb(cmp3_stage3_ageb), .unordered(cmp3_stage3_unordered));   
assign cmp3_out_stage3 = (cmp3_stage3_ageb==1'b1) ? inp6 : inp7;

//Stage2
comparator cmp0_stage2(.a(cmp0_out_stage3_reg),       .b(cmp1_out_stage3_reg),        .aeb(cmp0_stage2_aeb), .aneb(cmp0_stage2_aneb), .alb(cmp0_stage2_alb), .aleb(cmp0_stage2_aleb), .agb(cmp0_stage2_agb), .ageb(cmp0_stage2_ageb), .unordered(cmp0_stage2_unordered));
assign cmp0_out_stage2 = (cmp0_stage2_ageb==1'b1) ? cmp0_out_stage3_reg : cmp1_out_stage3_reg;

comparator cmp1_stage2(.a(cmp2_out_stage3_reg),       .b(cmp3_out_stage3_reg),         .aeb(cmp1_stage2_aeb), .aneb(cmp1_stage2_aneb), .alb(cmp1_stage2_alb), .aleb(cmp1_stage2_aleb), .agb(cmp1_stage2_agb), .ageb(cmp1_stage2_ageb), .unordered(cmp1_stage2_unordered));   
assign cmp1_out_stage2 = (cmp1_stage2_ageb==1'b1) ? cmp2_out_stage3_reg : cmp3_out_stage3_reg;

//Stage1
comparator cmp0_stage1(.a(cmp0_out_stage2_reg),       .b(cmp1_out_stage2_reg),          .aeb(cmp0_stage1_aeb), .aneb(cmp0_stage1_aneb), .alb(cmp0_stage1_alb), .aleb(cmp0_stage1_aleb), .agb(cmp0_stage1_agb), .ageb(cmp0_stage1_ageb), .unordered(cmp0_stage1_unordered));
assign cmp0_out_stage1 = (cmp0_stage1_ageb==1'b1) ? cmp0_out_stage2_reg: cmp1_out_stage2_reg;

//Stage0
comparator cmp0_stage0(.a(outp),       .b(cmp0_out_stage1_reg),         .aeb(cmp0_stage0_aeb), .aneb(cmp0_stage0_aneb), .alb(cmp0_stage0_alb), .aleb(cmp0_stage0_aleb), .agb(cmp0_stage0_agb), .ageb(cmp0_stage0_ageb), .unordered(cmp0_stage0_unordered));
assign cmp0_out_stage0 = (cmp0_stage0_ageb==1'b1) ? outp : cmp0_out_stage1_reg;

//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp0_stage3(.a(inp0),       .b(inp1),      .z1(cmp0_out_stage3), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp1_stage3(.a(inp2),       .b(inp3),      .z1(cmp1_out_stage3), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp2_stage3(.a(inp4),       .b(inp5),      .z1(cmp2_out_stage3), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp3_stage3(.a(inp6),       .b(inp7),      .z1(cmp3_out_stage3), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp0_stage2(.a(cmp0_out_stage3_reg),       .b(cmp1_out_stage3_reg),      .z1(cmp0_out_stage2), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp1_stage2(.a(cmp2_out_stage3_reg),       .b(cmp3_out_stage3_reg),      .z1(cmp1_out_stage2), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp0_stage1(.a(cmp0_out_stage2),       .b(cmp1_out_stage2),      .z1(cmp0_out_stage1), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());
//
//DW_fp_cmp #(`MANTISSA, `EXPONENT, `IEEE_COMPLIANCE) cmp0_stage0(.a(outp),       .b(cmp0_out_stage1),      .z1(cmp0_out_stage0), .zctr(1'b0), .aeqb(), .altb(), .agtb(), .unordered(), .z0(), .status0(), .status1());

endmodule
module comparator(
a,
b,
aeb,
aneb,
alb,
aleb,
agb,
ageb,
unordered
);
//Default for FP16
//parameter exp = 5;
//parameter man = 10;

input [15:0] a;
input [15:0] b;
output aeb;
output aneb;
output alb;
output aleb;
output agb;
output ageb;
output unordered;

wire [16:0] a_RecFN;
wire [16:0] b_RecFN;

//Convert to Recoded representation
fNToRecFN#(5,11) convert_a(.in(a), .out(a_RecFN));  
fNToRecFN#(5,11) convert_b(.in(b), .out(b_RecFN));  

wire [4:0] except_flags;
wire less_than;
wire equal;
wire greater_than;

wire signaling;
assign signaling = 1'b0;

//Actual conversion module
compareRecFN_Fp16 compare(
.a(a_RecFN),
.b(b_RecFN),
.signaling(signaling),
.lt(less_than),
.eq(equal),
.gt(greater_than),
.unordered(unordered),
.exceptionFlags(except_flags)
);


//Result flags
assign aeb = equal;
assign aneb = ~equal;
assign alb = less_than;
assign aleb = less_than | equal;
assign agb = greater_than;
assign ageb = greater_than | equal;

endmodule
module compareRecFN_Fp16(
  a,
  b,
  signaling,
  lt,
  eq,
  gt,
  unordered,
  exceptionFlags
  );
  //parameter expWidth = 5;
  //parameter sigWidth = 11;
  
  input [(5 + 11):0] a;
  input [(5 + 11):0] b;
  input signaling;
  output lt;
  output eq;
  output gt;
  output unordered;
  output [4:0] exceptionFlags;
   

    wire isNaNA, isInfA, isZeroA, signA;
    wire [(5 + 1):0] sExpA;
    wire [11:0] sigA;
    recFNToRawFN#(5, 11)  recFNToRawFN_a(
      .in(a), 
      .isNaN(isNaNA), 
      .isInf(isInfA), 
      .isZero(isZeroA), 
      .sign(signA), 
      .sExp(sExpA), 
      .sig(sigA)
      );
    wire isSigNaNA;
    isSigNaNRecFN#(5, 11) isSigNaN_a(.in(a), .isSigNaN(isSigNaNA));
    wire isNaNB, isInfB, isZeroB, signB;
    wire [(5 + 1):0] sExpB;
    wire [11:0] sigB;
    recFNToRawFN#(5, 11) recFNToRawFN_b(
      .in(b), 
      .isNaN(isNaNB), 
      .isInf(isInfB), 
      .isZero(isZeroB), 
      .sign(signB), 
      .sExp(sExpB), 
      .sig(sigB)
      );
    wire isSigNaNB;
    isSigNaNRecFN#(5, 11) isSigNaN_b(.in(b), .isSigNaN(isSigNaNB));
   
    wire ordered = !isNaNA && !isNaNB;
    wire bothInfs  = isInfA  && isInfB;
    wire bothZeros = isZeroA && isZeroB;
    wire eqExps = (sExpA == sExpB);
    wire common_ltMags = (sExpA < sExpB) || (eqExps && (sigA < sigB));
    wire common_eqMags = eqExps && (sigA == sigB);
    wire ordered_lt =
        !bothZeros
            && ((signA && !signB)
                    || (!bothInfs
                            && ((signA && !common_ltMags && !common_eqMags)
                                    || (!signB && common_ltMags))));
    wire ordered_eq =
        bothZeros || ((signA == signB) && (bothInfs || common_eqMags));
    
    
    wire invalid = isSigNaNA || isSigNaNB || (signaling && !ordered);
    assign lt = ordered && ordered_lt;
    assign eq = ordered && ordered_eq;
    assign gt = ordered && !ordered_lt && !ordered_eq;
    assign unordered = !ordered;
    assign exceptionFlags = {invalid, 4'b0};

endmodule
module  isSigNaNRecFN(in, isSigNaN);

  parameter expWidth = 3;
  parameter sigWidth = 3;
  
  input [(expWidth + sigWidth):0] in;
  output isSigNaN;

    wire isNaN =
        (in[(expWidth + sigWidth - 1):(expWidth + sigWidth - 3)] == 'b111);
    assign isSigNaN = isNaN && !in[sigWidth - 2];

endmodule
module recFNToRawFN(
  in,
  isNaN,
  isInf,
  isZero,
  sign,
  sExp,
  sig
  );
  
  parameter expWidth = 3;
  parameter sigWidth = 3;
  
  input [(expWidth + sigWidth):0] in;
  output isNaN;
  output isInf;
  output isZero;
  output sign;
  output [(expWidth + 1):0] sExp;
  output [sigWidth:0] sig;

    
    wire [expWidth:0] exp;
    wire [(sigWidth - 2):0] fract;
    assign {sign, exp, fract} = in;
    wire isSpecial = (exp>>(expWidth - 1) == 'b11);
    
    
    assign isNaN = isSpecial &&  exp[expWidth - 2];
    assign isInf = isSpecial && !exp[expWidth - 2];
    assign isZero = (exp>>(expWidth - 2) == 'b000);
    assign sExp = exp;
    assign sig = {1'b0, !isZero, fract};

endmodule
module fNToRecFN#(parameter expWidth = 3, parameter sigWidth = 3) (
        input [(expWidth + sigWidth - 1):0] in,
        output [(expWidth + sigWidth):0] out
    );

    //`include "HardFloat_localFuncs.vi"
    //localparam normDistWidth = clog2(sigWidth);
    localparam normDistWidth = 4; //Hardcoding for FP16

    wire sign;
    wire [(expWidth - 1):0] expIn;
    wire [(sigWidth - 2):0] fractIn;
    assign {sign, expIn, fractIn} = in;
    wire isZeroExpIn = (expIn == 0);
    wire isZeroFractIn = (fractIn == 0);
    
   
    wire [(normDistWidth - 1):0] normDist;
    //sigwidth = 11, normDistWidth=4
    countLeadingZerosfp16 #(sigWidth - 1, normDistWidth)  countLeadingZeros(.in(fractIn), .count(normDist)); 
    wire [(sigWidth - 2):0] subnormFract = (fractIn<<normDist)<<1;
    wire [expWidth:0] adjustedExp =
        (isZeroExpIn ? normDist ^ ((1<<(expWidth + 1)) - 1) : expIn)
            + ((1<<(expWidth - 1)) | (isZeroExpIn ? 2 : 1));
    wire isZero = isZeroExpIn && isZeroFractIn;
    wire isSpecial = (adjustedExp[expWidth:(expWidth - 1)] == 'b11);
    
   
    wire [expWidth:0] exp;
    assign exp[expWidth:(expWidth - 2)] =
        isSpecial ? {2'b11, !isZeroFractIn}
            : isZero ? 3'b000 : adjustedExp[expWidth:(expWidth - 2)];
    assign exp[(expWidth - 3):0] = adjustedExp;
    assign out = {sign, exp, isZeroExpIn ? subnormFract : fractIn};

endmodule
module countLeadingZerosfp16 #(parameter inWidth = 10, parameter countWidth = 4) (
    input [(inWidth - 1):0] in, output reg [(countWidth - 1):0] count
    );

  wire [(inWidth - 1):0] reverseIn;
  reverseFp16 reverse_in(in, reverseIn);
  wire [inWidth:0] oneLeastReverseIn =
      {1'b1, reverseIn} & ({1'b0, ~reverseIn} + 1);
		
  always@(*)
    begin
      if (oneLeastReverseIn[10] == 1)
        begin
          count = 4'd10;
        end
      else if (oneLeastReverseIn[9] == 1)
        begin
          count = 4'd9;
        end
      else if (oneLeastReverseIn[8] == 1)
        begin
          count= 4'd8;
        end
      else if (oneLeastReverseIn[7] == 1)
        begin
          count = 4'd7;
        end
      else if (oneLeastReverseIn[6] == 1)
        begin
          count = 4'd6;
        end
      else if (oneLeastReverseIn[5] == 1)
        begin
          count = 4'd5;
        end
      else if (oneLeastReverseIn[4] == 1)
        begin
          count = 4'd4;
        end
      else if (oneLeastReverseIn[3] == 1)
        begin
          count = 4'd3;
        end
      else if (oneLeastReverseIn[2] == 1)
        begin
          count = 4'd2;
        end
      else if (oneLeastReverseIn[1] == 1)
        begin
          count = 4'd1;
        end
      else
        begin
          count = 4'd0;
        end
      end

endmodule
module reverseFp16 (input [9:0] in, output [9:0] out);

   assign out[0] = in[9];
   assign out[1] = in[8];
   assign out[2] = in[7];
   assign out[3] = in[6];
   assign out[4] = in[5];
   assign out[5] = in[4];
   assign out[6] = in[3];
   assign out[7] = in[2];
   assign out[8] = in[1];
   assign out[9] = in[0];
   // genvar ix;
   // generate
   //     for (ix = 0; ix < width; ix = ix + 1) begin :Bit
   //         assign out[ix] = in[width - 1 - ix];
   //     end
   // endgenerate

endmodule
