module full_adder (a,b,cin,s,cout);
  input a,b,cin;
  output s,cout;
  assign s=a^b^cin;
  assign cout=(a&b)|(b&cin)|(cin&a);
endmodule // full_adder
module four_bit_ripple_adder (a,b,sum,cout);
  input [3:0] a,b;
  wire [2:0] c;
  output [3:0] sum;
  output cout;
  full_adder fa1(a[0],b[0],0,sum[0],c[0]);
  full_adder fa2(a[1],b[1],c[0],sum[1],c[1]);
  full_adder fa3(a[2],b[2],c[1],sum[2],c[2]);
  full_adder fa4(a[3],b[3],c[2],sum[3],cout);
endmodule // 4_bit_ripple_adder
module multiplier(a,b,mul);
	input [2:0] a;
	input [3:0] b;
	
	wire [3:0] x;
	wire [3:0] y;
	wire [3:0] z;
	wire w;
	
	wire [3:0] x2;
	wire [3:0] y2;
	wire [3:0] z2;
	wire w2;
	
	output [6:0] mul;
	
	assign mul[0]=a[0]&b[0];
	
	assign x[0]=b[1]&a[0];
	assign x[1]=b[2]&a[0];
	assign x[2]=b[3]&a[0];
	assign x[3]=0;
	
	assign y[0]=b[0]&a[1];
	assign y[1]=b[1]&a[1];
	assign y[2]=b[2]&a[1];
	assign y[3]=b[3]&a[1];	
	
	four_bit_ripple_adder fbra1 (x,y,z,w);	
	assign mul[1]=z[0];
	
	assign x2[0]=z[1];
	assign x2[1]=z[2];
	assign x2[2]=z[3];
	assign x2[3]=w;
	
	assign y2[0]=b[0]&a[2];
	assign y2[1]=b[1]&a[2];
	assign y2[2]=b[2]&a[2];
	assign y2[3]=b[3]&a[2];	
	
	four_bit_ripple_adder fbra2 (x2,y2,z2,w2);	
	assign mul[2]=z2[0];
	assign mul[3]=z2[1];
	assign mul[4]=z2[2];
	assign mul[5]=z2[3];
	assign mul[6]=w2;
		
endmodule // multiplier
module multiplier_tb;

reg [2:0] a;
reg [3:0] b;
wire [6:0] ab;

	multiplier mr(a,b,ab);

initial begin
	$monitor ("a=%b(%d), b=%b(%d), axb=%b(%d)",a,a,b,b,ab,ab);
   a=3'b000; b=4'b0000;
