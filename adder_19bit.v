// full adder module
module full_adder (
    input a,
    input b,
    input cin, 
    output sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule

// 19-bit adder module
module adder_19bit (
    input [18:0] a,
    input [18:0] b,
    output [18:0] sum,
    output carry_out
);
    wire [18:0] carry;

    full_adder fa0 ( .a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .cout(carry[0]) );

    genvar i;
    generate
        for (i = 1; i < 19; i = i + 1) begin: full_adders
            full_adder fa ( .a(a[i]), .b(b[i]), .cin(carry[i-1]), .sum(sum[i]), .cout(carry[i]) );
        end
    endgenerate

    assign carry_out = carry[18];
endmodule
