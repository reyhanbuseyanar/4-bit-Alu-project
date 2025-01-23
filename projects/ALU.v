module ALU (
    input [3:0] A, B,          // A ve B 4-bitlik girişler (operasyon yapılacak sayılar)
    input CarryIN,             // Taşıma girişi (add/sub işlemleri için)
    input [2:0] opCodeA,       // 3-bitlik işlem kodu (işlem türünü belirler)
    output [11:0] bcd,         // 12-bitlik BCD (Binary Coded Decimal) çıktısı
    output CarryOUT, overflow  // Taşıma çıkışı ve taşma durumu
);

// İşlem kodları:
// 0 -> ADD
// 1 -> SUB
// 2 -> MULT
// 4 -> AND
// 5 -> OR
// 6 -> XOR

wire [7:0] opCode8;            // 8-bitlik işlem kodu
wire [3:0] add_Y, sub_Y;       // Toplama ve çıkarma sonuçları
wire [3:0] resultA, resultO, resultX, lUOutput1; // Mantıksal birim sonuçları
wire [3:0] aUtemp1, aUtemp2, lUOutput2; // Ara bağlantılar
wire [3:0] wireY, wireLA;     // Ara bağlantılar
wire [7:0] opwireM, wireM, Y; // Çarpma için ara bağlantılar

// İşlem kodunu belirlemek için opCode modülünü çağırıyoruz
opCode opCd (.A(opCodeA), .opCode(opCode8));

// Aritmetik birimi (toplama ve çıkarma işlemleri için) çağrılıyor
arithmeticUnit aU(
    .opCode(opCode8[1:0]),      // İşlem türü (toplama veya çıkarma)
    .A(A), 
    .B(B), 
    .CarryIN(CarryIN), 
    .add_Y(add_Y), 
    .sub_Y(sub_Y), 
    .CarryOUT(CarryOUT), 
    .overflow(overflow)
);

// Mantıksal birim (AND, OR, XOR işlemleri için) çağrılıyor
logicUnit lU (
    .opCode(opCode8[6:4]), 
    .A(A), 
    .B(B), 
    .resultA(resultA), 
    .resultO(resultO), 
    .resultX(resultX)
);

// Çarpma birimi (MULT işlemi için) çağrılıyor
multiplier mU (.A(A), .B(B), .Y(opwireM));

// Mantıksal ve aritmetik birimlerin sonuçlarını birleştiriyoruz

// OR işlemleri için mantıksal birleştirmeler
or o01 (lUOutput1[0], resultA[0], resultO[0]);
or o02 (lUOutput1[1], resultA[1], resultO[1]);
or o03 (lUOutput1[2], resultA[2], resultO[2]);
or o04 (lUOutput1[3], resultA[3], resultO[3]);

or o11 (lUOutput2[0], lUOutput1[0], resultX[0]);
or o12 (lUOutput2[1], lUOutput1[1], resultX[1]);
or o13 (lUOutput2[2], lUOutput1[2], resultX[2]);
or o14 (lUOutput2[3], lUOutput1[3], resultX[3]);

// Aritmetik işlemler (toplama ve çıkarma) için AND işlemleri
and a01 (aUtemp1[0], opCode8[0], add_Y[0]);
and a02 (aUtemp1[1], opCode8[0], add_Y[1]);
and a03 (aUtemp1[2], opCode8[0], add_Y[2]);
and a04 (aUtemp1[3], opCode8[0], add_Y[3]);

and a11 (aUtemp2[0], opCode8[1], sub_Y[0]);
and a12 (aUtemp2[1], opCode8[1], sub_Y[1]);
and a13 (aUtemp2[2], opCode8[1], sub_Y[2]);
and a14 (aUtemp2[3], opCode8[1], sub_Y[3]);

// Çarpma işlemi için AND işlemleri
and a21 (wireM[0], opCode8[2], opwireM[0]);
and a22 (wireM[1], opCode8[2], opwireM[1]);
and a23 (wireM[2], opCode8[2], opwireM[2]);
and a24 (wireM[3], opCode8[2], opwireM[3]);
and a25 (wireM[4], opCode8[2], opwireM[4]);
and a26 (wireM[5], opCode8[2], opwireM[5]);
and a27 (wireM[6], opCode8[2], opwireM[6]);
and a28 (wireM[7], opCode8[2], opwireM[7]);

// Aritmetik ve mantıksal işlemleri birleştiriyoruz
or o21 (wireY[0], aUtemp1[0], aUtemp2[0]);
or o22 (wireY[1], aUtemp1[1], aUtemp2[1]);
or o23 (wireY[2], aUtemp1[2], aUtemp2[2]);
or o24 (wireY[3], aUtemp1[3], aUtemp2[3]);

// Mantıksal ve aritmetik işlemleri birleştiriyoruz
or o1 (wireLA[0], lUOutput2[0], wireY[0]);
or o2 (wireLA[1], lUOutput2[1], wireY[1]);
or o3 (wireLA[2], lUOutput2[2], wireY[2]);
or o4 (wireLA[3], lUOutput2[3], wireY[3]);

// Çarpma ve diğer işlemleri birleştiriyoruz
or o31 (Y[0], wireLA[0], wireM[0]);
or o32 (Y[1], wireLA[1], wireM[1]);
or o33 (Y[2], wireLA[2], wireM[2]);
or o34 (Y[3], wireLA[3], wireM[3]);
or o35 (Y[4], 1'b0, wireM[4]);
or o36 (Y[5], 1'b0, wireM[5]);
or o37 (Y[6], 1'b0, wireM[6]);
or o38 (Y[7], 1'b0, wireM[7]);

// Binary'den BCD'ye dönüşüm (sonuç çıktısı olarak BCD veriyoruz)
BinaryToBCD btod1(.binary(Y), .bcd(bcd)); // Y'nin binary değeri BCD'ye çevrilir
endmodule

