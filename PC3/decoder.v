module decoder(in, out);

    input [4:0] in;
    output [31:0] out;

    genvar i;
	 generate
		for(i = 0;i<32;i = i+1) begin: loop
			wire [4:0] index;
			assign index = i;
			assign out[i] = &(~(in^index));
		end
	endgenerate
		
endmodule
