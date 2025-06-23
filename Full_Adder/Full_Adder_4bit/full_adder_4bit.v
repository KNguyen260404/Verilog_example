module full_adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout,
    output overflow
);
    wire sum1;
    wire sum2;
    wire sum3;
    wire sum4;
    wire carry1;
    wire carry2;
    wire carry3;

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
        .cout(cout)
    );
    
    // Overflow xảy ra khi hai số cùng dấu nhưng kết quả khác dấu
    // Đối với số có dấu (signed numbers)
    assign overflow = (a[3] == b[3]) && (a[3] != sum[3]);
endmodule