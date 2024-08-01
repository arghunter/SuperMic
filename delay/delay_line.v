module delay_line (
	input wire clk,
	input wire rst,
        input wire [4:0] delay,
	input wire [18:0] pcm_data,
	output wire [18:0] delayed_pcm_data
);

parameter MAX_DELAY = 32;
integer i;
reg [4:0] counter = 0;
reg [18:0] buffer [MAX_DELAY:0];

always @(posedge clk or posedge rst) begin
	if (rst) begin
		counter <= 0;
		for (i = 0; i <= MAX_DELAY; i = i + 1) begin
			buffer[i] <= 0;
		end
	end else begin
		for (i = 0; i < MAX_DELAY - 1; i = i + 1) begin
			buffer[i + 1] <= buffer[i];
                end
                buffer[0] <= pcm_data;
	end
end

assign delayed_pcm_data = buffer[delay];

endmodule

