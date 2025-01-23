module multiplierTB();
reg [3:0] A, B;
wire [7:0] Y;

multiplier uut(
    .A(A),
    .B(B),
    .Y(Y)
);

initial begin
    $dumpfile("multiplier.vcd");
    $dumpvars;
    A = 4'b0000; B = 4'b0000; #2;
    A = 4'b0000; B = 4'b1000; #2;
    A = 4'b1000; B = 4'b1000; #2;
    A = 4'b0111; B = 4'b0111; #2;
    A = 4'b1111; B = 4'b1111; #2;
    $finish;
end

endmodule