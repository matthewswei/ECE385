module ram_32x8 (input [7:0] d, input [4:0] write_address, read_address,
	input we, clk,
	output logic [7:0] q
	);

	logic [7:0] mem [32];

	always_ff @ (posedge clk) 
	begin
		if (we)
		begin
			mem[write_address] <= d;
			q <= mem[read_address];
		end
	end
	
endmodule
