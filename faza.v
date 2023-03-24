module faza
(
	input clk,
	input inBit,
	
	output reg con,
	output reg sck,
	output reg outBit,
	
	output reg [11:0] num
	
);
	reg [6:0] brojac;
	reg [1:0] state;
	reg [11:0] tmp;
	
	wire [5:0] poruka;
	assign poruka = 6'b010001;
	
	always @(posedge clk) begin
		if(brojac < 104) begin
			state = 1;
		end
		if(brojac < 90) begin
			state = 3;
		end
		if(brojac < 78) begin
			state = 2;
		end
		if(brojac < 66) begin
			state = 1;
		end
		if(brojac < 1) begin
			state = 0;
		end
		if(brojac >= 104) begin
			state = 0;
			brojac = 0;
		end
		
		if(state == 0) begin
			con = 1;
			num = tmp;
			tmp = 0;
		end
		
		if(state == 1) begin
			con = 0;
			outBit = poruka[0];
		end
		
		if(state == 2) begin
			if(brojac & 1) begin
				outBit = poruka[(brojac - 65) / 2];
			end
		end
		
		if(state == 3 || state == 2) begin
			sck = ~sck;
			if(!(brojac & 1)) begin
				tmp = tmp << 1;
				tmp = tmp + inBit;
			end
		end

		
		brojac = brojac + 1;
		if(brojac >= 104) begin
			state = 0;
			brojac = 0;
		end
	end
endmodule