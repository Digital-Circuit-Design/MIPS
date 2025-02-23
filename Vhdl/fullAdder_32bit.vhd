LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY fullAdder_32bit IS
  PORT (
          Adder_input1, Adder_input2  : IN std_logic_vector(31 DOWNTO 0); 
          Adder_output                : OUT std_logic_vector(31 DOWNTO 0)
          );
END fullAdder_32bit;

ARCHITECTURE dataflow OF fullAdder_32bit IS
BEGIN
    Adder_output <= Adder_input1 + Adder_input2;
END dataflow; 