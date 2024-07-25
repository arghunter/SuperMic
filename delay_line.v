module delay_line #( 
	parameter DELAY = 50	// Delay clock cycles
)(
	input wire clk,
	input wire rst,
	input wire [18:0] pcm_data,
	output wire [18:0] delayed_pcm_data
);

reg [18:0] buffer [DELAY-1:0];
reg counter = 0;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		counter <= 0;
		for (i = 0; i < DELAY; i = i + 1) begin
			buffer[i] <= 19'b0;
		end
	end else begin
		buffer[counter] <= pcm_data;
		counter <= (counter + 1) % DELAY;
	end
end

assign delayed_pcm_data = buffer[(counter + 1) % DELAY];

endmodule