#5 a=3'b000; b=4'b0001;
#5 a=3'b000; b=4'b0010;
#5 a=3'b000; b=4'b0011;
#5 a=3'b000; b=4'b0100;
#5 a=3'b000; b=4'b0101;
#5 a=3'b000; b=4'b0110;
#5 a=3'b000; b=4'b0111;
#5 a=3'b000; b=4'b1000;
#5 a=3'b000; b=4'b1001;
#5 a=3'b000; b=4'b1010;
#5 a=3'b000; b=4'b1011;
#5 a=3'b000; b=4'b1100;
#5 a=3'b000; b=4'b1101;
#5 a=3'b000; b=4'b1110;
#5 a=3'b000; b=4'b1111;
#5 a=3'b001; b=4'b0000;
#5 a=3'b001; b=4'b0001;
#5 a=3'b001; b=4'b0010;
#5 a=3'b001; b=4'b0011;
#5 a=3'b001; b=4'b0100;
#5 a=3'b001; b=4'b0101;
#5 a=3'b001; b=4'b0110;
#5 a=3'b001; b=4'b0111;
#5 a=3'b001; b=4'b1000;
#5 a=3'b001; b=4'b1001;
#5 a=3'b001; b=4'b1010;
#5 a=3'b001; b=4'b1011;
#5 a=3'b001; b=4'b1100;
#5 a=3'b001; b=4'b1101;
#5 a=3'b001; b=4'b1110;
#5 a=3'b001; b=4'b1111;
#5 a=3'b010; b=4'b0000;
#5 a=3'b010; b=4'b0001;
#5 a=3'b010; b=4'b0010;
#5 a=3'b010; b=4'b0011;
#5 a=3'b010; b=4'b0100;
#5 a=3'b010; b=4'b0101;
#5 a=3'b010; b=4'b0110;
#5 a=3'b010; b=4'b0111;
#5 a=3'b010; b=4'b1000;
#5 a=3'b010; b=4'b1001;
#5 a=3'b010; b=4'b1010;
#5 a=3'b010; b=4'b1011;
#5 a=3'b010; b=4'b1100;
#5 a=3'b010; b=4'b1101;
#5 a=3'b010; b=4'b1110;
#5 a=3'b010; b=4'b1111;
#5 a=3'b011; b=4'b0000;
#5 a=3'b011; b=4'b0001;
#5 a=3'b011; b=4'b0010;
#5 a=3'b011; b=4'b0011;
#5 a=3'b011; b=4'b0100;
#5 a=3'b011; b=4'b0101;
#5 a=3'b011; b=4'b0110;
#5 a=3'b011; b=4'b0111;
#5 a=3'b011; b=4'b1000;
#5 a=3'b011; b=4'b1001;
#5 a=3'b011; b=4'b1010;
#5 a=3'b011; b=4'b1011;
#5 a=3'b011; b=4'b1100;
#5 a=3'b011; b=4'b1101;
#5 a=3'b011; b=4'b1110;
#5 a=3'b011; b=4'b1111;
#5 a=3'b100; b=4'b0000;
#5 a=3'b100; b=4'b0001;
#5 a=3'b100; b=4'b0010;
#5 a=3'b100; b=4'b0011;
#5 a=3'b100; b=4'b0100;
#5 a=3'b100; b=4'b0101;
#5 a=3'b100; b=4'b0110;
#5 a=3'b100; b=4'b0111;
#5 a=3'b100; b=4'b1000;
#5 a=3'b100; b=4'b1001;
#5 a=3'b100; b=4'b1010;
#5 a=3'b100; b=4'b1011;
#5 a=3'b100; b=4'b1100;
#5 a=3'b100; b=4'b1101;
#5 a=3'b100; b=4'b1110;
#5 a=3'b100; b=4'b1111;
#5 a=3'b101; b=4'b0000;
#5 a=3'b101; b=4'b0001;
#5 a=3'b101; b=4'b0010;
#5 a=3'b101; b=4'b0011;
#5 a=3'b101; b=4'b0100;
#5 a=3'b101; b=4'b0101;
#5 a=3'b101; b=4'b0110;
#5 a=3'b101; b=4'b0111;
#5 a=3'b101; b=4'b1000;
#5 a=3'b101; b=4'b1001;
#5 a=3'b101; b=4'b1010;
#5 a=3'b101; b=4'b1011;
#5 a=3'b101; b=4'b1100;
#5 a=3'b101; b=4'b1101;
#5 a=3'b101; b=4'b1110;
#5 a=3'b101; b=4'b1111;
#5 a=3'b110; b=4'b0000;
#5 a=3'b110; b=4'b0001;
#5 a=3'b110; b=4'b0010;
#5 a=3'b110; b=4'b0011;
#5 a=3'b110; b=4'b0100;
#5 a=3'b110; b=4'b0101;
#5 a=3'b110; b=4'b0110;
#5 a=3'b110; b=4'b0111;
#5 a=3'b110; b=4'b1000;
#5 a=3'b110; b=4'b1001;
#5 a=3'b110; b=4'b1010;
#5 a=3'b110; b=4'b1011;
#5 a=3'b110; b=4'b1100;
#5 a=3'b110; b=4'b1101;
#5 a=3'b110; b=4'b1110;
#5 a=3'b110; b=4'b1111;
#5 a=3'b111; b=4'b0000;
#5 a=3'b111; b=4'b0001;
#5 a=3'b111; b=4'b0010;
#5 a=3'b111; b=4'b0011;
#5 a=3'b111; b=4'b0100;
#5 a=3'b111; b=4'b0101;
#5 a=3'b111; b=4'b0110;
#5 a=3'b111; b=4'b0111;
#5 a=3'b111; b=4'b1000;
#5 a=3'b111; b=4'b1001;
#5 a=3'b111; b=4'b1010;
#5 a=3'b111; b=4'b1011;
#5 a=3'b111; b=4'b1100;
#5 a=3'b111; b=4'b1101;
#5 a=3'b111; b=4'b1110;
#5 a=3'b111; b=4'b1111;
	$finish;
