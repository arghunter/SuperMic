module tb_top_ddr_to_sdr;

    // Testbench signals
    reg clk;
    reg rst;
    reg [7:0] ddr_data;
    wire [7:0] sdr_data_0;
    wire [7:0] sdr_data_1;

    // Instantiate the top module
    top_ddr_to_sdr uut (
        .clk(clk),
        .rst(rst),
        .ddr_data(ddr_data),
        .sdr_data_0(sdr_data_0),
        .sdr_data_1(sdr_data_1)
    );

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        ddr_data = 8'h00;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: Apply a pattern to ddr_data
        ddr_data = 8'hAA; // Example pattern: 10101010

        #10;
        ddr_data = 8'h55; // Example pattern: 01010101

        #10;
        ddr_data = 8'hFF; // Example pattern: 11111111

        #10;
        ddr_data = 8'h00; // Example pattern: 00000000

        // End simulation after a few cycles
        #50;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t, clk=%b, rst=%b, ddr_data=%h, sdr_data_0=%h, sdr_data_1=%h",
                 $time, clk, rst, ddr_data, sdr_data_0, sdr_data_1[0]);
        $dumpfile("tb_top_ddr_to_sdr");
        $dumpvars(0,tb_top_ddr_to_sdr);
    end

endmodule
