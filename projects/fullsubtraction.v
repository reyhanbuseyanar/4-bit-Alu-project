module fullsubtraction (
    input A, B, BorrowIN,
    output Difference, BorrowOut
);

wire tempD, tempB1, tempB2;

halfsubtraction hf1(.A(A), .B(B), .Difference(tempD), .Borrow(tempB1));
halfsubtraction hf2(.A(tempD), .B(BorrowIN), .Difference(Difference), .Borrow(tempB2));
or o1 (BorrowOut, tempB1, tempB2);

endmodule