# Verilog-Adder-Calculator

A simple 4-bit adder calculator implemented in **Verilog HDL** for a **Cyclone IV FPGA** as a Final Semester Project (UAS).

## 📖 Overview

This project implements a simple digital calculator capable of adding two 4-bit binary numbers in real time. The inputs are provided through FPGA slide switches, while the output is displayed as decimal digits on a dual 7-segment display.

The design is written in Verilog HDL using a modular approach, consisting of separate modules for binary addition, binary-to-BCD conversion, and 7-segment display multiplexing.

## ✨ Features

* 4-bit binary input (A and B)
* Real-time addition
* 5-bit sum output
* Binary-to-BCD conversion
* Decimal output on dual 7-segment display
* Multiplexed 7-segment display control
* Modular Verilog HDL implementation

## 📂 Repository Structure

```text
.
├── calculator_top.v      # Top-level module
├── bcd_converter.v       # Binary-to-BCD converter
└── seg_mux.v             # 7-segment multiplexer & decoder
```

## Module Description

### `calculator_top.v`

* Top-level integration module
* Reads two 4-bit inputs from slide switches
* Handles active-low input inversion
* Performs binary addition
* Connects the BCD converter and 7-segment display modules

### `bcd_converter.v`

* Converts the 5-bit binary sum into decimal digits
* Produces separate tens and units outputs in BCD format
* Uses combinational logic with case statements

### `seg_mux.v`

* Controls the dual 7-segment display
* Divides the FPGA clock for display scanning
* Performs multiplexing between digits
* Decodes BCD values into 7-segment patterns

## Hardware

* FPGA Board: Cyclone IV
* Hardware Description Language: Verilog HDL
* Input: 4-bit Slide Switches
* Output: Dual 7-Segment Display

## Input Range

| Input A | Input B | Maximum Result |
| ------- | ------- | -------------- |
| 0 – 15  | 0 – 15  | 30             |

This repository contains only the Verilog source files (`.v`) used in the implementation of the project.
