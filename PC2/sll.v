module sll(
input [31:0] data_operandA,
input [4:0] ctrl_shiftamt,
output [31:0] result

);

wire [31:0]stage1;//xiugai i  i++
	genvar k;
	generate 
		for (k = 0; k<=31; k=k+1)
		begin: sll_stage1
				if(k == 0)begin
					assign stage1[k]= ctrl_shiftamt[0] ? 1'b0 : data_operandA[k];
					end
				else begin
					assign stage1[k]= ctrl_shiftamt[0] ? data_operandA[k-1] : data_operandA[k];
				end
		end
	endgenerate
	
	wire [31:0]stage2;
	genvar l;
	generate 
		for (l = 0; l<=31; l = l +1)
		begin: sll_stage2
				if(l < 2)begin
					assign stage2[l]= ctrl_shiftamt[1] ? 1'b0 : stage1[l];
					end
				else begin
					assign stage2[l]= ctrl_shiftamt[1] ? stage1[l-2] : stage1[l];
				end
		end
	endgenerate
	
	wire [31:0]stage3;
	genvar m;
	generate 
		for (m = 0; m<=31; m=m+1)
		begin: sll_stage3
				if(m < 4)begin
					assign stage3[m]= ctrl_shiftamt[2] ? 1'b0 : stage2[m];
					end
				else begin
					assign stage3[m]= ctrl_shiftamt[2] ? stage2[m-4] : stage2[m];
				end
		end
	endgenerate
	
	wire [31:0]stage4;
	genvar n;
	generate 
		for (n = 0; n<=31; n=n+1)
		begin: sll_stage4
				if(n < 8)begin
					assign stage4[n]= ctrl_shiftamt[3] ? 1'b0 : stage3[n];
					end
				else begin
					assign stage4[n]= ctrl_shiftamt[3] ? stage3[n-8] : stage3[n];
				end
		end
	endgenerate
	
	wire [31:0]stage5;
	genvar h;
	generate 
		for (h = 0; h<=31; h=h+1)
		begin: sll_stage5
				if(h < 16)begin
					assign stage5[h]= ctrl_shiftamt[4] ? 1'b0 : stage4[h];
					end
				else begin
					assign stage5[h]= ctrl_shiftamt[4] ? stage4[h-16] : stage4[h];
				end
		end
	endgenerate
	
	assign result = stage5;
	
endmodule
