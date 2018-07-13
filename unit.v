module unit(tx_dv,data,tx_done,tx_en);
output reg [7:0]data;
output reg tx_dv;
input tx_done;
input tx_en;
initial begin
	tx_dv=0;
	
	end
	
always @(tx_en)
	begin
		tx_dv=~tx_en;
		data=8'b01100001 ;
	end
endmodule 