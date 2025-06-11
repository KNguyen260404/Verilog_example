module full_adder_tb;
    // Testbench signals
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;
    
    // Instantiate the module under test
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    // Test stimulus
    initial begin
        // Test all possible input combinations
        
        // Test case 1: a=0, b=0, cin=0
        a = 0; b = 0; cin = 0;
        #10;
        $display("Test case 1: a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
        
        // Test case 2: a=0, b=0, cin=1
        a = 0; b = 0; cin = 1;
        #10;
        $display("Test case 2: a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
        
        // Test case 3: a=0, b=1, cin=0
        a = 0; b = 1; cin = 0;
        #10;
        $display("Test case 3: a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
        
        // Test case 4: a=0, b=1, cin=1
        a = 0; b = 1; cin = 1;
        #10;
        $display("Test case 4: a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
        
        // Test case 5: a=1, b=0, cin=0
        a = 1; b = 0; cin = 0;
        #10;
        $display("Test case 5: a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
        
        // Test case 6: a=1, b=0, cin=1
        a = 1; b = 0; cin = 1;
        #10;
        $display("Test case 6: a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
        
        // Test case 7: a=1, b=1, cin=0
        a = 1; b = 1; cin = 0;
        #10;
        $display("Test case 7: a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
        
        // Test case 8: a=1, b=1, cin=1
        a = 1; b = 1; cin = 1;
        #10;
        $display("Test case 8: a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
        
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);
    end
    
endmodule
