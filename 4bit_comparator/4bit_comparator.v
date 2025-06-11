module bit4_comparator (
    input [3:0] a,      // 4-bit input a
    input [3:0] b,      // 4-bit input b
    output reg equal,   // Equal output (a == b)
    output reg greater, // Greater output (a > b)
    output reg less     // Less output (a < b)
);

    // Comparator logic
    always @(*) begin
        // Default values
        equal = 1'b0;
        greater = 1'b0;
        less = 1'b0;
        
        // Compare a and b
        if (a == b) begin
            equal = 1'b1;
        end
        else if (a > b) begin
            greater = 1'b1;
        end
        else begin
            less = 1'b1;
        end
    end
    
endmodule
