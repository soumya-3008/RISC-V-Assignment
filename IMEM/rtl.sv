
module imem (
    input  logic [31:0] a,
    output logic [31:0] rd
);

    logic [31:0] RAM [0:63];
    integer i;

    initial begin
        for (i = 0; i < 64; i = i + 1)
            RAM[i] = 32'h00000013;

        $readmemh("imem.txt", RAM);
    end

    always_comb begin
        rd = RAM[a[7:2]];
    end

endmodule
