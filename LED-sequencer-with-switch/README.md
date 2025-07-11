# LED Blinker Sequence - DE10-Lite FPGA Project

This project demonstrates an LED sequencing system implemented in Verilog for the DE10-Lite FPGA development board. It features two blinking modes controlled by a physical switch (`SW0`) and uses precise timing logic based on a 50 MHz system clock.

---

## Specifications

- **Target Device**: DE10-Lite (Intel/Altera FPGA)
- **Language**: Verilog
- **Clock Frequency**: 50 MHz
- **Inputs**:
  - `SW0`: Mode selector
  - `KEY0`: Reset button (active low)
- **Outputs**:
  - `LEDR[7:0]`: LED indicators (8 total)

### Mode 1: (`SW0 = 1`)
- LEDs turn **on from left to right** (LEDR0 → LEDR7)
- Each LED turns on **every 1 second**
- When all 8 are lit, all turn off and the sequence restarts

### Mode 2: (`SW0 = 0`)
- LEDs turn on with a **custom delay pattern**:
  - LEDR0: immediately
  - LEDR1: after 2s
  - LEDR2: after 1s
  - LEDR3: after 0.5s
  - LEDR4: after 0.25s, etc.
- After all LEDs are lit, all reset

---

## Project Structure

led-blinker-sequence/
├── blinker.v          # Top-level module
├── counter.v          # Timing logic and control
├── decoder.v          # LED decoder logic
├── blinker_tb.v       # Testbench
├── README.md          # This file
├── Lab 2 Report.docx  # Formal documentation

## Testbench

The testbench simulates both switch positions and verifies correct LED sequencing. Use ModelSim or similar tools to observe output waveforms.

## Demonstration

https://youtube.com/shorts/-gJZaqyDu8s?feature=share

## License

This project is released for educational purposes.
