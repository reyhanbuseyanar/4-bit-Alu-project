module dabble (
    input A, B, C, D,
    output X, Y, Z, E
);

wire xor1, nor1, xor2, nor2, nor3, or1;

xor xo1 (xor1, A, D);
nor no1 (nor1, A, B);
xor xo2 (xor2, A, C);

nor no2 (nor2, xor1, xor2);

nor no3 (nor3, nor2, nor1);
buf bu1 (X, nor3);
or o1 (or1, xor1, nor1);

nor no4 (Y, or1, C);
and an1 (Z, or1, xor2);
xor xo3 (E, nor3, D);

endmodule