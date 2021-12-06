module Data_Path #(parameter WIDTH = 32, MEMORY_DEPTH = 64)(
input PCen, IorD, MemWrite, IRWrite, RegDst, MemtoReg, RegWrite, ALUSrcA, PCsrc, clk, reset,
input [1:0] ALUSrcB,
input [2:0] ALUControl,
input [WIDTH-1:0] Addr_i,
output [WIDTH-1:0] ALU_o //Se dejará de esta forma, ya que es mejor práctica crear un wrapper para configurar los perifericos
);
wire [WIDTH-1:0] RegFData1, RegFData2, DblBusOut1, DblBusOut2, M3Out, InM3, Instr, SignExtOut, MemOut, Address, PC, SrcB, SrcA;
wire [WIDTH-1:0] ALUResult,Air;
wire [4:0] M2Out;
wire [5:0] op, funct;

Buffer #(.WIDTH(WIDTH))
PC1
(
.Addr_i(Addr_i),
.enable(PCen), .clk(clk),
.Addr_o(PC)
);

mux2to1 #(.WIDTH(WIDTH))
M1
(.in1(PC), .in2(ALU_o), 
.sel(IorD),
.regOut(Address));

Memory_System
#
(
.MEMORY_DEPTH(MEMORY_DEPTH),
.DATA_WIDTH(WIDTH)
)
Mem1
(
.clk_i(clk),
.write_enable_i(MemWrite),
.Write_Data(DblBusOut2),
.Address_i(Address),
.Instruction_o(MemOut)
);

Buffer #(.WIDTH(WIDTH))
BF1
(
.Addr_i(MemOut),
.enable(IRWrite), .clk(clk),
.Addr_o(Instr)
);

Buffer #(.WIDTH(WIDTH))
BF2
(
.Addr_i(MemOut),
.enable(1'b1), .clk(clk),
.Addr_o(InM3)
);

mux2to1 #(.WIDTH(5))
M2
(.in1(Instr[20:16]), .in2(Instr[15:11]), 
.sel(RegDst),
.regOut(M2Out));

mux2to1 #(.WIDTH(WIDTH))
M3
(.in1(ALU_o), .in2(InM3), 
.sel(MemtoReg),
.regOut(M3Out));

SignExtend #(.WIDTH(WIDTH))
SignExt
(
.Imm(Instr[15:0]), //array Imm de longitud de 16 bits
.SignExtImm(SignExtOut) // array SignExtImm de 32 bits
);


regFile #(
.N(WIDTH))
RegF1
(
.clk(clk),
.reset(reset), 
.Reg_Write_i(RegWrite),
.Write_Register_i(M2Out),//mux A3 regfile
.Read_Register_1_i(Instr[25:21]),//Instruction fetch register 25:21
.Read_Register_2_i(Instr[20:16]),//Instruction fetch register 20:16
.Write_Data_i(M3Out),//mux WD3 regfile
.Read_Data_1_o(RegFData1),//register 2bus
.Read_Data_2_o(RegFData2)//register 2bus
);

Buffer2Bus #(.WIDTH(WIDTH))
B2B
(
.bus1(RegFData1), .bus2(RegFData2), 
.clk(clk),
.B2BOut1(DblBusOut1), .B2BOut2(DblBusOut2)  //Buffer 2 buses Output
);


mux2to1 #(.WIDTH(WIDTH))
M4
(.in1(PC), .in2(DblBusOut1), 
.sel(ALUSrcA),
.regOut(SrcA));

mux4to1 #(.WIDTH(WIDTH))
M5
(
.in1(DblBusOut2), .in2(4), .in3(SignExtOut), .in4(SignExtOut<<2), 
.sel(ALUSrcB),
.MOut(SrcB));

ALU #(.WIDTH(WIDTH))
ALU1
(		 // ARITHMETIC UNIT
.y(ALUResult),
.a(SrcA), .b(SrcB),
.select(ALUControl)
);

Buffer #(.WIDTH(WIDTH))
BF3
(
.Addr_i(ALUResult),
.enable(1'b1), .clk(clk),
.Addr_o(ALU_o)
);

mux2to1 #(.WIDTH(WIDTH))
M6
(.in1(ALUResult), .in2(ALU_o), 
.sel(PCsrc),
.regOut(Air));

endmodule 