module MyDivider_Tb;
    reg inclk;
    reg Reset;
    reg [31:0] div_clk_count;
    wire outclk;

    DivClk_Parameterized
    MyDivider
    (.inclk(inclk),
     .Reset(Reset),
     .div_clk_count(div_clk_count),
     .outclk(outclk)
    );

initial begin
    forever 
     begin
        #10 inclk = 0;
        #10 inclk = 1;
     end
end

initial begin

    div_clk_count = 8;
    Reset = 0;

    #20

    Reset = 1;

    #10

    Reset = 0;

end
endmodule

module ToneOrgan_Tb;
    reg [7:0] Clocks;
    reg [2:0] Switches;
    wire outclk;

    SelectFrequencies
    ToneOrgan
    (.Clocks(Clocks),
     .Switches(Switches),
     .outclk_audio(outclk)
    );

initial begin
    
    Clocks = 8'b10101010;
    Switches = 3'b000;
    #10
    Switches = 3'b001;
    #10
    Switches = 3'b010;
    #10
    Switches = 3'b011;
    #10
    Switches = 3'b100;
    #10
    Switches = 3'b101;
    #10
    Switches = 3'b110;
    #10
    Switches = 3'b111;

end
endmodule

module LEDSlider_Tb;
    reg inclk;
    reg Reset;
    wire [7:0] LED_out;

    LEDSlider
    Control_LEDS
    (.inclk(inclk),
     .Reset(Reset),
     .LED_out(LED_out)
    );

initial begin
    forever
     begin
        #10 inclk = 0;
        #10 inclk = 1;
     end    
end

initial begin
    
    Reset = 0;
    #10
    Reset = 1;
    #10
    Reset = 0;

end
endmodule
