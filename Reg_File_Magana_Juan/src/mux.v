module mux #(parameter WIDTH = 32)(input [WIDTH-1:0] regAdr, regAdr1, regAdr2, regAdr3, regAdr4, regAdr5, regAdr6, regAdr7, regAdr8, regAdr9, regAdr10, regAdr11, regAdr12, regAdr13, regAdr14, regAdr15, regAdr16, regAdr17, regAdr18, regAdr19, regAdr20, regAdr21, regAdr22, regAdr23, regAdr24, regAdr25, regAdr26, regAdr27, regAdr28, regAdr29, regAdr30, regAdr31,
input [$clog2(WIDTH)-1:0] sel,
output reg [WIDTH-1:0] regOut);

always @(*) begin
	case (sel)
	0: regOut = regAdr;
	1: regOut = regAdr1;
	2: regOut = regAdr2;
	3: regOut = regAdr3;
	4: regOut = regAdr4;
	5: regOut = regAdr5;
	6: regOut = regAdr6;
	7: regOut = regAdr7;
	8: regOut = regAdr8;
	9: regOut = regAdr9;
	10: regOut = regAdr10;
	11: regOut = regAdr11;
	12: regOut = regAdr12;
	13: regOut = regAdr13;
	14: regOut = regAdr14;
	15: regOut = regAdr15;
	16: regOut = regAdr16;
	17: regOut = regAdr17;
	18: regOut = regAdr18;
	19: regOut = regAdr19;
	20: regOut = regAdr20;
	21: regOut = regAdr21;
	22: regOut = regAdr22;
	23: regOut = regAdr23;
	24: regOut = regAdr24;
	25: regOut = regAdr25;
	26: regOut = regAdr26;
	27: regOut = regAdr27;
	28: regOut = regAdr28;
	29: regOut = regAdr29;
	30: regOut = regAdr30;
	31: regOut = regAdr31;
	endcase
end



endmodule 