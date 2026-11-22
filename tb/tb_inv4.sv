module tb_inv4;

    logic [3:0] x, y;
    integer errors = 0;

    inv4 dut (.x(x), .y(y));

    task check (input logic [3:0] got, input logic [3:0] exp, input string name);
        begin
            if (got !== exp) begin
                $display("FAIL %s: got %b, expected %b", name, got, exp);
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("build/tb_inv4.vcd");
        $dumpvars(0, tb_inv4);

        x = 4'b0000; #1 check(y, 4'b1111, "all zeros");

        x = 4'b1010; #1 check(y, 4'b0101, "1010");

        if (errors == 0) $display("PASS");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule