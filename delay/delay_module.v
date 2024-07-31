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
5'd0 : mic_delays <= '{6'd0,6'd4,6'd10,6'd12,6'd14,6'd18,6'd0,6'd0,6'd0,6'd0,6'd0,6'd4,6'd10,6'd12,6'd14,6'd18};
5'd1 : mic_delays <= '{6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd3,6'd9,6'd15,6'd21,6'd24,6'd24,6'd24,6'd24,6'd24,6'd24};
5'd2 : mic_delays <= '{6'd24,6'd24,6'd24,6'd24,6'd24,6'd24,6'd21,6'd15,6'd9,6'd3,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0};
5'd3 : mic_delays <= '{6'd0,6'd2,6'd4,6'd6,6'd8,6'd10,6'd12,6'd14,6'd0,6'd2,6'd4,6'd6,6'd8,6'd10,6'd12,6'd14};
5'd4 : mic_delays <= '{6'd0,6'd1,6'd4,6'd8,6'd10,6'd12,6'd14,6'd15,6'd17,6'd1,6'd5,6'd9,6'd11,6'd13,6'd16,6'd18};

5'd5 : mic_delays <= '{6'd18,6'd14,6'd10,6'd8,6'd6,6'd4,6'd2,6'd0,6'd18,6'd14,6'd10,6'd8,6'd6,6'd4,6'd2,6'd0};
5'd6 : mic_delays <= '{6'd24,6'd19,6'd21,6'd16,6'd18,6'd14,6'd16,6'd11,6'd13,6'd8,6'd10,6'd5,6'd7,6'd2,6'd4,6'd0};
5'd7 : mic_delays <= '{6'd23,6'd21,6'd20,6'd18,6'd17,6'd15,6'd14,6'd12,6'd11,6'd9,6'd8,6'd6,6'd5,6'd3,6'd1,6'd0};
5'd8 : mic_delays <= '{6'd0,6'd1,6'd4,6'd9,6'd14,6'd19,6'd24,6'd27,6'd28,6'd27,6'd24,6'd19,6'd14,6'd9,6'd4,6'd1};
5'd9 : mic_delays <= '{6'd21,6'd21,6'd21,6'd21,6'd14,6'd14,6'd14,6'd14,6'd7,6'd7,6'd7,6'd7,6'd0,6'd0,6'd0,6'd0};

5'd10 : mic_delays <= '{6'd0,6'd8,6'd6,6'd14,6'd20,6'd20,6'd28,6'd20,6'd20,6'd14,6'd6,6'd8,6'd0,6'd8,6'd6,6'd14};
5'd11 : mic_delays <= '{6'd2,6'd7,6'd0,6'd12,6'd12,6'd17,6'd26,6'd21,6'd26,6'd16,6'd14,6'd11,6'd2,6'd7,6'd0,6'd12};
5'd12 : mic_delays <= '{6'd9,6'd10,6'd0,6'd12,6'd7,6'd15,6'd23,6'd22,6'd31,6'd20,6'd24,6'd17,6'd9,6'd10,6'd0,6'd12};
5'd13 : mic_delays <= '{6'd14,6'd10,6'd0,6'd10,6'd0,6'd10,6'd14,6'd18,6'd28,6'd18,6'd28,6'd18,6'd14,6'd10,6'd0,6'd10};
5'd14 : mic_delays <= '{6'd22,6'd14,6'd7,6'd11,6'd0,6'd9,6'd8,6'd16,6'd24,6'd19,6'd31,6'd21,6'd22,6'd14,6'd7,6'd11};

5'd15 : mic_delays <= '{6'd7,6'd0,6'd3,6'd11,6'd14,6'd4,6'd1,6'd1,6'd7,6'd13,6'd13,6'd10,6'd6,6'd4,6'd6,6'd8};
5'd16 : mic_delays <= '{6'd4,6'd0,6'd6,6'd13,6'd12,6'd3,6'd2,6'd4,6'd10,6'd14,6'd12,6'd8,6'd4,6'd5,6'd8,6'd11};
5'd17 : mic_delays <= '{6'd0,6'd0,6'd8,6'd12,6'd7,6'd1,6'd2,6'd6,6'd10,6'd11,6'd8,6'd4,6'd2,6'd5,6'd9,6'd10};
5'd18 : mic_delays <= '{6'd0,6'd4,6'd11,6'd11,6'd4,6'd3,6'd6,6'd10,6'd11,6'd10,6'd6,6'd3,6'd3,6'd7,6'd11,6'd11};
5'd19 : mic_delays <= '{6'd0,6'd7,6'd12,6'd8,6'd0,6'd4,6'd8,6'd11,6'd10,6'd6,6'd2,6'd1,6'd3,6'd7,6'd10,6'd9};

5'd20 : mic_delays <= '{6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd1,6'd1,6'd1,6'd1,6'd1,6'd1,6'd1,6'd0,6'd70};
5'd21 : mic_delays <= '{6'd0,6'd3,6'd3,6'd3,6'd3,6'd3,6'd3,6'd4,6'd4,6'd4,6'd4,6'd4,6'd4,6'd3,6'd3,6'd3};
5'd22 : mic_delays <= '{6'd0,6'd5,6'd5,6'd5,6'd5,6'd6,6'd6,6'd6,6'd6,6'd6,6'd6,6'd6,6'd5,6'd5,6'd5,6'd5};
5'd23 : mic_delays <= '{6'd0,6'd6,6'd6,6'd6,6'd6,6'd7,6'd7,6'd7,6'd7,6'd7,6'd6,6'd6,6'd6,6'd6,6'd5,6'd5};
5'd24 : mic_delays <= '{6'd0,6'd5,6'd5,6'd5,6'd6,6'd6,6'd6,6'd6,6'd6,6'd5,6'd5,6'd5,6'd5,6'd4,6'd4,6'd4};

5'd25 : mic_delays <= '{6'd8,6'd13,6'd18,6'd23,6'd5,6'd10,6'd15,6'd20,6'd2,6'd7,6'd12,6'd17,6'd0,6'd4,6'd9,6'd14};
5'd26 : mic_delays <= '{6'd23,6'd18,6'd13,6'd8,6'd20,6'd17,6'd15,6'd26,6'd29,6'd31,6'd28,6'd33,6'd38,6'd15,6'd8,6'd0};
5'd27 : mic_delays <= '{6'd23,6'd20,6'd17,6'd15,6'd18,6'd13,6'd8,6'd28,6'd33,6'd38,6'd26,6'd29,6'd31,6'd15,6'd8,6'd0};
5'd28 : mic_delays <= '{6'd17,6'd17,6'd17,6'd17,6'd11,6'd6,6'd0,6'd23,6'd28,6'd34,6'd17,6'd17,6'd17,6'd11,6'd6,6'd0};
5'd29 : mic_delays <= '{6'd15,6'd18,6'd21,6'd23,6'd10,6'd5,6'd0,6'd20,6'd25,6'd30,6'd12,6'd9,6'd7,6'd13,6'd11,6'd9};

5'd30 : mic_delays <= '{6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0,6'd0};
5'd31 : mic_delays <= '{6'd1,6'd2,6'd3,6'd4,6'd7,6'd11,6'd18,6'd29,6'd3,6'd4,6'd5,6'd6,6'd9,6'd13,6'd20,6'd31};	  
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
