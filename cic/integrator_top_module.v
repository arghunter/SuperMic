module top_module (
    input wire clk,       // Clock input
    input wire in, // 1-bit input 
    input wire rst,       
    output wire [18:0] out // 19-bit output of integrators
);

    wire [18:0] integrator1_out; // Wire to connect the output of integrator1 to integrator2

    // Instantiate integrator1
    integrator1 u1 (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(integrator1_out)
    );

    wire [18:0] integrator2_out;

    // Instantiate integrator2
    integrator2 u2 (
        .clk(clk),
        .rst(rst),
        .in(integrator1_out),
        .out(integrator2_out)
    );

    integrator3 u3 (
        .clk(clk),
        .rst(rst),
        .in(integrator2_out),
        .out(out)
    );

endmodule
