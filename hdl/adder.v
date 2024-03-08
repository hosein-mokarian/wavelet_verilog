module adder
    #(parameter DATA_WIDTH = 11)
    (
        input [DATA_WIDTH - 1 : 0] a,
        input [DATA_WIDTH - 1 : 0] b,
        output [DATA_WIDTH - 1 : 0] sum
    )

    assign sum = a + b;
    
endmodule