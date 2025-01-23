module fulladder (
    input A, B, Carry,
    output Sum, CarryO
);

wire xor1, and1, and2;

halfadder h1(.A(A), .B(B), .Sum(xor1), .Carry(and1));
halfadder h2 (.A(xor1), .B(Carry), .Sum(Sum), .Carry(and2));
or o1 (CarryO, and1, and2);

endmodule