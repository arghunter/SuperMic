module comb (
    lr_clock,
    i_data,
    o_data,
    );

    parameter IW=19, OW=19, N=1; //IW = input bitwidth, OW = output bitwidth, N ...

    input wire lr_clock;
    input wire [18:0] i_data;
    output reg [18:0] o_data;

    reg [18:0] delay_line;
    reg [18:0] temp_delay;

    always @(posedge lr_clock) begin    
        o_data <= i_data-delay_line;
        temp_delay <= i_data;
    end 
    always @(negedge lr_clock) begin
        delay_line <=temp_delay;
    end
endmodule
