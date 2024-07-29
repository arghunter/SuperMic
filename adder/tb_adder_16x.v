module tb_adder_16x23bit;
    reg [22:0] in [15:0];
    wire [22:0] sum;
    wire carry_out;

    adder_16x23bit uut (
        .in0(in[0]), .in1(in[1]), .in2(in[2]), .in3(in[3]), .in4(in[4]), .in5(in[5]), .in6(in[6]), .in7(in[7]),
        .in8(in[8]), .in9(in[9]), .in10(in[10]), .in11(in[11]), .in12(in[12]), .in13(in[13]), .in14(in[14]), .in15(in[15]),
        .sum(sum), .carry_out(carry_out)
    );

    integer i;

    initial begin
        $monitor("Time = %0d, sum = %0b, carry_out = %b", $time, sum, carry_out);

        // Test case: all zeros
        for (i = 0; i < 16; i = i + 1) begin
            in[i] = 23'b00000000000000000000000;
        end
        #10;

        // Test case: all ones
        for (i = 0; i < 16; i = i + 1) begin
            in[i] = 23'b00000000000000000000001;
        end
        #10;

        // Test case: random values
        in[0] = 23'b10101010101010101010101;
        in[1] = 23'b01010101010101010101010;
        in[2] = 23'b11100011100011100011100;
        in[3] = 23'b00011100011100011100011;
        in[4] = 23'b10010010010010010010010;
        in[5] = 23'b01101101101101101101101;
        in[6] = 23'b00000000000000000000000;
        in[7] = 23'b11111111111111111111111;
        in[8] = 23'b00100100100100100100100;
        in[9] = 23'b01001001001001001001001;
        in[10] = 23'b11111111111111111111111;
        in[11] = 23'b00000000000000000000000;
        in[12] = 23'b10101010101010101010101;
        in[13] = 23'b01010101010101010101010;
        in[14] = 23'b11100011100011100011100;
        in[15] = 23'b00011100011100011100011;
        #10;

        $finish;
    end
endmodule
