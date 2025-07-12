module countdown_timer(
    input logic clk,
    input logic reset,
    input logic enable,
    input logic [7:0] time_in,
    output logic [7:0] time_out
);

    logic [31:0] tick;
    parameter CLOCK_FREQ = 50000000;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            tick <= 0;
            time_out <= 0;
        end else if (enable) begin
            if (time_out == 0) begin
                time_out <= 0;
            end else begin
                tick <= tick + 1;
                if (tick >= CLOCK_FREQ - 1) begin
                    tick <= 0;
                    time_out <= time_out - 1;
                end
            end
        end else begin
            time_out <= time_in;
            tick <= 0;
        end
    end

endmodule