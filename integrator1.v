// integrator1.v
module integrator1 (
    input wire clk,       // Clock input
    input wire in,
    input wire rst,        // 1-bit input
    output reg [18:0] out // 19-bit output
);

    reg [18:0] reg_value;
    



    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg_value<=0;
            out <= 0;
        end else if (in) begin
            out <= reg_value + 1;
            reg_value <= reg_value + 1;
        end else begin
            out <= reg_value - 1;
            reg_value <= reg_value - 1;
        end
    end

endmodule

