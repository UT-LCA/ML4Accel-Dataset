/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit        ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                                ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                           ////
////                  muni_aditya@yahoo.com                        ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

`define INPUT_WIDTH 32

module cosecant_lut (quad, enable, degrees, data, rst, clk);

input [1:0] quad;
input enable;
input rst;
input [`INPUT_WIDTH-1:0] degrees ;
input clk;

//////////////inputs/////////////////

output reg [63:0] data;

//////////////output/////////////////


always@(posedge clk )

// needs to be positive in first and second quadrants


 begin
        if (quad == 2'b10 || quad == 2'b11)
        begin
        data[63] <= 1'b1;
        end

        else
        begin
        data[63] <= 1'b0;
        end
 
	if(enable)
	case (degrees)

// look up table
	  
`INPUT_WIDTH'd0  : data[62:0] <= 64'h7ff0000000000000;
`INPUT_WIDTH'd1  : data[62:0] <= 64'h404ca63b6cba7b71;
`INPUT_WIDTH'd2  : data[62:0] <= 64'h403ca7596e271c86;
`INPUT_WIDTH'd3  : data[62:0] <= 64'h40331b797e990dc0;
`INPUT_WIDTH'd4  : data[62:0] <= 64'h402cabd2100d036c;
`INPUT_WIDTH'd5  : data[62:0] <= 64'h4026f28a8ae3ab08;
`INPUT_WIDTH'd6  : data[62:0] <= 64'h4023222ff85e6006;
`INPUT_WIDTH'd7  : data[62:0] <= 64'h402069387b617567;
`INPUT_WIDTH'd8  : data[62:0] <= 64'h401cbdbe5febffb0;
`INPUT_WIDTH'd9  : data[62:0] <= 64'h401991df41de341d;
`INPUT_WIDTH'd10 : data[62:0] <= 64'h401708fb2129168e;
`INPUT_WIDTH'd11 : data[62:0] <= 64'h4014f69f90704701;
`INPUT_WIDTH'd12 : data[62:0] <= 64'h40133d2b00047f03;
`INPUT_WIDTH'd13 : data[62:0] <= 64'h4011c819f29be025;
`INPUT_WIDTH'd14 : data[62:0] <= 64'h401088c56499f439;
`INPUT_WIDTH'd15 : data[62:0] <= 64'h400ee8dd4748bf16;
`INPUT_WIDTH'd16 : data[62:0] <= 64'h400d060d6ac58d68;
`INPUT_WIDTH'd17 : data[62:0] <= 64'h400b5cc824ec982e;
`INPUT_WIDTH'd18 : data[62:0] <= 64'h4009e3779b97f4a8;
`INPUT_WIDTH'd19 : data[62:0] <= 64'h4008928aa26c4c08;
`INPUT_WIDTH'd20 : data[62:0] <= 64'h400763f38fb4cf95;
`INPUT_WIDTH'd21 : data[62:0] <= 64'h400652cbf905707a;
`INPUT_WIDTH'd22 : data[62:0] <= 64'h40055b11998752c1;
`INPUT_WIDTH'd23 : data[62:0] <= 64'h40047974b96de77f;
`INPUT_WIDTH'd24 : data[62:0] <= 64'h4003ab32fb93a3a7;
`INPUT_WIDTH'd25 : data[62:0] <= 64'h4002edfb187b1137;
`INPUT_WIDTH'd26 : data[62:0] <= 64'h40023fd71f682341;
`INPUT_WIDTH'd27 : data[62:0] <= 64'h40019f1b8c9526f0;
`INPUT_WIDTH'd28 : data[62:0] <= 64'h40010a59ff3c94be;
`INPUT_WIDTH'd29 : data[62:0] <= 64'h40008056af82561d;
`INPUT_WIDTH'd30 : data[62:0] <= 64'h4000000000000001;
`INPUT_WIDTH'd31 : data[62:0] <= 64'h3fff10cf62336e31;
`INPUT_WIDTH'd32 : data[62:0] <= 64'h3ffe317ab5700fce;
`INPUT_WIDTH'd33 : data[62:0] <= 64'h3ffd6093ce555fa8;
`INPUT_WIDTH'd34 : data[62:0] <= 64'h3ffc9cd7b485648a;
`INPUT_WIDTH'd35 : data[62:0] <= 64'h3ffbe52877982347;
`INPUT_WIDTH'd36 : data[62:0] <= 64'h3ffb38880b4603e4;
`INPUT_WIDTH'd37 : data[62:0] <= 64'h3ffa9613f8fd7862;
`INPUT_WIDTH'd38 : data[62:0] <= 64'h3ff9fd01bf93f3a3;
`INPUT_WIDTH'd39 : data[62:0] <= 64'h3ff96c9bc1d2abfe;
`INPUT_WIDTH'd40 : data[62:0] <= 64'h3ff8e43eaadf9334;
`INPUT_WIDTH'd41 : data[62:0] <= 64'h3ff863573463a809;
`INPUT_WIDTH'd42 : data[62:0] <= 64'h3ff7e9603e24eb24;
`INPUT_WIDTH'd43 : data[62:0] <= 64'h3ff775e129d20b11;
`INPUT_WIDTH'd44 : data[62:0] <= 64'h3ff7086c7026f77e;
`INPUT_WIDTH'd45 : data[62:0] <= 64'h3ff6a09e667f3bcd;
`INPUT_WIDTH'd46 : data[62:0] <= 64'h3ff63e1c2d781ada;
`INPUT_WIDTH'd47 : data[62:0] <= 64'h3ff5e092c2857578;
`INPUT_WIDTH'd48 : data[62:0] <= 64'h3ff587b62f6162b4;
`INPUT_WIDTH'd49 : data[62:0] <= 64'h3ff53340d31354d5;
`INPUT_WIDTH'd50 : data[62:0] <= 64'h3ff4e2f2c0fa463b;
`INPUT_WIDTH'd51 : data[62:0] <= 64'h3ff4969132d53892;
`INPUT_WIDTH'd52 : data[62:0] <= 64'h3ff44de60b3c3d86;
`INPUT_WIDTH'd53 : data[62:0] <= 64'h3ff408bf665efb99;
`INPUT_WIDTH'd54 : data[62:0] <= 64'h3ff3c6ef372fe94f;
`INPUT_WIDTH'd55 : data[62:0] <= 64'h3ff3884aef684af8;
`INPUT_WIDTH'd56 : data[62:0] <= 64'h3ff34cab310ac280;
`INPUT_WIDTH'd57 : data[62:0] <= 64'h3ff313eb883ae677;
`INPUT_WIDTH'd58 : data[62:0] <= 64'h3ff2ddea2c696f6a;
`INPUT_WIDTH'd59 : data[62:0] <= 64'h3ff2aa87c7f7612b;
`INPUT_WIDTH'd60 : data[62:0] <= 64'h3ff279a74590331d;
`INPUT_WIDTH'd61 : data[62:0] <= 64'h3ff24b2da2943b49;
`INPUT_WIDTH'd62 : data[62:0] <= 64'h3ff21f01c602373d;
`INPUT_WIDTH'd63 : data[62:0] <= 64'h3ff1f50c5b61511e;
`INPUT_WIDTH'd64 : data[62:0] <= 64'h3ff1cd37b13ce9c7;
`INPUT_WIDTH'd65 : data[62:0] <= 64'h3ff1a76f9ad128b7;
`INPUT_WIDTH'd66 : data[62:0] <= 64'h3ff183a154932d8b;
`INPUT_WIDTH'd67 : data[62:0] <= 64'h3ff161bb6b4a03f3;
`INPUT_WIDTH'd68 : data[62:0] <= 64'h3ff141ada5766663;
`INPUT_WIDTH'd69 : data[62:0] <= 64'h3ff12368eecf1f68;
`INPUT_WIDTH'd70 : data[62:0] <= 64'h3ff106df459ea073;
`INPUT_WIDTH'd71 : data[62:0] <= 64'h3ff0ec03a9d451e4;
`INPUT_WIDTH'd72 : data[62:0] <= 64'h3ff0d2ca0da1530d;
`INPUT_WIDTH'd73 : data[62:0] <= 64'h3ff0bb27477cf20f;
`INPUT_WIDTH'd74 : data[62:0] <= 64'h3ff0a51105712a50;
`INPUT_WIDTH'd75 : data[62:0] <= 64'h3ff0907dc1930690;
`INPUT_WIDTH'd76 : data[62:0] <= 64'h3ff07d64b78dea34;
`INPUT_WIDTH'd77 : data[62:0] <= 64'h3ff06bbddb2b91b8;
`INPUT_WIDTH'd78 : data[62:0] <= 64'h3ff05b81cfc51885;
`INPUT_WIDTH'd79 : data[62:0] <= 64'h3ff04ca9e08b8cb6;
`INPUT_WIDTH'd80 : data[62:0] <= 64'h3ff03f2ff9989907;
`INPUT_WIDTH'd81 : data[62:0] <= 64'h3ff0330ea1b99998;
`INPUT_WIDTH'd82 : data[62:0] <= 64'h3ff02840f4e91085;
`INPUT_WIDTH'd83 : data[62:0] <= 64'h3ff01ec29f6be927;
`INPUT_WIDTH'd84 : data[62:0] <= 64'h3ff0168fd9895209;
`INPUT_WIDTH'd85 : data[62:0] <= 64'h3ff00fa563d53203;
`INPUT_WIDTH'd86 : data[62:0] <= 64'h3ff00a008406617c;
`INPUT_WIDTH'd87 : data[62:0] <= 64'h3ff0059f0252e0bc;
`INPUT_WIDTH'd88 : data[62:0] <= 64'h3ff0027f274d432f;
`INPUT_WIDTH'd89 : data[62:0] <= 64'h3ff0009fba3f7835;
`INPUT_WIDTH'd90 : data[62:0] <= 64'h3ff0000000000000;


default:data <= 64'h0;

endcase

else 
  data <= 64'hxxxxxxxxxxxxxxx;



end

endmodule
/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit        ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                                ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                           ////
////                  muni_aditya@yahoo.com                        ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

`define INPUT_WIDTH 32

