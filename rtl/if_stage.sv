`timescale 1ns/1ps

module if_stage (
    input  logic        clk,
    input  logic         rst,
    input  logic [31:0]  branch_target,
    input  logic         branch_taken,
    output logic [31:0]  pc_plus4,
    output logic [31:0]  instruction
);


    logic [31:0] pc_wire;

    instruction_fetch IF_UNIT (
        .clk           (clk),
        .rst           (rst),
        .branch_target (branch_target),
        .branch_taken  (branch_taken),
        .pc            (pc_wire),
        .pc_plus4      (pc_plus4)
    );

    instruction_memory IMEM_UNIT (
        .addr        (pc_wire),
        .instruction (instruction)
    );

endmodule

