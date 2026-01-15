# Makefile
# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

# Define the Verilog sources
# 1. The wrapper we just checked
VERILOG_SOURCES += $(PWD)/tb.v
# 2. Your actual design in the src folder
VERILOG_SOURCES += $(PWD)/../src/project.v

# The name of the top-level module in tb.v
TOPLEVEL = tb

# The name of the python file (without .py)
MODULE = test

# COMPILER ARGS
# This ensures the dump block in tb.v is actually active
COMPILE_ARGS += -D DUMP_WAVEFORMS

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
