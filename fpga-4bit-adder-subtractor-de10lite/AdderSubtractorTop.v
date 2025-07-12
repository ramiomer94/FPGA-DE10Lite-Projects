//top-hierarchy module
module AdderSubtractorTop(a0, a1, s, f0, f1, f2, f3);

input s;
input [3:0] a0, a1; //arguments of the adder/subtractor [a0+a1 or a0-a1]
output [6:0] f0, f1, f2, f3; //outputs shown on the digital screens of the DE-10
wire [3:0] r, fr;
wire c, cout, inv;


/* 

This hardware instantiation does the following: takes the arguments a0 and a1, inverts all
4 bits of input a1 if s = 1, leaves them unchanged if s = 0, adds 1 to a0[0] and ~a1[0] if s =1,
does the same for all 3 remaining bits then stores the result in  r and the carry out of the last
adder in c. 

*/

FourBitRippleAdder l0(a0, a1, s, r, c);

/* 

if s = 1 and c = 1, then we can drop the carry out and we have our result.
if s = 1 and c = 0, then the result is in 2's complement and to change (i.e. converting
E in 2's complement to -2 (1's complement), we do the following two steps.

*/

//This statement makes sure that the following operation is only performed when s=1 and c=0.
assign inv = (s & ~c);

//converts the result from 2's complement to 1's complement when s=1 and c=0.

FourBitRippleAdder l1(0,r,inv,fr,cout);

/*The following 4 instantiations use the module I created in lab 2 to control the on/off status of
all 7 LEDs in each digital screen */

//displays a0 on HEX5
SevenSegmentDecoder h0(a0, f0);
//displays a1 on HEX3
SevenSegmentDecoder h1(a1, f1);
//displays the final result on HEX0
SevenSegmentDecoder h2(fr, f2);
//HEX1 reads 1 if carry out of a0+a1 > 15 , and displays nothing if a0+a1 < 15; 
//HEX1 reads 0 when we have a0-a1 for a0 > a1, displays (-) sign when a0 < a1
SevenSegmentNegativeSign h3(s,c, f3);

endmodule
