module decoder(s0, s1, a, f0, f1 );

input s0, s1;
input[3:0] a;
output [5:0] f0;
output [6:0] f1;



//A:s1 B:s0 C:a[3] D:a[2] E:a[1] F:a[0]


//LED RA
assign f0[0] = (!s1 & s0) & (!a[1] | !a[0]);

//LED LA
assign f0[1] = (s1 & !s0) & (!a[1] | !a[0]);

//LED RB
assign f0[2] = (!s1 & s0) & ((!a[1] & a[0]) | (a[1] & !a[0])) | (!s1 & s0 & a[3] & a[2]);

//LED LB
assign f0[3] = (s1 & !s0) & ((!a[1] & a[0]) | (a[1] & !a[0])) | (s1 & !s0 & a[3] & a[2]);

//LED RC
assign f0[4] = (!s1 & s0) & ((a[1] & !a[0]) | (a[3] & a[2]));

//LED LC
assign f0[5] = (s1 & !s0) & ((a[1] & !a[0]) | (a[3] & a[2]));

//screen[0]
assign f1[0] = !s1 | !s0 | a[3] | a[2] | a[1] | a[0];

//screen[1]
assign f1[1] = 1;

//screen[2]
assign f1[2] = 1;

//screen[3]
assign f1[3] = !s1 | !s0 | a[3] | a[2] | a[1] | a[0];

//screen[4]
assign f1[4] = !s1 | !s0 | a[3] | a[2] | a[1] | a[0];

//screen[5]
assign f1[5] = !s1 | !s0 | a[3] | a[2] | a[1] | a[0];

//screen[6]
assign f1[6] = !s1 | !s0 | a[3] | a[2] | a[1] | a[0];

endmodule