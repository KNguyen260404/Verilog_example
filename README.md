# 4-bit 2-to-1 Multiplexer

This is a simple Verilog implementation of a 4-bit 2-to-1 multiplexer with a testbench.

## Cách chạy mô phỏng

### Sử dụng Icarus Verilog (iverilog)

Nếu bạn đang sử dụng WSL/Linux và đã cài đặt Icarus Verilog, hãy chạy các lệnh sau:

```bash
# Biên dịch mô hình và testbench
iverilog -o mux_sim mux_4bit_2to1.v mux_4bit_2to1_tb.v

# Chạy mô phỏng
vvp mux_sim

# Xem sóng (nếu GTKWave đã được cài đặt)
gtkwave mux_4bit_2to1_tb.vcd
```

### Sử dụng ModelSim

Nếu bạn đang sử dụng ModelSim, hãy thực hiện các lệnh sau trong cửa sổ ModelSim:

```tcl
# Tạo thư viện làm việc
vlib work

# Biên dịch các file
vlog mux_4bit_2to1.v mux_4bit_2to1_tb.v

# Chạy mô phỏng
vsim -novopt mux_4bit_2to1_tb

# Thêm tín hiệu để xem sóng
add wave /mux_4bit_2to1_tb/*

# Chạy mô phỏng 
run 100ns
```

### Sử dụng Vivado

Nếu bạn đang sử dụng Xilinx Vivado:

1. Tạo project mới
2. Thêm các file `mux_4bit_2to1.v` và `mux_4bit_2to1_tb.v`
3. Thiết lập `mux_4bit_2to1_tb` làm top-level simulation source
4. Chạy Behavioral Simulation

## Cài đặt các công cụ

### Icarus Verilog và GTKWave trên WSL/Ubuntu

```bash
sudo apt update
sudo apt install iverilog gtkwave
```

### Icarus Verilog và GTKWave trên Windows

Tải và cài đặt từ:
- [Icarus Verilog for Windows](http://bleyer.org/icarus/)
- [GTKWave for Windows](http://gtkwave.sourceforge.net/) 