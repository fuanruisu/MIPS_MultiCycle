module regFile #(
parameter N = 32)
(
input clk,
input reset, 
input Reg_Write_i,
input [4:0] Write_Register_i,
input [4:0] Read_Register_1_i,
input [4:0]	Read_Register_2_i,
input [N-1:0] Write_Data_i,
output [N-1:0] Read_Data_1_o,
output [N-1:0] Read_Data_2_o
);
wire [N-1:0] q,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,out, enable;
decoder #(32) dec1(.in(Write_Register_i),.out(out));

mux #(32) mux1 (.regAdr(q), .regAdr1(q1), .regAdr2(q2), .regAdr3(q3), .regAdr4(q4), .regAdr5(q5), .regAdr6(q6), .regAdr7(q7), .regAdr8(q8), .regAdr9(q9), .regAdr10(q10), .regAdr11(q11),
.regAdr12(q12), .regAdr13(q13), .regAdr14(q14), .regAdr15(q15), .regAdr16(q16), .regAdr17(q17), .regAdr18(q18), .regAdr19(q19), .regAdr20(q20), .regAdr21(q21), .regAdr22(q22),
.regAdr23(q23), .regAdr24(q24), .regAdr25(q25), .regAdr26(q26), .regAdr27(q27), .regAdr28(q28), .regAdr29(q29), .regAdr30(q30), .regAdr31(q31), .sel(Read_Register_1_i), .regOut(Read_Data_1_o));

mux #(32) mux2 (.regAdr(q), .regAdr1(q1), .regAdr2(q2), .regAdr3(q3), .regAdr4(q4), .regAdr5(q5), .regAdr6(q6), .regAdr7(q7), .regAdr8(q8), .regAdr9(q9), .regAdr10(q10), .regAdr11(q11),
.regAdr12(q12), .regAdr13(q13), .regAdr14(q14), .regAdr15(q15), .regAdr16(q16), .regAdr17(q17), .regAdr18(q18), .regAdr19(q19), .regAdr20(q20), .regAdr21(q21), .regAdr22(q22),
.regAdr23(q23), .regAdr24(q24), .regAdr25(q25), .regAdr26(q26), .regAdr27(q27), .regAdr28(q28), .regAdr29(q29), .regAdr30(q30), .regAdr31(q31), .sel(Read_Register_2_i), .regOut(Read_Data_2_o));

FFzero regstr0(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[0]),.q(q));
FF regstr1(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[1]),.q(q1));
FF regstr2(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[2]),.q(q2));
FF regstr3(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[3]),.q(q3));
FF regstr4(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[4]),.q(q4));
FF regstr5(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[5]),.q(q5));
FF regstr6(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[6]),.q(q6));
FF regstr7(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[7]),.q(q7));
FF regstr8(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[8]),.q(q8));
FF regstr9(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[9]),.q(q9));
FF regstr10(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[10]),.q(q10));
FF regstr11(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[11]),.q(q11));
FF regstr12(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[12]),.q(q12));
FF regstr13(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[13]),.q(q13));
FF regstr14(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[14]),.q(q14));
FF regstr15(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[15]),.q(q15));
FF regstr16(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[16]),.q(q16));
FF regstr17(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[17]),.q(q17));
FF regstr18(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[18]),.q(q18));
FF regstr19(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[19]),.q(q19));
FF regstr20(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[20]),.q(q20));
FF regstr21(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[21]),.q(q21));
FF regstr22(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[22]),.q(q22));
FF regstr23(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[23]),.q(q23));
FF regstr24(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[24]),.q(q24));
FF regstr25(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[25]),.q(q25));
FF regstr26(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[26]),.q(q26));
FF regstr27(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[27]),.q(q27));
FF regstr28(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[28]),.q(q28));
FF regstr29(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[29]),.q(q29));
FF regstr30(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[30]),.q(q30));
FF regstr31(.clk(clk),.reset(reset),.d(Write_Data_i),.enable(enable[31]),.q(q31));

genvar i;

generate
	for(i=0;i<=N-1; i = i + 1) begin: registerFile
      	assign enable[i] = Reg_Write_i & out[i];
			
			
	end
endgenerate

endmodule 