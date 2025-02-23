LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MIPS_tb IS
END MIPS_tb;

ARCHITECTURE testbench OF MIPS_tb IS
  
  COMPONENT MIPS
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
  END COMPONENT;
  
  SIGNAL MIPS_clock_tb         : std_logic := '0';
  SIGNAL MIPS_reset_tb         : std_logic := '0';
  SIGNAL PC_output_tb          : std_logic_vector(31 DOWNTO 0) := (others => '0');
  SIGNAL ALU_output_tb         : std_logic_vector(31 DOWNTO 0) := (others => '0');
  SIGNAL zeroSig_tb            : std_logic := '0';
  SIGNAL readData1_tb          : std_logic_vector(31 DOWNTO 0) := (others => '0');
  SIGNAL readData2_tb          : std_logic_vector(31 DOWNTO 0) := (others => '0');
  SIGNAL Branch_tb             : std_logic := '0';
  SIGNAL instrOut_tb : std_logic_vector(31 DOWNTO 0) := (others => '0');
  SIGNAL writeData_tb     : std_logic_vector(31 DOWNTO 0) := (others => '0');
  SIGNAL MemWrite_tb      : std_logic := '0';
  SIGNAL RegWrite_tb          : std_logic := '0';

BEGIN
MIPS_testbench : MIPS     PORT MAP (
  MIPS_clock         => MIPS_clock_tb,
  MIPS_reset         => MIPS_reset_tb,
  PC_output_MIPS          => PC_output_tb,
  ALU_output_MIPS => ALU_output_tb,
  zeroSig_MIPS => zeroSig_tb,
  readData1_MIPS => readData1_tb,
  readData2_MIPS => readData2_tb,
  Branch_MIPS => Branch_tb,
  instrOut_MIPS => instrOut_tb,
  writeData_MIPS => writeData_tb,
  MemWrite_MIPS => MemWrite_tb,
  RegWrite_MIPS => RegWrite_tb
);

clock_process : PROCESS
    BEGIN
      MIPS_clock_tb <= '0';
      wait for 5 ns;
      MIPS_clock_tb <= '1';
      wait for 5 ns;
  END PROCESS;

reset_process : PROCESS
    BEGIN
        MIPS_reset_tb <= '1';
        wait for 10 ns;
        MIPS_reset_tb <= '0';
        wait;
    END PROCESS;
END testbench;
