module filter
    #(parameter DATA_WIDTH = 11,
        parameter NB_OF_TAPS = 8,
        parameter h0 = 0,
        parameter h1 = 0,
        parameter h2 = 0,
        parameter h3 = 0,
        parameter h4 = 0,
        parameter h5 = 0,
        parameter h6 = 0,
        parameter h7 = 0
    )
    (
        input clk,
        input [DATA_WIDTH - 1 : 0] x,
        output [DATA_WIDTH - 1 : 0] y
    )

    reg [DATA_WIDTH - 1 : 0] sr [NB_OF_TAPS - 1 : 0];
    reg [2 * DATA_WIDTH - 1 : 0] result = 0;
    integer i;

    always @(posedge clk)
    begin
        sr <= x;
        for (i = NB_OF_TAPS - 1; i > 0; i--)
            sr[i] <= sr[i - 1];
    end

    always @(posedge clk)
        result <= h0 * sr[0] + h1 * sr[1] + h2 * sr[2] + h3 * sr[3] + h4 * sr[4] + h5 * sr[5] + h6 * sr[6] + h7 * sr[7];

    assign y = result[19 : 9];

endmodule
