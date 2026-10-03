module register(
	input [31:0] d,
	input clk,
	input en,clr,
	output [31:0] q
);

genvar i;
generate 
	for(i = 0; i< 32; i = i + 1)begin:loop
		dffe_ref bit_dffe(q[i],d[i],clk,en,clr);
	end
endgenerate
endmodule
