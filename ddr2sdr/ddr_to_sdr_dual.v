module ddr_to_sdr_dual(
    input wire clk,          // System clock
    input wire rst,          // Reset signal
    input wire ddr_data,     // DDR data input from microphones
    output reg sdr_data_0,   // SDR data output for microphone 0
    output reg sdr_data_1    // SDR data output for microphone 1
);

    reg ddr_data_rising;     // Data captured on the rising edge
    reg ddr_data_falling;    // Data captured on the falling edge



    // Capture data on the falling edge of the clock
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            ddr_data_falling <= 1'b0;
        end else begin
            ddr_data_falling <= ddr_data;
        end
    end

    // Assign SDR outputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sdr_data_0 <= 1'b0;
            sdr_data_1 <= 1'b0;
            ddr_data_rising <= 1'b0;
        end else begin
            ddr_data_rising <= ddr_data;
            sdr_data_0 <= ddr_data_rising; // Output data for microphone 0 (rising edge data)
            sdr_data_1 <= ddr_data_falling; // Output data for microphone 1 (falling edge data)
        end
    end

endmodule
