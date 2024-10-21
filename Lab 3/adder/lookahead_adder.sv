module four_bit_adder (
	input [3:0] A, B,
	input         cin,
	output [3:0] S, 
	output P, G, cout
						);
	
	logic p0, p1, p2, p3, g0 , g1, g2, g3;
	assign p0 = A[0] ^ B[0];
	assign p1 = A[1] ^ B[1];
	assign p2 = A[2] ^ B[2];
	assign p3 = A[3] ^ B[3];
	assign g0 = A[0] & B[0];
	assign g1 = A[1] & B[1];
	assign g2 = A[2] & B[2];
	assign g3 = A[3] & B[3];

	logic c1, c2, c3;
	assign c1 = cin & p0 | g0;
	assign c2 = cin & p0 & p1 | g0 & p1 | g1;
	assign c3 = cin & p0 & p1 & p2 | g0 & p1 & p2 | g1 & p2 | g2;
	assign P = p0 & p1 & p2 & p3;
	assign G = g3 | g2 & p3 | g1 & p3 & p2 | g0 & p3 & p2 & p1;
	
	full_adder adder0 (.A(A[0]), .B(B[0]), .C_in(cin), .S(S[0]), .C_out());
	full_adder adder1 (.A(A[1]), .B(B[1]), .C_in(c1), .S(S[1]), .C_out());
	full_adder adder2 (.A(A[2]), .B(B[2]), .C_in(c2), .S(S[2]), .C_out());
	full_adder adder3 (.A(A[3]), .B(B[3]), .C_in(c3), .S(S[3]), .C_out(cout));
			
endmodule

module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	logic p0, p1, p2, p3, g0, g1, g2, g3, c0, c1, c2, o0, o1, o2;
	four_bit_adder adder0 (.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .P(p0), .G(g0), .cout(o0));
	assign c0 = g0 | o0 & p0;
	four_bit_adder adder1 (.A(A[7:4]), .B(B[7:4]), .cin(c0), .S(S[7:4]), .P(p1), .G(g1), .cout(o1));
	assign c1 = g1 | g0 & p1 | o1 & p0 & p1;
	four_bit_adder adder2 (.A(A[11:8]), .B(B[11:8]), .cin(c1), .S(S[11:8]), .P(p2), .G(g2), .cout(o2));
	assign c2 = g2 | g1 & p2 | g0 & p2 & p1 | o2 & p2 & p1 & p0;
	four_bit_adder adder3 (.A(A[15:12]), .B(B[15:12]), .cin(c2), .S(S[15:12]), .P(p3), .G(g3), .cout(cout));
	  
endmodule
