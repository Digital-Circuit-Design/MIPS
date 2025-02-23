LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_unit_tb IS
END control_unit_tb;

ARCHITECTURE testbench OF control_unit_tb IS


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
  
  SIGNAL CU_clock_tb : std_logic;
  SIGNAL Instr_tb : std_logic_vector(5 DOWNTO 0);
  SIGNAL ALUOp_tb : std_logic_vector(1 DOWNTO 0);
  SIGNAL RegDst_tb, Branch_tb, MemRead_tb, MemtoReg_tb,
         MemWrite_tb, ALUSrc_tb, RegWrite_tb : std_logic;

BEGIN
  Comp_Connection : control_unit PORT MAP (CU_clock => CU_clock_tb,
                                           Instr => Instr_tb,
                                           RegDst => RegDst_tb,
                                           Branch => Branch_tb,
                                           MemRead => MemRead_tb,
                                           MemtoReg => MemtoReg_tb,
                                           ALUOp => ALUOp_tb,
                                           MemWrite => MemWrite_tb,
                                           ALUSrc => ALUSrc_tb,
                                           RegWrite => RegWrite_tb);

clock_process : PROCESS
BEGIN
  CU_clock_tb <= '0';
  wait for 5 ns;
  CU_clock_tb <= '1';
  wait for 5 ns; 
END PROCESS; 

stim_process: PROCESS
BEGIN
    -- add, sub
    Instr_tb <= "000000";
    wait for 10 ns;
    
    -- addi 
    Instr_tb <= "001000";
    wait for 10 ns;
    
    -- lw
    Instr_tb <= "100011";
    wait for 10 ns;
    
    -- sw
    Instr_tb <= "101011";
    wait for 10 ns;
    
    -- bne
    Instr_tb <= "000101";
    wait for 10 ns;
    
    -- default 
    Instr_tb <= "111111";
    wait for 10 ns;
END PROCESS;             
END testbench;
