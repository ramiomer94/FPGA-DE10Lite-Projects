# FPGA Shot Clock (Basketball Timer)

This project implements a basketball shot clock system on the DE10-Lite FPGA board using Verilog. It includes full countdown functionality, pause/resume control, and a mode selector for 24s and 30s durations.

## Features

- **Countdown Timer**: Counts down from 24 or 30 seconds.
- **Resettable**: Reset the timer at any time.
- **Pause/Resume**: Single-button toggle.
- **Mode Select**: Choose between 24s (NBA/OUA) or 30s (NCAA) shot clock using a switch.
- **Seven Segment Display**: Displays time left on two 7-segment displays.
- **Modular Design**:
  - `ClockDivider_Counter.v`: Produces 1Hz clock and countdown logic.
  - `SevenSegmentDisplayController.v`: Converts seconds into 2-digit 7-segment output.
  - `ShotClockTop.v`: Integrates all modules.

## Inputs

| Signal       | Description                     |
|--------------|---------------------------------|
| `clk`        | 50 MHz base clock               |
| `rst`        | Active-high synchronous reset   |
| `pause`      | Toggles pause/resume state      |
| `mode_switch`| Selects 24s or 30s mode         |

## Output

| Signal  | Description                |
|---------|----------------------------|
| `seg0`  | Right 7-segment digit (ones place) |
| `seg1`  | Left 7-segment digit (tens place)  |

## Demo

> [YouTube link here](https://youtube.com/shorts/VoMH5m5uXF4?feature=share) 

---

### Lab Context

This project was developed for **EECS 3201 - Lab 4: Shot Clock**, which focuses on integrating digital logic design with real-time constraints in sports systems. 

## Author
**Rami Omer**  
Electrical Engineering  
York University

## License
This project is released for educational purposes.
