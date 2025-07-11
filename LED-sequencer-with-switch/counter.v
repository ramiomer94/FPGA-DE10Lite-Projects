module counter(cin,sw,outcount);

input cin, sw;
output reg[3:0] outcount;


reg [31:0] tick = 32'd0;
reg [31:0] value = 32'd25000000;
parameter D = 32'd50000000;
parameter F = 4'd4;
parameter max = 4'd8;

		
always @(posedge cin)
begin
	
	if(sw == 1)
	begin
		
		tick <= tick + 32'd1;
		if(tick >= D-1)
		begin
			tick <= 32'd0;
			outcount <= outcount + 4'd1;
			if(outcount >= max)
				outcount <= 4'd0;
		end	
				
	end

	else
	begin
	
		tick <= tick + 32'd1;
		if(tick >= D-1 && outcount <= F)
		begin
			tick <= 32'd0;
			outcount <= outcount + 4'd1;
		end	
			
		if(outcount == F+1)
		begin
			tick <= tick + 32'd1;
			if(tick >= 32'd25000000 )
				begin
						tick <= 32'd0;
						outcount <= outcount + 4'd1;
				end
		end
						
		if(outcount == F+2)
		begin
			tick <= tick + 32'd1;
			if(tick >= 32'd12500000 )
				begin
						tick <= 32'd0;
						outcount <= outcount + 4'd1;
				end
		end
		
		if(outcount == F+3)
		begin
			tick <= tick + 32'd1;
			if(tick >= 32'd6250000)
				begin
						tick <= 32'd0;
						outcount <= outcount + 4'd1;
				end
		end
		
		if(outcount == F+4)
		begin
			tick <= tick + 32'd1;
			if(tick >= 32'd3125000)
				begin
						tick <= 32'd0;
						outcount <= outcount + 4'd1;
				end
		end
		
		if (outcount >= max+1)
				 outcount <= 4'd0;
	end
end	

endmodule