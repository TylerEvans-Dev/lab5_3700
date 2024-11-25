module R(input [3:0]data, input wr, input rst, input clk, output reg [3:0]out);

	always@(posedge rst, posedge wr, posedge clk) begin
		if(rst == 1) begin
			out[0] = 0;
			out[1] = 0;
			out[2] = 0;
			out[3] = 0;
		end //end of r
		
		
		if(wr == 1) begin
			out[0] = data[0];
			out[1] = data[1];
			out[2] = data[2];
			out[3] = data[3];
		end // end of w if
			

	end //always end
endmodule 