`timescale 1ns/1ps

module counter_updown_tb;
    // Khai báo tín hiệu
    reg clk;
    reg reset;
    reg up_down;
    wire [3:0] count;
    
    // Khởi tạo DUT (Device Under Test)
    counter_updown dut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );
    
    // Tạo xung clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock 100MHz
    end
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("counter_updown_tb.vcd");
        $dumpvars(0, counter_updown_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Khởi tạo
        reset = 1;
        up_down = 1; // Đếm lên
        #20;
        
        // Bắt đầu đếm lên
        reset = 0;
        #100;
        
        // Chuyển sang đếm xuống
        up_down = 0;
        #100;
        
        // Reset lại
        reset = 1;
        #20;
        reset = 0;
        up_down = 1; // Đếm lên lại
        #60;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Reset: %b, Up/Down: %b, Count: %b", 
                 $time, reset, up_down, count);
    end
endmodule 