module half_adder (
    input a,
    input b,
    output sum,
    output carry
);
    
    // Half adder logic
    // sum = a XOR b
    // carry = a AND b
    assign sum = a ^ b;
    assign carry = a & b;
    
endmodule
