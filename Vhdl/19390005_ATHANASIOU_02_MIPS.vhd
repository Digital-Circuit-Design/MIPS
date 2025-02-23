LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY MIPS IS
  PORT (
          MIPS_clock : IN std_logic;
          MIPS_reset : IN std_logic;
          PC_output_MIPS : OUT std_logic_vector(31 DOWNTO 0);
          ALU_output_MIPS : OUT std_logic_vector(31 DOWNTO 0); 
          zeroSig_MIPS    : OUT std_logic;
          readData1_MIPS : OUT std_logic_vector(31 DOWNTO 0); 
          readData2_MIPS : OUT std_logic_vector(31 DOWNTO 0);
          Branch_MIPS    : OUT std_logic;
          instrOut_MIPS : OUT std_logic_vector(31 DOWNTO 0);
          writeData_MIPS : OUT std_logic_vector(31 DOWNTO 0);
          MemWrite_MIPS  : OUT std_logic;
          RegWrite_MIPS  : OUT std_logic   
          );
END MIPS;

ARCHITECTURE structural OF MIPS IS

COMPONENT alu 
PORT (
  operationSig   : IN std_logic_vector(3 DOWNTO 0);
  ALU_input1     : IN std_logic_vector(31 DOWNTO 0);
  ALU_input2     : IN std_logic_vector(31 DOWNTO 0);
  ALU_output     : OUT std_logic_vector(31 DOWNTO 0);
  zeroSig        : OUT std_logic);
END COMPONENT;

