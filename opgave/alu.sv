// Code your design here
module mux2 #(parameter int N = 6) (input [N-1:0] d0, d1, input s, output[N-1:0] y);
assign y = s ? d1 : d0;

endmodule



module mux4 ();

endmodule


module mux8 ();

endmodule


module adder ();

endmodule


module multiplier ();

endmodule


module alu ();

endmodule
