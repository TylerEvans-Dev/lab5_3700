module miniCom(input clk, input [3:0] swin, input [10:0]command, input [3:0]buffData, output [7:0]HEX);

//opperation command

	wire op = command[0];
	wire op1 = command[1];
	//reg 1 commands
	wire r1 = command[2];
	wire w1 = command[3];
	//reg 2 commands
	wire r2 = command[4];
	wire w2 = command[5];
	//reg out commands
	wire r0 = command[6];
	wire w0 = command[7];
	//buffer control. 
	wire b1 = command[8];
	wire b2 = command[9];
	wire b3 = command[10];
	
wire [3:0]bus;
wire [3:0]reg1;
wire [3:0]reg2;
wire [3:0]routW;
wire [3:0]ALUout;

//reg 1
R re1(.data(bus), .wr(w1), .rst(r1), .clk(clk), .out(reg1));

//reg 2
R re2(.data(bus), .wr(w2), .rst(r2), .clk(clk), .out(reg2));

//ALU setup 
//is this the outputs?

ALU ob(.l(reg1), .r(reg2), .op(command[1:0]), .out(ALUout));

//rout
R rout(.data(ALUout), .wr(w0), .rst(r0), .clk(clk), .out(routW));


//buffer 1
buff b1b( .d(buffData), .b(b1), .c(bus));

//buffer 2
buff b2b( .d(swin), .b(b2), .c(bus));

//buffer 3
buff b3b( .d(routW), .b(b3), .c(bus));

HexDecoder h1(.numb(ALUout), .HD(HEX));


endmodule 