`timescale 1ns/1ps

module blinker_tb;

  // Inputs
  reg clk;
  reg rst;
  reg sw0;

  // Outputs
  wire [7:0] led;

  // Instantiate the Unit Under Test (UUT)
  blinker uut (
    .clk(clk),
    .rst(rst),
    .sw0(sw0),
    .led(led)
  );

  // Clock generation: 50 MHz -> 20 ns period
  always #10 clk = ~clk;

  initial begin
    // Initial values
    clk = 0;
    rst = 1;
    sw0 = 1;   // Start with SW0 high (Mode 1)

    // Hold reset for 100 ns
    #100;
    rst = 0;

    // Wait and observe LED behavior in Mode 1
    #200_000_000; // 200 ms of simulation time 

    // Change to Mode 0
    sw0 = 0;

    // Observe LED behavior in Mode 0
    #200_000_000;

    // End simulation
    $stop;
  end

endmodule