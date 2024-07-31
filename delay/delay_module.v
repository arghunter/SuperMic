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

    always @* begin
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
            1: begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 0;
                mic_delays[3] = 0;
                mic_delays[4] = 0;
                mic_delays[5] = 0;
                mic_delays[6] = 3;
                mic_delays[7] = 9;
                mic_delays[8] = 15;
                mic_delays[9] = 21;
                mic_delays[10] = 24;
                mic_delays[11] = 24;
                mic_delays[12] = 24;
                mic_delays[13] = 24;
                mic_delays[14] = 24;
                mic_delays[15] = 24;
            end
            2: begin
                mic_delays[0] = 24;
                mic_delays[1] = 24;
                mic_delays[2] = 24;
                mic_delays[3] = 24;
                mic_delays[4] = 24;
                mic_delays[5] = 24;
                mic_delays[6] = 21;
                mic_delays[7] = 15;
                mic_delays[8] = 9;
                mic_delays[9] = 3;
                mic_delays[10] = 0;
                mic_delays[11] = 0;
                mic_delays[12] = 0;
                mic_delays[13] = 0;
                mic_delays[14] = 0;
                mic_delays[15] = 0;
            end
            3: begin
                mic_delays[0] = 0;
                mic_delays[1] = 2;
                mic_delays[2] = 4;
                mic_delays[3] = 6;
                mic_delays[4] = 8;
                mic_delays[5] = 10;
                mic_delays[6] = 12;
                mic_delays[7] = 14;
                mic_delays[8] = 0;
                mic_delays[9] = 2;
                mic_delays[10] = 4;
                mic_delays[11] = 6;
                mic_delays[12] = 8;
                mic_delays[13] = 10;
                mic_delays[14] = 12;
                mic_delays[15] = 14;
            end
            4: begin
                mic_delays[0] = 0;
                mic_delays[1] = 1;
                mic_delays[2] = 4;
                mic_delays[3] = 8;
                mic_delays[4] = 10;
                mic_delays[5] = 12;
                mic_delays[6] = 14;
                mic_delays[7] = 15;
                mic_delays[8] = 17;
                mic_delays[9] = 1;
                mic_delays[10] = 5;
                mic_delays[11] = 9;
                mic_delays[12] = 11;
                mic_delays[13] = 13;
                mic_delays[14] = 16;
                mic_delays[15] = 18;
            end
            5: begin
                mic_delays[0] = 18;
                mic_delays[1] = 14;
                mic_delays[2] = 10;
                mic_delays[3] = 8;
                mic_delays[4] = 6;
                mic_delays[5] = 4;
                mic_delays[6] = 2;
                mic_delays[7] = 0;
                mic_delays[8] = 18;
                mic_delays[9] = 14;
                mic_delays[10] = 10;
                mic_delays[11] = 8;
                mic_delays[12] = 6;
                mic_delays[13] = 4;
                mic_delays[14] = 2;
                mic_delays[15] = 0;
            end
            6: begin
                mic_delays[0] = 24;
                mic_delays[1] = 19;
                mic_delays[2] = 21;
                mic_delays[3] = 16;
                mic_delays[4] = 18;
                mic_delays[5] = 14;
                mic_delays[6] = 16;
                mic_delays[7] = 11;
                mic_delays[8] = 13;
                mic_delays[9] = 8;
                mic_delays[10] = 10;
                mic_delays[11] = 5;
                mic_delays[12] = 7;
                mic_delays[13] = 2;
                mic_delays[14] = 4;
                mic_delays[15] = 0;
            end
            7: begin
                mic_delays[0] = 23;
                mic_delays[1] = 21;
                mic_delays[2] = 20;
                mic_delays[3] = 18;
                mic_delays[4] = 17;
                mic_delays[5] = 15;
                mic_delays[6] = 14;
                mic_delays[7] = 12;
                mic_delays[8] = 11;
                mic_delays[9] = 9;
                mic_delays[10] = 8;
                mic_delays[11] = 6;
                mic_delays[12] = 5;
                mic_delays[13] = 3;
                mic_delays[14] = 1;
                mic_delays[15] = 0;
            end
            8: begin
                mic_delays[0] = 0;
                mic_delays[1] = 1;
                mic_delays[2] = 4;
                mic_delays[3] = 9;
                mic_delays[4] = 14;
                mic_delays[5] = 19;
                mic_delays[6] = 24;
                mic_delays[7] = 27;
                mic_delays[8] = 28;
                mic_delays[9] = 27;
                mic_delays[10] = 24;
                mic_delays[11] = 19;
                mic_delays[12] = 14;
                mic_delays[13] = 9;
                mic_delays[14] = 4;
                mic_delays[15] = 1;
            end
            9: begin
                mic_delays[0] = 21;
                mic_delays[1] = 21;
                mic_delays[2] = 21;
                mic_delays[3] = 21;
                mic_delays[4] = 14;
                mic_delays[5] = 14;
                mic_delays[6] = 14;
                mic_delays[7] = 14;
                mic_delays[8] = 7;
                mic_delays[9] = 7;
                mic_delays[10] = 7;
                mic_delays[11] = 7;
                mic_delays[12] = 0;
                mic_delays[13] = 0;
                mic_delays[14] = 0;
                mic_delays[15] = 0;
            end
	    10: begin
                mic_delays[0] = 0;
                mic_delays[1] = 8;
                mic_delays[2] = 6;
                mic_delays[3] = 14;
                mic_delays[4] = 20;
                mic_delays[5] = 20;
                mic_delays[6] = 28;
                mic_delays[7] = 20;
                mic_delays[8] = 20;
                mic_delays[9] = 14;
                mic_delays[10] = 6;
                mic_delays[11] = 8;
                mic_delays[12] = 0;
                mic_delays[13] = 8;
                mic_delays[14] = 6;
                mic_delays[15] = 14;
            end
            11: begin
                mic_delays[0] = 2;
                mic_delays[1] = 7;
                mic_delays[2] = 0;
                mic_delays[3] = 12;
                mic_delays[4] = 12;
                mic_delays[5] = 17;
                mic_delays[6] = 26;
                mic_delays[7] = 21;
                mic_delays[8] = 26;
                mic_delays[9] = 16;
                mic_delays[10] = 14;
                mic_delays[11] = 11;
                mic_delays[12] = 2;
                mic_delays[13] = 7;
                mic_delays[14] = 0;
                mic_delays[15] = 12;
            end
            12: begin
                mic_delays[0] = 9;
                mic_delays[1] = 10;
                mic_delays[2] = 0;
                mic_delays[3] = 12;
                mic_delays[4] = 7;
                mic_delays[5] = 15;
                mic_delays[6] = 23;
                mic_delays[7] = 22;
                mic_delays[8] = 31;
                mic_delays[9] = 20;
                mic_delays[10] = 24;
                mic_delays[11] = 17;
                mic_delays[12] = 9;
                mic_delays[13] = 10;
                mic_delays[14] = 0;
                mic_delays[15] = 12;
            end
            13: begin
                mic_delays[0] = 14;
                mic_delays[1] = 10;
                mic_delays[2] = 0;
                mic_delays[3] = 10;
                mic_delays[4] = 0;
                mic_delays[5] = 10;
                mic_delays[6] = 14;
                mic_delays[7] = 18;
                mic_delays[8] = 28;
                mic_delays[9] = 18;
                mic_delays[10] = 28;
                mic_delays[11] = 18;
                mic_delays[12] = 14;
                mic_delays[13] = 10;
                mic_delays[14] = 0;
                mic_delays[15] = 10;
            end
            14: begin
                mic_delays[0] = 22;
                mic_delays[1] = 14;
                mic_delays[2] = 7;
                mic_delays[3] = 11;
                mic_delays[4] = 0;
                mic_delays[5] = 9;
                mic_delays[6] = 8;
                mic_delays[7] = 16;
                mic_delays[8] = 24;
                mic_delays[9] = 19;
                mic_delays[10] = 31;
                mic_delays[11] = 21;
                mic_delays[12] = 22;
                mic_delays[13] = 14;
                mic_delays[14] = 7;
                mic_delays[15] = 11;
            end
            15: begin
                mic_delays[0] = 7;
                mic_delays[1] = 0;
                mic_delays[2] = 3;
                mic_delays[3] = 11;
                mic_delays[4] = 14;
                mic_delays[5] = 4;
                mic_delays[6] = 1;
                mic_delays[7] = 1;
                mic_delays[8] = 7;
                mic_delays[9] = 13;
                mic_delays[10] = 13;
                mic_delays[11] = 10;
                mic_delays[12] = 6;
                mic_delays[13] = 4;
                mic_delays[14] = 6;
                mic_delays[15] = 8;
            end
            16: begin
                mic_delays[0] = 4;
                mic_delays[1] = 0;
                mic_delays[2] = 6;
                mic_delays[3] = 13;
                mic_delays[4] = 12;
                mic_delays[5] = 3;
                mic_delays[6] = 2;
                mic_delays[7] = 4;
                mic_delays[8] = 10;
                mic_delays[9] = 14;
                mic_delays[10] = 12;
                mic_delays[11] = 8;
                mic_delays[12] = 4;
                mic_delays[13] = 5;
                mic_delays[14] = 8;
                mic_delays[15] = 11;
            end
            17: begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 8;
                mic_delays[3] = 12;
                mic_delays[4] = 7;
                mic_delays[5] = 1;
                mic_delays[6] = 2;
                mic_delays[7] = 6;
                mic_delays[8] = 10;
                mic_delays[9] = 11;
                mic_delays[10] = 8;
                mic_delays[11] = 4;
                mic_delays[12] = 2;
                mic_delays[13] = 5;
                mic_delays[14] = 9;
                mic_delays[15] = 10;
            end
            18: begin
                mic_delays[0] = 0;
                mic_delays[1] = 4;
                mic_delays[2] = 11;
                mic_delays[3] = 11;
                mic_delays[4] = 4;
                mic_delays[5] = 3;
                mic_delays[6] = 6;
                mic_delays[7] = 10;
                mic_delays[8] = 11;
                mic_delays[9] = 10;
                mic_delays[10] = 6;
                mic_delays[11] = 3;
                mic_delays[12] = 3;
                mic_delays[13] = 7;
                mic_delays[14] = 11;
                mic_delays[15] = 11;
            end
            19: begin
                mic_delays[0] = 0;
                mic_delays[1] = 7;
                mic_delays[2] = 12;
                mic_delays[3] = 8;
                mic_delays[4] = 0;
                mic_delays[5] = 4;
                mic_delays[6] = 8;
                mic_delays[7] = 11;
                mic_delays[8] = 10;
                mic_delays[9] = 6;
                mic_delays[10] = 2;
                mic_delays[11] = 1;
                mic_delays[12] = 3;
                mic_delays[13] = 7;
                mic_delays[14] = 10;
                mic_delays[15] = 9;
            end
            20: begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 0;
                mic_delays[3] = 0;
                mic_delays[4] = 0;
                mic_delays[5] = 0;
                mic_delays[6] = 0;
                mic_delays[7] = 1;
                mic_delays[8] = 1;
                mic_delays[9] = 1;
                mic_delays[10] = 1;
                mic_delays[11] = 1;
                mic_delays[12] = 1;
                mic_delays[13] = 1;
                mic_delays[14] = 0;
                mic_delays[15] = 70;
            end
            21: begin
                mic_delays[0] = 0;
                mic_delays[1] = 3;
                mic_delays[2] = 3;
                mic_delays[3] = 3;
                mic_delays[4] = 3;
                mic_delays[5] = 3;
                mic_delays[6] = 3;
                mic_delays[7] = 4;
                mic_delays[8] = 4;
                mic_delays[9] = 4;
                mic_delays[10] = 4;
                mic_delays[11] = 4;
                mic_delays[12] = 4;
                mic_delays[13] = 3;
                mic_delays[14] = 3;
                mic_delays[15] = 3;
            end
            22: begin
                mic_delays[0] = 0;
                mic_delays[1] = 5;
                mic_delays[2] = 5;
                mic_delays[3] = 5;
                mic_delays[4] = 5;
                mic_delays[5] = 6;
                mic_delays[6] = 6;
                mic_delays[7] = 6;
                mic_delays[8] = 6;
                mic_delays[9] = 6;
                mic_delays[10] = 6;
                mic_delays[11] = 6;
                mic_delays[12] = 5;
                mic_delays[13] = 5;
                mic_delays[14] = 5;
                mic_delays[15] = 5;
            end
            23: begin
                mic_delays[0] = 0;
                mic_delays[1] = 6;
                mic_delays[2] = 6;
                mic_delays[3] = 6;
                mic_delays[4] = 6;
                mic_delays[5] = 7;
                mic_delays[6] = 7;
                mic_delays[7] = 7;
                mic_delays[8] = 7;
                mic_delays[9] = 7;
                mic_delays[10] = 6;
                mic_delays[11] = 6;
                mic_delays[12] = 6;
                mic_delays[13] = 6;
                mic_delays[14] = 5;
                mic_delays[15] = 5;
            end
            24: begin
                mic_delays[0] = 0;
                mic_delays[1] = 5;
                mic_delays[2] = 5;
                mic_delays[3] = 5;
                mic_delays[4] = 6;
                mic_delays[5] = 6;
                mic_delays[6] = 6;
                mic_delays[7] = 6;
                mic_delays[8] = 6;
                mic_delays[9] = 5;
                mic_delays[10] = 5;
                mic_delays[11] = 5;
                mic_delays[12] = 5;
                mic_delays[13] = 4;
                mic_delays[14] = 4;
                mic_delays[15] = 4;
            end
            25: begin
                mic_delays[0] = 8;
                mic_delays[1] = 13;
                mic_delays[2] = 18;
                mic_delays[3] = 23;
                mic_delays[4] = 5;
                mic_delays[5] = 10;
                mic_delays[6] = 15;
                mic_delays[7] = 20;
                mic_delays[8] = 2;
                mic_delays[9] = 7;
                mic_delays[10] = 12;
                mic_delays[11] = 17;
                mic_delays[12] = 0;
                mic_delays[13] = 4;
                mic_delays[14] = 9;
                mic_delays[15] = 14;
            end
            26: begin
                mic_delays[0] = 23;
                mic_delays[1] = 18;
                mic_delays[2] = 13;
                mic_delays[3] = 8;
                mic_delays[4] = 20;
                mic_delays[5] = 17;
                mic_delays[6] = 15;
                mic_delays[7] = 26;
                mic_delays[8] = 29;
                mic_delays[9] = 31;
                mic_delays[10] = 28;
                mic_delays[11] = 33;
                mic_delays[12] = 38;
                mic_delays[13] = 15;
                mic_delays[14] = 8;
                mic_delays[15] = 0;
            end
            27: begin
                mic_delays[0] = 23;
                mic_delays[1] = 20;
                mic_delays[2] = 17;
                mic_delays[3] = 15;
                mic_delays[4] = 18;
                mic_delays[5] = 13;
                mic_delays[6] = 8;
                mic_delays[7] = 28;
                mic_delays[8] = 33;
                mic_delays[9] = 38;
                mic_delays[10] = 26;
                mic_delays[11] = 29;
                mic_delays[12] = 31;
                mic_delays[13] = 15;
                mic_delays[14] = 8;
                mic_delays[15] = 0;
            end
            28: begin
                mic_delays[0] = 17;
                mic_delays[1] = 17;
                mic_delays[2] = 17;
                mic_delays[3] = 17;
                mic_delays[4] = 11;
                mic_delays[5] = 6;
                mic_delays[6] = 0;
                mic_delays[7] = 23;
                mic_delays[8] = 28;
                mic_delays[9] = 34;
                mic_delays[10] = 17;
                mic_delays[11] = 17;
                mic_delays[12] = 17;
                mic_delays[13] = 11;
                mic_delays[14] = 6;
                mic_delays[15] = 0;
            end
            29: begin
                mic_delays[0] = 15;
                mic_delays[1] = 18;
                mic_delays[2] = 21;
                mic_delays[3] = 23;
                mic_delays[4] = 10;
                mic_delays[5] = 5;
                mic_delays[6] = 0;
                mic_delays[7] = 20;
                mic_delays[8] = 25;
                mic_delays[9] = 30;
                mic_delays[10] = 12;
                mic_delays[11] = 9;
                mic_delays[12] = 7;
                mic_delays[13] = 13;
                mic_delays[14] = 11;
                mic_delays[15] = 9;
            end
            30: begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 0;
                mic_delays[3] = 0;
                mic_delays[4] = 0;
                mic_delays[5] = 0;
                mic_delays[6] = 0;
                mic_delays[7] = 0;
                mic_delays[8] = 0;
                mic_delays[9] = 0;
                mic_delays[10] = 0;
                mic_delays[11] = 0;
                mic_delays[12] = 0;
                mic_delays[13] = 0;
                mic_delays[14] = 0;
                mic_delays[15] = 0;
            end
            31: begin
                mic_delays[0] = 1;
                mic_delays[1] = 2;
                mic_delays[2] = 3;
                mic_delays[3] = 4;
                mic_delays[4] = 7;
                mic_delays[5] = 11;
                mic_delays[6] = 18;
                mic_delays[7] = 29;
                mic_delays[8] = 3;
                mic_delays[9] = 4;
                mic_delays[10] = 5;
                mic_delays[11] = 6;
                mic_delays[12] = 9;
                mic_delays[13] = 13;
                mic_delays[14] = 20;
                mic_delays[15] = 31;
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
