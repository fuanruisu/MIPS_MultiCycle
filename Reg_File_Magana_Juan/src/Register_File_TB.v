/******************************************************************
* Description
*	This is the verifaction envioroment ofr testeting the register file.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	12/06/2015
******************************************************************/

module Register_File_TB();

parameter WIDTH = 32;
reg clk_tb = 0;
reg reset_tb;
reg Reg_Write_tb;
reg [4:0] Write_Register_tb;
reg [4:0] Read_Register_1_tb;
reg [4:0] Read_Register_2_tb;
reg [31:0] Write_Data_tb;
wire [31:0] Read_Data_1_tb;
wire [31:0] Read_Data_2_tb;
  
  
regFile
#(
	.N(WIDTH)
)
DUV
(
	.clk(clk_tb),
	.reset(reset_tb),
	.Reg_Write_i(Reg_Write_tb),
	.Write_Register_i(Write_Register_tb),
	.Read_Register_1_i(Read_Register_1_tb),
	.Read_Register_2_i(Read_Register_2_tb),
	.Write_Data_i(Write_Data_tb),
	.Read_Data_1_o(Read_Data_1_tb),
	.Read_Data_2_o(Read_Data_2_tb)

);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset_tb = 0;
	#5 reset_tb = 1;
end

initial begin
	#0 Reg_Write_tb = 0;
	#5 Reg_Write_tb = 1;
	//#50 Reg_Write_tb = 0;
	//#55 Reg_Write_tb = 1;

end


initial begin
	#0 Read_Register_1_tb = 0;
	#10 Read_Register_1_tb = 0;
	#10 Read_Register_1_tb = 0;
	
end


initial begin
	#0 Read_Register_2_tb = 0;
	#10 Read_Register_2_tb = 0;
	#10 Read_Register_2_tb = 20;

end

initial begin
	#0 Write_Register_tb = 1;
	#10 Write_Register_tb = 0;
	#10 Write_Register_tb = 20;
	

end


/*********************************************************/
initial begin // reset generator
	#5 Write_Data_tb = 3;
	#5 Write_Data_tb = 20;
	#10 Write_Data_tb = 256;
end

/*********************************************************/

endmodule