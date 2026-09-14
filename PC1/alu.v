module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

	wire sub;
	wire [31:0] b_m;
	wire addsub_cout;
	wire [31:0] add_result;
	assign sub = ctrl_ALUopcode[0];

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
	assign data_result = add_result;
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
	// YOUR CODE HERE //

endmodule
