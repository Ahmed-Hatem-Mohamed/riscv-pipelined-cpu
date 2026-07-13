`timescale 1ns/1ps

module tb_control_unit;

    logic [6:0] opcode;
    logic       reg_write, alu_src, mem_read, mem_write, branch, jump;
    logic [1:0] result_src, alu_op;
    int errors = 0;

    control_unit DUT (
        .opcode(opcode),
        .reg_write(reg_write), .alu_src(alu_src),
        .mem_read(mem_read), .mem_write(mem_write),
        .result_src(result_src), .branch(branch), .jump(jump),
        .alu_op(alu_op)
    );

    task automatic check(
        input logic [6:0] op, input string name,
        input logic exp_rw, exp_as, exp_mr, exp_mw, exp_br, exp_jp,
        input logic [1:0] exp_rs, exp_ao
    );
        opcode = op;
        #1;
        if (reg_write !== exp_rw || alu_src !== exp_as || mem_read !== exp_mr ||
            mem_write !== exp_mw || branch !== exp_br || jump !== exp_jp ||
            result_src !== exp_rs || alu_op !== exp_ao) begin
            $display("FAIL [%s]", name);
            errors++;
        end else begin
            $display("PASS [%s]", name);
        end
    endtask

    initial begin
        check(7'b0110011, "R-type",  1,0,0,0,0,0, 2'b00, 2'b10);
        check(7'b0010011, "addi",    1,1,0,0,0,0, 2'b00, 2'b10);
        check(7'b0000011, "lw",      1,1,1,0,0,0, 2'b01, 2'b00);
        check(7'b0100011, "sw",      0,1,0,1,0,0, 2'b00, 2'b00);
        check(7'b1100011, "beq",     0,0,0,0,1,0, 2'b00, 2'b01);
        check(7'b0110111, "lui",     1,1,0,0,0,0, 2'b00, 2'b11);
        check(7'b1101111, "jal",     1,0,0,0,0,1, 2'b10, 2'b00);

        if (errors == 0) $display("ALL TESTS PASSED");
        else $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
