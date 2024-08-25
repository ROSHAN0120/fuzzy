module simple_fuzzy_logic (
    input wire [7:0] rain_fall,     // 8-bit input for rainfall (0 to 100)
    input wire [7:0] soil_moisture, // 8-bit input for soil moisture (0 to 100)
    output reg [7:0] risk           // 8-bit output risk (0 to 255)
);

    // Membership functions for rainfall
    wire [7:0] rain_low;
    wire [7:0] rain_medium;
    wire [7:0] rain_high;

    // Membership functions for soil moisture
    wire [7:0] soil_moisture_low;
    wire [7:0] soil_moisture_medium;
    wire [7:0] soil_moisture_high;

    // Fuzzy rules
    wire [7:0] rule1_firing_strength;
    wire [7:0] rule2_firing_strength;
    wire [7:0] rule3_firing_strength;

    // Defuzzification components
    wire [15:0] numerator;
    wire [7:0] denominator;

    // Fuzzification: Triangular membership functions
    function [7:0] triangular_membership;
        input [7:0] value;
        input [7:0] a;
        input [7:0] b;
        input [7:0] c;
        begin
            if (value <= a)
                triangular_membership = 0;
            else if (value <= b)
                triangular_membership = (value - a) * 255 / (b - a);  // Fixed-point scaling for simplicity
            else if (value <= c)
                triangular_membership = (c - value) * 255 / (c - b);
            else
                triangular_membership = 0;
        end
    endfunction

    // Rainfall fuzzy sets
    assign rain_low = triangular_membership(rain_fall, 0, 20, 40);
    assign rain_medium = triangular_membership(rain_fall, 30, 50, 70);
    assign rain_high = triangular_membership(rain_fall, 60, 80, 100);

    // Soil moisture fuzzy sets
    assign soil_moisture_low = triangular_membership(soil_moisture, 0, 20, 40);
    assign soil_moisture_medium = triangular_membership(soil_moisture, 30, 50, 70);
    assign soil_moisture_high = triangular_membership(soil_moisture, 60, 80, 100);

    // Fuzzy rules:
    // Rule 1: IF rainfall is high AND soil moisture is high THEN risk is high
    assign rule1_firing_strength = rain_high & soil_moisture_high;

    // Rule 2: IF rainfall is medium AND soil moisture is medium THEN risk is medium
    assign rule2_firing_strength = rain_medium & soil_moisture_medium;

    // Rule 3: IF rainfall is low AND soil moisture is low THEN risk is low
    assign rule3_firing_strength = rain_low & soil_moisture_low;

    // Defuzzification (Weighted Average)
    assign numerator = rule1_firing_strength * 255 + rule2_firing_strength * 170 + rule3_firing_strength * 85;
    assign denominator = rule1_firing_strength + rule2_firing_strength + rule3_firing_strength;

    // Calculate risk (avoid division by zero)
    always @(*) begin
        if (denominator != 0)
            risk = numerator / denominator;
        else
            risk = 0; // Default value if no rules fire
    end

endmodule
