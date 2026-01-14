-- Testbench Shifter 2-bits left

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shifter_2left_tb IS
END shifter_2left_tb;

ARCHITECTURE testbench OF shifter_2left_tb IS

  COMPONENT shifter_2left 
  PORT (
          Shifter_input    : IN  std_logic_vector(31 DOWNTO 0);
          Shifter_output   : OUT std_logic_vector(31 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL Shifter_input_tb, Shifter_output_tb : std_logic_vector(31 DOWNTO 0);

BEGIN
  Comp_Connection : shifter_2left PORT MAP (Shifter_input => Shifter_input_tb,
                                            Shifter_output => Shifter_output_tb);  
PROCESS
  BEGIN 
    Shifter_input_tb <= (others => '0');
    wait for 10 ns;

    Shifter_input_tb <= (others => '1');
    wait for 10 ns;

    Shifter_input_tb <= "11001100110011001100110011001100";
    wait for 10 ns;
  END PROCESS; 
END testbench;
