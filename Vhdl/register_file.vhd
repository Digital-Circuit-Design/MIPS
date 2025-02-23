LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY register_file IS
  PORT (
          RF_clock      : IN std_logic;
          RF_reset      : IN std_logic;
          readReg1      : IN std_logic_vector(4 DOWNTO 0);
          readReg2      : IN std_logic_vector(4 DOWNTO 0);
          writeRegIn    : IN std_logic_vector(4 DOWNTO 0);
          writeData     : IN std_logic_vector(31 DOWNTO 0);
          RegWrite      : IN std_logic;
          readData1     : OUT std_logic_vector(31 DOWNTO 0);
          readData2     : OUT std_logic_vector(31 DOWNTO 0));
END register_file;

ARCHITECTURE behavioral OF register_file IS
TYPE regArray IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
SIGNAL register_file  : regArray;

BEGIN
  PROCESS(RF_clock, RegWrite, RF_reset)
    BEGIN
    IF rising_edge(RF_clock) THEN
      IF RegWrite = '1' THEN
        register_file(to_integer(unsigned(writeRegIn))) <= writeData;
      END IF; 
    END IF;
      readData1 <= register_file(to_integer(unsigned(readReg1)));
      readData2 <= register_file(to_integer(unsigned(readReg2)));
    IF RF_reset = '1' THEN
      readData1 <= (others => '0');
      readData2 <= (others => '0');  
    END IF;
  END PROCESS;
END behavioral;       