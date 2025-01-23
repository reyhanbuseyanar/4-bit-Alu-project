module halfadder (
    input A, B,
    output Sum, Carry
);

and a1 (Carry, A, B);
xor xo1 (Sum, A, B);

endmodule