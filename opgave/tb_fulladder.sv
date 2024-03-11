`include "alu.sv"
`include "../test_utils.sv"

module tb_fulladder();
  // fulladder tests
  reg x, y, cin;
  wire s, cout;

  fulladder dut(.x(x), .y(y), .cin(cin), .s(s), .cout(cout));

  initial begin
    `TEST_HEADER("fulladder");
    x = 1'b0; y = 1'b0; cin = 1'b0; #10 `PRETTY_ASSERT(s == 1'b0 & cout == 1'b0);
    x = 1'b0; y = 1'b0; cin = 1'b1; #10 `PRETTY_ASSERT(s == 1'b1 & cout == 1'b0);
    x = 1'b0; y = 1'b1; cin = 1'b0; #10 `PRETTY_ASSERT(s == 1'b1 & cout == 1'b0);
    x = 1'b0; y = 1'b1; cin = 1'b1; #10 `PRETTY_ASSERT(s == 1'b0 & cout == 1'b1);
    x = 1'b1; y = 1'b0; cin = 1'b0; #10 `PRETTY_ASSERT(s == 1'b1 & cout == 1'b0);
    x = 1'b1; y = 1'b0; cin = 1'b1; #10 `PRETTY_ASSERT(s == 1'b0 & cout == 1'b1);
    x = 1'b1; y = 1'b1; cin = 1'b0; #10 `PRETTY_ASSERT(s == 1'b0 & cout == 1'b1);
    x = 1'b1; y = 1'b1; cin = 1'b1; #10 `PRETTY_ASSERT(s == 1'b1 & cout == 1'b1);
    `TEST_FOOTER("fulladder");
  end
endmodule

