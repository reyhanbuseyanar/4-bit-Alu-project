module logicUnitTB ();

reg [2:0] opCode;
reg [3:0] A, B;
wire [3:0] resultA, resultO, resultX;

logicUnit uut (
    .opCode(opCode),
    .A(A),
    .B(B),
    .resultA(resultA),
    .resultO(resultO),
    .resultX(resultX)
);

initial begin
    $dumpfile("logicUnit.vcd");
    $dumpvars;
    opCode = 3'b001; A = 4'b0001; B = 4'b0001; #2;
    opCode = 3'b001; A = 4'b0011; B = 4'b0001; #2;
    opCode = 3'b001; A = 4'b1001; B = 4'b1001; #2;
    opCode = 3'b001; A = 4'b1111; B = 4'b1111; #2;
    opCode = 3'b001; A = 4'b0000; B = 4'b0000; #2;

    opCode = 3'b010; A = 4'b0001; B = 4'b0101; #2;
    opCode = 3'b010; A = 4'b1001; B = 4'b0101; #2;
    opCode = 3'b010; A = 4'b0001; B = 4'b1111; #2;
    opCode = 3'b010; A = 4'b0000; B = 4'b0101; #2;

    opCode = 3'b100; A = 4'b1001; B = 4'b0010; #2;
    opCode = 3'b100; A = 4'b0000; B = 4'b0000; #2;
    opCode = 3'b100; A = 4'b0000; B = 4'b0101; #2;
    opCode = 3'b100; A = 4'b1111; B = 4'b1111; #2;
    $finish;
end

endmodule