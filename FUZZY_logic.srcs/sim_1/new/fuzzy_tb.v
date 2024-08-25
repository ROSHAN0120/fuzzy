module tb_simple_fuzzy_logic;

    // Testbench signals
    reg [7:0] rain_fall;
    reg [7:0] soil_moisture;
    wire [7:0] risk;

    // Instantiate the DUT (Device Under Test)
    simple_fuzzy_logic dut (
        .rain_fall(rain_fall),
        .soil_moisture(soil_moisture),
        .risk(risk)
    );

    // Test procedure
    initial begin
        // Display the header
        $display("Time\tRainfall\tSoil Moisture\tRisk");

        // Test Case 1: Low rainfall, low soil moisture
        rain_fall = 10;
        soil_moisture = 10;
        #10;
        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

        // Test Case 2: Medium rainfall, medium soil moisture
        rain_fall = 50;
        soil_moisture = 50;
        #10;
        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

        // Test Case 3: High rainfall, high soil moisture
        rain_fall = 80;
        soil_moisture = 80;
        #10;
        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

        // Test Case 4: Low rainfall, high soil moisture
        rain_fall = 20;
        soil_moisture = 80;
        #10;
        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

        // Test Case 5: High rainfall, low soil moisture
        rain_fall = 80;
        soil_moisture = 20;
        #10;
        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

        // Test Case 6: Extreme values
        rain_fall = 100;
        soil_moisture = 100;
        #10;
        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

        // Test Case 7: Edge case with no rainfall and no soil moisture
        rain_fall = 0;
        soil_moisture = 0;
        #10;
        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

        // End simulation
        $stop;
    end

endmodule
