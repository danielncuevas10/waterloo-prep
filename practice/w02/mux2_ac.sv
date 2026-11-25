module mux2_ac (
    input logic [7:0] a,
    input logic [7:0] b,
    input logic s,
    output logic [7:0] y

);

    always_comb begin
        if (s) y = b;
        else
        y = a;
    end

endmodule