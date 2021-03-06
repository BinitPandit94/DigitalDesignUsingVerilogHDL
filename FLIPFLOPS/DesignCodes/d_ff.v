`timescale 1ns / 1ps
module d_ff (prn, clk, d, clrn, q, qn);       // dff generated from schematic
    input prn, clk, d, clrn;                  // prn: preset; clrn: clear (active low)
    output q, qn;                             // outputs q, qn
    wire wire_0, wire_1;                      // internal wire
    wire wire_2, wire_3;                      // internal wire
    assign wire_0 = ~(wire_1 & prn & wire_2); // 3-input nand
    assign wire_1 = ~(clk & clrn & wire_0);   // 3-input nand
    assign wire_2 = ~(wire_3 & clrn & d);     // 3-input nand
    assign wire_3 = ~(wire_1 & clk & wire_2); // 3-input nand
    assign q = ~(prn & wire_1 & qn);          // 3-input nand
    assign qn = ~(q & wire_3 & clrn);         // 3-input nand
endmodule