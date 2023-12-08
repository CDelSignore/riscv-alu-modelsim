module Combination(clk, rst, rr1, rr2, wr, rw, ctl, zero);

    input clk, rw, rst;
    input [4:0] rr1, rr2, wr;
    input [3:0] ctl;
    output wire zero;

    wire [31:0] rd1_to_op1, rd2_to_op2, result_to_wd;

    RegisterFile registerfile(.Clk(clk), .Reset(rst), .ReadReg1(rr1), .ReadReg2(rr2), .WriteReg(wr), .WriteData(result_to_wd), .ReadData1(rd1_to_op1), .ReadData2(rd2_to_op2), .RegWrite(rw));
    ALU alu(.Clk(clk), .Control(ctl), .Operand1(rd1_to_op1), .Operand2(rd2_to_op2), .Zero(zero), .Result(result_to_wd));

endmodule