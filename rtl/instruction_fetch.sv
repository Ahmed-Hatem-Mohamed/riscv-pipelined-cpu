module instruction_fetch (
    input  logic        clk,
    input  logic        rst,
    input  logic [31:0] next_pc,

    output logic [31:0] pc,
    output logic [31:0] pc_plus4
);

    always_ff @(posedge clk) begin
        if (rst)
            pc <= 32'h00000000;
        else
            pc <= next_pc;
    end

    assign pc_plus4 = pc + 32'd4;

endmodule
