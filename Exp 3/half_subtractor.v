module half_subtractor(x,y,d,b);

input x, y;
wire not_a;
output d, b;

assign d = x ^ y;
assign b = ~x & y;

endmodule

module half_subtractor_tb;

reg x,y;
wire d,b;

half_subtractor hs (.x (x),.y (y),.d (d),.b (b));

initial begin
	$monitor ("x=%b, y=%b, d=%b, b=%b",x,y,d,b);
	x=0; y=0;
	#5 x=0; y=1;
	#5 x=1; y=0;
	#5 x=1; y=1;
	#5 $finish;
end

endmodule

/*Output:
x=0, y=0, d=0, b=0
x=0, y=1, d=1, b=1
x=1, y=0, d=1, b=0
x=1, y=1, d=0, b=0*/
