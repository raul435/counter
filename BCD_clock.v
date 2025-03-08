module BCD_clock#(parameter N = 4)(

	input clk, rst, enable, boton_decrese, carga,
	input [3:0] data_in,
	output [0:6] seg_out

	);

// variables auxiliares
wire clk_s, enable_out, rst_out;
wire [N-1:0]seg;




//divido el reloj en segundos
clkdiv #(.CONST_N(50000000))div_seg(clk, rst, clk_s);

//contador de hasta 15 en hexadeciamal
counter #(.N(N)) contador (
.clk(clk_s),
.rst(rst),
.decrese(boton_decrese),
.carga(carga),
.enable(enable),
.limit(16),
.data_in(data_in),
.count(seg)
);





//decodificador de 7 segmentos
decoder_7_seg decodificador1 (.decoder_in(seg), .decoder_out(seg_out));




endmodule


