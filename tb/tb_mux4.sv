module tb_mux4;

  logic [7:0] a, b, c, d, y;
  logic [1:0] s;
  integer     errors = 0;

  mux4 dut (.a(a), .b(b), .c(c), .d(d), .s(s), .y(y));

  task check(input logic [7:0] got, input logic [7:0] exp, input string name);
    begin
      if (got !== exp) begin
        $display("FAIL %s: got %h, expected %h", name, got, exp);
        errors = errors + 1;
      end
    end
  endtask

  initial begin
    $dumpfile("build/tb_mux4.vcd");
    $dumpvars(0, tb_mux4);

    a = 8'h11; b = 8'h22; c = 8'h33; d = 8'h44;

    s = 2'b00; #1 check(y, 8'h11, "s=00");
    s = 2'b01; #1 check(y, 8'h22, "s=01");
    s = 2'b10; #1 check(y, 8'h33, "s=10");
    s = 2'b11; #1 check(y, 8'h44, "s=11");

    if (errors == 0) $display("PASS");
    else             $display("FAILED: %0d errors", errors);
    $finish;
  end

endmodule