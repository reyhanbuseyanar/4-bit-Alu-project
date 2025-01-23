module BinaryToBCDTB;
    // Testbench signals
    reg [7:0] binary;
    wire [11:0] bcd; // Output BCD

    // Instantiate the BinaryToBCD module
    BinaryToBCD uut (
        .binary(binary),
        .bcd(bcd)
    );

    // Testbench procedure
    initial begin
        $monitor("Time: %0t | Binary: %b | BCD: %b (Hundreds: %d, Tens: %d, Ones: %d)",
                 $time, binary, bcd, bcd[11:8], bcd[7:4], bcd[3:0]);
        $dumpfile("BinaryToBCD.vcd");
        $dumpvars;
        // Test cases
        binary = 8'b00000000; // Decimal: 0
        #10;

        binary = 8'b00001010; // Decimal: 10
        #10;

        binary = 8'b00101010; // Decimal: 42
        #10;

        binary = 8'b01100011; // Decimal: 99
        #10;

        binary = 8'b10011001; // Decimal: 153
        #10;

        binary = 8'b11111111; // Decimal: 255
        #10;

        // End simulation
        $finish;
    end
endmodule