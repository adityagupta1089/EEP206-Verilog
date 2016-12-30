module binary_to_gray (in,out);
	input [3:0] in;
	output [3:0] out;
	assign out[0]=in[0]^in[1];
	assign out[1]=in[1]^in[2];
	assign out[2]=in[2]^in[3];
	assign out[3]=in[3];
endmodule //bcd_to_excess3

module binary_to_gray_tb;

reg [3:0] binary_code;
wire [3:0] gray_code;

binary_to_gray btg (.in(binary_code),.out(gray_code));

initial begin
	$monitor ("binary code=%b, gray code=%b",binary_code,gray_code);
	binary_code=4'b0;
#5  binary_code=4'b1;
#5  binary_code=4'b10;
#5  binary_code=4'b11;
#5  binary_code=4'b100;
#5  binary_code=4'b101;
#5  binary_code=4'b110;
#5  binary_code=4'b111;
#5  binary_code=4'b1000;
#5  binary_code=4'b1001;
#5  binary_code=4'b1010;
#5  binary_code=4'b1011;
#5  binary_code=4'b1100;
#5  binary_code=4'b1101;
#5  binary_code=4'b1110;
#5  binary_code=4'b1111;
	$finish;
end

endmodule //binary_to_gray_tb

/*Output:
binary code=0000, gray code=0000
binary code=0001, gray code=0001
binary code=0010, gray code=0011
binary code=0011, gray code=0010
binary code=0100, gray code=0110
binary code=0101, gray code=0111
binary code=0110, gray code=0101
binary code=0111, gray code=0100
binary code=1000, gray code=1100
binary code=1001, gray code=1101
binary code=1010, gray code=1111
binary code=1011, gray code=1110
binary code=1100, gray code=1010
binary code=1101, gray code=1011
binary code=1110, gray code=1001
binary code=1111, gray code=1000

*/