end

endmodule //multiplierr_tb
/*Output:
a=000(0), b=0000( 0), axb=0000000(  0)
a=000(0), b=0001( 1), axb=0000000(  0)
a=000(0), b=0010( 2), axb=0000000(  0)
a=000(0), b=0011( 3), axb=0000000(  0)
a=000(0), b=0100( 4), axb=0000000(  0)
a=000(0), b=0101( 5), axb=0000000(  0)
a=000(0), b=0110( 6), axb=0000000(  0)
a=000(0), b=0111( 7), axb=0000000(  0)
a=000(0), b=1000( 8), axb=0000000(  0)
a=000(0), b=1001( 9), axb=0000000(  0)
a=000(0), b=1010(10), axb=0000000(  0)
a=000(0), b=1011(11), axb=0000000(  0)
a=000(0), b=1100(12), axb=0000000(  0)
a=000(0), b=1101(13), axb=0000000(  0)
a=000(0), b=1110(14), axb=0000000(  0)
a=000(0), b=1111(15), axb=0000000(  0)
a=001(1), b=0000( 0), axb=0000000(  0)
a=001(1), b=0001( 1), axb=0000001(  1)
a=001(1), b=0010( 2), axb=0000010(  2)
a=001(1), b=0011( 3), axb=0000011(  3)
a=001(1), b=0100( 4), axb=0000100(  4)
a=001(1), b=0101( 5), axb=0000101(  5)
a=001(1), b=0110( 6), axb=0000110(  6)
a=001(1), b=0111( 7), axb=0000111(  7)
a=001(1), b=1000( 8), axb=0001000(  8)
a=001(1), b=1001( 9), axb=0001001(  9)
a=001(1), b=1010(10), axb=0001010( 10)
a=001(1), b=1011(11), axb=0001011( 11)
a=001(1), b=1100(12), axb=0001100( 12)
a=001(1), b=1101(13), axb=0001101( 13)
a=001(1), b=1110(14), axb=0001110( 14)
a=001(1), b=1111(15), axb=0001111( 15)
a=010(2), b=0000( 0), axb=0000000(  0)
a=010(2), b=0001( 1), axb=0000010(  2)
a=010(2), b=0010( 2), axb=0000100(  4)
a=010(2), b=0011( 3), axb=0000110(  6)
a=010(2), b=0100( 4), axb=0001000(  8)
a=010(2), b=0101( 5), axb=0001010( 10)
a=010(2), b=0110( 6), axb=0001100( 12)
a=010(2), b=0111( 7), axb=0001110( 14)
a=010(2), b=1000( 8), axb=0010000( 16)
a=010(2), b=1001( 9), axb=0010010( 18)
a=010(2), b=1010(10), axb=0010100( 20)
a=010(2), b=1011(11), axb=0010110( 22)
a=010(2), b=1100(12), axb=0011000( 24)
a=010(2), b=1101(13), axb=0011010( 26)
a=010(2), b=1110(14), axb=0011100( 28)
a=010(2), b=1111(15), axb=0011110( 30)
a=011(3), b=0000( 0), axb=0000000(  0)
a=011(3), b=0001( 1), axb=0000011(  3)
a=011(3), b=0010( 2), axb=0000110(  6)
a=011(3), b=0011( 3), axb=0001001(  9)
a=011(3), b=0100( 4), axb=0001100( 12)
a=011(3), b=0101( 5), axb=0001111( 15)
a=011(3), b=0110( 6), axb=0010010( 18)
a=011(3), b=0111( 7), axb=0010101( 21)
a=011(3), b=1000( 8), axb=0011000( 24)
a=011(3), b=1001( 9), axb=0011011( 27)
a=011(3), b=1010(10), axb=0011110( 30)
a=011(3), b=1011(11), axb=0100001( 33)
a=011(3), b=1100(12), axb=0100100( 36)
a=011(3), b=1101(13), axb=0100111( 39)
a=011(3), b=1110(14), axb=0101010( 42)
a=011(3), b=1111(15), axb=0101101( 45)
a=100(4), b=0000( 0), axb=0000000(  0)
a=100(4), b=0001( 1), axb=0000100(  4)
a=100(4), b=0010( 2), axb=0001000(  8)
a=100(4), b=0011( 3), axb=0001100( 12)
a=100(4), b=0100( 4), axb=0010000( 16)
a=100(4), b=0101( 5), axb=0010100( 20)
a=100(4), b=0110( 6), axb=0011000( 24)
a=100(4), b=0111( 7), axb=0011100( 28)
a=100(4), b=1000( 8), axb=0100000( 32)
a=100(4), b=1001( 9), axb=0100100( 36)
a=100(4), b=1010(10), axb=0101000( 40)
a=100(4), b=1011(11), axb=0101100( 44)
a=100(4), b=1100(12), axb=0110000( 48)
a=100(4), b=1101(13), axb=0110100( 52)
a=100(4), b=1110(14), axb=0111000( 56)
a=100(4), b=1111(15), axb=0111100( 60)
a=101(5), b=0000( 0), axb=0000000(  0)
a=101(5), b=0001( 1), axb=0000101(  5)
a=101(5), b=0010( 2), axb=0001010( 10)
a=101(5), b=0011( 3), axb=0001111( 15)
a=101(5), b=0100( 4), axb=0010100( 20)
a=101(5), b=0101( 5), axb=0011001( 25)
a=101(5), b=0110( 6), axb=0011110( 30)
a=101(5), b=0111( 7), axb=0100011( 35)
a=101(5), b=1000( 8), axb=0101000( 40)
a=101(5), b=1001( 9), axb=0101101( 45)
a=101(5), b=1010(10), axb=0110010( 50)
a=101(5), b=1011(11), axb=0110111( 55)
a=101(5), b=1100(12), axb=0111100( 60)
a=101(5), b=1101(13), axb=1000001( 65)
a=101(5), b=1110(14), axb=1000110( 70)
a=101(5), b=1111(15), axb=1001011( 75)
a=110(6), b=0000( 0), axb=0000000(  0)
a=110(6), b=0001( 1), axb=0000110(  6)
a=110(6), b=0010( 2), axb=0001100( 12)
a=110(6), b=0011( 3), axb=0010010( 18)
a=110(6), b=0100( 4), axb=0011000( 24)
a=110(6), b=0101( 5), axb=0011110( 30)
a=110(6), b=0110( 6), axb=0100100( 36)
a=110(6), b=0111( 7), axb=0101010( 42)
a=110(6), b=1000( 8), axb=0110000( 48)
a=110(6), b=1001( 9), axb=0110110( 54)
a=110(6), b=1010(10), axb=0111100( 60)
a=110(6), b=1011(11), axb=1000010( 66)
a=110(6), b=1100(12), axb=1001000( 72)
a=110(6), b=1101(13), axb=1001110( 78)
a=110(6), b=1110(14), axb=1010100( 84)
a=110(6), b=1111(15), axb=1011010( 90)
a=111(7), b=0000( 0), axb=0000000(  0)
a=111(7), b=0001( 1), axb=0000111(  7)
a=111(7), b=0010( 2), axb=0001110( 14)
a=111(7), b=0011( 3), axb=0010101( 21)
a=111(7), b=0100( 4), axb=0011100( 28)
a=111(7), b=0101( 5), axb=0100011( 35)
a=111(7), b=0110( 6), axb=0101010( 42)
a=111(7), b=0111( 7), axb=0110001( 49)
a=111(7), b=1000( 8), axb=0111000( 56)
a=111(7), b=1001( 9), axb=0111111( 63)
a=111(7), b=1010(10), axb=1000110( 70)
a=111(7), b=1011(11), axb=1001101( 77)
a=111(7), b=1100(12), axb=1010100( 84)
a=111(7), b=1101(13), axb=1011011( 91)
a=111(7), b=1110(14), axb=1100010( 98)
a=111(7), b=1111(15), axb=1101001(105)
*/
