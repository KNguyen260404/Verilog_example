`include "mux_4bit_2to1.v"

module mux_4bit_4to1 (
    input [3:0] a,      // 4-bit input a
    input [3:0] b,      // 4-bit input b
    input [3:0] c,      // 4-bit input c
    input [3:0] d,      // 4-bit input d
    input [1:0] sel,    // 2-bit selection input
    output [3:0] y      // 4-bit output
);
    // Internal wires
    wire [3:0] mux1_out;
    wire [3:0] mux2_out;
    
    // Instantiate first level of 2-to-1 multiplexers
    mux_4bit_2to1 mux1 (
        .a(a),
        .b(b),
        .sel(sel[0]),
        .y(mux1_out)
    );
    
    mux_4bit_2to1 mux2 (
        .a(c),
        .b(d),
        .sel(sel[0]),
        .y(mux2_out)
    );
    
    // Instantiate second level of 2-to-1 multiplexer
    mux_4bit_2to1 mux3 (
        .a(mux1_out),
        .b(mux2_out),
        .sel(sel[1]),
        .y(y)
    );
    
    /* Truth table:
     * sel[1] sel[0] | output
     *    0     0    |   a
     *    0     1    |   b
     *    1     0    |   c
     *    1     1    |   d
     */
     
endmodule
