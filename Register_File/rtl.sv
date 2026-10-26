
module regfile (
    input  logic        clk,
    input  logic        we3,
    input  logic [4:0]  a1, a2, a3,
    input  logic [31:0] wd3,
    output logic [31:0] rd1, rd2
);

    logic [31:0] rf [0:31];
    integer i;

    initial begin
        for (i = 0; i < 32; i = i + 1)
            rf[i] = 32'b0;
    end

    always_ff @(posedge clk) begin
        if (we3 && (a3 != 5'd0))
            rf[a3] <= wd3;
    end

    always_comb begin
        rd1 = (a1 == 5'd0) ? 32'b0 : rf[a1];
        rd2 = (a2 == 5'd0) ? 32'b0 : rf[a2];
    end

endmodule
