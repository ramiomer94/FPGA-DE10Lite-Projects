`timescale 1ns / 1ps

module piano_keyboard_tb;

    // Clock and reset
    logic clk;
    logic rst;
    logic [7:0] key;
    logic audio_out;

    // Instantiate the DUT (Design Under Test)
    piano_keyboard dut (
        .clk(clk),
        .rst(rst),
        .key(key),
        .audio_out(audio_out)
    );

    // Clock generation: 50 MHz = 20 ns period
    initial clk = 0;
    always #10 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize
        rst = 1;
        key = 8'b00000000;

        // Hold reset for a few cycles
        #100;
        rst = 0;

        // Simulate key presses over time
        #100_000; key = 8'b00000001; // Play note C
        #100_000; key = 8'b00000010; // Play note D
        #100_000; key = 8'b00000100; // Play note E
        #100_000; key = 8'b00001000; // Play note F
        #100_000; key = 8'b00010000; // Play note G
        #100_000; key = 8'b00000000; // No key

        // End simulation
        #200_000;
        $finish;
    end

    // Optional: monitor signals
    initial begin
        $display("Time\tclk\trst\tkey\taudio_out");
        $monitor("%0t\t%b\t%b\t%08b\t%b", $time, clk, rst, key, audio_out);
    end

endmodule