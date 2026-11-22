TBS   := $(wildcard tb/*.sv)
NAMES := $(notdir $(basename $(TBS)))

.PHONY: test clean wave

test:
	mkdir -p build
	for n in $(NAMES); do \
		echo "=== Running $$n ==="; \
		iverilog -g2012 -o "build/$$n" rtl/*.sv "tb/$$n.sv" && vvp "build/$$n" || exit 1; \
	done

wave:
	@test -n "$(TB)" || (echo "Usage: make wave TB=tb_mux4" && exit 1)
	mkdir -p build
	iverilog -g2012 -o "build/$(TB)" rtl/*.sv "tb/$(TB).sv"
	vvp "build/$(TB)"
	gtkwave "build/$(TB).vcd" &

clean:
	rm -rf build