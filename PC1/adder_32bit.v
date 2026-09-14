module adder_32bit(a, b, cin, sum, cout);
input [31:0] a;
input [31:0] b;
input cin;

output [31:0] sum;
output cout;

//block0
wire c4;

adder_4bit rca0(
    a[3:0],
    b[3:0],
    cin,
    c4,
    sum[3:0]
);
//block1
wire [3:0] sum1_0;
wire [3:0] sum1_1;

wire cout1_0;
wire cout1_1;

wire c8;

adder_4bit rca1_0(
    a[7:4],
    b[7:4],
    1'b0,
    cout1_0,
    sum1_0
);

adder_4bit rca1_1(
    a[7:4],
    b[7:4],
    1'b1,
    cout1_1,
    sum1_1
);

mux2 mux1(
    sum1_0,
    sum1_1,
    c4,
    cout1_0,
    cout1_1,
    sum[7:4],
    c8
);
//block2
wire [3:0] sum2_0;
wire [3:0] sum2_1;

wire cout2_0;
wire cout2_1;

wire c12;

adder_4bit rca2_0(
    a[11:8],
    b[11:8],
    1'b0,
    cout2_0,
    sum2_0
);

adder_4bit rca2_1(
    a[11:8],
    b[11:8],
    1'b1,
    cout2_1,
    sum2_1
);

mux2 mux2(
    sum2_0,
    sum2_1,
    c8,
    cout2_0,
    cout2_1,
    sum[11:8],
    c12
);
//block3
wire [3:0] sum3_0;
wire [3:0] sum3_1;

wire cout3_0;
wire cout3_1;

wire c16;

adder_4bit rca3_0(
    a[15:12],
    b[15:12],
    1'b0,
    cout3_0,
    sum3_0
);

adder_4bit rca3_1(
    a[15:12],
    b[15:12],
    1'b1,
    cout3_1,
    sum3_1
);

mux2 mux3(
    sum3_0,
    sum3_1,
    c12,
    cout3_0,
    cout3_1,
    sum[15:12],
    c16
);
//block4
wire [3:0] sum4_0;
wire [3:0] sum4_1;

wire cout4_0;
wire cout4_1;

wire c20;

adder_4bit rca4_0(
    a[19:16],
    b[19:16],
    1'b0,
    cout4_0,
    sum4_0
);

adder_4bit rca4_1(
    a[19:16],
    b[19:16],
    1'b1,
    cout4_1,
    sum4_1
);

mux2 mux4(
    sum4_0,
    sum4_1,
    c16,
    cout4_0,
    cout4_1,
    sum[19:16],
    c20
);
//block5
wire [3:0] sum5_0;
wire [3:0] sum5_1;

wire cout5_0;
wire cout5_1;

wire c24;

adder_4bit rca5_0(
    a[23:20],
    b[23:20],
    1'b0,
    cout5_0,
    sum5_0
);

adder_4bit rca5_1(
    a[23:20],
    b[23:20],
    1'b1,
    cout5_1,
    sum5_1
);

mux2 mux5(
    sum5_0,
    sum5_1,
    c20,
    cout5_0,
    cout5_1,
    sum[23:20],
    c24
);
//block6
wire [3:0] sum6_0;
wire [3:0] sum6_1;

wire cout6_0;
wire cout6_1;

wire c28;

adder_4bit rca6_0(
    a[27:24],
    b[27:24],
    1'b0,
    cout6_0,
    sum6_0
);

adder_4bit rca6_1(
    a[27:24],
    b[27:24],
    1'b1,
    cout6_1,
    sum6_1
);

mux2 mux6(
    sum6_0,
    sum6_1,
    c24,
    cout6_0,
    cout6_1,
    sum[27:24],
    c28
);
//block7
wire [3:0] sum7_0;
wire [3:0] sum7_1;

wire cout7_0;
wire cout7_1;

adder_4bit rca7_0(
    a[31:28],
    b[31:28],
    1'b0,
    cout7_0,
    sum7_0
);

adder_4bit rca7_1(
    a[31:28],
    b[31:28],
    1'b1,
    cout7_1,
    sum7_1
);

mux2 mux7(
    sum7_0,
    sum7_1,
    c28,
    cout7_0,
    cout7_1,
    sum[31:28],
    cout
);
endmodule