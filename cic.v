module cic (
    lr_clock,
    i_reset,
    i_data,
    o_data,
    );
    
    parameter IW=19, OW=19, R=16, M=1;
    
    /*
    Morgan note
    N is number of cascade stages (comb-integrator pairs) (3?)
    M is number of samples per stage (usually 1 but sometimes 2 idk)?
    R is number decimation factor
    */
    
    input wire lr_clock, i_reset, i_data;
    wire [(IW-1):0] mid_data1;
    wire [(IW-1):0] mid_data2;
    wire [(IW-1):0] mid_data3;
    output wire [(OW-1):0] o_data;
    
    //INTEGRATOR
    // Instantiate the integrator1 module
    integrator1 u_integrator1 (
        .clk(lr_clock),     // Connect lr_clock to clk
        .in(i_data),        // Connect i_data to in
        .rst(i_reset),          // Connect rst to rst
        .out(mid_data1)        // Connect out to o_data
    );
    integrator2 u_integrator2 (
        .clk(lr_clock),     // Connect lr_clock to clk
        .in(mid_data1),        // Connect i_data to in
        .rst(i_reset),          // Connect rst to rst
        .out(mid_data2)        // Connect out to o_data
    );
    integrator3 u_integrator3 (
        .clk(lr_clock),     // Connect lr_clock to clk
        .in(mid_data2),        // Connect i_data to in
        .rst(i_reset),          // Connect rst to rst
        .out(mid_data3)        // Connect out to o_data
    );

    //COMB
    genvar j;
    generate
        for (j=1; j<=M; j++) begin
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
                .lr_clock(lr_clock),
                .i_data(mid_data3[j-1]),
                .o_data(o_data[j]),
            );
        end
    endgenerate

    `ifdef COCOTB_SIM
    initial begin
    $dumpfile ("cic.vcd");
    $dumpvars (0, cic);
    end
    `endif   
    

endmodule
