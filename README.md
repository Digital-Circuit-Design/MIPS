<p align="center">
  <img src="https://www.especial.gr/wp-content/uploads/2019/03/panepisthmio-dut-attikhs.png" alt="UNIWA" width="150"/>
</p>

<p align="center">
  <strong>UNIVERSITY OF WEST ATTICA</strong><br>
  SCHOOL OF ENGINEERING<br>
  DEPARTMENT OF COMPUTER ENGINEERING AND INFORMATICS
</p>

<p align="center">
  <a href="https://www.uniwa.gr" target="_blank">University of West Attica</a> ·
  <a href="https://ice.uniwa.gr" target="_blank">Department of Computer Engineering and Informatics</a>
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

<hr>

<p align="center">
  <strong>Supervision</strong>
</p>

<p align="center">
  Supervisor: Ioannis Vogiatzis, Professor<br>
</p>

<p align="center">
  <a href="https://ice.uniwa.gr/en/emd_person/ioannis-voyiatzis/" target="_blank">UNIWA Profile</a> ·
  <a href="https://www.linkedin.com/in/ioannis-voyiatzis-7b5a6b88/" target="_blank">LinkedIn</a>
</p>

<p align="center">
  Supervisor: Panagiotis Karkazis, Associate Professor<br>
</p>

<p align="center">
  <a href="https://ice.uniwa.gr/en/emd_person/panagiotis-karkazis/" target="_blank">UNIWA Profile</a> ·
  <a href="https://www.linkedin.com/in/panos-karkazis-39ba1595/" target="_blank">LinkedIn</a>
</p>

<p align="center">
  Co-supervisor: Athanasios Milidonis, Postdoctoral Researcher<br>
</p>

<p align="center">
  <a href="https://scholar.google.com/citations?user=akjyDIYAAAAJ&hl=en" target="_blank">Scholar</a> ·
  <a href="https://gr.linkedin.com/in/athanasios-milidonis-a5a560167" target="_blank">LinkedIn</a>
</p>

---

</hr>

<p align="center">
  Athens, September 2023
</p>

---

<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2436tlN3zV4_lE6TxdCfH4tiFdae0QtUhMQ&s" width="250"/>
</p>

---

# README

## Simple Circle of a MIPS Processor

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

