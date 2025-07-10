`timescale 1ns/1ps

module simple_ram_tb;
    // Khai báo tín hiệu
    reg clk;
    reg we;
    reg [7:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;
    
    // Khởi tạo DUT (Device Under Test)
    simple_ram dut (
        .clk(clk),
        .we(we),
        .addr(addr),
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
        $dumpfile("simple_ram_tb.vcd");
        $dumpvars(0, simple_ram_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Khởi tạo
        we = 0;
        addr = 0;
        data_in = 0;
        #20;
        
        // Ghi dữ liệu vào một số địa chỉ
        we = 1;
        addr = 8'h00;
        data_in = 8'hA5;
        #10;
        
        addr = 8'h01;
        data_in = 8'h3C;
        #10;
        
        addr = 8'h02;
        data_in = 8'hF0;
        #10;
        
        addr = 8'h03;
        data_in = 8'h55;
        #10;
        
        // Đọc dữ liệu từ các địa chỉ đã ghi
        we = 0;
        addr = 8'h00;
        #10;
        
        addr = 8'h01;
        #10;
        
        addr = 8'h02;
        #10;
        
        addr = 8'h03;
        #10;
        
        // Đọc từ địa chỉ chưa ghi
        addr = 8'h04;
        #10;
        
        // Ghi đè lên địa chỉ cũ
        we = 1;
        addr = 8'h01;
        data_in = 8'h99;
        #10;
        
        // Đọc lại địa chỉ đã ghi đè
        we = 0;
        addr = 8'h01;
        #10;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, WE: %b, Addr: %h, Data In: %h, Data Out: %h", 
                 $time, we, addr, data_in, data_out);
    end
endmodule 