module svetla
(
	input [11:0] vrednost,
	input clk,
	output reg [9:0] led
);
	
	reg proslaNajv[3:0];
	reg [11:0] tmp;
	reg [32:0] brojac;
	reg [11:0] padajuca;
	reg [11:0] ispis;
	
	wire [11:0] niz [9:0];
	assign niz[0] = 12'd90;
	assign niz[1] = 12'd95;
	assign niz[2] = 12'd105;
	assign niz[3] = 12'd120;
	assign niz[4] = 12'd145;
	assign niz[5] = 12'd185;
	assign niz[6] = 12'd250;
	assign niz[7] = 12'd355;
	assign niz[8] = 12'd525;
	assign niz[9] = 12'd650;
	

	always @(posedge clk) begin
		brojac = brojac + 1;
		ispis = vrednost - 12'd1900;
		
		if(brojac >= 7000000) begin
			if(padajuca != 0) begin
				padajuca = padajuca - 1;
			end
			brojac = 0;
		end
		if(!ispis[11]) begin
			for(tmp = 0; tmp < 10; tmp = tmp + 1) begin
				
				if(niz[tmp] <= ispis) begin
					led[tmp] = 1;
					if(tmp >= padajuca) begin
						padajuca = tmp;
						brojac = 0;
					end
				end
				else begin 
					if(tmp != padajuca) begin
						led[tmp] = 0;
					end
					else begin
						led[tmp] = 1;
					end
				end

			end
		end
	end
endmodule	