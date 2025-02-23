LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY instructions_memory_tb IS
END instructions_memory_tb;

ARCHITECTURE testbench OF instructions_memory_tb IS

  COMPONENT instructions_memory 
  PORT (
          readAddr    : IN std_logic_vector(31 DOWNTO 0);
          instrOut    : OUT std_logic_vector(31 DOWNTO 0));
  END COMPONENT;
  
    SIGNAL readAddr_tb, instrOut_tb : std_logic_vector(31 DOWNTO 0);

BEGIN
  Comp_Connection : instructions_memory PORT MAP (readAddr => readAddr_tb,
                                              instrOut => instrOut_tb);
  
PROCESS
  BEGIN 
    readAddr_tb <= "00000000000000000000000000000001"; -- Read address 1
    wait for 10 ns;
    
    readAddr_tb <= "00000000000000000000000000000010"; -- Read address 2
    wait for 10 ns;
    
    readAddr_tb <= "00000000000000000000000000000011"; -- Read address 3
    wait for 10 ns;
  END PROCESS;                
END testbench;
