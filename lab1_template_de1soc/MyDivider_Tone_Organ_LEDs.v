module DivClk_Parameterized #(parameter WIDTH = 32)
(
	input logic inclk,
	input logic Reset,
	input logic [WIDTH-1 : 0] div_clk_count,
	output logic outclk
);
	
logic clock_up_down;
logic [WIDTH-1 : 0] counter;



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
    default: outclk_audio = 32'b0;
  endcase
 end

endmodule
