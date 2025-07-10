module simple_fifo #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 16
)(
    input clk,
    input reset,
    input write_enable,
    input read_enable,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,
    output reg empty,
    output reg full
);
    // Khai báo bộ nhớ
    reg [DATA_WIDTH-1:0] memory [0:FIFO_DEPTH-1];
    reg [$clog2(FIFO_DEPTH):0] write_ptr;
    reg [$clog2(FIFO_DEPTH):0] read_ptr;
    reg [$clog2(FIFO_DEPTH):0] count;
    
    // Xác định trạng thái empty và full
    always @(*) begin
        empty = (count == 0);
        full = (count == FIFO_DEPTH);
    end
    
    // Xử lý ghi và đọc
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            write_ptr <= 0;
            read_ptr <= 0;
            count <= 0;
        end else begin
            // Xử lý ghi
            if (write_enable && !full) begin
                memory[write_ptr[($clog2(FIFO_DEPTH)-1):0]] <= data_in;
                write_ptr <= write_ptr + 1;
                count <= count + 1;
            end
            
            // Xử lý đọc
            if (read_enable && !empty) begin
                data_out <= memory[read_ptr[($clog2(FIFO_DEPTH)-1):0]];
                read_ptr <= read_ptr + 1;
                count <= count - 1;
            end
        end
    end
endmodule 