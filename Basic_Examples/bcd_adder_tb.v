`timescale 1ns/1ps

module bcd_adder_tb;
    // Khai báo tín hiệu
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    
    // Khởi tạo DUT (Device Under Test)
    bcd_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("bcd_adder_tb.vcd");
        $dumpvars(0, bcd_adder_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Kiểm tra các trường hợp không cần hiệu chỉnh (tổng < 10)
        a = 4'h3;
        b = 4'h4;
        cin = 0;
        #10;
        
        a = 4'h5;
        b = 4'h4;
        cin = 0;
        #10;
        
        a = 4'h2;
        b = 4'h3;
        cin = 1;
        #10;
        
        // Kiểm tra các trường hợp cần hiệu chỉnh (tổng > 9)
        a = 4'h5;
        b = 4'h5;
        cin = 0;
        #10;
        
        a = 4'h9;
        b = 4'h9;
        cin = 0;
        #10;
        
        a = 4'h8;
        b = 4'h1;
        cin = 1;
        #10;
        
        a = 4'h9;
        b = 4'h9;
        cin = 1;
        #10;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, A: %d, B: %d, Cin: %b, Sum: %d, Cout: %b", 
                 $time, a, b, cin, sum, cout);
    end
endmodule 