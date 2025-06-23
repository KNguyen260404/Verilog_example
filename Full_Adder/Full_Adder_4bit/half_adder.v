module half_adder(
    input a,
    input b,
    output sum,
    output carry
);
    
    // Logic for sum (XOR operation)
    assign sum = a ^ b;
    
    // Logic for carry (AND operation)
    assign carry = a & b;
    
endmodule 