module ALU_Decoder(
input [1:0] ALUOp,
input [5:0] func,
output reg [2:0] ALUControl);

always @ (*) begin
	case(ALUOp)
	2'b00: ALUControl = 3'b010;
	2'b01: ALUControl = 3'b110;
	2'b10: 
		begin	
		case(func)
		6'b100000: ALUControl = 3'b010;
		6'b100010: ALUControl = 3'b110;
		6'b100100: ALUControl = 3'b0;
		6'b100101: ALUControl = 3'b001;
		6'b101010: ALUControl = 3'b111;
		default: ALUControl = 3'bx;
		endcase
		end
	default: ALUControl = 3'bx;
	endcase

end


endmodule 