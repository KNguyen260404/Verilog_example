`timescale 1ns/1ps

module simple_fifo_tb;
    // Khai báo tín hiệu
    reg clk;
    reg reset;
    reg wr_en;
    reg rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full;
    wire empty;
    
    // Khởi tạo DUT (Device Under Test)
    simple_fifo dut (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );
    
    // Tạo xung clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock 100MHz
    end
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("simple_fifo_tb.vcd");
        $dumpvars(0, simple_fifo_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Khởi tạo
        reset = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;
        #20;
        
        // Reset FIFO
        reset = 0;
        #10;
        
        // Kiểm tra FIFO rỗng
        if (!empty) $display("Error: FIFO should be empty after reset");
        
        // Ghi dữ liệu vào FIFO
        wr_en = 1;
        data_in = 8'hA1;
        #10;
        
        data_in = 8'hB2;
        #10;
        
        data_in = 8'hC3;
        #10;
        
        data_in = 8'hD4;
        #10;
        
        // Dừng ghi
        wr_en = 0;
        #10;
        
        // Đọc dữ liệu từ FIFO
        rd_en = 1;
        #10; // Đọc A1
        
        #10; // Đọc B2
        
        #10; // Đọc C3
        
        #10; // Đọc D4
        
        // Kiểm tra FIFO rỗng sau khi đọc hết
        if (!empty) $display("Error: FIFO should be empty after reading all data");
        
        // Dừng đọc
        rd_en = 0;
        #10;
        
        // Kiểm tra đọc khi FIFO rỗng
        rd_en = 1;
        #10;
        
        // Ghi và đọc đồng thời
        wr_en = 1;
        data_in = 8'hE5;
        #10;
        
        data_in = 8'hF6;
        #10;
        
        // Dừng ghi và đọc
        wr_en = 0;
        rd_en = 0;
        #10;
        
        // Reset lại FIFO
        reset = 1;
        #20;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Reset: %b, WR_EN: %b, RD_EN: %b, Data In: %h, Data Out: %h, Full: %b, Empty: %b", 
                 $time, reset, wr_en, rd_en, data_in, data_out, full, empty);
    end
endmodule 