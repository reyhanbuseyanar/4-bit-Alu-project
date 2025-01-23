module subtractionTB;

reg [3:0] A, B;
reg BorrowIN;
wire [3:0] Y;
wire BorrowOUT;

// Instantiate the subtraction module
subtraction uut (
    .A(A),
    .B(B),
    .BorrowIN(BorrowIN),
    .Y(Y),
    .BorrowOUT(BorrowOUT)
);

initial begin
    $dumpfile("subtraction.vcd");
    $dumpvars;
    // Initialize inputs
    A = 4'b0000;  // Set A to 0
    B = 4'b0000;  // Set B to 0
    BorrowIN = 0;  // No borrow input

    // Apply test cases
    #10 A = 4'b1000; B = 4'b0010; BorrowIN = 1; // A = 6, B = 2
    #10 A = 4'b0010; B = 4'b0110; BorrowIN = 0; // A = 2, B = 6
    #10 A = 4'b1100; B = 4'b0100; BorrowIN = 0; // A = -4, B = 4
    #10 A = 4'b1000; B = 4'b1000; BorrowIN = 0; // A = -8, B = -8
    #10 A = 4'b1111; B = 4'b0001; BorrowIN = 1; // A = -1, B = 1, with borrow input
    
    // Wait for the results
    #10 $finish;
end

//initial begin
    // Monitor the values of Y and overflow
  //  $monitor("At time %t: A = %b, B = %b, Y = %b, BorrowOut = %b, overflow = %b", $time, A, B, Y, BorrowOut, overflow);
//end

endmodule