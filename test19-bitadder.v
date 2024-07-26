module tb_adder_19bit;
    reg [18:0] a;
    reg [18:0] b;
    wire [18:0] sum;
    wire carry_out;

    adder_19bit uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        $monitor("Time = %0d, a = %b, b = %b, sum = %b, carry_out = %b", $time, a, b, sum, carry_out);

        //test cases with two's complement signed numbers
        a = 19'b0000000000000000001; b = 19'b0000000000000000001; #10;
        a = 19'b1111111111111111111; b = 19'b0000000000000000001; #10;
        a = 19'b1010101010101010101; b = 19'b0101010101010101010; #10;
        a = 19'b1111111111111111111; b = 19'b1111111111111111111; #10;

        //test negative numbers
        a = 19'sb1111111111111111110; b = 19'sb0000000000000000001; #10; // -2 + 1


        $finish;
    end
endmodule
