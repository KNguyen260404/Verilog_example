module priority_encoder_83_tb;
    // Testbench signals
    reg [7:0] in;
    wire [2:0] out;
    wire valid;
    
    // Instantiate the module under test
    priority_encoder_83 dut (
        .in(in),
        .out(out),
        .valid(valid)
    );
    
    // Test stimulus
    initial begin
        // Test case 1: No input active
        in = 8'b00000000;
        #10;
        $display("Test case 1: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 2: Only in[0] active
        in = 8'b00000001;
        #10;
        $display("Test case 2: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 3: Only in[1] active
        in = 8'b00000010;
        #10;
        $display("Test case 3: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 4: Only in[2] active
        in = 8'b00000100;
        #10;
        $display("Test case 4: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 5: Only in[3] active
        in = 8'b00001000;
        #10;
        $display("Test case 5: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 6: Only in[4] active
        in = 8'b00010000;
        #10;
        $display("Test case 6: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 7: Only in[5] active
        in = 8'b00100000;
        #10;
        $display("Test case 7: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 8: Only in[6] active
        in = 8'b01000000;
        #10;
        $display("Test case 8: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 9: Only in[7] active
        in = 8'b10000000;
        #10;
        $display("Test case 9: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 10: Multiple bits active, in[7] has highest priority
        in = 8'b10101010;
        #10;
        $display("Test case 10: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 11: Multiple bits active, in[6] has highest priority
        in = 8'b01010101;
        #10;
        $display("Test case 11: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 12: Multiple bits active, in[5] has highest priority
        in = 8'b00111100;
        #10;
        $display("Test case 12: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 13: Multiple bits active, in[3] has highest priority
        in = 8'b00001111;
        #10;
        $display("Test case 13: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 14: All inputs active, in[7] has highest priority
        in = 8'b11111111;
        #10;
        $display("Test case 14: in = %b, out = %b, valid = %b", in, out, valid);
        
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("priority_encoder_83_tb.vcd");
        $dumpvars(0, priority_encoder_83_tb);
    end
    
endmodule
