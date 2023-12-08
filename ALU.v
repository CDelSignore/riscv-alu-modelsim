module ALU(Clk, Control, Operand1, Operand2, Zero, Result);
    input Clk;
    input [3:0] Control;
    input [31:0] Operand1, Operand2;
    output reg Zero;
    output reg [31:0] Result;

    always @ (negedge Clk) begin

        // Perform operation based on control signal
        if(Control == 4'b0000)
            Result = Operand1 & Operand2;

        else if(Control == 4'b0001)
            Result = Operand1 | Operand2;

        else if(Control == 4'b0010)
            Result = Operand1 + Operand2;

        else if(Control == 4'b0110)
            Result = Operand1 - Operand2;

        //else if(Control == ?)
        //    Result = Operand1 ^ Operand2;
        //
        //else if(Control == ?)
        //    Result = Operand1 << Operand2;
        //
        //else if(Control == ?)
        //    Result = Operand1 >> Operand2;

        // Exception if invalid signal provided
        else begin : invalid_control
            $error("Invalid ALU control signal specified");
        end

        // Zero is high if output is zero, low otherwise
        Zero = (Result == 0);

    end
endmodule