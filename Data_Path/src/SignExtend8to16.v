module SignExtend8to16 #(parameter WIDTH = 32)(
input [WIDTH/2-1:0] Imm, //array Imm de longitud de 16 bits
output reg [WIDTH-1:0] SignExtImm // array SignExtImm de 32 bits
);

always @(Imm)
begin
SignExtImm[WIDTH/2-1:0] = Imm;//Igualación de Imm a los primeros 16 bits de array SignExtImm 
case (Imm[WIDTH/2-1])//case cuyo variable de operacion es el bit numero 16 del array Imm, es decir el bit del signo en C2
	0: SignExtImm[WIDTH-1:WIDTH/2] = {(WIDTH/2){1'b0}};//Si el bit de signo es 1, igualamos los 16 MSB en 1 
	1:	SignExtImm[WIDTH-1:WIDTH/2] = {(WIDTH/2){1'b1}};//Si el bit de signo es 0, igualamos los 16 MSB en 0 

endcase 
end

endmodule 