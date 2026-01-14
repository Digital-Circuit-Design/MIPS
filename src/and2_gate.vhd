-- AND Gate 2 bits

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY and_2gate IS
  PORT (
          Branch, Zero  : IN std_logic;
          AND_output	: OUT std_logic);
END and_2gate;

ARCHITECTURE dataflow OF and_2gate IS
BEGIN
      AND_output <= Branch AND Zero;
END dataflow; 