module full_adder(x,y,z,s,c);

input x, y, z;
output s, c;

assign s = x^y^z;
assign c = (x&y)|(y&z)|(z&x);

endmodule

module full_adder_tb;

reg x,y,z;
wire s,c;

full_adder fa (.x (x),.y (y),.z (z),.s (s),.c (c));

initial begin
	$monitor ("x=%b, y=%b, z=%b, s=%b, c=%b",x,y,z,s,c);
	x=0; y=0; z=0;
	#5 x=0; y=0; z=1;
	#5 x=0; y=1; z=0;
	#5 x=0; y=1; z=1;
	#5 x=1; y=0; z=0;
	#5 x=1; y=0; z=1;
	#5 x=1; y=1; z=0;
	#5 x=1; y=1; z=1;
	#5 $finish;
end

endmodule

/*Output:
x=0, y=0, z=0, s=0, c=0
x=0, y=0, z=1, s=1, c=0
x=0, y=1, z=0, s=1, c=0
x=0, y=1, z=1, s=0, c=1
x=1, y=0, z=0, s=1, c=0
x=1, y=0, z=1, s=0, c=1
x=1, y=1, z=0, s=0, c=1
x=1, y=1, z=1, s=1, c=1
*/
