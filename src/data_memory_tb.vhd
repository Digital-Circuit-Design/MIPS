-- Testbench Data Memory

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY data_memory_tb IS
END data_memory_tb;

ARCHITECTURE testbench OF data_memory_tb IS

  COMPONENT data_memory 
    PORT (
          writeData    : IN std_logic_vector(31 DOWNTO 0);
          addr         : IN std_logic_vector(31 DOWNTO 0);
          MemRead      : IN std_logic;
          MemWrite     : IN std_logic;
          readData     : OUT std_logic_vector(31 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL MemRead_tb, MemWrite_tb : std_logic;
  SIGNAL writeData_tb, addr_tb, readData_tb : std_logic_vector(31 DOWNTO 0);

BEGIN
  Comp_Connection : data_memory PORT MAP (writeData => writeData_tb,
                                              addr => addr_tb,
                                              MemRead => MemRead_tb,
                                              MemWrite => MemWrite_tb,
                                              readData => readData_tb);
PROCESS
  BEGIN
    
    writeData_tb <= (others => '0');
    addr_tb <= (others => '0');
    MemRead_tb <= '0';
    MemWrite_tb <= '0';
    wait for 10 ns;
    
    writeData_tb <= "11110000111100001111000011110000";
    addr_tb <= "00000000000000000000000000000001";
    MemWrite_tb <= '1';
    wait for 10 ns;
    
    addr_tb <= "00000000000000000000000000000001";
    MemRead_tb <= '1';
    wait for 10 ns;
    
    writeData_tb <= "00001111000011110000111100001111";
    addr_tb <= "00000000000000000000000000000010";
    MemWrite_tb <= '1';
    wait for 10 ns;
    
    addr_tb <= "00000000000000000000000000000010";
    MemRead_tb <= '1';
	wait for 10 ns;
  END PROCESS;                
END testbench;
