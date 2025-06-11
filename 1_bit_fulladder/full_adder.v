
module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    
    // Internal wires
    wire sum1;
    wire carry1;
    wire carry2;
    
    // Instantiate two half adders
    half_adder ha1 (
        .a(a),
        .b(b),
        .sum(sum1),
        .carry(carry1)
    );
    
    half_adder ha2 (
        .a(sum1),
        .b(cin),
        .sum(sum),
        .carry(carry2)
    );
    
    // Final carry out is OR of the two carries
    assign cout = carry1 | carry2;
    
endmodule
