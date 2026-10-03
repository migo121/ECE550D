module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	wire [31:0] reg_enable;
	wire [31:0] write_select;
	wire [31:0] readA;
	wire [31:0] readB;
	assign reg_enable = write_select & {32{ctrl_writeEnable}};
	wire [1023:0] reg_wire;
	assign reg_wire[31:0] = 32'b0;
	
	genvar i;
	generate
		for (i = 1;i<32;i = i + 1)begin: register
			register reg_i(
				.q(reg_wire[i*32+31:i*32]),
				.d(data_writeReg),
				.clk(clock),
				.en(reg_enable[i]),
				.clr(ctrl_reset)
			);
		end
	endgenerate
	
	

	decoder select_write(ctrl_writeReg,write_select);
	decoder select_readA(ctrl_readRegA,readA);
	decoder select_readB(ctrl_readRegB,readB);
	genvar a;
	generate
		for (a = 0; a<32;a = a+1)begin:readA_loop
			assign data_readRegA = readA[a]?reg_wire[a*32+31:a*32]:{32{1'bz}};
		end
	endgenerate
	
	genvar b;
	generate
		for (b = 0; b<32;b = b+1)begin:readB_loop
			assign data_readRegB = readB[b]?reg_wire[b*32+31:b*32]:{32{1'bz}};
		end
	endgenerate
	
	
endmodule
