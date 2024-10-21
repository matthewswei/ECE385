module full_adder (input logic A, B, C_in,
						 output logic S, C_out	);
						 
		assign S = A^B^C_in;
		assign C_out = (A&B) | (B&C_in) | (A&C_in);
		
endmodule
