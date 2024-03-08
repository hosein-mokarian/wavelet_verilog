module uart_tx
    #(parameter DATA_WIDTH = 11)
    (
        input clk,
        input en,
        input [DATA_WIDTH - 1 : 0] data,
        output reg tx
    )

    reg enable = 0;
    reg [5 : 0] counter = 0;

    always @(en)
        enable <= 1;

    always @(posedge clk)
    begin
        if (enable)
        begin
            counter <= counter + 1;
            if (counter == 20)
                counter <= 0;
        end
    end

    always @(posedge clk)
    begin
        if (enable)
        begin
            if (counter == 0)
                tx <= 0;
            else if (counter == 20)
                begin
                    counter <= 0;
                    enable <= 0;
                    tx <= 1;
                end
            else
                tx <= data[counter];
        end
    end

endmodule
