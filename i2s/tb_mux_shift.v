`timescale 1ns / 1ps

module tb_mux_shift;

    // Inputs
    reg clk;
    reg rst;
    reg lr_clk;
    reg last_shift;
    reg sum_res;

    // Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux_shift uut (
        .clk(clk),
        .rst(rst),
        .lr_clk(lr_clk),
        .last_shift(last_shift),
        .sum_res(sum_res),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100 MHz clock
    end

    // Generate lr_clk
    initial begin
        lr_clk = 0;
        forever #320 lr_clk = ~lr_clk;  // Toggle every 80ns (12.5 MHz)
    end

    // Test stimulus
    initial begin
        // Initialize Inputs
        rst = 1;
        last_shift = 0;
        sum_res = 0;

        // Wait for global reset
        #100;
        rst = 0;

        // Apply test vectors
        #100;
        sum_res = 1;
        #160;  // Wait for some cycles
        sum_res = 0;
        last_shift = 1;
        #160;  // Wait for some cycles
        sum_res = 1;
        last_shift = 0;
        #160;  // Wait for some cycles

        // End simulation
        #1000;
        $stop;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time = %t, clk = %b, rst = %b, lr_clk = %b, last_shift = %b, sum_res = %b, out = %b", 
                  $time, clk, rst, lr_clk, last_shift, sum_res, out);
        $dumpfile("tb_mux_shift");
        $dumpvars(0,tb_mux_shift);
    end

endmodule
