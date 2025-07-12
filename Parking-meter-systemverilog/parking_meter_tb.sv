`timescale 1ns/1ps

module parking_meter_tb;
    logic clk;
    logic reset;
    logic [2:0] sw_coin;
    logic sw_start;
    logic [6:0] seg0, seg1;

    parking_meter uut (
        .clk(clk),
        .reset(reset),
        .sw_coin(sw_coin),
        .sw_start(sw_start),
        .seg0(seg0),
        .seg1(seg1)
    );

    always #10 clk = ~clk;  // 50MHz clock

    initial begin
        $display("Starting test...");
        clk = 0;
        reset = 1;
        sw_coin = 3'b000;
        sw_start = 0;

        #100;
        reset = 0;

        // Deposit SW0 (5s)
        sw_coin[0] = 1;
        #100;
        sw_coin[0] = 0;

        // Deposit SW1 (10s)
        sw_coin[1] = 1;
        #100;
        sw_coin[1] = 0;

        // Start countdown
        sw_start = 1;

        // Wait for some time
        #1000000;

        $finish;
    end
endmodule