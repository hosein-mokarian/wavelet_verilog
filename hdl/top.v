`include "divider.v"
`include "filter.v"
`include "up_scale.v"
`include "adder.v"
`include "uart_tx.v"


module top
    #(parameter DATA_WIDTH = 11)
    (
        input clk,
        input rstn,
        input en,
        input [DATA_WIDTH - 1 : 0] xin,
        input [DATA_WIDTH - 1 : 0] yout
    )

    wire clk_2, clk_4, clk_8;
    wire [DATA_WIDTH - 1 : 0] ca1;

    //--- divider ---------------------
    divider
        #(.N(2))
        divider_n_2
        (
            .clk(clk),
            .rstn(rstn),
            .en(en),
            .out(clk_2)
        );

    divider 
        #(.N(4))
        divider_n_4
        (
            .clk(clk),
            .rstn(rstn),
            .en(en),
            .out(clk_4)
        );

    divider 
        #(.N(8))
        divider_n_8
        (
            .clk(clk),
            .rstn(rstn),
            .en(en),
            .out(clk_8)
        );

    
    //--- DWT -------------------------
    filter 
        #(.DATA_WIDTH(DATA_WIDTH))
        lowpass_level1
        (
            .clk(clk),
            .x(xin),
            .y(ca1)
        );
    //---------------------------------

endmodule
