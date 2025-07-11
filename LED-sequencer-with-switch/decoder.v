module decoder(E,a,y);

input E;
input [3:0] a;
output [7:0] y;

// A = E
// B =a[3]
// C = a[2]
// D = a[1]
// E = a[0]

/*
assign y[0] = !a[3]; //Leftmost LED[8]
assign y[1] = a[2] | a[1] & (E & a[0]); //LED [7]
assign y[2] = a[2] | a[1] | (E & a[0]);  //LED [6]
assign y[3] = a[2] | (E & a[1] & a[0]); //LED [5]
assign y[4] = a[2] & (E | a[1] | a[0]); //LED [4]
assign y[5] = a[3] | (a[2] & a[1]); //LED [3]
assign y[6] = a[3] |(a[2] & a[1] & a[0]); //LED [2]
assign y[7] = a[3];  //LED [1]
*/

//y = CE + CD + AC + A'BD' + BD'E'

assign y[0] = a[2] | (!a[3] & a[0]) | (!a[3] & a[1]) | (!E & a[0]) | (a[3] & !a[1] & !a[0]); //Leftmost LED[8] 
assign y[1] = a[2] | (a[1] & a[0]) | (E & a[1]) | (!E & a[3] & !a[1]) | (a[3] & !a[1] & !a[0]); //LED [7]
assign y[2] = a[2] | (!E & a[3] & !a[1]) | (a[3] & !a[1] & !a[0]) | (E & a[1] & a[0]);  //LED [6]
assign y[3] = a[2] & (E | a[1] | a[0]) | (!E & a[3] & !a[1]) | (a[3] & !a[1] & !a[0]); //LED [5]
assign y[4] = (a[2] & a[1]) | (!E & a[3] & !a[1]) | (a[3] & !a[1] & !a[0]) | (E & a[2] & a[0]); 
assign y[5] = (a[2] & a[1] & a[0]) | (!E & a[3] & !a[1]) | (a[3] & !a[1] & !a[0]) | (E & a[2] &a[1]); //LED [3]
assign y[6] = (!E & a[3] & !a[1]) | (a[3] & !a[1] & !a[0]) | (E & a[2] & a[1] & a[0]); //LED [2]
assign y[7] = (!E & a[3] & a[0]) | (E & a[3] & !a[0]);  //LED [1]

/*
assign y[0] = E & (a[3] | a[2] | a[1] | a[0]); //Leftmost LED[8]
assign y[1] = E & (a[3] | a[2] | a[1]); //LED [7]
assign y[2] = E & (a[3] | a[2] | (a[1] & a[0]));  //LED [6]
assign y[3] = E & (a[3] | a[2]); //LED [5]
assign y[4] = E & (a[3] | (a[2] & a[0]) | (a[2] & a[1])); //LED [4]
assign y[5] = E & (a[3] | (a[2] & a[1])); //LED [3]
assign y[6] = E & (a[3] |( a[2] & a[1] & a[0])); //LED [2]
assign y[7] = E & a[3];  //LED [1]

*/
endmodule