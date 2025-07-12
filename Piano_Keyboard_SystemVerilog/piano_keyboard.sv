
module piano_keyboard(clk, play, full_note, speaker); 
	
	input logic clk, play;
	input logic [6:0] full_note;
	output logic speaker;
	
	parameter ticks = 50000000;



	logic [31:0] frequency;
	reg [31:0] counterNote;
	
	always_comb begin					
		case(full_note)
		
			//Octave zero all twelve notes
		
			7'b0000000: frequency = 1'b0; //silent
			7'b0000001: frequency = (ticks/262/2) - 1'b1; // C
			7'b0000010: frequency = (ticks/278/2) - 1'b1; // C#/D
			7'b0000011: frequency = (ticks/294/2) - 1'b1; // D
			7'b0000100: frequency = (ticks/312/2) - 1'b1; // D#/E
			7'b0000101: frequency = (ticks/330/2) - 1'b1; // E
			7'b0000110: frequency = (ticks/350/2) - 1'b1; // F
			7'b0000111: frequency = (ticks/370/2) - 1'b1; // F#/G
			7'b0001000: frequency = (ticks/392/2) - 1'b1; // G
			7'b0001001: frequency = (ticks/416/2) - 1'b1; // G#/A
			7'b0001010: frequency = (ticks/440/2) - 1'b1; // A
			7'b0001011: frequency = (ticks/467/2) - 1'b1; // A#/B
			7'b0001100: frequency = (ticks/494/2) - 1'b1; // B
			
			//octave one all twelve notes
			
			7'b0010000: frequency = 1'b0; //silent
			7'b0010001: frequency = (ticks/524/2) - 1'b1; // C
			7'b0010010: frequency = (ticks/555/2) - 1'b1; // C#/D
			7'b0010011: frequency = (ticks/588/2) - 1'b1; // D
			7'b0010100: frequency = (ticks/623/2) - 1'b1; // D#/E
			7'b0010101: frequency = (ticks/660/2) - 1'b1; // E
			7'b0010110: frequency = (ticks/699/2) - 1'b1; // F
			7'b0010111: frequency = (ticks/740/2) - 1'b1; // F#/G
			7'b0011000: frequency = (ticks/784/2) - 1'b1; // G
			7'b0011001: frequency = (ticks/831/2) - 1'b1; // G#/A
			7'b0011010: frequency = (ticks/880/2) - 1'b1; // A
			7'b0011011: frequency = (ticks/933/2) - 1'b1; // A#/B
			7'b0011100: frequency = (ticks/988/2) - 1'b1; // B
			
			//octave two all twelve notes
			
			7'b0100000: frequency = 1'b0; //silent
			7'b0100001: frequency = (ticks/1047/2) - 1'b1; // C
			7'b0100010: frequency = (ticks/1109/2) - 1'b1; // C#/D
			7'b0100011: frequency = (ticks/1175/2) - 1'b1; // D
			7'b0100100: frequency = (ticks/1245/2) - 1'b1; // D#/E
			7'b0100101: frequency = (ticks/1319/2) - 1'b1; // E
			7'b0100110: frequency = (ticks/1397/2) - 1'b1; // F
			7'b0100111: frequency = (ticks/1480/2) - 1'b1; // F#/G
			7'b0101000: frequency = (ticks/1568/2) - 1'b1; // G
			7'b0101001: frequency = (ticks/1662/2) - 1'b1; // G#/A
			7'b0101010: frequency = (ticks/1760/2) - 1'b1; // A
			7'b0101011: frequency = (ticks/1865/2) - 1'b1; // A#/B
			7'b0101100: frequency = (ticks/1976/2) - 1'b1; // B
			
			//octave three all twelve notes
			
			7'b0110000: frequency = 1'b0; //silent
			7'b0110001: frequency = (ticks/2093/2) - 1'b1; // C
			7'b0110010: frequency = (ticks/2218/2) - 1'b1; // C#/D
			7'b0110011: frequency = (ticks/2350/2) - 1'b1; // D
			7'b0110100: frequency = (ticks/2489/2) - 1'b1; // D#/E
			7'b0110101: frequency = (ticks/2637/2) - 1'b1; // E
			7'b0110110: frequency = (ticks/2794/2) - 1'b1; // F
			7'b0110111: frequency = (ticks/2960/2) - 1'b1; // F#/G
			7'b0111000: frequency = (ticks/3136/2) - 1'b1; // G
			7'b0111001: frequency = (ticks/3323/2) - 1'b1; // G#/A
			7'b0111010: frequency = (ticks/3520/2) - 1'b1; // A
			7'b0111011: frequency = (ticks/3730/2) - 1'b1; // A#/B
			7'b0111100: frequency = (ticks/3951/2) - 1'b1; // B
			
			//octave four all twelve notes
			
			7'b1000000: frequency = 1'b0; //silent
			7'b1000001: frequency = (ticks/4186/2) - 1'b1; // C
			7'b1000010: frequency = (ticks/4435/2) - 1'b1; // C#/D
			7'b1000011: frequency = (ticks/4699/2) - 1'b1; // D
			7'b1000100: frequency = (ticks/4978/2) - 1'b1; // D#/E
			7'b1000101: frequency = (ticks/5274/2) - 1'b1; // E
			7'b1000110: frequency = (ticks/5588/2) - 1'b1; // F
			7'b1000111: frequency = (ticks/5920/2) - 1'b1; // F#/G
			7'b1001000: frequency = (ticks/6272/2) - 1'b1; // G
			7'b1001001: frequency = (ticks/6645/2) - 1'b1; // G#/A
			7'b1001010: frequency = (ticks/7040/2) - 1'b1; // A
			7'b1001011: frequency = (ticks/7459/2) - 1'b1; // A#/B
			7'b1001100: frequency = (ticks/7903/2) - 1'b1; // B
			
			default: frequency = 1'b0;
			endcase
		end
			
	
 
	always_ff @(posedge clk, posedge play)
		begin
			if(play) speaker <= 1'b0;
			else begin
				if(counterNote == 1'b0)begin
					counterNote <= frequency;
					speaker <= ~speaker;
				end
				else	counterNote <= counterNote - 1'b1;
			end
		end
			
 
endmodule
