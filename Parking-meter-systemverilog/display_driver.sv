module display_driver(
    input logic [7:0] time_val,
    output logic [6:0] seg0,
    output logic [6:0] seg1
);

    function [6:0] seg_decode(input logic [3:0] digit);
        case (digit)
            4'd0: seg_decode = 7'b1000000;
            4'd1: seg_decode = 7'b1111001;
            4'd2: seg_decode = 7'b0100100;
            4'd3: seg_decode = 7'b0110000;
            4'd4: seg_decode = 7'b0011001;
            4'd5: seg_decode = 7'b0010010;
            4'd6: seg_decode = 7'b0000010;
            4'd7: seg_decode = 7'b1111000;
            4'd8: seg_decode = 7'b0000000;
            4'd9: seg_decode = 7'b0010000;
            default: seg_decode = 7'b1111111;
        endcase
    endfunction

    assign seg0 = seg_decode(time_val % 10);
    assign seg1 = seg_decode(time_val / 10);

endmodule