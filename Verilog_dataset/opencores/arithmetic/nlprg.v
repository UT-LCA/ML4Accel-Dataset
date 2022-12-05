module nlprg8 (
  input ck,
  input rst,
  output o0,
  output o1,
  output o2,
  output o3,
  output o4,
  output o5,
  output o6,
  output o7
);
  wire s0;
  wire o0_temp;
  wire s1;
  wire o2_temp;
  wire s2;
  wire o1_temp;
  wire s3;
  wire o3_temp;
  wire o4_temp;
  wire o5_temp;
  wire o6_temp;
  wire o7_temp;

  dff dff0 (
    .d( s0 ),
    .ck( ck ),
    .rst( rst ),
    .q( o0_temp )
  );

  dff dff1 (
    .d( s1 ),
    .ck( ck ),
    .rst( rst ),
    .q( o2_temp )
  );

  dff dff2 (
    .d( s2 ),
    .ck( ck ),
    .rst( rst ),
    .q( o1_temp )
  );

  dff dff3 (
    .d( s3 ),
    .ck( ck ),
    .rst( rst ),
    .q( o3_temp )
  );

  dff dff4 (
    .d( o4_temp ),
    .ck( ck ),
    .rst( rst ),
    .q( o5_temp )
  );

  dff dff5 (
    .d( o3_temp ),
    .ck( ck ),
    .rst( rst ),
    .q( o4_temp )
  );

  dff dff6 (
    .d( o5_temp ),
    .ck( ck ),
    .rst( rst ),
    .q( o6_temp )
  );

  dff dff7 (
    .d( o6_temp ),
    .ck( ck ),
    .rst( rst ),
    .q( o7_temp )
  );

  assign s0 = (~ (o6_temp ^ o7_temp) ^ o3_temp);
  assign s1 = ~ (~ (o3_temp ^ o4_temp) ^ o1_temp);
  assign s2 = ~ (~ (o5_temp ^ o6_temp) ^ o0_temp);
  assign s3 = ((o5_temp ^ o2_temp) ^ (~ (o1_temp | o0_temp) & (((o7_temp & o6_temp) & (o5_temp & o4_temp)) & o3_temp)));
  assign o0 = o0_temp;
  assign o1 = o1_temp;
  assign o2 = o2_temp;
  assign o3 = o3_temp;
  assign o4 = o4_temp;
  assign o5 = o5_temp;
  assign o6 = o6_temp;
  assign o7 = o7_temp;

endmodule

module dff
(
   input d,
   input ck,
   input rst,
   output q

);
    reg state;

    assign q = state;

    always @ (posedge ck or posedge rst )
    begin
        if (rst)
            state <= 'h0;
        else
            state <= d;
    end

endmodule
