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

    reg [18:0] pcm_data [15:0];
    reg [18:0] delayed_pcm_data [15:0];
    reg [5:0] mic_delays [15:0];  

    assign pcm_data[0] <= pcm_data_0;
    assign pcm_data[1] <= pcm_data_1;
    assign pcm_data[2] <= pcm_data_2;
    assign pcm_data[3] <= pcm_data_3;
    assign pcm_data[4] <= pcm_data_4;
    assign pcm_data[5] <= pcm_data_5;
    assign pcm_data[6] <= pcm_data_6;
    assign pcm_data[7] <= pcm_data_7;
    assign pcm_data[8] <= pcm_data_8;
    assign pcm_data[9] <= pcm_data_9;
    assign pcm_data[10] <= pcm_data_10;
    assign pcm_data[11] <= pcm_data_11;
    assign pcm_data[12] <= pcm_data_12;
    assign pcm_data[13] <= pcm_data_13;
    assign pcm_data[14] <= pcm_data_14;
    assign pcm_data[15] <= pcm_data_15;

    assign delayed_pcm_data_0 <= delayed_pcm_data[0];
    assign delayed_pcm_data_1 <= delayed_pcm_data[1];
    assign delayed_pcm_data_2 <= delayed_pcm_data[2];
    assign delayed_pcm_data_3 <= delayed_pcm_data[3];
    assign delayed_pcm_data_4 <= delayed_pcm_data[4];
    assign delayed_pcm_data_5 <= delayed_pcm_data[5];
    assign delayed_pcm_data_6 <= delayed_pcm_data[6];
    assign delayed_pcm_data_7 <= delayed_pcm_data[7];
    assign delayed_pcm_data_8 <= delayed_pcm_data[8];
    assign delayed_pcm_data_9 <= delayed_pcm_data[9];
    assign delayed_pcm_data_10 <= delayed_pcm_data[10];
    assign delayed_pcm_data_11 <= delayed_pcm_data[11];
    assign delayed_pcm_data_12 <= delayed_pcm_data[12];
    assign delayed_pcm_data_13 <= delayed_pcm_data[13];
    assign delayed_pcm_data_14 <= delayed_pcm_data[14];
    assign delayed_pcm_data_15 <= delayed_pcm_data[15];

    integer j;

    always @(posedge clk or posedge rst) begin
      if (rst) begin 
        for (j = 0; j < 16; j = j + 1) begin
          pcm_data[j] <= 19'b0;
          delayed_pcm_data[j] <= 19'b0;
        end
      end else begin
        case (delay_select)
          0 : mic_delays <= '{0,4,10,12,14,18,0,0,0,0,0,4,10,12,14,18};
          1 : mic_delays <= '{0,0,0,0,0,0,3,9,15,21,24,24,24,24,24,24};
          2 : mic_delays <= '{24,24,24,24,24,24,21,15,9,3,0,0,0,0,0,0};
          3 : mic_delays <= '{0,2,4,6,8,10,12,14,0,2,4,6,8,10,12,14};
          4 : mic_delays <= '{0,1,4,8,10,12,14,15,17,1,5,9,11,13,16,18};

          5 : mic_delays <= '{18,14,10,8,6,4,2,0,18,14,10,8,6,4,2,0};
          6 : mic_delays <= '{24,19,21,16,18,14,16,11,13,8,10,5,7,2,4,0};
          7 : mic_delays <= '{23,21,20,18,17,15,14,12,11,9,8,6,5,3,1,0};
          8 : mic_delays <= '{0,1,4,9,14,19,24,27,28,27,24,19,14,9,4,1};
          9 : mic_delays <= '{21,21,21,21,14,14,14,14,7,7,7,7,0,0,0,0};

          10 : mic_delays <= '{0,8,6,14,20,20,28,20,20,14,6,8,0,8,6,14};
          11 : mic_delays <= '{2,7,0,12,12,17,26,21,26,16,14,11,2,7,0,12};
          12 : mic_delays <= '{9,10,0,12,7,15,23,22,31,20,24,17,9,10,0,12};
          13 : mic_delays <= '{14,10,0,10,0,10,14,18,28,18,28,18,14,10,0,10};
          14 : mic_delays <= '{22,14,7,11,0,9,8,16,24,19,31,21,22,14,7,11};

          /*
          15 : mic_delays <= '{};
          16 : mic_delays <= '{};
          17 : mic_delays <= '{};
          18 : mic_delays <= '{};
          19 : mic_delays <= '{};

          20 : mic_delays <= '{};
          21 : mic_delays <= '{};
          22 : mic_delays <= '{};
          23 : mic_delays <= '{};
          24 : mic_delays <= '{};
          */

          25 : mic_delays <= '{8,13,18,23,5,10,15,20,2,7,12,17,0,4,9,14};
          26 : mic_delays <= '{23,18,13,8,20,17,15,26,29,31,28,33,38,15,8,0};
          27 : mic_delays <= '{23,20,17,15,18,13,8,28,33,38,26,29,31,15,8,0};
          28 : mic_delays <= '{17,17,17,17,11,6,0,23,28,34,17,17,17,11,6,0};
          29 : mic_delays <= '{15,18,21,23,10,5,0,20,25,30,12,9,7,13,11,9};

          30 : mic_delays <= '{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
          31 : mic_delays <= '{1,2,3,4,7,11,18,29,3,4,5,6,9,13,20,31};
        endcase
      end
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
