-- Shifter 2-bits left

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY shifter_2left IS 
  PORT (
          Shifter_input    : IN  std_logic_vector(31 DOWNTO 0);
          Shifter_output   : OUT std_logic_vector(31 DOWNTO 0));
END shifter_2left;

ARCHITECTURE behavioral OF shifter_2left IS
SIGNAL tmp : unsigned(31 DOWNTO 0);
BEGIN
  tmp <= to_unsigned(to_integer(signed(Shifter_input)), tmp'length) SLL 2;
  Shifter_output <= std_logic_vector(to_signed(to_integer(tmp), Shifter_output'length));
END behavioral;