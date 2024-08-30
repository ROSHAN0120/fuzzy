module slow_clk (
    input wire clk_in,    // 100 MHz input clock
    input wire reset,     // Reset input
    output reg clk_out    // Slower output clock
);
    // Parameter for division factor
    parameter DIV_FACTOR = 100000000; // Divide by 100,000,000 to get 1 Hz from 100 MHz

    // Counter to divide the clock
    reg [31:0] counter;

    // Initialization
    initial begin
        counter = 0;
        clk_out = 0;
    end

    // Clock division logic
    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == (DIV_FACTOR - 1)) begin
                counter <= 0;
                clk_out <= ~clk_out; // Toggle the output clock
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
