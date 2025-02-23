LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_32x_2to1 IS
  PORT (
          Mux32_input1, Mux32_input2  : IN std_logic_vector(31 DOWNTO 0);
          Mux32_S                     : IN std_logic;
          Mux32_output                : OUT std_logic_vector(31 DOWNTO 0));
END mux_32x_2to1;

ARCHITECTURE dataflow OF mux_32x_2to1 IS
BEGIN
      Mux32_output <= Mux32_input1 WHEN Mux32_S = '1' ELSE 
                      Mux32_input2 WHEN Mux32_S = '0';
END dataflow; 