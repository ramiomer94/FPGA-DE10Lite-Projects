module coin_handler(
    input logic clk,
    input logic reset,
    input logic [2:0] sw_coin,  // SW0, SW1, SW2
    input logic sw_start,
    output logic [7:0] time_out
);
    logic [7:0] current_time;

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            current_time <= 0;
        else if (!sw_start) begin
            if (sw_coin[0] && current_time + 5 <= 99)
                current_time <= current_time + 5;
            else if (sw_coin[1] && current_time + 10 <= 99)
                current_time <= current_time + 10;
            else if (sw_coin[2] && current_time + 20 <= 99)
                current_time <= current_time + 20;
        end
    end

    assign time_out = current_time;
endmodule