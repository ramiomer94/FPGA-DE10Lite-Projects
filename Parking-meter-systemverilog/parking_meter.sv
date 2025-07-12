module parking_meter(
    input logic clk,
    input logic reset,
    input logic [2:0] sw_coin,  // SW0, SW1, SW2
    input logic sw_start,       // SW4
    output logic [6:0] seg0, seg1 // Two 7-segment displays
);

    logic [7:0] time_val;  // max 99 seconds

    coin_handler ch(
        .clk(clk),
        .reset(reset),
        .sw_coin(sw_coin),
        .sw_start(sw_start),
        .time_out(time_val)
    );

    countdown_timer ct(
        .clk(clk),
        .reset(reset),
        .enable(sw_start),
        .time_in(time_val),
        .time_out(time_val)
    );

    display_driver dd(
        .time_val(time_val),
        .seg0(seg0),
        .seg1(seg1)
    );

endmodule