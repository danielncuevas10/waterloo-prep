module mux4 (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic [7:0] c,
    input  logic [7:0] d,
    input  logic [1:0] s,
    output logic [7:0] y
);
    logic [7:0] w0, w1;

    mux2 m0 (.a(a),  .b(b),  .s(s[0]), .y(w0));
    mux2 m1 (.a(c),  .b(d),  .s(s[0]), .y(w1));
    mux2 m2 (.a(w0), .b(w1), .s(s[1]), .y(y));
endmodule