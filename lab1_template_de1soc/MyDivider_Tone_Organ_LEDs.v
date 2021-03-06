module DivClk_Parameterized #(parameter WIDTH = 32)
(
	input logic inclk,
	input logic Reset,
	input logic [WIDTH-1 : 0] div_clk_count,
	output logic outclk
);
	
logic [WIDTH-1 : 0] count;
logic [WIDTH-1 : 0] next_count;
logic clock_up_down, next_clock_up_down;

// Counter register
always_ff @(posedge inclk, posedge Reset)
    begin
      if(Reset) count <= 0;
      else      count <= next_count;
    end

// Next count and clock up or down logic
always_comb
  begin
    if (count >= div_clk_count + 1)
      next_count = 0;
    else
      next_count = count + 1;
  end

//Clock_up_down register + switching after count ends logic
always_ff @(posedge inclk, posedge Reset)
  begin
    if(Reset) clock_up_down <= 1'b0;
    else      
      begin
        if (count >= div_clk_count + 1)
          clock_up_down <= ~next_clock_up_down;
        else
          clock_up_down <= next_clock_up_down;
      end
  end

//Next Clock_up_down logic
always_comb
  begin
    if (Reset)
      next_clock_up_down = 1'b0;
    else
      next_clock_up_down = clock_up_down;
  end

assign outclk = clock_up_down;

endmodule

module SelectFrequencies (
    input logic [7:0] Clocks,
    input logic [2:0] Switches,
    output logic outclk_audio 
);
    always_comb
 begin
  case (Switches)
    3'b000: outclk_audio = Clocks[0];
    3'b001: outclk_audio = Clocks[1];
    3'b010: outclk_audio = Clocks[2];
    3'b011: outclk_audio = Clocks[3];
    3'b100: outclk_audio = Clocks[4];
    3'b101: outclk_audio = Clocks[5];
    3'b110: outclk_audio = Clocks[6];
    3'b111: outclk_audio = Clocks[7];
    default: outclk_audio = 1'b0;
  endcase
 end

endmodule


module LEDSlider (
  input logic inclk,
  input logic Reset,
  output logic [7:0] LED_out
);
  
  logic [3:0] LED_current;
  logic [3:0] LED_next;

  //LED State Register
  always_ff @(posedge inclk, posedge Reset)
   begin
     if (Reset) LED_current <= 4'd0;
     else       LED_current <= LED_next;
   end

   //LED next state logic
   always_comb
    begin
      case(LED_current)
        4'd0: LED_next = 4'd1;
	  	  4'd1: LED_next = 4'd2;
		    4'd2: LED_next = 4'd3;
		    4'd3: LED_next = 4'd4;
		    4'd4: LED_next = 4'd5;
		    4'd5: LED_next = 4'd6;
		    4'd6: LED_next = 4'd7;
		    4'd7: LED_next = 4'd8;
		    4'd8: LED_next = 4'd9;
		    4'd9: LED_next = 4'd10;
		    4'd10: LED_next = 4'd11;
		    4'd11: LED_next = 4'd12;
		    4'd12: LED_next = 4'd13;
		    4'd13: LED_next =4'd0;
        default: LED_next = 4'd0;
      endcase
    end
 
  //Output logic
  always_comb
    begin
      case(LED_current)
        4'd0: LED_out = 8'b00000001;
	  	  4'd1: LED_out = 8'b00000010;
		    4'd2: LED_out = 8'b00000100;
		    4'd3: LED_out = 8'b00001000;
		    4'd4: LED_out = 8'b00010000;
		    4'd5: LED_out = 8'b00100000;
		    4'd6: LED_out = 8'b01000000;
		    4'd7: LED_out = 8'b10000000;
		    4'd8: LED_out = 8'b01000000;
		    4'd9: LED_out = 8'b00100000;
		    4'd10: LED_out = 8'b0010000;
		    4'd11: LED_out = 8'b0001000;
		    4'd12: LED_out = 8'b0000100;
		    4'd13: LED_out = 8'b0000010;
        default: LED_out = 8'b00000000;
      endcase
    end

endmodule
