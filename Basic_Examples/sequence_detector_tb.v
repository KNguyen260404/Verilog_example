`timescale 1ns/1ps

module sequence_detector_tb;
    // Khai báo tín hiệu
    reg clk;
    reg reset;
    reg data_in;
    wire detected;
    
    // Khởi tạo DUT (Device Under Test)
    sequence_detector dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .detected(detected)
    );
    
    // Tạo xung clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock 100MHz
    end
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("sequence_detector_tb.vcd");
        $dumpvars(0, sequence_detector_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Khởi tạo
        reset = 1;
        data_in = 0;
        #20;
        
        // Bắt đầu kiểm tra
        reset = 0;
        
        // Kiểm tra chuỗi 1011 (nên phát hiện)
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 0; // 0
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); // Kiểm tra đầu ra
        
        // Kiểm tra chuỗi 10110 (nên phát hiện ở bit thứ 4)
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 0; // 0
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 0; // 0
        @(posedge clk); // Kiểm tra đầu ra
        
        // Kiểm tra chuỗi 10101 (không nên phát hiện)
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 0; // 0
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 0; // 0
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); // Kiểm tra đầu ra
        
        // Kiểm tra chuỗi chồng chéo 101011 (nên phát hiện ở bit thứ 6)
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 0; // 0
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 0; // 0
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); data_in = 1; // 1
        @(posedge clk); // Kiểm tra đầu ra
        
        // Reset lại
        reset = 1;
        #20;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Reset: %b, Data In: %b, Detected: %b", 
                 $time, reset, data_in, detected);
    end
endmodule 