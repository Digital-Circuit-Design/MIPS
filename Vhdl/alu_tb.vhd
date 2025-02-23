LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY alu_tb IS
END alu_tb;

ARCHITECTURE testbench OF alu_tb IS

  COMPONENT alu
   PORT (
            operationSig   : IN std_logic_vector(3 DOWNTO 0);
            ALU_input1     : IN std_logic_vector(31 DOWNTO 0);
            ALU_input2     : IN std_logic_vector(31 DOWNTO 0);
            ALU_output     : OUT std_logic_vector(31 DOWNTO 0);
            zeroSig        : OUT std_logic);
  END COMPONENT;
  
  SIGNAL operationSig_tb : std_logic_vector(3 DOWNTO 0);
  SIGNAL ALU_input1_tb, ALU_input2_tb, ALU_output_tb : std_logic_vector(31 DOWNTO 0);
  SIGNAL zeroSig_tb : std_logic;

BEGIN
  Comp_Connection : alu PORT MAP (operationSig => operationSig_tb,
                                  ALU_input1  => ALU_input1_tb,
                                  ALU_input2  => ALU_input2_tb,
                                  zeroSig => zeroSig_tb,
                                  ALU_output => ALU_output_tb);
  
PROCESS
BEGIN
     -- addi
    operationSig_tb <= "0001";
    ALU_input1_tb    <= "00000000000000000000000000001111";
    ALU_input2_tb    <= "00000000000000000000000000000001";
    wait for 10 ns;

    -- add
    operationSig_tb <= "0100";
    ALU_input1_tb    <= "00000000000000000000000000001111";
    ALU_input2_tb    <= "00000000000000000000000000000001";
    wait for 10 ns;

    -- sub (zero) 
    operationSig_tb <= "0101";
    ALU_input1_tb    <= "00000000000000000000000000001111";
    ALU_input2_tb    <= "00000000000000000000000000001111";
    wait for 10 ns;

    -- sub (non zero)
    operationSig_tb <= "0101";
    ALU_input1_tb    <= "00000000000000000000000000001111";
    ALU_input2_tb    <= "00000000000000000000000000000001";
    wait for 10 ns;

    -- bne (equal)
    operationSig_tb <= "1000";
    ALU_input1_tb    <= "00000000000000000000000000001111";
    ALU_input2_tb    <= "00000000000000000000000000001111";
    wait for 10 ns;

    -- bne (not equal)
    operationSig_tb <= "1000";
    ALU_input1_tb    <= "00000000000000000000000000001111";
    ALU_input2_tb    <= "00000000000000000000000000000001";
    wait for 10 ns;
    
END PROCESS;                
END testbench;


