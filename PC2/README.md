# Jasper Huang

**NetID:** wh204

## Design Implementation

The least significant bit of the ALU opcode is used to determine whether the operation is **addition** or **subtraction**.

The adder is built from **4-bit RCA (Ripple Carry Adder) blocks**, with each RCA consisting of four **1-bit full adders**.

For the higher-order blocks, two RCAs calculate the results for `Cin = 0` and `Cin = 1` in parallel, and a **MUX** selects the correct result based on the actual carry-in.

For subtraction, all bits of operand `B` are inverted, and the initial carry-in is set to `1` to implement two’s complement subtraction:

`A + ~B + 1`

Overflow is detected using XOR-based sign checks. The circuit compares the sign bits of `A` and `B` and also compares the result sign with `A`. For addition, overflow occurs when `A` and `B` have the same sign but the result has a different sign. For subtraction, overflow occurs when `A` and `B` have different signs and the result sign differs from `A`.

## AND

The bitwise AND operation is implemented using a `generate for` block.

Each bit of `data_operandA` is ANDed with the corresponding bit of `data_operandB`, producing a 32-bit result.

## OR

The bitwise OR operation is implemented using a `generate for` block.

Each bit of `data_operandA` is ORed with the corresponding bit of `data_operandB`, producing a 32-bit result.

## SLL

The logical left shift is implemented using a five-stage barrel shifter.

Each bit of `ctrl_shiftamt` determines the shift amount for one stage:

- `ctrl_shiftamt[0] = 1`: shift left by 1 bit
- `ctrl_shiftamt[1] = 1`: shift left by 2 bits
- `ctrl_shiftamt[2] = 1`: shift left by 4 bits
- `ctrl_shiftamt[3] = 1`: shift left by 8 bits
- `ctrl_shiftamt[4] = 1`: shift left by 16 bits

The five stages are connected sequentially, so multiple active bits in `ctrl_shiftamt` combine to form the final shift amount.

Vacated lower-order bits are filled with `0`.

## SRA

The arithmetic right shift is implemented using a five-stage barrel shifter.

Each bit of `ctrl_shiftamt` determines whether the input is shifted right by 1, 2, 4, 8, or 16 bits at the corresponding stage.

Unlike a logical right shift, the vacated higher-order bits are filled with the sign bit `data_operandA[31]`.

This preserves the sign of the signed 32-bit value.

## isNotEqual

`isNotEqual` is determined from the subtraction result `A - B`.

If `A` and `B` are equal, the subtraction result is `0`.

All bits of the subtraction result are ORed together. If any bit of the subtraction result is `1`, then `A != B`, so `isNotEqual` is asserted.

## isLessThan

`isLessThan` is determined from the subtraction result.

Normally, the sign bit of `A - B` indicates whether `A < B`. However, signed overflow can make the sign bit incorrect.

Therefore, `isLessThan` is calculated as:

`isLessThan = result[31] XOR overflow`

This produces the correct signed comparison result even when overflow occurs.