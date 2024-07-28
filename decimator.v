module decimator (
    i_clk,
    i_data,
    i_ready,
    o_data,
    o_ready
    );

    parameter W=19, R=19; //W = read/write bitwidth R = decimation or interpolation ratio (I think)

    input wire i_clk;
    input wire i_ready;
    input wire signed [(W-1):0] i_data;
    output reg signed [(W-1):0] o_data;
    output reg o_ready = 1'b0;

    reg [31:0] i_ready_counter = 32'b0;
    always @(posedge i_clk) begin
        if (i_ready) begin
            i_ready_counter <= i_ready_counter + 1'b1;
        end

        if (i_ready_counter >= (R - 1)) begin // here's the R, I have no idea how this works ngl
            i_ready_counter <= 32'b0;
            o_data <= i_data;
            o_ready <= 1'b1;
        end else begin
            o_ready <= 1'b0;
        end
    end


endmodule