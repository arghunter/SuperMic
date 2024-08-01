module top_ddr_to_sdr(
    input wire clk,
    input wire rst,
    input wire [3:0] ddr_data,
    output wire [3:0] sdr_data_0,
    output wire [3:0] sdr_data_1
);
    genvar i;
    generate
	for (i=0;i<4;i=i+1) begin : ddr_to_sdr_dual_inst
	    ddr_to_sdr_dual u_ddr_to_sdr_dual (
		.clk(clk),
		.rst(rst),
		.ddr_data(ddr_data[i]),
		.sdr_data_0(sdr_data_0[i]),
		.sdr_data_1(sdr_data_1[i])
	    );
        end
    endgenerate	
endmodule

