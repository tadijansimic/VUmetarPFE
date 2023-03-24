module readSerial 
(
	input inBit,
	input clk,
	input start,
	output reg [11:0] num,
	output reg outBit
);
	reg [4:0] counter;
	reg [11:0] tmp;
	reg moze;
	always @(posedge clk) begin
		if(moze) begin
			tmp = tmp << 1;
			tmp = tmp + inBit;
			counter = counter + 1;
			if(counter == 5'd12) begin 
				num = tmp;
				counter = 0;
				tmp = 0;
				moze = 0;
			end
		end
	end
	always @(negedge clk) begin
		if(start) begin
			moze = 1;
		end
		if(moze) begin	
			case(counter)
				0: outBit = 1; 
				1: outBit = 0;
				2: outBit = 0;
				3: outBit = 0;
				4: outBit = 0;
				5: outBit = 0;
			endcase
		end
		else begin
			outBit = 0;
		end
	end
endmodule