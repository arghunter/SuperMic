module comb (
    lr_clock,
    i_data,
    o_data,
    );

    parameter IW=19, OW=19, N=3; //IW = input bitwidth, OW = output bitwidth, N = number of combs

    input wire lr_clock;
    input wire [(IW-1):0] i_data;
    output reg [(OW-1):0] o_data;

    integer i;

    reg [(IW-1):0] delay_line [(N-1):0];
    //sign_extend = {(OW-IW){delay_line[0][IW-1]}, delay_line[0]}
    //assign o_data = {{(OW-IW){i_data[IW-1]}}, i_data} - {{(OW-IW){delay_line[M-1][IW-1]}}, delay_line[M-1]};

    always @(posedge lr_clock) begin
        delay_line[0] <= i_data;
        for (i=1; i<N; i=i+1) begin
            delay_line[i] <= delay_line[i-1];
        end
        o_data <= {{(OW-IW){i_data[IW-1]}}, i_data} - {{(OW-IW){delay_line[N-1][IW-1]}}, delay_line[N-1]}; // Lucky Equation fingers crossed! :)
    end 


endmodule