module cosine_lut (quad, enable, degrees, data, rst, clk);

input [1:0] quad;
input enable;
input rst;
input [`INPUT_WIDTH-1:0] degrees ;
input clk;

//////////////inputs/////////////////

output reg [63:0] data;

//////////////output/////////////////


always@(posedge clk )

//needs to be positive in first and fourth quadrants

 begin
        if (quad == 2'b01 || quad == 2'b10)
        begin
        data[63] <= 1'b1;
        end

        else
        begin
        data[63] <= 1'b0;
        end

	if(enable)
	case (degrees)

//look up table
 
`INPUT_WIDTH'd0  : data[62:0] <= 64'h3ff0000000000000;
`INPUT_WIDTH'd1  : data[62:0] <= 64'h3feffec097f5af8a;
`INPUT_WIDTH'd2  : data[62:0] <= 64'h3feffb0278bf0567;
`INPUT_WIDTH'd3  : data[62:0] <= 64'h3feff4c5ed12e61d;
`INPUT_WIDTH'd4  : data[62:0] <= 64'h3fefec0b7170fff6;
`INPUT_WIDTH'd5  : data[62:0] <= 64'h3fefe0d3b41815a2;
`INPUT_WIDTH'd6  : data[62:0] <= 64'h3fefd31f94f867c6;
`INPUT_WIDTH'd7  : data[62:0] <= 64'h3fefc2f025a23e8b;
`INPUT_WIDTH'd8  : data[62:0] <= 64'h3fefb046a930947a;
`INPUT_WIDTH'd9  : data[62:0] <= 64'h3fef9b24942fe45c;
`INPUT_WIDTH'd10 : data[62:0] <= 64'h3fef838b8c811c17;
`INPUT_WIDTH'd11 : data[62:0] <= 64'h3fef697d6938b6c2;
`INPUT_WIDTH'd12 : data[62:0] <= 64'h3fef4cfc327a0080;
`INPUT_WIDTH'd13 : data[62:0] <= 64'h3fef2e0a214e870f;
`INPUT_WIDTH'd14 : data[62:0] <= 64'h3fef0ca99f79ba25;
`INPUT_WIDTH'd15 : data[62:0] <= 64'h3feee8dd4748bf15;
`INPUT_WIDTH'd16 : data[62:0] <= 64'h3feec2a7e35e7b80;
`INPUT_WIDTH'd17 : data[62:0] <= 64'h3fee9a0c6e7bdb20;
`INPUT_WIDTH'd18 : data[62:0] <= 64'h3fee6f0e134454ff;
`INPUT_WIDTH'd19 : data[62:0] <= 64'h3fee41b02bfeb4cb;
`INPUT_WIDTH'd20 : data[62:0] <= 64'h3fee11f642522d1c;
`INPUT_WIDTH'd21 : data[62:0] <= 64'h3feddfe40effb805;
`INPUT_WIDTH'd22 : data[62:0] <= 64'h3fedab7d7997cb58;
`INPUT_WIDTH'd23 : data[62:0] <= 64'h3fed74c6982c666f;
`INPUT_WIDTH'd24 : data[62:0] <= 64'h3fed3bc3aeff7f95;
`INPUT_WIDTH'd25 : data[62:0] <= 64'h3fed0079302dd767;
`INPUT_WIDTH'd26 : data[62:0] <= 64'h3fecc2ebbb5638ca;
`INPUT_WIDTH'd27 : data[62:0] <= 64'h3fec83201d3d2c6d;
`INPUT_WIDTH'd28 : data[62:0] <= 64'h3fec411b4f6d2708;
`INPUT_WIDTH'd29 : data[62:0] <= 64'h3febfce277d339c6;
`INPUT_WIDTH'd30 : data[62:0] <= 64'h3febb67ae8584cab;
`INPUT_WIDTH'd31 : data[62:0] <= 64'h3feb6dea1e76eade;
`INPUT_WIDTH'd32 : data[62:0] <= 64'h3feb2335c2cda945;
`INPUT_WIDTH'd33 : data[62:0] <= 64'h3fead663a8ae2fdc;
`INPUT_WIDTH'd34 : data[62:0] <= 64'h3fea8779cda8eea5;
`INPUT_WIDTH'd35 : data[62:0] <= 64'h3fea367e59158747;
`INPUT_WIDTH'd36 : data[62:0] <= 64'h3fe9e3779b97f4a8;
`INPUT_WIDTH'd37 : data[62:0] <= 64'h3fe98e6c0ea27a14;
`INPUT_WIDTH'd38 : data[62:0] <= 64'h3fe9376253f463d1;
`INPUT_WIDTH'd39 : data[62:0] <= 64'h3fe8de613515a328;
`INPUT_WIDTH'd40 : data[62:0] <= 64'h3fe8836fa2cf5039;
`INPUT_WIDTH'd41 : data[62:0] <= 64'h3fe82694b4a11c37;
`INPUT_WIDTH'd42 : data[62:0] <= 64'h3fe7c7d7a833bec2;
`INPUT_WIDTH'd43 : data[62:0] <= 64'h3fe7673fe0c86982;
`INPUT_WIDTH'd44 : data[62:0] <= 64'h3fe704d4e6a54d39;
`INPUT_WIDTH'd45 : data[62:0] <= 64'h3fe6a09e667f3bcd;
`INPUT_WIDTH'd46 : data[62:0] <= 64'h3fe63aa430e07311;
`INPUT_WIDTH'd47 : data[62:0] <= 64'h3fe5d2ee398c9c2b;
`INPUT_WIDTH'd48 : data[62:0] <= 64'h3fe5698496e20bd8;
`INPUT_WIDTH'd49 : data[62:0] <= 64'h3fe4fe6f81384fd5;
`INPUT_WIDTH'd50 : data[62:0] <= 64'h3fe491b7523c161d;
`INPUT_WIDTH'd51 : data[62:0] <= 64'h3fe4236484487abe;
`INPUT_WIDTH'd52 : data[62:0] <= 64'h3fe3b37fb1bdc939;
`INPUT_WIDTH'd53 : data[62:0] <= 64'h3fe342119455beb7;
`INPUT_WIDTH'd54 : data[62:0] <= 64'h3fe2cf2304755a5e;
`INPUT_WIDTH'd55 : data[62:0] <= 64'h3fe25abcf87c4979;
`INPUT_WIDTH'd56 : data[62:0] <= 64'h3fe1e4e88411fd12;
`INPUT_WIDTH'd57 : data[62:0] <= 64'h3fe16daed770771e;
`INPUT_WIDTH'd58 : data[62:0] <= 64'h3fe0f5193eacdd2a;
`INPUT_WIDTH'd59 : data[62:0] <= 64'h3fe07b3120fddf15;
`INPUT_WIDTH'd60 : data[62:0] <= 64'h3fe0000000000001;
`INPUT_WIDTH'd61 : data[62:0] <= 64'h3fdf071eedefa0ee;
`INPUT_WIDTH'd62 : data[62:0] <= 64'h3fde0bd27424507a;
`INPUT_WIDTH'd63 : data[62:0] <= 64'h3fdd0e2e2b44de01;
`INPUT_WIDTH'd64 : data[62:0] <= 64'h3fdc0e45dabe05c9;
`INPUT_WIDTH'd65 : data[62:0] <= 64'h3fdb0c2d77379853;
`INPUT_WIDTH'd66 : data[62:0] <= 64'h3fda07f921061ad4;
`INPUT_WIDTH'd67 : data[62:0] <= 64'h3fd901bd2298ffaa;
`INPUT_WIDTH'd68 : data[62:0] <= 64'h3fd7f98deee59684;
`INPUT_WIDTH'd69 : data[62:0] <= 64'h3fd6ef801fced33a;
`INPUT_WIDTH'd70 : data[62:0] <= 64'h3fd5e3a8748a0bf7;
`INPUT_WIDTH'd71 : data[62:0] <= 64'h3fd4d61bd000cddd;
`INPUT_WIDTH'd72 : data[62:0] <= 64'h3fd3c6ef372fe950;
`INPUT_WIDTH'd73 : data[62:0] <= 64'h3fd2b637cf83d5c8;
`INPUT_WIDTH'd74 : data[62:0] <= 64'h3fd1a40add328e29;
`INPUT_WIDTH'd75 : data[62:0] <= 64'h3fd0907dc1930690;
`INPUT_WIDTH'd76 : data[62:0] <= 64'h3fcef74bf2e4b91b;
`INPUT_WIDTH'd77 : data[62:0] <= 64'h3fcccb3236cdc67a;
`INPUT_WIDTH'd78 : data[62:0] <= 64'h3fca9cd9ac4258f2;
`INPUT_WIDTH'd79 : data[62:0] <= 64'h3fc86c6ddd766253;
`INPUT_WIDTH'd80 : data[62:0] <= 64'h3fc63a1a7e0b738c;
`INPUT_WIDTH'd81 : data[62:0] <= 64'h3fc4060b67a85377;
`INPUT_WIDTH'd82 : data[62:0] <= 64'h3fc1d06c968d9e1a;
`INPUT_WIDTH'd83 : data[62:0] <= 64'h3fbf32d44c4f62d4;
`INPUT_WIDTH'd84 : data[62:0] <= 64'h3fbac2609b3c576b;
`INPUT_WIDTH'd85 : data[62:0] <= 64'h3fb64fd6b8c28110;
`INPUT_WIDTH'd86 : data[62:0] <= 64'h3fb1db8f6d6a5123;
`INPUT_WIDTH'd87 : data[62:0] <= 64'h3faacbc748efc921;
`INPUT_WIDTH'd88 : data[62:0] <= 64'h3fa1de58c9f7dc37;
`INPUT_WIDTH'd89 : data[62:0] <= 64'h3f91df0b2b89dd37;
`INPUT_WIDTH'd90 : data[62:0] <= 64'h0000000000000000;

default:data <= 64'h0;

endcase

else 
  data <= 64'hxxxxxxxxxxxxxxx;




end

endmodule
/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit        ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                                ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                           ////
////                  muni_aditya@yahoo.com                        ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

`define INPUT_WIDTH 32

module cotangent_lut (quad, enable, degrees, data, rst, clk);

input [1:0] quad;
input enable;
input rst;
input [`INPUT_WIDTH-1:0] degrees ;
input clk;

