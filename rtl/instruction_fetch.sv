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
