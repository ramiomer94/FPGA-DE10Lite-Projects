# FPGA 4-bit Addition & Subtraction Calculator (DE10-Lite)

## Overview

This project implements a 4-bit ripple carry adder and subtractor on the DE10-Lite FPGA using Verilog. It allows the user to perform binary addition and subtraction with real-time display of inputs and results on 7-segment displays.

## Features

- Adds or subtracts two 4-bit binary numbers (0–15).
- Uses two’s complement for subtraction.
- Handles carry-out and negative results.
- Displays inputs and outputs on 7-segment displays:
  - `HEX5`: First operand (a0)
  - `HEX3`: Second operand (a1)
  - `HEX0`: Result
  - `HEX1`: Carry or minus indicator

## Modules

- `FullAdder`: 1-bit full adder module.
- `FourBitRippleAdder`: 4-bit ripple carry adder.
- `SevenSegmentDecoder`: Converts 4-bit binary to 7-segment signals.
- `SevenSegmentNegativeSign`: Displays the negative sign indicator on the seven-segment display when the result is negative. 
- `AdderSubtractorTop`: Top-level integration module.

## Controls

- Switches set the values of `a0`, `a1`, and subtraction control `s`.
- When `s = 0`: performs addition.
- When `s = 1`: performs subtraction using 2’s complement.

## Example Operations

| Operation   | a0 | a1 | s | Result | HEX1 Display |
|-------------|----|----|---|--------|---------------|
| 5 + 2       | 5  | 2  | 0 | 7      | (blank)       |
| 8 + 9       | 8  | 9  | 0 | 11     | `1` (carry)   |
| 8 - 3       | 8  | 3  | 1 | 5      | (blank)       |
| 3 - 5       | 3  | 5  | 1 | -2     | `-`           |

## FPGA Platform
- **Board**: Intel DE10-Lite
- **Clock**: 50 MHz (internal clock divider used for timing)

## Tools Used
- **Intel Quartus Prime**
- **ModelSim (for simulation)**
- **Verilog (RTL)**
- **DE10-Lite FPGA Board**

## Demo

A video demonstration shows the working calculator running on the DE10-Lite board. It highlights:
- Positive and negative subtraction results.
- Carry-out condition in addition.
Youtube Link: https://youtu.be/q327msq2BdI


## Author
**Rami Omer**  
Electrical Engineering  
York University

## License
This project is released for educational purposes.


