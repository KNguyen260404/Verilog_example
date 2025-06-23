module full_adder_4bit_tb;
    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    
    // Outputs
    wire [3:0] sum;
    wire cout;
    wire overflow;
    
    // Biến phụ để hiển thị số có dấu
    reg signed [3:0] a_signed;
    reg signed [3:0] b_signed;
    wire signed [3:0] sum_signed;
    
    // Instantiate the Unit Under Test (UUT)
    full_adder_4bit uut (
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
        a = 4'b0001; b = 4'b0001; cin = 0; // 1 + 1 = 2
        #10;
        
        // Test case 2: Addition with carry-in (không tràn số)
        a = 4'b0001; b = 4'b0001; cin = 1; // 1 + 1 + 1 = 3
        #10;
        
        // Test case 3: Larger numbers (không tràn số với unsigned, tràn số với signed)
        a = 4'b0011; b = 4'b0101; cin = 0; // 3 + 5 = 8 (unsigned) hoặc -8 (signed)
        #10;
        
        // Test case 4: Generate carry-out (tràn số dương)
        a = 4'b0111; b = 4'b0001; cin = 0; // 7 + 1 = 8 (unsigned) hoặc -8 (signed)
        #10;
        
        // Test case 5: Maximum unsigned value
        a = 4'b1111; b = 4'b1111; cin = 0; // 15 + 15 = 30 (cout=1, sum=1110)
        #10;
        
        // Test case 6: Maximum unsigned value with carry-in
        a = 4'b1111; b = 4'b1111; cin = 1; // 15 + 15 + 1 = 31 (cout=1, sum=1111)
        #10;
        
        // Test case 7: Negative numbers (tràn số âm)
        a = 4'b1000; b = 4'b1000; cin = 0; // -8 + -8 = -16 (vượt quá phạm vi biểu diễn)
        #10;
        
        // Test case 8: Positive + Negative (không tràn số)
        a = 4'b0111; b = 4'b1001; cin = 0; // 7 + -7 = 0
        #10;
        
        $finish;
    end
    
    // Display results
    initial begin
        $monitor("Time=%0t | a=%b(%0d/%0d) b=%b(%0d/%0d) cin=%b | sum=%b(%0d/%0d) cout=%b overflow=%b", 
                 $time, a, a, a_signed, b, b, b_signed, cin, sum, sum, sum_signed, cout, overflow);
        $dumpfile("full_adder_4bit_tb.vcd");
        $dumpvars(0, full_adder_4bit_tb);
    end
endmodule