//////////////inputs/////////////////

output reg [63:0] data;

//////////////output/////////////////

always@(posedge clk )

// needs to be positive in first and third quadrants

 begin
        if (quad == 2'b01 || quad == 2'b11)
        begin
        data[63] <= 1'b1;
        end

        else
        begin
        data[63] <= 1'b0;
        end
   

	
	if(enable)
	case (degrees)
	  
//look up table

`INPUT_WIDTH'd0  : data[62:0] <= 64'h7ff0000000000000;
`INPUT_WIDTH'd1  : data[62:0] <= 64'h404ca51d76749a71;
`INPUT_WIDTH'd2  : data[62:0] <= 64'h403ca2e17ec2185c;
`INPUT_WIDTH'd3  : data[62:0] <= 64'h403314c55fbc4c67;
`INPUT_WIDTH'd4  : data[62:0] <= 64'h402c99f0ed772d4c;
`INPUT_WIDTH'd5  : data[62:0] <= 64'h4026dc2fd0bfdbe2;
`INPUT_WIDTH'd6  : data[62:0] <= 64'h4023075ac71a38c7;
`INPUT_WIDTH'd7  : data[62:0] <= 64'h402049e7c666e3fe;
`INPUT_WIDTH'd8  : data[62:0] <= 64'h401c76237b025ae8;
`INPUT_WIDTH'd9  : data[62:0] <= 64'h4019414813ba662c;
`INPUT_WIDTH'd10 : data[62:0] <= 64'h4016af648056a136;
`INPUT_WIDTH'd11 : data[62:0] <= 64'h40149405f7cc644c;
`INPUT_WIDTH'd12 : data[62:0] <= 64'h4012d18a8e2ff28c;
`INPUT_WIDTH'd13 : data[62:0] <= 64'h4011536e695dda95;
`INPUT_WIDTH'd14 : data[62:0] <= 64'h40100b0a2833d3c4;
`INPUT_WIDTH'd15 : data[62:0] <= 64'h400ddb3d742c2656;
`INPUT_WIDTH'd16 : data[62:0] <= 64'h400be6398b3f2869;
`INPUT_WIDTH'd17 : data[62:0] <= 64'h400a2ab4c713671e;
`INPUT_WIDTH'd18 : data[62:0] <= 64'h40089f188bdcd7b0;
`INPUT_WIDTH'd19 : data[62:0] <= 64'h40073bd2e9a270e0;
`INPUT_WIDTH'd20 : data[62:0] <= 64'h4005fad570f872d9;
`INPUT_WIDTH'd21 : data[62:0] <= 64'h4004d738ef803784;
`INPUT_WIDTH'd22 : data[62:0] <= 64'h4003ccfa561175d6;
`INPUT_WIDTH'd23 : data[62:0] <= 64'h4002d8c9200b5686;
`INPUT_WIDTH'd24 : data[62:0] <= 64'h4001f7e220cc4172;
`INPUT_WIDTH'd25 : data[62:0] <= 64'h400127f33e8d12e5;
`INPUT_WIDTH'd26 : data[62:0] <= 64'h40006705b35391e8;
`INPUT_WIDTH'd27 : data[62:0] <= 64'h3fff66da45fee3f1;
`INPUT_WIDTH'd28 : data[62:0] <= 64'h3ffe1774a2562593;
`INPUT_WIDTH'd29 : data[62:0] <= 64'h3ffcdd612dd501f4;
`INPUT_WIDTH'd30 : data[62:0] <= 64'h3ffbb67ae8584cab;
`INPUT_WIDTH'd31 : data[62:0] <= 64'h3ffaa0e385c196ab;
`INPUT_WIDTH'd32 : data[62:0] <= 64'h3ff99af8610e4105;
`INPUT_WIDTH'd33 : data[62:0] <= 64'h3ff8a34971bd7010;
`INPUT_WIDTH'd34 : data[62:0] <= 64'h3ff7b891d9a169b4;
`INPUT_WIDTH'd35 : data[62:0] <= 64'h3ff6d9b1b96ce128;
`INPUT_WIDTH'd36 : data[62:0] <= 64'h3ff605a90c73ab79;
`INPUT_WIDTH'd37 : data[62:0] <= 64'h3ff53b9359d2f919;
`INPUT_WIDTH'd38 : data[62:0] <= 64'h3ff47aa413b0ee1e;
`INPUT_WIDTH'd39 : data[62:0] <= 64'h3ff3c2238553dcee;
`INPUT_WIDTH'd40 : data[62:0] <= 64'h3ff3116c3711527e;
`INPUT_WIDTH'd41 : data[62:0] <= 64'h3ff267e8b3f5da82;
`INPUT_WIDTH'd42 : data[62:0] <= 64'h3ff1c511a0db83e3;
`INPUT_WIDTH'd43 : data[62:0] <= 64'h3ff1286c17acf49b;
`INPUT_WIDTH'd44 : data[62:0] <= 64'h3ff091883bfbf42e;
`INPUT_WIDTH'd45 : data[62:0] <= 64'h3ff0000000000001;
`INPUT_WIDTH'd46 : data[62:0] <= 64'h3feee6ec253d2464;
`INPUT_WIDTH'd47 : data[62:0] <= 64'h3fedd729e0bf9cb6;
`INPUT_WIDTH'd48 : data[62:0] <= 64'h3fecd01c246e4060;
`INPUT_WIDTH'd49 : data[62:0] <= 64'h3febd1326bb88d13;
`INPUT_WIDTH'd50 : data[62:0] <= 64'h3fead9e7783fbf1e;
`INPUT_WIDTH'd51 : data[62:0] <= 64'h3fe9e9c0346ca839;
`INPUT_WIDTH'd52 : data[62:0] <= 64'h3fe9004ab6d5cc93;
`INPUT_WIDTH'd53 : data[62:0] <= 64'h3fe81d1d621eb711;
`INPUT_WIDTH'd54 : data[62:0] <= 64'h3fe73fd61d9df544;
`INPUT_WIDTH'd55 : data[62:0] <= 64'h3fe66819a3a0bf7b;
`INPUT_WIDTH'd56 : data[62:0] <= 64'h3fe59592e296c625;
`INPUT_WIDTH'd57 : data[62:0] <= 64'h3fe4c7f26ed1d60f;
`INPUT_WIDTH'd58 : data[62:0] <= 64'h3fe3feee02d72514;
`INPUT_WIDTH'd59 : data[62:0] <= 64'h3fe33a400c85af9f;
`INPUT_WIDTH'd60 : data[62:0] <= 64'h3fe279a74590331e;
`INPUT_WIDTH'd61 : data[62:0] <= 64'h3fe1bce655fbb9bf;
`INPUT_WIDTH'd62 : data[62:0] <= 64'h3fe103c37f7ebedc;
`INPUT_WIDTH'd63 : data[62:0] <= 64'h3fe04e0850c1dd5d;
`INPUT_WIDTH'd64 : data[62:0] <= 64'h3fdf3702bf455cf5;
`INPUT_WIDTH'd65 : data[62:0] <= 64'h3fddd7fc13699ab1;
`INPUT_WIDTH'd66 : data[62:0] <= 64'h3fdc7ea074a90a11;
`INPUT_WIDTH'd67 : data[62:0] <= 64'h3fdb2a986b66229e;
`INPUT_WIDTH'd68 : data[62:0] <= 64'h3fd9db90d0ac0d44;
`INPUT_WIDTH'd69 : data[62:0] <= 64'h3fd8913a75259d04;
`INPUT_WIDTH'd70 : data[62:0] <= 64'h3fd74b49cf3902d6;
`INPUT_WIDTH'd71 : data[62:0] <= 64'h3fd60976af8c1614;
`INPUT_WIDTH'd72 : data[62:0] <= 64'h3fd4cb7bfb4961b0;
`INPUT_WIDTH'd73 : data[62:0] <= 64'h3fd391176b8feb5b;
`INPUT_WIDTH'd74 : data[62:0] <= 64'h3fd25a0951873b22;
`INPUT_WIDTH'd75 : data[62:0] <= 64'h3fd126145e9ecd56;
`INPUT_WIDTH'd76 : data[62:0] <= 64'h3fcfe9fae1181f52;
`INPUT_WIDTH'd77 : data[62:0] <= 64'h3fcd8d16c1491599;
`INPUT_WIDTH'd78 : data[62:0] <= 64'h3fcb350dac762348;
`INPUT_WIDTH'd79 : data[62:0] <= 64'h3fc8e174375dceba;
`INPUT_WIDTH'd80 : data[62:0] <= 64'h3fc691e1ebc5cbbf;
`INPUT_WIDTH'd81 : data[62:0] <= 64'h3fc445f0fbb1cf93;
`INPUT_WIDTH'd82 : data[62:0] <= 64'h3fc1fd3df8664fe6;
`INPUT_WIDTH'd83 : data[62:0] <= 64'h3fbf6ecf19881d32;
`INPUT_WIDTH'd84 : data[62:0] <= 64'h3fbae81c75231d96;
`INPUT_WIDTH'd85 : data[62:0] <= 64'h3fb665a8349d55ee;
`INPUT_WIDTH'd86 : data[62:0] <= 64'h3fb1e6b93a6931ff;
`INPUT_WIDTH'd87 : data[62:0] <= 64'h3faad53144273e86;
`INPUT_WIDTH'd88 : data[62:0] <= 64'h3fa1e12295d61fd2;
`INPUT_WIDTH'd89 : data[62:0] <= 64'h3f91dfbd9410a43b;
`INPUT_WIDTH'd90 : data[62:0] <= 64'h0000000000000000;


default:data <= 64'h0;

endcase

else 
  data <= 64'hxxxxxxxxxxxxxxx;



end


endmodule
/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit        ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                                ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                           ////
////                  muni_aditya@yahoo.com                        ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

`define INPUT_WIDTH 32
 


