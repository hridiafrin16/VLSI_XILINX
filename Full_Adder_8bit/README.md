# 8-bit Full Adder using VHDL

This project implements an **8-bit Full Adder** using **VHDL** and Xilinx Vivado.

### Description

The 8-bit Full Adder is constructed using **two 4-bit Full Adders**. The carry output from the lower 4-bit adder is connected to the carry input of the upper 4-bit adder.

### Inputs

* `A` – 8-bit binary input
* `B` – 8-bit binary input
* `Cin` – Carry input

### Outputs

* `Sum` – 8-bit addition result
* `Cout` – Final carry output

### Files

* `Full_Adder_bit8.vhd` – 8-bit Full Adder design
* `Full_Adder_bit8_tb.vhd` – Testbench for simulation



The design was simulated with different input combinations to verify the correctness of the 8-bit addition and carry propagation.
