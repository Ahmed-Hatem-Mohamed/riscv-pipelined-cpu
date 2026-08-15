`timescale 1ns/1ps

module tb_data_memory;

    logic        clk;
    logic [31:0] address;
    logic [31:0] write_data;
    logic        mem_read;
    logic        mem_write;

    logic [31:0] read_data;

    data_memory DUT (
        .clk       (clk),
        .address   (address),
        .write_data(write_data),
        .mem_read  (mem_read),
        .mem_write (mem_write),
        .read_data (read_data)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin

        // Initial values
        clk        = 0;
        address    = 32'd0;
        write_data = 32'd0;
        mem_read   = 0;
        mem_write  = 0;

        // --------------------------------
        // TEST 1: STORE
        // memory[5] = 123
        // address = 20
        // --------------------------------

        #10;

        address    = 32'd20;
        write_data = 32'd123;
        mem_write  = 1;

        #10;

        mem_write = 0;

        // --------------------------------
        // TEST 2: LOAD
        // Read memory[5]
        // --------------------------------

        #10;

        address  = 32'd20;
        mem_read = 1;

        #10;


        // TEST 3: Another STORE
        // memory[10] = 456
        // address = 40


        mem_read   = 0;
        address    = 32'd40;
        write_data = 32'd456;
        mem_write  = 1;

        #10;

        mem_write = 0;

        // TEST 4: Load memory[10]
        #10;

        address  = 32'd40;
        mem_read = 1;

        #10;

        mem_read = 0;

        #10;

        $finish;

    end

    // Generate waveform
    initial begin
        $dumpfile("sim/data_memory.vcd");
        $dumpvars(0, tb_data_memory);
    end

endmodule
