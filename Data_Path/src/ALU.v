module ALU #(parameter WIDTH = 32)(		 // ARITHMETIC UNIT
output reg [WIDTH-1: 0] 	y,
input		[WIDTH-1:0]	a, b,
input					c_in,
input		[4: 0]	select

);

always @(*)
begin
y= 4'b0;
case ({select, c_in})
6'b00000_0:	y = a;
6'b00000_1:	y = a + 1'b1;
6'b00001_0:	y = a + b;
6'b00001_1:	y = a + b + 1'b1;
6'b00010_0:	y = a + ~b;
6'b00010_1:	y = a + (~b) + 1'b1;
6'b00011_0:	y = a - 1'b1;
6'b00011_1:	y = b;
6'b00100_0:	y = a & b;
6'b00100_1:	y = ~(a & b);//nand
6'b00101_0:	y = a | b;
6'b00101_1:	y = ~(a | b);//nor
6'b00110_0: 	y = a ^ b;
6'b00110_1: 	y = ~(a ^ b);//xnor
6'b00111_0:	y = ~a;
6'b00111_1:	y = ~b;//b complement
6'b01000_0:	y = a << 1;
6'b01000_1:	y = b << 1;//left shift b
6'b10000_0:	y = a >> 1;//16
6'b10000_1:	y = b >> 1;//16: rigth shift bh
6'b11000_0:	y = ~a+1;//24: 2's complement a
6'b11000_1:	y = ~b+1;//24: 2's complement b

default:		y = 32'b0;
endcase
end
endmodule
