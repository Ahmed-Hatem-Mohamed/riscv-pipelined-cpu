`timescale 1ns/1ps

module tb_alu_control;

    logic [1:0] alu_op;
    logic [2:0] funct3;
    logic [6:0] funct7;
    logic [3:0] alu_ctrl;
    int errors = 0;

    alu_control DUT (
        .alu_op(alu_op),
        .funct3(funct3),
        .funct7(funct7),
        .alu_ctrl(alu_ctrl)
    );

    task automatic check(
        input logic [1:0] op, input logic [2:0] f3, input logic [6:0] f7,
        input logic [3:0] expected, input string name
    );
        alu_op = op;
        funct3 = f3;
        funct7 = f7;
        #1;
        if (alu_ctrl !== expected) begin
            $display("FAIL [%s]: alu_op=%b funct3=%b funct7=%b expected=%b got=%b",
                      name, op, f3, f7, expected, alu_ctrl);
            errors++;
        end else begin
            $display("PASS [%s]: alu_ctrl=%b", name, alu_ctrl);
        end
    endtask

    initial begin
        // alu_op = 00 -> always ADD, regardless of funct3/funct7
        check(2'b00, 3'b000, 7'b0000000, 4'b0000, "lw/sw ADD (funct3=000)");
        check(2'b00, 3'b111, 7'b0000000, 4'b0000, "lw/sw ADD ignores funct3");

        // alu_op = 01 -> always SUBTRACT
        check(2'b01, 3'b000, 7'b0000000, 4'b0001, "beq SUBTRACT");

        // alu_op = 10 -> look at funct3/funct7
        check(2'b10, 3'b000, 7'b0000000, 4'b0000, "R-type ADD");
        check(2'b10, 3'b000, 7'b0100000, 4'b0001, "R-type SUB (funct7[5]=1)");
        check(2'b10, 3'b111, 7'b0000000, 4'b0010, "R-type AND");
        check(2'b10, 3'b110, 7'b0000000, 4'b0011, "R-type OR");
        check(2'b10, 3'b010, 7'b0000000, 4'b0100, "R-type SLT");

        if (errors == 0) $display("ALL TESTS PASSED");
        else $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
