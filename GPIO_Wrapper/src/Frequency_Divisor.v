module Frequency_Divisor
(	input clk_i, 
	input reset,
	output clk_o
);

  localparam SPEED= 500000000; 
  integer counter = 0;
   
  always@ (negedge reset, posedge clk_i) begin
	   if (reset == 1'b0 ) begin 
			counter <= 0;
		end
	   else begin
				if (counter == SPEED) counter <=0;
				else counter <= counter + 1;
		end		
	end
	
	assign clk_o = counter;
	
endmodule 