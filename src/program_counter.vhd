-- Program Counter

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY program_counter IS 
  PORT (
          PC_input  : IN std_logic_vector(31 DOWNTO 0);
          PC_clock  : IN std_logic;
          PC_reset  : IN std_logic;
          PC_output : OUT std_logic_vector(31 DOWNTO 0));
END program_counter;

ARCHITECTURE behavioral OF program_counter IS
BEGIN
  PROCESS(PC_reset, PC_clock)
    BEGIN
      IF PC_reset = '1' THEN
        PC_output <= "00000000000000000000000000000000";
      END IF;
      IF rising_edge(PC_clock) THEN
        PC_output <= PC_input;
      END IF;
  END PROCESS;
END behavioral;
