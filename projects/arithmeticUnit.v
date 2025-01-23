module arithmeticUnit (
    input [1:0] opCode,
    input [3:0] A, B,
    input CarryIN,
    output [3:0] add_Y, sub_Y,
    output CarryOUT,
    output overflow
);

wire [3:0] addY, subY;
wire CarryOUTADD, CarryOUTSUB, tempCAdd, tempCSub, tempoverflow;

addition a1(.A(A), .B(B), .CarryIN(CarryIN), .Y(addY), .CarryOUT(CarryOUTADD), .overflow(tempoverflow));
subtraction s1(.A(A), .B(B), .BorrowIN(CarryIN), .Y(subY), .BorrowOUT(CarryOUTSUB));

and add1 (add_Y[0], opCode[0], addY[0]);
and add2 (add_Y[1], opCode[0], addY[1]);
and add3 (add_Y[2], opCode[0], addY[2]);
and add4 (add_Y[3], opCode[0], addY[3]);

and sub1 (sub_Y[0], opCode[1], subY[0]);
and sub2 (sub_Y[1], opCode[1], subY[1]);
and sub3 (sub_Y[2], opCode[1], subY[2]);
and sub4 (sub_Y[3], opCode[1], subY[3]);

// or or1 (CarryOUT, CarryOUTADD, CarryOUTSUB); (OLD!!!)
and and10 (tempCSub, CarryOUTSUB, opCode[1]);
and and11 (tempCAdd, CarryOUTADD, opCode[0]);
or or4 (CarryOUT, tempCAdd, tempCSub);

and add12 (overflow, opCode[0], tempoverflow);

endmodule