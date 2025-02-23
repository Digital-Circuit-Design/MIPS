LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_signed.all;

ENTITY alu IS
  PORT (
          operationSig   : IN std_logic_vector(3 DOWNTO 0);
          ALU_input1     : IN std_logic_vector(31 DOWNTO 0);
          ALU_input2     : IN std_logic_vector(31 DOWNTO 0);
          ALU_output     : OUT std_logic_vector(31 DOWNTO 0);
          zeroSig        : OUT std_logic);
END alu;

ARCHITECTURE behavioral OF alu IS
BEGIN
  PROCESS(operationSig)
    VARIABLE tempInt : integer := 0;
    BEGIN
      CASE operationSig IS
        WHEN "0001" => -- addi
          zeroSig <= '0';
          tempInt := to_integer(signed(ALU_input1) + signed(ALU_input2));
          ALU_output <= std_logic_vector(to_signed(tempInt, 32));
        WHEN "0100" => -- add
          zeroSig <= '0';
          tempInt := to_integer(signed(ALU_input1) + signed(ALU_input2));
          ALU_output <= std_logic_vector(to_signed(tempInt, 32));
        WHEN "0101" => -- sub
          tempInt := to_integer(signed(ALU_input1) - signed(ALU_input2));
          IF tempInt = 0 THEN
            zeroSig <= '1';
          ELSE
            zeroSig <= '0';
          END IF;
          ALU_output <= std_logic_vector(to_signed(tempInt, 32));
        WHEN "1000" => -- bne
          tempInt := to_integer(signed(ALU_input1) - signed(ALU_input2));
          IF tempInt = 0 THEN
            zeroSig <= '1';
          ELSE
            zeroSig <= '0';
          END IF;
          ALU_output <= ALU_input1 XOR ALU_input2;
        WHEN others =>
          zeroSig <= '0';
          ALU_output <= (others => '0');
      END CASE;
  END PROCESS;
END behavioral;
