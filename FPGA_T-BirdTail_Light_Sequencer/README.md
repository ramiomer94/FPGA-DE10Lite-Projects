# FPGA T-Bird Tail Light Sequencer
A Verilog-based implementation of the 1965 Thunderbird sequential tail light pattern on an Intel DE10-Lite FPGA board. The project simulates realistic left/right turn signal behavior using LEDs and incorporates input switches, clock division, and FSM-based logic.

## Objective
Design a control system for the T-Bird tail lights using Verilog on the DE10-Lite FPGA. The light sequence simulates real car indicators using six LEDs (3 left, 3 right), and an FSM governs light states based on switch input combinations.

## Functional Description
- **SW0 (Right Turn Signal)** = `1`: Lights RA → RA+RB → RA+RB+RC → OFF → Repeat (3 times), then all 3 LEDs stay ON.
- **SW1 (Left Turn Signal)** = `1`: Same as above for LA, LB, LC.
- **Both SW0 & SW1 = 0**: All LEDs OFF (Idle).
- **Both SW0 & SW1 = 1**: All LEDs OFF, "E" displayed on 7-segment (Error).
- Changing switch positions dynamically affects state.

## FPGA Platform
- **Board**: Intel DE10-Lite
- **Clock**: 50 MHz (internal clock divider used for timing)

## Project Structure
FPGA_T-BirdTail_Light_Sequencer/
├── counter.v          # Clock divider & counter FSM
├── decoder.v          # LED and 7-segment display logic
├── Tbirdlight.v       # Top-level module (connects everything)
├── Tbirdlight_tb.v    # Testbench for simulation
└── README.md          # This file

## Files
- `counter.v`: Generates a 0.5s pulse and counts sequences.
- `decoder.v`: Maps counter values to LED & 7-segment outputs.
- `Tbirdlight.v`: Connects `counter` and `decoder` modules.
- `Tbirdlight_tb.v`: Simulation testbench for functional verification.

## Demo Video
Watch the simulation and real FPGA run here:  
https://www.youtube.com/watch?v=9oOhSFElNvc&ab_channel=Romer94

## Testbench Output
Simulates:
- Right turn signal pattern
- Left turn signal pattern
- Idle and Error conditions
- Reset and dynamic switch changes

## Tools Used
- **Intel Quartus Prime**
- **ModelSim (for simulation)**
- **Verilog (RTL)**
- **DE10-Lite FPGA Board**

## Author
**Rami Omer**  
Electrical Engineering  
York University

## License
This project is released for educational purposes.
