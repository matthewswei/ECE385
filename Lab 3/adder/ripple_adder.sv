module ripple_adder
(
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  logic c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15;
	  
	  full_adder adder0 (.A(A[0]), .B(B[0]), .C_in(cin), .S(S[0]), .C_out(c1));
	  full_adder adder1 (.A(A[1]), .B(B[1]), .C_in(c1), .S(S[1]), .C_out(c2));
	  full_adder adder2 (.A(A[2]), .B(B[2]), .C_in(c2), .S(S[2]), .C_out(c3));
	  full_adder adder3 (.A(A[3]), .B(B[3]), .C_in(c3), .S(S[3]), .C_out(c4));
	  full_adder adder4 (.A(A[4]), .B(B[4]), .C_in(c4), .S(S[4]), .C_out(c5));
	  full_adder adder5 (.A(A[5]), .B(B[5]), .C_in(c5), .S(S[5]), .C_out(c6));
	  full_adder adder6 (.A(A[6]), .B(B[6]), .C_in(c6), .S(S[6]), .C_out(c7));
	  full_adder adder7 (.A(A[7]), .B(B[7]), .C_in(c7), .S(S[7]), .C_out(c8));
	  full_adder adder8 (.A(A[8]), .B(B[8]), .C_in(c8), .S(S[8]), .C_out(c9));
	  full_adder adder9 (.A(A[9]), .B(B[9]), .C_in(c9), .S(S[9]), .C_out(c10));
	  full_adder adder10 (.A(A[10]), .B(B[10]), .C_in(c10), .S(S[10]), .C_out(c11));
	  full_adder adder11 (.A(A[11]), .B(B[11]), .C_in(c11), .S(S[11]), .C_out(c12));
	  full_adder adder12 (.A(A[12]), .B(B[12]), .C_in(c12), .S(S[12]), .C_out(c13));
	  full_adder adder13 (.A(A[13]), .B(B[13]), .C_in(c13), .S(S[13]), .C_out(c14));
	  full_adder adder14 (.A(A[14]), .B(B[14]), .C_in(c14), .S(S[14]), .C_out(c15));
	  full_adder adder15 (.A(A[15]), .B(B[15]), .C_in(c15), .S(S[15]), .C_out(cout));

     
endmodule
