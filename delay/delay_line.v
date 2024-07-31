module delay_line (
	input wire clk,
	input wire rst,
        input wire [31:0] delay,
	input wire [18:0] pcm_data,
	output wire [18:0] delayed_pcm_data
);

parameter MAX_DELAY = 64;
integer i, counter = 0;
reg [18:0] buffer [MAX_DELAY:0];

always @(posedge clk or posedge rst) begin
	if (rst) begin
		counter <= 0;
		for (i = 0; i <= MAX_DELAY; i = i + 1) begin
			buffer[i] <= 0;
		end
	end else begin
		buffer[counter] <= pcm_data;
		counter <= (counter + 1) % (delay + 1);
	end
end

assign delayed_pcm_data = buffer[(counter + 1) % (delay + 1)];

endmodule

