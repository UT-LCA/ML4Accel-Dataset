`define SIMULATION_MEMORY

module sortedstack (keyin, datain, write, reset, peekdata, globalreset, clk);

    input[32 - 1:0] keyin; 
    input[13 - 1:0] datain; 
    input write; 
    input reset; 
    output[13 * 8 - 1:0] peekdata; 

    wire[13 * 8 - 1:0] peekdata;
    wire big_reset; 
    input globalreset; 
    input clk; 

    reg[32 - 1:0] key0; 
    reg[32 - 1:0] key1; 
    reg[32 - 1:0] key2; 
    reg[32 - 1:0] key3; 
    reg[32 - 1:0] key4; 
    reg[32 - 1:0] key5; 
    reg[32 - 1:0] key6; 
    reg[32 - 1:0] key7; 
    reg[13 - 1:0] data0; 
    reg[13 - 1:0] data1; 
    reg[13 - 1:0] data2; 
    reg[13 - 1:0] data3; 
    reg[13 - 1:0] data4; 
    reg[13 - 1:0] data5; 
    reg[13 - 1:0] data6; 
    reg[13 - 1:0] data7; 
    reg full0; 
    reg full1; 
    reg full2; 
    reg full3; 
    reg full4; 
    reg full5; 
    reg full6; 
    reg full7; 
    reg[2:0] location; 

    assign peekdata[(0 + 1) * (13) - 1:0 * (13)] = ((full0) == 1'b1) ? data0 : 0;
    assign peekdata[(1 + 1) * (13) - 1:1 * (13)] = ((full1) == 1'b1) ? data1 : 0;
    assign peekdata[(2 + 1) * (13) - 1:2 * (13)] = ((full2) == 1'b1) ? data2 : 0;
    assign peekdata[(3 + 1) * (13) - 1:3 * (13)] = ((full3) == 1'b1) ? data3 : 0;
    assign peekdata[(4 + 1) * (13) - 1:4 * (13)] = ((full4) == 1'b1) ? data4 : 0;
    assign peekdata[(5 + 1) * (13) - 1:5 * (13)] = ((full5) == 1'b1) ? data5 : 0;
    assign peekdata[(6 + 1) * (13) - 1:6 * (13)] = ((full6) == 1'b1) ? data6 : 0;
    assign peekdata[(7 + 1) * (13) - 1:7 * (13)] = ((full7) == 1'b1) ? data7 : 0;

    // Select the proper insertion point
    always @(keyin or key0 or key1 or key2 or key3 or key4 or key5 or key6 or key7 or full0 or full1 or full2 or full3 or full4 or full5 or full6 or full7)
    begin
		
/* PAJ -- changed for loops */
             if ((keyin < key0) | ((full0) == 1'b0))
             begin
                location = 0 ; 
             end 
             else if ((keyin < key1) | ((full1) == 1'b0))
             begin
                location = 1 ; 
             end 
             else if ((keyin < key2) | ((full2) == 1'b0))
             begin
                location = 2 ; 
             end 
             else if ((keyin < key3) | ((full3) == 1'b0))
             begin
                location = 3 ; 
             end 
             else if ((keyin < key4) | ((full4) == 1'b0))
             begin
                location = 4 ; 
             end 
             else if ((keyin < key5) | ((full5) == 1'b0))
             begin
                location = 5 ; 
             end 
             else if ((keyin < key6) | ((full6) == 1'b0))
             begin
                location = 6 ; 
             end 
			 else
			 begin
				location = 7;
			 end
    end 

	assign big_reset = globalreset | reset;
    always @(posedge clk)
    begin
		if (big_reset == 1'b1)
       begin
                full0 <= 1'b0 ; 
                key0 <= 0;
                data0 <= 0;
                full1 <= 1'b0 ; 
                key1 <= 0;
                data1 <= 0;
                full2 <= 1'b0 ; 
                key2 <= 0;
                data2 <= 0;
                full3 <= 1'b0 ; 
                key3 <= 0;
                data3 <= 0;
                full4 <= 1'b0 ; 
                key4 <= 0;
                data4 <= 0;
                full5 <= 1'b0 ; 
                key5 <= 0;
                data5 <= 0;
                full6 <= 1'b0 ; 
                key6 <= 0;
                data6 <= 0;
                full7 <= 1'b0 ; 
                key7 <= 0;
                data7 <= 0;
       end
       else
       begin
          if (write == 1'b1)
          begin
			if (location == 0)
			begin
				key0 <= keyin;
				data0 <= datain;
				full0 <= 1'b1;
				key1 <= key0;
				data1 <= data0;
				full1 <= full0;
				key2 <= key1;
				data2 <= data1;
				full2 <= full1;
				key3 <= key2;
				data3 <= data2;
				full3 <= full2;
				key4 <= key3;
				data4 <= data3;
				full4 <= full3;
				key5 <= key4;
				data5 <= data4;
				full5 <= full4;
				key6 <= key5;
				data6 <= data5;
				full6 <= full5;
				key7 <= key6;
				data7 <= data6;
				full7 <= full6;
			end
			else if (location == 1)
			begin
				key1 <= keyin;
				data1 <= datain;
				full1 <= 1'b1;
				key2 <= key1;
				data2 <= data1;
				full2 <= full1;
				key3 <= key2;
				data3 <= data2;
				full3 <= full2;
				key4 <= key3;
				data4 <= data3;
				full4 <= full3;
				key5 <= key4;
				data5 <= data4;
				full5 <= full4;
				key6 <= key5;
				data6 <= data5;
				full6 <= full5;
				key7 <= key6;
				data7 <= data6;
				full7 <= full6;
			end
			else if (location == 2)
			begin
				key2 <= keyin;
				data2 <= datain;
				full2 <= 1'b1;
				key3 <= key2;
				data3 <= data2;
				full3 <= full2;
				key4 <= key3;
				data4 <= data3;
				full4 <= full3;
				key5 <= key4;
				data5 <= data4;
				full5 <= full4;
				key6 <= key5;
				data6 <= data5;
				full6 <= full5;
				key7 <= key6;
				data7 <= data6;
				full7 <= full6;
			end
			else if (location == 2)
			begin
				key3 <= keyin;
				data3 <= datain;
				full3 <= 1'b1;
				data4 <= data3;
				full4 <= full3;
				key5 <= key4;
				data5 <= data4;
				full5 <= full4;
				key6 <= key5;
				data6 <= data5;
				full6 <= full5;
				key7 <= key6;
				data7 <= data6;
				full7 <= full6;
			end
			else if (location == 4)
			begin
				key4 <= keyin;
				data4 <= datain;
				full4 <= 1'b1;
				key5 <= key4;
				data5 <= data4;
				full5 <= full4;
				key6 <= key5;
				data6 <= data5;
				full6 <= full5;
				key7 <= key6;
				data7 <= data6;
				full7 <= full6;
			end
			else if (location == 5)
			begin
				key5 <= keyin;
				data5 <= datain;
				full5 <= 1'b1;
				key6 <= key5;
				data6 <= data5;
				full6 <= full5;
				key7 <= key6;
				data7 <= data6;
				full7 <= full6;
			end
			else if (location == 6)
			begin
				key6 <= keyin;
				data6 <= datain;
				full6 <= 1'b1;
				key7 <= key6;
				data7 <= data6;
				full7 <= full6;
			end
			else if (location == 7)
			begin
				key7 <= keyin;
				data7 <= datain;
				full7 <= 1'b1;
			end
		end
     end 
end
endmodule
