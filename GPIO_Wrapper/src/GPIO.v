module GPIO(
	input   MAX10_CLK1_50,
	input  [9:9] SW,
	output [8:0] LEDR
);
	wire clk;
	wire rst = SW[9];
	wire [31:0] ALUOutput;
	
	PLL pll(.clk_i(MAX10_CLK1_50), .reset(rst), .clk_o(clk));
	
	MIPS_Multicycle mips(.clk(clk), .rst(rst), .ALUOutput(ALUOutput));
	
	assign LEDR = ALUOutput[8:0];

endmodule 