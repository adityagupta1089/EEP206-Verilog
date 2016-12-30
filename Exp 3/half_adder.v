module half_adder(x,y,s,c);

input x, y;
output s, c;

assign s = x ^ y;
assign c = x & y;

endmodule

module half_adder_tb;

reg x,y;
wire s,c;

half_adder ha (.x (x),.y (y),.s (s),.c (c));

initial begin
	$monitor ("x=%b, y=%b, s=%b, c=%b",x,y,s,c);
	x=0; y=0;
	#5 x=0; y=1;
	#5 x=1; y=0;
	#5 x=1; y=1;
	#5 $finish;
end

endmodule

/*Output:
x=0, y=0, s=0, c=0
x=0, y=1, s=1, c=0
x=1, y=0, s=1, c=0
x=1, y=1, s=0, c=1*/
