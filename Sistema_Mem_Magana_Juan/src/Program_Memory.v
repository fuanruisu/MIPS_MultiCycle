/******************************************************************
* Description
*	This is  a ROM memory that represents the program memory. 
* 	Internally, the memory is read without a signal clock. The initial 
*	values (program) of this memory are written from a file named text.dat.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module Program_Memory
#
(
	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32
)
(
	input [$clog2(MEMORY_DEPTH)-2:0] Address_i,
	output reg [DATA_WIDTH-1:0] Instruction_o
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom [MEMORY_DEPTH-1:0];

	initial
	begin
		$readmemh("text.dat", rom);
	end

	always @ (Address_i)
	begin
		Instruction_o = rom[Address_i];
	end

endmodule
