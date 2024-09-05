
module tb_simple_fuzzy_logic;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg ss;
    reg [7:0] data_bus;
    wire [7:0] risk;

    top dut(   
     .clk(clk),
     .rst_n(rst_n),
     .ss(ss),
     .data_bus(data_bus),     
     .risk(risk)           
    );

    initial begin 
         clk=0;
        forever #5 clk=~clk;    
    end
  
    initial begin
  
        rst_n = 0;
        #20
        
        rst_n = 1;
      
        #10; ss = 0;
        data_bus = 80;
        #30;
        
        #10;ss = 1; 
        data_bus = 80;
        #100;
        
         rst_n = 0;
        #20
        
        rst_n = 1;
        
         #10; ss = 0;
        data_bus = 10;
        #30;
        
        #10;ss = 1; 
        data_bus = 10;
        #100;
        
           #10; ss = 0;
        data_bus = 50;
        #30;
        
        #10;ss = 1; 
        data_bus = 50;
        #100;

        $stop;
    end

endmodule
