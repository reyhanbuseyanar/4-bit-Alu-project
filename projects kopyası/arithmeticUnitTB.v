module arithmeticUnitTB;

  // Testbench için giriş ve çıkışlar
  reg [1:0] opCode;
  reg [3:0] A, B;
  reg CarryIN;
  wire [3:0] add_Y, sub_Y;
  wire CarryOUT, overflow;

  // Test edilen modülün instantiation'ı
  arithmeticUnit uut (
    .opCode(opCode),
    .A(A),
    .B(B),
    .CarryIN(CarryIN),
    .add_Y(add_Y),
    .sub_Y(sub_Y),
    .CarryOUT(CarryOUT),
    .overflow(overflow)
  );

// Başlangıç bloğu (initial block)
    initial begin
        $dumpfile("arithmeticUnit.vcd");  // Simülasyon verilerini "logicUnit.vcd" dosyasına kaydet
        $dumpvars;                   // Tüm sinyalleri kaydet
// Test 1: Toplama işlemi, A = 4, B = 3, CarryIN = 0
    A = 4'b0100;
    B = 4'b0011;
    CarryIN = 1'b0;
    opCode = 2'b01; // Toplama işlemi
    #10; // 10 zaman birimi bekle

    // Test 2: Çıkarma işlemi, A = 6, B = 2, BorrowIN = 0
    A = 4'b0110;
    B = 4'b0010;
    CarryIN = 1'b0;
    opCode = 2'b10; // Çıkarma işlemi
    #10;

    // Test 3: Toplama işlemi, taşma (overflow) durumu
    A = 4'b0111; // 7
    B = 4'b0100; // 4
    CarryIN = 1'b0;
    opCode = 2'b01; // Toplama işlemi
    #10;

    // Test 4: toplam durumu
    A = 4'b1000; // 2
    B = 4'b1000; // 4
    CarryIN = 1'b0;
    opCode = 2'b01; // topl işlemi
    #10;

    // Test 5: Toplama işlemi, CarryIN etkisi
    A = 4'b1010; // 10
    B = 4'b0101; // 5
    CarryIN = 1'b1; // CarryIN aktif
    opCode = 2'b01; // Toplama işlemi
    #10;

    // Test 6: Geçersiz opCode, her iki işlem de devre dışı
    A = 4'b1111;
    B = 4'b0001;
    CarryIN = 1'b0;
    opCode = 2'b00; // Geçersiz işlem
    #10;

    // Testlerin sonu
        $finish;
    end

endmodule