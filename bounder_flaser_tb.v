`timescale 1ns/1ns

module bound_flasher_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Signals
  reg clk;
  reg flick;
  reg rst_n;
  wire [15:0] LEDs;

  // Instantiate the bound_flasher module
  bound_flasher uut (
    .clk(clk),
    .flick(flick),
    .rst_n(rst_n),
    .LEDs(LEDs)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Initial stimulus
  initial begin
    clk = 0;
    rst_n = 0;
    flick = 0;
    #10; // Wait for 100ns

    // Release reset
    rst_n = 1;
    #10; // Wait for 100ns

    // Provide some test cases
    // Case 1: flick = 0, Test for some counts
    flick = 0;
    #200; // Wait for 200ns

    // Case 2: flick = 1, Test for some counts
    flick = 1;
    #20; // Wait for 200ns
    flick = 0;
    // End simulation
    #10000;
    $finish;
  end

endmodule
