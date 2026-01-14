<p align="center">
  <img src="https://www.especial.gr/wp-content/uploads/2019/03/panepisthmio-dut-attikhs.png" alt="UNIWA" width="150"/>
</p>

<p align="center">
  <strong>UNIVERSITY OF WEST ATTICA</strong><br>
  SCHOOL OF ENGINEERING<br>
  DEPARTMENT OF COMPUTER ENGINEERING AND INFORMATICS
</p>

---

<p align="center">
  <strong>Digital Circuit Design</strong>
</p>

<h1 align="center">
  Simple Circle of a MIPS Processor
</h1>

<p align="center">
  <strong>Vasileios Evangelos Athanasiou</strong><br>
  Student ID: 19390005
</p>

<p align="center">
  <a href="https://github.com/Ath21" target="_blank">GitHub</a> ·
  <a href="https://www.linkedin.com/in/vasilis-athanasiou-7036b53a4/" target="_blank">LinkedIn</a>
</p>

<p align="center">
  Supervisor: Ioannis Vogiatzis, Professor<br>
</p>

<p align="center">
  <a href="https://ice.uniwa.gr/en/emd_person/ioannis-voyiatzis/" target="_blank">UNIWA Profile</a> ·
  <a href="https://www.linkedin.com/in/ioannis-voyiatzis-7b5a6b88/" target="_blank">LinkedIn</a>
</p>

<p align="center">
  Co-supervisor: Panagiotis Karkazis, Associate Professor<br>
</p>

<p align="center">
  <a href="https://ice.uniwa.gr/en/emd_person/panagiotis-karkazis/" target="_blank">UNIWA Profile</a> ·
  <a href="https://www.linkedin.com/in/panos-karkazis-39ba1595/" target="_blank">LinkedIn</a>
</p>

<p align="center">
  Athens, September 2023
</p>

---

# Project Overview

The processor is designed to **execute each instruction in a single clock cycle**.  
It implements the core components of the **MIPS architecture**, including:

- Arithmetic Logic Unit (ALU)
- Register File
- Instruction Memory
- Data Memory
- Control Unit

The design demonstrates how control signals and data paths cooperate to complete instruction execution within one cycle.


---

## Table of Contents


