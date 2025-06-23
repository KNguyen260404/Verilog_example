module full_adder_8bit_tb;
    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    
    // Outputs
    wire [7:0] sum;
    wire cout;
    wire overflow;
    
    // Biến phụ để hiển thị số có dấu
    reg signed [7:0] a_signed;
    reg signed [7:0] b_signed;
    wire signed [7:0] sum_signed;
    
    // Instantiate the Unit Under Test (UUT)
    full_adder_8bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout),
        .overflow(overflow)
    );
    
    // Gán giá trị cho biến phụ
    always @* begin
        a_signed = a;
        b_signed = b;
    end
    
    assign sum_signed = sum;
    
    initial begin
        // Initialize inputs
        a = 0; b = 0; cin = 0;
        #10;
        
        // Test case 1: Simple addition (không tràn số)
        a = 8'h05; b = 8'h0A; cin = 0; // 5 + 10 = 15
        #10;
        
        // Test case 2: Addition with carry-in
        a = 8'h05; b = 8'h0A; cin = 1; // 5 + 10 + 1 = 16
        #10;
        
        // Test case 3: Larger numbers (không tràn số)
        a = 8'h3F; b = 8'h40; cin = 0; // 63 + 64 = 127 (max positive signed)
        #10;
        
        // Test case 4: Overflow dương (hai số dương ra số âm)
        a = 8'h7F; b = 8'h01; cin = 0; // 127 + 1 = 128 (overflow, kết quả là -128)
        #10;
        
        // Test case 5: Overflow âm (hai số âm ra số dương)
        a = 8'h80; b = 8'h80; cin = 0; // -128 + -128 = -256 (overflow, kết quả là 0 với cout=1)
        #10;
        
        // Test case 6: Số âm + số dương = số âm (không overflow)
        a = 8'hFF; b = 8'h01; cin = 0; // -1 + 1 = 0
        #10;
        
        // Test case 7: Số âm + số dương = số dương (không overflow)
        a = 8'hFF; b = 8'h02; cin = 0; // -1 + 2 = 1
        #10;
        
        // Test case 8: Số âm + số âm (không overflow)
        a = 8'hFE; b = 8'hFD; cin = 0; // -2 + -3 = -5
        #10;
        
        // Test case 9: Carry out nhưng không overflow
        a = 8'hFF; b = 8'h01; cin = 0; // 255 + 1 = 256 (cout=1, sum=0) hoặc -1 + 1 = 0 (không overflow)
        #10;
        
        // Test case 10: Maximum unsigned value
        a = 8'hFF; b = 8'hFF; cin = 0; // 255 + 255 = 510 (cout=1, sum=FE)
        #10;
        
        $finish;
    end
    
    // Display results
    initial begin
        $monitor("Time=%0t | a=%h(%0d/%0d) b=%h(%0d/%0d) cin=%b | sum=%h(%0d/%0d) cout=%b overflow=%b", 
                 $time, a, a, a_signed, b, b, b_signed, cin, sum, sum, sum_signed, cout, overflow);
        $dumpfile("full_adder_8bit_tb.vcd");
        $dumpvars(0, full_adder_8bit_tb);
    end
endmodule
