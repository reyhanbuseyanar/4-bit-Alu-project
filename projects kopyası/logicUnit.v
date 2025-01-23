
module logicUnit (
    input [2:0] opCode,
    input [3:0] A, B,
    output [3:0] resultA, resultO, resultX
);

wire [3:0] and1, or1, xor1;

and a01 (and1[0], A[0], B[0]);
and a02 (and1[1], A[1], B[1]);
and a03 (and1[2], A[2], B[2]);
and a04 (and1[3], A[3], B[3]);

or o01 (or1[0], A[0], B[0]);
or o02 (or1[1], A[1], B[1]);
or o03 (or1[2], A[2], B[2]);
or o04 (or1[3], A[3], B[3]);

xor xor01 (xor1[0], A[0], B[0]);
xor xor02 (xor1[1], A[1], B[1]);
xor xor03 (xor1[2], A[2], B[2]);
xor xor04 (xor1[3], A[3], B[3]);

and a_o1 (resultA[0], opCode[0], and1[0]);
and a_o2 (resultA[1], opCode[0], and1[1]);
and a_o3 (resultA[2], opCode[0], and1[2]);
and a_o4 (resultA[3], opCode[0], and1[3]);

and o_o1 (resultO[0], opCode[1], or1[0]);
and o_o2 (resultO[1], opCode[1], or1[1]);
and o_o3 (resultO[2], opCode[1], or1[2]);
and o_o4 (resultO[3], opCode[1], or1[3]);

and x_o1 (resultX[0], opCode[2], xor1[0]);
and x_o2 (resultX[1], opCode[2], xor1[1]);
and x_o3 (resultX[2], opCode[2], xor1[2]);
and x_o4 (resultX[3], opCode[2], xor1[3]);

endmodule