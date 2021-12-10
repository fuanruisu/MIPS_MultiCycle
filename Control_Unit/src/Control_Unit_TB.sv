module Control_Unit_TB();
logic [1:0] ALUOp_tb, ALUSrcB_tb;
logic [5:0] Funct_tb, Opcode_tb;
logic clk_tb = 0, rst_tb, MemtoReg, RegDst, IorD, PCSrc, ALUSrcA, IRWrite, MemWrite, PCWrite, Branch, RegWrite;
wire [2:0] ALUControl_tb;

/*ALU_Decoder DUV(
.ALUOp(ALUOp_tb),
.func(Funct_tb),
.ALUControl(ALUControl_tb));

initial begin 
#0 ALUOp_tb = 2'b00;
#100 ALUOp_tb = 2'b01;
#100 ALUOp_tb = 2'b10;
#10 Funct_tb = 6'b0;
#10 Funct_tb = 6'b100000;
#10 Funct_tb = 6'b100010;
#10 Funct_tb = 6'b100100;
#10 Funct_tb = 6'b100101;
#10 Funct_tb = 6'b101010;



end*/

/*Main_Controller DUV(
.Opcode(Opcode_tb),
.clk(clk_tb), .rst_n(rst_tb),
.MemtoReg(MemtoReg), .RegDst(RegDst), .IorD(IorD), .PCSrc(PCSrc), .ALUSrcA(ALUSrcA), .IRWrite(IRWrite), .MemWrite(MemWrite), .PCWrite(PCWrite), .Branch(Branch), .RegWrite(RegWrite),
.ALUSrcB(ALUSrcB_tb), .ALUOp(ALUOp_tb));*/

Control_Unit DUT(
.Opcode(Opcode_tb), .Funct(Funct_tb), .clk(clk_tb), .rst(rst_tb),
.MemtoReg(MemtoReg), .RegDst(RegDst), .IorD(IorD), .PCSrc(PCSrc), .ALUSrcA(ALUSrcA), .IRWrite(IRWrite), .MemWrite(MemWrite), .PCWrite(PCWrite), .Branch(Branch), .RegWrite(RegWrite),
.ALUControl(ALUControl_tb),
.ALUSrcB(ALUSrcB_tb)
);

initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end

initial 
	begin
	#0 rst_tb = 0;
	#5 rst_tb = 1;
	#0 Opcode_tb = 0;
	#0 Funct_tb = 6'b0;
	
	end



endmodule