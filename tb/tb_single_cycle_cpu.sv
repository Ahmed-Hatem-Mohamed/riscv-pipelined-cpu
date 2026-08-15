`timescale 1ns/1ps

module tb_single_cycle_cpu;

    logic clk;
    logic rst;

    // ------------------------------------------------
    // DUT
    // ------------------------------------------------

    single_cycle_cpu DUT (
        .clk(clk),
        .rst(rst)
    );

    // ------------------------------------------------
    // Clock
    // ------------------------------------------------

    always #5 clk = ~clk;

    // ------------------------------------------------
    // Waveform
    // ------------------------------------------------

    initial begin
        $dumpfile("sim/single_cycle_cpu.vcd");
        $dumpvars(0, tb_single_cycle_cpu);
    end

    // ------------------------------------------------
    // Test
    // ------------------------------------------------

    initial begin

        clk = 0;
        rst = 1;

        // Reset
        #20;
        rst = 0;

        // Allow the program to execute
        #100;

        // ------------------------------------------------
        // Check registers
        // ------------------------------------------------

        if (DUT.REG_FILE.registers[1] === 32'd10)
            $display("PASS: x1 = 10");
        else
            $error("FAIL: x1 = %0d, expected 10",
                   DUT.REG_FILE.registers[1]);

        if (DUT.REG_FILE.registers[2] === 32'd20)
            $display("PASS: x2 = 20");
        else
            $error("FAIL: x2 = %0d, expected 20",
                   DUT.REG_FILE.registers[2]);

        if (DUT.REG_FILE.registers[3] === 32'd30)
            $display("PASS: x3 = 30");
        else
            $error("FAIL: x3 = %0d, expected 30",
                   DUT.REG_FILE.registers[3]);

        if (DUT.REG_FILE.registers[4] === 32'd10)
            $display("PASS: x4 = 10");
        else
            $error("FAIL: x4 = %0d, expected 10",
                   DUT.REG_FILE.registers[4]);

        if (DUT.REG_FILE.registers[5] === 32'd30)
            $display("PASS: x5 = 30");
        else
            $error("FAIL: x5 = %0d, expected 30",
                   DUT.REG_FILE.registers[5]);

        // ------------------------------------------------
        // Check memory
        // ------------------------------------------------

        if (DUT.DATA_MEM.memory[0] === 32'd30)
            $display("PASS: memory[0] = 30");
        else
            $error("FAIL: memory[0] = %0d, expected 30",
                   DUT.DATA_MEM.memory[0]);

        $display("--------------------------------");
        $display("Single-Cycle CPU test complete");
        $display("--------------------------------");

        $finish;
    end

endmodule
