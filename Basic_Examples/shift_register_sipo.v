module shift_register_sipo(
    input clk,
    input reset,
    input data_in,       // dữ liệu đầu vào nối tiếp
    output reg [7:0] data_out // dữ liệu đầu ra song song
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= 8'b0;
        end else begin
            // Dịch dữ liệu vào từ bên phải
            data_out <= {data_out[6:0], data_in};
        end
    end
endmodule 