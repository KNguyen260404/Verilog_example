/*module full_adder_16bit(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout,
    output overflow
);
    wire [16:0] carry;
    assign carry[0] = cin;
    assign cout = carry[16];

    full_adder_1bit fa1(
        .a(a[0]),
        .b(b[0]),
        .cin(carry[0]),
        .sum(sum[0]),
        .cout(carry[1])
    );

    full_adder_1bit fa2(
        .a(a[1]),
        .b(b[1]),
        .cin(carry[1]),
        .sum(sum[1]),
        .cout(carry[2])
    );

    full_adder_1bit fa3(
        .a(a[2]),
        .b(b[2]),
        .cin(carry[2]),
        .sum(sum[2]),
        .cout(carry[3])
    );

    full_adder_1bit fa4(
        .a(a[3]),
        .b(b[3]),
        .cin(carry[3]),
        .sum(sum[3]),
        .cout(carry[4])
    );

    full_adder_1bit fa5(
        .a(a[4]),
        .b(b[4]),
        .cin(carry[4]),
        .sum(sum[4]),
        .cout(carry[5])
    );

    full_adder_1bit fa6(
        .a(a[5]),
        .b(b[5]),
        .cin(carry[5]),
        .sum(sum[5]),
        .cout(carry[6])
    );

    full_adder_1bit fa7(
        .a(a[6]),
        .b(b[6]),
        .cin(carry[6]),
        .sum(sum[6]),
        .cout(carry[7])
    );

    full_adder_1bit fa8(
        .a(a[7]),
        .b(b[7]),
        .cin(carry[7]),
        .sum(sum[7]),
        .cout(carry[8])
    );

    full_adder_1bit fa9(
        .a(a[8]),
        .b(b[8]),
        .cin(carry[8]),
        .sum(sum[8]),
        .cout(carry[9])
    );

    full_adder_1bit fa10(
        .a(a[9]),
        .b(b[9]),
        .cin(carry[9]),
        .sum(sum[9]),
        .cout(carry[10])
    );

    full_adder_1bit fa11(
        .a(a[10]),
        .b(b[10]),
        .cin(carry[10]),
        .sum(sum[10]),
        .cout(carry[11])
    );
    
    full_adder_1bit fa12(
        .a(a[11]),
        .b(b[11]),
        .cin(carry[11]),
        .sum(sum[11]),
        .cout(carry[12])
    );
    
    full_adder_1bit fa13(
        .a(a[12]),
        .b(b[12]),
        .cin(carry[12]),
        .sum(sum[12]),
        .cout(carry[13])
    );
    
    full_adder_1bit fa14(
        .a(a[13]),
        .b(b[13]),
        .cin(carry[13]),
        .sum(sum[13]),
        .cout(carry[14])
    );
    
    full_adder_1bit fa15(
        .a(a[14]),
        .b(b[14]),
        .cin(carry[14]),
        .sum(sum[14]),
        .cout(carry[15])
    );

    full_adder_1bit fa16(
        .a(a[15]),
        .b(b[15]),
        .cin(carry[15]),
        .sum(sum[15]),
        .cout(carry[16])
    );

    assign overflow = (a[15] == b[15]) && (a[15] != sum[15]);
endmodule */

module full_adder_16bit(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout,
    output overflow
);
    wire [16:0] carry;
    assign carry[0] = cin;
    assign cout = carry[16];

    genvar i;
    generate 
        for (i = 0 ; i < 16 ; i = i + 1) begin : full_adder_loop
            full_adder_1bit fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
    assign overflow = (a[15] == b[15]) && (a[15] != sum[15]);
endmodule