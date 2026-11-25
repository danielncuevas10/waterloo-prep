module tb_mux2;

  logic [7:0] a, b, y;
  logic s;
  integer errors = 0;

  mux2_ac dut (
      .a(a),
      .b(b),
      .s(s),
      .y(y)
  );

  task check(input logic [7:0] got, input logic [7:0] exp, input string name);
    begin
      if (got !== exp) begin
        $display("FAIL %s: got %b, expected %b", name, got, exp);
        errors = errors + 1;
      end
    end
  endtask

  initial begin
    $dumpfile("build/tb_mux2_ac.vcd");
    $dumpvars(0, tb_mux2);

    a = 8'hAA; b = 8'h55; s = 1'b0; #1 check(y, 8'hAA, "AA 55 s=0");
    a = 8'hAA; b = 8'h55; s = 1'b1; #1 check(y, 8'h55, "AA 55 s=1");
    a = 8'h00; b = 8'hFF; s = 1'b0; #1 check(y, 8'h00, "00 FF s=0");
    a = 8'h00; b = 8'hFF; s = 1'b1; #1 check(y, 8'hFF, "00 FF s=1");

    if (errors == 0) $display("PASS");
    else $display("FAILED: %0d errors", errors);
    $finish;
  end

endmodule