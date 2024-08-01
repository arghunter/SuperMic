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
	  30 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 0;
                mic_delays[3] = 0;
                mic_delays[4] = 0;
                mic_delays[5] = 0;
                mic_delays[6] = 0;
                mic_delays[7] = 0;
            end
          31 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 2;
                mic_delays[2] = 4;
                mic_delays[3] = 6;
                mic_delays[4] = 8;
                mic_delays[5] = 10;
                mic_delays[6] = 12;
                mic_delays[7] = 14;
            end
          0 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 4;
                mic_delays[3] = 4;
                mic_delays[4] = 8;
                mic_delays[5] = 8;
                mic_delays[6] = 12;
                mic_delays[7] = 12;
            end

          5 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 0;
                mic_delays[3] = 6;
                mic_delays[4] = 6;
                mic_delays[5] = 10;
                mic_delays[6] = 10;
                mic_delays[7] = 10;
              end
		  10 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 3;
                mic_delays[2] = 3;
                mic_delays[3] = 7;
                mic_delays[4] = 7;
                mic_delays[5] = 10;
                mic_delays[6] = 10;
                mic_delays[7] = 14;
              end
		  15 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 1;
                mic_delays[2] = 1;
                mic_delays[3] = 3;
                mic_delays[4] = 4;
                mic_delays[5] = 7;
                mic_delays[6] = 11;
                mic_delays[7] = 14;
              end
	      20 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 0;
                mic_delays[3] = 0;
                mic_delays[4] = 1;
                mic_delays[5] = 1;
                mic_delays[6] = 1;
                mic_delays[7] = 1;
              end
          25 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 0;
                mic_delays[3] = 0;
                mic_delays[4] = 6;
                mic_delays[5] = 6;
                mic_delays[6] = 6;
                mic_delays[7] = 6;
              end
          1 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 4;
                mic_delays[3] = 4;
                mic_delays[4] = 10;
                mic_delays[5] = 10;
                mic_delays[6] = 12;
                mic_delays[7] = 12;
              end
		  6 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 3;
                mic_delays[2] = 6;
                mic_delays[3] = 6;
                mic_delays[4] = 8;
                mic_delays[5] = 9;
                mic_delays[6] = 11;
                mic_delays[7] = 14;
              end
		  11 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 1;
                mic_delays[2] = 3;
                mic_delays[3] = 5;
                mic_delays[4] = 7;
                mic_delays[5] = 10;
                mic_delays[6] = 11;
                mic_delays[7] = 12;
              end
		  16 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 2;
                mic_delays[2] = 3;
                mic_delays[3] = 4;
                mic_delays[4] = 4;
                mic_delays[5] = 6;
                mic_delays[6] = 12;
                mic_delays[7] = 13;
              end
		  21 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 3;
                mic_delays[2] = 3;
                mic_delays[3] = 3;
                mic_delays[4] = 3;
                mic_delays[5] = 4;
                mic_delays[6] = 4;
                mic_delays[7] = 4;
              end
		  26 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 3;
                mic_delays[2] = 5;
                mic_delays[3] = 5;
                mic_delays[4] = 7;
                mic_delays[5] = 8;
                mic_delays[6] = 10;
                mic_delays[7] = 13;
              end
		  2 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 1;
                mic_delays[2] = 2;
                mic_delays[3] = 4;
                mic_delays[4] = 5;
                mic_delays[5] = 5;
                mic_delays[6] = 5;
                mic_delays[7] = 6;
              end
		  7 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 5;
                mic_delays[2] = 5;
                mic_delays[3] = 6;
                mic_delays[4] = 10;
                mic_delays[5] = 10;
                mic_delays[6] = 10;
                mic_delays[7] = 15;
              end
		  12 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 2;
                mic_delays[2] = 3;
                mic_delays[3] = 5;
                mic_delays[4] = 8;
                mic_delays[5] = 10;
                mic_delays[6] = 11;
                mic_delays[7] = 13;
              end
		  17 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 1;
                mic_delays[3] = 2;
                mic_delays[4] = 6;
                mic_delays[5] = 7;
                mic_delays[6] = 8;
                mic_delays[7] = 12;
              end
		  22 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 5;
                mic_delays[2] = 5;
                mic_delays[3] = 5;
                mic_delays[4] = 5;
                mic_delays[5] = 6;
                mic_delays[6] = 6;
                mic_delays[7] = 6;
              end
		  27 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 2;
                mic_delays[2] = 4;
                mic_delays[3] = 5;
                mic_delays[4] = 7;
                mic_delays[5] = 8;
                mic_delays[6] = 10;
                mic_delays[7] = 13;
              end
		  3 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 1;
                mic_delays[2] = 1;
                mic_delays[3] = 2;
                mic_delays[4] = 3;
                mic_delays[5] = 4;
                mic_delays[6] = 5;
                mic_delays[7] = 6;
              end
		  8 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 3;
                mic_delays[3] = 5;
                mic_delays[4] = 5;
                mic_delays[5] = 8;
                mic_delays[6] = 11;
                mic_delays[7] = 11;
              end
		  13 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 4;
                mic_delays[2] = 4;
                mic_delays[3] = 7;
                mic_delays[4] = 7;
                mic_delays[5] = 10;
                mic_delays[6] = 10;
                mic_delays[7] = 14;
              end
		  18 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 3;
                mic_delays[2] = 4;
                mic_delays[3] = 4;
                mic_delays[4] = 5;
                mic_delays[5] = 10;
                mic_delays[6] = 11;
                mic_delays[7] = 11;
              end
		  23 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 5;
                mic_delays[2] = 6;
                mic_delays[3] = 6;
                mic_delays[4] = 6;
                mic_delays[5] = 6;
                mic_delays[6] = 7;
                mic_delays[7] = 7;
              end
		  28 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 5;
                mic_delays[2] = 7;
                mic_delays[3] = 7;
                mic_delays[4] = 9;
                mic_delays[5] = 10;
                mic_delays[6] = 12;
                mic_delays[7] = 15;
              end
		  4 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 1;
                mic_delays[2] = 2;
                mic_delays[3] = 4;
                mic_delays[4] = 7;
                mic_delays[5] = 8;
                mic_delays[6] = 9;
                mic_delays[7] = 11;
              end
		  9 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 5;
                mic_delays[2] = 5;
                mic_delays[3] = 5;
                mic_delays[4] = 10;
                mic_delays[5] = 10;
                mic_delays[6] = 10;
                mic_delays[7] = 15;
              end
		  14 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 2;
                mic_delays[2] = 3;
                mic_delays[3] = 5;
                mic_delays[4] = 8;
                mic_delays[5] = 10;
                mic_delays[6] = 11;
                mic_delays[7] = 13;
              end
		  19 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 0;
                mic_delays[2] = 4;
                mic_delays[3] = 7;
                mic_delays[4] = 8;
                mic_delays[5] = 8;
                mic_delays[6] = 11;
                mic_delays[7] = 12;
              end
		  24 : begin
                mic_delays[0] = 0;
                mic_delays[1] = 4;
                mic_delays[2] = 5;
                mic_delays[3] = 5;
                mic_delays[4] = 5;
                mic_delays[5] = 6;
                mic_delays[6] = 6;
                mic_delays[7] = 6;
              end
		  29 : begin
                mic_delays[0] = 1;
                mic_delays[1] = 5;
                mic_delays[2] = 7;
                mic_delays[3] = 7;
                mic_delays[4] = 9;
                mic_delays[5] = 10;
                mic_delays[6] = 12;
                mic_delays[7] = 15;
              end



    endcase
    end

    genvar j;

    generate
      for (j = 0; j < 8; j = j + 1) begin : delay_line_gen
      delay_line u_delay_line (
        .clk(clk),
        .rst(rst),
        .delay(mic_delays[j]),
        .pcm_data(pcm_data[j]),
        .delayed_pcm_data(delayed_pcm_data[j])
      );
      end
    endgenerate

endmodule
