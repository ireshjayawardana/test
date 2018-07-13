module mux8(clk,selAD,tx_ad,rx_ad,m_ad,address,TX_data,RX_data,data_inR,data_outR,data_inM,data_outM,wren_R,wren_M,tx_en,rx_en);
input [14:0]tx_ad,rx_ad,m_ad;
output reg [14:0]address;
output reg [1:0]selAD;

input [7:0]RX_data,data_outR,data_outM;
output reg [7:0]TX_data,data_inR,data_inM;
output reg wren_R;
input tx_en,rx_en;
input clk,wren_M;
always @(posedge clk)
begin
	selAD={tx_en,rx_en};
	case (tx_en)
		1'b0 : data_inM <= data_outR;
		1'b1 : TX_data <= data_outR;
		endcase
	case (rx_en)
		1'b0 : data_inR <= data_outM;
		1'b1 : data_inR <= RX_data;
		endcase
	case (selAD)
		2'b00 : address <= m_ad;
		2'b10 : address <= tx_ad;
		2'b01 : address <= rx_ad;
		2'b11 : address <= m_ad;
		endcase
	if ((tx_en==1)&(rx_en==1))
		wren_R=wren_M;
	if ((rx_en==0)&(tx_en==0))
		wren_R=wren_M;
	if ((rx_en==0)&(tx_en==1))
		wren_R=0;
	if ((rx_en==1)&(tx_en==0))
		wren_R=1;

		
end
endmodule
