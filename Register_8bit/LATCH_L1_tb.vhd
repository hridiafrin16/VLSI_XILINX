library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LATCH_L1_tb is
end LATCH_L1_tb;

architecture Behavioral of LATCH_L1_tb is

    component LATCH_L1
        Port (
            S  : in  STD_LOGIC;
            R  : in  STD_LOGIC;
            Q  : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    signal S  : STD_LOGIC := '1';
    signal R  : STD_LOGIC := '1';
    signal Q  : STD_LOGIC;
    signal Qn : STD_LOGIC;

begin

    uut: LATCH_L1
        port map (
            S  => S,
            R  => R,
            Q  => Q,
            Qn => Qn
        );

    stimulus: process
    begin

        -- Hold
        S <= '1';
        R <= '1';
        wait for 10 ns;

        -- Set
        S <= '0';
        R <= '1';
        wait for 10 ns;

        -- Hold
        S <= '1';
        R <= '1';
        wait for 10 ns;

        -- Reset
        S <= '1';
        R <= '0';
        wait for 10 ns;

        -- Hold
        S <= '1';
        R <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;