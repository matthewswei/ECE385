module four_bit_adder_select (
	input [3:0] A, B,
	input         cin,
	output [3:0] S, 
	output cout
						);
						
	logic c1, c2, c3;
	
	full_adder adder0 (.A(A[0]), .B(B[0]), .C_in(cin), .S(S[0]), .C_out(c1));
	full_adder adder1 (.A(A[1]), .B(B[1]), .C_in(c1), .S(S[1]), .C_out(c2));
	full_adder adder2 (.A(A[2]), .B(B[2]), .C_in(c2), .S(S[2]), .C_out(c3));
	full_adder adder3 (.A(A[3]), .B(B[3]), .C_in(c3), .S(S[3]), .C_out(cout));
			
endmodule

module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic c0, c11, c12, c1, c21, c22, c2, c31, c32, c4, s11, s12, s21, s22, s31, s32;
	  logic [15:0] S0, S1, S2, S3, S4, S5, S6, S7, S8;
	  
	  four_bit_adder_select adder0 (.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .cout(c0));
	  four_bit_adder_select adder11 (.A(A[7:4]), .B(B[7:4]), .cin(0), .S(S0[7:4]), .cout(c11));
	  four_bit_adder_select adder12 (.A(A[7:4]), .B(B[7:4]), .cin(1), .S(S1[7:4]), .cout(c12));
	  mux2_1_17 mux1 (.S(c0), .A_In(S0), .B_In(S1), .Q_Out(S2));
	  assign S[7:4] = S2[7:4];
	  assign c1 = (c0 & c12) | c11;
	  four_bit_adder_select adder21 (.A(A[11:8]), .B(B[11:8]), .cin(0), .S(S3[11:8]), .cout(c21));
	  four_bit_adder_select adder22 (.A(A[11:8]), .B(B[11:8]), .cin(1), .S(S4[11:8]), .cout(c22));
	  mux2_1_17 mux2 (.S(c1), .A_In(S3), .B_In(S4), .Q_Out(S5));
	  assign S[11:8] = S5[11:8];
	  assign c2 = (c1 & c22) | c21;
	  four_bit_adder_select adder31 (.A(A[15:12]), .B(B[15:12]), .cin(0), .S(S6[15:12]), .cout(c31));
	  four_bit_adder_select adder32 (.A(A[15:12]), .B(B[15:12]), .cin(1), .S(S7[15:12]), .cout(c32));
	  mux2_1_17 mux3 (.S(c2), .A_In(S6), .B_In(S7), .Q_Out(S8));
	  assign S[15:12] = S8[15:12];
	  assign cout = (c2 & c32) | c31;
	  

endmodule
