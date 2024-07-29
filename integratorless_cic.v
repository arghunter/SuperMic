module integratorless_cic (
    i_clk,
    i_reset,
    i_data,
    i_ready,
    o_data,
    o_ready
    );

    //OW = IW+ceil(M*log_2(R)) https://www.dsprelated.com/showarticle/1337.php
    //^from the fork... scares me, but whatever lol
    parameter IW=19, OW=19, R=16, M=1;

    input wire i_clk, i_reset;
    input wire signed [(IW-1):0] i_data;
    input wire i_ready;
    output wire signed [(OW-1):0] o_data;
    output wire o_ready;

    /*
    3.072 Mhz to 48Khz ... (64/1 ratio) R = 64? block diagram says 16...?

    Morgan note:
    N is number of cascade stages (comb-integrator pairs) (3?)
    M is number of samples per stage (usually 1 but sometimes 2 idk)?
    R is number decimation factor
    
    */
    //INTEGRATOR

    //assume integrator_data[i-1]

    /* verilator lint_off UNOPTFLAT */
    wire signed [(OW-1):0] integrator_data [0:M];
    wire integrator_ready [0:M];
    assign integrator_data[0] = i_data; //... basically post-integration data
    assign integrator_ready[0] = i_ready; // ready commands were included in the original repo. May cause problems but maybe not... Verilog stuff amirite?

    //DECIMATOR
    wire decimator_ready; //ready
    wire signed [(OW-1):0] decimator_data;
    decimator #(.W(OW),
                .R(R)) 
    decimator_0 (
        .i_clk(i_clk),
        .i_data(integrator_data[M]),
        .i_ready(integrator_ready[M]), //input signals when ready
        .o_data(decimator_data), 
        .o_ready(decimator_ready) //outputs signal when ready
    );

    //COMB
    wire signed [(OW-1):0] comb_data [0:M];
    wire comb_ready [0:M]; //ready
    assign comb_data[0] = decimator_data;
    assign comb_ready[0] = decimator_ready; //1'b1 is ready 1'b0 is not
    genvar j;
    generate
        for (j=1; j<=M; j++) begin
            comb #(
                .IW(OW),
                .OW(OW),
                .N(1*R/R)) 
            comb_0 (
                .i_clk(i_clk),
                .i_data(comb_data[j-1]),
                .i_ready(comb_ready[j-1]), //ready
                .o_data(comb_data[j]),
                .o_ready(comb_ready[j]) //ready
            );
        end
    endgenerate

    assign o_data = comb_data[M];
    assign o_ready = comb_ready[M]; //ready

    `ifdef COCOTB_SIM
    initial begin
    $dumpfile ("cic.vcd");
    $dumpvars (0, cic);
    end
    `endif   
    

endmodule