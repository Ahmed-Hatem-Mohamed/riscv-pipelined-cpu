`timescale 1ns/1ps

module tb_id_ex_register;

    logic clk;
    logic rst;

    logic [31:0] pc_in;
    logic [31:0] pc_plus4_in;

    logic [31:0] read_data1_in;
    logic [31:0] read_data2_in;
    logic [31:0] immediate_in;

    logic [4:0] rs1_in;
    logic [4:0] rs2_in;
    logic [4:0] rd_in;

    logic [3:0] alu_ctrl_in;

    logic reg_write_in;
    logic alu_src_in;
    logic mem_read_in;
    logic mem_write_in;

    logic [1:0] result_src_in;

    logic branch_in;
    logic jump_in;

    // Outputs

    logic [31:0] pc_out;
    logic [31:0] pc_plus4_out;

    logic [31:0] read_data1_out;
    logic [31:0] read_data2_out;
    logic [31:0] immediate_out;

    logic [4:0] rs1_out;
    logic [4:0] rs2_out;
    logic [4:0] rd_out;

    logic [3:0] alu_ctrl_out;

    logic reg_write_out;
    logic alu_src_out;
    logic mem_read_out;
    logic mem_write_out;

    logic [1:0] result_src_out;

    logic branch_out;
    logic jump_out;


    // DUT

    id_ex_register DUT (
        .clk            (clk),
        .rst            (rst),

        .pc_in          (pc_in),
        .pc_plus4_in    (pc_plus4_in),

        .read_data1_in  (read_data1_in),
        .read_data2_in  (read_data2_in),
        .immediate_in   (immediate_in),

        .rs1_in         (rs1_in),
        .rs2_in         (rs2_in),
        .rd_in          (rd_in),

        .alu_ctrl_in    (alu_ctrl_in),

        .reg_write_in   (reg_write_in),
        .alu_src_in     (alu_src_in),
        .mem_read_in    (mem_read_in),
        .mem_write_in   (mem_write_in),

        .result_src_in  (result_src_in),

        .branch_in      (branch_in),
        .jump_in        (jump_in),

        .pc_out         (pc_out),
        .pc_plus4_out   (pc_plus4_out),

        .read_data1_out(read_data1_out),
        .read_data2_out(read_data2_out),
        .immediate_out (immediate_out),

        .rs1_out        (rs1_out),
        .rs2_out        (rs2_out),
        .rd_out         (rd_out),

        .alu_ctrl_out   (alu_ctrl_out),

        .reg_write_out  (reg_write_out),
        .alu_src_out    (alu_src_out),
        .mem_read_out   (mem_read_out),
        .mem_write_out  (mem_write_out),

        .result_src_out (result_src_out),

        .branch_out     (branch_out),
        .jump_out       (jump_out)
    );


    always #5 clk = ~clk;


    initial begin

        $dumpfile("sim/id_ex_register.vcd");
        $dumpvars(0, tb_id_ex_register);

        clk = 0;
        rst = 1;

        // Initialize inputs

        pc_in = 0;
        pc_plus4_in = 0;

        read_data1_in = 0;
        read_data2_in = 0;
        immediate_in = 0;

        rs1_in = 0;
        rs2_in = 0;
        rd_in = 0;

        alu_ctrl_in = 0;

        reg_write_in = 0;
        alu_src_in = 0;
        mem_read_in = 0;
        mem_write_in = 0;

        result_src_in = 0;

        branch_in = 0;
        jump_in = 0;


        // ==========================
        // RESET
        // ==========================

        #10;

        if (pc_out == 0 &&
            read_data1_out == 0 &&
            read_data2_out == 0 &&
            immediate_out == 0 &&
            rd_out == 0 &&
            alu_ctrl_out == 0 &&
            reg_write_out == 0)
            $display("PASS: ID/EX reset");
        else
            $display("FAIL: ID/EX reset");


        // ==========================
        // TEST INSTRUCTION
        // ==========================

        rst = 0;

        pc_in = 32'h00000004;
        pc_plus4_in = 32'h00000008;

        read_data1_in = 32'd10;
        read_data2_in = 32'd20;
        immediate_in = 32'd100;

        rs1_in = 5'd6;
        rs2_in = 5'd7;
        rd_in = 5'd5;

        alu_ctrl_in = 4'b0000; // ADD

        reg_write_in = 1'b1;
        alu_src_in = 1'b0;
        mem_read_in = 1'b0;
        mem_write_in = 1'b0;

        result_src_in = 2'b00;

        branch_in = 1'b0;
        jump_in = 1'b0;


        #10;


        // ==========================
        // CHECK
        // ==========================

        if (pc_out == 32'h00000004 &&
            pc_plus4_out == 32'h00000008 &&
            read_data1_out == 32'd10 &&
            read_data2_out == 32'd20 &&
            immediate_out == 32'd100 &&
            rs1_out == 5'd6 &&
            rs2_out == 5'd7 &&
            rd_out == 5'd5 &&
            alu_ctrl_out == 4'b0000 &&
            reg_write_out == 1'b1 &&
            alu_src_out == 1'b0 &&
            mem_read_out == 1'b0 &&
            mem_write_out == 1'b0 &&
            result_src_out == 2'b00 &&
            branch_out == 1'b0 &&
            jump_out == 1'b0)
        begin
            $display("PASS: ID/EX captured all signals");
        end
        else begin
            $display("FAIL: ID/EX captured signals incorrectly");
        end


        // ==========================
        // SECOND TEST
        // ==========================

        pc_in = 32'h00000008;
        pc_plus4_in = 32'h0000000C;

        read_data1_in = 32'd50;
        read_data2_in = 32'd30;
        immediate_in = 32'hFFFFFFF0;

        rs1_in = 5'd10;
        rs2_in = 5'd11;
        rd_in = 5'd12;

        alu_ctrl_in = 4'b0001; // SUB

        reg_write_in = 1'b1;
        alu_src_in = 1'b1;
        mem_read_in = 1'b1;
        mem_write_in = 1'b0;

        result_src_in = 2'b01;

        branch_in = 1'b0;
        jump_in = 1'b0;

        #10;


        if (pc_out == 32'h00000008 &&
            read_data1_out == 32'd50 &&
            read_data2_out == 32'd30 &&
            immediate_out == 32'hFFFFFFF0 &&
            rs1_out == 5'd10 &&
            rs2_out == 5'd11 &&
            rd_out == 5'd12 &&
            alu_ctrl_out == 4'b0001 &&
            reg_write_out == 1'b1 &&
            alu_src_out == 1'b1 &&
            mem_read_out == 1'b1 &&
            result_src_out == 2'b01)
        begin
            $display("PASS: ID/EX captured second instruction");
        end
        else begin
            $display("FAIL: ID/EX captured second instruction");
        end


        $display("--------------------------------");
        $display("ID/EX register test complete");
        $display("--------------------------------");

        $finish;

    end

endmodule
