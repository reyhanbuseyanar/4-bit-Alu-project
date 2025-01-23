module multiplier (
    input [3:0] A, B,
    output [7:0] Y
);

wire [3:0] b0, a0, a1, a2;
wire [4:0] S0, S1, S2;
wire carry0, carry1, carry2;
wire overflow0, overflow1, overflow2;

// Partial product generation
and (Y[0], A[0], B[0]); // LSB of the result

// Generate partial products for B[0] and B[1]
and ab00 (b0[0], A[1], B[0]);
and ab01 (b0[1], A[2], B[0]);
and ab02 (b0[2], A[3], B[0]);
not ab03 (b0[3], 1'b1); // Initialize b0[3] to 0

and aa00 (a0[0], A[0], B[1]);
and aa01 (a0[1], A[1], B[1]);
and aa02 (a0[2], A[2], B[1]);
and aa03 (a0[3], A[3], B[1]);

// First addition
addition add0 (
    .A(a0),
    .B(b0),
    .CarryIN(1'b0),
    .Y(S0[3:0]),
    .CarryOUT(S0[4]),
    .overflow(overflow0)
);

// Generate partial products for B[2]
and aa10 (a1[0], A[0], B[2]);
and aa11 (a1[1], A[1], B[2]);
and aa12 (a1[2], A[2], B[2]);
and aa13 (a1[3], A[3], B[2]);

// Second addition
addition add1 (
    .A(a1),
    .B(S0[4:1]),
    .CarryIN(1'b0),
    .Y(S1[3:0]),
    .CarryOUT(S1[4]),
    .overflow(overflow1)
);

// Generate partial products for B[3]
and aa20 (a2[0], A[0], B[3]);
and aa21 (a2[1], A[1], B[3]);
and aa22 (a2[2], A[2], B[3]);
and aa23 (a2[3], A[3], B[3]);

// Third addition
addition add2 (
    .A(a2),
    .B(S1[4:1]),
    .CarryIN(1'b0),
    .Y(S2[3:0]),
    .CarryOUT(S2[4]),
    .overflow(overflow2)
);

// Combine results into the final output Y
or o01 (Y[1], S0[0], 1'b0);
or o02 (Y[2], S1[0], 1'b0);
or o03 (Y[3], S2[0], 1'b0);
or o04 (Y[4], S2[1], 1'b0);
or o05 (Y[5], S2[2], 1'b0);
or o06 (Y[6], S2[3], 1'b0);
or o07 (Y[7], S2[4], 1'b0);

endmodule