module Combination_tb();
    reg clk, rw, rst;
    reg [4:0] rr1, rr2, wr;
    reg [3:0] ctl;
    wire zero;

    Combination dut(clk, rst, rr1, rr2, wr, rw, ctl, zero);

    initial begin
        // Initial Values
        {clk, ctl, rst, rr1, rr2, wr, rw} = 7'b0;
        #20
        rst = 1;

        // Delay to help with alignment
        #5

        // x1 = x2 + x3
        ctl = 4'b0010;
        wr = 0;
        rr1 = 2;
        rr2 = 3;
        rw = 1;
        #20

        // x4 = x5 - x6
        ctl = 4'b0110;
        wr = 4;
        rr1 = 5;
        rr2 = 6;
        rw = 1;   // not strictly needed
        #20

        // x1 = x4 | x1
        ctl = 4'b0001;
        wr = 1;
        rr1 = 4;
        rr2 = 1;
        rw = 1;   // not strictly needed

    end

    // Set period of clk to 20tu
    initial begin
        #20
        forever #10 clk=~clk;
    end

endmodule