TESTBENCHES = $(basename $(wildcard tb_*.sv))

include ../Makefile

# Sources are in current directory
SRC_DIR = $(PWD)

# Disable multi top module warning for this exercise
VERILATOR_FLAGS += -Wno-MULTITOP

