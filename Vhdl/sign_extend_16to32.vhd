LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sign_extend_16to32 IS 
  PORT (
          SignExtend_input  : IN  std_logic_vector(15 DOWNTO 0);
          SignExtend_output  : OUT std_logic_vector(31 DOWNTO 0));
END sign_extend_16to32;

ARCHITECTURE dataflow OF sign_extend_16to32 IS
SIGNAL ones : std_logic_vector(15 DOWNTO 0) := (OTHERS => '1');
SIGNAL zeros : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0'); 
BEGIN
      SignExtend_output <= ones & SignExtend_input WHEN SignExtend_input(15) = '1' ELSE
            zeros & SignExtend_input WHEN SignExtend_input(15) = '0';
END dataflow;