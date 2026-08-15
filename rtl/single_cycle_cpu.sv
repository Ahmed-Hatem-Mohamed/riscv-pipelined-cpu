`timescale 1ns/1ps

module single_cycle_cpu (
    input logic clk,
    input logic rst
);
    // 1. INSTRUCTION FETCH / PC

    logic [31:0] pc;
    logic [31:0] pc_plus4;

    logic [31:0] instruction;

    logic [31:0] next_pc;
    logic        branch_taken;
    logic [31:0] branch_target;

    // 2. INSTRUCTION FIELDS

    logic [6:0] opcode;
    logic [4:0] rd;
    logic [4:0] rs1;
    logic [4:0] rs2;

    logic [2:0] funct3;
    logic [6:0] funct7;

    assign opcode = instruction[6:0];
    assign rd     = instruction[11:7];
    assign funct3 = instruction[14:12];
    assign rs1    = instruction[19:15];
    assign rs2    = instruction[24:20];
    assign funct7 = instruction[31:25];

    // 3. CONTROL UNIT

    logic       reg_write;
    logic       alu_src;
    logic       mem_read;
    logic       mem_write;
    logic [1:0] result_src;
    logic       branch;
    logic       jump;
    logic [1:0] alu_op;


    control_unit CONTROL (
        .opcode     (opcode),
        .reg_write (reg_write),
        .alu_src   (alu_src),
        .mem_read  (mem_read),
        .mem_write (mem_write),
        .result_src(result_src),
        .branch    (branch),
        .jump      (jump),
        .alu_op    (alu_op)
    );

    // 4. REGISTER FILE

    logic [31:0] read_data1;
    logic [31:0] read_data2;
    logic [31:0] write_data;


    register_file REG_FILE (
        .clk       (clk),
        .rs1       (rs1),
        .rs2       (rs2),
        .rd        (rd),
        .write_data(write_data),
        .reg_write (reg_write),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // 5. IMMEDIATE GENERATOR

    logic [31:0] immediate;


    immediate_generator IMM_GEN (
        .instruction(instruction),
        .immediate  (immediate)
    );

    // 6. ALU CONTROL

    logic [3:0] alu_ctrl;


    alu_control ALU_CTRL (
        .alu_op  (alu_op),
        .funct3  (funct3),
        .funct7  (funct7),
        .alu_ctrl(alu_ctrl)
    );

    // 7. ALU INPUT MUX

    logic [31:0] alu_b;

    assign alu_b = alu_src ? immediate : read_data2;

    // 8. ALU

    logic [31:0] alu_result;
    logic        alu_zero;


    alu ALU (
        .a       (read_data1),
        .b       (alu_b),
        .alu_ctrl(alu_ctrl),
        .result  (alu_result),
        .zero    (alu_zero)
    );

    // 9. DATA MEMORY

    logic [31:0] memory_read_data;


    data_memory DATA_MEM (
        .clk       (clk),
        .address   (alu_result),
        .write_data(read_data2),
        .mem_read  (mem_read),
        .mem_write (mem_write),
        .read_data (memory_read_data)
    );


    // 10. WRITE-BACK MUX

    always_comb begin

        case (result_src)

            2'b00:
                write_data = alu_result;

            2'b01:
                write_data = memory_read_data;

            2'b10:
                write_data = pc_plus4;

            default:
                write_data = 32'd0;

        endcase

    end

    // 11. BRANCH / JUMP LOGIC

    assign branch_taken = branch && alu_zero;

    // 12. BRANCH TARGET

    assign branch_target = pc + immediate;


    // 13. NEXT PC

    assign next_pc =
        (branch_taken || jump)
        ? branch_target
        : pc_plus4;

    // 14. INSTRUCTION FETCH UNIT

instruction_fetch IF_UNIT (
    .clk     (clk),
    .rst     (rst),
    .next_pc (next_pc),
    .pc      (pc),
    .pc_plus4(pc_plus4)
);

    // 15. INSTRUCTION MEMORY

    instruction_memory IMEM (
        .addr       (pc),
        .instruction(instruction)
    );

endmodule
