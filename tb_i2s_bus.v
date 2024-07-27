`timescale 1ns / 1ps

module tb_i2s_bus;

    // Inputs
    reg clk;
    reg rst;
    reg lr_clk;
    reg [31:0] bit_data;

    // Outputsph \\
    wire out;

    // Instantiate the Unit Under Test (UUT)
    i2s_bus uut (
        .clk(clk),
        .rst(rst),
        .lr_clk(lr_clk),
        .bit_data(bit_data),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100 MHz clock
    end

    // Generate lr_clk with a different period
    initial begin
        lr_clk = 0;
        forever #320 lr_clk = ~lr_clk;  // Toggle every 320ns
    end

    // Test stimulus
    initial begin
        // Initialize Inputs
        rst = 1;
        bit_data = 32'b0;

        // Wait for global reset
        #100;
        rst = 0;

        // Apply test vectors
        #100;
        bit_data = 32'hA5A5A5A5;  // Example test data
        #640;  // Wait for some cycles
        bit_data = 32'h5A5A5A5A;  // Another example test data
        #640;  // Wait for some cycles
        bit_data = 32'hFFFFFFFF;  // Another example test data
        #640;  // Wait for some cycles

        // End simulation
        #2000;
        $stop;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time = %t, clk = %b, rst = %b, lr_clk = %b, bit_data = %h, out = %b", 
                  $time, clk, rst, lr_clk, bit_data, out);
    end

    // Waveform logging
    initial begin
        $dumpfile("tb_i2s_bus.vcd");  // Name of the VCD file
        $dumpvars(0, tb_i2s_bus);     // Dump all variables in the tb_i2s_bus module
    end

endmodule