module dividor (clk, inp, rst, out);
  
  input clk;
  input [`INPUT_WIDTH-1:0] inp;
  input rst;

//////////////inputs/////////////////

  output  reg [`INPUT_WIDTH-1:0] out;

//////////////output/////////////////  
  
 wire [`INPUT_WIDTH-1:0]DIVISOR = `INPUT_WIDTH'd360 ;
 
  
  always @ (posedge clk)

// modulo division 

   if(rst)
     out <= 8'd0 ;
   else 
    out <= inp % DIVISOR ;
    
    

   
     
 endmodule
  
/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit        ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                                ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                           ////
////                  muni_aditya@yahoo.com                        ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

`define INPUT_WIDTH 32

module secant_lut (quad, enable, degrees, data, rst, clk);

input [1:0] quad;
input enable;
input rst;
input [`INPUT_WIDTH-1:0] degrees ;
input clk;

//////////////inputs/////////////////

output reg [63:0] data;

//////////////output/////////////////


always@(posedge clk )

//needs to be positive in first and fourth quadrants

 begin
        if (quad == 2'b01 || quad == 2'b10)
        begin
        data[63] <= 1'b1;
        end

        else
        begin
        data[63] <= 1'b0;
        end

	if(enable)
	case (degrees)

// look up table
	  
`INPUT_WIDTH'd0  : data[62:0] <= 64'h3ff0000000000000;
`INPUT_WIDTH'd1  : data[62:0] <= 64'h3ff0009fba3f7835;
`INPUT_WIDTH'd2  : data[62:0] <= 64'h3ff0027f274d432f;
`INPUT_WIDTH'd3  : data[62:0] <= 64'h3ff0059f0252e0bc;
`INPUT_WIDTH'd4  : data[62:0] <= 64'h3ff00a008406617c;
`INPUT_WIDTH'd5  : data[62:0] <= 64'h3ff00fa563d53203;
`INPUT_WIDTH'd6  : data[62:0] <= 64'h3ff0168fd9895209;
`INPUT_WIDTH'd7  : data[62:0] <= 64'h3ff01ec29f6be927;
`INPUT_WIDTH'd8  : data[62:0] <= 64'h3ff02840f4e91085;
`INPUT_WIDTH'd9  : data[62:0] <= 64'h3ff0330ea1b99998;
`INPUT_WIDTH'd10 : data[62:0] <= 64'h3ff03f2ff9989907;
`INPUT_WIDTH'd11 : data[62:0] <= 64'h3ff04ca9e08b8cb6;
`INPUT_WIDTH'd12 : data[62:0] <= 64'h3ff05b81cfc51885;
`INPUT_WIDTH'd13 : data[62:0] <= 64'h3ff06bbddb2b91b8;
`INPUT_WIDTH'd14 : data[62:0] <= 64'h3ff07d64b78dea34;
`INPUT_WIDTH'd15 : data[62:0] <= 64'h3ff0907dc1930690;
`INPUT_WIDTH'd16 : data[62:0] <= 64'h3ff0a51105712a50;
`INPUT_WIDTH'd17 : data[62:0] <= 64'h3ff0bb27477cf20f;
`INPUT_WIDTH'd18 : data[62:0] <= 64'h3ff0d2ca0da1530d;
`INPUT_WIDTH'd19 : data[62:0] <= 64'h3ff0ec03a9d451e4;
`INPUT_WIDTH'd20 : data[62:0] <= 64'h3ff106df459ea072;
`INPUT_WIDTH'd21 : data[62:0] <= 64'h3ff12368eecf1f68;
`INPUT_WIDTH'd22 : data[62:0] <= 64'h3ff141ada5766662;
`INPUT_WIDTH'd23 : data[62:0] <= 64'h3ff161bb6b4a03f3;
`INPUT_WIDTH'd24 : data[62:0] <= 64'h3ff183a154932d8b;
`INPUT_WIDTH'd25 : data[62:0] <= 64'h3ff1a76f9ad128b7;
`INPUT_WIDTH'd26 : data[62:0] <= 64'h3ff1cd37b13ce9c7;
`INPUT_WIDTH'd27 : data[62:0] <= 64'h3ff1f50c5b61511e;
`INPUT_WIDTH'd28 : data[62:0] <= 64'h3ff21f01c602373c;
`INPUT_WIDTH'd29 : data[62:0] <= 64'h3ff24b2da2943b49;
`INPUT_WIDTH'd30 : data[62:0] <= 64'h3ff279a74590331c;
`INPUT_WIDTH'd31 : data[62:0] <= 64'h3ff2aa87c7f7612a;
`INPUT_WIDTH'd32 : data[62:0] <= 64'h3ff2ddea2c696f6a;
`INPUT_WIDTH'd33 : data[62:0] <= 64'h3ff313eb883ae676;
`INPUT_WIDTH'd34 : data[62:0] <= 64'h3ff34cab310ac280;
`INPUT_WIDTH'd35 : data[62:0] <= 64'h3ff3884aef684af8;
`INPUT_WIDTH'd36 : data[62:0] <= 64'h3ff3c6ef372fe94f;
`INPUT_WIDTH'd37 : data[62:0] <= 64'h3ff408bf665efb99;
`INPUT_WIDTH'd38 : data[62:0] <= 64'h3ff44de60b3c3d86;
`INPUT_WIDTH'd39 : data[62:0] <= 64'h3ff4969132d53891;
`INPUT_WIDTH'd40 : data[62:0] <= 64'h3ff4e2f2c0fa463b;
`INPUT_WIDTH'd41 : data[62:0] <= 64'h3ff53340d31354d4;
`INPUT_WIDTH'd42 : data[62:0] <= 64'h3ff587b62f6162b3;
`INPUT_WIDTH'd43 : data[62:0] <= 64'h3ff5e092c2857578;
`INPUT_WIDTH'd44 : data[62:0] <= 64'h3ff63e1c2d781ad9;
`INPUT_WIDTH'd45 : data[62:0] <= 64'h3ff6a09e667f3bcc;
`INPUT_WIDTH'd46 : data[62:0] <= 64'h3ff7086c7026f77d;
`INPUT_WIDTH'd47 : data[62:0] <= 64'h3ff775e129d20b11;
`INPUT_WIDTH'd48 : data[62:0] <= 64'h3ff7e9603e24eb24;
`INPUT_WIDTH'd49 : data[62:0] <= 64'h3ff863573463a808;
`INPUT_WIDTH'd50 : data[62:0] <= 64'h3ff8e43eaadf9333;
`INPUT_WIDTH'd51 : data[62:0] <= 64'h3ff96c9bc1d2abfe;
`INPUT_WIDTH'd52 : data[62:0] <= 64'h3ff9fd01bf93f3a3;
`INPUT_WIDTH'd53 : data[62:0] <= 64'h3ffa9613f8fd7861;
`INPUT_WIDTH'd54 : data[62:0] <= 64'h3ffb38880b4603e4;
`INPUT_WIDTH'd55 : data[62:0] <= 64'h3ffbe52877982345;
`INPUT_WIDTH'd56 : data[62:0] <= 64'h3ffc9cd7b485648a;
`INPUT_WIDTH'd57 : data[62:0] <= 64'h3ffd6093ce555fa5;
`INPUT_WIDTH'd58 : data[62:0] <= 64'h3ffe317ab5700fce;
`INPUT_WIDTH'd59 : data[62:0] <= 64'h3fff10cf62336e2d;
`INPUT_WIDTH'd60 : data[62:0] <= 64'h3ffffffffffffffe;
`INPUT_WIDTH'd61 : data[62:0] <= 64'h40008056af82561c;
`INPUT_WIDTH'd62 : data[62:0] <= 64'h40010a59ff3c94be;
`INPUT_WIDTH'd63 : data[62:0] <= 64'h40019f1b8c9526ef;
`INPUT_WIDTH'd64 : data[62:0] <= 64'h40023fd71f682340;
`INPUT_WIDTH'd65 : data[62:0] <= 64'h4002edfb187b1137;
`INPUT_WIDTH'd66 : data[62:0] <= 64'h4003ab32fb93a3a4;
`INPUT_WIDTH'd67 : data[62:0] <= 64'h40047974b96de77f;
`INPUT_WIDTH'd68 : data[62:0] <= 64'h40055b11998752bf;
`INPUT_WIDTH'd69 : data[62:0] <= 64'h400652cbf905707c;
`INPUT_WIDTH'd70 : data[62:0] <= 64'h400763f38fb4cf92;
`INPUT_WIDTH'd71 : data[62:0] <= 64'h4008928aa26c4c06;
`INPUT_WIDTH'd72 : data[62:0] <= 64'h4009e3779b97f4a7;
`INPUT_WIDTH'd73 : data[62:0] <= 64'h400b5cc824ec982d;
`INPUT_WIDTH'd74 : data[62:0] <= 64'h400d060d6ac58d68;
`INPUT_WIDTH'd75 : data[62:0] <= 64'h400ee8dd4748bf16;
`INPUT_WIDTH'd76 : data[62:0] <= 64'h401088c56499f43a;
`INPUT_WIDTH'd77 : data[62:0] <= 64'h4011c819f29be021;
`INPUT_WIDTH'd78 : data[62:0] <= 64'h40133d2b00047f05;
`INPUT_WIDTH'd79 : data[62:0] <= 64'h4014f69f907046fe;
`INPUT_WIDTH'd80 : data[62:0] <= 64'h401708fb2129168b;
`INPUT_WIDTH'd81 : data[62:0] <= 64'h401991df41de341a;
`INPUT_WIDTH'd82 : data[62:0] <= 64'h401cbdbe5febffaf;
`INPUT_WIDTH'd83 : data[62:0] <= 64'h402069387b617567;
`INPUT_WIDTH'd84 : data[62:0] <= 64'h4023222ff85e6006;
`INPUT_WIDTH'd85 : data[62:0] <= 64'h4026f28a8ae3aafa;
`INPUT_WIDTH'd86 : data[62:0] <= 64'h402cabd2100d0374;
`INPUT_WIDTH'd87 : data[62:0] <= 64'h40331b797e990db2;
`INPUT_WIDTH'd88 : data[62:0] <= 64'h403ca7596e271c6c;
`INPUT_WIDTH'd89 : data[62:0] <= 64'h404ca63b6cba7b49;
`INPUT_WIDTH'd90 : data[62:0] <= 64'h7ff0000000000000;


default:data <= 64'h0;

endcase

else 
  data <= 64'hxxxxxxxxxxxxxxx;



end

endmodule
/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit        ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                                ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                           ////
////                  muni_aditya@yahoo.com                        ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

`define INPUT_WIDTH 32

