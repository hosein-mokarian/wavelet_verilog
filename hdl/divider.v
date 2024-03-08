module divider
    #(parameter N = 2)
    (
        input clk,
        input rstn,
        input en,
        output out
    )

    reg counter = 0;

    always @(posedge clk)
    begin
        if (!rstn)
            counter <= 0;
        else
            if (en)
            begin
                counter <= counter + 1;
                if (counter == N)
                    counter <= 0; 
            end
    end

    assign out = (counter <= N /2) ? 1 : 0;

endmodule
