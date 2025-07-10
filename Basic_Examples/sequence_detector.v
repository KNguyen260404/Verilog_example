module sequence_detector(
    input clk,
    input reset,
    input data_in,
    output reg detected
);
    // Định nghĩa trạng thái
    parameter S0 = 3'b000;  // Trạng thái bắt đầu
    parameter S1 = 3'b001;  // Đã thấy 1
    parameter S2 = 3'b010;  // Đã thấy 10
    parameter S3 = 3'b011;  // Đã thấy 101
    parameter S4 = 3'b100;  // Đã thấy 1011 (trạng thái phát hiện)
    
    reg [2:0] current_state, next_state;
    
    // Logic trạng thái hiện tại
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end
    
    // Logic trạng thái kế tiếp
    always @(*) begin
        case (current_state)
            S0: next_state = data_in ? S1 : S0;
            S1: next_state = data_in ? S1 : S2;
            S2: next_state = data_in ? S3 : S0;
            S3: next_state = data_in ? S1 : S4;
            S4: next_state = data_in ? S1 : S0;
            default: next_state = S0;
        endcase
    end
    
    // Logic đầu ra
    always @(*) begin
        detected = (current_state == S4);
    end
endmodule 