-- Data Memory

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY data_memory IS
  PORT (
          writeData    : IN std_logic_vector(31 DOWNTO 0);
          addr         : IN std_logic_vector(31 DOWNTO 0);
          MemRead      : IN std_logic;
          MemWrite     : IN std_logic;
          readData     : OUT std_logic_vector(31 DOWNTO 0));
END data_memory;

ARCHITECTURE behavioral OF data_memory IS
  TYPE regArray IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
  SIGNAL data_memory : regArray := (others => (others => '0'));
  SIGNAL address : integer;
  
BEGIN 
  
    address <= to_integer(unsigned(writeData)) WHEN
                  (to_integer(unsigned(writeData)) >= 0) ELSE 0;
    data_memory(address) <= writeData WHEN MemWrite = '1';
    readData <= data_memory(address) WHEN MemRead = '1';

END behavioral;
 
  
  
