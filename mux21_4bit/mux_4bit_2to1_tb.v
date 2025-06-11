module mux_4bit_2to1_tb;
    // Testbench signals
    reg [3:0] a;
    reg [3:0] b;
    reg sel;
    wire [3:0] y;
    
    // Instantiate the module under test
    mux_4bit_2to1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );
    
    // Test stimulus
    initial begin
        // Initialize inputs
        a = 4'b0000; b = 4'b1111; sel = 0;
        #10; // Wait 10 time units
        
        // Test case 1: sel = 0, should select a
        $display("Test case 1: a = %b, b = %b, sel = %b, y = %b", a, b, sel, y);
        
        // Test case 2: sel = 1, should select b
        sel = 1;
        #10;
        $display("Test case 2: a = %b, b = %b, sel = %b, y = %b", a, b, sel, y);
        
        // Test case 3: Change values of a and b
        a = 4'b1010; b = 4'b0101; sel = 0;
        #10;
        $display("Test case 3: a = %b, b = %b, sel = %b, y = %b", a, b, sel, y);
        
        // Test case 4: sel = 1 with new values
        sel = 1;
        #10;
        $display("Test case 4: a = %b, b = %b, sel = %b, y = %b", a, b, sel, y);
        
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("mux_4bit_2to1_tb.vcd");
        $dumpvars(0, mux_4bit_2to1_tb);
    end
    
endmodule 