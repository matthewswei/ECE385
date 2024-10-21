module testbench();

timeunit 10ns;

timeprecision 1ns;

logic Clk = 0;
logic Reset_Load_Clear, Run, Xval;
logic [6:0]  HEX0, HEX1, HEX2, HEX3;
logic [7:0]  SW, Aval, Bval;

Multiplier multiplier0(.*);	

always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
	Clk = 0;
end

initial begin: TEST_VECTORS
Reset_Load_Clear = 0;
Run = 1;
SW = 8'h3b;

#2 Reset_Load_Clear = 1;

#2 SW = 8'h07;	
#22 Run = 1;	

#2 Run = 0;

end

endmodule
