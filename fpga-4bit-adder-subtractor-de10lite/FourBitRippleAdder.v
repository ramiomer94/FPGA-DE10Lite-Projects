module FourBitRippleAdder(a0, a1, s, r, cout);

input s;
input [3:0] a0, a1;
output [3:0] r;
output cout;
wire [3:0] c, na1;
wire cin; 

/* 

s is a one-bit input that is used to control the operation performed by the ripple carry
adder we are designing here. if s is 1, the adder will subtract argument a1 from argument a0
a0-a1.

 */


/* 


implementing subtraction operation in a ripple carry adder requires transforming our negative
argument (-a1) from 1's complement to 2's complement. we can carry out this conversion as follows:
1- invert every bit in the digit.
2- add 1 to the inverted number. 

 
*/

/* The following loop makes sure that step one of the conversion process is acheived. Notice that 
we use xor to fulfil this goal since it saves us time and circuit elements. thus if s=1 and
the bit in iteration i is 1 then the bit is inverted to 0 and so on.
*/
genvar i;

generate

	for(i = 0; i < 4; i = i + 1) begin: sub
	
		assign na1[i] = (s ^ a1[i]);
	end
endgenerate


/* 

We know that in addition the initial cin of the adder is zero. In subtraction, initial cin 
becomes 1 since step 2 asks us to add one to the inverted digit.


*/
assign cin = s;



//a0(first argument),a1(second argument),cin(one if a0-a1, zero if a0+a1), r ( 4-bit result)
//,cout (the carry out of the last bit operation)

FullAdder f0(a0[0], na1[0],cin, r[0], c[0]);
FullAdder f1(a0[1], na1[1], c[0], r[1], c[1]);
FullAdder f2(a0[2], na1[2], c[1], r[2], c[2]);
FullAdder f3(a0[3], na1[3], c[2], r[3], cout); 




endmodule 