`include "alu.sv"
`include "../test_utils.sv"

// utility macro for printing ALU stimuli
`define DISPLAY_ALU()\
   $display("A=%d, B=%d, ctrl=%d, y=%b", A,B,ctrl,y)


module tb_alu();
   // ALU tests
   reg [7:0] A, B; wire [7:0] y;
   reg [2:0] ctrl;

   alu #(8) dut(.A(A), .B(B), .ctrl(ctrl), .y(y));

   initial begin
     // ALU tests
     `TEST_HEADER("alu");
     A = 8'b00111101; B = 8'b00000110; ctrl = 3'b000;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b01000011);
     ctrl = 3'b001;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000001);
     ctrl = 3'b010;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00110111);
     ctrl = 3'b011;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b11001001);
     ctrl = 3'b100;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b01111010);
     ctrl = 3'b101;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00111011);
     ctrl = 3'b110;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000100);
     ctrl = 3'b111;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00111111);

     A = 8'b11111111; B = 8'b11111111; ctrl = 3'b000;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b11111110);
     ctrl = 3'b001;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000000);
     ctrl = 3'b010;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000000);
     ctrl = 3'b011;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000000);
     ctrl = 3'b100;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b11111110);
     ctrl = 3'b101;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000000);
     ctrl = 3'b110;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b11111111);
     ctrl = 3'b111;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b11111111);

     A = 8'b00001111; B = 8'b00000001; ctrl = 3'b000;
     ctrl = 3'b001;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000000);
     ctrl = 3'b010;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00001110);
     ctrl = 3'b011;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b11110010);
     ctrl = 3'b100;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00011110);
     ctrl = 3'b101;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00001110);
     ctrl = 3'b110;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000001);
     ctrl = 3'b111;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00001111);

     A = 8'b00111101; B = 8'b00000110; ctrl = 3'b000;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b01000011);
     ctrl = 3'b001;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000001);
     ctrl = 3'b010;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00110111);
     ctrl = 3'b011;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b11001001);
     ctrl = 3'b100;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b01111010);
     ctrl = 3'b101;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00111011);
     ctrl = 3'b110;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00000100);
     ctrl = 3'b111;
     #10 `DISPLAY_ALU();
     `PRETTY_ASSERT(y == 8'b00111111);
     `TEST_FOOTER("alu");
  end
endmodule
