module full_adder_64bit_tb;
    // Inputs
    reg [63:0] a;
    reg [63:0] b;
    reg cin;
    
    // Outputs
    wire [63:0] sum;
    wire cout;
    wire overflow;
    
    // Biến phụ để hiển thị số có dấu
    reg signed [63:0] a_signed;
    reg signed [63:0] b_signed;
    wire signed [63:0] sum_signed;
    
    // Instantiate the Unit Under Test (UUT)
    full_adder_64bit uut (
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
        a = 64'h0000_0010_0000_0005; b = 64'h0000_0000_0100_000A; cin = 0; // 5 + 10 = 15
        #10;
        
        // Test case 2: Addition with carry-in
        a = 64'h0000_0000_0000_0005; b = 64'h0000_0000_0000_000A; cin = 1; // 5 + 10 + 1 = 16
        #10;
        
        // Test case 3: Larger numbers (không tràn số)
        a = 64'h0000_0000_FFFF_FFFF; b = 64'h0000_0000_0000_0001; cin = 0; // 4294967295 + 1 = 4294967296
        #10;
        
        // Test case 4: Overflow dương (hai số dương ra số âm)
        a = 64'h7FFF_FFFF_FFFF_FFFF; b = 64'h0000_0000_0000_0001; cin = 0; // 2^63-1 + 1 = 2^63 (overflow, kết quả là -2^63)
        #10;
        
        // Test case 5: Overflow âm (hai số âm ra số dương)
        a = 64'h8000_0000_0000_0000; b = 64'h8000_0000_0000_0000; cin = 0; // -2^63 + -2^63 = -2^64 (overflow, kết quả là 0 với cout=1)
        #10;
        
        // Test case 6: Số âm + số dương = số âm (không overflow)
        a = 64'hFFFF_FFFF_FFFF_FFFF; b = 64'h0000_0000_0000_0001; cin = 0; // -1 + 1 = 0
        #10;
        
        // Test case 7: Số âm + số dương = số dương (không overflow)
        a = 64'hFFFF_FFFF_FFFF_FFFF; b = 64'h0000_0000_0000_0002; cin = 0; // -1 + 2 = 1
        #10;
        
        // Test case 8: Số âm + số âm (không overflow)
        a = 64'hFFFF_FFFF_FFFF_FFFE; b = 64'hFFFF_FFFF_FFFF_FFFD; cin = 0; // -2 + -3 = -5
        #10;
        
        // Test case 9: Carry out nhưng không overflow
        a = 64'hFFFF_FFFF_FFFF_FFFF; b = 64'h0000_0000_0000_0001; cin = 0; // 2^64-1 + 1 = 2^64 (cout=1, sum=0) hoặc -1 + 1 = 0 (không overflow)
        #10;
        
        // Test case 10: Maximum unsigned value
        a = 64'hFFFF_FFFF_FFFF_FFFF; b = 64'hFFFF_FFFF_FFFF_FFFF; cin = 0; // 2^64-1 + 2^64-1 = 2^65-2 (cout=1, sum=FFFE)
        #10;
        
        $finish;
    end
    
    // Display results with hex và decimal format
    initial begin
        $monitor("Time=%0t | a=%h(%0d/%0d) b=%h(%0d/%0d) cin=%b | sum=%h(%0d/%0d) cout=%b overflow=%b", 
                 $time, a, a, a_signed, b, b, b_signed, cin, sum, sum, sum_signed, cout, overflow);
        $dumpfile("full_adder_64bit_tb.vcd");
        $dumpvars(0, full_adder_64bit_tb);
    end
endmodule
