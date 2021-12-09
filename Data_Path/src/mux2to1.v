module mux2to1 #(parameter WIDTH = 32)(input [WIDTH-1:0] in1, in2, 
input sel,
output [WIDTH-1:0] regOut);

assign regOut = sel ? in2 : in1;

endmodule 