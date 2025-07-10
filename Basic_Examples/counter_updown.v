module counter_updown(
    input clk,
    input reset,
    input up_down,  // 1: đếm lên, 0: đếm xuống
    output reg [3:0] count
);

    always @(posedge clk) begin
        if (reset) begin
            count <= 4'b0000;
        end else if (up_down) begin
            // Đếm lên
            count <= count + 1'b1;
        end else begin
            // Đếm xuống
            count <= count - 1'b1;
        end
    end
endmodule 