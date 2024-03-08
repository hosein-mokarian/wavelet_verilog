module up_scale
    #(parameter N = 2,
      parameter DATA_WIDTH = 11)
    (
    input clk,
    input [DATA_WIDTH - 1 : 0] xin,
    output [DATA_WIDTH - 1 : 0] out
)
    reg sacle = 0;

    always @(posedge clk)
        scale = ~scale;
    
    assign out = (!scale) ? xin : 11'b0;

endmodule
