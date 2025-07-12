//Controls the output of HEX1 digital screen
module SevenSegmentNegativeSign(s,c,f);

input s,c;
output [6:0] f;

//LED 0 always OFF
assign f[0] = 1;

//turn LEDs 1 and 2 ON to output 1
assign f[1] = (s | ~c);
assign f[2] = (s | ~c);

//LEDs 3 thtough 5 are always off
assign f[3] = 1;
assign f[4] = 1;
assign f[5] = 1;

//LED 6 is only ON when a1 in a0-a1 is less bigger than a0. LED 6 output the minus sign.
assign f[6] = (~s | c);

endmodule 