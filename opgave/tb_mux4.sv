`include "alu.sv"
`include "../test_utils.sv"

// Code your testbench here
// or browse Examples
module tb_mux4 ();
  // mux4 tests
  reg [5:0] d0, d1, d2, d3;
  reg  [1:0] S;
  wire [5:0] Y;

  mux4 #(6) dut(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .S(S), .y(Y));

  initial begin
    // mux4 tests
    `TEST_HEADER("mux4");
    d0 = 6'b000000; d1 = 6'b000001; d2 = 6'b000010; d3 = 6'b000100;
    S = 2'b00; #10;
    `PRETTY_ASSERT(Y == d0);
    S = 2'b01; #10;
    `PRETTY_ASSERT(Y == d1);
    S = 2'b10; #10;
    `PRETTY_ASSERT(Y == d2);
    S = 2'b11; #10;
    `PRETTY_ASSERT(Y == d3);
    `TEST_FOOTER("mux4");
  end
endmodule
