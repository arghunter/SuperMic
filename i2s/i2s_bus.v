module i2s_bus(
    input wire clk,
    input wire rst,
    input wire lr_clk,
    input wire [31:0] bit_data,
    output reg out
); 

    wire [31:0] mux_outputs; 


    genvar i;
    generate
        
        //Making the first one
        mux_shift u_mux_shift ( 
                .clk(clk),
                .rst(rst),
                .lr_clk(lr_clk),
                .last_shift(1'b0),
                .sum_res(bit_data[0]),
                .out(mux_outputs[0]) 
            );
        for (i=1; i<32; i=i+1) begin : mux_shift_inst
            mux_shift u_mux_shift (
                .clk(clk),
                .rst(rst),
                .lr_clk(lr_clk),
                .last_shift(mux_outputs[i-1]),
                .sum_res(bit_data[i]),
                .out(mux_outputs[i]) 
            );
        end
    endgenerate 
    always @(negedge clk) begin
        if (rst)
            out <= 1'b0;
        else
            out <= mux_outputs[31]; // assign last bit of mux_ouputs to out
    end
    
    
endmodule
