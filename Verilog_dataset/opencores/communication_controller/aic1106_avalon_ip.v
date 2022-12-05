module AIC1106_PCM(
        // Avalon clock 
        csi_avalon_clk,
        csi_reset, 

        // Avalon stream audio clock 2.048 MHz
        csi_audio_clk,
         
         // Control/status reg Avalon slave
		avs_creg_address,
		avs_creg_chipselect,
		avs_creg_write,
		avs_creg_read,
		avs_creg_writedata,
		avs_creg_readdata,         
			
         // Avalon stream sink
        asi_data,
        asi_valid,
        asi_ready,

         // Avalon stream source
        aso_data,
        aso_valid,
			
			// TLV320AIC1106 signal
        coe_mclk,
        coe_pcmsyn,
        coe_pcmi,
        coe_pcmo,
        coe_reset_n,
        coe_mute,
        coe_linsel   // always 0 (linear mode)
         );
         
input                   csi_avalon_clk;
input                   csi_reset;          

input                   csi_audio_clk;
         
output   [ 31:0]        avs_creg_readdata;
input    [  1:0]        avs_creg_address;
input                   avs_creg_chipselect;
input                   avs_creg_read;
input                   avs_creg_write;
input    [ 31:0]        avs_creg_writedata;          

input    [ 31:0]        asi_data;
input                   asi_valid;
output                  asi_ready;
         
output                  aso_valid;
output   [31:0]         aso_data;

output                  coe_mclk;
output                  coe_pcmsyn;
output                  coe_pcmi;
input                   coe_pcmo;
output                  coe_reset_n;
output                  coe_mute;
output   wire           coe_linsel = 1'b0;  // linear mode

reg                     enable_r;
reg                     loopback_r;
reg                     reset_req_r;
reg                     pcmsyn_r;
reg                     mute_r;
reg                     underflow_r;
reg      [31:0]         tx_latch_r;
reg      [31:0]         rx_latch_r;
reg      [15:0]         tx_shft_r;
reg      [15:0]         rx_shft_r;
reg      [2:0]          volume_r;
reg                     asi_ready_r;
reg                     aso_valid_r;
reg						reset_r;
reg      [8:0]          main_cnt;

wire                    asi_ready = asi_ready_r;

wire                    aso_valid = aso_valid_r;
assign                  aso_data[31:0] = rx_latch_r[31:0];

wire                    coe_mclk = csi_audio_clk & enable_r;
wire                    coe_pcmsyn = pcmsyn_r & enable_r;
wire                    coe_pcmi = tx_shft_r[15] & enable_r;
wire                    coe_mute = mute_r;
wire                    coe_reset_n = reset_r;//~(reset_req_r | csi_reset); 

wire                    rx_shft_in = (loopback_r)?(coe_pcmi):(coe_pcmo);

