module decoder_5_bits(
  input [4:0] current_count,
  output reg [15:0] LEDs // register type
);
  always @* begin
    case(current_count) 
      5'd0:
        LEDs = 16'b0000_0000_0000_0000; // turn off all LEDs
      5'd1:
        LEDs = 16'b0000_0000_0000_0001; // turn on first LED
      5'd2:
        LEDs = 16'b0000_0000_0000_0011;
      5'd3:
        LEDs = 16'b0000_0000_0000_0111;
      5'd4:
        LEDs = 16'b0000_0000_0000_1111;
      5'd5:
        LEDs = 16'b0000_0000_0001_1111;
      5'd6:
        LEDs = 16'b0000_0000_0011_1111;
      5'd7:
        LEDs = 16'b0000_0000_0111_1111;
      5'd8:
        LEDs = 16'b0000_0000_1111_1111;
      5'd9:
        LEDs = 16'b0000_0001_1111_1111;
      5'd10:
        LEDs = 16'b0000_0011_1111_1111;
      5'd11:
        LEDs = 16'b0000_0111_1111_1111;
      5'd12:
        LEDs = 16'b0000_1111_1111_1111;
      5'd13:
        LEDs = 16'b0001_1111_1111_1111;
      5'd14:
        LEDs = 16'b0011_1111_1111_1111;
      5'd15:
        LEDs = 16'b0111_1111_1111_1111;
      5'd16:
        LEDs = 16'b1111_1111_1111_1111;  // turn on all LEDs
      default:
        LEDs = 16'b0000_0000_0000_0000; // Default value
    endcase
  end
endmodule
