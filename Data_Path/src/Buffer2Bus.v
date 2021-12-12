module Buffer2Bus #(parameter WIDTH = 32)(
input [WIDTH-1:0] bus1, bus2, 
input clk, rst,
output reg [WIDTH-1:0] B2BOut1, B2BOut2  //Buffer 2 buses Output
);

always @ (negedge rst or posedge clk)
begin
	// Reset whenever the reset signal goes low, regardless of the clock
	if (!rst)
	begin
		B2BOut1 <= 32'b0;
		B2BOut2 <= 32'b0;
	end
	// If not resetting, update the register output on the clock's rising edge
	else
	begin
		B2BOut1 <= bus1;
		B2BOut2 <= bus2;
	end
end


endmodule 