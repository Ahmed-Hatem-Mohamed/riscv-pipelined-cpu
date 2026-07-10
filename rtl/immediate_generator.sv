`timescale 1ns/1ps

module immediate_generator (
    input  logic [31:0] instruction,
    output logic [31:0] immediate
);

    logic [6:0] opcode;

    assign opcode = instruction[6:0];

    always_comb begin

        // Default value
        immediate = 32'd0;

        case (opcode)
            // I-Type
            7'b0010011,   // OP-IMM
            7'b0000011,   // LOAD
            7'b1100111: begin // JALR
                immediate = {{20{instruction[31]}}, instruction[31:20]};
            end

            // S-Type
            7'b0100011: begin
                immediate = {{20{instruction[31]}},
                             instruction[31:25],
                             instruction[11:7]};
            end

            // B-Type
            7'b1100011: begin
                immediate = {{19{instruction[31]}},
                             instruction[31],
                             instruction[7],
                             instruction[30:25],
                             instruction[11:8],
                             1'b0};
            end

            // U-Type
            7'b0110111,   // LUI
            7'b0010111: begin // AUIPC
                immediate = {instruction[31:12], 12'b0};
            end

            // J-Type
            7'b1101111: begin
                immediate = {{11{instruction[31]}},
                             instruction[31],
                             instruction[19:12],
                             instruction[20],
                             instruction[30:21],
                             1'b0};
            end

            default: begin
                immediate = 32'd0;
            end

        endcase

    end

endmodule