module sine_lut (quad, enable, degrees, data, rst, clk);

input [1:0] quad;
input enable;
input rst;
input [`INPUT_WIDTH-1:0] degrees ;
input clk;

//////////////inputs/////////////////

output reg [63:0] data;

//////////////output/////////////////


always@(posedge clk )

// needs to be positive in first and second quadrants

   
   begin
        if (quad == 2'b10 || quad == 2'b11)
        begin
        data[63] <= 1'b1;
        end

        else
        begin
        data[63] <= 1'b0;
        end

	if(enable)
	case (degrees)
 
//look up table

`INPUT_WIDTH'd0  : data[62:0] <= 64'h0000000000000000;
`INPUT_WIDTH'd1  : data[62:0] <= 64'h3f91df0b2b89dd1e;
`INPUT_WIDTH'd2  : data[62:0] <= 64'h3fa1de58c9f7dc27;
`INPUT_WIDTH'd3  : data[62:0] <= 64'h3faacbc748efc90d;
`INPUT_WIDTH'd4  : data[62:0] <= 64'h3fb1db8f6d6a5128;
`INPUT_WIDTH'd5  : data[62:0] <= 64'h3fb64fd6b8c28102;
`INPUT_WIDTH'd6  : data[62:0] <= 64'h3fbac2609b3c576b;
`INPUT_WIDTH'd7  : data[62:0] <= 64'h3fbf32d44c4f62d3;
`INPUT_WIDTH'd8  : data[62:0] <= 64'h3fc1d06c968d9e19;
`INPUT_WIDTH'd9  : data[62:0] <= 64'h3fc4060b67a85375;
`INPUT_WIDTH'd10 : data[62:0] <= 64'h3fc63a1a7e0b7389;
`INPUT_WIDTH'd11 : data[62:0] <= 64'h3fc86c6ddd76624f;
`INPUT_WIDTH'd12 : data[62:0] <= 64'h3fca9cd9ac4258f5;
`INPUT_WIDTH'd13 : data[62:0] <= 64'h3fcccb3236cdc674;
`INPUT_WIDTH'd14 : data[62:0] <= 64'h3fcef74bf2e4b91d;
`INPUT_WIDTH'd15 : data[62:0] <= 64'h3fd0907dc1930690;
`INPUT_WIDTH'd16 : data[62:0] <= 64'h3fd1a40add328e29;
`INPUT_WIDTH'd17 : data[62:0] <= 64'h3fd2b637cf83d5c7;
`INPUT_WIDTH'd18 : data[62:0] <= 64'h3fd3c6ef372fe94f;
`INPUT_WIDTH'd19 : data[62:0] <= 64'h3fd4d61bd000cddc;
`INPUT_WIDTH'd20 : data[62:0] <= 64'h3fd5e3a8748a0bf5;
`INPUT_WIDTH'd21 : data[62:0] <= 64'h3fd6ef801fced33c;
`INPUT_WIDTH'd22 : data[62:0] <= 64'h3fd7f98deee59681;
`INPUT_WIDTH'd23 : data[62:0] <= 64'h3fd901bd2298ffaa;
`INPUT_WIDTH'd24 : data[62:0] <= 64'h3fda07f921061ad0;
`INPUT_WIDTH'd25 : data[62:0] <= 64'h3fdb0c2d77379853;
`INPUT_WIDTH'd26 : data[62:0] <= 64'h3fdc0e45dabe05c8;
`INPUT_WIDTH'd27 : data[62:0] <= 64'h3fdd0e2e2b44de00;
`INPUT_WIDTH'd28 : data[62:0] <= 64'h3fde0bd274245079;
`INPUT_WIDTH'd29 : data[62:0] <= 64'h3fdf071eedefa0ed;
`INPUT_WIDTH'd30 : data[62:0] <= 64'h3fdfffffffffffff;
`INPUT_WIDTH'd31 : data[62:0] <= 64'h3fe07b3120fddf13;
`INPUT_WIDTH'd32 : data[62:0] <= 64'h3fe0f5193eacdd2a;
`INPUT_WIDTH'd33 : data[62:0] <= 64'h3fe16daed770771c;
`INPUT_WIDTH'd34 : data[62:0] <= 64'h3fe1e4e88411fd12;
`INPUT_WIDTH'd35 : data[62:0] <= 64'h3fe25abcf87c4978;
`INPUT_WIDTH'd36 : data[62:0] <= 64'h3fe2cf2304755a5e;
`INPUT_WIDTH'd37 : data[62:0] <= 64'h3fe342119455beb6;
`INPUT_WIDTH'd38 : data[62:0] <= 64'h3fe3b37fb1bdc939;
`INPUT_WIDTH'd39 : data[62:0] <= 64'h3fe4236484487abe;
`INPUT_WIDTH'd40 : data[62:0] <= 64'h3fe491b7523c161c;
`INPUT_WIDTH'd41 : data[62:0] <= 64'h3fe4fe6f81384fd4;
`INPUT_WIDTH'd42 : data[62:0] <= 64'h3fe5698496e20bd8;
`INPUT_WIDTH'd43 : data[62:0] <= 64'h3fe5d2ee398c9c2b;
`INPUT_WIDTH'd44 : data[62:0] <= 64'h3fe63aa430e07310;
`INPUT_WIDTH'd45 : data[62:0] <= 64'h3fe6a09e667f3bcc;
`INPUT_WIDTH'd46 : data[62:0] <= 64'h3fe704d4e6a54d38;
`INPUT_WIDTH'd47 : data[62:0] <= 64'h3fe7673fe0c86982;
`INPUT_WIDTH'd48 : data[62:0] <= 64'h3fe7c7d7a833bec1;
`INPUT_WIDTH'd49 : data[62:0] <= 64'h3fe82694b4a11c36;
`INPUT_WIDTH'd50 : data[62:0] <= 64'h3fe8836fa2cf5039;
`INPUT_WIDTH'd51 : data[62:0] <= 64'h3fe8de613515a327;
`INPUT_WIDTH'd52 : data[62:0] <= 64'h3fe9376253f463d1;
`INPUT_WIDTH'd53 : data[62:0] <= 64'h3fe98e6c0ea27a14;
`INPUT_WIDTH'd54 : data[62:0] <= 64'h3fe9e3779b97f4a8;
`INPUT_WIDTH'd55 : data[62:0] <= 64'h3fea367e59158747;
`INPUT_WIDTH'd56 : data[62:0] <= 64'h3fea8779cda8eea5;
`INPUT_WIDTH'd57 : data[62:0] <= 64'h3fead663a8ae2fdb;
`INPUT_WIDTH'd58 : data[62:0] <= 64'h3feb2335c2cda945;
`INPUT_WIDTH'd59 : data[62:0] <= 64'h3feb6dea1e76eadd;
`INPUT_WIDTH'd60 : data[62:0] <= 64'h3febb67ae8584caa;
`INPUT_WIDTH'd61 : data[62:0] <= 64'h3febfce277d339c6;
`INPUT_WIDTH'd62 : data[62:0] <= 64'h3fec411b4f6d2707;
`INPUT_WIDTH'd63 : data[62:0] <= 64'h3fec83201d3d2c6c;
`INPUT_WIDTH'd64 : data[62:0] <= 64'h3fecc2ebbb5638ca;
`INPUT_WIDTH'd65 : data[62:0] <= 64'h3fed0079302dd767;
`INPUT_WIDTH'd66 : data[62:0] <= 64'h3fed3bc3aeff7f95;
`INPUT_WIDTH'd67 : data[62:0] <= 64'h3fed74c6982c666f;
`INPUT_WIDTH'd68 : data[62:0] <= 64'h3fedab7d7997cb57;
`INPUT_WIDTH'd69 : data[62:0] <= 64'h3feddfe40effb805;
`INPUT_WIDTH'd70 : data[62:0] <= 64'h3fee11f642522d1b;
`INPUT_WIDTH'd71 : data[62:0] <= 64'h3fee41b02bfeb4ca;
`INPUT_WIDTH'd72 : data[62:0] <= 64'h3fee6f0e134454ff;
`INPUT_WIDTH'd73 : data[62:0] <= 64'h3fee9a0c6e7bdb1f;
`INPUT_WIDTH'd74 : data[62:0] <= 64'h3feec2a7e35e7b80;
`INPUT_WIDTH'd75 : data[62:0] <= 64'h3feee8dd4748bf15;
`INPUT_WIDTH'd76 : data[62:0] <= 64'h3fef0ca99f79ba25;
`INPUT_WIDTH'd77 : data[62:0] <= 64'h3fef2e0a214e870f;
`INPUT_WIDTH'd78 : data[62:0] <= 64'h3fef4cfc327a0080;
`INPUT_WIDTH'd79 : data[62:0] <= 64'h3fef697d6938b6c2;
`INPUT_WIDTH'd80 : data[62:0] <= 64'h3fef838b8c811c17;
`INPUT_WIDTH'd81 : data[62:0] <= 64'h3fef9b24942fe45c;
`INPUT_WIDTH'd82 : data[62:0] <= 64'h3fefb046a930947a;
`INPUT_WIDTH'd83 : data[62:0] <= 64'h3fefc2f025a23e8b;
`INPUT_WIDTH'd84 : data[62:0] <= 64'h3fefd31f94f867c6;
`INPUT_WIDTH'd85 : data[62:0] <= 64'h3fefe0d3b41815a2;
`INPUT_WIDTH'd86 : data[62:0] <= 64'h3fefec0b7170fff6;
`INPUT_WIDTH'd87 : data[62:0] <= 64'h3feff4c5ed12e61d;
`INPUT_WIDTH'd88 : data[62:0] <= 64'h3feffb0278bf0567;
`INPUT_WIDTH'd89 : data[62:0] <= 64'h3feffec097f5af8a;
`INPUT_WIDTH'd90 : data[62:0] <= 64'h3ff0000000000000;

default:data <= 64'h0;

endcase

else 
  data <= 64'hxxxxxxxxxxxxxxx;



end


endmodule
/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit        ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                                ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                           ////
////                  muni_aditya@yahoo.com                        ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

`define INPUT_WIDTH 32

module tangent_lut (quad, enable, degrees, data, rst, clk);

input [1:0] quad;
input enable;
input rst;
input clk;
input [`INPUT_WIDTH-1:0] degrees ;