COMPONENT register_file 
PORT (
  RF_clock      : IN std_logic;
  RF_reset      : IN std_logic;
  readReg1      : IN std_logic_vector(4 DOWNTO 0);
  readReg2      : IN std_logic_vector(4 DOWNTO 0);
  writeRegIn    : IN std_logic_vector(4 DOWNTO 0);
  writeData     : IN std_logic_vector(31 DOWNTO 0);
  RegWrite      : IN std_logic;
  readData1     : OUT std_logic_vector(31 DOWNTO 0);
  readData2     : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT data_memory 
PORT (
  writeData    : IN std_logic_vector(31 DOWNTO 0);
  addr         : IN std_logic_vector(31 DOWNTO 0);
  MemRead      : IN std_logic;
  MemWrite     : IN std_logic;
  readData     : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT instructions_memory 
PORT (
  readAddr    : IN std_logic_vector(31 DOWNTO 0);
  instrOut     : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT control_unit
PORT (
  CU_clock  : IN std_logic;
  Instr     : IN std_logic_vector(5 DOWNTO 0);
  RegDst    : OUT std_logic;
  Branch    : OUT std_logic;
  MemRead   : OUT std_logic;
  MemtoReg  : OUT std_logic;
  ALUOp     : OUT std_logic_vector(1 DOWNTO 0);
  MemWrite  : OUT std_logic;
  ALUSrc    : OUT std_logic;
  RegWrite  : OUT std_logic); 
END COMPONENT;

COMPONENT alu_control 
PORT (
  ALUOp     : IN std_logic_vector(1 DOWNTO 0);
  Instr     : IN std_logic_vector(5 DOWNTO 0);
  ALUCtrl   : OUT std_logic_vector(3 DOWNTO 0));
END COMPONENT;

COMPONENT program_counter 
PORT (
  PC_input  : IN std_logic_vector(31 DOWNTO 0);
  PC_clock  : IN std_logic;
  PC_reset  : IN std_logic;
  PC_output : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT pc_adder 
PORT (
  previousCmdAddr : IN std_logic_vector(31 DOWNTO 0);
  nextCmdAddr     : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;
COMPONENT mux_5x_2to1 
PORT (
  Mux5_input1, Mux5_input2  : IN std_logic_vector(4 DOWNTO 0);
  Mux5_S                    : IN std_logic;
  Mux5_output               : OUT std_logic_vector(4 DOWNTO 0));
END COMPONENT;

COMPONENT sign_extend_16to32 
PORT (
  SignExtend_input   : IN  std_logic_vector(15 DOWNTO 0);
  SignExtend_output  : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT mux_32x_2to1 
PORT (
  Mux32_input1, Mux32_input2  : IN std_logic_vector(31 DOWNTO 0);
  Mux32_S                     : IN std_logic;
  Mux32_output                : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT shifter_2left 
PORT (
  Shifter_input    : IN  std_logic_vector(31 DOWNTO 0);
  Shifter_output   : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

COMPONENT fullAdder_32bit 
PORT (
  Adder_input1, Adder_input2  : IN std_logic_vector(31 DOWNTO 0); 
  Adder_output                : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;
COMPONENT and_2gate 
PORT (
  Branch, Zero  : IN std_logic;
  AND_output	: OUT std_logic);
END COMPONENT;

-- ALU out signals
SIGNAL ALU_output_Sig : std_logic_vector(31 DOWNTO 0); 
SIGNAL zeroSig_Sig    : std_logic;

-- Register File out signals
SIGNAL readData1_Sig : std_logic_vector(31 DOWNTO 0); 
SIGNAL readData2_Sig : std_logic_vector(31 DOWNTO 0);
SIGNAL writeData_Sig : std_logic_vector(31 DOWNTO 0);  

-- Data Memory out signals
SIGNAL readDataMemory_Sig : std_logic_vector(31 DOWNTO 0); 

-- Instructions Memory out signals 
SIGNAL instrOut_Sig : std_logic_vector(31 DOWNTO 0);

-- Control Unit 
SIGNAL Instr_Sig     : std_logic_vector(5 DOWNTO 0);
SIGNAL RegDst_Sig    : std_logic; 
SIGNAL Branch_Sig    : std_logic; 
SIGNAL MemRead_Sig   : std_logic; 
SIGNAL MemtoReg_Sig  : std_logic; 
SIGNAL ALUOp_Sig     : std_logic_vector(1 DOWNTO 0); 
SIGNAL MemWrite_Sig  : std_logic; 
SIGNAL ALUSrc_Sig    : std_logic; 
SIGNAL RegWrite_Sig  : std_logic;

-- ALU Control out signals 
SIGNAL ALUCtrl_Sig : std_logic_vector(3 DOWNTO 0);

-- Program Counter out signals
SIGNAL PC_output_Sig : std_logic_vector(31 DOWNTO 0);

-- PC Adder out signals
SIGNAL nextCmdAddr_Sig : std_logic_vector(31 DOWNTO 0); 

-- Mux 5x 2-to-1 out signals 
SIGNAL Mux5_output_Register : std_logic_vector(4 DOWNTO 0); 

-- Sign Extend 16-to-32 out signals 
SIGNAL SignExtend_output_Sig : std_logic_vector(31 DOWNTO 0); 

-- Mux 32x 2-to-1 out signals
SIGNAL Mux32_output_PC        : std_logic_vector(31 DOWNTO 0);
SIGNAL Mux32_output_ALU       : std_logic_vector(31 DOWNTO 0); 
SIGNAL Mux32_output_Register  : std_logic_vector(31 DOWNTO 0);

-- Shifter 2 Left out signals
SIGNAL Shifter_output_Sig : std_logic_vector(31 DOWNTO 0);

-- Full Adder 32-bit  out signals
SIGNAL Adder_output_Sig : std_logic_vector(31 DOWNTO 0);
SIGNAL Adder_Cout_Sig   : std_logic; 

-- AND 2-gate out signals
SIGNAL AND_output_Sig : std_logic; 

BEGIN

PC_output_MIPS 	<= PC_output_Sig;
instrOut_MIPS 	<= instrOut_Sig;
ALU_output_MIPS 	<= ALU_output_Sig;
readData1_MIPS	<= readData1_Sig;
readData2_MIPS 	<= readData2_Sig;
writeData_MIPS  	<= readDataMemory_Sig WHEN MemtoReg_Sig = '1' ELSE ALU_output_Sig;
Branch_MIPS 		<= Branch_Sig;
zeroSig_MIPS 		<= zeroSig_Sig;
RegWrite_MIPS 	<= RegWrite_Sig;
MemWrite_MIPS 	<= MemWrite_Sig;

PCAdder : pc_adder PORT MAP (previousCmdAddr => PC_output_Sig, 
                             nextCmdAddr => nextCmdAddr_Sig);

BranchAdder : fullAdder_32bit PORT MAP (Adder_input1 => nextCmdAddr_Sig, 
                                        Adder_input2 => Shifter_output_Sig,
                                        Adder_output => Adder_output_Sig);
  
ProgramCounter : program_counter PORT MAP (PC_input => Mux32_output_PC,
                                           PC_clock => MIPS_clock,
                                           PC_reset => MIPS_reset,
                                           PC_output => PC_output_Sig);

InstructionsMemory : instructions_memory PORT MAP (readAddr => PC_output_Sig,
                                                   instrOut => instrOut_Sig);

RegisterFile : register_file PORT MAP (RF_clock => MIPS_clock,
                                       RF_reset => MIPS_reset,
                                       readReg1 => instrOut_Sig(25 DOWNTO 21),
                                       readReg2 => instrOut_Sig(20 DOWNTO 16),
                                       writeRegIn => Mux5_output_Register,
                                       writeData => Mux32_output_Register,
                                       RegWrite => RegWrite_Sig,
                                       readData1 => readData1_Sig,
                                       readData2 => readData2_Sig);

ControlUnit : control_unit PORT MAP (CU_clock => MIPS_clock,
                                     Instr => instrOut_Sig(31 DOWNTO 26),
                                     RegDst => RegDst_Sig,
                                     Branch => Branch_Sig,
                                     MemRead => MemRead_Sig,
                                     MemtoReg => MemtoReg_Sig,
                                     ALUOp => ALUOp_Sig,
                                     MemWrite => MemWrite_Sig,
                                     ALUSrc => ALUSrc_Sig,
                                     RegWrite => RegWrite_Sig);

ALUControl : alu_control PORT MAP (ALUOp => ALUOp_Sig,
                                   Instr => instrOut_Sig(5 DOWNTO 0),
                                   ALUCtrl => ALUCtrl_Sig);
      
ArithmeticLogicUnit : alu PORT MAP (operationSig => ALUCtrl_Sig,
                                    ALU_input1 => readData1_Sig,
                                    ALU_input2 => Mux32_output_ALU,
                                    ALU_output => ALU_output_Sig,
                                    zeroSig => zeroSig_Sig);

DataMemory  : data_memory PORT MAP (writeData => readData2_Sig,
                                    addr => ALU_output_Sig,
                                    MemRead => MemRead_Sig,
                                    MemWrite => MemWrite_Sig,
                                    readData => readDataMemory_Sig);

Mux5x2to1_Register  : mux_5x_2to1 PORT MAP (Mux5_input1 => instrOut_Sig(20 DOWNTO 16),
                                            Mux5_input2 => instrOut_Sig(15 DOWNTO 11),
                                            Mux5_S => RegDst_Sig,
                                            Mux5_output => Mux5_output_Register);

Mux32x2to1_ALU : mux_32x_2to1 PORT MAP (Mux32_input1 => readData2_Sig,
                                        Mux32_input2 => SignExtend_output_Sig,
                                        Mux32_S => ALUSrc_Sig,
                                        Mux32_output => Mux32_output_ALU);
          
Mux32x2to1_Register : mux_32x_2to1 PORT MAP (Mux32_input1 => readDataMemory_Sig,
                                             Mux32_input2 => ALU_output_Sig,
                                             Mux32_S => MemtoReg_Sig,
                                             Mux32_output => Mux32_output_Register);

Mux32x2to1_PC : mux_32x_2to1 PORT MAP (Mux32_input1 => nextCmdAddr_Sig,
                                       Mux32_input2 => Adder_output_Sig,
                                       Mux32_S => AND_output_Sig,
                                       Mux32_output => Mux32_output_PC);

SignExtend16to32  : sign_extend_16to32 PORT MAP (SignExtend_input => instrOut_Sig(15 DOWNTO 0),
                                                 SignExtend_output => SignExtend_output_Sig);

AND2gate : and_2gate PORT MAP (Branch => Branch_Sig,
                               Zero => zeroSig_Sig,
                               AND_output => AND_output_Sig);

Shifter2Left  : shifter_2left PORT MAP (Shifter_input => SignExtend_output_Sig,
                                        Shifter_output => Shifter_output_Sig);

END structural;
