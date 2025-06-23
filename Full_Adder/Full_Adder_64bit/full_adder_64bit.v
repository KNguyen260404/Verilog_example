module full_adder_64bit(
    input [63:0] a,
    input [63:0] b,
    input cin,
    output [63:0] sum,
    output cout,
    output overflow 
);
    wire [64:0] carry;
    assign carry[0] = cin;
    assign cout = carry[64];

    genvar i;
    generate
        for(i = 0 ; i < 64 ; i = i + 1) begin : full_adder_loop
            full_adder_1bit fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
    assign overflow = (a[63] == b[63]) && (a[63] != sum[63]);
endmodule