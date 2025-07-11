`timescale 1ns / 1ps

module tb_top;

    reg clk;
    reg sw0;
    reg sw1;
    wire [5:0] leds;
    wire [6:0] seg;

    // Instantiate the top-level module
    top uut (
        .clk(clk),
        .sw0(sw0),
        .sw1(sw1),
        .leds(leds),
        .seg(seg)
    );

    // Clock generation: 50MHz
    always #10 clk = ~clk; // 20ns period => 50MHz

    initial begin
        // Initialize
        clk = 0;
        sw0 = 0;
        sw1 = 0;

        // Idle Mode - All OFF
        #200;

        // Right Turn Signal
        sw0 = 1;
        sw1 = 0;
        #100000000; // wait 2s

        // Switch to Left Turn Signal mid-sequence
        sw0 = 0;
        sw1 = 1;
        #100000000;

        // Both ON = Error state
        sw0 = 1;
        sw1 = 1;
        #100000000;

        // Reset to idle
        sw0 = 0;
        sw1 = 0;
        #50000000;

        $stop;
    end

endmodule