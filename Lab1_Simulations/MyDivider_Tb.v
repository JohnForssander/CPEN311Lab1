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