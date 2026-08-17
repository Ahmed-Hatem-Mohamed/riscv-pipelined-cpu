`timescale 1ns/1ps

module tb_if_id_register;

    logic clk;
    logic rst;

    logic [31:0] pc_in;
    logic [31:0] pc_plus4_in;
    logic [31:0] instruction_in;

    logic [31:0] pc_out;
    logic [31:0] pc_plus4_out;
    logic [31:0] instruction_out;

    // DUT
    if_id_register DUT (
        .clk            (clk),
        .rst            (rst),
        .pc_in          (pc_in),
        .pc_plus4_in    (pc_plus4_in),
        .instruction_in (instruction_in),
        .pc_out         (pc_out),
        .pc_plus4_out   (pc_plus4_out),
        .instruction_out(instruction_out)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin

        $dumpfile("sim/if_id_register.vcd");
        $dumpvars(0, tb_if_id_register);

        clk = 0;
        rst = 1;

        pc_in = 32'd0;
        pc_plus4_in = 32'd0;
        instruction_in = 32'd0;

        // Reset
        #10;

        if (pc_out == 32'd0 &&
            pc_plus4_out == 32'd0 &&
            instruction_out == 32'd0)
            $display("PASS: IF/ID reset");
        else
            $display("FAIL: IF/ID reset");

        // Release reset
        rst = 0;

        // First instruction
        pc_in = 32'h00000000;
        pc_plus4_in = 32'h00000004;
        instruction_in = 32'h00A00113; // ADDI x2, x0, 10

        #10;

        if (pc_out == 32'h00000000 &&
            pc_plus4_out == 32'h00000004 &&
            instruction_out == 32'h00A00113)
            $display("PASS: IF/ID captured instruction 1");
        else
            $display("FAIL: IF/ID captured instruction 1");

        // Second instruction
        pc_in = 32'h00000004;
        pc_plus4_in = 32'h00000008;
        instruction_in = 32'h01400193; // ADDI x3, x0, 20

        #10;

        if (pc_out == 32'h00000004 &&
            pc_plus4_out == 32'h00000008 &&
            instruction_out == 32'h01400193)
            $display("PASS: IF/ID captured instruction 2");
        else
            $display("FAIL: IF/ID captured instruction 2");

        $display("--------------------------------");
        $display("IF/ID register test complete");
        $display("--------------------------------");

        $finish;

    end

endmodule
