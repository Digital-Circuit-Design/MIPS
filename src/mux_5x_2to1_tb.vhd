-- Testbench 5x Multiplexer 2-to-1

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_5x_2to1_tb IS
END mux_5x_2to1_tb;

ARCHITECTURE testbench OF mux_5x_2to1_tb IS

  COMPONENT mux_5x_2to1 
  PORT (
          Mux5_input1, Mux5_input2  : IN std_logic_vector(4 DOWNTO 0);
          Mux5_S                    : IN std_logic;
          Mux5_output               : OUT std_logic_vector(4 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL Mux5_input1_tb, Mux5_input2_tb, Mux5_output_tb : std_logic_vector(4 DOWNTO 0);
  SIGNAL Mux5_S_tb : std_logic;

BEGIN
  Comp_Connection : mux_5x_2to1 PORT MAP (Mux5_input1 => Mux5_input1_tb,
                                          Mux5_input2 => Mux5_input2_tb,
                                          Mux5_S => Mux5_S_tb,
                                          Mux5_output => Mux5_output_tb);

PROCESS
  BEGIN 
    Mux5_S_tb <= '0';
    wait for 10 ns;
    Mux5_S_tb <= '1';
    wait for 10 ns;
 END PROCESS;
  
PROCESS
  BEGIN 
    Mux5_input1_tb <= "00000";
    Mux5_input2_tb <= "11111";
    wait for 10 ns;
  END PROCESS; 
END testbench;

