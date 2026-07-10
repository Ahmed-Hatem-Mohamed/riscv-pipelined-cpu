`timescale 1ns/1ps

module tb_if_stage;

    logic        clk;
    logic        rst;

    logic [31:0] branch_target;
    logic        branch_taken;

    logic [31:0] pc_plus4;
    logic [31:0] instruction;


    if_stage DUT (
        .clk(clk),
        .rst(rst),
        .branch_target(branch_target),
        .branch_taken(branch_taken),
        .pc_plus4(pc_plus4),
        .instruction(instruction)
    );

    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("sim/if_stage.vcd");
        $dumpvars(0, tb_if_stage);

        // Initialize signals
        clk           = 0;
        rst           = 1;
        branch_taken  = 0;
        branch_target = 32'd0;

        // Hold reset for two clock cycles
        #20;
        rst = 0;

        // Let the PC count normally
        #40;

        // Force a branch
        branch_target = 32'd64;
        branch_taken  = 1;

        // Keep branch asserted for one clock
        #10;

        // Return to sequential execution
        branch_taken = 0;

        // Run for a few more cycles
        #50;

        $finish;
    end

endmodule