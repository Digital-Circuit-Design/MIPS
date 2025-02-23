LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY program_counter_tb IS
END program_counter_tb;

ARCHITECTURE testbench OF program_counter_tb IS
  
  COMPONENT program_counter 
  PORT (
          PC_input  : IN std_logic_vector(31 DOWNTO 0);
          PC_clock  : IN std_logic;
          PC_reset  : IN std_logic;
          PC_output : OUT std_logic_vector(31 DOWNTO 0));
  END COMPONENT;

  SIGNAL PC_clock_tb, PC_reset_tb : std_logic;
  SIGNAL PC_input_tb, PC_output_tb : std_logic_vector(31 DOWNTO 0);

BEGIN
Comp_Connection : program_counter PORT MAP (PC_input => PC_input_tb,
                                            PC_clock => PC_clock_tb,
                                            PC_reset => PC_reset_tb,
                                            PC_output => PC_output_tb);
clock_process : PROCESS
                  BEGIN
                    PC_clock_tb <= '0';
                    wait for 5 ns;
                    PC_clock_tb <= '1';
                    wait for 5 ns; 
                END PROCESS; 
  
stim_process : PROCESS
    	            BEGIN 
                    PC_reset_tb <= '1';
                    PC_input_tb <= "00000000000000000000000000000000";
                    wait for 10 ns;

                    PC_reset_tb <= '0';
                    wait for 10 ns;

                    PC_input_tb <= "00000000000000000000000000000001";
                    wait for 10 ns;

                    PC_input_tb <= "00000000000000000000000000000010";
                    wait for 10 ns;

                    PC_input_tb <= "00000000000000000000000000000011";
                    wait for 10 ns;
                 END PROCESS;                
END testbench;