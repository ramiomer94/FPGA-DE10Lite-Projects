module SevenSegmentDisplayController(a, out1, out2);

input[4:0] a;
output [6:0] out1, out2;


//y = A'B'C'D'E + A'B'CD'E' + A'BC'DE + A'BCDE' + AB'CD'E + ABC'D'E'
assign out1[0] = (~a[4] & ~a[3] & ~a[2] & ~a[1] & a[0]) | (~a[4] & ~a[3] & a[2] & ~a[1] & ~a[0]) |
                 (~a[4] & a[3] & ~a[2] & a[1] & a[0]) | (~a[4] & a[3] & a[2] & a[1] & ~a[0]) |
					  (a[4] & ~a[3] & a[2] & ~a[1] & a[0]) | (a[4] & a[3] & ~a[2] & ~a[1] & ~a[0]);
					  

//y = BCDE + A'B'CD'E + A'B'CDE' + AB'C'D'E' + ABC'D'E + ABC'DE'		  
assign out1[1] = (a[3] & a[2] & a[1] & a[0]) | (~a[4] & ~a[3] & a[2] & ~a[1] & a[0]) | 
                 (~a[4] & ~a[3] & a[2] & a[1] & ~a[0]) | (a[4] & ~a[3] & ~a[2] & ~a[1] & ~a[0]) |
					  (a[4] & a[3] & ~a[2] & ~a[1] & a[0]) | (a[4] & a[3] & ~a[2] & a[1] & ~a[0]);

					  
//y = A'B'C'DE' + A'BCD'E' + AB'CDE'	
assign out1[2] = (~a[4] & ~a[3] & ~a[2] & a[1] & ~a[0]) | (~a[4] & a[3] & a[2] & ~a[1] & ~a[0]) |
                 (a[4] & ~a[3] & a[2] & a[1] & ~a[0]);
					 
 
//y = B'C'D'E + BC'DE + AB'D'E + A'B'CD'E' + A'B'CDE + A'BCDE' + ABC'D'E'
assign out1[3] = (~a[3] & ~a[2] & ~a[1] & a[0]) | (a[3] & ~a[2] & a[1] & a[0]) 
		           | (a[4] & ~a[3] & ~a[1] & a[0]) | (~a[4] & ~a[3] & a[2] & ~a[1] & ~a[0]) | 
					  (~a[4] & ~a[3] & a[2] & a[1] & a[0]) | (~a[4] & a[3] & a[2] & a[1] & ~a[0]) 
					  | (a[4] & a[3] & ~a[2] & ~a[1] & ~a[0]);
					  
//	y = E + A'B'CD' + A'BCD + ABC'D'
assign out1[4] = a[0] | (~a[4] & ~a[3] & a[2] & ~a[1]) | (~a[4] & a[3] & a[2] & a[1]) |
                 (a[4] & a[3] & ~a[2] & ~a[1]);
					  

// y = A'B'C'E + A'B'C'D + A'B'DE + BC'DE + A'BCD' + AB'D'E + AB'CD


assign out1[5] = (~a[4] & ~a[3] & ~a[2] & a[0]) | (~a[4] & ~a[3] & ~a[2] & a[1]) | 
                 (~a[4] & ~a[3] & a[1] & a[0]) | (a[3] & ~a[2] & a[1] & a[0]) |
					  (~a[4] & a[3] & a[2] & ~a[1]) | (a[4] & ~a[3] & ~a[1] & a[0]) |
					  (a[4] & ~a[3] & a[2] & a[1]);

//y = A'B'C'D' + B'C'D'E + A'BC'D + BC'DE + AB'CD' + ABCD + A'B'CDE

					  
assign out1[6] = (~a[4] & ~a[3] & ~a[2] & ~a[1]) | (~a[3] & ~a[2] & ~a[1] & a[0]) |
                 (~a[4] & a[3] & ~a[2] & a[1]) | (a[3] & ~a[2] & a[1] & a[0]) |
					  (a[4] & ~a[3] & a[2] & ~a[1]) | (a[4] & a[3] & a[2] & a[1]) |
					  (~a[4] & ~a[3] & a[2] & a[1] & a[0]);
					  


//y = A'BD + A'BC + AB'C'				  
assign out2[0] = (~a[4] & a[3] & a[1]) | (~a[4] & a[3] & a[2]) | (a[4] & ~a[3] & ~a[2]);

assign out2[1] = 0;

//y = AB'C + ACD' + ABC'
assign out2[2] = (a[4] & ~a[3] & a[2]) | (a[4] & a[2] & ~a[1]) | (a[4] & a[3] & ~a[2]);

//y = A'BD + A'BC + AB'C'
assign out2[3] = (~a[4] & a[3] & a[1]) | (~a[4] & a[3] & a[2]) | (a[4] & ~a[3] & ~a[2]);

//y = A'BD + A'BC + AB'C' + BCD
assign out2[4] = (~a[4] & a[3] & a[1]) | (~a[4] & a[3] & a[2]) | (a[4] & ~a[3] & ~a[2]) 
                 | (a[3] & a[2] & a[1]);
					  
//y = A + BD + BC					  
assign out2[5] = a[4] | (a[3] & a[1]) | (a[3] & a[2]);

//y = A' + B'C'
assign out2[6] = ~a[4] | (~a[3] & ~a[2]);

endmodule

