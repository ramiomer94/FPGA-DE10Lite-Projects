module ShotClockTop(clk, rst, pause, mode_select, f1, f2);

input clk, rst, pause, mode_select;
output [6:0] f1, f2;
wire cout;
wire [4:0] counter;


ClockDivider_Counter mine(clk, rst, pause, mode_select, counter, cout);
SevenSegmentDisplayController scc(counter, f1, f2);

endmodule
