`include "alu.sv"
`include "../test_utils.sv"

// Code your testbench here
// or browse Examples
module tb_mux8 ();
  // mux8 tests
  reg [5:0] d0, d1, d2, d3, d4, d5, d6, d7;
  reg  [2:0] S;
  wire [5:0] Y;

  mux8 #(6) dut(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4),
                .d5(d5), .d6(d6), .d7(d7), .S(S), .y(Y));

  initial begin
    // mux8 tests
    `TEST_HEADER("mux8");
    d0 = 6'b000000; d1 = 6'b000001; d2 = 6'b000010; d3 = 6'b000100;
    d5 = 6'b001000; d5 = 6'b010000; d6 = 6'b100000; d7 = 6'b111111;
    S = 3'b000; #10;
    `PRETTY_ASSERT(Y == d0);
    S = 3'b001; #10;
    `PRETTY_ASSERT(Y == d1);
    S = 3'b010; #10;
    `PRETTY_ASSERT(Y == d2);
    S = 3'b011; #10;
    `PRETTY_ASSERT(Y == d3);
    S = 3'b100; #10;
    `PRETTY_ASSERT(Y == d4);
    S = 3'b101; #10;
    `PRETTY_ASSERT(Y == d5);
    S = 3'b110; #10;
    `PRETTY_ASSERT(Y == d6);
    S = 3'b111; #10;
    `PRETTY_ASSERT(Y == d7);
    `TEST_FOOTER("mux8");
  end
endmodule
