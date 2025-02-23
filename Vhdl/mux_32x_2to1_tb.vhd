LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_32x_2to1_tb IS
END mux_32x_2to1_tb;

ARCHITECTURE testbench OF mux_32x_2to1_tb IS

  COMPONENT mux_32x_2to1 
  PORT (
          Mux32_input1, Mux32_input2  : IN std_logic_vector(31 DOWNTO 0);
          Mux32_S                     : IN std_logic;
          Mux32_output                : OUT std_logic_vector(31 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL Mux32_input1_tb, Mux32_input2_tb, Mux32_output_tb : std_logic_vector(31 DOWNTO 0);
  SIGNAL Mux32_S_tb : std_logic;

BEGIN
  Comp_Connection : mux_32x_2to1 PORT MAP (Mux32_input1 => Mux32_input1_tb,
                                           Mux32_input2 => Mux32_input2_tb,
                                           Mux32_S => Mux32_S_tb,
                                           Mux32_output => Mux32_output_tb);

PROCESS
  BEGIN 
    Mux32_S_tb <= '0';
    wait for 10 ns;
    Mux32_S_tb <= '1';
    wait for 10 ns;
 END PROCESS;
  
PROCESS
  BEGIN 
    Mux32_input1_tb <= "00000000000000000000000000000000";
    Mux32_input2_tb <= "11111111111111111111111111111111";
    wait for 10 ns;
  END PROCESS; 
END testbench;

