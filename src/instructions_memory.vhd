-- Instructions Memory

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY instructions_memory IS
  PORT (
          readAddr    : IN std_logic_vector(31 DOWNTO 0);
          instrOut     : OUT std_logic_vector(31 DOWNTO 0));
END instructions_memory;

ARCHITECTURE behavioral OF instructions_memory IS
  TYPE regArray IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
  SIGNAL instructions_memory : regArray := (
    "00100000000000110000000000000001", -- addi $3, $0, 1 
    "00100000000001010000000000000011", -- addi $3, $0, 1
    "00000000011000000011001000000000", -- L1: add $6, $3, $0
    "10101100100001100000000000000000", -- sw $6, 0($4)
    "00100000011000110000000000000001", -- addi $3, $3, 1
    "00100000100001000000000000000001", -- addi $4, $4, 1
    "00100000101001011111111111111111", -- addi $5, $5, -1
    "00010100101000001111111111101010", -- bne $5,$0,L1
    others => (others => '0')
  );
                                                     
SIGNAL instrAddr : integer;
SIGNAL instruction : std_logic_vector(31 DOWNTO 0);
BEGIN
  instrAddr <= to_integer(unsigned(readAddr)) WHEN (to_integer(unsigned(readAddr)) >= 0) ELSE 0;
  instruction <= instructions_memory(instrAddr) WHEN (instrAddr >= 0) ELSE std_logic_vector(to_signed(-1, 32));            
  instrOut <= instruction;
END behavioral;
 
  
  