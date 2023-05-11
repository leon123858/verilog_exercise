VERILOG = iverilog
SIMULATE_TOOL = vvp
VIEW_TOOL = gtkwave
FORMATER = verilog-format


# Main target
all: lab2.vvp

# Main program
lab2.vvp:
	$(VERILOG) -o lab2.vvp lab2.v

simulate:
	$(SIMULATE_TOOL) lab2.vvp

view:
	$(VIEW_TOOL) lab2.vcd lab2.sav

clean:
	rm ./*.vvp || true && rm ./*.vcd

format:
	$(FORMATER) -f lab2.v