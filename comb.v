module comb (
    i_clk,
    i_data,
    i_ready,
    o_data,
    o_ready
    );

    parameter IW=19, OW=19, N=3; //IW = input bitwidth, OW = output bitwidth, N = number of combs

    input wire i_clk;
    input wire i_ready;
    input wire signed [(IW-1):0] i_data;
    output reg signed [(OW-1):0] o_data;
    output reg o_ready = 1'b0;

    integer i;

    reg signed [(IW-1):0] delay_line [(N-1):0];
    //sign_extend = {(OW-IW){delay_line[0][IW-1]}, delay_line[0]}
    //assign o_data = {{(OW-IW){i_data[IW-1]}}, i_data} - {{(OW-IW){delay_line[M-1][IW-1]}}, delay_line[M-1]};

    always @(posedge i_clk) begin
        if (i_ready) begin
            delay_line[0] <= i_data;
            for (i=1; i<N; i=i+1) begin
                delay_line[i] <= delay_line[i-1];
            end
            // difference equation... note: it's like Euler's method
            o_data <= {{(OW-IW){i_data[IW-1]}}, i_data} - {{(OW-IW){delay_line[N-1][IW-1]}}, delay_line[N-1]}; // Lucky Equation fingers crossed! :)
            o_ready <= 1'b1;
        end else begin
            o_ready <= 1'b0;
        end
    end 


endmodule