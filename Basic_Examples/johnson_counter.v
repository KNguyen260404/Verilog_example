module johnson_counter(
    input clk,
    input reset,
    output reg [3:0] count
);
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000;
        end else begin
            // Dịch trái và đảo bit thấp nhất
            count <= {count[2:0], ~count[3]};
        end
    end
endmodule 