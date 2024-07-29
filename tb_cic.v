module testbench;

// Clock and reset signals
reg clk;
reg lr_clk;
reg reset;

// Input signal
reg input_signal;

// Output signal (if any, replace 'output_signal' with the actual output of your DUT)
wire output_signal;

// Instantiate the DUT (Device Under Test)
your_module_name dut (
    .clk(clk),
    .lr_clk(lr_clk),
    .reset(reset),
    .input_signal(input_signal),
    .output_signal(output_signal) // Adjust based on actual DUT ports
);

// Clock generation for clk (3.072 MHz)
initial begin
    clk = 0;
    forever #162.76 clk = ~clk; // Half period = 1 / (2 * 3.072 MHz) = 162.76 ns
end

// Clock generation for lr_clk (48 kHz)
initial begin
    lr_clk = 0;
    forever #10416.67 lr_clk = ~lr_clk; // Half period = 1 / (2 * 48 kHz) = 10416.67 ns
end

// Initial block for reset and input signal generation
initial begin
    // Initialize reset
    reset = 1;
    #1000;
    reset = 0;

    // Read input data from file and apply it to input_signal
    $readmemb("pdm_sine_wave_1_binary.txt", input_data);

    integer i;
    for (i = 0; i < $size(input_data); i = i + 1) begin
        input_signal = input_data[i];
        @(posedge clk); // Apply input at the rising edge of clk
    end

    // Finish simulation
    #1000;
    $finish;
end

// Convert input data from -1 and 1 to 0 and 1
initial begin
    integer infile, outfile, c;
    infile = $fopen("pdm_sine_wave_1.txt", "r");
    outfile = $fopen("pdm_sine_wave_1_binary.txt", "w");
    while (!$feof(infile)) begin
        c = $fgetc(infile);
        if (c == "-")
            $fwrite(outfile, "0\n");
        else if (c == "1")
            $fwrite(outfile, "1\n");
    end
    $fclose(infile);
    $fclose(outfile);
end
initial begin
        $dumpfile("tb_cic.vcd");  // Name of the VCD file
        $dumpvars(0, testbench);     // Dump all variables in the tb_i2s_bus module
    end

// Memory to store input data
reg [0:0] input_data [0:262143]; // Adjust the size based on your input data length

endmodule
