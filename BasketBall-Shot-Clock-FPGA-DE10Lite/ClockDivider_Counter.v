module clockDivider_Counter (
    input clk,               // 50 MHz input clock
    input rst,               // Synchronous active-high reset
    input pause,             // Pause signal
    input mode_select,       // 0 = 24s, 1 = 30s
    output reg [4:0] counter, // Countdown output (0–32)
    output cout        // Optional 1Hz clock for debug/display
);

    parameter D = 50000000; // 1 Hz at 50 MHz
    reg [25:0] tick_counter;
    reg [4:0] max_value;

    // Mode-based max value selection
    always @(*) begin
        if (mode_select)
            max_value = 6'd30;
        else
            max_value = 6'd24;
    end

    // Clock divider and countdown logic
    always @(posedge clk) begin
        if (rst) begin
            tick_counter <= 0;
            counter <= max_value;
        end else if (!pause) begin
            if (tick_counter >= D - 1) begin
                tick_counter <= 0;
                if (counter > 0)
                    counter <= counter - 1;
                else
                    counter <= max_value; // Restart
            end else begin
                tick_counter <= tick_counter + 1;
            end
        end
    end

    // Generate 1Hz debug clock
    assign cout = (tick_counter < D/2) ? 1'b0 : 1'b1;

endmodule