module shift_register_piso(
    input clk,
    input reset,
    input load,         // 1: nạp dữ liệu song song, 0: dịch
    input [7:0] data_in,// dữ liệu đầu vào song song
    output reg data_out // dữ liệu đầu ra nối tiếp
);
    reg [7:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 8'b0;
            data_out <= 1'b0;
        end else if (load) begin
            // Nạp dữ liệu song song
            shift_reg <= data_in;
            data_out <= data_in[7];
        end else begin
            // Dịch dữ liệu
            data_out <= shift_reg[7];
            shift_reg <= {shift_reg[6:0], 1'b0};
        end
    end
endmodule 