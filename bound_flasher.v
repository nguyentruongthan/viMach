module bound_flasher(
  input clk,
  input flick,
  input rst_n,
  output[15:0] LEDs
);

  reg [4:0] current_count_reg;
  reg [2:0] current_state_reg;

  wire [4:0] current_count = current_count_reg;
  wire [2:0] current_state = current_state_reg;

  wire [4:0] next_count;
  wire [2:0] next_state;
  logic_detect_next_state logicDetectNextState( .flick(flick), 
                                                .current_count(current_count), 
                                                .current_state(current_state),
                                                .next_count(next_count),
                                                .next_state(next_state));


  //D-FLIP FLOP
  always @(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
      current_count_reg <= 5'd0;
      current_state_reg <= 3'd0;
    end
    else begin
      current_count_reg <= next_count;
      current_state_reg <= next_state;
    end
  end

  decoder_4_bits decoder4Bits(  .current_count(current_count),
                                .LEDs(LEDs));
                              
endmodule