module binary_counter(
    input clk,
    input reset,
    input enable,
    input load,
    input [7:0] data,
    output reg [7:0] count
);
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 8'h00;
        end else if (load) begin
            count <= data;
        end else if (enable) begin
            count <= count + 1'b1;
        end
    end
endmodule 