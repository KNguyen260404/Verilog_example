module decoder_24 (
    input [1:0] a,
    input en,
    output reg [3:0] out
);

    always @(*) begin
        if (en) begin
            case (a)
                2'b00: out = 4'b0001;
                2'b01: out = 4'b0010;
                2'b10: out = 4'b0100;
                2'b11: out = 4'b1000;
            endcase
        end else begin
            out = 4'b0000;
        end
    end
endmodule
