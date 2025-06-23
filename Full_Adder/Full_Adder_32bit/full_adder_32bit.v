module full_adder_32bit(
	input [31:0] a,
	input [31:0] b,
	input cin,
	output [31:0] sum,
	output cout,
	output overflow
);
	wire [32:0] carry;
	assign carry[0] = cin;
	assign cout = carry[32];

	genvar i;
	generate
		for(i = 0 ; i < 32 ; i = i + 1) begin : full_adder_loop
			full_adder_1bit fa(
				.a(a[i]),
				.b(b[i]),
				.cin(carry[i]),
				.sum(sum[i]),
				.cout(carry[i+1])
			);
		end
	endgenerate
	
	assign overflow = (a[31] == b[31]) && (a[31] != sum[31]);
endmodule