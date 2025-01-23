module additionTB;

// Testbench için giriş ve çıkış sinyalleri
reg [3:0] A, B;           // 4-bitlik girişler
reg CarryIN;              // Taşıma giriş değeri
wire [3:0] Y;             // Toplam sonucu
wire CarryOUT;            // Taşıma çıkışı
wire overflow;            // Taşma durumu

// Test edilecek modülü çağırıyoruz
addition uut (
    .A(A),
    .B(B),
    .CarryIN(CarryIN),
    .Y(Y),
    .CarryOUT(CarryOUT),
    .overflow(overflow)
);

// Test vektörleri
    initial begin
        // VCD dosyasını ve değişkenleri kaydediyoruz
        $dumpfile("addition.vcd");    // Simülasyon verilerini "addition.vcd" dosyasına kaydet
        $dumpvars;                       // Tüm değişkenleri kaydet

        // Girişleri başlatıyoruz
        A = 4'b0000;  // A'yı 0000 (0) olarak ayarla
        B = 4'b0000;  // B'yi 0000 (0) olarak ayarla
        CarryIN = 0; // Başlangıçta
        // Test vakalarını sırasıyla uygula
        #10 A = 4'b0110; B = 4'b0010; CarryIN = 0; 
        #10 A = 4'b0010; B = 4'b0110; CarryIN = 0; 
        #10 A = 4'b1100; B = 4'b0100; CarryIN = 0; 
        #10 A = 4'b1000; B = 4'b1000; CarryIN = 0; 
        #10 A = 4'b1111; B = 4'b0001; CarryIN = 1; 

        // Testleri bitirdikten sonra simülasyonu sonlandır
        #10 $finish;
    end

    initial begin
        // Giriş ve çıkışları her zaman izleyip yazdırıyoruz
        $monitor("At time %t: A = %b, B = %b, Y = %b, CarryOut = %b, overflow = %b", $time, A, B, Y, CarryOUT);
    end

endmodule