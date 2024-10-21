module full_adder (input logic A, B, C_in,
						 output logic S, C_out	);
						 
		assign S = A^B^C_in;
		assign C_out = (A&B) | (B&C_in) | (A&C_in);
		
endmodule

module ripple_adder
(
	input  [8:0] A, B,
	input         cin,
	output [8:0] S,
	output        cout
);

	  logic c1, c2, c3, c4, c5, c6, c7, c8;
	  
	  full_adder adder0 (.A(A[0]), .B(B[0]), .C_in(cin), .S(S[0]), .C_out(c1));
	  full_adder adder1 (.A(A[1]), .B(B[1]), .C_in(c1), .S(S[1]), .C_out(c2));
	  full_adder adder2 (.A(A[2]), .B(B[2]), .C_in(c2), .S(S[2]), .C_out(c3));
	  full_adder adder3 (.A(A[3]), .B(B[3]), .C_in(c3), .S(S[3]), .C_out(c4));
	  full_adder adder4 (.A(A[4]), .B(B[4]), .C_in(c4), .S(S[4]), .C_out(c5));
	  full_adder adder5 (.A(A[5]), .B(B[5]), .C_in(c5), .S(S[5]), .C_out(c6));
	  full_adder adder6 (.A(A[6]), .B(B[6]), .C_in(c6), .S(S[6]), .C_out(c7));
	  full_adder adder7 (.A(A[7]), .B(B[7]), .C_in(c7), .S(S[7]), .C_out(c8));
	  full_adder adder8 (.A(A[8]), .B(B[8]), .C_in(c8), .S(S[8]), .C_out(cout));
     
endmodule
