module RegisterFile_tb();
    reg Clk, RegWrite, Reset;
    reg [4:0] ReadReg1, ReadReg2, WriteReg;
    reg [31:0] WriteData;
    wire [31:0] ReadData1, ReadData2;

    RegisterFile dut(Clk, Reset, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2, RegWrite);

    initial begin
        // Initial Values
        {Clk, Reset, ReadReg1, ReadReg2, WriteReg, WriteData, RegWrite} = 7'b0;
        #20
        Reset = 1;

        // Delay to help with alignment
        #5

        // Write 123 to x1
        WriteReg = 1;
        WriteData = 123;
        RegWrite = 1;
        #20

        // Write 456 to x2
        WriteReg = 2;
        WriteData = 456;
        RegWrite = 1;     // not strictly needed
        #20

        
        // Write 789 to x3
        WriteReg = 3;
        WriteData = 789;
        RegWrite = 1;     // not strictly needed
        #20

        // Attempt to write 789 to x0
        WriteReg = 0;
        WriteData = 789;
        RegWrite = 1;     // not strictly needed
        #20

        // Done Writing
        RegWrite = 0;

        // Read Registers x0 and x1
        ReadReg1 = 0;
        ReadReg2 = 1;
        #20

        // Read Registers x2 and x3
        ReadReg1 = 2;
        ReadReg2 = 3;
        #20

        // NOP
        ReadReg1 = 0;
        ReadReg2 = 0;

    end

    // Set period of clk to 20tu
    initial begin
        #20
        forever #10 Clk=~Clk;
    end

endmodule