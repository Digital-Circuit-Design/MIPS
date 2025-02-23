LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fullAdder_32bit_tb IS
END fullAdder_32bit_tb;

ARCHITECTURE testbench OF fullAdder_32bit_tb IS

  COMPONENT fullAdder_32bit 
  PORT (
          Adder_input1, Adder_input2  : IN std_logic_vector(31 DOWNTO 0); 
          Adder_output                : OUT std_logic_vector(31 DOWNTO 0)
          );
  END COMPONENT;
 
  SIGNAL Adder_input1_tb, Adder_input2_tb, Adder_output_tb : std_logic_vector(31 DOWNTO 0);

BEGIN
  Comp_Connection : fullAdder_32bit PORT MAP (Adder_input1 => Adder_input1_tb,
                                              Adder_input2 => Adder_input2_tb,
                                              Adder_output => Adder_output_tb);

PROCESS
  BEGIN 
    Adder_input1_tb <= "01010101010101010101010101010101";
    Adder_input2_tb <= "00110011001100110011001100110011";
    wait for 10 ns;
    
    Adder_input1_tb <= "11000011001100110011001100110011";
    Adder_input2_tb <= "01111111111111111111111111111111";
    wait for 10 ns;
  END PROCESS;
END testbench;


