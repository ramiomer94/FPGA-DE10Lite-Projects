module Tbirdlight(clk, sw0, sw1, f0, f1);

input clk, sw1, sw0;
output[5:0] f0;
output[6:0] f1;


wire[3:0] counter;


counter c1(clk, sw0, sw1, counter);
decoder d1(sw0, sw1, counter,f0, f1);

endmodule

