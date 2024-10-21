module control (input  logic Clk, ClearA_LoadB, Execute, M,
                output logic Shift_En, Clr_Ld, Clr_XA, Add, Sub );

    enum logic [4:0] {A, B, B1, C, C1, D, D1, E, E1, F, F1, G, G1, H, H1, I, I1, J, R}   curr_state, next_state; 

    always_ff @ (posedge Clk)  
    begin
        if (ClearA_LoadB)
            curr_state <= A;
        else 
            curr_state <= next_state;
    end

	 assign Clr_Ld = ClearA_LoadB;
	 
	always_comb
    begin
        
		  next_state  = curr_state;	
        unique case (curr_state) 

            A :    if (Execute)
                       next_state = R;
			   R :    next_state = B;
            B :    next_state = B1;
			  B1 :    next_state = C;
            C :    next_state = C1;
			  C1 :    next_state = D;
            D :    next_state = D1;
			  D1 :    next_state = E;
            E :    next_state = E1;
			  E1 :    next_state = F;
				F :    next_state = F1;
			  F1 :    next_state = G;
            G :    next_state = G1;
			  G1 :    next_state = H;
            H :    next_state = H1;
			  H1 :    next_state = I;
            I :    next_state = I1;
			  I1 :    next_state = J;
            J :    if (~Execute) 
                       next_state = A;
							  
        endcase
		  
        case (curr_state) 
	   	   A: 
	         begin
					 Clr_XA = 1'b0;
					 Add = 1'b0;
					 Sub = 1'b0;
                Shift_En = 1'b0;
		      end
				B1, C1, D1, E1, F1, G1, H1, I1:
				begin 
					 Add = 1'b0;
					 Clr_XA = 1'b0;
					 Sub = 1'b0;
                Shift_En = 1'b1;
		      end
				I:
				begin 
					if (M)
						Sub = 1'b1;
					 else
						Sub = 1'b0;
					 Add = 1'b0;
					 Clr_XA = 1'b0;
                Shift_En = 1'b0;
		      end
	   	   J: 
		      begin
					 Sub = 1'b0;
					 Add = 1'b0;
					 Clr_XA = 1'b0;
                Shift_En = 1'b0;
		      end
				R:
				begin
					 Sub = 1'b0;
					 Add = 1'b0;
					 Clr_XA = 1'b1;
                Shift_En = 1'b0;
				end
	   	   default:
		      begin 
					 if (M)
						Add = 1'b1;
					 else
						Add = 1'b0;
				    Clr_XA = 1'b0;
					 Sub = 1'b0;
                Shift_En = 1'b0;
		      end
        endcase
    end

endmodule
