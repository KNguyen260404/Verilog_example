module bcd_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output reg [3:0] sum,
    output reg cout
);
    reg [4:0] temp_sum;
    
    always @(*) begin
        // Cộng bình thường
        temp_sum = a + b + cin;
        
        // Kiểm tra nếu kết quả > 9 (không phải BCD hợp lệ)
        if (temp_sum > 9) begin
            sum = temp_sum + 6; // Cộng thêm 6 để hiệu chỉnh
            cout = 1'b1;
        end else begin
            sum = temp_sum[3:0];
            cout = 1'b0;
        end
    end
endmodule 