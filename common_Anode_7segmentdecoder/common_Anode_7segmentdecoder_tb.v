module common_Anode_7segmentdecoder_tb;
    // Testbench signals
    reg [3:0] bcd;
    wire [6:0] seg;
    
    // Instantiate the module under test
    common_Anode_7segmentdecoder dut (
        .bcd(bcd),
        .seg(seg)
    );
    
    // Helper function to display segment pattern
    function display_segment;
        input [6:0] seg;
        begin
            $display(" %c ", seg[0] ? " " : "_");
            $display("%c%c%c", seg[5] ? " " : "|", seg[6] ? " " : "_", seg[1] ? " " : "|");
            $display("%c%c%c", seg[4] ? " " : "|", seg[3] ? " " : "_", seg[2] ? " " : "|");
            $display("");
        end
    endfunction
    
    // Test stimulus
    initial begin
        // Test all 16 possible input combinations (0-F)
        for (bcd = 0; bcd < 16; bcd = bcd + 1) begin
            #10;
            $display("BCD input: %h, Segment output: %b", bcd, seg);
            // Uncomment the following line if you want to see the segment pattern
            // display_segment(seg);
        end
        
        // Test specific cases with visual display
        $display("\nTesting specific cases with visual display:");
        
        // Display for 0
        bcd = 4'h0;
        #10;
        $display("\nBCD input: %h (0)", bcd);
        display_segment(seg);
        
        // Display for 1
        bcd = 4'h1;
        #10;
        $display("\nBCD input: %h (1)", bcd);
        display_segment(seg);
        
        // Display for 8
        bcd = 4'h8;
        #10;
        $display("\nBCD input: %h (8)", bcd);
        display_segment(seg);
        
        // Display for A
        bcd = 4'hA;
        #10;
        $display("\nBCD input: %h (A)", bcd);
        display_segment(seg);
        
        // Display for F
        bcd = 4'hF;
        #10;
        $display("\nBCD input: %h (F)", bcd);
        display_segment(seg);
        
        $finish;
    end
    
    // Optional: Generate VCD file for waveform viewing
    initial begin
        $dumpfile("common_Anode_7segmentdecoder_tb.vcd");
        $dumpvars(0, common_Anode_7segmentdecoder_tb);
    end
    
endmodule
