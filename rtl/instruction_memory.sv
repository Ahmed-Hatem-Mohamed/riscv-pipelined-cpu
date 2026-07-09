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
