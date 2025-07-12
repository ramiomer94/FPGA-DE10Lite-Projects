# FPGA Parking Meter System (SystemVerilog)

This project simulates a digital parking meter on the DE-10 Lite FPGA board using SystemVerilog. The design supports coin-based deposits and countdown logic with visual 7-segment display output.

## Features

- SW0 adds **5 seconds**
- SW1 adds **10 seconds**
- SW2 adds **20 seconds**
- Maximum time: **99 seconds**
- SW4 initiates countdown mode
- Time countdowns **every 1 second**
- Displayed using two 7-segment displays
- Pushbutton 0 resets the system to 00

## Project Structure

- `top_parking_meter.sv` – Top-level module integrating submodules.
- `coin_handler.sv` – Handles deposit logic.
- `countdown_timer.sv` – Controls countdown functionality.
- `display_driver.sv` – Converts time into 7-segment values.
- `tb_parking_meter.v` – Testbench to simulate behavior.

## FPGA Platform
- **Board**: Intel DE10-Lite
- **Clock**: 50 MHz (internal clock divider used for timing)

## Tools Used
- **Intel Quartus Prime**
- **ModelSim (for simulation)**
- **SystemVerilog (RTL)**
- **DE10-Lite FPGA Board**

## Author
**Rami Omer**  
Electrical Engineering  
York University

## License
This project is released for educational purposes.

