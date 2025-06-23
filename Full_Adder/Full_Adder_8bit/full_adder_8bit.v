/* module full_adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout,
    output overflow
);
    wire sum1;
    wire sum2;
    wire sum3;
    wire sum4;
    wire sum5;
    wire sum6;
    wire sum7;
    wire sum8;
    wire carry1;
    wire carry2;
    wire carry3;
    wire carry4;
    wire carry5;
    wire carry6;
    wire carry7;
    wire carry8;

    full_adder_1bit fa1(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(carry1)
    );

    full_adder_1bit fa2(
        .a(a[1]),
        .b(b[1]),
        .cin(carry1),
        .sum(sum[1]),
        .cout(carry2)
    );

    full_adder_1bit fa3(
        .a(a[2]),
        .b(b[2]),
        .cin(carry2),
        .sum(sum[2]),
        .cout(carry3)
    );

    full_adder_1bit fa4(
        .a(a[3]),
        .b(b[3]),
        .cin(carry3),
        .sum(sum[3]),
        .cout(carry4)
    );

    full_adder_1bit fa5(
        .a(a[4]),
        .b(b[4]),
        .cin(carry4),
        .sum(sum[4]),
        .cout(carry5)
    );

    full_adder_1bit fa6(
        .a(a[5]),
        .b(b[5]),
        .cin(carry5),
        .sum(sum[5]),
        .cout(carry6)
    );

    full_adder_1bit fa7(
        .a(a[6]),
        .b(b[6]),
        .cin(carry6),
        .sum(sum[6]),
        .cout(carry7)
    );

    full_adder_1bit fa8(
        .a(a[7]),   
        .b(b[7]),
        .cin(carry7),
        .sum(sum[7]),
        .cout(cout)
    );

    // Overflow xảy ra khi hai số cùng dấu nhưng kết quả khác dấu
    // Đối với số có dấu (signed numbers)
    assign overflow = (a[7] == b[7]) && (a[7] != sum[7]);
endmodule

*/

module full_adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout,
    output overflow
);
    wire [8:0] carry;
    assign carry[0] = cin;
    assign cout = carry[8];

    genvar i;
    generate 
        for (i = 0; i < 8; i = i + 1) begin : full_adder_loop
            full_adder_1bit fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign overflow = (a[7] == b[7]) && (a[7] != sum[7]);
endmodule