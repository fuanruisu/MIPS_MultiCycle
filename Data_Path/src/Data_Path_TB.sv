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
//addi process
for(i=0;i<=8;i=i+4)begin
	#10 Addr_i_tb = 32'h00400000+i;
	#2 PCen_tb = 1;
	#2 IorD_tb = 0;
	#2 IRWrite_tb = 1;
	#10 RegDst_tb = 0;	
	#10 ALUSrcA_tb = 1;
	#10 ALUSrcB_tb = 2;
	#10 ALUControl_tb = 2;
	//#0 MemWrite_tb = 1;
	#0 RegWrite_tb = 1;
	#10 MemtoReg_tb = 0;
end

	#0 RegWrite_tb = 0;
	#10 RegDst_tb = 1;	
	#10 ALUSrcA_tb = 1;
	#10 ALUSrcB_tb = 0;
	
	#2 PCen_tb = 1;
	#2 IorD_tb = 0;
	#2 IRWrite_tb = 1;
	#10 ALUControl_tb = 2;


for(i=0;i<=8;i=i+4)begin
	
	#10 Addr_i_tb = 32'h0040000c+i;
	#13 RegWrite_tb = 1;
	#5 RegWrite_tb = 0;
	
	
end
	
	//#0 MemWrite_tb = 1;
	//#0 RegWrite_tb = 1;
	//#10 MemtoReg_tb = 0;

end




endmodule