//////////////inputs/////////////////

output reg [63:0] data;

//////////////output/////////////////


always@(posedge clk )

// needs to be positive in first and third quadrants

 begin
        if (quad == 2'b01 || quad == 2'b11)
        begin
        data[63] <= 1'b1;
        end

        else
        begin
        data[63] <= 1'b0;
        end

	if(enable)
	case (degrees)

// look up table
	  
`INPUT_WIDTH'd0  : data[62:0] <= 64'h0000000000000000;
`INPUT_WIDTH'd1  : data[62:0] <= 64'h3f91dfbd9410a422;
`INPUT_WIDTH'd2  : data[62:0] <= 64'h3fa1e12295d61fc2;
`INPUT_WIDTH'd3  : data[62:0] <= 64'h3faad53144273e71;
`INPUT_WIDTH'd4  : data[62:0] <= 64'h3fb1e6b93a693204;
`INPUT_WIDTH'd5  : data[62:0] <= 64'h3fb665a8349d55e1;
`INPUT_WIDTH'd6  : data[62:0] <= 64'h3fbae81c75231d97;
`INPUT_WIDTH'd7  : data[62:0] <= 64'h3fbf6ecf19881d32;
`INPUT_WIDTH'd8  : data[62:0] <= 64'h3fc1fd3df8664fe5;
`INPUT_WIDTH'd9  : data[62:0] <= 64'h3fc445f0fbb1cf91;
`INPUT_WIDTH'd10 : data[62:0] <= 64'h3fc691e1ebc5cbbc;
`INPUT_WIDTH'd11 : data[62:0] <= 64'h3fc8e174375dceb6;
`INPUT_WIDTH'd12 : data[62:0] <= 64'h3fcb350dac76234b;
`INPUT_WIDTH'd13 : data[62:0] <= 64'h3fcd8d16c1491593;
`INPUT_WIDTH'd14 : data[62:0] <= 64'h3fcfe9fae1181f54;
`INPUT_WIDTH'd15 : data[62:0] <= 64'h3fd126145e9ecd56;
`INPUT_WIDTH'd16 : data[62:0] <= 64'h3fd25a0951873b22;
`INPUT_WIDTH'd17 : data[62:0] <= 64'h3fd391176b8feb5a;
`INPUT_WIDTH'd18 : data[62:0] <= 64'h3fd4cb7bfb4961ae;
`INPUT_WIDTH'd19 : data[62:0] <= 64'h3fd60976af8c1613;
`INPUT_WIDTH'd20 : data[62:0] <= 64'h3fd74b49cf3902d4;
`INPUT_WIDTH'd21 : data[62:0] <= 64'h3fd8913a75259d06;
`INPUT_WIDTH'd22 : data[62:0] <= 64'h3fd9db90d0ac0d40;
`INPUT_WIDTH'd23 : data[62:0] <= 64'h3fdb2a986b66229e;
`INPUT_WIDTH'd24 : data[62:0] <= 64'h3fdc7ea074a90a0c;
`INPUT_WIDTH'd25 : data[62:0] <= 64'h3fddd7fc13699ab1;
`INPUT_WIDTH'd26 : data[62:0] <= 64'h3fdf3702bf455cf3;
`INPUT_WIDTH'd27 : data[62:0] <= 64'h3fe04e0850c1dd5c;
`INPUT_WIDTH'd28 : data[62:0] <= 64'h3fe103c37f7ebedc;
`INPUT_WIDTH'd29 : data[62:0] <= 64'h3fe1bce655fbb9bf;
`INPUT_WIDTH'd30 : data[62:0] <= 64'h3fe279a74590331c;
`INPUT_WIDTH'd31 : data[62:0] <= 64'h3fe33a400c85af9d;
`INPUT_WIDTH'd32 : data[62:0] <= 64'h3fe3feee02d72515;
`INPUT_WIDTH'd33 : data[62:0] <= 64'h3fe4c7f26ed1d60d;
`INPUT_WIDTH'd34 : data[62:0] <= 64'h3fe59592e296c624;
`INPUT_WIDTH'd35 : data[62:0] <= 64'h3fe66819a3a0bf7a;
`INPUT_WIDTH'd36 : data[62:0] <= 64'h3fe73fd61d9df543;
`INPUT_WIDTH'd37 : data[62:0] <= 64'h3fe81d1d621eb710;
`INPUT_WIDTH'd38 : data[62:0] <= 64'h3fe9004ab6d5cc92;
`INPUT_WIDTH'd39 : data[62:0] <= 64'h3fe9e9c0346ca838;
`INPUT_WIDTH'd40 : data[62:0] <= 64'h3fead9e7783fbf1d;
`INPUT_WIDTH'd41 : data[62:0] <= 64'h3febd1326bb88d11;
`INPUT_WIDTH'd42 : data[62:0] <= 64'h3fecd01c246e405f;
`INPUT_WIDTH'd43 : data[62:0] <= 64'h3fedd729e0bf9cb7;
`INPUT_WIDTH'd44 : data[62:0] <= 64'h3feee6ec253d2462;
`INPUT_WIDTH'd45 : data[62:0] <= 64'h3fefffffffffffff;
`INPUT_WIDTH'd46 : data[62:0] <= 64'h3ff091883bfbf42d;
`INPUT_WIDTH'd47 : data[62:0] <= 64'h3ff1286c17acf49c;
`INPUT_WIDTH'd48 : data[62:0] <= 64'h3ff1c511a0db83e2;
`INPUT_WIDTH'd49 : data[62:0] <= 64'h3ff267e8b3f5da80;
`INPUT_WIDTH'd50 : data[62:0] <= 64'h3ff3116c3711527e;
`INPUT_WIDTH'd51 : data[62:0] <= 64'h3ff3c2238553dced;
`INPUT_WIDTH'd52 : data[62:0] <= 64'h3ff47aa413b0ee1d;
`INPUT_WIDTH'd53 : data[62:0] <= 64'h3ff53b9359d2f918;
`INPUT_WIDTH'd54 : data[62:0] <= 64'h3ff605a90c73ab78;
`INPUT_WIDTH'd55 : data[62:0] <= 64'h3ff6d9b1b96ce127;
`INPUT_WIDTH'd56 : data[62:0] <= 64'h3ff7b891d9a169b3;
`INPUT_WIDTH'd57 : data[62:0] <= 64'h3ff8a34971bd700d;
`INPUT_WIDTH'd58 : data[62:0] <= 64'h3ff99af8610e4106;
`INPUT_WIDTH'd59 : data[62:0] <= 64'h3ffaa0e385c196a8;
`INPUT_WIDTH'd60 : data[62:0] <= 64'h3ffbb67ae8584ca8;
`INPUT_WIDTH'd61 : data[62:0] <= 64'h3ffcdd612dd501f3;
`INPUT_WIDTH'd62 : data[62:0] <= 64'h3ffe1774a2562592;
`INPUT_WIDTH'd63 : data[62:0] <= 64'h3fff66da45fee3f0;
`INPUT_WIDTH'd64 : data[62:0] <= 64'h40006705b35391e7;
`INPUT_WIDTH'd65 : data[62:0] <= 64'h400127f33e8d12e5;
`INPUT_WIDTH'd66 : data[62:0] <= 64'h4001f7e220cc416f;
`INPUT_WIDTH'd67 : data[62:0] <= 64'h4002d8c9200b5686;
`INPUT_WIDTH'd68 : data[62:0] <= 64'h4003ccfa561175d3;
`INPUT_WIDTH'd69 : data[62:0] <= 64'h4004d738ef803785;
`INPUT_WIDTH'd70 : data[62:0] <= 64'h4005fad570f872d7;
`INPUT_WIDTH'd71 : data[62:0] <= 64'h40073bd2e9a270df;
`INPUT_WIDTH'd72 : data[62:0] <= 64'h40089f188bdcd7ad;
`INPUT_WIDTH'd73 : data[62:0] <= 64'h400a2ab4c713671d;
`INPUT_WIDTH'd74 : data[62:0] <= 64'h400be6398b3f2869;
`INPUT_WIDTH'd75 : data[62:0] <= 64'h400ddb3d742c2656;
`INPUT_WIDTH'd76 : data[62:0] <= 64'h40100b0a2833d3c5;
`INPUT_WIDTH'd77 : data[62:0] <= 64'h4011536e695dda91;
`INPUT_WIDTH'd78 : data[62:0] <= 64'h4012d18a8e2ff28e;
`INPUT_WIDTH'd79 : data[62:0] <= 64'h40149405f7cc6448;
`INPUT_WIDTH'd80 : data[62:0] <= 64'h4016af648056a133;
`INPUT_WIDTH'd81 : data[62:0] <= 64'h4019414813ba6629;
`INPUT_WIDTH'd82 : data[62:0] <= 64'h401c76237b025ae6;
`INPUT_WIDTH'd83 : data[62:0] <= 64'h402049e7c666e3fe;
`INPUT_WIDTH'd84 : data[62:0] <= 64'h4023075ac71a38c8;
`INPUT_WIDTH'd85 : data[62:0] <= 64'h4026dc2fd0bfdbd5;
`INPUT_WIDTH'd86 : data[62:0] <= 64'h402c99f0ed772d54;
`INPUT_WIDTH'd87 : data[62:0] <= 64'h403314c55fbc4c58;
`INPUT_WIDTH'd88 : data[62:0] <= 64'h403ca2e17ec21843;
`INPUT_WIDTH'd89 : data[62:0] <= 64'h404ca51d76749a49;
`INPUT_WIDTH'd90 : data[62:0] <= 64'h7ff0000000000000;

default:data <= 64'h0;

endcase


else 
  data <= 64'hxxxxxxxxxxxxxxx;



end

endmodule
/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit        ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                                ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                           ////
////                  muni_aditya@yahoo.com                        ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

`define INPUT_WIDTH 32

