module BCD_clock_tb;

	reg enable;
   reg clk;
   reg rst;
   wire [0:6] seg_out;

   
    BCD_clock uut (
		  .enable(enable),
        .clk(clk),
        .rst(rst),
        .seg_out(seg_out)
    );


    always #10 clk = ~clk;

    initial begin
 
        clk = 0;
        rst = 1;
		  enable = 1;
        
 
        #50 rst = 0;
        
    end

    initial begin
        forever begin
            #100; 
            $display("seg_out = %b", seg_out);
        end
    end
    
endmodule
