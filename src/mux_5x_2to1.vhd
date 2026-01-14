-- 5x Multiplexer 2-to-1

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_5x_2to1 IS
  PORT (
          Mux5_input1, Mux5_input2  : IN std_logic_vector(4 DOWNTO 0);
          Mux5_S                    : IN std_logic;
          Mux5_output               : OUT std_logic_vector(4 DOWNTO 0));
END mux_5x_2to1;

ARCHITECTURE dataflow OF mux_5x_2to1 IS
BEGIN
    Mux5_output <= Mux5_input1 WHEN Mux5_S = '1' ELSE 
                   Mux5_input2 WHEN Mux5_S = '0';
END dataflow; 
