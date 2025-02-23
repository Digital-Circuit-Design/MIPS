LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY and_2gate_tb IS
END and_2gate_tb;

ARCHITECTURE testbench OF and_2gate_tb IS

  COMPONENT and_2gate 
    PORT (
      Branch, Zero  : IN std_logic;
      AND_output		: OUT std_logic);
  END COMPONENT;

  SIGNAL Branch_tb, Zero_tb, AND_output_tb : std_logic;

BEGIN
  Comp_Connection : and_2gate PORT MAP (Branch => Branch_tb,
                                        Zero => Zero_tb,
                                        AND_output => AND_output_tb);
  
PROCESS
  BEGIN 
    Branch_tb <= '0'; Zero_tb <= '0'; 
    wait for 10 ns;
    Branch_tb <= '1'; Zero_tb <= '0'; 
    wait for 10 ns;
    Branch_tb <= '0'; Zero_tb <= '1'; 
    wait for 10 ns;
    Branch_tb <= '1'; Zero_tb <= '1'; 
    wait for 10 ns;
  END PROCESS; 
END testbench;


