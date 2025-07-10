module priority_encoder_8to3(
    input [7:0] in,
    output reg [2:0] out,
    output reg valid
);

    always @(*) begin
        valid = 1'b1; // Giả sử có đầu vào hợp lệ
        
        casex(in)
            8'b1xxxxxxx: out = 3'b111; // 7
            8'b01xxxxxx: out = 3'b110; // 6
            8'b001xxxxx: out = 3'b101; // 5
            8'b0001xxxx: out = 3'b100; // 4
            8'b00001xxx: out = 3'b011; // 3
            8'b000001xx: out = 3'b010; // 2
            8'b0000001x: out = 3'b001; // 1
            8'b00000001: out = 3'b000; // 0
            8'b00000000: begin
                out = 3'b000;
                valid = 1'b0; // Không có đầu vào nào được kích hoạt
            end
        endcase
    end
endmodule 