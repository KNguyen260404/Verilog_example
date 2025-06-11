module mux_4bit_4to1_tb;
    // Testbench signals
    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    reg [1:0] sel;
    wire [3:0] y;
    
    // Instantiate the module under test
    mux_4bit_4to1 dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .y(y)
    );
    
    // Test stimulus
    initial begin
        // Initialize inputs with distinct patterns for easy identification
        a = 4'b0001; // 1
        b = 4'b0010; // 2
        c = 4'b0100; // 4
        d = 4'b1000; // 8
        sel = 2'b00;
        #10; // Wait 10 time units
        
        // Test case 1: sel = 00, should select a
        $display("Test case 1: a = %b, b = %b, c = %b, d = %b, sel = %b, y = %b", a, b, c, d, sel, y);
        
        // Test case 2: sel = 01, should select b
        sel = 2'b01;
        #10;
        $display("Test case 2: a = %b, b = %b, c = %b, d = %b, sel = %b, y = %b", a, b, c, d, sel, y);
        
        // Test case 3: sel = 10, should select c
        sel = 2'b10;
        #10;
        $display("Test case 3: a = %b, b = %b, c = %b, d = %b, sel = %b, y = %b", a, b, c, d, sel, y);
        
        // Test case 4: sel = 11, should select d
        sel = 2'b11;
        #10;
        $display("Test case 4: a = %b, b = %b, c = %b, d = %b, sel = %b, y = %b", a, b, c, d, sel, y);
        
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("mux_4bit_4to1_tb.vcd");
        $dumpvars(0, mux_4bit_4to1_tb);
    end
    
endmodule
