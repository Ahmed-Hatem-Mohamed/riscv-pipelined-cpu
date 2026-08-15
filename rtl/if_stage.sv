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
    .clk     (clk),
    .rst     (rst),
    .next_pc (next_pc),
    .pc      (pc),
    .pc_plus4(pc_plus4)
);
    instruction_memory IMEM_UNIT (
        .addr        (pc_wire),
        .instruction (instruction)
    );

endmodule

