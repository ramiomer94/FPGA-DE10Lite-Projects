`timescale 1ns/1ps

module AdderSubtractorTop_tb;

  reg [3:0] a0;
  reg [3:0] a1;
  reg s; // 0 for add, 1 for subtract
  wire [6:0] HEX5, HEX3, HEX1, HEX0;

  AdderSubtractorTop uut (
    .a0(a0),
    .a1(a1),
    .s(s),
    .HEX5(HEX5),
    .HEX3(HEX3),
    .HEX1(HEX1),
    .HEX0(HEX0)
  );

  initial begin
    $display("Testing 4-bit Addition and Subtraction Calculator");
    
    // Test 1: 5 + 2 = 7
    a0 = 4'd5; a1 = 4'd2; s = 0;
    #100;

    // Test 2: 8 + 9 = 17 (cout should be set, display HEX value)
    a0 = 4'd8; a1 = 4'd9; s = 0;
    #100;

    // Test 3: 8 - 3 = 5 (cout should be 1)
    a0 = 4'd8; a1 = 4'd3; s = 1;
    #100;

    // Test 4: 3 - 5 = -2 (HEX1 should be minus sign)
    a0 = 4'd3; a1 = 4'd5; s = 1;
    #100;

    // End simulation
    $finish;
  end

endmodule