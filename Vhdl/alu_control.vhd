LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY alu_control IS
  PORT (
          ALUOp     : IN std_logic_vector(1 DOWNTO 0);
          Instr     : IN std_logic_vector(5 DOWNTO 0);
          ALUCtrl   : OUT std_logic_vector(3 DOWNTO 0));
END alu_control;

ARCHITECTURE behavioral OF alu_control IS
BEGIN
PROCESS (ALUOp, Instr)
  BEGIN
    IF ALUOp = "10" THEN -- addi
      ALUCtrl <= "0001";
    ELSIF ALUOp = "01" THEN
      ALUCtrl <= "1000"; -- bne
    ELSIF ALUOp = "00" THEN
      CASE Instr IS
        WHEN "100000" => -- add
          ALUCtrl <= "0100";
        WHEN "100010" => -- sub
          ALUCtrl <= "0101";
        WHEN others => -- default
          ALUCtrl <= "1110"; 
      END CASE;
    ELSE               -- default
      ALUCtrl <= "1111";
    END IF;
END PROCESS;
END behavioral;