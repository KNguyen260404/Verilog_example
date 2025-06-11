module priority_encoder_42 (
    input [3:0] in,     // 4-bit input
    output reg [1:0] out,  // 2-bit output
    output reg valid    // Valid output indicator
);

    // Priority encoder logic
    // Higher index inputs have higher priority
    // If no input is active (all 0s), valid = 0
    always @(*) begin
        valid = 1'b1;  // Default: output is valid
        
        if (in[3] == 1'b1) begin
            out = 2'b11;  // Priority 3
        end
        else if (in[2] == 1'b1) begin
            out = 2'b10;  // Priority 2
        end
        else if (in[1] == 1'b1) begin
            out = 2'b01;  // Priority 1
        end
        else if (in[0] == 1'b1) begin
            out = 2'b00;  // Priority 0
        end
        else begin
            out = 2'b00;  // Default output
            valid = 1'b0; // No input is active, output is invalid
        end
    end
    
endmodule