| Section | Folder / File | Description |
|------:|---------------|-------------|
| 1 | `assign/` | Assignment material |
| 1.1 | `assign/DSD_ASSIGNMENT_MIPS_2023.pdf` | MIPS processor assignment description (English) |
| 1.2 | `assign/ΣΨΣ_ΑΣΚΗΣΗ_MIPS_2023.pdf` | MIPS processor assignment description (Greek) |
| 2 | `docs/` | Theoretical documentation |
| 2.1 | `docs/Simple-Circle-MIPS-Porcessor.pdf` | Single-cycle MIPS processor architecture (English) |
| 2.2 | `docs/Απλός-Κύκλος-MIPS-Επεξεργαστή.pdf` | Single-cycle MIPS processor architecture (Greek) |
| 3 | `src/` | VHDL source code implementations |
| 3.1 | `src/19390005_ATHANASIOU_02_MIPS.vhd` | Top-level single-cycle MIPS processor implementation |
| 3.2 | `src/19390005_ATHANASIOU_03_testbench.vhd` | Top-level MIPS processor testbench |
| 3.3 | `src/control_unit.vhd` | Main control unit |
| 3.4 | `src/control_unit_tb.vhd` | Control unit testbench |
| 3.5 | `src/alu.vhd` | Arithmetic Logic Unit (ALU) |
| 3.6 | `src/alu_tb.vhd` | ALU testbench |
| 3.7 | `src/alu_control.vhd` | ALU control logic |
| 3.8 | `src/alu_control_tb.vhd` | ALU control testbench |
| 3.9 | `src/register_file.vhd` | Register file implementation |
| 3.10 | `src/register_file_tb.vhd` | Register file testbench |
| 3.11 | `src/instructions_memory.vhd` | Instruction memory |
| 3.12 | `src/instructions_memory_tb.vhd` | Instruction memory testbench |
| 3.13 | `src/data_memory.vhd` | Data memory |
| 3.14 | `src/data_memory_tb.vhd` | Data memory testbench |
| 3.15 | `src/program_counter.vhd` | Program counter |
| 3.16 | `src/program_counter_tb.vhd` | Program counter testbench |
| 3.17 | `src/pc_adder.vhd` | Program counter adder |
| 3.18 | `src/pc_adder_tb.vhd` | Program counter adder testbench |
| 3.19 | `src/sign_extend_16to32.vhd` | Sign extension unit |
| 3.20 | `src/sign_extend_16to32_tb.vhd` | Sign extension unit testbench |
| 3.21 | `src/shifter_2left.vhd` | Shift-left-by-2 unit |
| 3.22 | `src/shifter_2left_tb.vhd` | Shift-left-by-2 unit testbench |
| 3.23 | `src/mux_32x_2to1.vhd` | 32-bit 2-to-1 multiplexer |
| 3.24 | `src/mux_32x_2to1_tb.vhd` | 32-bit 2-to-1 multiplexer testbench |
| 3.25 | `src/mux_5x_2to1.vhd` | 5-bit 2-to-1 multiplexer |
| 3.26 | `src/mux_5x_2to1_tb.vhd` | 5-bit 2-to-1 multiplexer testbench |
| 3.27 | `src/fullAdder_32bit.vhd` | 32-bit full adder |
| 3.28 | `src/fullAdder_32bit_tb.vhd` | 32-bit full adder testbench |
| 3.29 | `src/and2_gate.vhd` | 2-input AND gate |
| 3.30 | `src/and2_gate_tb.vhd` | 2-input AND gate testbench |
| 4 | `README.md` | Repository overview and usage instructions |

---

## Architecture Components

### 1. Arithmetic Logic Unit (ALU)

The **ALU** performs arithmetic and logical operations, including:

- Addition and subtraction  
- Logical operations: AND, OR, XOR  

The operation is selected via a **4-bit control signal (`operationSig`)**.

**Zero Signal**
- Outputs `1` when the result of a subtraction is zero.
- Used for **branching decisions** (e.g., BEQ/BNE).

---

### 2. Register File

A storage unit containing **32-bit registers**.

- **Read Operations:** Supports **two simultaneous reads**
- **Write Operation:** Supports **one write**, enabled only when `RegWrite = 1`

---

### 3. Memory Units

- **Instruction Memory**
  - Stores program instructions
  - Supplies the instruction pointed to by the Program Counter (PC)

- **Data Memory**
  - Stores runtime data
  - Controlled by `MemRead` and `MemWrite` signals

---

### 4. Control Units

- **Main Control Unit**
  - Generates control signals such as `RegDst`, `Branch`, `MemRead`, `MemWrite`, `MemtoReg`, etc.
  - Operates based on the instruction opcode

- **ALU Control Unit**
  - Decodes instruction type
  - Selects the exact ALU operation to perform

---

### 5. Supporting Logic

- **Program Counter (PC):**  
  A 32-bit register holding the address of the next instruction

- **Sign Extension:**  
  Expands 16-bit immediate values to 32-bit values

- **Multiplexers:**  
  2-in-1 multiplexers select:
  - Destination registers
  - ALU input sources
  - Write-back data (ALU result vs memory output)

---

## Instruction Execution Flow

Each instruction follows a **six-step execution pipeline**, completed in a single cycle:

1. **Fetch** – Read instruction from Instruction Memory using PC  
2. **Decode** – Decode instruction and read registers  
3. **Prepare** – Route operands to the ALU  
4. **Execute** – Perform arithmetic or logical operation  
5. **Memory Access** – Read/write Data Memory if required  
6. **Update PC** – Compute and store the next instruction address  

---

## Implementation Details

