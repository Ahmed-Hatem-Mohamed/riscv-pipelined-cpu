`timescale 1ns/1ps

module data_memory (
    input  logic        clk,

    input  logic [31:0] address,
    input  logic [31:0] write_data,

    input  logic        mem_read,
    input  logic        mem_write,

    output logic [31:0] read_data
);

    logic [31:0] memory [0:1023];

    // Read operation
    assign read_data = mem_read ? memory[address[11:2]] : 32'd0;

    // Write operation
    always_ff @(posedge clk) begin
        if (mem_write) begin
            memory[address[11:2]] <= write_data;
        end
    end

endmodule
