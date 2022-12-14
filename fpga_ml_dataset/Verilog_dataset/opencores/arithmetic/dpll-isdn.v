
/* Top module */
module dpll(SignalIn, SignalOut, MainClock,
            Positive, Negative, Lead, Lag
            );
input  SignalIn;                // input signal
input  MainClock;               // reference signal
output SignalOut;               // output
output Positive, Negative;      // internal DPLL signals
output Lead, Lag;               // internal DPLL signals

// phase comparator 
phasecomparator inst_ph_cmp(.MainClock(MainClock), .InputSignal(SignalIn),
                            .OutputSignal(SignalOut), .Lead(Lead), .Lag(Lag)
                            );
/*
// "Zero-Reset Random Walk Filter"
randomwalkfilter inst_zrwf(.MainClock(MainClock), .Lead(Lead), .Lag(Lag),
                           .Positive(Positive), .Negative(Negative)
                           );
*/

// "Variable-Reset Random Walk Filter"
variableresetrandomwalkfilter inst_zrwf(.MainClock(MainClock), .Lead(Lead), .Lag(Lag),
                           .Positive(Positive), .Negative(Negative)
                           );

// controlled frequency divider
freqdivider inst_freqdiv(.MainClock(MainClock), .FrequencyOut(SignalOut),
                           .Positive(Positive), .Negative(Negative)
                           );

endmodule

/* frequency divider and phase controller */

module freqdivider(MainClock, Positive, Negative, FrequencyOut);
 input MainClock;                 // main clock
 input Positive, Negative;    // signals Positive, Negative are synchronous with MainClock
 output FrequencyOut;         // output frequency

/* needed counter length */
parameter DividerLength   = 7;

/*  controlled prescaler, after this prescales the "divider by 2" installed,     */
/*  so composite divide coefficient will be equivalent of 96 (in this example) - */
/*  it's necessary for work DPLL on frequency 192kHz with oscillator             */
/*  frequency 18432kHz                                                           */
/* additional divider by 2 used for getting output signal with duty factor of 2  */

parameter DividerMaxValue = 48;

reg [DividerLength-1 : 0] DividerCounter;
reg FrequencyOut;        // registered output

/* Process of freq. division according to  signals from Random  Deviations Filter:  */
/* if "lag" then counter will incremented by 2                                                                          */
/* if "lead" then counter will not changed                                                                                */
/* if there is no phase lead or lag then counter normally incremented by 1                          */

always @(posedge MainClock)
 begin
  if(DividerCounter >= (DividerMaxValue - 1))
    DividerCounter <= 0;
    else if(Negative)       DividerCounter <= DividerCounter + 2;
          else if(Positive) DividerCounter <= DividerCounter;
                else        DividerCounter <= DividerCounter + 1;
  if(DividerCounter == 0) FrequencyOut <= ~FrequencyOut;           // additional divider by 2 - for producing 50% duty factor of the output signal
 end

endmodule

/* phase comparator */
module phasecomparator(InputSignal, OutputSignal, MainClock, Lead, Lag);

input InputSignal, OutputSignal;    // PLL input(reference) and output(dejittered clock) signals
input MainClock;                    // System Clock
output Lead, Lag;                   // Lead and Lag signals

reg [1:0] InputSignalEdgeDet;       // detector of the rising edge
always @(posedge MainClock)
 begin
  InputSignalEdgeDet <= { InputSignalEdgeDet[0], InputSignal };
 end


