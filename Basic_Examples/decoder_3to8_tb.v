`timescale 1ns/1ps

module decoder_3to8_tb;
    // Khai báo tín hiệu
    reg [2:0] in;
    reg enable;
    wire [7:0] out;
    
    // Khởi tạo DUT (Device Under Test)
    decoder_3to8 dut (
        .in(in),
        .enable(enable),
        .out(out)
    );
    
    // Theo dõi các tín hiệu
    initial begin
        $dumpfile("decoder_3to8_tb.vcd");
        $dumpvars(0, decoder_3to8_tb);
    end
    
    // Kịch bản kiểm tra
    initial begin
        // Kiểm tra khi enable = 0
        enable = 0;
        in = 3'b000;
        #10;
        
        in = 3'b111;
        #10;
        
        // Kiểm tra tất cả các trường hợp khi enable = 1
        enable = 1;
        
        in = 3'b000;
        #10;
        
        in = 3'b001;
        #10;
        
        in = 3'b010;
        #10;
        
        in = 3'b011;
        #10;
        
        in = 3'b100;
        #10;
        
        in = 3'b101;
        #10;
        
        in = 3'b110;
        #10;
        
        in = 3'b111;
        #10;
        
        // Kết thúc mô phỏng
        $finish;
    end
    
    // Hiển thị kết quả
    initial begin
        $monitor("Time: %t, Enable: %b, Input: %b, Output: %b", 
                 $time, enable, in, out);
    end
endmodule 