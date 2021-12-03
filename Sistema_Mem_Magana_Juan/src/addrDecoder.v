module addrDecoderRAM #(
parameter WIDTH = 32,
parameter numPosMem = 64
)(
input [WIDTH-1:0] addr,
output reg [$clog2(numPosMem)-1:0] outAddr
);

always @(addr) begin
	if(addr>=32'h10010000 && addr<32'h100100ff) 
		outAddr = (addr-32'h10010000)>>2;
	else 
		outAddr = 6'bx;
	
end



endmodule 