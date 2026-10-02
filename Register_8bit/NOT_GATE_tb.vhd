library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_GATE_tb is
end NOT_GATE_tb;

architecture Behavioral of NOT_GATE_tb is

    component NOT_GATE
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal A : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

begin

    uut: NOT_GATE
        port map (
            A => A,
            Y => Y
        );

    stimulus: process
    begin

        A <= '0';
        wait for 10 ns;

        A <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;