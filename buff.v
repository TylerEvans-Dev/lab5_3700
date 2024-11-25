module buff(input [3:0]d, input b, inout [3:0]c);

//always @(*) begin
//		if(b == 1) begin
//			c[0] = d[0];
//			c[1] = d[1];
//			c[2] = d[2];
//			c[3] = d[3];    
//		end // end of if b is turned on
//		
//		else begin
//		//this is how you put z; 
//		c[0] = 1'bz;
//		c[1] = 1'bz;
//		c[2] = 1'bz;
//		c[3] = 1'bz;
//
//		end // end of if b == 0
		
		assign c =(b==1)? d : 4'bz;
		
//end //always end block
endmodule 