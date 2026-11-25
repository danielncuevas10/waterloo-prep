module clamp (
    input logic [7:0] x,
    output logic [7:0] y
);

    always_comb begin
        y = 8'd0;

        if (x < 8'd20)
            y = 8'd20;

        else if (x > 8'd200)
            y = 8'd200;

        else 
            y = x;
    end

endmodule