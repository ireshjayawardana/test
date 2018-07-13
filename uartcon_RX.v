module rx_con(clk,rx_dv,w_address,outledRX,en_rx);
input clk;
input rx_dv;
input en_rx;
output reg [14:0]w_address=11111111111111;

output reg outledRX=1;
initial begin
	w_address=0;
end
//always@(negedge clk)
//begin 
//	if (en_rx==0)		//RESET
//		w_address=0;
//end
always@(posedge rx_dv) begin
	w_address=w_address+1;
	if (w_address==15'b1000000000000000)
		outledRX=0;
	else
		outledRX=1;
end
endmodule 