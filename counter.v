module counter#(parameter N = 4)(
	input clk, rst, enable, decrese, carga,
	input [N-1:0] limit, data_in,
	output reg [N-1:0] count
	);
	
/*log function*/
function integer ceillog2;
	input integer data;
	integer i, result;
	begin
		for (i=0; 2**i < data; i=i+1)
			result = i + 1;
		ceillog2 = result;
	end
endfunction
	

always @(posedge clk, posedge rst)
	begin
		if(rst == 1)
			count <= 4'b0000;
		else if(carga == 1)
			count <= data_in;
		else if(enable==1 && decrese==1)
			count <= count-1;
		else if(enable==1 && decrese==0)
			count <= count+1;
		else if (count == limit)
			count <= 4'b0000;
		else
			count <= count;
	end
	
endmodule