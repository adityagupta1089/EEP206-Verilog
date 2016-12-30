module half_adder(x,y,z,d,b);

input x, y, z;
output d, b;

assign d = x^y^z;
assign b = ~(~x&y)&z;

endmodule

module half_adder_tb;

reg x,y,z;
wire d,b;

half_adder ha (.x (x),.y (y),.z (z),.d (d),.b (b));

initial begin
	$monitor ("x=%b, y=%b, z=%b, d=%b, b=%b",x,y,z,d,b);
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
x=0, y=0, z=0, d=0, b=0
x=0, y=0, z=1, d=1, b=1
x=0, y=1, z=0, d=1, b=0
x=0, y=1, z=1, d=0, b=0
x=1, y=0, z=0, d=1, b=0
x=1, y=0, z=1, d=0, b=1
x=1, y=1, z=0, d=0, b=0
x=1, y=1, z=1, d=1, b=1
*/
