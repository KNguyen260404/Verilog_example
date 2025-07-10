module simple_ram(
    input clk,
    input write_enable,
    input [3:0] address,
    input [7:0] data_in,
    output reg [7:0] data_out
);
    // Khai báo bộ nhớ 16x8
    reg [7:0] memory [0:15];
    
    // Xử lý ghi
    always @(posedge clk) begin
        if (write_enable)
            memory[address] <= data_in;
    end
    
    // Xử lý đọc (không đồng bộ)
    always @(*) begin
        data_out = memory[address];
    end
endmodule 