module first;

	logic a;
	logic b;
	logic y;

	assign y = a & b;

	initial begin
		a = 1;
		b = 0;
		#1;
		$display("a is %b", a);
		$display("b is %b", b);
		$display("y is %b", y);
		$finish;
	end

endmodule
