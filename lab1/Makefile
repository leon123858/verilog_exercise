# Verilog compiler and flags
VERILOG = iverilog

# Main target
all: lab1.vpp

# Main program
lab1.vpp: lab1.v gates.v adders.v
	$(VERILOG) -o $@ $^

# Dependencies
adders.v: gates.v
lab1.v: adders.v gates.v

run:
	vvp lab1.vpp

wave:
	gtkwave lab1.vcd

clean:
	rm ./*.vpp || true && rm ./*.vcd

format:
	verilog-format -f adders.v && verilog-format -f lab1.v