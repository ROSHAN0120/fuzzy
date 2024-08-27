`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 17:33:00
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(   
    input  clk,rst_n,ss,
    input wire [7:0] data_bus,     
    output wire [7:0] risk          // 8-bit output risk (0 to 255)
    );
    
 controller controller (
        .clk(clk),
        .rst_n(rst_n),
        .data_bus(data_bus),
        .ss(ss),
        .ef1(ef),
        .rain_w(rain),
        .soil_w(soil)
    );    

fuzzy fuzzy(
    .clk(clk),
    .rst_n(rst_n),
    .ef(ef1),
    .rain(rain_w),
    .soil(soil_w),
    .risk(risk)           // 8-bit output risk (0 to 255)
    );
endmodule
