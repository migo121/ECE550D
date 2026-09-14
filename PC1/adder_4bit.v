module adder_4bit(
input [3:0] a,
input [3:0] b,
input cin,
output cout,
output [3:0] sum
);
wire temp1,temp2,temp3;
fa_1bit fa0(a[0], b[0], cin,   sum[0], temp1);
fa_1bit fa1(a[1], b[1], temp1, sum[1], temp2);
fa_1bit fa2(a[2], b[2], temp2, sum[2], temp3);
fa_1bit fa3(a[3], b[3], temp3, sum[3], cout);
endmodule