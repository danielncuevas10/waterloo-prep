`timescale 1ns/1ps

module tb_clamp;
    logic [7:0] x;
    logic [7:0] y;

    int errors = 0;

    clamp dut (
        .x(x),
        .y(y)
    );

    task automatic check_case(input logic [7:0] in_x, input logic [7:0] exp_y);
        begin
            x = in_x;
            #1; // let combinational logic settle
            if (y !== exp_y) begin
                $display("FAIL: x=%0d -> got y=%0d, expected y=%0d", in_x, y, exp_y);
                errors++;
            end else begin
                $display("PASS: x=%0d -> y=%0d", in_x, y);
            end
        end
    endtask

    initial begin
        $dumpfile("build/clamp.vcd");
        $dumpvars(0, tb_clamp);

        check_case(8'd0,   8'd20);
        check_case(8'd19,  8'd20);
        check_case(8'd20,  8'd20);
        check_case(8'd21,  8'd21);
        check_case(8'd100, 8'd100);
        check_case(8'd199, 8'd199);
        check_case(8'd200, 8'd200);
        check_case(8'd201, 8'd200);
        check_case(8'd255, 8'd200);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TOTAL FAILURES: %0d", errors);

        $finish;
    end
endmodule