module full_adder_32bit_tb;
    // Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg cin;
    
    // Outputs
    wire [31:0] sum;
    wire cout;
    wire overflow;
    
    // Biến phụ để hiển thị số có dấu
    reg signed [31:0] a_signed;
    reg signed [31:0] b_signed;
    wire signed [31:0] sum_signed;
    
    // Instantiate the Unit Under Test (UUT)
    full_adder_32bit uut (
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
        a = 32'h00000005; b = 32'h0000000A; cin = 0; // 5 + 10 = 15
        #10;
        
        // Test case 2: Addition with carry-in
        a = 32'h00000005; b = 32'h0000000A; cin = 1; // 5 + 10 + 1 = 16
        #10;
        
        // Test case 3: Larger numbers (không tràn số)
        a = 32'h000FFFFF; b = 32'h00100000; cin = 0; // 1048575 + 1048576 = 2097151
        #10;
        
        // Test case 4: Overflow dương (hai số dương ra số âm)
        a = 32'h7FFFFFFF; b = 32'h00000001; cin = 0; // 2147483647 + 1 = 2147483648 (overflow, kết quả là -2147483648)
        #10;
        
        // Test case 5: Overflow âm (hai số âm ra số dương)
        a = 32'h80000000; b = 32'h80000000; cin = 0; // -2147483648 + -2147483648 = -4294967296 (overflow, kết quả là 0 với cout=1)
        #10;
        
        // Test case 6: Số âm + số dương = số âm (không overflow)
        a = 32'hFFFFFFFF; b = 32'h00000001; cin = 0; // -1 + 1 = 0
        #10;
        
        // Test case 7: Số âm + số dương = số dương (không overflow)
        a = 32'hFFFFFFFF; b = 32'h00000002; cin = 0; // -1 + 2 = 1
        #10;
        
        // Test case 8: Số âm + số âm (không overflow)
        a = 32'hFFFFFFFE; b = 32'hFFFFFFFD; cin = 0; // -2 + -3 = -5
        #10;
        
        // Test case 9: Carry out nhưng không overflow
        a = 32'hFFFFFFFF; b = 32'h00000001; cin = 0; // 4294967295 + 1 = 4294967296 (cout=1, sum=0) hoặc -1 + 1 = 0 (không overflow)
        #10;
        
        // Test case 10: Maximum unsigned value
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; cin = 0; // 4294967295 + 4294967295 = 8589934590 (cout=1, sum=FFFFFFFE)
        #10;
        
        $finish;
    end
    
    // Display results with hex và decimal format
    initial begin
        $monitor("Time=%0t | a=%h(%0d/%0d) b=%h(%0d/%0d) cin=%b | sum=%h(%0d/%0d) cout=%b overflow=%b", 
                 $time, a, a, a_signed, b, b, b_signed, cin, sum, sum, sum_signed, cout, overflow);
        $dumpfile("full_adder_32bit_tb.vcd");
        $dumpvars(0, full_adder_32bit_tb);
    end
endmodule
