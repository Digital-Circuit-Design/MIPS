-- Testbench Program Counter Adder

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pc_adder_tb IS
END pc_adder_tb;

ARCHITECTURE testbench OF pc_adder_tb IS

COMPONENT pc_adder 
  PORT (
          previousCmdAddr : IN std_logic_vector(31 DOWNTO 0);
          nextCmdAddr     : OUT std_logic_vector(31 DOWNTO 0));
END COMPONENT;

  SIGNAL previousCmdAddr_tb, nextCmdAddr_tb : std_logic_vector(31 DOWNTO 0);

BEGIN
  Comp_Connection : pc_adder PORT MAP (previousCmdAddr => previousCmdAddr_tb,
                                          nextCmdAddr => nextCmdAddr_tb);
  
PROCESS
  BEGIN 
    previousCmdAddr_tb <= "00000000000000000000000000000000";
    wait for 10 ns;
    
    previousCmdAddr_tb <= "00000000000000000000000000000001";
    wait for 10 ns;
    
    previousCmdAddr_tb <= "00000000000000000000000000000010";
    wait for 10 ns;
    
    previousCmdAddr_tb <= "00000000000000000000000000000011";
    wait for 10 ns;
    
    previousCmdAddr_tb <= "11111111111111111111111111111111";
    wait for 10 ns;
    
    previousCmdAddr_tb <= "11111111111111111111111111111111";
    wait for 10 ns;
  END PROCESS; 
END testbench;