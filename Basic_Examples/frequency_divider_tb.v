`timescale 1ns/1ps

module frequency_divider_tb;
    // Khai báo tín hiệu
    reg clk_in;
    reg reset;
    wire clk_out;
    
    // Khởi tạo DUT (Device Under Test)
    frequency_divider dut (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
    );
    
    // Tạo xung clock đầu vào
    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in; // Clock 100MHz
    end
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("frequency_divider_tb.vcd");
        $dumpvars(0, frequency_divider_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Khởi tạo
        reset = 1;
        #20;
        
        // Bắt đầu chia tần số
        reset = 0;
        
        // Đợi đủ chu kỳ để thấy nhiều chu kỳ đầu ra
        // Giả sử bộ chia tần số có hệ số chia là N = 4
        // Cần đợi ít nhất 4*N chu kỳ đầu vào để thấy N chu kỳ đầu ra
        #400;
        
        // Reset lại
        reset = 1;
        #20;
        
        reset = 0;
        #200;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Reset: %b, Clock In: %b, Clock Out: %b", 
                 $time, reset, clk_in, clk_out);
    end
    
    // Kiểm tra tần số đầu ra
    real clk_in_period = 10; // 10ns (100MHz)
    real expected_clk_out_period;
    
    initial begin
        // Giả sử hệ số chia là 4
        expected_clk_out_period = clk_in_period * 4;
        
        // Đợi đến khi reset được giải phóng
        wait(reset == 0);
        #50; // Đợi để bộ chia ổn định
        
        // Kiểm tra chu kỳ đầu ra
        forever begin
            @(posedge clk_out);
            $display("Clock out rising edge at time %t", $time);
        end
    end
endmodule 