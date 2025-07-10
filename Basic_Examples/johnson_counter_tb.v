`timescale 1ns/1ps

module johnson_counter_tb;
    // Khai báo tín hiệu
    reg clk;
    reg reset;
    wire [3:0] count;
    
    // Khởi tạo DUT (Device Under Test)
    johnson_counter dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    
    // Tạo xung clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock 100MHz
    end
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("johnson_counter_tb.vcd");
        $dumpvars(0, johnson_counter_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Khởi tạo
        reset = 1;
        #20;
        
        // Bắt đầu đếm
        reset = 0;
        
        // Đợi đủ chu kỳ để thấy chuỗi Johnson đầy đủ (8 trạng thái)
        // 0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000
        #160;
        
        // Reset lại
        reset = 1;
        #20;
        
        // Đếm lại
        reset = 0;
        #80;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Reset: %b, Count: %b", 
                 $time, reset, count);
    end
endmodule 