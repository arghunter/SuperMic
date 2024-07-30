
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
    input [18:0] in_9,
    input [18:0] in_10,
    input [18:0] in_11,
    input [18:0] in_12,
    input [18:0] in_13,
    input [18:0] in_14,
    input [18:0] in_15,
    output [22:0] sum,
    output carry_out
);

    wire [22:0] in_0_ext = {{4{in_0[18]}}, in_0};
    wire [22:0] in_1_ext = {{4{in_1[18]}}, in_1};
    wire [22:0] in_2_ext = {{4{in_2[18]}}, in_2};
    wire [22:0] in_3_ext = {{4{in_3[18]}}, in_3};
    wire [22:0] in_4_ext = {{4{in_4[18]}}, in_4};
    wire [22:0] in_5_ext = {{4{in_5[18]}}, in_5};
    wire [22:0] in_6_ext = {{4{in_6[18]}}, in_6};
    wire [22:0] in_7_ext = {{4{in_7[18]}}, in_7};
    wire [22:0] in_8_ext = {{4{in_8[18]}}, in_8};
    wire [22:0] in_9_ext = {{4{in_9[18]}}, in_9};
    wire [22:0] in_10_ext = {{4{in_10[18]}}, in_10};
    wire [22:0] in_11_ext = {{4{in_11[18]}}, in_11};
    wire [22:0] in_12_ext = {{4{in_12[18]}}, in_12};
    wire [22:0] in_13_ext = {{4{in_13[18]}}, in_13};
    wire [22:0] in_14_ext = {{4{in_14[18]}}, in_14};
    wire [22:0] in_15_ext = {{4{in_15[18]}}, in_15};

    wire [22:0] sum_intermediate [14:0];
    wire [14:0] carry_out_intermediate;

    // Stage 1: Add pairs of inputs
    adder_23bit add0 ( .a(in_0_ext), .b(in_1_ext), .sum(sum_intermediate[0]), .carry_out(carry_out_intermediate[0]) );
    adder_23bit add1 ( .a(in_2_ext), .b(in_3_ext), .sum(sum_intermediate[1]), .carry_out(carry_out_intermediate[1]) );
    adder_23bit add2 ( .a(in_4_ext), .b(in_5_ext), .sum(sum_intermediate[2]), .carry_out(carry_out_intermediate[2]) );
    adder_23bit add3 ( .a(in_6_ext), .b(in_7_ext), .sum(sum_intermediate[3]), .carry_out(carry_out_intermediate[3]) );
    adder_23bit add4 ( .a(in_8_ext), .b(in_9_ext), .sum(sum_intermediate[4]), .carry_out(carry_out_intermediate[4]) );
    adder_23bit add5 ( .a(in_10_ext), .b(in_11_ext), .sum(sum_intermediate[5]), .carry_out(carry_out_intermediate[5]) );
    adder_23bit add6 ( .a(in_12_ext), .b(in_13_ext), .sum(sum_intermediate[6]), .carry_out(carry_out_intermediate[6]) );
    adder_23bit add7 ( .a(in_14_ext), .b(in_15_ext), .sum(sum_intermediate[7]), .carry_out(carry_out_intermediate[7]) );

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
