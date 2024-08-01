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
  output wire [18:0] delayed_pcm_data_0,
  output wire [18:0] delayed_pcm_data_1,
  output wire [18:0] delayed_pcm_data_2,
  output wire [18:0] delayed_pcm_data_3,
  output wire [18:0] delayed_pcm_data_4,
  output wire [18:0] delayed_pcm_data_5,
  output wire [18:0] delayed_pcm_data_6,
  output wire [18:0] delayed_pcm_data_7
);

    wire [18:0] pcm_data [7:0];
    wire [18:0] delayed_pcm_data [7:0];
    reg [4:0] mic_delays [7:0];  


    integer x;
    initial begin
      for (x = 0; x < 8; x = x + 1) begin
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

    assign delayed_pcm_data_0 = delayed_pcm_data[0];
    assign delayed_pcm_data_1 = delayed_pcm_data[1];
    assign delayed_pcm_data_2 = delayed_pcm_data[2];
    assign delayed_pcm_data_3 = delayed_pcm_data[3];
    assign delayed_pcm_data_4 = delayed_pcm_data[4];
    assign delayed_pcm_data_5 = delayed_pcm_data[5];
    assign delayed_pcm_data_6 = delayed_pcm_data[6];
    assign delayed_pcm_data_7 = delayed_pcm_data[7];

    always @(delay_select) begin
        case (delay_select)
	  0 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 4;
                mic_delays[2] = 10;
                mic_delays[3] = 12;
                mic_delays[4] = 14;
                mic_delays[5] = 18;
                mic_delays[6] = 0;
                mic_delays[7] = 0;
            end
    endcase
    end

    genvar i;

    generate
      for (i = 0; i < 8; i = i + 1) begin : delay_line_gen
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
