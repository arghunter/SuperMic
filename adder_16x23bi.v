module adder_16x23bit (
    input [22:0] in [15:0],
    output [22:0] sum,
    output carry_out
);
    wire [22:0] sum_intermediate [14:0];
    wire [14:0] carry_out_intermediate;

    // Stage 1: Add pairs of inputs
    adder_23bit add0 ( .a(in[0]), .b(in[1]), .sum(sum_intermediate[0]), .carry_out(carry_out_intermediate[0]) );
    adder_23bit add1 ( .a(in[2]), .b(in[3]), .sum(sum_intermediate[1]), .carry_out(carry_out_intermediate[1]) );
    adder_23bit add2 ( .a(in[4]), .b(in[5]), .sum(sum_intermediate[2]), .carry_out(carry_out_intermediate[2]) );
    adder_23bit add3 ( .a(in[6]), .b(in[7]), .sum(sum_intermediate[3]), .carry_out(carry_out_intermediate[3]) );
    adder_23bit add4 ( .a(in[8]), .b(in[9]), .sum(sum_intermediate[4]), .carry_out(carry_out_intermediate[4]) );
    adder_23bit add5 ( .a(in[10]), .b(in[11]), .sum(sum_intermediate[5]), .carry_out(carry_out_intermediate[5]) );
    adder_23bit add6 ( .a(in[12]), .b(in[13]), .sum(sum_intermediate[6]), .carry_out(carry_out_intermediate[6]) );
    adder_23bit add7 ( .a(in[14]), .b(in[15]), .sum(sum_intermediate[7]), .carry_out(carry_out_intermediate[7]) );

    // Stage 2: Add results of stage 1
    adder_23bit add8 ( .a(sum_intermediate[0]), .b(sum_intermediate[1]), .sum(sum_intermediate[8]), .carry_out(carry_out_intermediate[8]) );
    adder_23bit add9 ( .a(sum_intermediate[2]), .b(sum_intermediate[3]), .sum(sum_intermediate[9]), .carry_out(carry_out_intermediate[9]) );
    adder_23bit add10 ( .a(sum_intermediate[4]), .b(sum_intermediate[5]), .sum(sum_intermediate[10]), .carry_out(carry_out_intermediate[10]) );
    adder_23bit add11 ( .a(sum_intermediate[6]), .b(sum_intermediate[7]), .sum(sum_intermediate[11]), .carry_out(carry_out_intermediate[11]) );

    // Stage 3: Add results of stage 2
    adder_23bit add12 ( .a(sum_intermediate[8]), .b(sum_intermediate[9]), .sum(sum_intermediate[12]), .carry_out(carry_out_intermediate[12]) );
    adder_23bit add13 ( .a(sum_intermediate[10]), .b(sum_intermediate[11]), .sum(sum_intermediate[13]), .carry_out(carry_out_intermediate[13]) );

    // Stage 4: Add results of stage 3
    adder_23bit add14 ( .a(sum_intermediate[12]), .b(sum_intermediate[13]), .sum(sum_intermediate[14]), .carry_out(carry_out_intermediate[14]) );

    // Final stage: Add the last intermediate sum to get the final result
    assign sum = sum_intermediate[14];
    assign carry_out = carry_out_intermediate[14];
endmodule
