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

module Program_Memory_TB;

parameter MEMORY_DEPTH = 64;
parameter DATA_WIDTH = 32;
reg clk_tb = 0, we_tb = 0;
reg sel_tb;
reg [(DATA_WIDTH-1):0] Address_i_tb, data_tb, ram, rom;
wire [DATA_WIDTH-1:0] Instruction_o_tb;
wire [$clog2(MEMORY_DEPTH)-2:0] addrMemDepth_tb;
wire [DATA_WIDTH-1:0] outAddrROM, outAddrRAM;


Memory_System
#
(.MEMORY_DEPTH(MEMORY_DEPTH),
.DATA_WIDTH(DATA_WIDTH))
DUV
(
.clk_i(clk_tb),
.write_enable_i(we_tb),
.Write_Data(data_tb),
.Address_i(Address_i_tb),
.Instruction_o(Instruction_o_tb)

);


/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/


initial begin: TB
	integer i;

	#1 sel_tb = 1;
	//#1 we_tb=1;
	//Decoder RAM/ROM adddres testing
	for (i = 0; i<=32; i = i+4)begin
		#50 Address_i_tb = 32'h00400000+i;
		//#50 ram = 32'hafc12311+i;
		//#50 Address_i_tb = 32'h10010000+i;
		//#2 data_tb = 32'h22c4dda4+i;
	end
	#1 we_tb=1;
	#1 sel_tb = 0;
	for (i = 0; i<=32; i = i+4)begin
		
		//#50 Address_i_tb = 32'h00400000+i;
		#50 Address_i_tb = 32'h10010000+i;
		#2 data_tb = 32'h22c4dda4+i;
	end
	//start RAM testing
	/*#1 we_tb = 1;
	#50 Address_i_tb = 1;
	#1 data_tb = 32'hFFFFFFFF;

	#50 Address_i_tb = 2;
	#1 data_tb = 32'h12345678;
	
	#50 Address_i_tb = 3;
	#1 data_tb = 32'h98761234;

	#50 Address_i_tb = 4;
	#1 data_tb = 32'hA0A0A0A0;
	
	#50 Address_i_tb = 5;
	#1 data_tb = 32'hABCDEF12;

	#50 Address_i_tb = 6;
	#1 data_tb = 32'h12345678;*/
	//finish RAM testing


	//for loop to access ROM's addresses
	/*for (i = 0; i<=66; i = i+1)
		#50 Address_i_tb = i;*/

end


/*********************************************************/

endmodule