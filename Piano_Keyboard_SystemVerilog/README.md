# FPGA Music Box - Piano Keyboard Project

This project implements a simple FPGA-based piano keyboard on the DE10-Lite board using SystemVerilog. It plays musical tones based on key switches and generates a square wave output to drive a speaker or buzzer.

---

## Features

- Supports 8 piano keys via on-board switches (`SW[7:0]`)
- Generates corresponding audio frequencies using PWM or clock dividers
- Output connected to GPIO pin for speaker

---

Switch          Tone

SW[0]           C
SW[1]           D
SW[2]           E
SW[3]           F
SW[4]           G
SW[5]           A
SW[6]           B
SW[7]           C’

---

## FPGA Platform
- **Board**: Intel DE10-Lite
- **Clock**: 50 MHz (internal clock divider used for timing)

---

## File Structure
piano_keyboard.sv       # Top-level SystemVerilog design
piano_keyboard_tb.v     # SystemVerilog testbench
README.md               # Project documentation

---

## Tools Used
- **Intel Quartus Prime**
- **ModelSim (for simulation)**
- **Verilog (RTL)**
- **DE10-Lite FPGA Board**

---

## License
This project is released for educational purposes.
