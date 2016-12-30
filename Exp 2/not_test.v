module not_test;
wire t_y;
reg t_a;

notgate my_gate( .a(t_a), .y(t_y) );

initial
begin
$monitor(t_a, t_y);

t_a = 1'b0;

#5 
t_a = 1'b1;

end
endmodule
