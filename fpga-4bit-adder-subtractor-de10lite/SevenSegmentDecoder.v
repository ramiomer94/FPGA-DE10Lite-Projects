module SevenSegmentDecoder(a,f);

input [3:0] a;
output [6:0] f;


//LED 0

/* original binary function before simplification:
assign f[0] = (~a[3] & ~a[2] & ~a[1] & a[0]) | (~a[3] & a[2] & ~a[1] & ~a[0]) | 
(a[3] & ~a[2] & a[1] & a[0]) | (a[3] & a[2] & ~a[1] & a[0]); */

/*simplification steps:
assume a[3] = A, a[2] = B, a[1] = C, a[0] = D
Note: A' = ~A
we have: f[0] = A'B'C'D + A'BC'D' + AB'CD + ABC'D
			f[0] = A'C'(B'D + BD') + AD(B'C + BC')
			B'D + BD' == B XOR D 
			Similarly, B'C + BC' == B XOR C
			--> We get the following : f[0] = A'C'(B XOR D) + AD(B XOR C)
			
			substituting back and f[0] after simplification looks like the following
			verilog statement:   */
			
assign f[0] = (~a[3] & ~a[1] & (a[2] ^ a[0])) | (a[3] & a[0] & (a[2] ^ a[1]));

//LED 1
assign f[1] = (~a[3] & a[2] & ~a[1] & a[0]) | (~a[3] & a[2] & a[1] & ~a[0]) | 
(a[3] & ~a[2] & a[1] & a[0]) | (a[3] & a[2] & ~a[1] & ~a[0]) | (a[3] & a[2] & a[1] & ~a[0]) | 
(a[3] & a[2] & a[1] & a[0]); 

//LED 2
assign f[2] = (~a[3] & ~a[2] & a[1] & ~a[0]) | (a[3] & a[2] & ~a[1] & ~a[0]) | 
(a[3] & a[2] & a[1] & ~a[0]) | (a[3] & a[2] & a[1] & a[0]);

//LED 3
assign f[3] = (~a[3] & ~a[2] & ~a[1] & a[0]) | (~a[3] & a[2] & ~a[1] & ~a[0]) | 
(~a[3] & a[2] & a[1] & a[0]) | (a[3] & ~a[2] & a[1] & ~a[0]) | (a[3] & a[2] & a[1] & a[0]);

//LED 4
assign f[4] = (~a[3] & ~a[2] & ~a[1] & a[0]) | (~a[3] & ~a[2] & a[1] & a[0]) | 
(~a[3] & a[2] & ~a[1] & ~a[0]) | (~a[3] & a[2] & ~a[1] & a[0]) | (~a[3] & a[2] & a[1] & a[0]) | 
(a[3] & ~a[2] & ~a[1] & a[0]);

//LED 5
assign f[5] = (~a[3] & ~a[2] & ~a[1] & a[0]) | (~a[3] & ~a[2] & a[1] & ~a[0]) | 
(~a[3] & ~a[2] & a[1] & a[0]) | (~a[3] & a[2] & a[1] & a[0]) | (a[3] & a[2] & ~a[1] & a[0]);

//LED 6
/* original binary function before simplification:

assign f[6] = (~a[3] & ~a[2] & ~a[1] & ~a[0]) | (~a[3] & ~a[2] & ~a[1] & a[0]) | 
(~a[3] & a[2] & a[1] & a[0]) | (a[3] & a[2] & ~a[1] & ~a[0]);
*/


/*simplification steps:
assume a[3] = A, a[2] = B, a[1] = C, a[0] = D
Note: A' = ~A
We have: f[6] = A'B'C'D' + A'B'C'D + A'BCD + ABC'D'
			f[6] = A'B'C'(D'+ D) + B(A'CD + AC'D')
			Since D' + D = 1 , and (A'B'C').1 = A'B'C'
			--> We get the following : f[6] = A'B'C' + B[(A'CD + AC'D')]
			
			substituting back and f[6] after simplification looks like the following
			verilog statement:   		
*/

assign f[6] = (~a[3] & ~a[2] & ~a[1]) | ( a[2] & ((~a[3] & a[1] & a[0]) | (a[3] & ~a[1] & ~a[0])));

endmodule

