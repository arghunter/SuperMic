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

    integer j;

    always @(posedge clk or posedge rst) begin
      begin
        case (delay_select)
5'0 : mic_delays <= '{6'0,6'4,6'10,6'12,6'14,6'18,6'0,6'0,6'0,6'0,6'0,6'4,6'10,6'12,6'14,6'18};
5'1 : mic_delays <= '{6'0,6'0,6'0,6'0,6'0,6'0,6'3,6'9,6'15,6'21,6'24,6'24,6'24,6'24,6'24,6'24};
5'2 : mic_delays <= '{6'24,6'24,6'24,6'24,6'24,6'24,6'21,6'15,6'9,6'3,6'0,6'0,6'0,6'0,6'0,6'0};
5'3 : mic_delays <= '{6'0,6'2,6'4,6'6,6'8,6'10,6'12,6'14,6'0,6'2,6'4,6'6,6'8,6'10,6'12,6'14};
5'4 : mic_delays <= '{6'0,6'1,6'4,6'8,6'10,6'12,6'14,6'15,6'17,6'1,6'5,6'9,6'11,6'13,6'16,6'18};

5'5 : mic_delays <= '{6'18,6'14,6'10,6'8,6'6,6'4,6'2,6'0,6'18,6'14,6'10,6'8,6'6,6'4,6'2,6'0};
5'6 : mic_delays <= '{6'24,6'19,6'21,6'16,6'18,6'14,6'16,6'11,6'13,6'8,6'10,6'5,6'7,6'2,6'4,6'0};
5'7 : mic_delays <= '{6'23,6'21,6'20,6'18,6'17,6'15,6'14,6'12,6'11,6'9,6'8,6'6,6'5,6'3,6'1,6'0};
5'8 : mic_delays <= '{6'0,6'1,6'4,6'9,6'14,6'19,6'24,6'27,6'28,6'27,6'24,6'19,6'14,6'9,6'4,6'1};
5'9 : mic_delays <= '{6'21,6'21,6'21,6'21,6'14,6'14,6'14,6'14,6'7,6'7,6'7,6'7,6'0,6'0,6'0,6'0};

5'10 : mic_delays <= '{6'0,6'8,6'6,6'14,6'20,6'20,6'28,6'20,6'20,6'14,6'6,6'8,6'0,6'8,6'6,6'14};
5'11 : mic_delays <= '{6'2,6'7,6'0,6'12,6'12,6'17,6'26,6'21,6'26,6'16,6'14,6'11,6'2,6'7,6'0,6'12};
5'12 : mic_delays <= '{6'9,6'10,6'0,6'12,6'7,6'15,6'23,6'22,6'31,6'20,6'24,6'17,6'9,6'10,6'0,6'12};
5'13 : mic_delays <= '{6'14,6'10,6'0,6'10,6'0,6'10,6'14,6'18,6'28,6'18,6'28,6'18,6'14,6'10,6'0,6'10};
5'14 : mic_delays <= '{6'22,6'14,6'7,6'11,6'0,6'9,6'8,6'16,6'24,6'19,6'31,6'21,6'22,6'14,6'7,6'11};

5'15 : mic_delays <= '{6'7,6'0,6'3,6'11,6'14,6'4,6'1,6'1,6'7,6'13,6'13,6'10,6'6,6'4,6'6,6'8};
5'16 : mic_delays <= '{6'4,6'0,6'6,6'13,6'12,6'3,6'2,6'4,6'10,6'14,6'12,6'8,6'4,6'5,6'8,6'11};
5'17 : mic_delays <= '{6'0,6'0,6'8,6'12,6'7,6'1,6'2,6'6,6'10,6'11,6'8,6'4,6'2,6'5,6'9,6'10};
5'18 : mic_delays <= '{6'0,6'4,6'11,6'11,6'4,6'3,6'6,6'10,6'11,6'10,6'6,6'3,6'3,6'7,6'11,6'11};
5'19 : mic_delays <= '{6'0,6'7,6'12,6'8,6'0,6'4,6'8,6'11,6'10,6'6,6'2,6'1,6'3,6'7,6'10,6'9};

5'20 : mic_delays <= '{6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'1,6'1,6'1,6'1,6'1,6'1,6'1,6'0,6'70};
5'21 : mic_delays <= '{6'0,6'3,6'3,6'3,6'3,6'3,6'3,6'4,6'4,6'4,6'4,6'4,6'4,6'3,6'3,6'3};
5'22 : mic_delays <= '{6'0,6'5,6'5,6'5,6'5,6'6,6'6,6'6,6'6,6'6,6'6,6'6,6'5,6'5,6'5,6'5};
5'23 : mic_delays <= '{6'0,6'6,6'6,6'6,6'6,6'7,6'7,6'7,6'7,6'7,6'6,6'6,6'6,6'6,6'5,6'5};
5'24 : mic_delays <= '{6'0,6'5,6'5,6'5,6'6,6'6,6'6,6'6,6'6,6'5,6'5,6'5,6'5,6'4,6'4,6'4};

5'25 : mic_delays <= '{6'8,6'13,6'18,6'23,6'5,6'10,6'15,6'20,6'2,6'7,6'12,6'17,6'0,6'4,6'9,6'14};
5'26 : mic_delays <= '{6'23,6'18,6'13,6'8,6'20,6'17,6'15,6'26,6'29,6'31,6'28,6'33,6'38,6'15,6'8,6'0};
5'27 : mic_delays <= '{6'23,6'20,6'17,6'15,6'18,6'13,6'8,6'28,6'33,6'38,6'26,6'29,6'31,6'15,6'8,6'0};
5'28 : mic_delays <= '{6'17,6'17,6'17,6'17,6'11,6'6,6'0,6'23,6'28,6'34,6'17,6'17,6'17,6'11,6'6,6'0};
5'29 : mic_delays <= '{6'15,6'18,6'21,6'23,6'10,6'5,6'0,6'20,6'25,6'30,6'12,6'9,6'7,6'13,6'11,6'9};

5'30 : mic_delays <= '{6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'0,6'0};
5'31 : mic_delays <= '{6'1,6'2,6'3,6'4,6'7,6'11,6'18,6'29,6'3,6'4,6'5,6'6,6'9,6'13,6'20,6'31};
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
