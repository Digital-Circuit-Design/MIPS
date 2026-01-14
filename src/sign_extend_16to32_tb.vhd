-- Testbench Sign Extender 16-to-32

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sign_extend_16to32_tb IS
END sign_extend_16to32_tb;

ARCHITECTURE testbench OF sign_extend_16to32_tb IS

  COMPONENT sign_extend_16to32 
  PORT (
          SignExtend_input  : IN  std_logic_vector(15 DOWNTO 0);
          SignExtend_output  : OUT std_logic_vector(31 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL SignExtend_input_tb  : std_logic_vector(15 DOWNTO 0);
  SIGNAL SignExtend_output_tb : std_logic_vector(31 DOWNTO 0);

BEGIN
  Comp_Connection : sign_extend_16to32 PORT MAP (SignExtend_input => SignExtend_input_tb,
                                                 SignExtend_output => SignExtend_output_tb);
  
PROCESS
  BEGIN 
    SignExtend_input_tb <= "0101010101010101";
    wait for 10 ns;

    SignExtend_input_tb <= "1010101010101010";
    wait for 10 ns;
  END PROCESS; 
END testbench;