-- Control Unit

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_unit IS
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
END control_unit;

ARCHITECTURE behavioral OF control_unit IS
BEGIN
PROCESS (CU_clock, Instr)
BEGIN
  IF rising_edge(CU_clock) THEN
    CASE Instr IS
      -- add, sub
      WHEN "000000" => 
        RegDst <= '1';
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= '0';
        ALUOp <= "10";
        MemWrite <= '0';
        ALUSrc <= '0';
        RegWrite <= '1';
      --addi
      WHEN "001000" =>
        RegDst <= '0';
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= '0';
        ALUOp <= "00";
        MemWrite <= '0';
        ALUSrc <= '1';
        RegWrite <= '1';
      --lw
      WHEN "100011" =>
        RegDst <= '0';
        Branch <= '0';
        MemRead <= '1';
        MemtoReg <= '1';
        ALUOp <= "00";
        MemWrite <= '0';
        ALUSrc <= '1';
        RegWrite <= '1';
   	  --sw
   	  WHEN "101011" => 
        RegDst <= 'X';
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= 'X';
        ALUOp <= "00";
        MemWrite <= '1';
        ALUSrc <= '1';
        RegWrite <= '0';
      --bne
      WHEN "000101" => 
        RegDst <= 'X';
        Branch <= '1';
        MemRead <= '0';
        MemtoReg <= 'X';
        ALUOp <= "01";
        MemWrite <= '0';
        ALUSrc <= '0';
        RegWrite <= '0';
      WHEN others =>
        RegDst <= '0';
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= '0';
        ALUOp <= "00";
        MemWrite <= '0';
        ALUSrc <= '0';
        RegWrite <= '0';
    END CASE;
  END IF;
END PROCESS;
END behavioral;

    
    
    