| Section | Folder / File                              | Description                                          |
| ------: | ------------------------------------------ | ---------------------------------------------------- |
|       1 | `assign/`                                  | Assignment material                                  |
|     1.1 | `assign/DSD_ASSIGNMENT_MIPS_2023.pdf`      | MIPS processor assignment description (English)      |
|     1.2 | `assign/ΣΨΣ_ΑΣΚΗΣΗ_MIPS_2023.pdf`          | MIPS processor assignment description (Greek)        |
|       2 | `docs/`                                    | Theoretical documentation                            |
|     2.1 | `docs/Simple-Circle-MIPS-Porcessor.pdf`    | Single-cycle MIPS processor architecture (English)   |
|     2.2 | `docs/Απλός-Κύκλος-MIPS-Επεξεργαστή.pdf`   | Single-cycle MIPS processor architecture (Greek)     |
|       3 | `src/`                                     | VHDL source code implementations                     |
|     3.1 | `src/19390005_ATHANASIOU_02_MIPS.vhd`      | Top-level single-cycle MIPS processor implementation |
|     3.2 | `src/19390005_ATHANASIOU_03_testbench.vhd` | Top-level MIPS processor testbench                   |
|     3.3 | `src/control_unit.vhd`                     | Main control unit                                    |
|     3.4 | `src/control_unit_tb.vhd`                  | Control unit testbench                               |
|     3.5 | `src/alu.vhd`                              | Arithmetic Logic Unit (ALU)                          |
|     3.6 | `src/alu_tb.vhd`                           | ALU testbench                                        |
|     3.7 | `src/alu_control.vhd`                      | ALU control logic                                    |
|     3.8 | `src/alu_control_tb.vhd`                   | ALU control testbench                                |
|     3.9 | `src/register_file.vhd`                    | Register file implementation                         |
|    3.10 | `src/register_file_tb.vhd`                 | Register file testbench                              |
|    3.11 | `src/instructions_memory.vhd`              | Instruction memory                                   |
|    3.12 | `src/instructions_memory_tb.vhd`           | Instruction memory testbench                         |
|    3.13 | `src/data_memory.vhd`                      | Data memory                                          |
|    3.14 | `src/data_memory_tb.vhd`                   | Data memory testbench                                |
|    3.15 | `src/program_counter.vhd`                  | Program counter                                      |
|    3.16 | `src/program_counter_tb.vhd`               | Program counter testbench                            |
|    3.17 | `src/pc_adder.vhd`                         | Program counter adder                                |
|    3.18 | `src/pc_adder_tb.vhd`                      | Program counter adder testbench                      |
|    3.19 | `src/sign_extend_16to32.vhd`               | Sign extension unit                                  |
|    3.20 | `src/sign_extend_16to32_tb.vhd`            | Sign extension unit testbench                        |
|    3.21 | `src/shifter_2left.vhd`                    | Shift-left-by-2 unit                                 |
|    3.22 | `src/shifter_2left_tb.vhd`                 | Shift-left-by-2 unit testbench                       |
|    3.23 | `src/mux_32x_2to1.vhd`                     | 32-bit 2-to-1 multiplexer                            |
|    3.24 | `src/mux_32x_2to1_tb.vhd`                  | 32-bit 2-to-1 multiplexer testbench                  |
|    3.25 | `src/mux_5x_2to1.vhd`                      | 5-bit 2-to-1 multiplexer                             |
|    3.26 | `src/mux_5x_2to1_tb.vhd`                   | 5-bit 2-to-1 multiplexer testbench                   |
|    3.27 | `src/fullAdder_32bit.vhd`                  | 32-bit full adder                                    |
|    3.28 | `src/fullAdder_32bit_tb.vhd`               | 32-bit full adder testbench                          |
|    3.29 | `src/and2_gate.vhd`                        | 2-input AND gate                                     |
|    3.30 | `src/and2_gate_tb.vhd`                     | 2-input AND gate testbench                           |
|       4 | `README.md`                                | Project documentation                                |
|       5 | `INSTALL.md`                               | Usage instructions                                   |

---

## 1. Architecture Components

### 1.1 Arithmetic Logic Unit (ALU)

The **ALU** performs arithmetic and logical operations, including:

- Addition and subtraction
- Logical operations: AND, OR, XOR

The operation is selected via a **4-bit control signal (`operationSig`)**.

**Zero Signal**

- Outputs `1` when the result of a subtraction is zero.
- Used for **branching decisions** (e.g., BEQ/BNE).

---

## 2. Register File

A storage unit containing **32-bit registers**.

- **Read Operations:** Supports **two simultaneous reads**
- **Write Operation:** Supports **one write**, enabled only when `RegWrite = 1`

---

## 3. Memory Units

- **Instruction Memory**
  - Stores program instructions
  - Supplies the instruction pointed to by the Program Counter (PC)

- **Data Memory**
  - Stores runtime data
  - Controlled by `MemRead` and `MemWrite` signals

---

## 4. Control Units

- **Main Control Unit**
  - Generates control signals such as `RegDst`, `Branch`, `MemRead`, `MemWrite`, `MemtoReg`, etc.
  - Operates based on the instruction opcode

- **ALU Control Unit**
  - Decodes instruction type
  - Selects the exact ALU operation to perform

---

## 5. Supporting Logic

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

## 6. Instruction Execution Flow

Each instruction follows a **six-step execution pipeline**, completed in a single cycle:

1. **Fetch** – Read instruction from Instruction Memory using PC
2. **Decode** – Decode instruction and read registers
3. **Prepare** – Route operands to the ALU
4. **Execute** – Perform arithmetic or logical operation
5. **Memory Access** – Read/write Data Memory if required
6. **Update PC** – Compute and store the next instruction address

---

## 7. Implementation Details

- **Hardware Description Language:** VHDL
- **Primary Entity:** `alu`
- **Testbench:** `alu_tb`
  - Verifies operations such as addition, subtraction, and branch-related logic (e.g., BNE)
