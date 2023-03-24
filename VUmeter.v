module VUmeter
(
	input  CLOCK_50,
	input [3:0] KEY,
	
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
	wire [11:0] vrednost;
	reg div;
	
	always@(posedge CLOCK_50)begin
		div = !div;
	end
	
	faza f(div, ADC_DOUT, ADC_CONVST, ADC_SCLK, ADC_DIN, vrednost);
	svetla s(vrednost, CLOCK_50, LED);
	seven_segment_interface(vrednost, vrednost, 1'b0, {HEX5, HEX4, HEX3, HEX2, HEX1, HEX0});
	
	//always @(posedge CLOCK_50) begin
		
	//end
endmodule