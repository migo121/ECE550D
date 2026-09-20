module and32(
	input [31:0] data_in1,
	input [31:0] data_in2,
	output [31:0] result
);
	genvar i;
	generate 
		for (i = 0; i<=31; i=i+1)
		begin: and_operation
			and operation_and(
				result[i],
				data_in1[i],
				data_in2[i]
			);
		end
	endgenerate
endmodule