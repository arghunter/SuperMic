module cic (
    clk,
    lr_clk,
    i_reset,
    i_data,
    o_data,
    );
    
    parameter IW=19, OW=19, R=16, N=3;
    
    /*
    Morgan note
    N is number of cascade stages (comb-integrator pairs) (3?)
    R is number decimation factor
    */
    input wire clk;
    input wire lr_clk, i_reset, i_data;
    
    output wire [(OW-1):0] o_data;
    wire [(IW-1):0] mid_data;
    wire [(OW-1):0] comb_data [0:N];


    genvar j;
    generate
        //Integrators
        top_module u_top_module(
            .clk(clk),
            .in(i_data),
            .rst(i_reset),
            .out(comb_data[0])
        );

        //combs
        
        for (j=1; j<=N; j=j+1) begin
            // comb #(
            //     .IW(IW),
            //     .OW(OW),
            //     .N(1*R/R)) 
            comb u_comb (
                .lr_clock(lr_clk),
                .i_data(comb_data[j-1]),
                .o_data(comb_data[j])
            );

        end
    endgenerate

assign o_data = comb_data[N-1]; //N-1

endmodule
