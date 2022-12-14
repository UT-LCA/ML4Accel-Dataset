`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
////                                                                        ////
//// Project Name: ASYNCHRONOUS SPI MASTER (Verilog)                        ////
////                                                                        ////
//// Module Name: spi_master                                                ////
////                                                                        ////
////                                                                        ////
////  Author(s):                                                            ////
////      Iulian Gheorghiu                                                  ////
////                                                                        ////
////  Create Date: 01/17/2017 11:21:57 AM                                   ////
////  Refer to simulate.v for more information                              ////
////  Revision 0.01 - File Created                                          ////
////                                                                        ////
////////////////////////////////////////////////////////////////////////////////

module spi_master(
        clk,/* Peripheral clock/not necessary to be core clock, the core clock can be different (input) */
        rst,/* Asynchronus reset, is mandatory to provide this signal, active on posedge (input) */
        data,/* In/Out data(bidirectional) */
        wr,/* Send data, asynchronus with 'clk' , active on posedge or negedge(input) */
        rd,/* Read data, , asynchronus with 'clk' , active on posedge or negedge (input) */
        buffempty,/* '1' if transmit buffer is empty (output) */
        prescaller,/* The prescaller divider is = (1 << prescaller) value between 0 and 7 for dividers by:1,2,4,8,16,32,64,128 and 256 (input)*/
        sck,/* SPI 'sck' signal (output) */
        mosi,/* SPI 'mosi' signal (output) */
        miso,/* SPI 'miso' signal (input) */
        ss,/* SPI 'ss' signal (if send buffer is maintained full the ss signal will not go high between between transmit chars)(output) */
        lsbfirst,/* If '0' msb is send first, if '1' lsb is send first (input) */
        mode,/* All four modes is supported (input) */
        senderr,/* If you try to send a character if send buffer is full this bit is set to '1', this can be ignored and if is '1' does not affect the interface (output) */
        res_senderr,/* To reset 'senderr' signal write '1' wait minimum half core clock and and after '0' to this bit, is asynchronous with 'clk' (input)*/
        charreceived/* Is set to '1' if a character is received, if you read the receive buffe this bit will go '0', if you ignore it and continue to send data this bit will remain '1' until you read the read register (output) */
    );

parameter WORD_LEN = 8;
parameter PRESCALLER_SIZE = 8;

input clk;
input rst;
inout [WORD_LEN - 1:0]data;
input wr;
input rd;
output buffempty;
input [2:0]prescaller;
output sck;
output mosi;
reg _mosi;
input miso;
output reg ss;
input lsbfirst;
input [1:0]mode;
output reg senderr;
input res_senderr;
output charreceived;

reg charreceivedp;
reg charreceivedn;

reg inbufffullp = 1'b0;
reg inbufffulln = 1'b0;

reg [WORD_LEN - 1:0]input_buffer;
reg [WORD_LEN - 1:0]output_buffer;

assign buffempty = ~(inbufffullp ^ inbufffulln);
reg [2:0]prescallerbuff;
/***********************************************/
/************* Asynchronus send ****************/
/***********************************************/
/*
 *  You need to put the data on the bus and wait a half of core clock to assert the wr signal(see simulation).
 */
`ifdef WRITE_ON_NEG_EDGE == 1
always @ (negedge wr)
`else
always @ (posedge wr)
`endif
begin
    if(wr && inbufffullp == inbufffulln && buffempty)
    begin
            input_buffer <= data;
    end
end

