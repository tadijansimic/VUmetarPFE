module VUmeter
(
	input  CLOCK_50,
	
	output ADC_SCLK,
	output ADC_DIN,
	input  ADC_DOUT,
	output ADC_CONVST,

	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [9:0] LED
);

endmodule