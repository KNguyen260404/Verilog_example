`timescale 1ns/1ps

module shift_register_piso_tb;
    // Khai báo tín hiệu
    reg clk;
    reg reset;
    reg load;
    reg [7:0] data_in;
    wire data_out;
    
    // Khởi tạo DUT (Device Under Test)
    shift_register_piso dut (
        .clk(clk),
        .reset(reset),
        .load(load),
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
        $dumpfile("shift_register_piso_tb.vcd");
        $dumpvars(0, shift_register_piso_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Khởi tạo
        reset = 1;
        load = 0;
        data_in = 8'h00;
        #20;
        
        // Reset và nạp dữ liệu
        reset = 0;
        load = 1;
        data_in = 8'hA5; // 10100101
        #10;
        
        // Bắt đầu dịch
        load = 0;
        #80; // 8 chu kỳ để dịch hết 8 bit
        
        // Nạp dữ liệu mới
        load = 1;
        data_in = 8'h3C; // 00111100
        #10;
        
        // Dịch dữ liệu mới
        load = 0;
        #80;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Reset: %b, Load: %b, Data In: %b, Data Out: %b", 
                 $time, reset, load, data_in, data_out);
    end
endmodule 