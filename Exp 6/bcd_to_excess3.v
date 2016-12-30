module bcd_to_excess3 (in,out);
	input [3:0] in;
	output [3:0] out;
	assign out[0]=~in[0];
	assign out[1]=in[0]~^in[1];
	assign out[2]=in[2]^(in[0]|in[1]);
	assign out[3]=(in[2]&(in[0]|in[1]))|in[3];
endmodule //bcd_to_excess3

module bcd_to_excess3_tb;

reg [3:0] bcd_code;
wire [3:0] ex3_code;

bcd_to_excess3 bte3 (.in(bcd_code),.out(ex3_code));

initial begin
	$monitor ("bcd code=%b, excess-3 code=%b",bcd_code,ex3_code);
	bcd_code=4'b0;
#5  bcd_code=4'b1;
#5  bcd_code=4'b10;
#5  bcd_code=4'b11;
#5  bcd_code=4'b100;
#5  bcd_code=4'b101;
#5  bcd_code=4'b110;
#5  bcd_code=4'b111;
#5  bcd_code=4'b1000;
#5  bcd_code=4'b1001;
	$finish;
end

endmodule //bcd_to_excess3_tb

/*Output:
bcd code=0000, excess-3 code=0011
bcd code=0001, excess-3 code=0100
bcd code=0010, excess-3 code=0101
bcd code=0011, excess-3 code=0110
bcd code=0100, excess-3 code=0111
bcd code=0101, excess-3 code=1000
bcd code=0110, excess-3 code=1001
bcd code=0111, excess-3 code=1010
bcd code=1000, excess-3 code=1011
bcd code=1001, excess-3 code=1100
*/
