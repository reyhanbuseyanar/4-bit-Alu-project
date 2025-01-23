module ALUTB ();

reg [3:0] A, B;
reg CarryIN;
reg [2:0] opCodeA;
wire CarryOUT, overflow;
wire [11:0] bcd;

ALU uut(
    .A(A),
    .B(B),
    .CarryIN(CarryIN),
    .opCodeA(opCodeA),
    .CarryOUT(CarryOUT),
    .bcd(bcd),
    .overflow(overflow)
);
// İşlem kodları:
// 0 -> ADD
// 1 -> SUB
// 2 -> MULT
// 4 -> AND
// 5 -> OR
// 6 -> XOR

initial begin
    $dumpfile("ALU.vcd"); // GTKWAVE SIMULTAIN DATA WAVEFORM
    $dumpvars; // ICARUS VERILOG ADD ALL VARIABLES
    A = 4'b0000; B = 4'b0000; CarryIN = 1'b0; opCodeA = 3'b011; #5;
    A = 4'b0000; B = 4'b1111; CarryIN = 1'b0; opCodeA = 3'b011; #5;
    A = 4'b1111; B = 4'b0000; CarryIN = 1'b0; opCodeA = 3'b011; #5;
    A = 4'b1111; B = 4'b1111; CarryIN = 1'b1; opCodeA = 3'b011; #5;
    A = 4'b0111; B = 4'b0111; CarryIN = 1'b1; opCodeA = 3'b011; #5;

    A = 4'b0000; B = 4'b0000; CarryIN = 1'b0; opCodeA = 3'b111; #5;
    A = 4'b0000; B = 4'b1111; CarryIN = 1'b0; opCodeA = 3'b111; #5;
    A = 4'b1111; B = 4'b0000; CarryIN = 1'b0; opCodeA = 3'b111; #5;
    A = 4'b1111; B = 4'b1111; CarryIN = 1'b1; opCodeA = 3'b111; #5;
    A = 4'b0111; B = 4'b1111; CarryIN = 1'b1; opCodeA = 3'b111; #5;

    A = 4'b0000; B = 4'b0000; CarryIN = 1'b0; opCodeA = 3'b010; #5;
    A = 4'b0000; B = 4'b1111; CarryIN = 1'b0; opCodeA = 3'b010; #5;
    A = 4'b1111; B = 4'b0000; CarryIN = 1'b0; opCodeA = 3'b010; #5;
    A = 4'b1111; B = 4'b1111; CarryIN = 1'b1; opCodeA = 3'b010; #5;
    A = 4'b0111; B = 4'b1111; CarryIN = 1'b1; opCodeA = 3'b010; #5;

    A = 4'b1110; B = 4'b0011; CarryIN = 1'b1; opCodeA = 3'b100; #5;
    $finish; //NOT CONTAIN CLK, BUT STILL STOPS CODE
end

endmodule