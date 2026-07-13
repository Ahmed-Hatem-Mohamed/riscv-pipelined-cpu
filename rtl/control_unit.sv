`timescale 1ns/1ps

module control_unit (
    input  logic [6:0] opcode,

    output logic       reg_write,
    output logic       alu_src,
    output logic       mem_read,
    output logic       mem_write,
    output logic [1:0] result_src,
    output logic       branch,
    output logic       jump,
    output logic [1:0] alu_op
);

    always_comb begin
        reg_write  = 1'b0;
        alu_src    = 1'b0;
        mem_read   = 1'b0;
        mem_write  = 1'b0;
        result_src = 2'b00;
        branch     = 1'b0;
        jump       = 1'b0;
        alu_op     = 2'b00;

        case (opcode)
            7'b0110011: begin
                reg_write  = 1'b1;
                alu_op     = 2'b10;
            end
            7'b0010011: begin
                reg_write  = 1'b1;
                alu_src    = 1'b1;
                alu_op     = 2'b10;
            end
            7'b0000011: begin
                reg_write  = 1'b1;
                alu_src    = 1'b1;
                mem_read   = 1'b1;
                result_src = 2'b01;
                alu_op     = 2'b00;
            end
            7'b0100011: begin
                alu_src    = 1'b1;
                mem_write  = 1'b1;
                alu_op     = 2'b00;
            end
            7'b1100011: begin
                branch     = 1'b1;
                alu_op     = 2'b01;
            end
            7'b0110111: begin
                reg_write  = 1'b1;
                alu_src    = 1'b1;
                alu_op     = 2'b11;
            end
            7'b1101111: begin
                reg_write  = 1'b1;
                result_src = 2'b10;
                jump       = 1'b1;
            end
            default: ;
        endcase
    end

endmodule
