module decoder #(parameter WIDTH = 32) (
input [$clog2(WIDTH)-1:0] in,
output reg [WIDTH-1:0] out
);

always @(in) begin
	case (in)
	0: out = 32'd1;
	1: out = 32'd2;
	2: out = 32'd4;
	3: out = 32'd8;
	4: out = 32'd16;
	5: out = 32'd32;
	6: out = 32'd64;
	7: out = 32'd128;
	8: out = 32'd256;
	9: out = 32'd512;
	10: out = 32'd1024;
	11: out = 32'd2048;
	12: out = 32'd4096;
	13: out = 32'd8192;
	14: out = 32'd16384;
	15: out = 32'd32768;
	16: out = 32'd65536;
	17: out = 32'd131072;
	18: out = 32'd262144;
	19: out = 32'd524288;
	20: out = 32'd1048576;
	21: out = 32'd2097152;
	22: out = 32'd4194304;
	23: out = 32'd8388608;
	24: out = 32'd16777216;
	25: out = 32'd33554432;
	26: out = 32'd67108864;
	27: out = 32'd134217728;
	28: out = 32'd268435456;
	29: out = 32'd536870912;
	30: out = 32'd1073741824;
	31: out = 32'd2147483648;
	
	endcase

end
endmodule 