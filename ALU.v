module ALU(input [3:0]l, input [3:0]r, input [1:0]op, output reg [3:0]out);

	reg [3:0]addD;
	reg [3:0]orD;
	reg [3:0]xorD;
	reg [3:0]nD;

	always@(l, r, op) begin
	
	
		//ADD operation
		if(op == 0) begin
			out = l+r;
			
		end // end of ADD
		
		
		// OR operation
		else if(op == 1) begin
			orD =  l |  r;
				out = orD;
				
		end //end of OR
		
		
		//XOR operation
		else if(op == 2) begin
			xorD =  l ^ r;
			out = xorD;
		end // end of XOR
		
		
		//NOT of left side operation
		else if(op == 3) begin
			nD = ~l;
			out = nD;
		end //end of not
		
		//NOT of right side/
		else begin
			nD = ~r;
			out = nD;
		end // end 
		
	end//end of always for l and 
endmodule 