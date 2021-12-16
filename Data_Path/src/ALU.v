module ALU #(parameter WIDTH = 32)(		 // ARITHMETIC UNIT
output reg [WIDTH-1: 0] 	y,
input		[WIDTH-1:0]	a, b,
input		[2: 0]	select

);

always @(*)
begin
y= 3'b0;
case (select)
3'b000:	y = a&b;
3'b001:	y = a|b;
3'b010:	y = a + b;
3'b011:	y = a + (~b) + 1'b1;
3'b110:	y = |a^b;


default:		y = 32'b0;
endcase
end
endmodule
