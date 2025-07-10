`timescale 1ns/1ps

module binary_counter_tb;
    // Khai báo tín hiệu
    reg clk;
    reg reset;
    reg enable;
    reg load;
    reg [7:0] data;
    wire [7:0] count;
    
    // Khởi tạo DUT (Device Under Test)
    binary_counter dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .load(load),
        .data(data),
        .count(count)
    );
    
    // Tạo xung clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock 100MHz
    end
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("binary_counter_tb.vcd");
        $dumpvars(0, binary_counter_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Khởi tạo
        reset = 1;
        enable = 0;
        load = 0;
        data = 8'h00;
        #20;
        
        // Reset bộ đếm
        reset = 0;
        #10;
        
        // Kiểm tra chức năng enable
        enable = 1;
        #50; // Đếm lên 5 giá trị
        
        enable = 0;
        #30; // Không đếm trong 3 chu kỳ
        
        // Kiểm tra chức năng load
        load = 1;
        data = 8'hA5;
        #10;
        
        load = 0;
        #10;
        
        // Tiếp tục đếm từ giá trị đã nạp
        enable = 1;
        #50;
        
        // Reset lại
        reset = 1;
        #20;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Reset: %b, Enable: %b, Load: %b, Data: %h, Count: %h", 
                 $time, reset, enable, load, data, count);
    end
endmodule 