`timescale 1ns / 1ps
module BCD_clock_tb ();

reg clk, rst, enable, boton_decrese, carga;
reg [3:0] data_in;
wire [0:6] seg_out;

BDC_clock DUT (clk, rst, enable, boton_decrese, carga, data_in, seg_out);

initial begin
   clk = 0;
   forever #10 clk = ~clk; // Alterna el reloj cada 10 ns
end

initial begin
    clk = 0;
	 rst = 0;
	 enable = 0;
    boton_decrese = 0;
    carga = 0;
    data_in = 4'b0000;

    #100 rst = 1;
    #100 rst = 0;
    #100 enable = 1;
    #100 boton_decrese = 1;
    #100 boton_decrese = 0;
    #100 carga = 1;
    #100 carga = 0;
    #100 data_in = 4'b0001;
    #100 data_in = 4'b0010;
    #100 data_in = 4'b0011;
    #100 data_in = 4'b0100;
    #100 data_in = 4'b0101;
    #100 data_in = 4'b0110;
    #100 data_in = 4'b0111;
    #100 data_in = 4'b1000;
    #100 data_in = 4'b1001;
    #100 data_in = 4'b1010;
    #100 data_in = 4'b1011;
    #100 data_in = 4'b1100;
    #100 data_in = 4'b1101;
    #100 data_in = 4'b1110;
    #100 data_in = 4'b1111;
    #100 $finish;
end

endmodule