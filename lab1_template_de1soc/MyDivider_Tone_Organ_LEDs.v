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

//outclk register
always_ff @(posedge inclk, posedge Reset)
  begin
    if(Reset) clock_up_down <= 1'b0;
    else      
      begin
        if (count >= div_clk_count + 1)
          clock_up_down = ~next_clock_up_down;
        else
          clock_up_down <= next_clock_up_down;
      end
  end

//outclk code here
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
