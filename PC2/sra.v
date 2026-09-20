module sra(
input [31:0] data_operandA,
input [4:0] ctrl_shiftamt,
output [31:0] result
);
	wire [31:0]stage1;
	genvar k;
	generate 
		for (k = 31; k>=0; k=k-1)
		begin: sra_stage1
				if(k == 31)begin
					assign stage1[k]= ctrl_shiftamt[0] ? data_operandA[k] : data_operandA[k];
					end
				else begin
					assign stage1[k]= ctrl_shiftamt[0] ? data_operandA[k+1] : data_operandA[k];
				end
		end
	endgenerate
	
	wire [31:0]stage2;
	genvar l;
	generate 
		for (l = 31; l>=0; l = l -1)
		begin: sra_stage2
				if(l > 29)begin
					assign stage2[l]= ctrl_shiftamt[1] ? stage1[l] : stage1[l];
					end
				else begin
					assign stage2[l]= ctrl_shiftamt[1] ? stage1[l+2] : stage1[l];
				end
		end
	endgenerate
	
	wire [31:0]stage3;
	genvar m;
	generate 
		for (m = 31; m>=0; m=m-1)
		begin: sra_stage3
				if(m > 27)begin
					assign stage3[m]= ctrl_shiftamt[2] ? stage2[m] : stage2[m];
					end
				else begin
					assign stage3[m]= ctrl_shiftamt[2] ? stage2[m+4] : stage2[m];
				end
		end
	endgenerate
	
	wire [31:0]stage4;
	genvar n;
	generate 
		for (n = 31; n>=0; n=n-1)
		begin: sra_stage4
				if(n > 23)begin
					assign stage4[n]= ctrl_shiftamt[3] ? stage3[n] : stage3[n];
					end
				else begin
					assign stage4[n]= ctrl_shiftamt[3] ? stage3[n+4] : stage3[n];
				end
		end
	endgenerate
	
	wire [31:0]stage5;
	genvar h;
	generate 
		for (h = 31; h>=0; h=h-1)
		begin: sra_stage5
				if(h > 15)begin
					assign stage5[h]= ctrl_shiftamt[4] ? stage4[h] : stage4[h];
					end
				else begin
					assign stage5[h]= ctrl_shiftamt[4] ? stage4[h+16] : stage4[h];
				end
		end
	endgenerate	
	assign result = stage5;
endmodule
	