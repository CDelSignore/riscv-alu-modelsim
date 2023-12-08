module RegisterFile(Clk, Reset, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2, RegWrite);
    input Clk, RegWrite, Reset;
    input [4:0] ReadReg1, ReadReg2, WriteReg;
    input [31:0] WriteData;
    output [31:0] ReadData1, ReadData2;

    reg [31:0] registers [31:0];

    assign ReadData1 = registers[ReadReg1];
    assign ReadData2 = registers[ReadReg2];

    // Uncomment for Combination initial values (since we have no immediete to load)
    //initial begin
    //    registers[2] = 5;
    //    registers[3] = 13;
    //    registers[5] = 10;
    //    registers[6] = 7;
    //end

    always @ (posedge Clk) begin
        // If reset signal low, zero all registers
        if(!Reset) begin : clear_regs
            integer i;
            for(i=0; i<32; i=i+1) begin
                registers[i] <= 32'd0;
            end
        end

        // "Write occurs on a rising clock edge if RegWrite is 1" PA 4.3.3
        if(RegWrite) begin
            if(WriteReg == 4'd0)
                // x0 always equal to 0
                registers[WriteReg] <= 32'd0;
            else
                // Otherwise write data to target register
                registers[WriteReg] <= WriteData;
        end

    end

endmodule