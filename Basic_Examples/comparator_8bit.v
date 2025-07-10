module comparator_8bit(
    input [7:0] a,
    input [7:0] b,
    output reg equal,
    output reg greater,
    output reg less
);

    always @(*) begin
        if (a == b) begin
            equal = 1'b1;
            greater = 1'b0;
            less = 1'b0;
        end else if (a > b) begin
            equal = 1'b0;
            greater = 1'b1;
            less = 1'b0;
        end else begin
            equal = 1'b0;
            greater = 1'b0;
            less = 1'b1;
        end
    end
endmodule 