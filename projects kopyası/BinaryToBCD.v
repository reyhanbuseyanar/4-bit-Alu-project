module BinaryToBCD (
    input [7:0] binary,
    output [11:0] bcd
);

wire empty1, empty2;
wire [3:0] dab1, dab2, dab3, dab4, dab5;

and a111 (empty1, 1'b0, 1'b0);
and a000 (empty2, 1'b0, 1'b0);
and a222 (bcd[11], 1'b0, 1'b0);
and a223 (bcd[10], 1'b0, 1'b0);

dabble d1t (.A((empty1)),
.B(binary[7]),
.C(binary[6]),
.D(binary[5]),
.X(dab1[0]),
.Y(dab1[1]),
.Z(dab1[2]),
.E(dab1[3]));

dabble d2u (.A((dab1[1])),
.B(dab1[2]),
.C(dab1[3]),
.D(binary[4]),
.X(dab2[0]),
.Y(dab2[1]),
.Z(dab2[2]),
.E(dab2[3]));

dabble d3v (.A((dab2[1])),
.B(dab2[2]),
.C(dab2[3]),
.D(binary[3]),
.X(dab3[0]),
.Y(dab3[1]),
.Z(dab3[2]),
.E(dab3[3]));

dabble d4w (.A((empty2)),
.B(dab1[0]),
.C(dab2[0]),
.D(dab3[0]),
.X(bcd[9]),
.Y(dab4[1]),
.Z(dab4[2]),
.E(dab4[3]));

dabble d5x (.A((dab3[1])),
.B(dab3[2]),
.C(dab3[3]),
.D(binary[2]),
.X(dab5[0]),
.Y(dab5[1]),
.Z(dab5[2]),
.E(dab5[3]));

dabble d6y (.A((dab4[1])),
.B(dab4[2]),
.C(dab4[3]),
.D(dab5[0]),
.X(bcd[8]),
.Y(bcd[7]),
.Z(bcd[6]),
.E(bcd[5]));

dabble d7z (.A((dab5[1])),
.B(dab5[2]),
.C(dab5[3]),
.D(binary[1]),
.X(bcd[4]),
.Y(bcd[3]),
.Z(bcd[2]),
.E(bcd[1]));

or o1 (bcd[0], binary[0], 1'b0);

endmodule