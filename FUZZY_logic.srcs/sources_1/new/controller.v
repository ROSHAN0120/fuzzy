
module controller(
    input  clk,rst_n,
    input wire [7:0] data_bus,    // 8-bit input for soil moisture (0 to 100)
    input ss,
    output ef1,
    output rain_w,
    output soil_w
    );
    
    reg [7:0]r1;
    reg [7:0]r2;
    reg [3:0]count;
    reg efr;
 
    
    always @(posedge clk) begin    
        if(!rst_n)begin
            r1<=0;
            r2<=0;
            count =4'b0000;
        end
        else begin
            
            case(ss)
                1'b0:begin
                     r1 <= data_bus ;  
                     count = count+4'b0001;
                     $display("%0t\t%d\t%d", $time,r1,count);
                     end
                1'b1:begin
                     r2 <= data_bus;
                     count = count+4'b0001;
                      $display("%0t\t%d\t%d", $time,r2,count);
                     end
            endcase
            
            if(count == 4'b0010)begin
                if (r1 !=0 && r2!=0)begin
                    efr<=1;        
                end
                  count =0; 
            end else begin
                efr<=0;  
                count = count;          
            end
        end 
       $display("efr :\t%d",efr);     
    end
   assign ef1 = efr;
   assign rain_w = r1;
   assign soil_w = r2;
   
    
endmodule