/* this signal checked at rising edge of MainClock.       */
/* It's simple detector of the Input signal rising edge - */
/* When it detected then we check the level of the output.*/
/* There is possible to place additional 2 registers for  */
/* output signal for eliminatig  the cmp. constant phase error */
wire InputSignalEdge = (InputSignalEdgeDet == 2'b01);

/* "Lead" signal will be generate in case of output==1 during input rising edge*/
reg Lead, Lag;                   // outputs "Lead", "Lag" are registered
always @(posedge MainClock)
 begin                         
  Lag  <= ((InputSignalEdge == 1'b1)  && (OutputSignal == 1'b0));
  Lead <= ((InputSignalEdge == 1'b1)  && (OutputSignal == 1'b1));
 end

endmodule

/* Random Walk Filter with reset value of 0*/
module randomwalkfilter(MainClock, Lead, Lag, Positive, Negative);
 input  MainClock, Lead, Lag;    // System Clock and Phase Comparator signals
 output Positive, Negative;      // "positive shift" and "negative shift" outputs

/* some parametere are accessible from outside */
parameter FilterLength      = 8;
parameter FilterResetValue  = 4;
parameter FilterMaxValue    = FilterResetValue;
parameter FilterMinValue    = 256 - FilterResetValue;

/* reversive counter */ 
reg [FilterLength-1 : 0] FilterCounter;

/* calculation of output pulses synchrinized with MainClock */
always @(posedge MainClock)
 begin
  if((FilterCounter == FilterMaxValue) || (FilterCounter == FilterMinValue))
    FilterCounter <= 0;
    else
     begin
      if(Lead) FilterCounter <= FilterCounter + 1;
      if(Lag)  FilterCounter <= FilterCounter - 1;
     end
 end

/* making "Lead" and "Lag" signals when  */
/* counter reached max or min levels     */
reg Positive, Negative;
always @(posedge MainClock)
 begin
  Positive <= (FilterCounter == FilterMaxValue);
  Negative <= (FilterCounter == FilterMinValue);
 end

endmodule



/* random-walk filter with variable reset */

module variableresetrandomwalkfilter(MainClock, Lead, Lag, Positive, Negative);
 input  MainClock, Lead, Lag; // System Clock and Phase Comparator signals
 output Positive, Negative;   // "positive shift" and "negative shift" outputs

parameter N_FilterLength      = 8;
parameter N_FilterResetValue  = 8;
parameter N_FilterMaxValue    = N_FilterResetValue;

/* 256=2_PWR_8(counter length). Use this value because unsigned arithmetic */
parameter N_FilterMinValue    = 256 - N_FilterResetValue;

/* the counter length of reset scheme must be short */
parameter ResetterCounterLength   = 4;
parameter ResetterCounterMaxValue = 3;

/* 16=2_PWR_4 */
parameter ResetterCounterMinValue = 16 - 3;

/* counter "N - RandomWalkFilter" */ 
reg [N_FilterLength-1 : 0] N_FilterCounter;

/* connections of "M - RandomWalkFilter" */
wire Up, Down;
randomwalkfilter inst_M_Filter(.MainClock(MainClock), .Lead(Lead), .Lag(Lag),
                                             .Positive(Up), .Negative(Down));
defparam inst_M_Filter.FilterResetValue = 32;  // length "M-RWF" = 32

/* Reset Scheme. This counter changes on "M-RWF" counter */
reg [ResetterCounterLength-1 : 0] ResetterCounter;
always @(posedge MainClock)
 begin
  if(Up)
   begin
    if((ResetterCounter < ResetterCounterMaxValue) || (ResetterCounter >= ResetterCounterMinValue))
     ResetterCounter <= ResetterCounter + 1;
   end
  else if(Down)
   begin
    if((ResetterCounter <= ResetterCounterMaxValue) || (ResetterCounter > ResetterCounterMinValue))
     ResetterCounter <= ResetterCounter - 1;
   end
  if((ResetterCounter > ResetterCounterMaxValue) && (ResetterCounter < ResetterCounterMinValue))
     ResetterCounter <= 0;
 end

/* Look-Up Table between ResetterCounter value and reset state of "N-RWF" */
reg [N_FilterLength-1 : 0] ResetterValue;
always @(1)
 begin
  case(ResetterCounter)
   16 - 3:  ResetterValue = 256 - 7;
   16 - 2:  ResetterValue = 256 - 6;
   16 - 1:  ResetterValue = 256 - 4;
   0:       ResetterValue = 0;
   1:       ResetterValue = 4;
   2:       ResetterValue = 6;
   3:       ResetterValue = 7;
   default: ResetterValue = 0;
  endcase
 end

/* "N-RWF" Filter has different reset states */
/* in accordance ResetterCounter value       */
always @(posedge MainClock)
 begin
  if((N_FilterCounter == N_FilterMaxValue) || (N_FilterCounter == N_FilterMinValue))
    N_FilterCounter <= ResetterValue;
    else
     begin
      if(Lead) N_FilterCounter <= N_FilterCounter + 1;
      if(Lag)  N_FilterCounter <= N_FilterCounter - 1;
     end
 end

/* making "Lead" and "Lag" signals when  */
/* counter reached max or min levels     */
reg Positive, Negative;
always @(posedge MainClock)
 begin
  Positive <= (N_FilterCounter == N_FilterMaxValue);
  Negative <= (N_FilterCounter == N_FilterMinValue);
 end

endmodule
