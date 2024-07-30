module mux_shift(
    input wire clk,
    input wire rst,
    input wire lr_clk,
    input wire last_shift,
    input wire sum_res,
    output reg out

); 
reg data = 1'b0;

reg prev_lr_clk;



always @(posedge clk) begin
    if ( (lr_clk&& !prev_lr_clk)) begin
        data <= sum_res; 
    end else begin
	    data <=last_shift;
    end
    prev_lr_clk <= lr_clk;
end
always @(negedge clk) begin
// Send out a bit to out
    out<=data; // output data held in data
    
end

endmodule

