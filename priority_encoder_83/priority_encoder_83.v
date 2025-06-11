module priority_encoder_83 (
    input [7:0] in,     // 8-bit input
    output reg [2:0] out,  // 3-bit output
    output reg valid    // Valid output indicator
);

    // Priority encoder logic
    // Higher index inputs have higher priority
    // If no input is active (all 0s), valid = 0
    always @(*) begin
        valid = 1'b1;  // Default: output is valid
        
        if (in[7] == 1'b1) begin
            out = 3'b111;  // Priority 7
        end
        else if (in[6] == 1'b1) begin
            out = 3'b110;  // Priority 6
        end
        else if (in[5] == 1'b1) begin
            out = 3'b101;  // Priority 5
        end
        else if (in[4] == 1'b1) begin
            out = 3'b100;  // Priority 4
        end
        else if (in[3] == 1'b1) begin
            out = 3'b011;  // Priority 3
        end
        else if (in[2] == 1'b1) begin
            out = 3'b010;  // Priority 2
        end
        else if (in[1] == 1'b1) begin
            out = 3'b001;  // Priority 1
        end
        else if (in[0] == 1'b1) begin
            out = 3'b000;  // Priority 0
        end
        else begin
            out = 3'b000;  // Default output
            valid = 1'b0;  // No input is active, output is invalid
        end
    end
    
endmodule
