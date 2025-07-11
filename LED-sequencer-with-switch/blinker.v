module blinker(clk, sw, y);

input clk, sw;
output [7:0] y;

wire[3:0] outcount;



counter(clk,sw,outcount);
decoder(sw,outcount,y);
 
endmodule