module top( enable, degrees, data1, rst, actv, clk) ;


input enable;
input [`INPUT_WIDTH-1:0] degrees ;
input rst;
input [2:0] actv;
input clk;

//////////////inputs/////////////////

output reg [63:0] data1;

//////////////output/////////////////


reg [63:0] data;
reg [`INPUT_WIDTH-1:0] half_wave;
reg [`INPUT_WIDTH-1:0] full_wave;
reg [63:0] data_tmp;
reg [`INPUT_WIDTH-1:0] degrees_tmp1;
reg [`INPUT_WIDTH-1:0] degrees_tmp2;
reg [1:0] quad;
reg sin_enable, cos_enable, tan_enable, csc_enable, sec_enable, cot_enable;

//////////////registers/////////////////

wire [63:0] data_sin, data_cos, data_tan, data_csc, data_sec, data_cot;
wire [`INPUT_WIDTH-1:0] divider_out;

//////////////wires/////////////////


sine_lut      a1 (.quad(quad), .enable(sin_enable) , .degrees(degrees_tmp2) , .data(data_sin), .rst(rst), .clk(clk));

cosine_lut    a2 (.quad(quad), .enable(cos_enable) , .degrees(degrees_tmp2) , .data(data_cos), .rst(rst), .clk(clk));

