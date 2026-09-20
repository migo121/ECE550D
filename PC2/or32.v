module or32(
	input [31:0] data_in1,
	input [31:0] data_in2,
	output [31:0] result
);
	genvar j;
	generate 
		for (j = 0; j<=31; j=j+1)
		begin: or_operation
			or operation_or(
				result[j],
				data_in1[j],
				data_in2[j]
			);
		end
	endgenerate
endmodule