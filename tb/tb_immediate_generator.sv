`timescale 1ns/1ps

module tb_immediate_generator;

    logic [31:0] instruction;
    logic [31:0] immediate;
    int errors = 0;

    immediate_generator DUT (
        .instruction(instruction),
        .immediate(immediate)
    );

    task automatic check(input logic [31:0] instr, input logic [31:0] expected, input string name);
        instruction = instr;
        #1; // let combinational logic settle
        if (immediate !== expected) begin
            $display("FAIL [%s]: instr=%h expected=%h got=%h", name, instr, expected, immediate);
            errors++;
        end else begin
            $display("PASS [%s]: immediate=%h", name, immediate);
        end
    endtask

    initial begin
        // I-type, positive imm = 5
        check({12'h005, 5'd0, 3'd0, 5'd0, 7'b0010011}, 32'd5, "I-type positive");

        // I-type, negative imm = -1
        check({12'hFFF, 5'd0, 3'd0, 5'd0, 7'b0010011}, 32'hFFFFFFFF, "I-type negative");

        // S-type, imm = 16
        check({7'b0000000, 5'd0, 5'd0, 3'd0, 5'b10000, 7'b0100011}, 32'd16, "S-type");

        // B-type, branch offset = 16
        check({1'b0, 6'b000000, 5'd0, 5'd0, 3'd0, 4'b1000, 1'b0, 7'b1100011}, 32'd16, "B-type");

        // U-type (LUI), imm[31:12] = 0xABCDE
        check({20'hABCDE, 5'd0, 7'b0110111}, 32'hABCDE000, "U-type (LUI)");

        // J-type (JAL), jump offset = 16
        check({1'b0, 10'b0000001000, 1'b0, 8'b00000000, 5'd0, 7'b1101111}, 32'd16, "J-type (JAL)");

        if (errors == 0) $display("ALL TESTS PASSED");
        else $display("%0d TEST(S) FAILED", errors);

        $finish;
    end
endmodule
