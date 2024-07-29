module delay_module (
  input wire clk,
  input wire rst,
  input wire [4:0] delay_select
);
reg [18:0] pcm_data [15:0];
/* verilator lint_off UNUSED */
reg [18:0] delayed_pcm_data [15:0];
/* verilator lint_on UNUSED */
reg [5:0] mic_delays [15:0];  

integer j;

always @(posedge clk or posedge rst) begin
  if (rst) begin 
    for (j = 0; j < 16; j = j + 1) begin
      pcm_data[j] <= 19'b0;
      delayed_pcm_data[j] <= 19'b0;
    end
  end else begin
    case (delay_select)
      0 : mic_delays <= '{0, 4, 10, 12, 14, 18, 0, 0, 0, 0, 0, 0, 4, 10, 12, 14};
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
