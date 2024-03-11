##################
# Makefile rules #
##################

# This file expects to be included in verilog projects.
# Following variables have to be set by makefiles including this:
#    SRC_DIR:   Directory to container *.v files
#    TESTBENCHES: Testbench to be compiled

VERILATOR_FLAGS =
# Make a binary immediately from verilated C++ files
VERILATOR_FLAGS += --binary
# Allow for timing information such as timescale and delay
VERILATOR_FLAGS += --timing
# Let verilated model produce vcd trace files
VERILATOR_FLAGS += --trace
# Verilate assertions, otherwise assertions aren't triggered in model
VERILATOR_FLAGS += --assert
# Use all available CPU cores to build
VERILATOR_FLAGS += -j 0

VERILATOR = verilator

# Take verilog sources, but not testbenches
VERILOG_SRCS = $(abspath $(filter-out %tb_%, $(wildcard $(SRC_DIR)/*.sv)))

WAVE_VIEWER = gtkwave
WAVEFORMS = $(addprefix waveform_, $(TESTBENCHES))

LINTER = verible-verilog-lint

.PHONY: testbench simulation visualize clean lint

# Default target when running `make`
all: simulation

simulation: $(WAVEFORMS)

testbenches: $(addprefix obj_dir/V, $(TESTBENCHES))

lint:
	$(LINTER) $(VERILOG_SRCS)

obj_dir/V%: %.sv
	$(VERILATOR) $(VERILATOR_FLAGS) $<

waveform_%: obj_dir/V%
	./$<

simulate_%: %
	make waveform_$< -sB

clean:
	rm -rf obj_dir $(WAVEFORMS)

visualize:
	$(WAVE_VIEWER) $(WAVEFORMS)
	
# Allow shorthand `make tb_*` instead of `make obj_dir/Vtb_*`
.SECONDEXPANSION:
tb_%: obj_dir/Vtb_$$*
	@echo

# rule for creating exercise for students
../out/combinatorial/:
	mkdir -p $@
	cp Makefile $@
	cp test_utils.sv $@
	cp -r figuren $@
	cp -r combinatorial/figuren $@
	cp -r combinatorial/opgave $@
	cp -r .devcontainer $@
	mkdir -p $@.github/workflows
	cp autograding/combinatorial.yml $@.github/workflows/combinatorial.yml
	cp .gitignore $@
	cat PREFACE.md combinatorial/README.md > $@/README.md
	# Add revision to end of README.md
	echo "revision:" >> $@/README.md
	git rev-parse HEAD >> $@/README.md
	git -C $@ init
	git -C $@ add -A && git -C $@ commit -m "Initial commit"
