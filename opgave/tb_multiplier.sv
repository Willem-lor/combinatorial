`include "alu.sv"
`include "../test_utils.sv"

module tb_multiplier();
  // multiplier tests
  reg [3:0] A, B;
  wire [3:0] Y;

  multiplier dut(.A(A), .B(B), .y(Y));

  initial begin
    `TEST_HEADER("multiplier");
    // Note --> only MSBs are tested
    A = 4'b0011; B = 4'b0011; #10 `PRETTY_ASSERT(Y == 4'b0000); //  3 * 3 = 9
    A = 4'b1010; B = 4'b0011; #10 `PRETTY_ASSERT(Y == 4'b1110); // -6 * 3 = -18
    A = 4'b1111; B = 4'b0111; #10 `PRETTY_ASSERT(Y == 4'b1111); // -1 * 7 = -7
    A = 4'b0010; B = 4'b0101; #10 `PRETTY_ASSERT(Y == 4'b0000); //  2 * 5 = 10
    A = 4'b1000; B = 4'b0111; #10 `PRETTY_ASSERT(Y == 4'b1100); // -8 * 7 = -56
    `TEST_FOOTER("multiplier");
  end
endmodule


