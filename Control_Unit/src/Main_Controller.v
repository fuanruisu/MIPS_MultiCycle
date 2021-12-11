module Main_Controller(
input [5:0] Opcode,
input clk, rst_n,
output reg MemtoReg, RegDst, IorD, PCSrc, ALUSrcA, IRWrite, MemWrite, PCWrite, RegWrite,//Branch
output reg [1:0] ALUSrcB, ALUOp 
);

reg [3:0] state, next;

localparam [3:0] FETCH = 4'd0,
					 DECODE = 4'd1,
					 MEMADR = 4'd2,
					 MEMREAD = 4'd3,
					 MEMWB = 4'd4,
					 MEMW = 4'd5,
					 EXEC = 4'd6,
					 ALUWB = 4'd7,
					 BRANCH = 4'd8;
					 
always @(posedge clk or negedge rst_n)
	if (!rst_n) state <= FETCH;
	else state <= next;
	always @(state) begin
		next <= 4'bx;
		case(state)
			FETCH: begin
				MemtoReg <= 1'bx;
				RegDst <= 1'bx;
				IorD <= 0; 
				PCSrc <= 0; 
				ALUSrcA <= 0; 
				IRWrite <= 1; 
				MemWrite <= 0; 
				PCWrite <= 1; 
				//Branch <= 0; 
				RegWrite <= 0;
				ALUSrcB <= 01;
				ALUOp <= 00;
				/*IorD <= 0;
				ALUSrcA <= 0;
				ALUSrcB <= 01;
				ALUOp <= 00;
				PCSrc <= 0;
				IRWrite <= 1;
				PCWrite <= 1;
				RegDst <= 1'bx;
				MemtoReg <= 1'bx;
				RegWrite <= 1'bx;*/
				next <= DECODE;
			end
			DECODE:begin
				/*IorD <= 1'bx;
				ALUSrcA <= 1'bx;
				ALUSrcB <= 2'bx;
				//ALUOp = 2'b00;
				PCSrc <= 1'bx;
				IRWrite <= 1'b0;
				PCWrite <= 1'b0;*/
				MemtoReg <= 0;
				RegDst <= 0;
				IorD <= 0; 
				PCSrc <= 0; 
				ALUSrcA <= 0; 
				IRWrite <= 0; 
				MemWrite <= 0; 
				PCWrite <= 0; 
				//Branch <= 0; 
				RegWrite <= 0;
				ALUSrcB <= 00;
				ALUOp <= 00;
				if (Opcode==6'b0) next <= EXEC;
				else if (Opcode == 6'h4) next <= BRANCH;
				else if (Opcode != 6'h4) next <= MEMADR;
			end
			MEMADR:begin
				MemtoReg <= 0;
				RegDst <= 0;
				IorD <= 0; 
				PCSrc <= 0; 
				ALUSrcA <= 0; 
				IRWrite <= 0; 
				MemWrite <= 0; 
				PCWrite <= 0; 
				//Branch <= 0; 
				RegWrite <= 0;
				ALUSrcB <= 01;
				ALUOp <= 00;
				next<= MEMREAD;
			end
			MEMREAD: begin
				MemtoReg <= 0;
				RegDst <= 0;
				IorD <= 0; 
				PCSrc <= 0; 
				ALUSrcA <= 0; 
				IRWrite <= 0; 
				MemWrite <= 0; 
				PCWrite <= 0; 
				//Branch <= 0; 
				RegWrite <= 0;
				ALUSrcB <= 01;
				ALUOp <= 00;
				next <= MEMWB;
			end
			MEMWB: begin
				MemtoReg <= 0;
				RegDst <= 0;
				IorD <= 0; 
				PCSrc <= 0; 
				ALUSrcA <= 0; 
				IRWrite <= 0; 
				MemWrite <= 0; 
				PCWrite <= 0; 
				//Branch <= 0; 
				RegWrite <= 0;
				ALUSrcB <= 01;
				ALUOp <= 00;
				next <= MEMW;
			end
			MEMW: begin 
				MemtoReg <= 0;
				RegDst <= 0;
				IorD <= 0; 
				PCSrc <= 0; 
				ALUSrcA <= 0; 
				IRWrite <= 0; 
				MemWrite <= 0; 
				PCWrite <= 0; 
				//Branch <= 0; 
				RegWrite <= 0;
				ALUSrcB <= 01;
				ALUOp <= 00;
				next <= FETCH;
			end
			EXEC:begin
				MemtoReg <= 0;
				RegDst <= 0;
				IorD <= 0; 
				PCSrc <= 0; 
				ALUSrcA <= 0; 
				IRWrite <= 0; 
				MemWrite <= 0; 
				PCWrite <= 0; 
				//Branch <= 0; 
				RegWrite <= 0;
				ALUSrcB <= 01;
				ALUOp <= 00;
				/*IorD <= 1'bx;
				ALUSrcA <= 1'b1;
				ALUSrcB <= 2'b00;
				ALUOp <= 2'b10;
				PCSrc <= 1'bx;
				IRWrite <= 1'b0;
				PCWrite <= 1'b0;*/
				next <= ALUWB;
			end
			ALUWB:begin
				MemtoReg <= 0;
				RegDst <= 0;
				IorD <= 0; 
				PCSrc <= 0; 
				ALUSrcA <= 0; 
				IRWrite <= 0; 
				MemWrite <= 0; 
				PCWrite <= 0; 
				//Branch <= 0; 
				RegWrite <= 0;
				ALUSrcB <= 01;
				ALUOp <= 00;
				/*IorD <= 1'bx;
				ALUSrcA <= 1'b1;
				ALUSrcB <= 2'b00;
				ALUOp <= 2'b10;
				PCSrc <= 1'bx;
				RegDst <= 1'b1;
				IRWrite <= 1'b0;
				PCWrite <= 1'b0;
				MemtoReg <= 1'b0;
				RegWrite <= 1'b1;*/
				next <= FETCH;
			end
			BRANCH: begin 
				MemtoReg <= 0;
				RegDst <= 0;
				IorD <= 0; 
				PCSrc <= 0; 
				ALUSrcA <= 0; 
				IRWrite <= 0; 
				MemWrite <= 0; 
				PCWrite <= 0; 
				//Branch <= 0; 
				RegWrite <= 0;
				ALUSrcB <= 01;
				ALUOp <= 00;
				next <= FETCH;
			end
			endcase
			
	end

endmodule 