module counter(cin,sw0,sw1,outcount);

input cin, sw0, sw1;
output reg[3:0] outcount;



reg [31:0] tick = 32'd0;
parameter D = 32'd25000000;
parameter max = 4'd12;


		
always @(posedge cin)
begin
	
	if(sw0 == 0 && sw1 == 0)
		outcount <= 4'd0;

	if (sw0 == 1 && sw1 == 0)
	begin
		tick <= tick + 32'd1;
		if(tick >= D-1)
		begin
			tick <= 32'd0;
			outcount <= outcount + 4'd1;
			if(outcount >= max)
				outcount <= 4'd12; 
				
			
		end	
				
	end
	
	if (sw0 == 0 && sw1 == 1)
	begin
		tick <= tick + 32'd1;
		if(tick >= D-1)
		begin
			tick <= 32'd0;
			outcount <= outcount + 4'd1;
			if(outcount >= max)
				outcount <= 4'd12; 
		end	
			
	end
	
	if (sw0 == 1 && sw1 == 1)
		outcount <= 4'd0;
		
end
	

endmodule