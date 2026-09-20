module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

	wire sub;
	wire [31:0] b_m;
	wire addsub_cout;
	wire [31:0] add_result;
	wire [31:0] and_result;
	wire [31:0] or_result;
	wire [31:0] sll_result;
	wire [31:0] sra_result;
	
	//select
	wire n0,n1,n2,n3,n4;
	not not0(n0, ctrl_ALUopcode[0]);
	not not1(n1, ctrl_ALUopcode[1]);
	not not2(n2, ctrl_ALUopcode[2]);
	not not3(n3, ctrl_ALUopcode[3]);
	not not4(n4, ctrl_ALUopcode[4]);
	
	wire op_add,op_sub,op_and,op_or,op_sll,op_sra;
	and add_select(op_add,n4,n3,n2,n1,n0);
	and sub_select(op_sub,n4,n3,n2,n1,ctrl_ALUopcode[0]);
	and and_select(op_and,n4,n3,n2,ctrl_ALUopcode[1],n0);
	and or_select(op_or,n4,n3,n2,ctrl_ALUopcode[1],ctrl_ALUopcode[0]);
	and sll_select(op_sll,n4,n3,ctrl_ALUopcode[2],n1,n0);
	and sra_select(op_sra,n4,n3,ctrl_ALUopcode[2],n1,ctrl_ALUopcode[0]);
	wire op_addsub;
	or addsub_select(op_addsub,op_add,op_sub);
	assign sub = op_sub;
	
	
	

	xor x0  (b_m[0],  data_operandB[0],  sub);
	xor x1  (b_m[1],  data_operandB[1],  sub);
	xor x2  (b_m[2],  data_operandB[2],  sub);
	xor x3  (b_m[3],  data_operandB[3],  sub);
	xor x4  (b_m[4],  data_operandB[4],  sub);
	xor x5  (b_m[5],  data_operandB[5],  sub);
	xor x6  (b_m[6],  data_operandB[6],  sub);
	xor x7  (b_m[7],  data_operandB[7],  sub);
	xor x8  (b_m[8],  data_operandB[8],  sub);
	xor x9  (b_m[9],  data_operandB[9],  sub);
	xor x10 (b_m[10], data_operandB[10], sub);
	xor x11 (b_m[11], data_operandB[11], sub);
	xor x12 (b_m[12], data_operandB[12], sub);
	xor x13 (b_m[13], data_operandB[13], sub);
	xor x14 (b_m[14], data_operandB[14], sub);
	xor x15 (b_m[15], data_operandB[15], sub);
	xor x16 (b_m[16], data_operandB[16], sub);
	xor x17 (b_m[17], data_operandB[17], sub);
	xor x18 (b_m[18], data_operandB[18], sub);
	xor x19 (b_m[19], data_operandB[19], sub);
	xor x20 (b_m[20], data_operandB[20], sub);
	xor x21 (b_m[21], data_operandB[21], sub);
	xor x22 (b_m[22], data_operandB[22], sub);
	xor x23 (b_m[23], data_operandB[23], sub);
	xor x24 (b_m[24], data_operandB[24], sub);
	xor x25 (b_m[25], data_operandB[25], sub);
	xor x26 (b_m[26], data_operandB[26], sub);
	xor x27 (b_m[27], data_operandB[27], sub);
	xor x28 (b_m[28], data_operandB[28], sub);
	xor x29 (b_m[29], data_operandB[29], sub);
	xor x30 (b_m[30], data_operandB[30], sub);
	xor x31 (b_m[31], data_operandB[31], sub);
	
	
	
	
	//adder
	adder_32bit adder(
    data_operandA,
    b_m,
    sub,   //+1     
    add_result,
    addsub_cout
   );
	or not_equal(
		isNotEqual,
		add_result[0],
		add_result[1],
		add_result[2],
		add_result[3],
		add_result[4],
		add_result[5],
		add_result[6],
		add_result[7],
		add_result[8],
		add_result[9],
		add_result[10],
		add_result[11],
		add_result[12],
		add_result[13],
		add_result[14],
		add_result[15],
		add_result[16],
		add_result[17],
		add_result[18],
		add_result[19],
		add_result[20],
		add_result[21],
		add_result[22],
		add_result[23],
		add_result[24],
		add_result[25],
		add_result[26],
		add_result[27],
		add_result[28],
		add_result[29],
		add_result[30],
		add_result[31]
	);
	//overflow
	wire ab_compare;
	wire tmp;
	wire ab_match;
	wire result;
	xor xor1(
		 ab_compare,
		 data_operandA[31],
		 data_operandB[31]
	);
	xor xor2(
		 tmp,
		 ab_compare,
		 sub
	);

	not n_over1(
		 ab_match,
		 tmp
	);

	xor x_over3(
		 result,
		 data_operandA[31],
		 add_result[31]
	);

	and a_over1(
		 overflow,
		 ab_match,
		 result
	);
	xor is_Lessthan(isLessThan,overflow,add_result[31]);
	// YOUR CODE HERE //
	//and
	and32 and_operator(data_operandA,data_operandB,and_result); 
	//or
	or32 or_operator(data_operandA,data_operandB,or_result);
	//sll
	sll sll_operator(data_operandA,ctrl_shiftamt,sll_result);
	//sra
	sra sra_operator(data_operandA,ctrl_shiftamt,sra_result);
	
	
	
	genvar r;
	generate
		for(r = 0; r<=31; r=r+1)begin : select
			wire addsub_bit,and_bit,or_bit,sll_bit,sra_bit;
			and addsub_bit_assign(addsub_bit,op_addsub,add_result[r]);
			and and_bit_assign(and_bit,op_and,and_result[r]);
			and or_bit_assign(or_bit,op_or,or_result[r]);
			and sll_bit_assign(sll_bit,op_sll,sll_result[r]);
			and sra_bit_assign(sra_bit,op_sra,sra_result[r]);
			or final(data_result[r],addsub_bit,and_bit,or_bit,sll_bit,sra_bit);
		end
	endgenerate
	
endmodule
