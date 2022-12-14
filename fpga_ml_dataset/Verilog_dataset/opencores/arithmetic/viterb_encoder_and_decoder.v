module ACS
(
   path_0_valid,
   path_1_valid,
   path_0_bmc,
   path_1_bmc,
   path_0_pmc,
   path_1_pmc,
   selection,
   valid_o,
   path_cost
);
   input       path_0_valid;
   input [1:0] path_0_bmc;
   input [7:0] path_0_pmc;

   input       path_1_valid;
   input [1:0] path_1_bmc;
   input [7:0] path_1_pmc;

   output reg        selection;
   output reg        valid_o;
   output      [7:0] path_cost;  


   wire  [7:0] path_cost_0;
   wire  [7:0] path_cost_1;

   assign path_cost_0  =  path_0_bmc + path_0_pmc;
   assign path_cost_1  =  path_1_bmc + path_1_pmc;

   assign path_cost      =  (valid_o?(selection?path_cost_1:path_cost_0):7'd0);   


   always @ (*)
   begin
      valid_o = 1'b1;

      case({path_0_valid,path_1_valid})
         2'b00:
         begin
            selection = 1'b0;
            valid_o   = 1'b0; 
         end
         2'b01:   selection = 1'b1;
         2'b10:   selection = 1'b0;
         2'b11:   selection = (path_cost_0 > path_cost_1)?1'b1:1'b0;
       endcase
   end
   

endmodule
module decoder
(
   clk,
   rst,
   enable,
   d_in,
   d_out
);

   input             clk;
   input             rst;
   input             enable;
   input [1:0]       d_in;
   output            d_out;

   reg               decoder_o_reg;


//bmc module signals
   wire  [1:0]       bmc000_path_0_bmc;
   wire  [1:0]       bmc001_path_0_bmc;
   wire  [1:0]       bmc010_path_0_bmc;
   wire  [1:0]       bmc011_path_0_bmc;
   wire  [1:0]       bmc100_path_0_bmc;
   wire  [1:0]       bmc101_path_0_bmc;
   wire  [1:0]       bmc110_path_0_bmc;
   wire  [1:0]       bmc111_path_0_bmc;

   wire  [1:0]       bmc000_path_1_bmc;
   wire  [1:0]       bmc001_path_1_bmc;
   wire  [1:0]       bmc010_path_1_bmc;
   wire  [1:0]       bmc011_path_1_bmc;
   wire  [1:0]       bmc100_path_1_bmc;
   wire  [1:0]       bmc101_path_1_bmc;
   wire  [1:0]       bmc110_path_1_bmc;
   wire  [1:0]       bmc111_path_1_bmc;

//ACS modules signals
   reg   [7:0]       validity;
   reg   [7:0]       selection;
   reg   [7:0]       path_cost   [7:0];
   wire  [7:0]       validity_nets;
   wire  [7:0]       selection_nets;

   wire              ACS000_selection;
   wire              ACS001_selection;
   wire              ACS010_selection;
   wire              ACS011_selection;
   wire              ACS100_selection;
   wire              ACS101_selection;
   wire              ACS110_selection;
   wire              ACS111_selection;

   wire              ACS000_valid_o;
   wire              ACS001_valid_o;
   wire              ACS010_valid_o;
   wire              ACS011_valid_o;
   wire              ACS100_valid_o;
   wire              ACS101_valid_o;
   wire              ACS110_valid_o;
   wire              ACS111_valid_o;

   wire  [7:0]       ACS000_path_cost;
   wire  [7:0]       ACS001_path_cost;
   wire  [7:0]       ACS010_path_cost;
   wire  [7:0]       ACS011_path_cost;
   wire  [7:0]       ACS100_path_cost;
   wire  [7:0]       ACS101_path_cost;
   wire  [7:0]       ACS110_path_cost;
   wire  [7:0]       ACS111_path_cost;

//Trelis memory write operation
   reg   [1:0]       mem_bank;
   reg   [1:0]       mem_bank_buf;
   reg   [1:0]       mem_bank_buf_buf;
   reg               mem_bank_buf_buf_buf;
   reg               mem_bank_buf_buf_buf_buf;
   reg               mem_bank_buf_buf_buf_buf_buf;
   reg   [9:0]       wr_mem_counter;
   reg   [9:0]       rd_mem_counter;

   reg   [9:0]       addr_mem_A;
   reg   [9:0]       addr_mem_B;
   reg   [9:0]       addr_mem_C;
   reg   [9:0]       addr_mem_D;

   reg               wr_mem_A;
   reg               wr_mem_B;
   reg               wr_mem_C;
   reg               wr_mem_D;

   reg   [7:0]       d_in_mem_A;
   reg   [7:0]       d_in_mem_B;
   reg   [7:0]       d_in_mem_C;
   reg   [7:0]       d_in_mem_D;

   wire  [7:0]       d_o_mem_A;
   wire  [7:0]       d_o_mem_B;
   wire  [7:0]       d_o_mem_C;
   wire  [7:0]       d_o_mem_D;

//Trace back module signals
   reg               selection_tbu_0;
   reg               selection_tbu_1;

   reg   [7:0]       d_in_0_tbu_0;
   reg   [7:0]       d_in_1_tbu_0;
   reg   [7:0]       d_in_0_tbu_1;
   reg   [7:0]       d_in_1_tbu_1;

   wire              d_o_tbu_0;
   wire              d_o_tbu_1;

   reg               enable_tbu_0;
   reg               enable_tbu_1;

//Display memory operations 
   wire              wr_disp_mem_0;
   wire              wr_disp_mem_1;

   wire              d_in_disp_mem_0;
   wire              d_in_disp_mem_1;

   reg   [9:0]       wr_mem_counter_disp;
   reg   [9:0]       rd_mem_counter_disp;

   reg   [9:0]       addr_disp_mem_0;
   reg   [9:0]       addr_disp_mem_1;


   assign   d_out =  decoder_o_reg;


//Branch matrc calculation modules

   bmc000   bmc000_inst(d_in,bmc000_path_0_bmc,bmc000_path_1_bmc);
   bmc001   bmc001_inst(d_in,bmc001_path_0_bmc,bmc001_path_1_bmc);
   bmc010   bmc010_inst(d_in,bmc010_path_0_bmc,bmc010_path_1_bmc);
   bmc011   bmc011_inst(d_in,bmc011_path_0_bmc,bmc011_path_1_bmc);
   bmc100   bmc100_inst(d_in,bmc100_path_0_bmc,bmc100_path_1_bmc);
   bmc101   bmc101_inst(d_in,bmc101_path_0_bmc,bmc101_path_1_bmc);
   bmc110   bmc110_inst(d_in,bmc110_path_0_bmc,bmc110_path_1_bmc);
   bmc111   bmc111_inst(d_in,bmc111_path_0_bmc,bmc111_path_1_bmc);


//Add Compare Select Modules

   ACS      ACS000(validity[0],validity[1],bmc000_path_0_bmc,bmc000_path_1_bmc,path_cost[0],path_cost[1],ACS000_selection,ACS000_valid_o,ACS000_path_cost);
   ACS      ACS001(validity[3],validity[2],bmc001_path_0_bmc,bmc001_path_1_bmc,path_cost[3],path_cost[2],ACS001_selection,ACS001_valid_o,ACS001_path_cost);
   ACS      ACS010(validity[4],validity[5],bmc010_path_0_bmc,bmc010_path_1_bmc,path_cost[4],path_cost[5],ACS010_selection,ACS010_valid_o,ACS010_path_cost);
   ACS      ACS011(validity[7],validity[6],bmc011_path_0_bmc,bmc011_path_1_bmc,path_cost[7],path_cost[6],ACS011_selection,ACS011_valid_o,ACS011_path_cost);
   ACS      ACS100(validity[1],validity[0],bmc100_path_0_bmc,bmc100_path_1_bmc,path_cost[1],path_cost[0],ACS100_selection,ACS100_valid_o,ACS100_path_cost);
   ACS      ACS101(validity[2],validity[3],bmc101_path_0_bmc,bmc101_path_1_bmc,path_cost[2],path_cost[3],ACS101_selection,ACS101_valid_o,ACS101_path_cost);
   ACS      ACS110(validity[5],validity[4],bmc110_path_0_bmc,bmc110_path_1_bmc,path_cost[5],path_cost[4],ACS110_selection,ACS110_valid_o,ACS110_path_cost);
   ACS      ACS111(validity[6],validity[7],bmc111_path_0_bmc,bmc111_path_1_bmc,path_cost[6],path_cost[7],ACS111_selection,ACS111_valid_o,ACS111_path_cost);

   
   assign selection_nets  =  {ACS111_selection,ACS110_selection,ACS101_selection,ACS100_selection,
                              ACS011_selection,ACS010_selection,ACS001_selection,ACS000_selection};
   assign validity_nets    =  {ACS111_valid_o,ACS110_valid_o,ACS101_valid_o,ACS100_valid_o,
                              ACS011_valid_o,ACS010_valid_o,ACS001_valid_o,ACS000_valid_o};


   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
      begin
         validity          <= 8'b00000001;
         selection         <= 8'b00000000;

         path_cost[0]      <= 8'd0;
         path_cost[1]      <= 8'd0;
         path_cost[2]      <= 8'd0;
         path_cost[3]      <= 8'd0;
         path_cost[4]      <= 8'd0;
         path_cost[5]      <= 8'd0;
         path_cost[6]      <= 8'd0;
         path_cost[7]      <= 8'd0;

      end
      else if(enable==1'b0)
      begin
         validity          <= 8'b00000001;
         selection         <= 8'b00000000;

         path_cost[0]      <= 8'd0;
         path_cost[1]      <= 8'd0;
         path_cost[2]      <= 8'd0;
         path_cost[3]      <= 8'd0;
         path_cost[4]      <= 8'd0;
         path_cost[5]      <= 8'd0;
         path_cost[6]      <= 8'd0;
         path_cost[7]      <= 8'd0;

      end
      else if( path_cost[0][7] && path_cost[1][7] && path_cost[2][7] && path_cost[3][7] &&
             path_cost[4][7] && path_cost[5][7] && path_cost[6][7] && path_cost[7][7] )
      begin

         validity          <= validity_nets;
         selection         <= selection_nets;
         
         path_cost[0]      <= 8'b01111111 & ACS000_path_cost;
         path_cost[1]      <= 8'b01111111 & ACS001_path_cost;
         path_cost[2]      <= 8'b01111111 & ACS010_path_cost;
         path_cost[3]      <= 8'b01111111 & ACS011_path_cost;
         path_cost[4]      <= 8'b01111111 & ACS100_path_cost;
         path_cost[5]      <= 8'b01111111 & ACS101_path_cost;
         path_cost[6]      <= 8'b01111111 & ACS110_path_cost;
         path_cost[7]      <= 8'b01111111 & ACS111_path_cost;
      end
      else 
      begin
         validity          <= validity_nets;
         selection         <= selection_nets;

         path_cost[0]      <= ACS000_path_cost;
         path_cost[1]      <= ACS001_path_cost;
         path_cost[2]      <= ACS010_path_cost;
         path_cost[3]      <= ACS011_path_cost;
         path_cost[4]      <= ACS100_path_cost;
         path_cost[5]      <= ACS101_path_cost;
         path_cost[6]      <= ACS110_path_cost;
         path_cost[7]      <= ACS111_path_cost;
      end
   end



   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
         wr_mem_counter <= 10'd0;
      else if(enable==1'b0)
         wr_mem_counter <= 10'd0;
      else
         wr_mem_counter <= wr_mem_counter + 10'd1;
   end

   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
         rd_mem_counter <= 10'b1111111111;
      //else if(enable==1'b0)
       //  wr_mem_counter <= 10'd0;
      else
         rd_mem_counter <= rd_mem_counter - 10'd1;
   end

   
   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
         mem_bank <= 2'b00;
      else begin
         if(wr_mem_counter==10'b1111111111)
               mem_bank <= mem_bank + 2'b01;
      end
   end

   
   always @ (posedge clk)
   begin
      d_in_mem_A  <= selection;
      d_in_mem_B  <= selection;
      d_in_mem_C  <= selection;
      d_in_mem_D  <= selection;

   end


   always @ (posedge clk)
   begin
      case(mem_bank)
         2'b00:
         begin
            addr_mem_A        <= wr_mem_counter;
            addr_mem_B        <= rd_mem_counter;
            addr_mem_C        <= 10'd0;
            addr_mem_D        <= rd_mem_counter;

            wr_mem_A          <= 1'b1;
            wr_mem_B          <= 1'b0;
            wr_mem_C          <= 1'b0;
            wr_mem_D          <= 1'b0;
         end
         2'b01:
         begin
            addr_mem_A        <= rd_mem_counter;
            addr_mem_B        <= wr_mem_counter;
            addr_mem_C        <= rd_mem_counter;
            addr_mem_D        <= 10'd0;

            wr_mem_A          <= 1'b0;
            wr_mem_B          <= 1'b1;
            wr_mem_C          <= 1'b0;
            wr_mem_D          <= 1'b0;

         end
         2'b10:
         begin
            addr_mem_A        <= 10'd0;
            addr_mem_B        <= rd_mem_counter;
            addr_mem_C        <= wr_mem_counter;
            addr_mem_D        <= rd_mem_counter;

            wr_mem_A          <= 1'b0;
            wr_mem_B          <= 1'b0;
            wr_mem_C          <= 1'b1;
            wr_mem_D          <= 1'b0;
         end
         2'b11:
         begin
            addr_mem_A        <= rd_mem_counter;
            addr_mem_B        <= 10'd0;
            addr_mem_C        <= rd_mem_counter;
            addr_mem_D        <= wr_mem_counter;

            wr_mem_A          <= 1'b0;
            wr_mem_B          <= 1'b0;
            wr_mem_C          <= 1'b0;
            wr_mem_D          <= 1'b1;
         end
      endcase
  end

//Trelis memory module instantiation

   mem   trelis_mem_A
   (
      .clk(clk),
      .wr(wr_mem_A),
      .addr(addr_mem_A),
      .d_i(d_in_mem_A),
      .d_o(d_o_mem_A)
   );

  mem   trelis_mem_B
   (
      .clk(clk),
      .wr(wr_mem_B),
      .addr(addr_mem_B),
      .d_i(d_in_mem_B),
      .d_o(d_o_mem_B)
   );

  mem   trelis_mem_C
   (
      .clk(clk),
      .wr(wr_mem_C),
      .addr(addr_mem_C),
      .d_i(d_in_mem_C),
      .d_o(d_o_mem_C)
   );

  mem   trelis_mem_D
   (
      .clk(clk),
      .wr(wr_mem_D),
      .addr(addr_mem_D),
      .d_i(d_in_mem_D),
      .d_o(d_o_mem_D)
   );

//Trace back module operation

   always @(posedge clk)
      mem_bank_buf   <= mem_bank;
   
   always @(posedge clk)
      mem_bank_buf_buf   <= mem_bank_buf;


   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
            enable_tbu_0   <= 1'b0;
      else begin
         if(mem_bank_buf_buf==2'b10)
            enable_tbu_0   <= 1'b1;
         else
            enable_tbu_0   <= enable_tbu_0;
      end   
   end

   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
            enable_tbu_1   <= 1'b0;
      else begin
         if(mem_bank_buf_buf==2'b11)
            enable_tbu_1   <= 1'b1;
         else
            enable_tbu_1   <= enable_tbu_1;
      end   
   end
   
   always @ (posedge clk)
   begin
      case(mem_bank_buf_buf)
         2'b00:
         begin
            d_in_0_tbu_0   <= d_o_mem_D;
            d_in_1_tbu_0   <= d_o_mem_C;
            
            d_in_0_tbu_1   <= d_o_mem_C;
            d_in_1_tbu_1   <= d_o_mem_B;

            selection_tbu_0<= 1'b0;
            selection_tbu_1<= 1'b1;

         end
         2'b01:
         begin
            d_in_0_tbu_0   <= d_o_mem_D;
            d_in_1_tbu_0   <= d_o_mem_C;
            
            d_in_0_tbu_1   <= d_o_mem_A;
            d_in_1_tbu_1   <= d_o_mem_D;
            
            selection_tbu_0<= 1'b1;
            selection_tbu_1<= 1'b0;
         end
         2'b10:
         begin
            d_in_0_tbu_0   <= d_o_mem_B;
            d_in_1_tbu_0   <= d_o_mem_A;
            
            d_in_0_tbu_1   <= d_o_mem_A;
            d_in_1_tbu_1   <= d_o_mem_D;

            selection_tbu_0<= 1'b0;
            selection_tbu_1<= 1'b1;
         end
         2'b11:
         begin
            d_in_0_tbu_0   <= d_o_mem_B;
            d_in_1_tbu_0   <= d_o_mem_A;
            
            d_in_0_tbu_1   <= d_o_mem_C;
            d_in_1_tbu_1   <= d_o_mem_B;

            selection_tbu_0<= 1'b1;
            selection_tbu_1<= 1'b0;
         end
      endcase
   end

//Trace-Back modules instantiation

   tbu tbu_0
   (
      .clk(clk),
      .rst(rst),
      .enable(enable_tbu_0),
      .selection(selection_tbu_0),
      .d_in_0(d_in_0_tbu_0),
      .d_in_1(d_in_1_tbu_0),
      .d_o(d_o_tbu_0),
      .wr_en(wr_disp_mem_0)
   );

   tbu tbu_1
   (
      .clk(clk),
      .rst(rst),
      .enable(enable_tbu_1),
      .selection(selection_tbu_1),
      .d_in_0(d_in_0_tbu_1),
      .d_in_1(d_in_1_tbu_1),
      .d_o(d_o_tbu_1),
      .wr_en(wr_disp_mem_1)
   );

//Display Memory modules Instantioation

   assign   d_in_disp_mem_0   =  d_o_tbu_0;
   assign   d_in_disp_mem_1   =  d_o_tbu_1;
   

  mem_disp   disp_mem_0
  (
      .clk(clk),
      .wr(wr_disp_mem_0),
      .addr(addr_disp_mem_0),
      .d_i(d_in_disp_mem_0),
      .d_o(d_o_disp_mem_0)
   );

  mem_disp   disp_mem_1
  (
      .clk(clk),
      .wr(wr_disp_mem_1),
      .addr(addr_disp_mem_1),
      .d_i(d_in_disp_mem_1),
      .d_o(d_o_disp_mem_1)
   );

// Display memory module operation
   always @ (posedge clk)
      mem_bank_buf_buf_buf <= mem_bank_buf_buf[0];

   always @ (posedge clk)
   begin
      if(rst==1'b0)
         wr_mem_counter_disp  <= 10'b0000000010;
      if(enable==1'b0)
         wr_mem_counter_disp  <= 10'b0000000010;
      else
         wr_mem_counter_disp  <= wr_mem_counter_disp - 10'd1;   
   end

   always @ (posedge clk)
   begin
      if(rst==1'b0)
         rd_mem_counter_disp  <= 10'b1111111101;
      if(enable==1'b0)
         rd_mem_counter_disp  <= 10'b1111111101;
      else
         rd_mem_counter_disp  <= rd_mem_counter_disp + 10'd1;   
   end

   
   always @ (posedge clk)
   begin
      case(mem_bank_buf_buf_buf)
         1'b0:
         begin
            addr_disp_mem_0   <= rd_mem_counter_disp; 
            addr_disp_mem_1   <= wr_mem_counter_disp;
         end
         1'b1:
         begin
            addr_disp_mem_0   <= wr_mem_counter_disp; 
            addr_disp_mem_1   <= rd_mem_counter_disp; 
         end
      endcase
   end


   always @ (posedge clk)
      mem_bank_buf_buf_buf_buf   <= mem_bank_buf_buf_buf;

   always @ (posedge clk)
      mem_bank_buf_buf_buf_buf_buf <= mem_bank_buf_buf_buf_buf;



   always @ (posedge clk)
   begin
      case(mem_bank_buf_buf_buf_buf_buf)
         1'b0:
         begin
            decoder_o_reg  <= d_o_disp_mem_0;
         end
         1'b1:
         begin
            decoder_o_reg  <= d_o_disp_mem_1;
         end
      endcase
   end

endmodule
module encoder
(
   clk,
   rst,
   enable_i,
   d_in,
   valid_o,
   d_out
);
   input             clk;
   input             rst;
   input             enable_i;
   input             d_in;
   output reg        valid_o;
   output      [1:0] d_out;
   
   reg         [2:0] cstate;
   reg         [2:0] nstate;
   
   reg         [1:0] d_out_reg;

   assign   d_out    =  (enable_i==1'b1)?d_out_reg:2'b00;
     

   always @(*) begin
      valid_o  =   enable_i;
      case (cstate)
         3'b000:
         begin
            if(d_in==1'b0)
            begin
               nstate   =  3'b000;
               d_out_reg    =  2'b00;
            end
            else
            begin
               nstate   =  3'b100;
               d_out_reg    =  2'b11;
            end
         end
         3'b001:
         begin
            if(d_in==1'b0)
            begin
               nstate   =  3'b100;
               d_out_reg    =  2'b00;
            end
            else
            begin
               nstate   =  3'b000;
               d_out_reg    =  2'b11;
            end
         end
         3'b010:
         begin
            if(d_in==1'b0)
            begin
               nstate   =  3'b101;
               d_out_reg    =  2'b10;
            end
            else
            begin
               nstate   =  3'b001;
               d_out_reg    =  2'b01;
            end
         end
         3'b011:
         begin
            if(d_in==1'b0)
            begin
               nstate   =  3'b001;
               d_out_reg    =  2'b10;
            end
            else
            begin
               nstate   =  3'b101;
               d_out_reg    =  2'b01;
            end
         end
         3'b100:
         begin
            if(d_in==1'b0)
            begin
               nstate   =  3'b010;
               d_out_reg    =  2'b10;
            end
            else
            begin
               nstate   =  3'b110;
               d_out_reg    =  2'b01;
            end
         end
         3'b101:
         begin
            if(d_in==1'b0)
            begin
               nstate   =  3'b110;
               d_out_reg    =  2'b10;
            end
            else
            begin
               nstate   =  3'b010;
               d_out_reg    =  2'b01;
            end
         end
         3'b110:
         begin
            if(d_in==1'b0)
            begin
               nstate   =  3'b111;
               d_out_reg    =  2'b00;
            end
            else
            begin
               nstate   =  3'b011;
               d_out_reg    =  2'b11;
            end
         end
         3'b111:
         begin
            if(d_in==1'b0)
            begin
               nstate   =  3'b011;
               d_out_reg    =  2'b00;
            end
            else
            begin
               nstate   =  3'b111;
               d_out_reg    =  2'b11;
            end
         end

      endcase
   end



   always @ (posedge clk,negedge rst) 
   begin
//      $display("data in=%d state=%b%b%b data out=%b%b",d_in,reg_1,reg_2,reg_3,d_out_reg[1],d_out_reg[0]);
      if(rst==1'b0)
         cstate   <= 3'b000;
      else if(enable_i==1'b0)
         cstate   <= 3'b000;
      else
         cstate   <= nstate;
   end
   


endmodule
module mem_disp
(
   clk,
   wr,
   addr,
   d_i,
   d_o
);

   input          clk;
   input          wr;
   input [9:0]    addr;
   input          d_i;
   output reg     d_o;
   
   reg            mem   [1023:0];


   always @ (posedge clk)
   begin
      if(wr)
         mem[addr]   <= d_i;
      d_o  <=  mem[addr];
  end
endmodule
module mem
(
   clk,
   wr,
   addr,
   d_i,
   d_o
);

   input                clk;
   input                wr;
   input       [9:0]    addr;
   input       [7:0]    d_i;
   output reg  [7:0]    d_o;
   
   reg         [7:0]    mem   [1023:0];



   always @ (posedge clk)
   begin
      if(wr)
         mem[addr]   <= d_i;
      d_o  <=  mem[addr];
          
   end
endmodule
module tbu
(
   clk,
   rst,
   enable,
   selection,
   d_in_0,
   d_in_1,
   d_o,
   wr_en
);

   input       clk;
   input       rst;
   input       enable;
   input       selection;
   input [7:0] d_in_0;
   input [7:0] d_in_1;
   output reg  d_o;
   output reg  wr_en;


   reg         d_o_reg;
   reg         wr_en_reg;

   
   reg   [2:0] pstate;
   reg   [2:0] nstate;

   reg         selection_buf;

   always @(posedge clk)
   begin
      selection_buf  <= selection;
      wr_en          <= wr_en_reg;
      d_o            <= d_o_reg;
   end
   always @(posedge clk or negedge rst)
   begin
      if(rst==1'b0)
         pstate   <= 3'b000;
      else if(enable==1'b0)
         pstate   <= 3'b000;
      else if(selection_buf==1'b1 && selection==1'b0)
         pstate   <= 3'b000;
      else
         pstate   <= nstate;
   end


   always @(*)
   begin
      case (pstate)
         3'b000:
         begin
            if(selection==1'b0)
            begin
               wr_en_reg =  1'b0;
               case(d_in_0[0])
                  1'b0: nstate   =  3'b000;
                  1'b1: nstate   =  3'b001;
               endcase
            end
            else
            begin
               d_o_reg   =  d_in_1[0];  
               wr_en_reg =  1'b1;
               case(d_in_1[0])
                  1'b0: nstate   =  3'b000;
                  1'b1: nstate   =  3'b001;
               endcase
           end
         end

         3'b001:
         begin
            if(selection==1'b0)
             begin
             wr_en_reg =  1'b0;
               case(d_in_0[1])
                  1'b0: nstate   =  3'b011;
                  1'b1: nstate   =  3'b010;
               endcase
            end
            else
            begin
               d_o_reg   =  d_in_1[1];  
               wr_en_reg =  1'b1;
               case(d_in_1[1])
                  1'b0: nstate   =  3'b011;
                  1'b1: nstate   =  3'b010;
               endcase
           end
         end

         3'b010:
         begin
            if(selection==1'b0)
            begin
               wr_en_reg =  1'b0;
               case(d_in_0[2])
                  1'b0: nstate   =  3'b100;
                  1'b1: nstate   =  3'b101;
               endcase
            end
            else
            begin
               d_o_reg   =  d_in_1[2];  
               wr_en_reg =  1'b1;
               case(d_in_1[2])
                  1'b0: nstate   =  3'b100;
                  1'b1: nstate   =  3'b101;
               endcase
            end
         end

         3'b011:
         begin
            if(selection==1'b0)
            begin
               wr_en_reg =  1'b0;
               case(d_in_0[3])
                  1'b0: nstate   =  3'b111;
                  1'b1: nstate   =  3'b110;
               endcase
            end
            else
            begin
               d_o_reg   =  d_in_1[3]; 
               wr_en_reg =  1'b1;
               case(d_in_1[3])
                  1'b0: nstate   =  3'b111;
                  1'b1: nstate   =  3'b110;
               endcase
            end
         end

         3'b100:
         begin
            if(selection==1'b0)
            begin
               wr_en_reg =  1'b0;
               case(d_in_0[4])
                  1'b0: nstate   =  3'b001;
                  1'b1: nstate   =  3'b000;
               endcase
            end
            else
            begin
               d_o_reg   =  d_in_1[4];  
               wr_en_reg =  1'b1;
               case(d_in_1[4])
                  1'b0: nstate   =  3'b001;
                  1'b1: nstate   =  3'b000;
               endcase
            end
         end

         3'b101:
         begin
            if(selection==1'b0)
            begin
               wr_en_reg =  1'b0;
               case(d_in_0[5])
                  1'b0: nstate   =  3'b010;
                  1'b1: nstate   =  3'b011;
               endcase
            end
            else
            begin
               d_o_reg   =  d_in_1[5];  
               wr_en_reg =  1'b1;
               case(d_in_1[5])
                  1'b0: nstate   =  3'b010;
                  1'b1: nstate   =  3'b011;
               endcase
            end
         end

         3'b110:
         begin
            if(selection==1'b0)
            begin
               wr_en_reg =  1'b0;
               case(d_in_0[6])
                  1'b0: nstate   =  3'b101;
                  1'b1: nstate   =  3'b100;
               endcase
            end
            else
            begin
               d_o_reg   =  d_in_1[6];  
               wr_en_reg =  1'b1;
               case(d_in_1[6])
                  1'b0: nstate   =  3'b101;
                  1'b1: nstate   =  3'b100;
               endcase
            end
         end

         3'b111:
         begin
            if(selection==1'b0)
            begin
               wr_en_reg =  1'b0;
               case(d_in_0[7])
                  1'b0: nstate   =  3'b110;
                  1'b1: nstate   =  3'b111;
               endcase
            end
            else
            begin
               d_o_reg   =  d_in_1[7];  
               wr_en_reg =  1'b1;
               case(d_in_1[7])
                  1'b0: nstate   =  3'b110;
                  1'b1: nstate   =  3'b111;
               endcase
            end
         end
      endcase
   end

endmodule
module viterbi_tx_rx(
   clk,
   rst,
   encoder_i,
   enable_encoder_i,
   decoder_o
);
   input    clk;
   input    rst;
   input    encoder_i;
   input    enable_encoder_i;
   output   decoder_o;

   wire  [1:0] encoder_o;


   reg   [3:0] error_counter;
   reg   [1:0] encoder_o_reg;
   
   reg         enable_decoder_in;
   wire        valid_encoder_o;



   always @ (posedge clk or negedge rst)
   begin
      if(rst==1'b0)
      begin  
         error_counter  <= 4'd0;
         encoder_o_reg  <= 2'b00;
         enable_decoder_in <= 1'b0;
      end
      else
      begin   
         enable_decoder_in <= valid_encoder_o; 
         encoder_o_reg  <= 2'b00;
         error_counter  <= error_counter + 4'd1;
         if(error_counter==4'b1111)
            encoder_o_reg  <= {~encoder_o[1],encoder_o[0]};
         else
            encoder_o_reg  <= {encoder_o[1],encoder_o[0]};
      end   
   end


   encoder encoder1
   (
      .clk(clk),
      .rst(rst),
      .enable_i(enable_encoder_i),
      .d_in(encoder_i),
      .valid_o(valid_encoder_o),
      .d_out(encoder_o)
   );

   decoder decoder1
   (
      .clk(clk),
      .rst(rst),
      .enable(enable_decoder_in),
      .d_in(encoder_o_reg),
      .d_out(decoder_o)
   );
endmodule

module bmc000
(
   rx_pair,
   path_0_bmc,
   path_1_bmc
);


   input    [1:0] rx_pair;
   output   [1:0] path_0_bmc;
   output   [1:0] path_1_bmc;

   
   assign tmp00         =  (rx_pair[0] ^ 1'b0);
   assign tmp01         =  (rx_pair[1] ^ 1'b0);
   
   assign tmp10         =  (rx_pair[0] ^ 1'b1);
   assign tmp11         =  (rx_pair[1] ^ 1'b1);

   assign path_0_bmc    =  {(tmp00 & tmp01),(tmp00 ^ tmp01)}; 
   assign path_1_bmc    =  {(tmp10 & tmp11),(tmp10 ^ tmp11)};


endmodule
module bmc001
(
   rx_pair,
   path_0_bmc,
   path_1_bmc
);


   input    [1:0] rx_pair;
   output   [1:0] path_0_bmc;
   output   [1:0] path_1_bmc;

   assign tmp00         =  (rx_pair[0] ^ 1'b0);
   assign tmp01         =  (rx_pair[1] ^ 1'b1);
   
   assign tmp10         =  (rx_pair[0] ^ 1'b1);
   assign tmp11         =  (rx_pair[1] ^ 1'b0);

   assign path_0_bmc    =  {(tmp00 & tmp01),(tmp00 ^ tmp01)}; 
   assign path_1_bmc    =  {(tmp10 & tmp11),(tmp10 ^ tmp11)};

endmodule
module bmc010
(
   rx_pair,
   path_0_bmc,
   path_1_bmc
);


   input    [1:0] rx_pair;
   output   [1:0] path_0_bmc;
   output   [1:0] path_1_bmc;

   assign tmp00         =  (rx_pair[0] ^ 1'b0);
   assign tmp01         =  (rx_pair[1] ^ 1'b1);
   
   assign tmp10         =  (rx_pair[0] ^ 1'b1);
   assign tmp11         =  (rx_pair[1] ^ 1'b0);

   assign path_0_bmc    =  {(tmp00 & tmp01),(tmp00 ^ tmp01)}; 
   assign path_1_bmc    =  {(tmp10 & tmp11),(tmp10 ^ tmp11)};


endmodule
module bmc011
(
   rx_pair,
   path_0_bmc,
   path_1_bmc
);


   input    [1:0] rx_pair;
   output   [1:0] path_0_bmc;
   output   [1:0] path_1_bmc;

   assign tmp00         =  (rx_pair[0] ^ 1'b0);
   assign tmp01         =  (rx_pair[1] ^ 1'b0);
   
   assign tmp10         =  (rx_pair[0] ^ 1'b1);
   assign tmp11         =  (rx_pair[1] ^ 1'b1);

   assign path_0_bmc    =  {(tmp00 & tmp01),(tmp00 ^ tmp01)}; 
   assign path_1_bmc    =  {(tmp10 & tmp11),(tmp10 ^ tmp11)};


endmodule
module bmc100
(
   rx_pair,
   path_0_bmc,
   path_1_bmc
);


   input    [1:0] rx_pair;
   output   [1:0] path_0_bmc;
   output   [1:0] path_1_bmc;

   assign tmp00         =  (rx_pair[0] ^ 1'b0);
   assign tmp01         =  (rx_pair[1] ^ 1'b0);
   
   assign tmp10         =  (rx_pair[0] ^ 1'b1);
   assign tmp11         =  (rx_pair[1] ^ 1'b1);

   assign path_0_bmc    =  {(tmp00 & tmp01),(tmp00 ^ tmp01)}; 
   assign path_1_bmc    =  {(tmp10 & tmp11),(tmp10 ^ tmp11)};

endmodule
module bmc101
(
   rx_pair,
   path_0_bmc,
   path_1_bmc
);


   input    [1:0] rx_pair;
   output   [1:0] path_0_bmc;
   output   [1:0] path_1_bmc;

   assign tmp00         =  (rx_pair[0] ^ 1'b0);
   assign tmp01         =  (rx_pair[1] ^ 1'b1);
   
   assign tmp10         =  (rx_pair[0] ^ 1'b1);
   assign tmp11         =  (rx_pair[1] ^ 1'b0);

   assign path_0_bmc    =  {(tmp00 & tmp01),(tmp00 ^ tmp01)}; 
   assign path_1_bmc    =  {(tmp10 & tmp11),(tmp10 ^ tmp11)};

endmodule
module bmc110
(
   rx_pair,
   path_0_bmc,
   path_1_bmc
);


   input    [1:0] rx_pair;
   output   [1:0] path_0_bmc;
   output   [1:0] path_1_bmc;

   assign tmp00         =  (rx_pair[0] ^ 1'b0);
   assign tmp01         =  (rx_pair[1] ^ 1'b1);
   
   assign tmp10         =  (rx_pair[0] ^ 1'b1);
   assign tmp11         =  (rx_pair[1] ^ 1'b0);

   assign path_0_bmc    =  {(tmp00 & tmp01),(tmp00 ^ tmp01)}; 
   assign path_1_bmc    =  {(tmp10 & tmp11),(tmp10 ^ tmp11)};

endmodule
module bmc111
(
   rx_pair,
   path_0_bmc,
   path_1_bmc
);


   input    [1:0] rx_pair;
   output   [1:0] path_0_bmc;
   output   [1:0] path_1_bmc;

   assign tmp00         =  (rx_pair[0] ^ 1'b0);
   assign tmp01         =  (rx_pair[1] ^ 1'b0);
   
   assign tmp10         =  (rx_pair[0] ^ 1'b1);
   assign tmp11         =  (rx_pair[1] ^ 1'b1);

   assign path_0_bmc    =  {(tmp00 & tmp01),(tmp00 ^ tmp01)}; 
   assign path_1_bmc    =  {(tmp10 & tmp11),(tmp10 ^ tmp11)};

endmodule
