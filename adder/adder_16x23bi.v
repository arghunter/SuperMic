
module adder_16x23bit (
    input [18:0] in_0,
    input [18:0] in_1,
    input [18:0] in_2,
    input [18:0] in_3,
    input [18:0] in_4,
    input [18:0] in_5,
    input [18:0] in_6,
    input [18:0] in_7,
    input [18:0] in_8,
    output [21:0] sum,
    output carry_out
);

    wire [21:0] in_0_ext = {{4{in_0[18]}}, in_0};
    wire [21:0] in_1_ext = {{4{in_1[18]}}, in_1};
    wire [21:0] in_2_ext = {{4{in_2[18]}}, in_2};
    wire [21:0] in_3_ext = {{4{in_3[18]}}, in_3};
    wire [21:0] in_4_ext = {{4{in_4[18]}}, in_4};
    wire [21:0] in_5_ext = {{4{in_5[18]}}, in_5};
    wire [21:0] in_6_ext = {{4{in_6[18]}}, in_6};
    wire [21:0] in_7_ext = {{4{in_7[18]}}, in_7};

    wire [21:0] sum_intermediate [12:0];
    wire [12:0] carry_out_intermediate;

    // Stage 1: Add pairs of inputs
    adder_23bit add0 ( .a(in_0_ext), .b(in_1_ext), .sum(sum_intermediate[0]), .carry_out(carry_out_intermediate[0]) );
    adder_23bit add1 ( .a(in_2_ext), .b(in_3_ext), .sum(sum_intermediate[1]), .carry_out(carry_out_intermediate[1]) );
    adder_23bit add2 ( .a(in_4_ext), .b(in_5_ext), .sum(sum_intermediate[2]), .carry_out(carry_out_intermediate[2]) );
    adder_23bit add3 ( .a(in_6_ext), .b(in_7_ext), .sum(sum_intermediate[3]), .carry_out(carry_out_intermediate[3]) );


    // Stage 2: Add results of stage 1
    adder_23bit add8 ( .a(sum_intermediate[0]), .b(sum_intermediate[1]), .sum(sum_intermediate[8]), .carry_out(carry_out_intermediate[8]) );
    adder_23bit add9 ( .a(sum_intermediate[2]), .b(sum_intermediate[3]), .sum(sum_intermediate[9]), .carry_out(carry_out_intermediate[9]) );

    // Stage 3: Add results of stage 2
    adder_23bit add12 ( .a(sum_intermediate[8]), .b(sum_intermediate[9]), .sum(sum_intermediate[12]), .carry_out(carry_out_intermediate[12]) );


    // Stage 4: Add results of stage 3


    // Final stage: Add the last intermediate sum to get the final result
    assign sum = sum_intermediate[12];
    assign carry_out = carry_out_intermediate[12];

endmodule
