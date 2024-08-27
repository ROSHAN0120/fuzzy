
module tb_simple_fuzzy_logic;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg ss;
    reg [7:0] data_bus;
//    reg [7:0] soil_moisture;
//    wire ef;
    wire [7:0] risk;

    // Instantiate the DUT (Device Under Test)
    top dut(   
     .clk(clk),
     .rst_n(rst_n),
     .ss(ss),
     .data_bus(data_bus),     
     .risk(risk)           // 8-bit output risk (0 to 255)
    );

    // Test procedure
    initial begin 
         clk=0;
        forever #5 clk=~clk;    
    end
  
    initial begin
  
        rst_n = 0;
        #20
        
        rst_n = 1;
        // Display the header
//        $display("Time\tRainfall\tSoil Moisture\tRisk");

        // Test Case 1: Low rainfall, low soil moisture
        data_bus = 10;
         ss = 0;#20;
        data_bus = 20;
        
        #20;ss = 1;
        #100;
        //#10;
//        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

        // Test Case 2: Medium rainfall, medium soil moisture
//        rain_fall = 50;
//        soil_moisture = 50;
//        ss = 0;#10;
//        ss = 1;#10;
//        #10;
//        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

//        // Test Case 3: High rainfall, high soil moisture
//        rain_fall = 80;
//        soil_moisture = 80;
//         ss = 0;#10;
//        ss = 1;#10;
//        #10;
//        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

//        // Test Case 4: Low rainfall, high soil moisture
//        rain_fall = 20;
//        soil_moisture = 80;
//         ss = 0;#10;
//        ss = 1;#10;
//        #10;
//        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

//        // Test Case 5: High rainfall, low soil moisture
//        rain_fall = 80;
//        soil_moisture = 20;
//         ss = 0;#10;
//        ss = 1;#10;
//        #10;
//        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

//        // Test Case 6: Extreme values
//        rain_fall = 100;
//        soil_moisture = 100;
//         ss = 0;#10;
//        ss = 1;#10;
//        #10;
//        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

//        // Test Case 7: Edge case with no rainfall and no soil moisture
//        rain_fall = 0;
//        soil_moisture = 0;
//         ss = 0;#10;
//        ss = 1;#10;
//        #10;
//        $display("%0t\t%d\t\t%d\t\t%d", $time, rain_fall, soil_moisture, risk);

        // End simulation
        $stop;
    end

endmodule
