module Buffer #(parameter WIDTH = 32)(
input [WIDTH-1:0] Addr_i,
input enable, clk,
output reg [WIDTH-1:0] Addr_o
);

always @ (posedge clk)
begin	
		if (enable)
		begin
			Addr_o <= Addr_i;
		end
end


endmodule 