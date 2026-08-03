`timescale 1ns/1ps

module alu_control (
    input  logic [1:0] alu_op,
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    output logic [3:0] alu_ctrl
);

    always_comb begin
        alu_ctrl = 4'b0000;

        case (alu_op)
            2'b00: alu_ctrl = 4'b0000;
            2'b01: alu_ctrl = 4'b0001;

            2'b10: begin
                case (funct3)
                    3'b000: alu_ctrl = funct7[5] ? 4'b0001 : 4'b0000;
                    3'b111: alu_ctrl = 4'b0010;
                    3'b110: alu_ctrl = 4'b0011;
                    3'b010: alu_ctrl = 4'b0100;
                    default: alu_ctrl = 4'b0000;
                endcase
            end

            default: alu_ctrl = 4'b0000;
        endcase
    end

endmodule
