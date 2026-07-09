module instruction_fetch (
    input  logic        clk,
    input  logic         rst,
    input  logic [31:0]  branch_target,
    input  logic         branch_taken,
    output logic [31:0]  pc,
    output logic [31:0]  pc_plus4
);
    logic [31:0] next_pc;

    always_ff @(posedge clk) begin
        if (rst) pc <= 32'h00000000;
        else     pc <= next_pc;
    end

    assign pc_plus4 = pc + 32'd4;
    assign next_pc  = branch_taken ? branch_target : pc_plus4;
endmodule

module instruction_memory (
    input  logic [31:0] addr,
    output logic [31:0] instruction
);
    logic [31:0] imem [0:1023];

    initial begin
        $readmemh("program.hex", imem);
    end

    assign instruction = imem[addr[31:2]];
endmodule

module if_stage (
    input  logic        clk,
    input  logic         rst,
    input  logic [31:0]  branch_target,
    input  logic         branch_taken,
    output logic [31:0]  pc_plus4,
    output logic [31:0]  instruction
);

    // Internal wire: carries the PC value from instruction_fetch
    // into instruction_memory. Not visible outside this module.
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
