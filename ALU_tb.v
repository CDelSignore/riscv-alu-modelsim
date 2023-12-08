module ALU_tb();
    reg [3:0] Control;
    reg [31:0] Operand1, Operand2;
    reg Clk;
    wire Zero;
    wire [31:0] Result;

    ALU dut(Clk, Control, Operand1, Operand2, Zero, Result);

    initial begin
        // Initial Values
        {Clk, Control, Operand1, Operand2} = 4'b0;
        #10

        // And operands (expect 0x0FF00FF0)
        Control = 4'b0000;
        Operand1 = 32'hFFFF0FF0;
        Operand2 = 32'h0FF0FFFF;
        #20

        // Or operands (expect 0xFFFFFFFF)
        Control = 4'b0001;
        Operand1 = 32'hFFFF0000;
        Operand2 = 32'h0000FFFF;
        #20

        // Add operands (expect 4)
        Control = 4'b0010;
        Operand1 = 32'd1;
        Operand2 = 32'd3;
        #20

        // Sub operands (expect 0)
        Control = 4'b0110;
        Operand1 = 32'hF0F0F0F0;
        Operand2 = 32'hF0F0F0F0;

    end

    // Set period of clk to 20tu
    initial begin
        forever #10 Clk=~Clk;
    end

endmodule