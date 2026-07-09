module register_file (
    input  logic        clk,

    input  logic [4:0]  rs1,
    input  logic [4:0]  rs2,

    input  logic [4:0]  rd,

    input  logic [31:0] write_data,

    input  logic        reg_write,

    output logic [31:0] read_data1,
    output logic [31:0] read_data2
);

logic [31:0] registers [0:31];

    // Read operations (combinational)
    assign read_data1 = registers[rs1];
    assign read_data2 = registers[rs2];

    // Write operation (synchronous)
    always_ff @(posedge clk) begin
        if (reg_write && rd != 5'd0) begin
            registers[rd] <= write_data;
        end
    end

endmodule