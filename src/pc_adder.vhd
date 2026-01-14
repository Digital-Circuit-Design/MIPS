-- Program Counter Adder

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY pc_adder IS 
  PORT (
          previousCmdAddr : IN std_logic_vector(31 DOWNTO 0);
          nextCmdAddr     : OUT std_logic_vector(31 DOWNTO 0));
END pc_adder;

ARCHITECTURE dataflow OF pc_adder IS
  SIGNAL sum : unsigned(31 DOWNTO 0);
  BEGIN
    sum <= unsigned(previousCmdAddr) + 1;
    nextCmdAddr <= std_logic_vector(sum);
END dataflow;
 