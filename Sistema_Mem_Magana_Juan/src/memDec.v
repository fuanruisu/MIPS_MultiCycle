module memDec
#(parameter WIDTH = 32)
(
input [WIDTH-1:0] addr,
output reg sel
);
always @(addr) begin
	if(addr>=32'h00400000 && addr<32'h10010000) 
		sel=1'b0;
	else if(addr>=32'h10010000 && addr<32'h10080000) 
		sel=1'b1;
	else 
		sel=1'bx;
	
	end

endmodule 