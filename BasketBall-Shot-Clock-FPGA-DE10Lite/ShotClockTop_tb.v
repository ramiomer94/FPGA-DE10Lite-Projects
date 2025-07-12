`timescale 1ns / 1ps

module ShotClockTop_tb;

  reg clk;
  reg rst;
  reg pause;
  reg mode_switch;
  wire [6:0] seg0, seg1;

  // Instantiate the DUT (Device Under Test)
  ShotClockTop uut (
    .clk(clk),
    .rst(rst),
    .pause(pause),
    .mode_switch(mode_switch),
    .seg0(seg0),
    .seg1(seg1)
  );

  // Generate a 50MHz clock (20ns period)
  always #10 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    pause = 0;
    mode_switch = 0;

    // Initial reset
    #25 rst = 1;
    #40 rst = 0;

    // Let it run for 5 seconds
    #500000000;

    // Pause countdown
    pause = 1;
    #200000000;  // stay paused for 2 seconds

    // Resume countdown
    pause = 0;
    #500000000;

    // Reset clock again
    rst = 1;
    #40 rst = 0;
    #500000000;

    // Switch to 30s mode
    mode_switch = 1;
    rst = 1;
    #40 rst = 0;

    // Run 5 seconds in 30s mode
    #500000000;

    $finish;
  end

endmodule