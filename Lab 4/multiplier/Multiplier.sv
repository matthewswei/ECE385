module Multiplier (input logic  Clk, Reset_Load_Clear, Run,
                  input  logic [7:0]  SW,
						output logic [7:0] Aval, Bval,
						output logic Xval,
                  output logic [6:0]  HEX0, HEX1, HEX2, HEX3);
											
			logic [7:0] A, B, S, A_in, SW_S;
			logic [8:0] Asum;
			logic Shift_En, Clr_Ld, Clr_XA, Add, Sub, Reset_Load_Clear_SH, Run_SH;
			logic S_neg, A_out, B_out, A_load, X, X_in, X_out;
			
			assign A_load = Add | Sub | Clr_Ld | Clr_XA;
			
			always_comb 
			begin
		   if (Sub) 
				begin
				S = ~SW_S;
				S_neg = 1'b1;    // Can't use + so set cin to 1 in adder
				end
		   else if (Add)
				begin
				S = SW_S;
				S_neg = 1'b0;
				end
			else
				begin
				S = 8'b00000000;
				S_neg = 1'b0;
				end
			
		   if (Clr_Ld | Clr_XA) 
				begin
				A_in = 8'b00000000;
				X_in = 1'b0;
				end
		   else 
				begin
				A_in = Asum[7:0];
				X_in = Asum[8];
				end
		   end

		   reg_1  reg_X (.*, .Reset(1'b0), .D(X_in), .Shift_In(X_out), .Load(A_load),
						.Shift_Out(X_out), .Data_Out(X));
						
			reg_8  reg_A (.*, .Reset(1'b0), .D(A_in), .Shift_In(X_out), .Load(A_load),
								.Shift_Out(A_out), .Data_Out(A));
								
			reg_8  reg_B (.*, .Reset(1'b0), .D(SW_S), .Shift_In(A_out), .Load(Clr_Ld),
								.Shift_Out(B_out), .Data_Out(B));
								
			ripple_adder adder (.A({A[7], A}),.B({S[7], S}), .cin(S_neg), .S(Asum), .cout());
			
			control unit (.*, .ClearA_LoadB(Reset_Load_Clear_SH), .Execute(Run_SH), .M(B_out));
					 
			assign Aval = A;
			assign Bval = B;
			assign Xval = X;
					 
			HexDriver		Hex0 (
								.In0(Bval[3:0]),
								.Out0(HEX0) );
								
			HexDriver		Hex1 (
									.In0(Bval[7:4]),
									.Out0(HEX1) );
									
			HexDriver		Hex2 (
									.In0(Aval[3:0]),
									.Out0(HEX2) );
									
			HexDriver		Hex3 (
									.In0(Aval[7:4]),
									.Out0(HEX3) );
									
			sync button_sync[1:0] (Clk, {~Reset_Load_Clear, ~Run}, {Reset_Load_Clear_SH, Run_SH});
			sync Sin_sync[7:0] (Clk, SW, SW_S);

endmodule
