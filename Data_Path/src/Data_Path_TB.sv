module Data_Path_TB();

parameter WIDTH = 32, MEMORY_DEPTH = 64;
reg clk_tb = 0, PCen_tb, IorD_tb, MemWrite_tb, IRWrite_tb, RegDst_tb, MemtoReg_tb, RegWrite_tb, ALUSrcA_tb, PCsrc_tb;
reg reset_tb;
reg [1:0] ALUSrcB_tb;
reg [2:0] ALUControl_tb;
reg [15:0] Imm;
reg [WIDTH-1:0] Addr_i_tb;
wire [WIDTH-1:0] ALU_o_tb;

  
Data_Path #(.WIDTH(WIDTH), .MEMORY_DEPTH(MEMORY_DEPTH))
DUV
(.PCen(PCen_tb), .IorD(IorD_tb), .MemWrite(MemWrite_tb), .IRWrite(IRWrite_tb), .RegDst(RegDst_tb), .MemtoReg(MemtoReg_tb), .RegWrite(RegWrite_tb), .ALUSrcA(ALUSrcA_tb), .PCsrc(PCsrc_tb), .clk(clk_tb), .reset(reset_tb),
.ALUSrcB(ALUSrcB_tb),
.ALUControl(ALUControl_tb),
.Addr_i(Addr_i_tb),
.ALU_o(ALU_o_tb) 
);

/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin // reset generator
integer i;
for(i=0;i<=24;i=i+4)begin
	#50 Addr_i_tb = 32'h00400000+i;
	#0 PCen_tb = 1;
	#0 IorD_tb = 1;
	#0 IRWrite_tb = 1;
	#0 RegDst_tb = 1;
end
end



endmodule
