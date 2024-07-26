`timescale 1ns / 1ns

module tb_delay_line;

  parameter DELAY = 50;
  
  reg clk;
  reg rst;
  reg [18:0] pcm_data;
  wire [18:0] delayed_pcm_data;
  
  delay_line #(
    .DELAY(DELAY)
  ) uut (
    .clk(clk),
    .rst(rst),
    .pcm_data(pcm_data),
    .delayed_pcm_data(delayed_pcm_data)
  );
  
  initial clk = 1;
  always #10 clk = ~clk;  // 20ns clock period (50MHz clock)
  
  initial begin
  $dumpfile("tb_delay_line.vcd");
  $dumpvars(0,tb_delay_line);

  rst = 0;
  pcm_data <= 0;
      
  // Apply test vector
  pcm_data <= 19'h1;
  #30 pcm_data <= 19'h2;
  #30 pcm_data <= 19'h3;
  #30 pcm_data <= 19'h4;
  #30 pcm_data <= 19'h5;

  $monitor("At time %t, delayed_pcm_data = %h", $time, delayed_pcm_data);
  #5000

  $finish;
  end
  
endmodule
