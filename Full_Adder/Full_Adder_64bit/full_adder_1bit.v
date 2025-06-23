module full_adder_1bit(
	input a,
	input b,
	input cin,
	output sum,
	output cout
);
	wire sum1;
	wire carry1;
	wire carry2;
	
	half_adder ha1(
               .a(a),
		       .b(b),
		       .sum(sum1),
		       .carry(carry1)
	);
	
	half_adder ha2(
               .a(sum1),
		       .b(cin),
		       .sum(sum),
		       .carry(carry2) 		
	);

	assign cout = carry1 | carry2;
endmodule