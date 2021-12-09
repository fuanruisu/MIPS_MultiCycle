module Buffer2Bus #(parameter WIDTH = 32)(
input [WIDTH-1:0] bus1, bus2, 
input clk,
output reg [WIDTH-1:0] B2BOut1, B2BOut2  //Buffer 2 buses Output
);

always @ (posedge clk)
begin	
		
	B2BOut1 <= bus1;
	B2BOut2 <= bus2;
	
end

endmodule 