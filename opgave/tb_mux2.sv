`include "alu.sv"
`include "../test_utils.sv"

module tb_mux2();
  // mux2 tests
  reg A, B;
  wire y;
  reg  ctrl;

  mux2 #(1) dut (
      .d0(A),
      .d1(B),
      .s(ctrl),
      .y(y)
  );

  initial begin
    `TEST_HEADER("mux2");
    // mux2 tests
    A = 1'b0;
    B = 1'b1;
    ctrl = 1'b0;
    #10;
    $display("A=%b, B=%b, ctrl=%b, y=%b", A, B, ctrl, y);
    `PRETTY_ASSERT(y == 0);
    ctrl = 1'b1;
    #10;
    $display("A=%b, B=%b, ctrl=%b, y=%b", A, B, ctrl, y);
    `PRETTY_ASSERT(y == 1);
    A = 1'b1;
    B = 1'b0;
    ctrl = 1'b0;
    #10;
    $display("A=%b, B=%b, ctrl=%b, y=%b", A, B, ctrl, y);
    `PRETTY_ASSERT(y == 1);
    ctrl = 1'b1;
    #10;
    $display("A=%b, B=%b, ctrl=%b, y=%b", A, B, ctrl, y);
    `PRETTY_ASSERT(y == 0);
    `TEST_FOOTER("mux2");
  end
endmodule

