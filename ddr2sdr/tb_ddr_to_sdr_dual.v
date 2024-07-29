`timescale 1ns / 1ps

module tb_ddr_to_sdr_dual;

    // Inputs
    reg clk;
    reg rst;
    reg ddr_data;

    // Outputs
    wire sdr_data_0;
    wire sdr_data_1;

    // Instantiate the Unit Under Test (UUT)
    ddr_to_sdr_dual uut (
        .clk(clk),
        .rst(rst),
        .ddr_data(ddr_data),
        .sdr_data_0(sdr_data_0),
        .sdr_data_1(sdr_data_1)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 1;
        ddr_data = 0;

        // Wait for the global reset
        #20 rst = 0;

        // Apply test stimulus
        // DDR data pattern for mic 0 = 1, mic 1 = 0
        // DDR data should be 1 on rising edge and 0 on falling edge
        repeat (10) begin
            @(posedge clk) ddr_data = 1; // rising edge
            @(negedge clk) ddr_data = 0; // falling edge
        end

        // Finish simulation
        #50 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t, clk=%b, rst=%b, ddr_data=%b, sdr_data_0=%b, sdr_data_1=%b",
                 $time, clk, rst, ddr_data, sdr_data_0, sdr_data_1);
    end

endmodule
