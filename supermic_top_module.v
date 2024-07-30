module supermic_top_module(
    input wire clk,
    input wire rst,
    input wire lr_clk,
    input wire [4:0] delay_select,
    input wire [7:0] pdm,
    output wire i2s_out,
    output wire mic_clk
);
    wire [15:0] sdr_data;
    wire [18:0] cic_data [15:0];
    wire [18:0] delayed_data [15:0];
    wire carry;
    wire [22:0] sum_out;

    genvar i;
    generate
        // DDR to sdr
        top_ddr_to_sdr u_top_ddr_to_sdr (
            .clk(clk),
            .rst(rst),
            .ddr_data(pdm),
            .sdr_data_0(sdr_data[7:0]),
            .sdr_data_1(sdr_data[15:8])
        );
      
        // 16 cic filters
        for (i=0;i<16;i=i+1) begin : cic_inst
            cic u_cic (
            .clk(clk),
            .lr_clk(lr_clk),
            .i_reset(rst),
            .i_data(sdr_data[i]),
            .o_data(cic_data[i])
            );         
        end

        // delays
        // 1 3 5 7 9 11 13 15
        // 2 4 6 8 10 12 14 16
        delay_module u_delay_module (
            .clk(clk),
            .rst(rst),
            .delay_select(delay_select),
            .pcm_data_0(cic_data[0]),
            .pcm_data_1(cic_data[8]),
            .pcm_data_2(cic_data[1]),
            .pcm_data_3(cic_data[9]),
            .pcm_data_4(cic_data[2]),
            .pcm_data_5(cic_data[10]),
            .pcm_data_6(cic_data[3]),
            .pcm_data_7(cic_data[11]),
            .pcm_data_8(cic_data[4]),
            .pcm_data_9(cic_data[12]),
            .pcm_data_10(cic_data[5]),
            .pcm_data_11(cic_data[13]),
            .pcm_data_12(cic_data[6]),
            .pcm_data_13(cic_data[14]),
            .pcm_data_14(cic_data[7]),
            .pcm_data_15(cic_data[15]),
            .delayed_pcm_data_0(delayed_data[0]),
            .delayed_pcm_data_1(delayed_data[1]),
            .delayed_pcm_data_2(delayed_data[2]),
            .delayed_pcm_data_3(delayed_data[3]),
            .delayed_pcm_data_4(delayed_data[4]),
            .delayed_pcm_data_5(delayed_data[5]),
            .delayed_pcm_data_6(delayed_data[6]),
            .delayed_pcm_data_7(delayed_data[7]),
            .delayed_pcm_data_8(delayed_data[8]),
            .delayed_pcm_data_9(delayed_data[9]),
            .delayed_pcm_data_10(delayed_data[10]),
            .delayed_pcm_data_11(delayed_data[11]),
            .delayed_pcm_data_12(delayed_data[12]),
            .delayed_pcm_data_13(delayed_data[13]),
            .delayed_pcm_data_14(delayed_data[14]),
            .delayed_pcm_data_15(delayed_data[15])
        );

        // adder
        adder_16x23bit u_adder_16x23bit (
            .in_0(delayed_data[0]),
            .in_1(delayed_data[1]),
            .in_2(delayed_data[2]),
            .in_3(delayed_data[3]),
            .in_4(delayed_data[4]),
            .in_5(delayed_data[5]),
            .in_6(delayed_data[6]),
            .in_7(delayed_data[7]),
            .in_8(delayed_data[8]),
            .in_9(delayed_data[9]),
            .in_10(delayed_data[10]),
            .in_11(delayed_data[11]),
            .in_12(delayed_data[12]),
            .in_13(delayed_data[13]),
            .in_14(delayed_data[14]),
            .in_15(delayed_data[15]),
            .sum(sum_out),
            .carry_out(carry)
        );

        // i2s bus
        i2s_bus u_i2s_bus (
            .clk(clk),
            .rst(rst),
            .lr_clk(lr_clk),
            .bit_data(sum_out),
            .out(i2s_out)
        ); 

    endgenerate

assign mic_clk = lr_clk;

endmodule
