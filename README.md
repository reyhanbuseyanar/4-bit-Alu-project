# 4-Bit ALU Projesi

Bu proje, temel aritmetik ve mantıksal işlemleri gerçekleştirebilen bir **4-bit ALU** (Arithmetic Logic Unit) tasarımıdır. ALU, çeşitli işlem kodlarına (opcode) bağlı olarak toplama, çıkarma, çarpma ve mantıksal işlemler gibi görevleri yerine getirir.

## Özellikler
- **Girişler:**
  - `A` ve `B`: 4-bitlik girişler (işlem yapılacak sayılar)
  - `CarryIN`: Taşıma girişi (toplama ve çıkarma işlemleri için)
  - `opCodeA`: 3-bitlik işlem kodu (işlem türünü belirler)

- **Çıkışlar:**
  - `bcd`: 12-bitlik Binary Coded Decimal (BCD) çıktısı
  - `CarryOUT`: Taşıma çıkışı
  - `overflow`: Taşma durumu

## İşlem Kodları
ALU, aşağıdaki işlem kodlarını destekler:
- `000`: Toplama (**ADD**)
- `001`: Çıkarma (**SUB**)
- `010`: Çarpma (**MULT**)
- `100`: Mantıksal AND (**AND**)
- `101`: Mantıksal OR (**OR**)
- `110`: Mantıksal XOR (**XOR**)

## Modüller ve İşlevleri
- **`opCode` Modülü:** İşlem kodlarını belirler ve ALU'nun farklı birimlerini aktive eder.
- **`arithmeticUnit` Modülü:** Toplama ve çıkarma işlemlerini gerçekleştirir.
- **`logicUnit` Modülü:** Mantıksal işlemleri (AND, OR, XOR) gerçekleştirir.
- **`multiplier` Modülü:** Çarpma işlemini gerçekleştirir.
- **`BinaryToBCD` Modülü:** Sonuçları Binary'den BCD formatına çevirir.

## Kullanım
Proje, `Verilog` dili ile yazılmıştır ve çeşitli simülasyon araçlarıyla test edilebilir. Test için **Verilog testbench** dosyaları ve **Logisim** simülasyonları hazırlanmıştır. Logisim simülasyonları, tasarımın görsel doğrulaması ve analiz edilmesi için kullanılmıştır.

### Simülasyon Örnekleri
- **ADD İşlemi:**
  - Giriş: `A = 4'b0011`, `B = 4'b0001`, `opCodeA = 3'b000`
  - Çıkış: `bcd = 12'b000000000100`, `CarryOUT = 0`

- **AND İşlemi:**
  - Giriş: `A = 4'b1010`, `B = 4'b1100`, `opCodeA = 3'b100`
  - Çıkış: `bcd = 12'b000000000100`, `CarryOUT = 0`

- **Logisim Simülasyonu:**
  - Logisim yazılımı kullanılarak, ALU tasarımının tüm işlemleri adım adım test edilmiştir.
  - Her işlem koduna uygun devre şeması ve sonuçlar elde edilmiştir.
  - Logisim dosyalarına proje dizininden erişebilirsiniz.
