module logic_detect_next_state(
  input flick,
  input [4:0] current_count,
  input [2:0] current_state,
  output reg [4:0] next_count, // register type
  output reg [2:0] next_state  // register type
);
  parameter INIT = 0,
            TURN_ON_TO_15 = 1,
            TURN_OFF_TO_5 = 2,
            TURN_ON_TO_10 = 3,
            TURN_OFF_TO_0 = 4,
            TURN_ON_TO_5 = 5,
            TURN_OFF_TO_0_END = 6;
            
  always @(flick, current_count, current_state) begin
    case(current_state) 
      INIT:
        if(flick == 1) begin
          next_state = TURN_ON_TO_15;
          next_count = current_count + 1;
        end
        else begin 
          next_count = 0;
        end
      TURN_ON_TO_15:
        if(current_count < 16) begin
          next_count = current_count + 1;
        end 
        else begin
          next_state = TURN_OFF_TO_5;
          next_count = current_count - 1;
        end
      
      TURN_OFF_TO_5:
        if(current_count == 4) begin
          if(flick == 1) begin
            next_state = TURN_ON_TO_15;
            next_count = current_count + 1;
          end
          else begin
            next_state = TURN_ON_TO_10;
            next_count = current_count + 1;
          end
        end
        else begin
          next_count = current_count - 1;
        end
      TURN_ON_TO_10:
        if(current_count == 10) begin
          next_state = TURN_OFF_TO_0;
          next_count = current_count - 1;
        end
        else begin
          next_count = current_count + 1;
        end
      TURN_OFF_TO_0:
        if((current_count == 4 || current_count == 0) && flick == 1) begin
          next_state = TURN_ON_TO_10;
          next_count = current_count + 1;
        end
        else begin
          if(current_count == 0 && flick == 0) begin
            next_state = TURN_ON_TO_5;
            next_count = current_count + 1;
          end
          else begin
            next_count = current_count - 1;
          end
        end
      TURN_ON_TO_5:
        if(current_count == 5) begin
          next_state = TURN_OFF_TO_0_END;
          next_count = current_count - 1;
        end
        else begin
          next_count = current_count + 1;
        end
      TURN_OFF_TO_0_END:
        if(current_count == 0) begin
          next_state = INIT;
          next_count = current_count + 1;
        end
        else begin
          next_count = current_count - 1;
        end
      default: next_state = INIT;
    endcase
  end
  
endmodule
