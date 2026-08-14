`timescale 1ns/1ps

module tb_alu;

    logic [31:0] a, b;
    logic [3:0]  alu_ctrl;
    logic [31:0] result;
    logic        zero;
    int errors = 0;

    alu DUT (
        .a(a), .b(b),
        .alu_ctrl(alu_ctrl),
        .result(result),
        .zero(zero)
    );

    task automatic check(
        input logic [31:0] op_a, input logic [31:0] op_b, input logic [3:0] ctrl,
        input logic [31:0] exp_result, input logic exp_zero, input string name
    );
        a = op_a;
        b = op_b;
        alu_ctrl = ctrl;
        #1;
        if (result !== exp_result || zero !== exp_zero) begin
            $display("FAIL [%s]: a=%h b=%h ctrl=%b expected result=%h zero=%b got result=%h zero=%b",
                       name, op_a, op_b, ctrl, exp_result, exp_zero, result, zero);
            errors++;
        end else begin
            $display("PASS [%s]: result=%h zero=%b", name, result, zero);
        end
    endtask

    initial begin
        // ADD
        check(32'd5, 32'd3, 4'b0000, 32'd8, 1'b0, "ADD");

        // SUB, nonzero result
        check(32'd5, 32'd3, 4'b0001, 32'd2, 1'b0, "SUB nonzero");

        // SUB, zero result -> tests zero flag
        check(32'd5, 32'd5, 4'b0001, 32'd0, 1'b1, "SUB zero -> zero flag");

        // SUB, negative result (two's complement)
        check(32'hFFFFFFFE, 32'd5, 4'b0001, 32'hFFFFFFF9, 1'b0, "SUB negative (-2 - 5 = -7)");

        // AND
        check(32'hFF00FF00, 32'h0F0F0F0F, 4'b0010, 32'h0F000F00, 1'b0, "AND");

        // OR
        check(32'hF0F0F0F0, 32'h0F0F0F0F, 4'b0011, 32'hFFFFFFFF, 1'b0, "OR");

        // SLT vs SLTU on the SAME operands — proves signed/unsigned actually differ
        check(32'hFFFFFFFF, 32'd1, 4'b0100, 32'd1, 1'b0, "SLT signed: -1 < 1 -> true");
        check(32'hFFFFFFFF, 32'd1, 4'b0101, 32'd0, 1'b1, "SLTU unsigned: 0xFFFFFFFF < 1 -> false");

        // XOR
        check(32'hAAAAAAAA, 32'h55555555, 4'b0110, 32'hFFFFFFFF, 1'b0, "XOR");

        // SLL
        check(32'd1, 32'd4, 4'b0111, 32'd16, 1'b0, "SLL: 1 << 4 = 16");

        // SRL — logical, fills with 0 regardless of sign
        check(32'h80000000, 32'd4, 4'b1000, 32'h08000000, 1'b0, "SRL: fills with 0");

        // SRA — arithmetic, sign-extends
        check(32'h80000000, 32'd4, 4'b1001, 32'hF8000000, 1'b0, "SRA: sign-extends with 1");

        if (errors == 0) $display("ALL TESTS PASSED");
        else $display("%0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule
