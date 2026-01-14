-- Testbench Register File

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY register_file_tb IS
END register_file_tb;

ARCHITECTURE testbench OF register_file_tb IS

  COMPONENT register_file 
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
  END COMPONENT;
  
  SIGNAL readReg1_tb, readReg2_tb, writeRegIn_tb : std_logic_vector(4 DOWNTO 0);
  SIGNAL writeData_tb, readData1_tb, readData2_tb : std_logic_vector(31 DOWNTO 0);
  SIGNAL RegWrite_tb, RF_clock_tb, RF_reset_tb : std_logic;

BEGIN
  Comp_Connection : register_file PORT MAP (RF_clock => RF_clock_tb,
                                            RF_reset => RF_reset_tb,
                                              readReg1 => readReg1_tb,
                                              readReg2 => readReg2_tb,
                                              writeRegIn => writeRegIn_tb,
                                              writeData => writeData_tb,
                                              RegWrite => RegWrite_tb,
                                              readData1 => readData1_tb,
                                              readData2 => readData2_tb);

clock_process : PROCESS
                  BEGIN
                    RF_clock_tb <= '0';
                    wait for 5 ns;
                    RF_clock_tb <= '1';
                    wait for 5 ns; 
                END PROCESS; 

stim_process : PROCESS
                  BEGIN
                  -- Perform write operation
                    RF_reset_tb <= '0';
                    writeRegIn_tb <= "00001";
                    writeData_tb <= "11110000111100001111000011110000";
                    RegWrite_tb <= '1';
                    WAIT FOR 10 ns;

                  -- Perform read operation
                  readReg1_tb <= "00001";
                  readReg2_tb <= "00010";
                  RegWrite_tb <= '0';
                  WAIT FOR 10 ns;

                  -- Reset the register file
                  RF_reset_tb <= '1';
                  WAIT FOR 10 ns;
                  RF_reset_tb <= '0';
                  WAIT;

                  -- End the simulation
                  WAIT;
               END PROCESS;             
END testbench;