tangent_lut   a3 (.quad(quad), .enable(tan_enable) , .degrees(degrees_tmp2) , .data(data_tan), .rst(rst), .clk(clk));

cosecant_lut  a4 (.quad(quad), .enable(csc_enable) , .degrees(degrees_tmp2) , .data(data_csc), .rst(rst), .clk(clk));

secant_lut    a5 (.quad(quad), .enable(sec_enable) , .degrees(degrees_tmp2) , .data(data_sec), .rst(rst), .clk(clk));

cotangent_lut a6 (.quad(quad), .enable(cot_enable) , .degrees(degrees_tmp2) , .data(data_cot), .rst(rst), .clk(clk));

dividor a7 (.clk(clk), .inp(degrees), .rst(rst), .out(divider_out));
  
  

    

always@(posedge clk)

begin

	if (rst)
	begin
	
	sin_enable	<= 0;
	cos_enable	<= 0;
	tan_enable	<= 0;
	csc_enable	<= 0;
	sec_enable	<= 0;
	cot_enable	<= 0;
	
	end

	else
	begin
	sin_enable <= (actv == 3'b000) ? enable : 1'b0 ;
	cos_enable <= (actv == 3'b001) ? enable : 1'b0 ;
	tan_enable <= (actv == 3'b010) ? enable : 1'b0 ;
	csc_enable <= (actv == 3'b011) ? enable : 1'b0 ;
	sec_enable <= (actv == 3'b100) ? enable : 1'b0 ;
	cot_enable <= (actv == 3'b101) ? enable : 1'b0 ;
	end
end



 /////////// degress calculation////////////
 
 always@(posedge clk)
  begin
    if( degrees > `INPUT_WIDTH'd360)
	begin
	  
//////////////// If input value greater than 360 ///////////////
	  
  if (divider_out > `INPUT_WIDTH'd270)
	begin
	quad <= 2'b11;
	degrees_tmp2 <= divider_out - `INPUT_WIDTH'd270;
   	end
   else

	if (divider_out > `INPUT_WIDTH'd180 && (divider_out < `INPUT_WIDTH'd270 || divider_out == `INPUT_WIDTH'd270))
	begin
	quad <= 2'b10;
	degrees_tmp2 <= divider_out - `INPUT_WIDTH'd180;
	end
	else
	  
	if (divider_out > `INPUT_WIDTH'd90 && (divider_out < `INPUT_WIDTH'd180 || divider_out == `INPUT_WIDTH'd180))
		begin
		degrees_tmp2 <= `INPUT_WIDTH'd180 - divider_out;
		quad <= 2'b01;
		end
	else
		begin
		degrees_tmp2 <= divider_out;
		quad <= 2'b00;
		end
	end  // >360
	////////////////////////end of divider///////////////////
   else

 

////////////// If input value is between 181 and 360//////////
  
   if (degrees > `INPUT_WIDTH'd180 && (degrees < `INPUT_WIDTH'd360 || degrees == `INPUT_WIDTH'd360))
	begin
	degrees_tmp1 <= degrees - `INPUT_WIDTH'd180;
	
	begin
	  if(degrees_tmp1 >`INPUT_WIDTH'd90)
	    begin
	      quad <= 2'b11;
	      degrees_tmp2 <= `INPUT_WIDTH'd180 - degrees_tmp1;
	      end
	      
	      else
	        begin
	          quad <= 2'b10;
	        degrees_tmp2 <= degrees_tmp1;
	         end
	         
	         end
	
	end
   else

//////////// If input value is between 91 and 180//////////////

   if (degrees > `INPUT_WIDTH'd90 && (degrees < `INPUT_WIDTH'd180 || degrees == `INPUT_WIDTH'd180))
	begin
	quad <= 2'b01;
	degrees_tmp2 <= `INPUT_WIDTH'd180 - degrees;
	end
   else

	begin
	quad <= 2'b00;
	degrees_tmp2 <= degrees;
	end
 	
end		
      
 always@(posedge clk)

  begin
    case (actv)
3'b000:         data1 <= data_sin;
3'b001:         data1 <= data_cos;
3'b010:         data1 <= data_tan;
3'b011:         data1 <= data_csc;
3'b100:         data1 <= data_sec;
3'b101:         data1 <= data_cot;
default:        data1 <= 0;
endcase


end


endmodule
