module FF #(
parameter WIDTH = 32
)
(
input clk,
input reset, 
input [WIDTH-1:0] d,
input enable, 
output reg [WIDTH-1:0] q
);
always @ (negedge reset or posedge clk)
begin
	// Reset whenever the reset signal goes low, regardless of the clock
	// or the clock enable
	if (!reset)
	begin
		q <= 32'b0;
	end
	// If not resetting, and the clock signal is enabled on this register,
	// update the register output on the clock's rising edge
	else
	begin
		if (enable)
		begin
			q <= d;
		end
	end
end
endmodule 