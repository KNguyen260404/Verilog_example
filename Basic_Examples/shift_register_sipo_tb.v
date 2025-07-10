`timescale 1ns/1ps

module shift_register_sipo_tb;
    // Khai báo tín hiệu
    reg clk;
    reg reset;
    reg data_in;
    wire [7:0] data_out;
    
    // Khởi tạo DUT (Device Under Test)
    shift_register_sipo dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    // Tạo xung clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock 100MHz
    end
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("shift_register_sipo_tb.vcd");
        $dumpvars(0, shift_register_sipo_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Khởi tạo
        reset = 1;
        data_in = 0;
        #20;
        
        // Reset và bắt đầu dịch dữ liệu 10101010
        reset = 0;
        
        // Bit 1
        data_in = 1;
        #10;
        
        // Bit 2
        data_in = 0;
        #10;
        
        // Bit 3
        data_in = 1;
        #10;
        
        // Bit 4
        data_in = 0;
        #10;
        
        // Bit 5
        data_in = 1;
        #10;
        
        // Bit 6
        data_in = 0;
        #10;
        
        // Bit 7
        data_in = 1;
        #10;
        
        // Bit 8
        data_in = 0;
        #10;
        
        // Dịch thêm một chuỗi mới 11001100
        // Bit 1
        data_in = 1;
        #10;
        
        // Bit 2
        data_in = 1;
        #10;
        
        // Bit 3
        data_in = 0;
        #10;
        
        // Bit 4
        data_in = 0;
        #10;
        
        // Bit 5
        data_in = 1;
        #10;
        
        // Bit 6
        data_in = 1;
        #10;
        
        // Bit 7
        data_in = 0;
        #10;
        
        // Bit 8
        data_in = 0;
        #10;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Reset: %b, Data In: %b, Data Out: %b", 
                 $time, reset, data_in, data_out);
    end
endmodule 