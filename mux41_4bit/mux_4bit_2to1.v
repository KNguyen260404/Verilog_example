module mux_4bit_2to1 (
    input [3:0] a,      // 4-bit input a
    input [3:0] b,      // 4-bit input b
    input sel,          // Selection input
    output [3:0] y      // 4-bit output
);

    // When sel = 0, y = a
    // When sel = 1, y = b
    assign y = sel ? b : a;

endmodule 