module fa_1bit(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;

wire axorb;
wire ab;
wire acin;
wire bcin;
wire ctemp;

xor xor1(axorb, a, b);
xor xor2(sum, axorb, cin);

and and1(ab, a, b);
and and2(acin, a, cin);
and and3(bcin, b, cin);

or or1(ctemp, ab, acin);
or or2(cout, ctemp, bcin);

endmodule