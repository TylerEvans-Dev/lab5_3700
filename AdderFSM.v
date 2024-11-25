module AdderFSM(input Clk, input [3:0]btn, input btn2, input [3:0]sw, output [7:0]five, output [7:0]numbS, output [7:0]res);
	//this is the state number
	reg state = 0;
	//this is the output that will go into miniCom
	reg [4:0]out;
	reg n = 5;
	//this is the state number decider
	HexDecoder stDis(.numb(n), .HD(five));
	HexDecoder stnumb(.numb(state), .HD(numbS));
	reg [10:0]cmd;
	reg chosenOne = 3;
	
	miniCom ob2(.clk(Clk), .swin(sw), .command(cmd), .buffData(chosenOne), .HEX(res));
	
	//getting stuck on how the result will be displayed to
	//The display here
	
	//here is the logic for the button
	always@(btn,btn2) begin
//		if(btn == 0) begin
//			state = state + 1;
//		end
//		//this is the reset
//		if(btn2 == 0) begin
//			state = 0;
//		end
//		if(state > 9) begin
//			state = 0;
//		end
		state = btn;
	end // end of the always loop
	
	
	//FSM machine updated with the next clock edge. 
	always@(posedge Clk) begin
		
		
		if(state == 0) begin
		//reset all reg. 
		cmd[0] = 0;	//op0	operation 2
		cmd[1] = 0;	//op1 opreation 1
		cmd[2] = 1;	//r1 reset  reg1
		cmd[3] = 0;	//w1 write reg1
		cmd[4] = 1;	//r2 reset reg2
		cmd[5] = 0; //w2 write reg2
		cmd[6] = 1; //r0 reset rout
		cmd[7] = 0; //w0 write rout
		cmd[8] = 0; //b1 //buffer fsm
		cmd[9] = 0; //b2 buffer from the switch
		cmd[10] = 0; //b3 buffer from rout

		
		
		end // end of S0
		
		else if(state == 1) begin
		//put contents of 4 switchs into reg 1 use bin
		cmd[0] = 0;	//op0	operation 2
		cmd[1] = 0;	//op1 opreation 1
		cmd[2] = 0;	//r1 reset  reg1
		cmd[3] = 1;	//w1 write reg1
		cmd[4] = 0;	//r2 reset reg2
		cmd[5] = 0; //w2 write reg2
		cmd[6] = 0; //r0 reset rout
		cmd[7] = 0; //w0 write rout
		cmd[8] = 0; //b1 //buffer fsm
		cmd[9] = 1; //b2 buffer from the switch
		cmd[10] = 0; //b3 buffer from rout
		
		end // end of S1
		
		else if(state == 2) begin
		//put three into reg 2
		chosenOne = 3; // this is the choosen reg. 
		cmd[0] = 0;	//op0	operation 2
		cmd[1] = 0;	//op1 opreation 1
		cmd[2] = 0;	//r1 reset  reg1
		cmd[3] = 0;	//w1 write reg1
		cmd[4] = 0;	//r2 reset reg2
		cmd[5] = 1; //w2 write reg2
		cmd[6] = 0; //r0 reset rout
		cmd[7] = 0; //w0 write rout
		cmd[8] = 1; //b1 //buffer fsm
		cmd[9] = 0; //b2 buffer from the switch
		cmd[10] = 0; //b3 buffer from rout
		
		end // end of S2
		
		else if(state ==3) begin
		//add the two regs put into Rout
		cmd[0] = 0;	//op0	operation 2
		cmd[1] = 0;	//op1 opreation 1
		cmd[2] = 0;	//r1 reset  reg1
		cmd[3] = 0;	//w1 write reg1
		cmd[4] = 0;	//r2 reset reg2
		cmd[5] = 0; //w2 write reg2
		cmd[6] = 0; //r0 reset rout
		cmd[7] = 1; //w0 write rout
		cmd[8] = 0; //b1 //buffer fsm
		cmd[9] = 0; //b2 buffer from the switch
		cmd[10] = 0; //b3 buffer from rout
		end //end of s3
		
		else if(state ==4) begin
		//put Rout into R2
		cmd[0] = 0;	//op0	operation 2
		cmd[1] = 0;	//op1 opreation 1
		cmd[2] = 0;	//r1 reset  reg1
		cmd[3] = 0;	//w1 write reg1
		cmd[4] = 0;	//r2 reset reg2
		cmd[5] = 1; //w2 write reg2
		cmd[6] = 0; //r0 reset rout
		cmd[7] = 0; //w0 write rout
		cmd[8] = 0; //b1 //buffer fsm
		cmd[9] = 0; //b2 buffer from the switch
		cmd[10] = 1; //b3 buffer from rout
	
		
		end //end of s4
		
		else if(state ==5) begin
		//or R1 and R2 put into Rout
		cmd[0] = 1;	//op0	operation 2
		cmd[1] = 0;	//op1 opreation 1
		cmd[2] = 0;	//r1 reset  reg1
		cmd[3] = 0;	//w1 write reg1
		cmd[4] = 0;	//r2 reset reg2
		cmd[5] = 0; //w2 write reg2
		cmd[6] = 0; //r0 reset rout
		cmd[7] = 1; //w0 write rout
		cmd[8] = 0; //b1 //buffer fsm
		cmd[9] = 0; //b2 buffer from the switch
		cmd[10] = 0; //b3 buffer from rout
		end //end of s5
		
		else if(state ==6) begin
		//put Rout into R1
		cmd[0] = 0;	//op0	operation 2
		cmd[1] = 0;	//op1 opreation 1
		cmd[2] = 0;	//r1 reset  reg1
		cmd[3] = 1;	//w1 write reg1
		cmd[4] = 0;	//r2 reset reg2
		cmd[5] = 0; //w2 write reg2
		cmd[6] = 0; //r0 reset rout
		cmd[7] = 0; //w0 write rout
		cmd[8] = 0; //b1 //buffer fsm
		cmd[9] = 0; //b2 buffer from the switch
		cmd[10] = 1; //b3 buffer from rout
		end //end of s6
		
		else if(state ==7) begin
		 //put the not R1 into Rout
		cmd[0] = 1;	//op0	operation 2
		cmd[1] = 1;	//op1 opreation 1
		cmd[2] = 0;	//r1 reset  reg1
		cmd[3] = 0;	//w1 write reg1
		cmd[4] = 0;	//r2 reset reg2
		cmd[5] = 0; //w2 write reg2
		cmd[6] = 0; //r0 reset rout
		cmd[7] = 1; //w0 write rout
		cmd[8] = 0; //b1 //buffer fsm
		cmd[9] = 0; //b2 buffer from the switch
		cmd[10] = 0; //b3 buffer from rout
		end //end of s7
		
		else if(state ==8) begin
		//put Rout into R1
		cmd[0] = 0;	//op0	operation 2
		cmd[1] = 0;	//op1 opreation 1
		cmd[2] = 0;	//r1 reset  reg1
		cmd[3] = 1;	//w1 write reg1
		cmd[4] = 0;	//r2 reset reg2
		cmd[5] = 0; //w2 write reg2
		cmd[6] = 0; //r0 reset rout
		cmd[7] = 0; //w0 write rout
		cmd[8] = 0; //b1 //buffer fsm
		cmd[9] = 0; //b2 buffer from the switch
		cmd[10] = 1; //b3 buffer from rout
		end //end of s8
		
		else begin
		//Xor R1 and R2 put into Rout. 
		cmd[0] = 0;	//op0	operation 2
		cmd[1] = 1;	//op1 opreation 1
		cmd[2] = 0;	//r1 reset  reg1
		cmd[3] = 0;	//w1 write reg1
		cmd[4] = 0;	//r2 reset reg2
		cmd[5] = 0; //w2 write reg2
		cmd[6] = 0; //r0 reset rout
		cmd[7] = 1; //w0 write rout
		cmd[8] = 0; //b1 //buffer fsm
		cmd[9] = 0; //b2 buffer from the switch
		cmd[10] = 0; //b3 buffer from rout
		
		end //end of s9
		
		
	
	end// end of the clock always loop
	
endmodule 