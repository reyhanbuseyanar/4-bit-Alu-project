module halfsubtraction (
    input A, B,
    output Difference, Borrow
);

wire notA;

xor xo1 (Difference, A, B);
not a1 (notA, A);
and an1 (Borrow, notA, B);

endmodule