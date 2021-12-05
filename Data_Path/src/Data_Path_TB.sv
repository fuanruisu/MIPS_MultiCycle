module Data_Path_TB();

parameter WIDTH = 32;
reg clk_tb = 0;
reg reset_tb;
reg [15:0] Imm;
wire [31:0] SignExtImm;

  
  
SignExtend
#(
	.WIDTH(WIDTH)
)
DUV
(
	.Imm(Imm), //array Imm de longitud de 16 bits
	.SignExtImm(SignExtImm)// array SignExtImm de 32 bits

);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin // reset generator
	#0 Imm = 16;
	#50 Imm = -16;
end



endmodule
