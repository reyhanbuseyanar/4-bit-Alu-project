module opCodeTB();

reg [2:0] A;
wire [7:0] opCode;

opCode uut (
    .A(A),

    .opCode(opCode)
);

initial begin
    $dumpfile("opCode.vcd");
    $dumpvars;
    A = 3'b000; #3;
    A = 3'b001; #3;
    A = 3'b010; #3;
    A = 3'b011; #3;
    A = 3'b100; #3;
    A = 3'b101; #3;
    A = 3'b110; #3;
    A = 3'b111; #3;
    $finish;
end

endmodule