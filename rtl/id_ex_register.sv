`timescale 1ns/1ps

module id_ex_register (
    input logic        clk,
    input logic        rst,

    // DATA FROM ID STAGE

    input logic [31:0] pc_in,
    input logic [31:0] pc_plus4_in,

    input logic [31:0] read_data1_in,
    input logic [31:0] read_data2_in,
    input logic [31:0] immediate_in,

    input logic [4:0]  rs1_in,
    input logic [4:0]  rs2_in,
    input logic [4:0]  rd_in,

    input logic [3:0]  alu_ctrl_in,

    // CONTROL SIGNALS FROM ID

    input logic        reg_write_in,
    input logic        alu_src_in,
    input logic        mem_read_in,
    input logic        mem_write_in,

    input logic [1:0]  result_src_in,

    input logic        branch_in,
    input logic        jump_in,

    // OUTPUTS TO EX STAGE


    output logic [31:0] pc_out,
    output logic [31:0] pc_plus4_out,

    output logic [31:0] read_data1_out,
    output logic [31:0] read_data2_out,
    output logic [31:0] immediate_out,

    output logic [4:0]  rs1_out,
    output logic [4:0]  rs2_out,
    output logic [4:0]  rd_out,

    output logic [3:0]  alu_ctrl_out,

    output logic        reg_write_out,
    output logic        alu_src_out,
    output logic        mem_read_out,
    output logic        mem_write_out,

    output logic [1:0]  result_src_out,

    output logic        branch_out,
    output logic        jump_out
);

    always_ff @(posedge clk) begin

        if (rst) begin

            pc_out         <= 32'd0;
            pc_plus4_out   <= 32'd0;

            read_data1_out <= 32'd0;
            read_data2_out <= 32'd0;
            immediate_out  <= 32'd0;

            rs1_out        <= 5'd0;
            rs2_out        <= 5'd0;
            rd_out         <= 5'd0;

            alu_ctrl_out   <= 4'd0;

            reg_write_out  <= 1'b0;
            alu_src_out    <= 1'b0;
            mem_read_out   <= 1'b0;
            mem_write_out  <= 1'b0;

            result_src_out <= 2'b00;

            branch_out     <= 1'b0;
            jump_out       <= 1'b0;

        end

        else begin

            pc_out         <= pc_in;
            pc_plus4_out   <= pc_plus4_in;

            read_data1_out <= read_data1_in;
            read_data2_out <= read_data2_in;
            immediate_out  <= immediate_in;

            rs1_out        <= rs1_in;
            rs2_out        <= rs2_in;
            rd_out         <= rd_in;

            alu_ctrl_out   <= alu_ctrl_in;

            reg_write_out  <= reg_write_in;
            alu_src_out    <= alu_src_in;
            mem_read_out   <= mem_read_in;
            mem_write_out  <= mem_write_in;

            result_src_out <= result_src_in;

            branch_out     <= branch_in;
            jump_out       <= jump_in;

        end

    end

endmodule
