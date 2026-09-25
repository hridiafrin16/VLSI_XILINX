LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NAND_gate_tb IS
END NAND_gate_tb;

ARCHITECTURE behavior OF NAND_gate_tb IS

    COMPONENT NAND_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

    -- Inputs
    signal A : std_logic := '0';
    signal B : std_logic := '0';

    -- Output
    signal Y : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: NAND_gate PORT MAP (
        A => A,
        B => B,
        Y => Y
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- Test 00
        A <= '0';
        B <= '0';
        wait for 100 ns;

        -- Test 01
        A <= '0';
        B <= '1';
        wait for 100 ns;

        -- Test 10
        A <= '1';
        B <= '0';
        wait for 100 ns;

        -- Test 11
        A <= '1';
        B <= '1';
        wait for 100 ns;

        wait;
    end process;

END;