- **Hardware Description Language:** VHDL  
- **Primary Entity:** `alu`  
- **Testbench:** `alu_tb`  
  - Verifies operations such as addition, subtraction, and branch-related logic (e.g., BNE)

---

# Installation & Setup Guide

This repository contains a **Single-Cycle MIPS Processor** implemented in **VHDL**, along with detailed **testbenches** for each major component.  
The project is intended for **academic use** in Digital Systems / Computer Architecture courses and focuses on **simulation and verification**, not FPGA deployment.

---

## Prerequisites

### 1. Operating System
Supported platforms:
- **Windows** (recommended – best compatibility with ModelSim)
- Linux
- macOS (may require alternative simulators or legacy support)

---

### 2. VHDL Simulation Software

#### Recommended Simulator
- **ModelSim Altera Starter Edition**  
  (or **ModelSim Intel FPGA Edition / Questa Intel FPGA Starter**)

Required features:
- VHDL-2008 support
- Hierarchical simulation
- Waveform visualization
- Testbench execution

> Note: This project was verified using ModelSim. Other simulators (e.g., GHDL) may require adjustments.

---

### 3. Development Tools (Optional but Recommended)

- Visual Studio Code + VHDL extension
- Notepad++
- Vim / Emacs
- ModelSim built-in editor

---

### 4. Knowledge Prerequisites

To fully understand and modify the project, familiarity with:
- Digital logic design
- VHDL syntax and structural design
- MIPS single-cycle architecture
- Datapath & control signal design
- Testbench-based verification

is strongly recommended.

---

## Installation

### 1. Clone the Repository

Using Git:
```bash
git clone https://github.com/Digital-Circuit-Design/MIPS.git
```

#### Alternative (Without Git)

- Open the repository URL in your browser
- Click Code → Download ZIP
- Extract the ZIP file to a local directory

### 2. Install ModelSim
1. Download ModelSim Altera Starter Edition (or Intel FPGA equivalent)
2. Complete installation following vendor instructions
3. Verify installation by launching ModelSim successfully

---

## Project Setup in ModelSim
### 1. Create a New Project
1. Open ModelSim
2. Select File → New → Project
3. Set:
    - Project Name
    - Project Location (your cloned repository path)
4. Choose Create Project

### 2. Add VHDL Source Files
1. In the Add Items to Project window:
    - Select Add Existing File
2. Navigate to the `src/` directory
3. Add:
    - All `*.vhd` files (designs and testbenches)
4. Finish project creation

### 3. Compile the Project
1. In the Project tab:
    - Select Compile → Compile All
2. Ensure:
    - No syntax errors
    - Successful compilation messages in the transcript

---

## Simulation & Verification
### 1. Simulating Individual Components
Each module has its own testbench (`*_tb.vhd`).

Example (ALU):
1. Select `alu_tb` as the top-level entity
2. Click Simulate → Start Simulation
3. Choose `work.alu_tb`
4. Click OK

Run simulation:
```bash
run -all
```
Verify:
- Arithmetic operations
- Logical operations
- Zero flag behavior

### 2. Simulating the Full MIPS Processor
To simulate the complete single-cycle processor:
1. Select:
    - `19390005_ATHANASIOU_03_testbench.vhd`
2. Start simulation:
    - Simulate → Start Simulation
3. Run:
```bah
run -all
```
Observe:
- Instruction fetch
- Control signal generation
- Register file reads/writes
- ALU execution
- Memory access
- Program Counter updates

### 3. Waveform Analysis
1. Add internal signals to the waveform viewer
2. Inspect:
    - Control signals (`RegWrite`, `Branch`, `MemRead`, etc.)
    - ALU inputs/outputs
    - PC evolution
    - Register values

---

## Open the Documentation
1. Navigate to the `docs/` directory
2. Open the report corresponding to your preferred language:
    - English: `Simple-Circle-MIPS-Porcessor.pdf`
    - Greek: `Απλός-Κύκλος-MIPS-Επεξεργαστή.pdf`