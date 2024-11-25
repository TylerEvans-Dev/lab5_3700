module lab5Tb();
 reg clk; 
 reg [3:0]bt = 0;
 reg bt2 = 1;
 reg [3:0]sw;
 wire [7:0]five;
 wire [7:0]numbs;
 wire [7:0]res;
 
 
 
 //adder object 
 AdderFSM ob1(.Clk(clk), .btn(bt), .btn2(bt2), .sw(sw), .five(five), .numbS(numbs), .res(res));
 
 
 reg w = 0;
 reg rst = 0;
 reg [3:0]data;
 wire [3:0]out;
 //register object
 R ob2(.data(data), .wr(w), .rst(rst), .clk(clk), .out(out));
 
 
 
 
 //ALU object
reg [3:0]l;
reg [3:0]r;
reg [1:0]op;
wire [3:0]oute; 
ALU ob3(.l(l), .r(r), .op(op), .out(oute));


//buffer object
reg [3:0]d;
reg b = 0;
wire [3:0]c;
buff ob4(.d(d), .b(b), .c(c));


 //this is the clock loop by default it will be there
 //to do the operations
 //this is alright. 
 initial begin
 clk = 0; 
 forever #1 clk = ~ clk;
end//end of forever loop

//start of test bench 
 initial begin 
 //test of write reg
 data[0] = 1;
 data[1] = 1;
 data[2] = 0;
 data[3] = 0;
 w = 1; 
 #10;
 $display("the expected value is is %d resulting value is %d", data, out);
 //test of clear reg
w = 0;
rst = 1;
#10;
$display("The expected value is 0 the actual value is %d", out);
//test of ALU for two functions 

//add
l = 1;
r = 1;
op = 0;
#2;
$display("The added value expected is 2 the result is %d", oute);

//xor
l = 5;
r = 5;
op = 2;
#2;
$display("the value will be 0 if equal %d", oute);


//test of the buff
d = 5;
//on
b = 1;
#2; 
$display("the expected value is %d and the result value is %d", d, c);
//off
b = 0;
#2;
$display("the expected value z(high impedence)  and the result is ", c);
//for testing the FSM I will be doing nine states and observe the output. 


//the opperations inside each module will be using the clk var
//but to contol the state manually I will be using the bt and bt2

//testing start 
sw = 2;
bt = 0;
#2;
$display("the expected state result is same %d", res);
//testing reset
bt2 = 1;
#2;
$display("the expected state is same from above %d", res);


//testing start once again. 
bt = 2;
#2;
$display("once again starting up testing it same %d", res);
//seeing result should be x based off of input x
bt= 3;
#2;
$display("once again starting up testing it diff %d", res);



end// end of test bench. 
endmodule 