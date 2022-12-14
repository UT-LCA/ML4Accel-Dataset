`define ADDR_WIDTH_21_8 8
`define DATA_WIDTH_21_8 21
`define ADDR_WIDTH_128_8 8
`define DATA_WIDTH_128_8 128
`define _A25_CONFIG_DEFINES
`define A25_ICACHE_WAYS 4
`define A25_DCACHE_WAYS 4
`define _A25_CONFIG_DEFINES
`define A25_ICACHE_WAYS 4
`define A25_DCACHE_WAYS 4
//`define A25_DECOMPILE
//`define A25_COPRO15_DEBUG
//`define A25_CACHE_DEBUG
//    `define A25_DECOMPILE_FILE    "amber.dis"

module a25_coprocessor(
			i_clk,
			i_core_stall,     
//			i_copro_opcode1,
//			i_copro_opcode2,
			i_copro_crn,      
//			i_copro_crm,
//			i_copro_num,
			i_copro_operation,
			i_copro_write_data, 
			i_fault,       
			i_fault_status,
			i_fault_address,  
			o_copro_read_data,
			o_cache_enable,
			o_cache_flush,
			o_cacheable_area 
		);

/************************* IO Declarations *********************/
input                       i_clk;
input                       i_core_stall;     // stall all stages of the Amber core at the same time
//input       [2:0]           i_copro_opcode1;
//input       [2:0]           i_copro_opcode2;
input       [3:0]           i_copro_crn;      // Register Number 
//input       [3:0]           i_copro_crm;
//input       [3:0]           i_copro_num;
input       [1:0]           i_copro_operation;
input       [31:0]          i_copro_write_data;
 
input                       i_fault;          // high to latch the fault address and status
input       [7:0]           i_fault_status;
input       [31:0]          i_fault_address;  // the address that caused the fault
 
output      [31:0]          o_copro_read_data;
output                      o_cache_enable;
output                      o_cache_flush;
output      [31:0]          o_cacheable_area;

/*********************** Signal Declarations *******************/
reg      [31:0]          o_copro_read_data; 
// Bit 0 - Cache on(1)/off
// Bit 1 - Shared (1) or seperate User/Supervisor address space
// Bit 2 - address monitor mode(1)
reg [2:0]  cache_control = 3'b000;
 
// Bit 0 - 2MB memory from 0 to 0x01fffff cacheable(1)/not cachable
// Bit 1 - next 2MB region etc.
reg [31:0] cacheable_area = 32'h0;
 
// Marks memory regions as read only so writes are ignored by the cache
// Bit 0 - 2MB memory from 0 to 0x01fffff updateable(1)/not updateable
// Bit 1 - next 2MB region etc.
reg [31:0] updateable_area = 32'h0;
 
// Accesses to a region with a flag set in this register cause the
// cache to flush
// Bit 0 - 2MB memory from 0 to 0x01fffff
// Bit 1 - next 2MB region etc.
reg [31:0] disruptive_area = 32'h0;
 
 
reg [7:0]  fault_status  = 8'd0;
reg [31:0] fault_address = 32'b0;  // the address that caused the fault
 
wire       copro15_reg1_write;
 
 
// ---------------------------
// Outputs
// ---------------------------
assign o_cache_enable   = cache_control[0];
assign o_cache_flush    = copro15_reg1_write;
assign o_cacheable_area = cacheable_area;
 
// ---------------------------
// Capture an access fault address and status
// ---------------------------
always @ ( posedge i_clk )
    if ( !i_core_stall )
        begin
        if ( i_fault )
            begin
       
            fault_status    <= i_fault_status;
            fault_address   <= i_fault_address;
            end
        end
 
 
// ---------------------------
// Register Writes
// ---------------------------
always @ ( posedge i_clk )
    if ( !i_core_stall )         
        begin
        if ( i_copro_operation == 2'd2 )
            case ( i_copro_crn )
                4'd2: cache_control   <= i_copro_write_data[2:0];
                4'd3: cacheable_area  <= i_copro_write_data[31:0];
                4'd4: updateable_area <= i_copro_write_data[31:0];
                4'd5: disruptive_area <= i_copro_write_data[31:0];
		default: cache_control <=cache_control;
            endcase
        end
 
// Flush the cache
assign copro15_reg1_write = !i_core_stall && i_copro_operation == 2'd2 && i_copro_crn == 4'd1;
 
 
// ---------------------------
// Register Reads   
// ---------------------------
always @ ( posedge i_clk )        
    if ( !i_core_stall )
        case ( i_copro_crn )
            // ID Register - [31:24] Company id, [23:16] Manuf id, [15:8] Part type, [7:0] revision
            4'd0:    o_copro_read_data <= 32'h41560300;
            4'd2:    o_copro_read_data <= {29'd0, cache_control}; 
            4'd3:    o_copro_read_data <= cacheable_area; 
            4'd4:    o_copro_read_data <= updateable_area; 
            4'd5:    o_copro_read_data <= disruptive_area; 
            4'd6:    o_copro_read_data <= {24'd0, fault_status };
            4'd7:    o_copro_read_data <= fault_address;
            default: o_copro_read_data <= 32'd0;
        endcase
 
 
endmodule
