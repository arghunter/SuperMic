module delay_module (
  input wire clk,
  input wire rst,
  input wire [4:0] delay_select,
  input wire [18:0] pcm_data_0,
  input wire [18:0] pcm_data_1,
  input wire [18:0] pcm_data_2,
  input wire [18:0] pcm_data_3,
  input wire [18:0] pcm_data_4,
  input wire [18:0] pcm_data_5,
  input wire [18:0] pcm_data_6,
  input wire [18:0] pcm_data_7,
  input wire [18:0] pcm_data_8,
  input wire [18:0] pcm_data_9,
  input wire [18:0] pcm_data_10,
  input wire [18:0] pcm_data_11,
  input wire [18:0] pcm_data_12,
  input wire [18:0] pcm_data_13,
  input wire [18:0] pcm_data_14,
  input wire [18:0] pcm_data_15,
  output wire [18:0] delayed_pcm_data_0,
  output wire [18:0] delayed_pcm_data_1,
  output wire [18:0] delayed_pcm_data_2,
  output wire [18:0] delayed_pcm_data_3,
  output wire [18:0] delayed_pcm_data_4,
  output wire [18:0] delayed_pcm_data_5,
  output wire [18:0] delayed_pcm_data_6,
  output wire [18:0] delayed_pcm_data_7,
  output wire [18:0] delayed_pcm_data_8,
  output wire [18:0] delayed_pcm_data_9,
  output wire [18:0] delayed_pcm_data_10,
  output wire [18:0] delayed_pcm_data_11,
  output wire [18:0] delayed_pcm_data_12,
  output wire [18:0] delayed_pcm_data_13,
  output wire [18:0] delayed_pcm_data_14,
  output wire [18:0] delayed_pcm_data_15
);

    wire [18:0] pcm_data [15:0];
    wire [18:0] delayed_pcm_data [15:0];
    reg [4:0] mic_delays [15:0];  

    integer x;
    initial begin
      for (x = 0; x < 16; x = x + 1) begin
        mic_delays[x] = 0;
       end
    end

    assign pcm_data[0] = pcm_data_0;
    assign pcm_data[1] = pcm_data_1;
    assign pcm_data[2] = pcm_data_2;
    assign pcm_data[3] = pcm_data_3;
    assign pcm_data[4] = pcm_data_4;
    assign pcm_data[5] = pcm_data_5;
    assign pcm_data[6] = pcm_data_6;
    assign pcm_data[7] = pcm_data_7;
    assign pcm_data[8] = pcm_data_8;
    assign pcm_data[9] = pcm_data_9;
    assign pcm_data[10] = pcm_data_10;
    assign pcm_data[11] = pcm_data_11;
    assign pcm_data[12] = pcm_data_12;
    assign pcm_data[13] = pcm_data_13;
    assign pcm_data[14] = pcm_data_14;
    assign pcm_data[15] = pcm_data_15;

    assign delayed_pcm_data_0 = delayed_pcm_data[0];
    assign delayed_pcm_data_1 = delayed_pcm_data[1];
    assign delayed_pcm_data_2 = delayed_pcm_data[2];
    assign delayed_pcm_data_3 = delayed_pcm_data[3];
    assign delayed_pcm_data_4 = delayed_pcm_data[4];
    assign delayed_pcm_data_5 = delayed_pcm_data[5];
    assign delayed_pcm_data_6 = delayed_pcm_data[6];
    assign delayed_pcm_data_7 = delayed_pcm_data[7];
    assign delayed_pcm_data_8 = delayed_pcm_data[8];
    assign delayed_pcm_data_9 = delayed_pcm_data[9];
    assign delayed_pcm_data_10 = delayed_pcm_data[10];
    assign delayed_pcm_data_11 = delayed_pcm_data[11];
    assign delayed_pcm_data_12 = delayed_pcm_data[12];
    assign delayed_pcm_data_13 = delayed_pcm_data[13];
    assign delayed_pcm_data_14 = delayed_pcm_data[14];
    assign delayed_pcm_data_15 = delayed_pcm_data[15];

    always @(delay_select) begin
        case (delay_select)
	  0: begin
                mic_delays[0] = 0;
                mic_delays[1] = 4;
                mic_delays[2] = 10;
                mic_delays[3] = 12;
                mic_delays[4] = 14;
                mic_delays[5] = 18;
                mic_delays[6] = 0;
                mic_delays[7] = 0;
                mic_delays[8] = 0;
                mic_delays[9] = 0;
                mic_delays[10] = 0;
                mic_delays[11] = 4;
                mic_delays[12] = 10;
                mic_delays[13] = 12;
                mic_delays[14] = 14;
                mic_delays[15] = 18;
            end
    endcase
    end

    genvar i;

    generate
      for (i = 0; i < 16; i = i + 1) begin : delay_line_gen
      delay_line u_delay_line (
        .clk(clk),
        .rst(rst),
        .delay(mic_delays[i]),
        .pcm_data(pcm_data[i]),
        .delayed_pcm_data(delayed_pcm_data[i])
      );
      end
    endgenerate

endmodule
