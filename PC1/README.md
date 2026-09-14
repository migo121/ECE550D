# Jasper Huang

**NetID:** wh204

## Design Implementation

The least significant bit of the ALU opcode is used to determine whether the operation is **addition** or **subtraction**.

The adder is built from **4-bit RCA (Ripple Carry Adder) blocks**, with each RCA consisting of four **1-bit full adders**.

For the higher-order blocks, two RCAs calculate the results for `Cin = 0` and `Cin = 1` in parallel, and a **MUX** selects the correct result based on the actual carry-in.

For subtraction, all bits of operand `B` are inverted, and the initial carry-in is set to `1` to implement two’s complement subtraction:

```text
A + ~B + 1

Overflow is detected using XOR-based sign checks. The circuit compares the sign bits of A and B and also compares the result sign with A. For addition, 
overflow occurs when A and B have the same sign but the result has a different sign. For subtraction, overflow occurs when A and B have different signs and the result sign differs from A.
