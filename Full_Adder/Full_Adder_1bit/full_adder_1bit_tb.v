module full_adder_1bit_tb;
    // Inputs
    reg a;
    reg b;
    reg cin;
    
    // Outputs
    wire sum;
    wire cout;
    
    // Instantiate the Unit Under Test (UUT)
    full_adder_1bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        // Initialize inputs
        a = 0; b = 0; cin = 0;
        #10;
        
        a = 0; b = 0; cin = 1;
        #10;
        
        a = 0; b = 1; cin = 0;
        #10;
        
        a = 0; b = 1; cin = 1;
        #10;
        
        a = 1; b = 0; cin = 0;
        #10;
        
        a = 1; b = 0; cin = 1;
        #10;
        
        a = 1; b = 1; cin = 0;
        #10;
        
        a = 1; b = 1; cin = 1;
        #10;
        
        $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b", $time, a, b, cin, sum, cout);
        $dumpfile("full_adder_1bit_tb.vcd");
        $dumpvars(0, full_adder_1bit_tb);
    end
endmodule 