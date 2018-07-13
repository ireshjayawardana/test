module tx_con(clk,tx_dv,r_address,tx_done,en_tx,outledTX);
input clk;
input en_tx;
output reg tx_dv=0;
output reg outledTX=1;
input tx_done;
output reg [14:0]r_address;

initial
begin
	tx_dv=0;
	r_address=0;
end
always @(posedge clk)
begin 
	if (en_tx==1) begin 		//change
	tx_dv=1;
	end
	
	
end
always@(posedge tx_done)
begin
	r_address=r_address+1;
	if (en_tx==0)
		r_address=0;
end
endmodule 