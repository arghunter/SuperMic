`timescale 1ns / 1ns

module tb_delay_line;

  parameter DELAY = 50;
  
  reg clk;
  reg rst;
  reg [4:0] delay_select;
  reg [18:0] cic_data [15:0];
  wire [18:0] delayed_data [15:0];

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

  
  initial clk = 1;
  always #10 clk = ~clk;  // 20ns clock period (50MHz clock)
  
  integer i;

  initial begin
  $dumpfile("tb_delay_line.vcd");
  $dumpvars(0,tb_delay_line);

  rst = 0;
  
  delay_select <= 1;
      
  for (i = 0; i < 16; i = i + 1) begin
    cic_data[i] <= 0;
  end

  // Apply test vector
  for (i = 0; i < 16; i = i + 1) begin
    cic_data[i] <= 1;
  end    
  #30
  for (i = 0; i < 16; i = i + 1) begin
    cic_data[i] <= 2;
  end
  #30
for (i = 0; i < 16; i = i + 1) begin
    cic_data[i] <= 3;
  end
  #30
for (i = 0; i < 16; i = i + 1) begin
    cic_data[i] <= 4;
  end
  #30
for (i = 0; i < 16; i = i + 1) begin
    cic_data[i] <= 5;
  end

  $monitor("At time %t, delayed_pcm_data = %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h", $time, 
delayed_data[0], delayed_data[1],  delayed_data[2],  delayed_data[3], delayed_data[4], 
delayed_data[5],  delayed_data[6],  delayed_data[7], 
delayed_data[8], delayed_data[9],  delayed_data[10],  delayed_data[11], delayed_data[12],                                 
delayed_data[13],  delayed_data[14],  delayed_data[15],);
  #5000

  $finish;
  end
  
endmodule
