library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_LATCH1_tb is
end SR_LATCH1_tb;

architecture Behavioral of SR_LATCH1_tb is

    component SR_LATCH1
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

    uut: SR_LATCH1
        port map (
            S  => S,
            R  => R,
            Q  => Q,
            Qn => Qn
        );

    stimulus: process
    begin

        S <= '1';
        R <= '1';
        wait for 10 ns;

        S <= '0';
        R <= '1';
        wait for 10 ns;

        S <= '1';
        R <= '1';
        wait for 10 ns;

        S <= '1';
        R <= '0';
        wait for 10 ns;

        S <= '1';
        R <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;