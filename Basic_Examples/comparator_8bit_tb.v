`timescale 1ns/1ps

module comparator_8bit_tb;
    // Khai báo tín hiệu
    reg [7:0] a;
    reg [7:0] b;
    wire equal;
    wire greater;
    wire less;
    
    // Khởi tạo DUT (Device Under Test)
    comparator_8bit dut (
        .a(a),
        .b(b),
        .equal(equal),
        .greater(greater),
        .less(less)
    );
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("comparator_8bit_tb.vcd");
        $dumpvars(0, comparator_8bit_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Kiểm tra trường hợp a = b
        a = 8'h55;
        b = 8'h55;
        #10;
        
        // Kiểm tra trường hợp a > b
        a = 8'hFF;
        b = 8'h00;
        #10;
        
        a = 8'h80;
        b = 8'h7F;
        #10;
        
        // Kiểm tra trường hợp a < b
        a = 8'h00;
        b = 8'hFF;
        #10;
        
        a = 8'h7F;
        b = 8'h80;
        #10;
        
        // Kiểm tra các trường hợp khác
        a = 8'hAA;
        b = 8'h55;
        #10;
        
        a = 8'h01;
        b = 8'h02;
        #10;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, A: %h, B: %h, Equal: %b, Greater: %b, Less: %b", 
                 $time, a, b, equal, greater, less);
    end
endmodule 