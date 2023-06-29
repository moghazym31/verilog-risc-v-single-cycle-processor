# RISC-V Single Cycle Processor

This project implements a **RISC-V single cycle processor**. It features a complete datapath and various components implemented using Verilog.

## Supported Instructions

This implmentation can handle the following instructions:

- `add`, `lw`, `sub`, `addi`, `or`, `xor`, `xori`, `ori`, `sll`, `slli`, `srli`, `srl`, `slt`, `sltu`, `slti`, `sltiu`, `lb`, `sra`, `srai`, `lbu`, `lhu`, `lh`, `sb`, `sh`, `sw`, `lui`, `auipc`, `bltu`, `bne`, `beq`, `jal`, `blt`, `bge`, `bgeu`, `jalr`

## Technical Summary

The project involved the following key steps:

1. Designing a complete datapath for the RISC-V single cycle processor.
2. Implementing individual components using Verilog modules.
3. Creating a top module called `CPU_TOP` to instantiate and connect all the components.
4. Developing a testbench to simulate the clock and verify the processor's functionality.
5. Implementing special instructions such as FENCE, ECALL, and EBREAK.

## Schematic and Results

The full data path schematic and the final register file outputs for Batch 1 and Batch 2 can be seen below:

- Full Data Path:
  ![Full Data Path](https://s12.gifyu.com/images/SQrOO.png)

- Batch 1 Test Cases Final Register File:
  ![Batch 1 Test Cases Final Register File](https://s11.gifyu.com/images/SQrOy.png)

- Batch 2 Test Cases Final Register File:
  ![Batch 2 Test Cases Final Register File](https://s11.gifyu.com/images/SQryL.png)

## Usage

To run the test cases, uncomment the desired batch in the instruction memory. The data memory is common for both batches.
