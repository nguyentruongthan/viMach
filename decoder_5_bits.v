module decoder_5_bits(
  input [4:0] current_count,
  output reg [15:0] leds // register type
);
  always @* begin
    case(current_count) 
      5'd0:
        leds = 16'b0000_0000_0000_0000; // turn off all LEDs
      5'd1:
        leds = 16'b0000_0000_0000_0001; // turn on first LED
      5'd2:
        leds = 16'b0000_0000_0000_0011;
      5'd3:
        leds = 16'b0000_0000_0000_0111;
      5'd4:
        leds = 16'b0000_0000_0000_1111;
      5'd5:
        leds = 16'b0000_0000_0001_1111;
      5'd6:
        leds = 16'b0000_0000_0011_1111;
      5'd7:
        leds = 16'b0000_0000_0111_1111;
      5'd8:
        leds = 16'b0000_0000_1111_1111;
      5'd9:
        leds = 16'b0000_0001_1111_1111;
      5'd10:
        leds = 16'b0000_0011_1111_1111;
      5'd11:
        leds = 16'b0000_0111_1111_1111;
      5'd12:
        leds = 16'b0000_1111_1111_1111;
      5'd13:
        leds = 16'b0001_1111_1111_1111;
      5'd14:
        leds = 16'b0011_1111_1111_1111;
      5'd15:
        leds = 16'b0111_1111_1111_1111;
      5'd16:
        leds = 16'b1111_1111_1111_1111;  // turn on all LEDs
      default:
        leds = 16'b0000_0000_0000_0000; // Default value
    endcase
  end
endmodule
