# Verilog + SystemVerilog Examples Collection

This repository contains various Verilog implementations with testbenches for digital circuit designs.

## Available Examples

1. **1-bit Full Adder** (`1_bit_fulladder/`)
   - Implementation of a 1-bit full adder using half adders

2. **4-bit 2-to-1 Multiplexer** (`mux21_4bit/`)
   - 4-bit 2-to-1 multiplexer implementation

3. **4-bit 4-to-1 Multiplexer** (`mux41_4bit/`)
   - 4-bit 4-to-1 multiplexer implementation

4. **4-bit Comparator** (`4bit_comparator/`)
   - 4-bit comparator with equality and magnitude comparison

5. **2-to-4 Binary Decoder** (`24_binary_decoder/`)
   - 2-to-4 binary decoder implementation

6. **4-to-2 Priority Encoder** (`priority_encoder_42/`)
   - 4-to-2 priority encoder implementation

7. **8-to-3 Priority Encoder** (`priority_encoder_83/`)
   - 8-to-3 priority encoder implementation

8. **Common Anode 7-Segment Decoder** (`common_Anode_7segmentdecoder/`)
   - BCD to 7-segment display decoder (common anode)

## Running Simulations

### Using Icarus Verilog (iverilog)

For WSL/Linux users with Icarus Verilog installed:

```bash
# Navigate to the example directory
cd <example_directory>

# Compile the model and testbench
iverilog -o sim_output *.v

# Run simulation
vvp sim_output

# View waveform (if GTKWave is installed)
gtkwave *_tb.vcd
```

Example for the 4-bit 2-to-1 multiplexer:
```bash
cd mux21_4bit
iverilog -o mux_sim mux_4bit_2to1.v mux_4bit_2to1_tb.v
vvp mux_sim
gtkwave mux_4bit_2to1_tb.vcd
```

### Using ModelSim

In the ModelSim command window:

```tcl
# Navigate to the example directory
cd <example_directory>

# Create a working library
vlib work

# Compile the Verilog files
vlog *.v

# Start simulation with the testbench
vsim -novopt <testbench_module_name>

# Add signals to waveform
add wave /*

# Run simulation 
run 100ns
```

Example for the 1-bit full adder:
```tcl
cd 1_bit_fulladder
vlib work
vlog full_adder.v half_adder.v full_adder_tb.v
vsim -novopt full_adder_tb
add wave /*
run 100ns
```

### Using Xilinx Vivado

1. Create a new project in Vivado
2. Add all Verilog files from the desired example directory
3. Set the testbench file as the top-level simulation source
4. Run Behavioral Simulation

## Installation of Simulation Tools

### Icarus Verilog and GTKWave on WSL/Ubuntu

```bash
sudo apt update
sudo apt install iverilog gtkwave
```

### Icarus Verilog and GTKWave on Windows

Download and install from:
- [Icarus Verilog for Windows](http://bleyer.org/icarus/)
- [GTKWave for Windows](http://gtkwave.sourceforge.net/)

### ModelSim

- [ModelSim-Intel FPGA Edition](https://www.intel.com/content/www/us/en/software-kit/750368/modelsim-intel-fpga-standard-edition-software-version-20-1-1.html)
- [ModelSim PE Student Edition](https://www.mentor.com/company/higher_ed/modelsim-student-edition)

### Xilinx Vivado

- [Xilinx Vivado Design Suite](https://www.xilinx.com/products/design-tools/vivado.html) 

