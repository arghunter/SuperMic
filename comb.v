module comb (
    lr_clock,
    i_data,
    o_data,
    );

    parameter IW=19, OW=19, N=1; //IW = input bitwidth, OW = output bitwidth, N ...

    input wire lr_clock;
    input wire [18:0] i_data;
    output reg [18:0] o_data;

    integer i;

    reg [18:0] delay_line;
    reg [18:0] temp_delay;
    //sign_extend = {(OW-IW){delay_line[0][IW-1]}, delay_line[0]}
    //assign o_data = {{(OW-IW){i_data[IW-1]}}, i_data} - {{(OW-IW){delay_line[M-1][IW-1]}}, delay_line[M-1]};

    always @(posedge lr_clock) begin
        // for (i=1; i<N; i=i+1) begin
        //     delay_line[i] <= delay_line[i-1];
        // end
        //i_data-last_input
        // o_data <= {{(OW-IW){i_data[IW-1]}}, i_data} - {{(OW-IW){delay_line[N-1][IW-1]}}, delay_line[N-1]};
        
        o_data <= i_data-delay_line;
        temp_delay <= i_data;
        // delay_line[0] <= i_data;
    end 
    always @(negedge lr_clock) begin
        
        delay_line <=temp_delay;
    end
endmodule
