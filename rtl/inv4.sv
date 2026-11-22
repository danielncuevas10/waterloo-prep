module inv4 (
    input logic [3:0] x,
    output logic [3:0] y
);

    assign y = ~x;
endmodule