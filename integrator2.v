module integrator2 (
    input wire clk,       // Clock input
    input wire [18:0] in,
    input wire rst, // 19-bit input (output of integrator1)
    output reg [18:0] out // 19-bit output (increased by 1)
);
    reg [18:0] reg_value = 0;


    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg_value<=0;
            out <= 0;
        end else begin
            out <= reg_value + in;
            reg_value <= reg_value + in;
        

        end
    end
    

endmodule
