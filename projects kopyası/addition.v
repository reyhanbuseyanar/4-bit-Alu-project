module addition (
    input [3:0] A, B,
    input CarryIN,
    output [3:0] Y,
    output CarryOUT,
    output overflow
);

wire [2:0] Carry4;

fulladder f0(.A(A[0]), .B(B[0]), .Carry(CarryIN), .Sum(Y[0]), .CarryO(Carry4[0]));
fulladder f1(.A(A[1]), .B(B[1]), .Carry(Carry4[0]), .Sum(Y[1]), .CarryO(Carry4[1]));
fulladder f2(.A(A[2]), .B(B[2]), .Carry(Carry4[1]), .Sum(Y[2]), .CarryO(Carry4[2]));
fulladder f3(.A(A[3]), .B(B[3]), .Carry(Carry4[2]), .Sum(Y[3]), .CarryO(CarryOUT));


//overflowDetect od1 (.opCode(2'b01), .A(A), .B(B), .Y(Y), .CarryOUT(CarryOUT), .overflowDetect(overflow)); (KULLANILMAYACAK!!!!)
xor ov1 (overflow, Carry4[2], CarryOUT);

endmodule