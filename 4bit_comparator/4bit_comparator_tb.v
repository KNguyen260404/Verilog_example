module bit4_comparator_tb;
    // Testbench signals
    reg [3:0] a;
    reg [3:0] b;
    wire equal;
    wire greater;
    wire less;
    
    // Instantiate the module under test
    bit4_comparator dut (
        .a(a),
        .b(b),
        .equal(equal),
        .greater(greater),
        .less(less)
    );
    
    // Test stimulus
    initial begin
        // Test case 1: a = b
        a = 4'b0000; b = 4'b0000;
        #10;
        $display("Test case 1: a = %b, b = %b, equal = %b, greater = %b, less = %b", a, b, equal, greater, less);
        
        // Test case 2: a = b (different value)
        a = 4'b1010; b = 4'b1010;
        #10;
        $display("Test case 2: a = %b, b = %b, equal = %b, greater = %b, less = %b", a, b, equal, greater, less);
        
        // Test case 3: a > b (small difference)
        a = 4'b0101; b = 4'b0100;
        #10;
        $display("Test case 3: a = %b, b = %b, equal = %b, greater = %b, less = %b", a, b, equal, greater, less);
        
        // Test case 4: a > b (large difference)
        a = 4'b1111; b = 4'b0000;
        #10;
        $display("Test case 4: a = %b, b = %b, equal = %b, greater = %b, less = %b", a, b, equal, greater, less);
        
        // Test case 5: a < b (small difference)
        a = 4'b0110; b = 4'b0111;
        #10;
        $display("Test case 5: a = %b, b = %b, equal = %b, greater = %b, less = %b", a, b, equal, greater, less);
        
        // Test case 6: a < b (large difference)
        a = 4'b0001; b = 4'b1111;
        #10;
        $display("Test case 6: a = %b, b = %b, equal = %b, greater = %b, less = %b", a, b, equal, greater, less);
        
        // Test case 7: a > b (MSB difference)
        a = 4'b1000; b = 4'b0111;
        #10;
        $display("Test case 7: a = %b, b = %b, equal = %b, greater = %b, less = %b", a, b, equal, greater, less);
        
        // Test case 8: a < b (MSB difference)
        a = 4'b0111; b = 4'b1000;
        #10;
        $display("Test case 8: a = %b, b = %b, equal = %b, greater = %b, less = %b", a, b, equal, greater, less);
        
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("bit4_comparator_tb.vcd");
        $dumpvars(0, bit4_comparator_tb);
    end
    
endmodule
