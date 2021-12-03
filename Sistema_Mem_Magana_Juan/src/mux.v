module mux #(parameter WIDTH = 32)(input [WIDTH-1:0] in1, in2, 
input sel,
output [WIDTH-1:0] regOut);

assign regOut = sel ? in1 : in2;

endmodule 