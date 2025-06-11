module priority_encoder_42_tb;
    // Testbench signals
    reg [3:0] in;
    wire [1:0] out;
    wire valid;
    
    // Instantiate the module under test
    priority_encoder_42 dut (
        .in(in),
        .out(out),
        .valid(valid)
    );
    
    // Test stimulus
    initial begin
        // Test case 1: No input active
        in = 4'b0000;
        #10;
        $display("Test case 1: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 2: Only in[0] active
        in = 4'b0001;
        #10;
        $display("Test case 2: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 3: Only in[1] active
        in = 4'b0010;
        #10;
        $display("Test case 3: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 4: Both in[0] and in[1] active, in[1] has higher priority
        in = 4'b0011;
        #10;
        $display("Test case 4: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 5: Only in[2] active
        in = 4'b0100;
        #10;
        $display("Test case 5: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 6: in[2] and in[0] active, in[2] has higher priority
        in = 4'b0101;
        #10;
        $display("Test case 6: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 7: in[2] and in[1] active, in[2] has higher priority
        in = 4'b0110;
        #10;
        $display("Test case 7: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 8: in[2], in[1], and in[0] active, in[2] has highest priority
        in = 4'b0111;
        #10;
        $display("Test case 8: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 9: Only in[3] active
        in = 4'b1000;
        #10;
        $display("Test case 9: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 10: in[3] and in[0] active, in[3] has higher priority
        in = 4'b1001;
        #10;
        $display("Test case 10: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 11: in[3] and in[1] active, in[3] has higher priority
        in = 4'b1010;
        #10;
        $display("Test case 11: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 12: in[3], in[1], and in[0] active, in[3] has highest priority
        in = 4'b1011;
        #10;
        $display("Test case 12: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 13: in[3] and in[2] active, in[3] has higher priority
        in = 4'b1100;
        #10;
        $display("Test case 13: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 14: in[3], in[2], and in[0] active, in[3] has highest priority
        in = 4'b1101;
        #10;
        $display("Test case 14: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 15: in[3], in[2], and in[1] active, in[3] has highest priority
        in = 4'b1110;
        #10;
        $display("Test case 15: in = %b, out = %b, valid = %b", in, out, valid);
        
        // Test case 16: All inputs active, in[3] has highest priority
        in = 4'b1111;
        #10;
        $display("Test case 16: in = %b, out = %b, valid = %b", in, out, valid);
        
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("priority_encoder_42_tb.vcd");
        $dumpvars(0, priority_encoder_42_tb);
    end
    
endmodule
