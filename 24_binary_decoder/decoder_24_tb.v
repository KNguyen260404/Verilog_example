module decoder_24_tb;
    // Testbench signals
    reg [1:0] a;
    reg en;
    wire [3:0] out;
    
    // Instantiate the decoder module
    decoder_24 dut (
        .a(a),
        .en(en),
        .out(out)
    );
    
    // Test stimulus
    initial begin
        // Initialize inputs
        a = 2'b00; en = 0;
        #10; // Wait 10 time units
        
        // Test case 1: Enable = 0, all outputs should be 0
        $display("Test case 1: a = %b, en = %b, out = %b", a, en, out);
        
        // Test case 2: Enable = 1, a = 00
        en = 1; a = 2'b00;
        #10;
        $display("Test case 2: a = %b, en = %b, out = %b", a, en, out);
        
        // Test case 3: Enable = 1, a = 01
        a = 2'b01;
        #10;
        $display("Test case 3: a = %b, en = %b, out = %b", a, en, out);
        
        // Test case 4: Enable = 1, a = 10
        a = 2'b10;
        #10;
        $display("Test case 4: a = %b, en = %b, out = %b", a, en, out);
        
        // Test case 5: Enable = 1, a = 11
        a = 2'b11;
        #10;
        $display("Test case 5: a = %b, en = %b, out = %b", a, en, out);
        
        // Test case 6: Back to Enable = 0
        en = 0;
        #10;
        $display("Test case 6: a = %b, en = %b, out = %b", a, en, out);
        
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("decoder_24_tb.vcd");
        $dumpvars(0, decoder_24_tb);
    end
    
endmodule