assign                  avs_creg_readdata = (avs_creg_address[1:0] == 2'h0)?(state):(0);
wire     [31:0]         state = {25'b0, underflow_r, coe_mute, ~coe_reset_n, 1'b0, volume_r[2:0]}; 
wire                    creg_reg_sel_w      = avs_creg_write & avs_creg_chipselect & (avs_creg_address[1:0] == 2'h0); 

// NIOS control interface
always @(posedge csi_avalon_clk or posedge csi_reset)
begin
  if (csi_reset)
  begin
     reset_req_r <= 0;
     mute_r <= 0;
     volume_r[2:0] <= 1;  // 0 db gain
     loopback_r <= 0;
	 enable_r <= 0;
  end   
  else if (creg_reg_sel_w)
  begin
     volume_r[2:0] <= avs_creg_writedata[2:0]; 
     mute_r        <= avs_creg_writedata[3];
	 enable_r      <= avs_creg_writedata[4];
     loopback_r    <= avs_creg_writedata[5];
     reset_req_r   <= avs_creg_writedata[6];
  end   
end 

// PCM state decoder
wire     fs_avalon_rdy_on   = (main_cnt == 9'd0);
wire     fs_avalon_rdy_off  = (main_cnt == 9'd1);
wire     fs_txlatch         = (main_cnt == 9'd2);
wire     fs_pcmsyn1_on      = (main_cnt == 9'd3);
wire     fs_pcmsyn1_off     = (main_cnt == 9'd4);
wire     fs_shift1          = ((main_cnt > 9'd4) && (main_cnt <= 9'd20));
wire     fs_rxlatch1        = (main_cnt == 9'd21);//21
wire     fs_pcmsyn2_on      = (main_cnt == 9'd259);
wire     fs_pcmsyn2_off     = (main_cnt == 9'd260);
wire     fs_shift2          = ((main_cnt > 9'd260) && (main_cnt <= 9'd276));
wire     fs_rxlatch2        = (main_cnt == 9'd277);//277
wire     fs_rxvalid_off     = (main_cnt == 9'd278);


// PCM receive shift register; clocked by negedge
always @(negedge csi_audio_clk or posedge reset_req_r)
begin
   if (reset_req_r)
   begin
      rx_shft_r <= 0;
   end
   else begin
      if (fs_shift1 || fs_shift2)
      begin
         rx_shft_r[15:0] <= {rx_shft_r[14:0], rx_shft_in};
      end
   end
end

// PCM receive path and AVALON stream source logic
always @(posedge csi_audio_clk or posedge reset_req_r)
begin
   if (reset_req_r)
   begin
      rx_latch_r <= 0;
      aso_valid_r <= 0;
   end
   else begin
      if (fs_rxlatch1)
      begin
         rx_latch_r[15:0] <= rx_shft_r[15:0];
      end
      else if (fs_rxlatch2)
      begin
         rx_latch_r[31:16] <= rx_shft_r[15:0];
         aso_valid_r <= 1;
      end
      else if (fs_rxvalid_off)
      begin
         aso_valid_r <= 0;
      end
   end
end   

// PCM transmit path and AVALON stream sink logic
always @(posedge csi_audio_clk or posedge reset_req_r)
begin
   if (reset_req_r)
   begin
      main_cnt <= 0;
      underflow_r <= 0;
      asi_ready_r <= 0;
      pcmsyn_r <= 0;
   end
   else begin
      main_cnt <= main_cnt + 1'b1;
      if (fs_avalon_rdy_on)
      begin
         asi_ready_r <= 1;
      end 
      else if (fs_avalon_rdy_off)
      begin
         asi_ready_r <= 0;
      end
      else if (fs_txlatch)
      begin
         if (asi_valid)
         begin
            tx_latch_r[31:0] <= asi_data[31:0];
         end   
         else begin
            underflow_r <= 1;
            tx_latch_r[31:0] <= 0;
         end   
      end
      else if (fs_pcmsyn1_on)
      begin
         pcmsyn_r <= 1;
         tx_shft_r[15:0] <= {tx_latch_r[12:0], volume_r[2:0]}; //!!
      end
      else if (fs_pcmsyn1_off)
      begin
         pcmsyn_r <= 0;
      end
      else if (fs_shift1)
      begin
         tx_shft_r[15:0] <= {tx_shft_r[14:0], 1'b0};
      end
      else if (fs_pcmsyn2_on)
      begin
         pcmsyn_r <= 1;
         tx_shft_r[15:0] <= {tx_latch_r[28:16], volume_r[2:0]};   //!!
      end
      else if (fs_pcmsyn2_off)
      begin
         pcmsyn_r <= 0;
      end
      else if (fs_shift2)
      begin
         tx_shft_r[15:0] <= {tx_shft_r[14:0], 1'b0};
      end
   end   
end

// resync reset to csi_audio_clk
always @(posedge csi_audio_clk)
begin
	reset_r <= ~(reset_req_r | csi_reset);
end

endmodule

          