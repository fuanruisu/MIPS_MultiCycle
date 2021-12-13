module PC #(parameter WIDTH = 32)(
input [WIDTH-1:0] Addr_i,
input enable, clk, rst,
output reg [WIDTH-1:0] Addr_o
);

always @ (negedge rst or posedge clk)
begin
	// Reset whenever the reset signal goes low, regardless of the clock
	if (!rst)
	begin
		Addr_o <= 32'h00400000;
	end
	// If not resetting, update the register output on the clock's rising edge
	else
	begin
		if (enable) Addr_o <= Addr_i;
	end
end
endmodule 