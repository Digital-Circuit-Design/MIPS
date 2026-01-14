-- Testbench ALU Control

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY alu_control_tb IS
END alu_control_tb;

ARCHITECTURE testbench OF alu_control_tb IS

  COMPONENT alu_control 
  PORT (
          ALUOp     : IN std_logic_vector(1 DOWNTO 0);
          Instr     : IN std_logic_vector(5 DOWNTO 0);
          ALUCtrl   : OUT std_logic_vector(3 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL ALUOp_tb : std_logic_vector(1 DOWNTO 0);
  SIGNAL Instr_tb : std_logic_vector(5 DOWNTO 0);
  SIGNAL ALUCtrl_tb : std_logic_vector(3 DOWNTO 0);

BEGIN
  Comp_Connection : alu_control PORT MAP (ALUOp => ALUOp_tb,
                                          Instr => Instr_tb,
                                          ALUCtrl => ALUCtrl_tb);
  
PROCESS
BEGIN
	-- addi
    ALUOp_tb <= "10";
    Instr_tb <= "001000";
    wait for 10 ns;
    
    -- bne
    ALUOp_tb <= "01";
    Instr_tb <= "000000";
    wait for 10 ns;
    
    -- add
    ALUOp_tb <= "00";
    Instr_tb <= "100000";
    wait for 10 ns;
    
    -- sub
    ALUOp_tb <= "00";
    Instr_tb <= "100010";
    wait for 10 ns;
    
    -- default
    ALUOp_tb <= "00";
    Instr_tb <= "111111";
    wait for 10 ns;
    
    -- default
    ALUOp_tb <= "11";
    wait for 10 ns;      
END PROCESS;                
END testbench;

