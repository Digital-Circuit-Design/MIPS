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

# INSTALL

## Simple Circle of a MIPS Processor

This repository contains a **Single-Cycle MIPS Processor** implemented in **VHDL**, along with detailed **testbenches** for each major component.  
The project is intended for **academic use** in Digital Systems / Computer Architecture courses and focuses on **simulation and verification**, not FPGA deployment.

---

## 1. Prerequisites

### 1.1 Operating System

Supported platforms:

- **Windows** (recommended – best compatibility with ModelSim)
- Linux
- macOS (may require alternative simulators or legacy support)

---

## 2. VHDL Simulation Software

### 2.1 Recommended Simulator

- **ModelSim Altera Starter Edition**  
  (or **ModelSim Intel FPGA Edition / Questa Intel FPGA Starter**)

Required features:

- VHDL-2008 support
- Hierarchical simulation
- Waveform visualization
- Testbench execution

> Note: This project was verified using ModelSim. Other simulators (e.g., GHDL) may require adjustments.

---

## 3. Development Tools (Optional but Recommended)

- Visual Studio Code + VHDL extension
- Notepad++
- Vim / Emacs
- ModelSim built-in editor

---

## 4. Knowledge Prerequisites

To fully understand and modify the project, familiarity with:

- Digital logic design
- VHDL syntax and structural design
- MIPS single-cycle architecture
- Datapath & control signal design
- Testbench-based verification

is strongly recommended.

---

## 5. Installation

### 5.1 Clone the Repository

Using Git:

```bash
git clone https://github.com/Digital-Circuit-Design/MIPS.git
```

### 5.2 Alternative (Without Git)

- Open the repository URL in your browser
- Click Code → Download ZIP
- Extract the ZIP file to a local directory

### 5.3 Install ModelSim

1. Download ModelSim Altera Starter Edition (or Intel FPGA equivalent)
2. Complete installation following vendor instructions
3. Verify installation by launching ModelSim successfully

---

## 6. Project Setup in ModelSim

### 6.1 Create a New Project

1. Open ModelSim
2. Select File → New → Project
3. Set:
   - Project Name
   - Project Location (your cloned repository path)
4. Choose Create Project

### 6.2 Add VHDL Source Files

1. In the Add Items to Project window:
   - Select Add Existing File
2. Navigate to the `src/` directory
3. Add:
   - All `*.vhd` files (designs and testbenches)
4. Finish project creation

### 6.3 Compile the Project

1. In the Project tab:
   - Select Compile → Compile All
2. Ensure:
   - No syntax errors
   - Successful compilation messages in the transcript

---

## 7. Simulation & Verification

### 7.1 Simulating Individual Components

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

### 7.2 Simulating the Full MIPS Processor

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

### 7.3 Waveform Analysis

1. Add internal signals to the waveform viewer
2. Inspect:
   - Control signals (`RegWrite`, `Branch`, `MemRead`, etc.)
   - ALU inputs/outputs
   - PC evolution
   - Register values

---

## 8. Open the Documentation

1. Navigate to the `docs/` directory
2. Open the report corresponding to your preferred language:
   - English: `Simple-Circle-MIPS-Porcessor.pdf`
   - Greek: `Απλός-Κύκλος-MIPS-Επεξεργαστή.pdf`
