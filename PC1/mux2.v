module mux2(in1, in2, sel, cin1, cin2, out, cout);
input [3:0] in1;
input [3:0] in2;
input cin1;
input cin2;
input sel;

output [3:0] out;
output cout;

assign cout = sel ? cin2 : cin1;
assign out = sel ? in2 : in1;
endmodule