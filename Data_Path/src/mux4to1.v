module mux4to1 #(parameter WIDTH = 32)
(
input [WIDTH-1:0] in1, in2, in3, in4, 
input [1:0] sel,
output reg [WIDTH-1:0] MOut);

always @(*)
begin
MOut = {(WIDTH){1'b0}};
case (sel)
	2'b00: MOut = in1;
	2'b01: MOut = in2;
	2'b10: MOut = in3;
	2'b11: MOut = in4;
endcase 
end

endmodule 