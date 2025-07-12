module FullAdder(a0,a1,cin,r,cout);

input a0, a1, cin;
output r, cout;


//output of a0 + a1
assign r = (a0 ^ a1) ^ cin;

//carryout of a0 + a1
assign cout = (a0 & a1 & cin) | (a0 & a1 & ~cin) | (a0 & ~a1 & cin) | (~a0 & a1 & cin);


endmodule




