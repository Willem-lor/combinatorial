`include "alu.sv"
`include "../test_utils.sv"

module tb_ripplecarry();
  //ripplecarry tests

  reg [3:0] A, B;
  reg cin;
  wire [3:0] Y;

  ripplecarry #(4) dut(.A(A), .B(B), .cin(cin), .y(Y));

  initial begin
    `TEST_HEADER("ripplecarry");
    A = 4'b0010; B = 4'b0011; cin = 1'b0; #10 `PRETTY_ASSERT(Y == 4'b0101); // 2 + 3 = 5
    A = 4'b1010; B = 4'b0011; cin = 1'b0; #10 `PRETTY_ASSERT(Y == 4'b1101); // -6 + 3 = -3
    A = 4'b1111; B = 4'b0111; cin = 1'b0; #10 `PRETTY_ASSERT(Y == 4'b0110); // -1 + 7 = 6
    A = 4'b0010; B = 4'b0101; cin = 1'b1; #10 `PRETTY_ASSERT(Y == 4'b1000); // 2 + 5 + 1 = 8
    `TEST_FOOTER("ripplecarry");
  end
endmodule

