`timescale 1ns/1ps

module priority_encoder_8to3_tb;
    // Khai báo tín hiệu
    reg [7:0] in;
    wire [2:0] out;
    wire valid;
    
    // Khởi tạo DUT (Device Under Test)
    priority_encoder_8to3 dut (
        .in(in),
        .out(out),
        .valid(valid)
    );
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("priority_encoder_8to3_tb.vcd");
        $dumpvars(0, priority_encoder_8to3_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Kiểm tra tất cả các trường hợp
        
        // Không có đầu vào nào được kích hoạt
        in = 8'b00000000;
        #10;
        
        // Kiểm tra ưu tiên từ thấp đến cao
        in = 8'b00000001; // Bit 0 kích hoạt
        #10;
        
        in = 8'b00000010; // Bit 1 kích hoạt
        #10;
        
        in = 8'b00000100; // Bit 2 kích hoạt
        #10;
        
        in = 8'b00001000; // Bit 3 kích hoạt
        #10;
        
        in = 8'b00010000; // Bit 4 kích hoạt
        #10;
        
        in = 8'b00100000; // Bit 5 kích hoạt
        #10;
        
        in = 8'b01000000; // Bit 6 kích hoạt
        #10;
        
        in = 8'b10000000; // Bit 7 kích hoạt
        #10;
        
        // Kiểm tra ưu tiên khi nhiều bit được kích hoạt
        in = 8'b00000011; // Bit 0 và 1 kích hoạt, ưu tiên bit 1
        #10;
        
        in = 8'b00001111; // Bit 0-3 kích hoạt, ưu tiên bit 3
        #10;
        
        in = 8'b11111111; // Tất cả bit kích hoạt, ưu tiên bit 7
        #10;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Input: %b, Output: %b, Valid: %b", 
                 $time, in, out, valid);
    end
endmodule 