`ifdef WRITE_ON_NEG_EDGE == 1
always @ (negedge wr or posedge res_senderr or posedge rst)
`else
always @ (posedge wr or posedge res_senderr or posedge rst)
`endif
begin
    if(rst)
    begin
        inbufffullp <= 1'b0;
        senderr <= 1'b0;
        prescallerbuff <= 3'b000;
    end
    else
    if(res_senderr)
        senderr <= 1'b0;
    else
    if(wr && inbufffullp == inbufffulln && buffempty)
    begin
            inbufffullp <= ~inbufffullp;
            prescallerbuff = prescaller;
    end
    else
    if(!buffempty)
        senderr <= 1'b1;
end
/***********************************************/
/************ !Asynchronus send ****************/
/***********************************************/
parameter state_idle = 1'b0;
parameter state_busy = 1'b1;
reg state;


reg [PRESCALLER_SIZE - 1:0]prescaller_cnt;
reg [WORD_LEN - 1:0]shift_reg_out;
reg [WORD_LEN - 1:0]shift_reg_in;
reg [4:0]sckint;
//reg sckintn;
reg [2:0]prescallerint;
reg [7:0]prescdemux;


always @ (*)
begin
    if(prescallerint < PRESCALLER_SIZE)
    begin
        case(prescallerint)
        3'b000: prescdemux <= 8'b00000001;
        3'b001: prescdemux <= 8'b00000011;
        3'b010: prescdemux <= 8'b00000111;
        3'b011: prescdemux <= 8'b00001111;
        3'b100: prescdemux <= 8'b00011111;
        3'b101: prescdemux <= 8'b00111111;
        3'b110: prescdemux <= 8'b01111111;
        3'b111: prescdemux <= 8'b11111111;
        endcase
    end
    else
        prescdemux <= 8'b00000001;
end

reg lsbfirstint;
reg [1:0]modeint;

always @ (posedge clk or posedge rst)
begin
    if(rst)
    begin
        inbufffulln <= 1'b0;
        ss <= 1'b1;
        state <= state_idle;
        prescaller_cnt <= {PRESCALLER_SIZE{1'b0}};
        prescallerint <= {PRESCALLER_SIZE{3'b0}};
        shift_reg_out <= {WORD_LEN{1'b0}};
        shift_reg_in <= {WORD_LEN{1'b0}};
        sckint <=  {5{1'b0}};
        _mosi <= 1'b1;
        output_buffer <= {WORD_LEN{1'b0}};
        charreceivedp <= 1'b0;
        lsbfirstint <= 1'b0;
        modeint <= 2'b00;
    end
    else
    begin
        case(state)
        state_idle:
            begin
                if(inbufffullp != inbufffulln)
                begin
                    inbufffulln <= ~inbufffulln;
                    ss <= 1'b0;
                    prescaller_cnt <= {PRESCALLER_SIZE{1'b0}};
                    prescallerint <= prescallerbuff;
                    lsbfirstint <= lsbfirst;
                    modeint <= mode;
                    shift_reg_out <= input_buffer;
                    state <= state_busy;
                    if(!mode[0])
                    begin
                        if(!lsbfirst)
                            _mosi <= input_buffer[WORD_LEN - 1];
                        else
                            _mosi <= input_buffer[0];
                    end
                end
            end
        state_busy:
            begin
                if(prescaller_cnt != prescdemux)
                begin
                    prescaller_cnt <= prescaller_cnt + 1;
                end
                else
                begin
                    prescaller_cnt <= {PRESCALLER_SIZE{1'b0}};
                    sckint <= sckint + 1;
                    if(sckint[0] == modeint[0])
                    begin
                        if(!lsbfirstint)
                        begin
                            shift_reg_in <= {miso, shift_reg_in[7:1]};
                            shift_reg_out <= {shift_reg_out[6:0], 1'b1};
                        end
                        else
                        begin
                            shift_reg_in <= {shift_reg_in[6:0], miso};
                            shift_reg_out <= {1'b1, shift_reg_out[7:1]};
                        end
                    end
                    else
                    begin
                        if(!lsbfirstint)
                            _mosi <= shift_reg_out[WORD_LEN - 1];
                        else
                            _mosi <= shift_reg_out[0];

                        if(sckint[4:1] == WORD_LEN)
                        begin
                            sckint <= {5{1'b0}};
                            if(inbufffullp == inbufffulln)
                            begin
                                ss <= 1'b1;
                            end
                            output_buffer <= shift_reg_in;
                            if(charreceivedp == charreceivedn)
                                charreceivedp <= ~charreceivedp;
                            state <= state_idle;
                        end
                    end
                end
            end
        endcase
    end
end
/*
 *  You need to assert rd signal, wait a half core clock and after read the data(see simulation).
 */
`ifdef READ_ON_NEG_EDGE == 1
always @ (negedge rd or posedge rst)
`else
always @ (posedge rd or posedge rst)
`endif
begin
    if(rst)
        charreceivedn <= 1'b0;
    else
    if(charreceivedp != charreceivedn)
        charreceivedn <= ~charreceivedn;
end

assign data = (rd) ? output_buffer : {WORD_LEN{1'bz}};

assign sck = (modeint[1])? ~sckint : sckint;
assign mosi = (ss) ? 1'b1:_mosi;
assign charreceived = (charreceivedp ^ charreceivedn);

endmodule
