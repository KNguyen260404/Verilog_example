module full_adder_8bit_optimized(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout,
    output overflow
);
    // Khai báo mảng dây nối cho các bit nhớ giữa các full adder
    wire [8:0] carry;
    
    // Bit nhớ đầu vào cho full adder đầu tiên
    assign carry[0] = cin;
    
    // Bit nhớ đầu ra cuối cùng
    assign cout = carry[8];
    
    // Sử dụng vòng lặp generate để tạo ra 8 full adder
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
    
    // Overflow xảy ra khi hai số cùng dấu nhưng kết quả khác dấu
    // Đối với số có dấu (signed numbers)
    assign overflow = (a[7] == b[7]) && (a[7] != sum[7]);
    
endmodule 