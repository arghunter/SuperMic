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
    input wire lr_clock, i_reset, i_data;
    wire [(IW-1):0] mid_data;
    output wire [(OW-1):0] o_data;
    
    genvar j;
    generate
        //Integrators
        top_module u_top_module(
            .clk(clk),
            .in(i_data),
            .rst(i_reset),
            .out(mid_data)
        )

        //combs
        for (j=1; j<=N; j++) begin
            comb #(
                .IW(OW),
                .OW(OW),
                .N(1*R/R)) 
            comb_0 (
                /*
                This section may need adjustment.
                The original file had i_data and o_data both using the same wire for some reason.
                I'll work it out if it causes problems with testing.
                */
                .lr_clock(lr_clk),
                .i_data(mid_data[j-1]),
                .o_data(o_data[j]),sh
            );
        end
    endgenerate    
endmodule
